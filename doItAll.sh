#!/bin/bash

./getDnbTitel.sh
./split.sh
./convert.sh
./createDnbIndex.sh
./json2es.sh

