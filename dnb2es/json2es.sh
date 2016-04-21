#!/bin/bash

echo "uploading json files to elasticsearch"

for jsonfile in split2/DNBTitel-*.json; do 
  echo $jsonfile
  curl -XPOST "http://localhost:9200/dnb/data/_bulk?pretty" --data-binary @$jsonfile
done

echo "upload to elasticsearch done, now you could query the database at http://localhost:5601/"
