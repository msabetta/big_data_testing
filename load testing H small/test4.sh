#!/bin/bash
echo "Test 4: Map/Reduce Job - TeraSort"

INPUT_DIR_TERAGEN="output_teragen"
OUTPUT_DIR_TERASORT="output_terasort"

HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH=/opt/giotto/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar
PATH_TERAGEN=/tmp/$INPUT_DIR_TERAGEN
PATH_TERASORT=/tmp/$OUTPUT_DIR_TERASORT

HADOOP_USER_NAME=hdfs $HADOOP_PATH jar $HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH terasort $PATH_TERAGEN $PATH_TERASORT

echo $HADOOP_USER_NAME

echo "Il test 4 è completato. Creata cartella di output al percorso $PATH_TERASORT"
