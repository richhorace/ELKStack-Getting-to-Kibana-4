#! /bin/bash

FILES=/vagrant/provisioning/files

echo "Importing sample data ..."
curl -s -XPUT 'localhost:9200/_snapshot/snapshots/' -d '{
                "type": "fs",
                "settings": {
                        "location": "/vagrant/tmp/elasticsearch/snapshots/",
                        "compress": true
                }
        }'
curl -s -XPOST 'localhost:9200/_snapshot/snapshots/demo_nyc_accidents/_restore'
echo "Finished importing sample data!"