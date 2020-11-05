#!/bin/bash

# Start the SSH daemon
service ssh restart

# Setup password less ssh
sshpass -p screencast ssh-copy-id root@localhost



#copy config from namenode
rsync -avhe ssh root@hdfs-namenode:/$HADOOP_HOME/etc/hadoop/*-site.xml /$HADOOP_HOME/etc/hadoop/

# Start Datanode
#hadoop-daemon.sh start datanode
#yarn-daemons.sh start nodemanager

# Run in daemon mode, don't exit
while true; do
  sleep 100;
done
