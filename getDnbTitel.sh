#!/bin/bash

wget http://datendienst.dnb.de/cgi-bin/mabit.pl?cmd=fetch&userID=opendata&pass=opendata&mabheft=
gunzip DNBTitel.rdf.gz
rm DNBTitel.rdf.gz

