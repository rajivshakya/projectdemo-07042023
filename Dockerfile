FROM centos:latest
MAINTAINER rajivshaky@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
  zip \
 unzip
RUN yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/adpitor.zip  /var/www/html
WORKDIR /var/www/html
RUN unzip adpitor.zip
RUN cp -rvf adpitor-html/* .
RUN rm -rf adpitor-html adpitor.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
