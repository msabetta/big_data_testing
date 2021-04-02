#!/bin/bash
HDFS_PATH=/opt/giotto/hadoop/bin/hdfs
echo "primo argomento:nome file"
echo "secondo argomento:directory di destinazione hdfs"
$HDFS_PATH dfs -mkdir -p $2
$HDFS_PATH dfs -put $1 $2
echo "finito!"