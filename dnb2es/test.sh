#!/bin/bash

for splitted in split/DNBTitel-*.rdf; do
  outfile=$(basename "$splitted")
  echo $outfile
done
