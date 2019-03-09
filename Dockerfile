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

ADD . /app
# we don't need to install node 
# anymore and use apt-get
RUN cd /app && npm install

CMD npm start
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
CMD npm start