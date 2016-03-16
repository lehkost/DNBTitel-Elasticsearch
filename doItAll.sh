#!/bin/bash

SELF=`dirname $0`

$SELF/getDnbTitel.sh
$SELF/split.sh
$SELF/convert.sh
$SELF/createDnbIndex.sh
$SELF/json2es.sh

