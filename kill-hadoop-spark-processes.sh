#!/bin/bash
echo "Kill Hadoop-Spark started services"
kill `jps | grep "DataNode" | cut -d " " -f 1`
kill `jps | grep "Master" | cut -d " " -f 1`
kill `jps | grep "Worker" | cut -d " " -f 1`
kill `jps | grep "NameNode" | cut -d " " -f 1`
kill `jps | grep "NodeManager" | cut -d " " -f 1`
kill `jps | grep "ResourceManager" | cut -d " " -f 1`
kill `jps | grep "SecondaryNameNode" | cut -d " " -f 1`
echo "Hadoop-Spark processes are all killed"
