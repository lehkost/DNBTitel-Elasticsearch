#!/bin/bash

for jsonfile in split/DNBTitel-*.json; do 
  echo $jsonfile
  curl -XPOST "http://localhost:9200/dnb/data/_bulk?pretty" --data-binary @$jsonfile
done

