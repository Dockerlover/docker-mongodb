# docker-mongodb
Docker化Mongodb

## 镜像特点

- 2015/6/20 继承基础镜像docker-ubuntu
- 2015/6/23 默认暴露27017端口

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-mongodb.git
        cd docker-mongodb
        docker build -t docker-mongodb .

- 运行容器[run.sh]

        docker run -it -d --name mongodb -v /var/data/mongodb:/data/db -p 27017:27017  docker-mongodb

- 进入容器

        docker exec -it mongodb /bin/bash
