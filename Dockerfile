# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get --yes --force-yes install python3.6
RUN apt-get update
RUN apt-get --yes --force-yes install python3-pip
RUN pip3 install -U Flask
# Install for node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN sudo npm install npm --global
# Install for Vue.js
RUN npm install -g vue-cli

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*