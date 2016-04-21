# DNBTitel-Elasticsearch
Some shell scripts to feed the open data from the German National Library (DNB) title catalogue to Elasticsearch.

## Source
* http://datendienst.dnb.de/cgi-bin/mabit.pl?userID=opendata&pass=opendata&cmd=login

# Docker

## build docker image

    docker build -t dnb-titel .

## create persistent volumes

    docker volume create --name dnb2es
    docker volume create --name esindex

## start docker image

    docker run --rm -ti -p 9200:9200 -p 5601:5601 -v dnb2es:/home/elasticsearch/es2dnb -v esindex:/home/elasticsearch/elasticsearch esdnb:latest

## download data from dnb, transform to json and fill elasticsearch

    docker ps

    docker exec [docker-instance-name-from-ps] es2dnb/doItAll.sh

