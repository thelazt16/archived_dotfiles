#!/usr/bin/env bash
current=$(light)
new=10
test=$(echo "scale=2;($(light)+10)/100" | bc)
echo $test
