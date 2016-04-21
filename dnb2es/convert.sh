#!/bin/bash

echo "converting to json for elasticsearch"

for splitted in split2/DNBTitel-*.rdf; do 
  echo $splitted
  outfile="${splitted%.*}.json"
  saxonb-xslt -xsl:rdf2json.xsl -s:$splitted -o:$outfile
  echo -e "\n" >> $outfile
done

echo "json conversion done"
