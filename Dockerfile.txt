FROM centos:7

USER root

MAINTAINER The CentOS Project <cloud-ops@centos.org>

LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


LABEL description="a custom Apache image"

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

RUN sed -i "s/Listen 80/Listen 8080/" /etc/httpd/conf/httpd.conf && \
  chown apache:0 /etc/httpd/conf/httpd.conf && \
  chmod g+r /etc/httpd/conf/httpd.conf && \
  chown apache:0 /var/log/httpd && \
  chmod g+rwX /var/log/httpd && \
  chown apache:0 /var/run/httpd && \
  chmod g+rwX /var/run/httpd
RUN mkdir -p /var/www/html && echo "hello world!" >> /var/www/html/index.html && \
  chown -R apache:0 /var/www/html && \
  chmod -R g+rwX /var/www/html
EXPOSE 8080
USER apache

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
