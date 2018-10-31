

mkdir -p /mnt/dokuwiki && docker run -d -p 5080:80 -p 5443:443 --name dokuwiki \
 -e DOKUWIKI_PASSWORD=my_password \
 --volume /mnt/dokuwiki:/bitnami/dokuwiki \
 bitnami/dokuwiki:latest