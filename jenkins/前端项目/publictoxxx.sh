projectname=wbmobile-dev
sjfxdocker=192.168.1.12:5000

vision=1.0.${BUILD_ID}

cat > ./design_ip.js << EOF
module.exports = {
  user_design: false,
  design_ip: '192.168.1.11:8000'
};
EOF

npm install
npm run build
docker build -t sjfx/$projectname:$vision .
docker tag sjfx/$projectname:$vision $sjfxdocker/sjfx/$projectname:$vision
docker push $sjfxdocker/sjfx/$projectname:$vision

for i in `docker ps -a|grep $projectname|awk '{print $1}'`;do echo \ && docker rm -f $i; done
for i in `docker images|grep $projectname|awk '{print $1 88888 $2 }'|sed "s/88888/:/g"`;do echo \ && docker rmi $i; done

docker run -d -p 8012:8080 --restart unless-stopped --name sjfx$projectname  --health-cmd "curl --fail http://localhost:8011/ || exit 1" --health-interval=30s $sjfxdocker/sjfx/$projectname:$vision