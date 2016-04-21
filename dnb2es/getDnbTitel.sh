#!/bin/bash

echo "downloading DNBTitel.rdf.gz"

wget -c --progress=dot:giga "http://datendienst.dnb.de/cgi-bin/mabit.pl?cmd=fetch&userID=opendata&pass=opendata&mabheft=DNBTitel.rdf.gz" -O DNBTitel.rdf.gz

echo "download done, starting unzip"

gunzip DNBTitel.rdf.gz

echo "unzip done"
