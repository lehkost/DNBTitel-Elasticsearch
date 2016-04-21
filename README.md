# DNBTitel-Elasticsearch
This Dockerfile will create a container running Elasticsearch/Kibana. It also features shell scripts for downloading [the current version of the German National Library (DNB) title catalogue](http://datendienst.dnb.de/cgi-bin/mabit.pl?userID=opendata&pass=opendata&cmd=login). Some selected data fields from every book in that catalogue are then transformed into JSON and pushed to the Elasticsearch instance. After that you will be able to query the DNB catalogue data with Elasticsearch to create nice outputs with Kibana. The data fields we're focusing on are mainly the number of pages per book and some book metadata (author, title, year, publisher, etc.) for identification.

# Docker

## build docker image

    docker build -t dnb-titel .

## create persistent volumes

    docker volume create --name dnb2es
    docker volume create --name esindex

## start docker image

    docker run --rm -ti -p 9200:9200 -p 5601:5601 -v dnb2es:/home/elasticsearch/dnb2es -v esindex:/home/elasticsearch/elasticsearch dnb-titel:latest

After this we have working Docker container and can query Elasticesearch with Kibana/Sense via http://localhost:5601. However, our Elasticsearch index is still empty. It will be filled with DNB catalogue data during the next step:

## download data from dnb, transform to json and fill elasticsearch

    docker ps

    docker exec [docker-instance-name-from-ps] dnb2es/doItAll.sh

