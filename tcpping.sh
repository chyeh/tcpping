#!/bin/bash
for var in "$@"
do
  results=""
  for c in {1..4}
  do
    results[c]=`tcpping -i 0.01 -c 1 $var | ./tcpping.awk`
  done
  echo $var ":" ${results[*]}
done
#tcpping -i 0.01 -c 4 $@ | ./tcpping.awk
