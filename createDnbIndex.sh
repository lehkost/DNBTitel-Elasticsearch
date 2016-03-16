#!/bin/bash

host="http://localhost:9200"
index="dnb"

echo -e "\ndeleting the old version of the index: "

echo "curl -XDELETE ${host}/${index}"

echo -e "\ncreate new index: "
curl -XPUT "${host}/${index}" -d '
       index :
             number_of_shards : 5
             number_of_replicas : 1
     '
curl -XPUT "${host}/dnb/data/_mapping" -d @es-mapping.json

