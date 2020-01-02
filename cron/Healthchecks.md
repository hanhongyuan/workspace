# healthchecks
## url 
https://github.com/healthchecks/healthchecks

## docker 
https://hub.docker.com/r/linuxserver/healthchecks

mkdir -p /opt/healthchecks
chmod 777 -R /opt/healthchecks
docker rm -f healthchecks
docker run -d \
  --name=healthchecks \
  -e PUID=0 \
  -e PGID=0 \
  -p 8080:8000 \
  -v /opt/healthchecks:/config \
  --restart unless-stopped \
  linuxserver/healthchecks


docker exec -it healthchecks bash
/usr/bin/python3.6 manage.py createsuperuser

/usr/bin/python3.6 manage.py runserver