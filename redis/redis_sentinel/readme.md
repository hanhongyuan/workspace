1. 修改redis master ip 和 port 

2. master上 执行
```bash
    docker-compose -f docker-compose-master.yml up -d
```
2. slave上 执行
```bash
    docker-compose -f docker-compose-slave.yml up -d
```

ok