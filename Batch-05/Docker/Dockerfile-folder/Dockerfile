FROM centos:7

RUN yum -y update
RUN yum -y install httpd
RUN yum -y install zip 
RUN yum -y install unzip

WORKDIR /var/www/html

COPY sample-website-github.zip .
RUN  unzip sample-website-github.zip

RUN mv sample-website-github/* .

CMD apachectl -DFOREGROUND