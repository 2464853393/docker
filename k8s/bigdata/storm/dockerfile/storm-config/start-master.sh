#!/bin/bash

#start webUI
/usr/local/apache-storm-1.1.0/bin/storm ui >/dev/null 2>&1 &
sleep 10;
#start nimbus
/usr/local/apache-storm-1.1.0/bin/storm nimbus >/dev/null 2>&1 &
tail -F /usr/local/apache-storm-1.1.0/logs/* &
while true
  do
    sleep 1000;
  done;