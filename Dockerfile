FROM ubuntu

RUN apt-get update && apt-get install -yq nodejs npm

RUN mkdir /app
WORKDIR /app

ADD package.json /app/
RUN npm install

ADD server.js /app/
ADD mime-types.json /app/

ENV CAMO_HOSTNAME=camo.ited.co.nz
ENV CAMO_LOGGING_ENABLED=debug 

EXPOSE 8081

CMD ["nodejs", "server.js"]
