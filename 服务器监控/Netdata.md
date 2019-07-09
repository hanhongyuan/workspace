
docker run -d --cap-add SYS_PTRACE \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -p 17123:19999 titpetric/netdata:1.10

firewall-cmd --zone=public --add-port=17123/tcp
firewall-cmd --zone=public --add-port=17123/tcp --permanent

docker rm -f netdata
docker run -d --cap-add SYS_PTRACE \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -m 256M --memory-swap=512M \
           --name netdata \
           --restart unless-stopped \
            titpetric/netdata

-m 200M --memory-swap=300M
docker rm -f netdata
docker run -d --name=netdata \
    -p 17123:19999 \
    --restart unless-stopped \
    -v /proc:/host/proc:ro \
    -v /sys:/host/sys:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --cap-add SYS_PTRACE \
    --security-opt apparmor=unconfined \
    netdata/netdata


