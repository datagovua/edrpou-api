FROM node:4.4.3-slim

RUN apt-get update \
  && apt-get install -y git --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

COPY package.json /src/
WORKDIR /src/
RUN npm install -g sails
RUN npm install

ADD . /src/

EXPOSE 80
CMD sh -c 'sails lift'
