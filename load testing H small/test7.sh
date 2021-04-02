#!/bin/bash

echo "Test 7 - TestDFSIO write"

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

HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH=/home/ubuntu/tuning/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar

HADOOP_USER_NAME=hdfs time $HADOOP_PATH jar $HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH TestDFSIO -write -nrFiles $N_FILES -size $SIZE

echo $HADOOP_USER_NAME

echo "Test 7 - Elaborazione completata."

echo "Test Results: "

cat TestDFSIO_results.log

TESTDFSIO_SOURCE="/benchmarks"
TESTDFSIO_PATH_DEST="/home/hdfs"

hdfs dfs -copyToLocal $TESTDFSIO_SOURCE $TESTDFSIO_PATH

echo "Il test 7 - TestDFSIO write è completato."

