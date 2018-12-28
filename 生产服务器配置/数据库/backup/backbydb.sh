#/bin/sh
echo $1
echo "$1 in $2"
mysqldump --skip-add-locks -usjfx -p123456 --databases $1 | gzip > $2/$1.sql.gz



mysqldump --skip-add-locks -uapp -pApp-2176109 -P3369 -hrm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com --databases platform > platform.sql