FROM debian:jessie

ENV FILEBEAT_VERSION 1.0.0
ENV FILEBEAT_SHA1 824c0b3dce16e3efd7b72b5799e97cc865951ade

RUN apt-get -y update
RUN apt-get -y install apt-transport-https
RUN apt-get -y install curl
RUN curl https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://packages.elastic.co/beats/apt stable main" | tee -a /etc/apt/sources.list.d/beats.list

RUN apt-get -y update
RUN apt-get -y install filebeat

ADD filebeat.yml /etc/filebeat/filebeat.yml

ENTRYPOINT ["/usr/bin/filebeat", "-e", "-v", "-c", "/etc/filebeat/filebeat.yml"]
