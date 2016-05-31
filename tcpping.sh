#!/bin/bash
#for var in "$@"
#do
#    tcpping -i 0.01 -c 1 $var | ./tcpping.awk
#done
tcpping -i 0.01 -c 4 $@ | ./tcpping.awk
