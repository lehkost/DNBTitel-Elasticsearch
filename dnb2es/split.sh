#!/bin/bash

echo "splitting rdf/xml file into smaller pieces, this may take a while"

mkdir split
cd split/
rm -f DNBTitel-*
mv ../DNBTitel.rdf .
xml_split -n 3 -g 100000 DNBTitel.rdf
rm DNBTitel-000.rdf
cd ..

mkdir split2

for splitted in split/DNBTitel-*.rdf; do
  filename=split2/$(basename "$splitted")
  namespace=`cat namespace.xml`
  echo '<?xml version="1.0" encoding="UTF-8"?>' > $filename
  echo $namespace >> $filename
  sed '1d;2d;$d' $splitted >> $filename
  echo '</rdf:RDF>' >> $filename
done

echo "splitting done"

