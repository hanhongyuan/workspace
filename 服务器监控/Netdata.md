
docker run -d --cap-add SYS_PTRACE \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -p 17123:19999 titpetric/netdata:1.10

firewall-cmd --zone=public --add-port=17123/tcp
firewall-cmd --zone=public --add-port=17123/tcp --permanent


docker run -d --cap-add SYS_PTRACE \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -m 1024M --memory-swap=2048M \
           -p 17123:19999 titpetric/netdata

-m 200M --memory-swap=300M