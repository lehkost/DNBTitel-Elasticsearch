# DNBTitel-Elasticsearch
This Docker project will create a container running Elasticsearch/Kibana. It also features shell scripts for downloading [the current version of the German National Library (DNB) title catalogue](http://datendienst.dnb.de/cgi-bin/mabit.pl?userID=opendata&pass=opendata&cmd=login). Some selected data fields from every book in that catalogue are then transformed into JSON and pushed to the Elasticsearch instance. After that you will be able to query the DNB catalogue data with Elasticsearch to create nice outputs with Kibana. The data fields we're focusing on are mainly the number of pages per book and some book metadata (author, title, year, publisher, etc.) for identification.

# Docker

## Build the Docker Image

Clone this repo to your hard drive and start Docker image by typing: 

    docker build -t dnb-titel .

This will do the steps defined in the Dockerfile: create a clean Debian container and install some stuff we need (curl, java, wget, etc.). Elasticsearch and Kibana will be downloaded and set up with according environments. Once this is done we can go on and …

## Create Persistent Volumes

    docker volume create --name dnb2es
    docker volume create --name esindex

## Start Docker Image

    docker run --rm -ti -p 9200:9200 -p 5601:5601 -v dnb2es:/home/elasticsearch/dnb2es -v esindex:/home/elasticsearch/elasticsearch dnb-titel:latest

After this we have a working Docker container and can query Elasticesearch with Kibana/Sense via http://localhost:5601. However, our Elasticsearch index is still empty. It will be filled with DNB catalogue data during the next step:

## Download Data From German National Library (DNB) Catalogue, Transform It to JSON and Fill Elasticsearch

After typing …

    docker ps

… you will have to look for the Docker instance in question and execute the following:

    docker exec [docker-instance-name-from-ps] dnb2es/doItAll.sh

This will call all sub scripts assembled in our "doItAll" file:
 * getDnbTitel.sh
 * split.sh
 * convert.sh
 * createDnbIndex.sh
 * json2es.sh

Now we're ready to go and carry out some queries.
