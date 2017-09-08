FROM node:6.11-alpine

MAINTAINER Jesus Farfan <jesu.farfan23@gmail.com>

RUN apk update && apk add curl git

ENV API_DESIGNER_VERSION 0.4.5

RUN curl -SLO https://github.com/mulesoft/api-designer/archive/v${API_DESIGNER_VERSION}.tar.gz \
    && tar xvzf v${API_DESIGNER_VERSION}.tar.gz \
    && mv api-designer-${API_DESIGNER_VERSION} /opt/api-designer

WORKDIR /opt/api-designer

RUN npm install

EXPOSE 3000

ENTRYPOINT ["/opt/api-designer/bin/api-designer.js"]
