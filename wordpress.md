

mkdir -p /mnt/dokuwiki && docker run -d -p 5080:80 -p 5443:443 --name dokuwiki \
 -e DOKUWIKI_PASSWORD=my_password \
 --volume /mnt/dokuwiki:/bitnami/dokuwiki \
 bitnami/dokuwiki:latest


 mkdir -p /opt/gitit
docker run -d --name gitit -p 7500:7500 -v /opt/gitit:/data/gitit shajiquan/gitit

docker rm -f mediawiki
docker run --name mediawiki -p 7500:80 -v /mnt/mediawiki/data:/var/www/data -v /mnt/mediawiki/LocalSettings.php:/var/www/html/LocalSettings.php -d mediawiki

docker rm -f wordpress
docker rmi wordpress:latest
docker run -d --name wordpress -p 7501:80 -p 7543:443 -v /mnt/wordpress/:/var/www/html/wp-content/ wordpress
