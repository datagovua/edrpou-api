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

RUN wget -O /wait-for-it.sh https://raw.githubusercontent.com/iturgeon/wait-for-it/8f52a814ef0cc70820b87fbf888273f3aa7f5a9b/wait-for-it.sh \
  && chmod +x /wait-for-it.sh


EXPOSE 80
CMD sh -c '/wait-for-it.sh -t 100 postgres:5432 && sails lift'
