#!/bin/bash

cd jhmc/jhmc-efmis

# pull from repo
git fetch origin main
git pull origin main

# build project
sudo mvn -DargLine="--add-opens java.base/java.lang=ALL-UNNAMED" clean install -DskipTests

# backup war file
sudo cp /opt/tomcat/webapps/collect.war /opt/backup_war/collect-$(date +"%m%d%Y").war

# copy warfile sa webapps
sudo cp collect-webapp/target/collect.war /opt/tomcat/webapps/

# restart tomcat
sudo systemctl restart tomcat.service

