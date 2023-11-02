FROM ubuntu:latest
RUN apt-get update -y && \
apt-get install -y apache2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1001 apache && useradd -u 1001 -g apache apache
#RUN chown -R apache:apache /var/log/apache2 
#RUN chown -R apache:apache /var/run/apache2
#RUN chown -R apache:apache /etc/apache2
RUN chmod g+rwx  /var/log/apache2 /etc/apache2  /var/run/apache2
#RUN echo"Welecome to First page" >>/var/www/html/index.html
EXPOSE 8080
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
