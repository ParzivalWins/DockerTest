FROM ubuntu

ADD . /app

RUN apt-get update
RUN apt-get upgrade -y
# we should remove ssh and mysql, and use
# separate container for database 
RUN apt-get install -y nodejs  # ssh mysql
RUN cd /app && npm install

CMD npm start
#RUN apt-get install -y nodejs ssh mysql
#RUN cd /app && npm install

# this should start three processes, mysql and ssh
# in the background and node app in foreground
# isn't it beautifully terrible? <3
CMD npm start