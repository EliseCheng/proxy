FROM centos:latest
MAINTAINER Heng <1009662099@qq.com>

RUN yum install -y openssh-server
RUN yum install -y openssl 
RUN yum install -y passwd
RUN yum install -y stunnel　
RUN yum install -y squid　
RUN yum install -y httpd

RUN mkdir /home/heng/

ADD ./entrypoint.sh  /home/heng/
ADD ./squid.conf    /etc/squid/
ADD ./stunnel.pem   /etc/stunnel/
ADD ./stunnel.conf   /etc/stunnel/


RUN /usr/sbin/squid -z
RUN touch /etc/squid/password



EXPOSE 22
EXPOSE 80
EXPOSE 3128
EXPOSE 1080


USER root
ENV ROOTPASS=rfvujm4567

ENTRYPOINT ["bash", "/home/heng/entrypoint.sh" ]
