FROM centos:centos6
MAINTAINER Heng <1009662099@qq.com>

RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssl
RUN yum install -y passwd
RUN yum install -y stunnel　
RUN yum install -y squid　
RUN yum install -y httpd

RUN mkdir /home/heng/
RUN mkdir /var/run/sshd
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config


ADD ./entrypoint.sh  /home/heng/
ADD ./squid.conf    /etc/squid/
ADD ./stunnel.pem   /etc/stunnel/
ADD ./stunnel.conf   /etc/stunnel/


RUN /usr/sbin/squid -z
RUN touch /etc/squid/password


RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

EXPOSE 22
EXPOSE 80
EXPOSE 3128
EXPOSE 1080


USER root
ENV ROOTPASS=rfvujm4567

ENTRYPOINT ["bash", "/home/heng/entrypoint.sh" ]
