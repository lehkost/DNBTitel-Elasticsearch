#!/bin/bash

echo "downloading DNBTitel.rdf.gz"

wget -c --progress=dot:giga "https://data.dnb.de/opendata/DNBTitel.rdf.gz" -O DNBTitel.rdf.gz 

echo "download done, starting unzip"

gunzip DNBTitel.rdf.gz

echo "unzip done"
