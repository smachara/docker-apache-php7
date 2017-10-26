FROM smachara2/apache

MAINTAINER Samer MACHARA <smachara@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 

RUN apt-get install -y \
	php \ 
	libapache2-mod-php \
	php-mcrypt \
	php-mysql \
	php-fpm \
	php-cli \
	php-mysqlnd \
	php-pgsql \
	php-sqlite3 \ 
	php-redis \
	php-apcu \
	php-intl \
	php-imagick \
	php-mcrypt \
	php-json \
	php-gd 
	
RUN rm -rf /var/lib/apt/lists/* 

RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" 

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') ===  '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" 

RUN php composer-setup.php --disable-tls

RUN php -r "unlink('composer-setup.php');"cd 
