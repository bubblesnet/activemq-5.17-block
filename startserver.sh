#!/usr/bin/env bash

mkdir -p /activemq_conf/conf/
if [ -f "/activemq_conf/conf/activemq_prod.xml" ]
then
  echo Baseline activemq configurations already stored in shared storage
else
  echo Baseline activemq configurations not found in shared storage - copying
  cp ./activemq_dev.xml /activemq_conf/conf/activemq_dev.xml
  cp ./jetty_dev.xml /activemq_conf/conf/jetty_dev.xml

  cp ./activemq_test.xml /activemq_conf/conf/activemq_test.xml
  cp ./jetty_test.xml /activemq_conf/conf/jetty_test.xml

  cp ./activemq_ci.xml /activemq_conf/conf/activemq_ci.xml
  cp ./jetty_ci.xml /activemq_conf/conf/jetty_ci.xml

  cp ./activemq_prod.xml /activemq_conf/conf/activemq_prod.xml
  cp ./jetty_prod.xml /activemq_conf/conf/jetty_prod.xml

fi

ls -al /activemq_conf/conf

case $NODE_ENV in
PRODUCTION|production)
echo NODE_ENV=$NODE_ENV Copying $NODE_ENV configuration files into place
cp /activemq_conf/conf/activemq_prod.xml /apache-activemq-5.17.2/conf/activemq.xml
cp /activemq_conf/conf/jetty_prod.xml /apache-activemq-5.17.2/conf/jetty.xml
;;
DEVELOPMENT|development)
echo NODE_ENV=$NODE_ENV Copying $NODE_ENV configuration files into place
cp /activemq_conf/conf/activemq_dev.xml /apache-activemq-5.17.2/conf/activemq.xml
cp /activemq_conf/conf/jetty_dev.xml /apache-activemq-5.17.2/conf/jetty.xml
;;
TEST|test)
echo NODE_ENV=$NODE_ENV Copying $NODE_ENV configuration files into place
cp /activemq_conf/conf/activemq_test.xml /apache-activemq-5.17.2/conf/activemq.xml
cp /activemq_conf/conf/jetty_test.xml /apache-activemq-5.17.2/conf/jetty.xml
;;
CI|ci)
echo NODE_ENV=$NODE_ENV Copying $NODE_ENV configuration files into place
cp /activemq_conf/conf/activemq_ci.xml /apache-activemq-5.17.2/conf/activemq.xml
cp /activemq_conf/conf/jetty_ci.xml /apache-activemq-5.17.2/conf/jetty.xml
;;
esac


/apache-activemq-5.17.2/bin/activemq console
