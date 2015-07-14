#################################################################
# This docker image build file creates an image that contains
# nginx, passenger, rvm with ruby on rails. It is intended for you
# to use as a base for your project. Or as a template for your dockerfile.
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# Component:    nginx php mysql redis mongo ruby elasticsearch 
# Author:       lavender <lavendergeng@gmail.com>
#################################################################

#####
# Building: sudo docker build -t localhost:5000/webapp .
# Open it up: sudo docker run -t -i -p 80:80 -p 443:443 -p 4000:22 bash -l

FROM localhost:5000/ubuntu:latest
MAINTAINER lavender <lavendergeng@gmail.com>

# Install Redis.
RUN  apt-get update && \
apt-get install redis-server -y

# add config file
ADD redis.conf /etc/redis/redis.conf

# chown
RUN chown -R redis.redis /etc/redis

# Define mountable directories.
VOLUME ["/data/redis"]

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT  ["/usr/bin/redis-server"]

#CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379
