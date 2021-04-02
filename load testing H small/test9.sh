#!/bin/bash

echo "Test 9 - TestDFSIO read"

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

HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH=/home/ubuntu/tuning/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar

HADOOP_USER_NAME=hdfs time $HADOOP_PATH  jar $HADOOP_MAPREDUCE_JOBCLIENT_JAR_PATH TestDFSIO -read -nrFiles $N_FILES -size $SIZE

echo $HADOOP_USER_NAME

echo "Test 9 - Elaborazione completata."

echo "Test Results: "

cat TestDFSIO_results.log

echo "Il test 9 - TestDFSIO read è completato."



