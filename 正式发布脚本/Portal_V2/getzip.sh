# ��������Ŀ¼
mkdir -p /mnt/publish_Portal/$1/
cd /mnt/publish_Portal/$1/
# ����FTP�����ļ�
HOST=47.94.47.162
USER=sjfxdev
PASSWD=VwAVVc%DcEA%^zCg

export SSHPASS=$PASSWD
sshpass -e sftp -oBatchMode=no -b - $USER@$HOST << !
   get /mnt/publish_Portal/$1/$2.zip
   bye
!

# ��ѹ
unzip /mnt/publish_Portal/$1/$2.zip -d /
rm -rf /mnt/publish_Portal/$1/$2.zip