OSSfs:
能让您在Linux/Mac OS X 系统中把Aliyun OSS bucket 挂载到本地文件系统中，您能够便捷的通过
本地文件系统操作OSS 上的对象，实现数据的共享。

现在我们需要每天把用户上传文件及数据库文件进行备份，我们把oss使用ossfs挂载到本地目录进行上传

1. 安装OSSFS
    1.1 下载安装包
    wget https://github.com/aliyun/ossfs/releases/download/v1.80.3/ossfs_1.80.3_centos7.0_x86_64.rpm
    sudo yum localinstall ossfs_1.80.3_centos7.0_x86_64.rpm
    rm -rf ossfs_1.80.3_centos7.0_x86_64.rpm
    成功
    1.2 sudo yum install automake gcc-c++ git libcurl-devel libxml2-devel \
    fuse-devel make openssl-devel
    不成功
    1.3 源码
    git clone https://github.com/aliyun/ossfs.git
    cd ossfs
    ./autogen.sh
    ./configure
    make
    sudo make install
    不成功
    1.2 + 1.3
    可以 1.2下载了完全依赖再使用1.3编译成功

安装成功后查看版本号
export PATH=$PATH:/usr/locak/bin/
ossfs --version

2. 将密码写入passwd-ossfs文件

echo my-bucket:my-access-key-id:my-access-key-secret > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs

echo sjfx-backup:敏感数据  > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
640 代表所有者有读写权限但无执行权限所有者所在的组的组成员只有写权限其他人没有权限

3. 挂载到本地目录

mkdir -p /ossfsbackup/

ossfs bucket名称 挂载目录 -ourl=入口点
入口点在控制台概览界面查看，见 1.png
公网
ossfs sjfx-backup /ossfsbackup/ -ourl=http://oss-cn-beijing.aliyuncs.com
内网
ossfs sjfx-backup2008 /ossfsbackup/ -ourl=http://oss-cn-beijing-internal.aliyuncs.com

取消挂载
umount /ossfsbackup/ # root user
fusermount -u /ossfsbackup/ # non-root user 
4. 编辑脚本
export PATH=$PATH:/usr/locak/bin/ #导出执行
datename=$(date -d 1-days-ago +%Y%m%d) #昨天日期 创建目录
todayname=$(date +%Y%m%d) #今天日期 db目录
backuppath=/tmp/backup/$datename #备份路径
dbbackuppath=/mnt/dbbackup/ #数据库文件备份路径
rm -rf $backuppath 
mkdir $backuppath #新建临时存储目录
cp $dbbackuppath$todayname.sql.gz -rf $backuppath/$datename.sql.gz #拷贝数据库备份到临时目录
zip -q -r $backuppath/$datename.zip /mnt/www/upfiles/$datename  #压缩备份文件到临时目录
ossfspath=/ossfsbackup/
ossbucket=sjfx-backup
ossurl=http://oss-cn-beijing-internal.aliyuncs.com #定义oss变量
umount $ossfspath 
rm -rf $ossfspath
mkdir -p $ossfspath
ossfs $ossbucket $ossfspath -ourl=$ossurl #挂载oss目录到本地
cp -rf $backuppath/$datename.sql.gz $ossfspath/dbbackup #上传数据库备份
cp -rf $backuppath/$datename.zip $ossfspath/filebackup #上传文件备份
rm -rf $backuppath #删除临时目录

datedelete=$(date -d 5-days-ago +%Y%m%d)
rm -rf $ossfspath/dbbackup/$datedelete.sql.gz #删除5天前备份数据

umount $ossfspath #取消oss挂载

    4.1 增加需要删除5天前的数据库备份
    在脚本`umount $ossfspath #取消oss挂载`前增加
    
    datedelete=$(date -d 5-days-ago +%Y%m%d)
    rm -rf $ossfspath/dbbackup/$datedelete.sql.gz

5. 执行脚本
sh /mnt/backuptosso.sh > /tmp/backuptosso.log 2>&1

6. 将脚本添加到crontab 执行
    修改/etc/crontab 文件在最后加上：
    0 4 * * * root  /usr/bin/sh /mnt/backuptosso.sh >> /tmp/backuptosso.log 2>&1
    注意此处指定用户为root

7. 分卷压缩及解压
要将目录upfiles打包压缩并分割成多个512M的文件：
tar cjf - /mnt/www/upfiles |split -b 512m - backstart.tar.bz2.
解压
cat backstart.tar.bz2.* | tar xj