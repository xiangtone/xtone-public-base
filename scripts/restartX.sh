#!/bin/sh

#restart single and unique process

psid=0

checkpid() {
  echo "checkpid $1"
  psid=0
  aaps=`ps -A | grep -w $1`
  
  
  if [ -n "$aaps" ]; then
  psid=`echo $aaps | awk '{print $1}'`
  else
  psid=0
  fi
  
  echo "checkpided: $psid"
}

checkpid $1
echo "kill $psid ..."
kill $psid
sleep 1s
$1
checkpid $1
echo "new pid: $psid ..."