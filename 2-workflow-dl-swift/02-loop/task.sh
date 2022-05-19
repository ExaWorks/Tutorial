#!/bin/sh

ID=$1 OUTPUT=$2

echo "START: $ID $OUTPUT"
DELAY=$( expr $ID % 4 )
sleep $DELAY
echo "STOP:  $DELAY" | tee $OUTPUT
