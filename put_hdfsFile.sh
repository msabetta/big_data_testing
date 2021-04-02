#!/bin/bash
echo "primo argomento:nome file"
echo "secondo argomento:directory di destinazione hdfs"
/opt/giotto/hadoop/bin/hdfs dfs -mkdir -p $2
/opt/giotto/hadoop/bin/hdfs dfs -put $1 $2
echo "finito!"