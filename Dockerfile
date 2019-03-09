#FROM ubuntu
#ADD . /app
#RUN apt-get update
#RUN apt-get upgrade -y
# we should remove ssh and mysql, and use
# separate container for database 
#RUN apt-get install -y nodejs  # ssh mysql
#RUN cd /app && npm install
#FROM ubuntu:16.04 #version of ubuntu
#RUN apt-get update && apt-get install -y nodejs 

FROM node:7-alpine
LABEL maintainer "BEN.MORRIS@example.com"
WORKDIR /app
COPY package.json /app
COPY . /app
RUN npm install
COPY . $PROJECT_DIR

# env variables that can change
# volume and port settings
# and defaults for our application
ENV MEDIA_DIR=/media \
    NODE_ENV=production \
    APP_PORT=3000

VOLUME $MEDIA_DIR
EXPOSE $APP_PORT

HEALTHCHECK CMD curl --fail http://localhost:$APP_PORT || exit 1
ENTRYPOINT ["./entrypoint.sh"]
CMD ["start"]

#&& rm -rf /var/lib/apt/lists/*
#ADD . /app
#RUN cd /app && npm install

#CMD npm start

#CMD npm start
#RUN apt-get install -y nodejs ssh mysql
#RUN cd /app && npm install
# this should start three processes, mysql and ssh
# in the background and node app in foreground
# isn't it beautifully terrible? <3
#CMD npm start