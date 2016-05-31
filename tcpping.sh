#!/bin/bash
for var in "$@"
do
  results=""
  for c in {1..4}
  do
    result=`tcpping -i 0.01 -c 1 $var | ./tcpping.awk`
    # echo $result
    results="$results $result"
  done
  echo $var ":" $results
done
#tcpping -i 0.01 -c 4 $@ | ./tcpping.awk
