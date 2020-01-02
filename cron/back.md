# crontabback

## v3-publish
`
31 23 * * * bash /opt/dbback/backupdb2019.sh
13 1 */2 * * mv /opt/dbback/2019* /opt/sjfx-v3back/dbback/ >> /opt/uploaddbbak.log
#code backup
11 0 * * * bash /opt/backupcodeall.sh
3 2 */2 * * mv /opt/codebackup/2019* /opt/sjfx-v3back/codebackup/ >> /opt/uploadcodebak.log
#clear db temp
45 1 * * * bash /opt/cleardb/clearjob.sh >> /opt/cleardb/clearjob.log
#run sql
# 46 1 * * * bash /opt/publish-script/2019/runsql.sh 2019-09-07_employee_slow_sql.sql >> /opt/runsql.log
# 55 1 * * * bash /opt/cleardb/clearjob.sh >> /opt/cleardb/clearjob.log
#clear journal
21 22 * * * journalctl --vacuum-size=500M
#restart elk
6 1 * * * docker restart elk_elasticsearch_1
36 1 * * * docker restart elk_kibana_1
0 10 * * * docker stop netdata
0 8 * * * docker start netdata
2 5 * * *  bash /opt/backupjenkins.sh
20 5 * * * bash /opt/backupnginx.sh
#50 8 * * 1 bash bash /opt/backupelkbyweekly.sh
30 8 * * 1 bash /opt/publish-script/docker-system-prune.sh >> /opt/dockerprune.log

`