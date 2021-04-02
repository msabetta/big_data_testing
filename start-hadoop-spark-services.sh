#!/bin/bash
echo "Start Hadoop-Spark services"
cd /opt/giotto/hadoop/sbin
./start-all.sh
cd /opt/giotto/spark/sbin
./start-all.sh
$HADOOP_HOME/bin/mapred --daemon start historyserver
echo "Hadoop-Spark services started"
