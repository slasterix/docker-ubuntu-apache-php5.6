FROM slasterix/docker-ubuntu-apache

ARG DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y imagemagick graphicsmagick && \
    apt-get install -y libapache2-mod-php5.6 php5.6-bcmath php5.6-bz2 php5.6-cli php5.6-common php5.6-curl php5.6-dba php5.6-gd php5.6-gmp php5.6-imap php5.6-intl php5.6-ldap php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-odbc php5.6-pgsql php5.6-recode php5.6-snmp php5.6-soap php5.6-sqlite php5.6-tidy php5.6-xml php5.6-xmlrpc php5.6-xsl php5.6-zip && \
    apt-get install -y php-gnupg php-imagick php-mongodb php-streams php-fxsl && \
    mkdir /tmp/composer/ && \
    cd /tmp/composer && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    cd / && \
    rm -rf /tmp/composer && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 755 -R /var/www  && \
    apache2ctl -t && \
    mkdir -p /run /var/lib/apache2 /var/lib/php && \
    chmod -R 755 /run /var/lib/apache2 /var/lib/php /etc/php/5.6/apache2/php.ini
