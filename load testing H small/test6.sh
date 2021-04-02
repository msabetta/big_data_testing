#!/bin/bash

echo "Test 6 - TestDFSIO clean"

cd /home

if ! [ -d "/home/ubuntu" ];
then 
   mkdir ubuntu
fi

cd ubuntu

if ! [ -d "/home/ubuntu/tuning" ];
then 
   mkdir tuning
fi

cd tuning

if ! [ -e "hadoop-mapreduce-client-jobclient-2.6.0-tests.jar" ];
then
wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-jobclient/2.6.0/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar
fi

HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH=/home/ubuntu/tuning/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar

HADOOP_USER_NAME=hdfs $HADOOP_PATH jar $HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH TestDFSIO -clean

echo $HADOOP_USER_NAME

HDFS_HOME=/home/hdfs

FILE=$HDFS_HOME/benchmarks/TestDFSIO

if [ -d "$FILE" ]   #verifico se la directory /benchmarks/TestDFSIO esiste oppure no
then
    echo "$FILE is a directory"
    cd /home/hdfs
    rm -rf benchmarks
    hdfs dfs -rm -r /benchmarks
fi

echo "Il test 6 - TestDFSIO clean è completato."
