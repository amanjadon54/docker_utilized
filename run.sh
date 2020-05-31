#!/usr/bin/env bash
if [ "$TR_AUDITING_SERVICE_ENV" = "production" ]
then
exec java -Dspring.profiles.active=prod $JAVA_OPTS -jar target/auditing_service-0.1.jar
elif [ "$TR_AUDITING_SERVICE_ENV" = "staging" ]
then
exec java -XX:+PrintFlagsFinal $JAVA_OPTS -Dspring.profiles.active=staging -jar target/auditing_service-0.1.jar --server.port="$SERVER_PORT"
elif [ "$TR_AUDITING_SERVICE_ENV" = "prodk8" ]
then
exec java -XX:+PrintFlagsFinal $JAVA_OPTS -Dspring.profiles.active=prodk8 -jar /home/appuser/app.jar --server.port="$SERVER_PORT"
fi


