FROM ubuntu:bionic
MAINTAINER Isaias Neto <isaiasneto@gmail.com>

ENV TZ America/Sao_Paulo

RUN apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		curl git unzip php7.4-cli php7.4-zip \
		php7.4-mysql php7.4-bcmath php7.4-json php7.4-mbstring \
		php7.4-gd php7.4-curl php-tokenizer php-xml php-imagick php-fdomdocument && \
		rm -rf /var/lib/apt/lists/* && \
		curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD FIRST_RUN /FIRST_RUN

RUN mkdir -p /app

EXPOSE 8000

WORKDIR /app

CMD ["/run.sh"]
