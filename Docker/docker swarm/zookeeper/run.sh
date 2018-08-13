docker login -u sjfx -p sjfx2018

docker build -t sjfx/zookeeper:3.4.12 ./build

docker stack deploy --compose-file docker-compose.yml zookeeper

docker push sjfx/zookeeper:3.4.12