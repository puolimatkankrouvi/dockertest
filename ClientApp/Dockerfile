FROM node:14-alpine as build

WORKDIR usr/src/app
COPY package.json ./

RUN yarn install --silent
EXPOSE 80

COPY . .
CMD ["yarn", "start"]
