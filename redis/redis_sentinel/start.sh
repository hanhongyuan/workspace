cd /app
redis_role=$1
echo $redis_role
if [ $redis_role = "master" ] ; then
    echo "master" 
    sed -i "s/\$redis_port/$redis_port/g" redis.conf
    redis-server /app/redis.conf
    exit 0
fi
if [ $redis_role = "slave" ] ; then   
    echo "slave" 
    sed -i "s/\$redis_port/$redis_port/g" redis.conf
    sed -i "s/#slaveof/slaveof/g" redis.conf
    sed -i "s/redis-master/$redis_master/g" redis.conf
    sed -i "s/\$master_port/$master_port/g" redis.conf
    redis-server /app/redis.conf
    exit 0
fi
if [ $redis_role = "sentinel" ] ; then 
    echo "sentinel" 
    sed -i "s/\$sentinel_port/$sentinel_port/g" sentinel.conf
    sed -i "s/redis-master/$redis_master/g" sentinel.conf
    sed -i "s/\$master_port/$master_port/g" sentinel.conf
    redis-sentinel /app/sentinel.conf
    exit 0
fi
    echo "unknow role!" 

docker rm -f redis_sentinel_redis_master_1
docker rm -f redis_sentinel_redis_slave_1
docker rm -f redis_sentinel_redis_sentinel_1

docker system prune