1. base hosts

cat /etc/hosts

cp /etc/hosts ./hosts

cat >> /etc/hosts << EOF

172.16.149.245  v3nginx
172.16.84.99    proxy-local
172.16.149.249  v3-base-mq001
172.16.84.204   v3-base-mq002
172.16.84.206   v3eureka001
172.16.149.248  v3eureka002
172.16.21.6     v3-publish
172.16.84.205   v3-gateway001
172.16.21.4     v3-gateway002
172.16.21.7     v3-gateway003
172.16.149.247  v3-gateway004
172.16.225.64   v3-BS-F001
172.16.225.65   v3-BS-F002
172.16.225.66   v3-BS-F003
172.16.225.67   v3-BS-F004
172.16.149.251  v3-BS-H001
172.16.149.252  v3-BS-H002
172.16.149.253  v3-BS-H003
172.16.149.254  v3-BS-H004
172.16.84.207   v3-BS-G001
172.16.84.208   v3-BS-G002
172.16.84.209   v3-BS-G003
172.16.84.210   v3-BS-G004
172.16.21.8     v3-BS-I001
172.16.21.9     v3-BS-I002
172.16.21.10    v3-BS-I003
172.16.21.11    v3-BS-I004
172.16.21.5     v3-tag


EOF

cat /etc/hosts


cat >> /etc/hosts << EOF

192.168.1.31 k8s1
192.168.1.32 k8s2
192.168.1.33 k8s3
192.168.1.34 k8s4

EOF
