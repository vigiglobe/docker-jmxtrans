#!/bin/bash
echo "starting..."
LOG_DIR=${LOG_DIR:-"/var/log/jmxtrans"}
LOG_FILE=${LOG_FILE:-"/var/log/jmxtrans/jmxtrans.log"}
SECONDS_BETWEEN_RUNS=${SECONDS_BETWEEN_RUNS:-"60"}
JSON_DIR=${JSON_DIR:-"/var/lib/jmxtrans"}
JAR_FILE=${JAR_FILE:-"/usr/share/jmxtrans/lib/jmxtrans-all.jar"}

JAVAJDK_BIN=${JAVAJDK_BIN:-"/usr/bin/java"}
JAVA_OPTS=${JAVA_OPTS:-"-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true"}
HEAP_SIZE=${HEAP_SIZE:-"512"}
PERM_SIZE=${PERM_SIZE:-"384"}
MAX_PERM_SIZE=${MAX_PERM_SIZE:-"384"}
JMX_PORT=${JMX_PORT:-"2101"}
LOG_LEVEL=${LOG_LEVEL:-"debug"}
CONTINUE_ON_ERROR=${CONTINUE_ON_ERROR:-"false"}
JMXTRANS_OPTS=${JMXTRANS_OPTS:-"-Djmxtrans.log.level=${LOG_LEVEL} -Djmxtrans.log.dir=$LOG_DIR"}


MONITOR_OPTS=${MONITOR_OPTS:-"-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=${JMX_PORT}"}
GC_OPTS=${GC_OPTS:-"-Xms${HEAP_SIZE}m -Xmx${HEAP_SIZE}m -XX:PermSize=${PERM_SIZE}m -XX:MaxPermSize=${MAX_PERM_SIZE}m"}

if [ "${ADDITIONAL_JARS}" == "" ]; then
  ADDITIONAL_JARS_OPTS=""
else
  ADDITIONAL_JARS_OPTS="-a ${ADDITIONAL_JARS}"
fi

echo "jar file location = ${JAR_FILE}"
if [ ! -f $JAR_FILE ]; then
  echo "ENV SPECIFIED  JAR_FILE File not found - $JAR_FILE"
  exit 1
fi


if [ -z "$FILENAME" ]; then
    EXEC=${EXEC:-"-jar $JAR_FILE -e -j $JSON_DIR -s $SECONDS_BETWEEN_RUNS -c $CONTINUE_ON_ERROR $ADDITIONAL_JARS_OPTS"}
else
    EXEC=${EXEC:-"-jar $JAR_FILE -e -f $FILENAME -s $SECONDS_BETWEEN_RUNS -c $CONTINUE_ON_ERROR $ADDITIONAL_JARS_OPTS"}
fi

echo "exec details : ${EXEC}"
echo "INIT.." >>$LOG_FILE
echo $JAVAJDK_BIN -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC
exec $JAVAJDK_BIN -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC >>$LOG_FILE 2>&1



