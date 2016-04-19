FROM node:4.4.3-slim
RUN npm install sails -g

WORKDIR /src

EXPOSE 80
