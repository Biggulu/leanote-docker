From centos:latest
MAINTAINER Yujiang Bi "byujiang@gmail.com"

RUN yum -y update && yum install -y curl wget
RUN yum clean packages
RUN curl -L http://sourceforge.net/projects/leanote-bin/files/2.1/leanote-linux-amd64-v2.1.bin.tar.gz/download >> leanote-linux-amd64-v2.1.bin.tar.gz
RUN tar -xvzf leanote-linux-amd64-v2.1.bin.tar.gz -C /usr/local/ && rm -f  leanote-linux-amd64-v2.1.bin.tar.gz

RUN wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-3.4.0.tgz
RUN tar -xzvf mongodb-linux-x86_64-rhel70-3.4.0.tgz -C /usr/local && rm -f mongodb-linux-x86_64_rhel70-3.4.0.tgz

RUN mv /usr/local/mongodb-linux-x86_64-rhel70-3.4.0 /usr/local/mongo
ADD start.sh /usr/local/leanote/bin/

RUN mkdir -p /data/mongo/log /data/mongo/db
EXPOSE 9000
WORKDIR /usr/local/leanote/bin

ENTRYPOINT ["bash", "/usr/local/leanote/bin/start.sh"]
