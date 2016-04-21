FROM node:4.4.3-slim

RUN apt-get update \
  && apt-get install -y git --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

COPY package.json /src/
WORKDIR /src/
RUN npm install -g sails
RUN npm install

ADD . /src/

RUN npm install swagger-ui \
  && mkdir /src/assets/docs \
  && cp -r node_modules/swagger-ui/dist/* /src/assets/docs/ \

EXPOSE 80
CMD sh -c 'sails lift'
