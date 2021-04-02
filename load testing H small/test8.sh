#!/bin/bash

echo "Test 8 - TestDFSIO write with replication factor"

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

SIZE="10MB" #scegliere la size tra "10MB","100MB","1GB","10GB","50GB"
#SIZE="100MB"
#SIZE="1GB"
#SIZE="10GB"
#SIZE="50GB"

if [ $SIZE = "10MB" ]
then
	echo "SIZE è uguale a 10MB"
	N_FILES=10
fi
	
if [ $SIZE = "100MB" ]
then
	echo "SIZE è uguale a 100MB"
	N_FILES=50
fi

if [ $SIZE = "1GB" ]
then
	echo "SIZE è uguale a 1GB"
	N_FILES=50
fi

if [ $SIZE = "10GB" ]
then
	echo "SIZE è uguale a 10GB"
	N_FILES=100
fi
	
if [ $SIZE = "50GB" ]
then
	echo "SIZE è uguale a 50GB"
	N_FILES=500
fi

REPL_FACTOR=1
HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH=/home/ubuntu/tuning/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar

cd /home/mario/loadtest/testcaricoHsmall

HADOOP_USER_NAME=hdfs time $HADOOP_PATH  jar $HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH TestDFSIO -D dfs.replication=$REPL_FACTOR -write -nrFiles $N_FILES -size $SIZE

echo $HADOOP_USER_NAME

echo "Test 8 - Elaborazione completata."

SUB_DIR_CTRL="io_control"
SUB_DIR_DATA="io_data"
SUB_DIR_WRITE="io_write"

echo "Verifica recepimento fattore di replica..." 

echo "TESTDFSIO:"
HADOOP_USER_NAME_TEST_DFSIO=sudo hdfs dfs -ls /benchmarks/TestDFSIO

echo $HADOOP_USER_NAME_TEST_DFSIO

echo "I/O Control:"
HADOOP_USER_NAME_CTRL=sudo hdfs dfs -ls /benchmarks/TestDFSIO/$SUB_DIR_CTRL

echo $HADOOP_USER_NAME_CTRL

echo "I/O Data:"
HADOOP_USER_NAME_DATA=sudo hdfs dfs -ls /benchmarks/TestDFSIO/$SUB_DIR_DATA

echo $HADOOP_USER_NAME_DATA

echo "I/O Write:"
HADOOP_USER_NAME_WRITE=sudo hdfs dfs -ls /benchmarks/TestDFSIO/$SUB_DIR_WRITE

echo $HADOOP_USER_NAME_WRITE

echo "Verifica recepimento fattore di replica completata." 
echo "Il Test 8 - TestDFSIO write with replication factor è completato."

