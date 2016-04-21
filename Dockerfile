FROM node:4.4.3-slim

COPY package.json /src/
WORKDIR /src/
RUN npm install -g sails
RUN npm install

ADD . /src/

RUN npm install swagger-ui \
  && mkdir ./assets/docs \
  && cp -r ./node_modules/swagger-ui/dist/* ./assets/docs/

RUN sed -i 's/http\:\/\/petstore\.swagger\.io\/v2\/swagger\.json/http\:\/\/edr\.data-gov-ua\.org\/swagger\.yaml/g' ./assets/docs/index.html


EXPOSE 80
CMD sh -c 'sails lift'
