#!/bin/bash

echo "Test 2 - Client WordCount"

DIM="5G"
#DIM="10G"

FILE="big_client.txt"

echo "Creazione del file $FILE in corso di dimensione $DIM in corso.." 

fallocate -l $DIM $FILE

echo "Creazione del file $FILE avvenuto con successo"

PATH_FILE=$(pwd)/$FILE

echo "Il file è stato creato al path $PATH_FILE"

echo "Caricamento del file in HDFS in corso..." 

HDFS_PATH=/opt/giotto/hadoop/bin/hdfs
HDFS_DEST=/home/hdfs/client_wordcount

$HDFS_PATH dfs -mkdir -p $HDFS_DEST
$HDFS_PATH dfs -put $FILE $HDFS_DEST

echo "Caricamento del file in HDFS avvenuto con successo" 

SPARK_SUBMIT_PATH=/opt/giotto/spark/bin/spark-submit
WORDCOUNT_CLASS="org.apache.spark.examples.JavaWordCount"
DEPLOY_MODE="client"
SPARK_EXAMPLES_JAR_PATH=/opt/giotto/spark/examples/jars/spark-examples_2.12-3.0.0.jar

echo "Caricamento del file in HDFS avvenuto con successo" 

echo "Operazione di WordCount Spark Job lato client in corso..." 

HADOOP_USER_NAME=hdfs $SPARK_SUBMIT_PATH --class $WORDCOUNT_CLASS  --master yarn --deploy-mode $DEPLOY_MODE $SPARK_EXAMPLES_JAR_PATH $HDFS_DEST/$FILE

echo $HADOOP_USER_NAME

echo "Operazione di WordCount Spark Job lato client completata."



