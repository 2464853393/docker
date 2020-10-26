#!/bin/bash
/usr/local/apache-storm-1.1.0/bin/storm supervisor >/dev/null 2>&1 &
tail -F /usr/local/apache-storm-1.1.0/logs/* &
while true
  do
    sleep 1000;
  done;