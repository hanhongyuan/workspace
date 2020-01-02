prodname=$1
gunzip ${prodname}.sql.gz
sed '/GTID_PURGED/N;s/,\n/,/' ${prodname}.sql | grep -iv 'set @@global' > ${prodname}grep.sql
rm -f ${prodname}.sql
sed '/GTID_PURGED/N;s/,\n/,/' ${prodname}grep.sql | grep -iv 'set @@session' > ${prodname}.sql
sed '1 iSET FOREIGN_KEY_CHECKS=0;' -i ${prodname}.sql
echo 'SET FOREIGN_KEY_CHECKS=1;' >> ${prodname}.sql
rm -f ${prodname}grep.sql
mysql -h192.168.1.22 -P13001 -uroot -psjfx-123456 ${prodname} < ${prodname}.sql
rm -f ${prodname}.sql

