FROM debian:10-slim
LABEL maintainer="IT Services <it-dept@renegade-x.com>"
RUN apt-get update
RUN apt-get install -y -q apache2 subversion libapache2-mod-svn libsvn-dev python python3 python-pip python3-pip
RUN pip install requests

EXPOSE 80

WORKDIR /etc/apache2/sites-available/
COPY subversion.conf .

RUN a2dissite 000-default.conf \
    && a2enmod authnz_ldap \
    && a2ensite subversion.conf

VOLUME [ "/repositories" ]
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
