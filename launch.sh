#!/usr/bin/env bash

#  ______                           __
# /_  __/___  ____ ___  _________ _/ /_
#  / / / __ \/ __ `__ \/ ___/ __ `/ __/
# / / / /_/ / / / / / / /__/ /_/ / /_
#/_/  \____/_/ /_/ /_/\___/\__,_/\__/

CATALINA_OPTS="-Xms256m -Xmx2G"
CATALINA_OPTS="$CATALINA_OPTS"
CATALINA_OPTS="$CATALINA_OPTS -XX:ThreadPriorityPolicy=42 -XX:ParallelGCThreads=4 -XX:+UseParNewGC"
CATALINA_OPTS="$CATALINA_OPTS -XX:MaxGCPauseMillis=50 -XX:+UseStringCache -XX:+OptimizeStringConcat"

# A hint to the virtual machine that it.s desirable that not more than:
# 1 / (1 + GCTimeRation) of the application execution time be spent in
# the garbage collector.
# http://themindstorms.wordpress.com/2009/01/21/advanced-jvm-tuning-for-low-pause/
CATALINA_OPTS="$CATALINA_OPTS -XX:GCTimeRatio=9"

CATALINA_OPTS="$CATALINA_OPTS -server"
CATALINA_OPTS="$CATALINA_OPTS -XX:+DisableExplicitGC"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

JAR_FILE="replace me"

LISTEN_PORT=${PORT:-5000}

# http://docs.oracle.com/middleware/1213/wls/WLSRN/issues.htm#BCFFDBEB
java -Djava.security.egd=file:/dev/./urandom \
$CATALINA_OPTS -jar $DIR/$JAR_FILE \
--server.port=$LISTEN_PORT --server.tomcat.uri-encoding=UTF-8
