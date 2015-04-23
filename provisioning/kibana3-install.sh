#!/usr/bin/env bash

# Set variablesFILES=/vagrant/provisioning/files
FILES=/vagrant/provisioning/files

#  Install Kibana 3 Install
cp ${FILES}/kibana-3.1.2.tar.gz /var/www/html/
cd /var/www/html/
tar xzfv kibana-3.1.2.tar.gz
mv kibana-3.1.2 kibana
rm kibana-3.1.2.tar.gz

#  Start Apache
update-rc.d apache2 defaults 95 10
service apache2 start
