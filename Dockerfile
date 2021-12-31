FROM jlesage/baseimage-gui:ubuntu-18.04

#Utilize the appuser user created in this section.

RUN apt-get update && apt-get install -y wget libnss3 libgtk-3-0 libxss1 libasound2 libgbm1 apt-transport-https curl
RUN useradd --shell /sbin/nologin --home /app --uid 1000  -G users appuser
RUN mkdir /app && chown appuser -Rfv /app
USER root
WORKDIR /app

RUN 	apt-get -y -q install \
		libreoffice \
		libreoffice-writer \
		ure \
		libreoffice-java-common \
		libreoffice-core \
		libreoffice-common \
		openjdk-8-jre \
		fonts-opensymbol \
		hyphen-fr \
		hyphen-de \
		hyphen-en-us \
		hyphen-it \
		hyphen-ru \
		fonts-dejavu \
		fonts-dejavu-core \
		fonts-dejavu-extra \
		fonts-droid-fallback \
		fonts-dustin \
		fonts-f500 \
		fonts-fanwood \
		fonts-freefont-ttf \
		fonts-liberation \
		fonts-lmodern \
		fonts-lyx \
		fonts-sil-gentium \
		fonts-texgyre \
		fonts-tlwg-purisa

RUN adduser --home=/opt/libreoffice --disabled-password --gecos "" --shell=/bin/bash libreoffice

ADD startapp.sh /startapp.sh
USER root
ENV APP_NAME="Libreoffice"