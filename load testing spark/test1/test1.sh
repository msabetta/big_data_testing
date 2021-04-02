#!/bin/bash

echo "Test 1 - Caricamento file in HDFS"

FILE=dummy.txt

cp ../test0/$FILE ../test1/

HDFS_HOME=/home/hdfs

#cd $HDFS_HOME
#if ! [ -e "$HDFS_HOME/output" ];
#then
#   mkdir output
#fi

DIR_DESTINAZIONE=$HDFS_HOME/output/

cd /home/mario/loadtest/test-carico-spark/test1

HADOOP_USER_NAME=hdfs ./put_hdfsFile.sh $FILE $DIR_DESTINAZIONE

echo $HADOOP_USER_NAME

echo "Caricamento file completato"

echo "Controllo del file in HDFS in corso..."

HDFS_PATH=/opt/giotto/hadoop/bin/hdfs

HADOOP_USER_NAME=hdfs $HDFS_PATH dfs -ls $DIR_DESTINAZIONE

echo $HADOOP_USER_NAME

echo "Controllo del file in HDFS completato"

echo "Test 1 - Caricamento file in HDFS completato"








