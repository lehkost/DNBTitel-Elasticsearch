#!/bin/bash

WORKDIR=`dirname $0`

cd $WORKDIR

./getDnbTitel.sh
./split.sh
./convert.sh
./createDnbIndex.sh
./json2es.sh

