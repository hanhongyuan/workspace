1. base hosts

cat /etc/hosts

cp /etc/hosts ./hosts

cat >> /etc/hosts << EOF

172.16.149.245  v3nginx
172.16.84.9     proxy-local
172.16.149.249  v3-base-mq001
172.16.84.204   v3-base-mq002
172.16.84.206   v3-base-eureka001
172.16.149.248  v3-base-eureka002
172.16.21.6     v3-publish
172.16.84.205   v3-gateway001
172.16.21.4     v3-gateway002
172.16.21.7     v3-gateway003
172.16.149.247  v3-gateway004

EOF

cat /etc/hosts
