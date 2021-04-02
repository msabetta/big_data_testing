#!/bin/bash
echo "Test 1: Spark Job - Calcolo del PiGreco utllizzando il Metodo di Montecarlo"

INPUT=100000
#INPUT=200000
#INPUT=500000
#INPUT=625000
#INPUT=800000

PATH_SPARK_SUBMIT=/opt/giotto/spark/bin/spark-submit
SPARKPI_CLASS="org.apache.spark.examples.SparkPi"
DEPL_MODE="client"
PATH_SPARK_EXAMPLES_JAR=/opt/giotto/spark/examples/jars/spark-examples_2.12-3.0.0.jar


HADOOP_USER_NAME=hdfs $PATH_SPARK_SUBMIT --class $SPARKPI_CLASS --master yarn --deploy-mode $DEPL_MODE $PATH_SPARK_EXAMPLES_JAR $INPUT


echo $HADOOP_USER_NAME


echo "Il test 1 è completo con input inserito $INPUT"
