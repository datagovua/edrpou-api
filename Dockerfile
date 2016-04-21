FROM node:4.4.3-slim

RUN apt-get update \
  && apt-get install -y git --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

COPY package.json /src/
ADD . /src/
WORKDIR /src/
RUN npm install -g sails
RUN npm install


RUN npm install swagger-ui \
  && mkdir ./assets/docs \
  && cp -r ./node_modules/swagger-ui/dist/* ./assets/docs/

EXPOSE 80
CMD sh -c 'sails lift'
