#!/usr/bin/env bash

# Set variablesFILES=/vagrant/provisioning/files
FILES=/vagrant/provisioning/files

# Install and Start elasticsearch
dpkg -i ${FILES}/elasticsearch-1.3.5.deb
update-rc.d elasticsearch defaults 95 10
service elasticsearch start

echo "Waiting for elasticsearch to startup ..."
until curl -s --connect-timeout 1 localhost:9200; do
  echo "."
  sleep 1
done

# Install Head Plugin
/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
