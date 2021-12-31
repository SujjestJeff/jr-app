FROM jlesage/baseimage-gui:ubuntu-18.04

#Utilize the appuser user created in this section.

RUN apt-get update && apt-get install -y wget libnss3 libgtk-3-0 libxss1 libasound2 libgbm1 apt-transport-https curl
RUN useradd --shell /sbin/nologin --home /app --uid 1000  -G users appuser
RUN mkdir /app && chown appuser -Rfv /app
USER root
WORKDIR /app

#INSERT APP INSTALL INSTRUCTIONS HERE

ADD startapp.sh /startapp.sh
USER root
ENV APP_NAME="INSERT APP NAME"