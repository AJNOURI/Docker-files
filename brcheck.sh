#!/bin/bash

BRLIST="$(brctl show  | awk '{ print $1; }')"

NEW="br44"

echo $BRLIST
IN=false
for br in ${BRLIST[@]}; do
    echo $br
    if [[ $br == $NEW ]]; then
       echo "$NEW already exists"
       IN=true
    fi
done
if !IN; do
    BRLIST+=" $NEW"
    echo "$NEW not in the list"
done
fi
echo $BRLIST
