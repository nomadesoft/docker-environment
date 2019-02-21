FROM node:lts-alpine
LABEL maintainer="Jesus Farfan <jesu.farfan23@gmail.com>"

RUN npm install -g json-server

WORKDIR /data
VOLUME /data

EXPOSE 80
ADD run.sh /run.sh
ENTRYPOINT ["sh", "/run.sh"]
CMD []