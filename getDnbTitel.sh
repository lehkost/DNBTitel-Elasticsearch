#!/bin/bash

wget "http://datendienst.dnb.de/cgi-bin/mabit.pl?cmd=fetch&userID=opendata&pass=opendata&mabheft=DNBTitel.rdf.gz" -O DNBTitel.rdf.gz
gunzip DNBTitel.rdf.gz
rm DNBTitel.rdf.gz

