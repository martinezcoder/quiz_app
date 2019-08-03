FROM node:12.6.0

RUN npm install -g @vue/cli

RUN mkdir /app
WORKDIR /app

ADD ./quiz_app_frontend ./

EXPOSE 8080

CMD npm run serve

# Installation of the project
# vue create .
# npm install bootstrap-vue bootstrap
# npm install lodash
