
FROM centos:7

MAINTAINER kerim cakmak <kecakmak@gmail.com> 

LABEL Vendor="CentOS" 
      License=GPLv2 
      Version=2.4.6-40

LABEL description="a custom Apache image"

RUN yum -y --setopt=tsflags=nodocs update && 
    yum -y --setopt=tsflags=nodocs install httpd && 
    yum clean all

RUN echo "Hello from Dockerfile" > /usr/share/httpd/noindex/index.html

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]}
