#!/usr/bin/awk -f
BEGIN {
  delete targets[0]
  delete resultData[0]
  delete results[0]
  delete resultsLen[0]
}
$1=="TCP"{
  gsub("[()]","",$4)
  target =$4
  split(target, tgArr, ":")
  ipAddr = tgArr[1]
  targets[ipAddr]=ipAddr
  targetsProbeNums[ipAddr]=targetsProbeNums[ipAddr]+1
}
$1=="RST" || $1=="SYN/ACK"{
  gsub(":","",$3)
  gsub(/ms/,"",$6)
  gsub(/time=/,"",$6)
  resultData[length(resultData)+1]=$3":"$6
}
END {
  for (i in targets) {
    resultsLen[i]=0
    for (r in resultData) {
      split(resultData[r], rArr, ":")
      if (i==rArr[1]) {
        results[i]=results[i]" "rArr[2]
        resultsLen[i]=resultsLen[i]+1
      }
    }

    for (diff=resultsLen[i]; diff<targetsProbeNums[targets[i]]; diff=diff+1) {
      results[i]=results[i]" -"
    }
    print targets[i]" :"results[i]
  }
}
