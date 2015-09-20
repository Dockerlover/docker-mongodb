# 基础镜像
FROM ubuntu:14.04
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV MONGO_MAJOR 2.6
ENV MONGO_VERSION 2.6.10
# 安装mongodb
RUN groupadd -r mongodb && useradd -r -g mongodb mongodb
RUN apt-get update && apt-get install -y curl && apt-get install -y --no-install-recommends numactl && rm -rf /var/lib/apt/lists/*
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
COPY . /usr/local/bin/
RUN gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys DFFA3DCF326E302C4787673A01C4E7FAAAB2461C
RUN curl -SL "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz" -o mongo.tgz \
	&& curl -SL "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz.sig" -o mongo.tgz.sig \
	&& gpg --verify mongo.tgz.sig \
	&& tar -xvf mongo.tgz -C /usr/local --strip-components=1 \
	&& rm mongo.tgz*
RUN apt-get autoremove -y curl
# 映射/data/db数据卷
RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db
VOLUME ["/data/db"]
# 复制运行脚本
COPY start.sh /start.sh
RUN chmod +x /*.sh
# 暴露mongodb默认启动端口
EXPOSE 27017
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
