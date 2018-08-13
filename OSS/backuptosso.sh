datename=$(date -d 1-days-ago +%Y%m%d)
todayname=$(date +%Y%m%d)
backuppath=/tmp/backup/$datename
dbbackuppath=/mnt/dbbackup/
rm -rf $backuppath
mkdir $backuppath
cp $dbbackuppath$todayname.sql.gz -rf $backuppath/$datename.sql.gz
zip -q -r $backuppath/$datename.zip /mnt/www/upfiles/$datename 
ossfspath=/ossfsbackup/
ossbucket=sjfx-backup2008
ossurl=http://oss-cn-beijing-internal.aliyuncs.com
sudo umount $ossfspath
rm -rf $ossfspath
mkdir -p $ossfspath
ossfs $ossbucket $ossfspath -ourl=$ossurl
cp -rf $backuppath/$datename.sql.gz $ossfspath/dbbackup
cp -rf $backuppath/$datename.zip $ossfspath/filebackup
rm -rf $backuppath

datedelete=$(date -d 5-days-ago +%Y%m%d)
rm -rf $ossfspath/dbbackup/$datedelete.sql.gz

umount $ossfspath

