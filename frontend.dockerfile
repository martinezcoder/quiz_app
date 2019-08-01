FROM node:12.6.0

RUN npm install -g @vue/cli

RUN mkdir /app
WORKDIR /app

ADD ./client ./

EXPOSE 8080

CMD npm run serve
