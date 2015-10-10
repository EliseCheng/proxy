FROM centos:latest
MAINTAINER Heng <1009662099@qq.com>

RUN yum install -y openssl 
RUN yum install -y passwd
RUN yum install -y stunnel　
RUN yum install -y squid　
RUN yum install -y httpd

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
