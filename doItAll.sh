#!/bin/bash

WORKDIR=`dirname $0`

$WORKDIR/getDnbTitel.sh
$WORKDIR/split.sh
$WORKDIR/convert.sh
$WORKDIR/createDnbIndex.sh
$WORKDIR/json2es.sh

