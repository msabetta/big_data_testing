#!/bin/bash
echo "Test 3: Map/Reduce Job - TeraGen"

SIZE=5 #scegliere tra 5GB,10GB,100GB
#SIZE=10
#SIZE=100

if [ $SIZE -eq 5 ]
then
	echo "SIZE è uguale a 5GB"
	ROWS=50000000
fi

if [ $SIZE -eq 10 ]
then
	echo "SIZE è uguale a 10GB"
	ROWS=100000000
fi

if [ $SIZE -eq 100 ]
then
	echo "SIZE è uguale a 100GB"
	ROWS=1000000000
fi

OUTPUT_DIR_TERAGEN="output_teragen"
HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH=/opt/giotto/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar
TERAGEN_PATH=/tmp/$OUTPUT_DIR_TERAGEN

HADOOP_USER_NAME=hdfs $HADOOP_PATH jar $HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH teragen $ROWS $TERAGEN_PATH

echo $HADOOP_USER_NAME

echo "Il test 3 è completato. Creata cartella di output al percorso $TERAGEN_PATH"
