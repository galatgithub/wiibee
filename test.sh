#! /bin/bash

get_temperature() {
    awk "BEGIN { print $RANDOM * 42.123 / 32767 }"
}

for i in $(seq 20); do
    echo "$(date +%s.%N) $(get_temperature) $(get_temperature) $(get_temperature) $(get_temperature)" >> wiibee.txt
    sleep 0.01
done
python txt2js.py wiibee < wiibee.txt > wiibee.js

xdg-open index.html
