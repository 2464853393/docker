#!/bin/bash

mkdir -p  /usr/local/tomcat7
tar -xf /soft/tomcat7.tar.gz -C /usr/local/tomcat7 --strip-components=1
rm -rf /soft/tomcat7.tar.gz
rm -f usr/local/tomcat7/bin/*.bat