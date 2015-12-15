#!/bin/sh

# func:monitor and restart tomcat
# date:Nov 19 2015

# DEFINE
export JAVA_HOME=/usr/local/jdk1.7.0_71

# tomcat path
TomcatPath=/opt/apache-tomcat-8.0.15
# define monitor URL
WebUrl=http://localhost:80
# define log path
LogPath=/opt/scripts/
# define sleep for next check , compatible deploy. second
SecondCheckInteval=120
# END DEFINE

TomcatID=$(ps -ef |grep tomcat |grep -w $TomcatPath|grep -v 'grep'|awk '{print $2}')

StartTomcat=$TomcatPath/bin/startup.sh
TomcatCache=$TomcatPath/work

# log path
GetPageInfo=$LogPath/tomcatMonitor.info
TomcatMonitorLog=$LogPath/tomcatMonitor.log

CheckTimes=0

Monitor()
{
    echo "[info]begin look tomcat...[$(date +'%F %H:%M:%S')]"
    if [ $TomcatID ]; then  # check tomcat pid
		echo "[info]current tomcat pid :$TomcatID,check page..."
		# check WebUrl
		TomcatServiceCode=$(curl -s -o $GetPageInfo -m 10 --connect-timeout 10 $WebUrl -w %{http_code}) 
		echo "$TomcatServiceCode"
		if [ $TomcatServiceCode -eq 200 ];then
			echo "[info] get 200 code . work status OK"
		else
			if [ $CheckTimes -eq 1 ];then
				echo "[error]tomcat response error . code $TomcatServiceCode , log to $GetPageInfo"
				echo "[error]try to restart tomcat ..."
				kill -9 $TomcatID   # kill tomcat
				sleep 5
				#rm -rf $TomcatCache # clean tomcat work file
				$StartTomcat
			else
				echo "[info] test again after $SecondCheckInteval second"
				sleep $SecondCheckInteval
				CheckTimes=1
				Monitor >>$TomcatMonitorLog
			fi
		fi
	else
		if [ $CheckTimes -eq 1 ];then
			echo "[error]tomcat is not working ! tomcat begin start..."
			echo "[info]$StartTomcat,please wait......"
			#rm -rf $TomcatCache
			$StartTomcat
		else
			echo "[info] test again after $SecondCheckInteval second"
			sleep $SecondCheckInteval
			CheckTimes=1
			Monitor >>$TomcatMonitorLog
		fi
	fi
	echo "------------------------------"
}

Monitor >>$TomcatMonitorLog