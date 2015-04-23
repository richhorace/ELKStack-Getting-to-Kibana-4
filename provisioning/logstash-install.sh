#!/usr/bin/env bash

# Set variablesFILES=/vagrant/provisioning/files
FILES=/vagrant/provisioning/files

# Install logstash
dpkg -i ${FILES}/logstash_1.4.2-1-2c0f5a1_all.deb

# Copy logstash Config 
cp ${FILES}/logstash-nyc_pedfatals.conf /etc/logstash/conf.d/

# Start Logstash
update-rc.d apache2 defaults 95 10
service logstash start
