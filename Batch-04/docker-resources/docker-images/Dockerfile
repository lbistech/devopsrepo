FROM centos

#This is my custome docker image for my webpage

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN yum update -y

RUN yum install -y httpd

WORKDIR /var/www/html

RUN echo "--- Welcome to DevOps - Docker Part ---" > index.html

CMD apachectl -DFOREGROUND
