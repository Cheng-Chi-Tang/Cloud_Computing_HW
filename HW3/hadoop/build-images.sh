#!/bin/bash
########################################################################
# Script to build all required images for running HDFS and Spark clusters
# Usage:
# <HOME>/build-images.sh [scratch]
########################################################################
# Options argument scratch for deleting existing images and building the images from scratch
if [ "$1" == scratch ]; then
  docker rmi -f ubuntu-preprocess hadoop-noconf hive-noconf spark-noconf hdfs-namenode hdfs-datanode spark-master hive
fi
########################################################################
#TODO: 
#change --build-arg flag with current hadoop/spark/hive version name(must be the full name of binary file!!)
#check binary file source in hadoop-noconf, spark-noconf, hive-noconf 
########################################################################
#build/rebuild image
docker build -t ubuntu-preprocess ./preprocess/
docker build -t hadoop-noconf \
--build-arg HADOOP_HOME=/opt/hadoop-2.7.3 \
./hadoop-noconf/

#docker build -t hive-noconf \
#--build-arg HIVE_HOME=/opt/apache-hive-2.3.4-bin \
#--build-arg SPARK_HOME=/opt/spark-2.4.0-bin-hadoop2.7 \
#./hive-noconf/


#docker build -t spark-noconf \
#--build-arg SPARK_HOME=/opt/spark-2.4.0-bin-hadoop2.7 ./spark-noconf/

