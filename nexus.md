mkdir -p /mnt/nexus/data
chmod 777 -R /mnt/nexus
firewall-cmd --zone=public --add-port=8081/tcp
firewall-cmd --zone=public --add-port=8081/tcp --permanent
docker rm -f nexus
docker run -d -p 8081:8081 --name nexus -v  /mnt/nexus/data:/nexus-data sonatype/nexus3:3.11.0
docker rm -f nexus


mkdir -p /mnt/nexus/data2
chmod 777 -R /mnt/nexus
firewall-cmd --zone=public --add-port=8082/tcp
firewall-cmd --zone=public --add-port=8082/tcp --permanent
docker run -d -p 8082:8081 --name nexus2 -v  /mnt/nexus/data2:/sonatype-work sonatype/nexus:2.14.8
