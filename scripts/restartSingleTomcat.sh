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

checkpid java
echo "kill $psid ..."
if [ psid != 0 ]; then
  killall -9 java
fi
sleep 1s
# need modify here
/opt/apache-tomcat-7.0.72/bin/startup.sh
checkpid java
echo "new pid: $psid ..."