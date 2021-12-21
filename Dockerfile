FROM centos:latest
MAINTAINER rashid78631@gmail.com
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page238/hr2.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip hr2.zip
RUN cp -rvf HR2/*  /var/www/html/
RUN rm -rf HR2  hr2.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
