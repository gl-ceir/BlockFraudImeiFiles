#!/bin/bash

. /root/.bash_profile
build_path="/u01/ceirapp/BlockFraudApi/"
build="block_fraud_imei.jar"
cd $build_path

VAR=""
status=`ps -ef | grep $build | grep java`
if [ "$status" != "$VAR" ]
then
 echo "Process Already Running"
else
 echo "Starting Process"
java -Dlogging.config=./log4j2.xml -Dspring.config.location=:./application.properties,file:${APP_HOME}/configuration/configuration.properties  -jar $build  >> ${DATA_HOME}/logs/BlockFraudApi/log.log 2>> ${DATA_HOME}/logs/BlockFraudApi/error.log &
echo "Process Started"
fi

