# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID mongodb
# 安装mongodb
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen'| tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update && apt-get install -y mongodb-org
# 映射/data/db数据卷
RUN mkdir -p /data/db
VOLUME ["/data/db"]
# 暴露mongodb默认启动端口
EXPOSE 27017
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
