#!/bin/bash

WORKDIR=`dirname $0`

host="http://localhost:9200"
index="dnb"

echo -e "\nDeleting old version of the index: "
curl -XDELETE ${host}/${index}

echo -e "\nCreate new index: "
curl -XPUT "${host}/${index}" -d '
       index :
             number_of_shards : 5
             number_of_replicas : 1
     '
curl -XPUT "${host}/${index}/data/_mapping" -d @$WORKDIR/es-mapping.json
