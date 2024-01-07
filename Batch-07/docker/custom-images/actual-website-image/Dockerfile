FROM centos:7

RUN yum -y install httpd

COPY sample-html-website /var/www/html 

CMD apachectl -DFOREGROUND
