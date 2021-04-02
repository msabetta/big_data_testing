#!/bin/bash
echo "Test 5: Map/Reduce Job - TeraValidation"

OUTPUT_DIR_TERASORT="output_terasort"
REPORT_DIR="report_dir"

HADOOP_PATH=/opt/giotto/hadoop/bin/hadoop
HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH=/opt/giotto/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar
TERASORT_PATH=/tmp/$OUTPUT_DIR_TERASORT
REPORT_PATH=/tmp/$REPORT_DIR

if ! [ -d "$TERASORT_PATH" ];   #verifico se la directory /tmp/output_terasort esiste oppure no nel filesystem
then
    hdfs dfs -copyToLocal $TERASORT_PATH $TERASORT_PATH
fi

HADOOP_USER_NAME=hdfs time $HADOOP_PATH jar $HADOOP_MAPREDUCE_EXAMPLES_JAR_PATH teravalidate $TERASORT_PATH $REPORT_PATH > teravalidate.log 2>&1

echo $HADOOP_USER_NAME

PATH_VALIDATE_LOG=$(pwd)/teravalidate.log

echo "Il test 5 è completato. Creata cartella di output al percorso $PATH_VALIDATE_LOG"

cat $PATH_VALIDATE_LOG
