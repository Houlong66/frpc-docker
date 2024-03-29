## frpc-docker
frpc的docker版本

### 使用说明
1. 构造镜像
```
docker build -t your_image_name .  #别忘了最后的点
```

2. 修改frpc.ini和docker-compose.yml
- frpc.ini
```
[common]
server_addr = x.x.x.x # 改成你的服务器地址
server_port = 7000

[docker]
type = tcp
local_ip = 192.168.137.1
local_port = 22
remote_port = 6004
```

- docker-compose.yml
```
version: "3"
services:
  frpc:
    image: your_image_name # 改成你自己构造镜像的名字
    volumes:
      - "./frpc.ini:/etc/frpc.ini"
```

3. 使用docker stack启动服务
```
docker stack deploy stack_name -c docker-compose.yml
```
- 如果提示没有初始化节点，则先执行`docker swarm init`