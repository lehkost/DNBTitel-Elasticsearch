#!/bin/bash

mkdir split
cd split/
rm -f DNBTitel-*
mv ../DNBTitel.rdf .
xml_split -n 3 -g 100000 DNBTitel.rdf
cd ..

for splitted in split/DNBTitel-*.rdf; do
  filename=$(basename "$splitted")
  echo '<?xml version="1.0" encoding="UTF-8"?>' > $filename
  echo '<rdf:RDF xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:sf="http://www.opengis.net/ont/sf#" xmlns:isbd="http://iflastandards.info/ns/isbd/elements/" xmlns:gndo="http://d-nb.info/standards/elementset/gnd#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:marcRole="http://id.loc.gov/vocabulary/relators/" xmlns:lib="http://purl.org/library/" xmlns:umbel="http://umbel.org/umbel#" xmlns:rdau="http://rdaregistry.info/Elements/u/" xmlns:bibo="http://purl.org/ontology/bibo/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">' >> $filename
  sed '1d;2d;$d' $splitted >> $filename
  echo '</rdf:RDF>' >> $filename
done

# rm DNBTitel-000.rdf

