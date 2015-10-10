FROM centos:latest
MAINTAINER Heng <1009662099@qq.com>

RUN yum update
RUN yum install -y openssl &&　yum install -y passwd && && yum install -y stunnel　&& yum install -y squid　&& yum install httpd

RUN mkdir /home/heng/
RUN mkdir /etc/stunnel/

ADD ./entrypoint.sh  /home/heng/
ADD ./squid.conf    /etc/squid/
ADD ./stunnel.pem   /etc/stunnel/
ADD ./stunnel.conf   /etc/stunnel/


EXPOSE 22
EXPOSE 80
EXPOSE 3128
EXPOSE 1080

ENTRYPOINT ["bash", "/home/heng/entrypoint.sh" ]

USER root
ENV ROOTPASS=rfvujm4567
