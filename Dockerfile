FROM node:4.4.3-slim
RUN apk update \
  && apk add git && \
  && rm -rf /var/cache/apk/*


COPY package.json /src/
WORKDIR /src/
RUN npm install -g sails
RUN npm install

ADD . /src/

#ENV PATH /src/node_modules/.bin:${PATH}
#RUN ls /src/node_modules/.bin
EXPOSE 80
CMD sh -c 'sails lift'
