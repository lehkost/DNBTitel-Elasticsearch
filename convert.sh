#!/bin/bash

for splitted in split/DNBTitel-*.rdf; do 
  echo $splitted
  outfile="${splitted%.*}.json"
  saxonb-xslt -xsl:rdf2json.xsl -s:$splitted -o:$outfile
  echo -e "\n" >> $outfile
done

