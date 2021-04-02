#!/bin/bash
echo "Stop Hadoop-Spark services"
cd /opt/giotto/hadoop/sbin
./stop-all.sh
cd /opt/giotto/spark/sbin
./stop-all.sh
$HADOOP_HOME/bin/mapred --daemon stop historyserver
echo "Hadoop-Spark services stopped"
