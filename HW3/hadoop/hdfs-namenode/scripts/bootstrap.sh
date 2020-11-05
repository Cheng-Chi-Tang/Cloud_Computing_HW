#!/bin/bash

# Start the SSH daemon
service ssh restart

# Setup password less ssh
sshpass -p screencast ssh-copy-id root@localhost

#check if hdfs has volumed data
#if yes, usr FIRST_CREATE flag to maintain don't format namenode and create more directory 

if [ -d "$VOLUME_DIR" ] && files=$(ls -qAL -- "$VOLUME_DIR") && [ ! -z "$files" ]; then
  FIRST_CREATE=0
  else
  FIRST_CREATE=1
fi

# Format the NameNode data directory
if [ "$FIRST_CREATE" -eq "1" ]; then
  echo "frsh start hdfs, formatting..."
  hdfs namenode -format -force
fi
  

# Start HDFS services
#WARNING:yarn not started since aws mem restriction!!!
start-dfs.sh
start-yarn.sh

# Wait for HDFS services to be up and running
sleep 5

#start job history server
mr-jobhistory-daemon.sh start historyserver


#make sparklog directory and create a tmp directory and make it accessible to everyone
if [ "$FIRST_CREATE" -eq "1" ]; then
  echo "creating dirs..."
  hdfs dfs -mkdir /spark-logs
  hdfs dfs -chmod -R 777 /spark-logs
  hdfs dfs -mkdir -p /tmp
  hdfs dfs -chmod -R 777 /tmp
  #make hive directory
  hdfs dfs -mkdir -p /user/hive/warehouse
  hdfs dfs -mkdir /tmp/hive
  hdfs dfs -mkdir /logcount
  hdfs dfs -chmod -R 777 /user/hive/warehouse
  hdfs dfs -chmod -R 777 /tmp/hive
  hdfs dfs -chmod -R 777 /logcount
  echo "required dirs created!"
fi

# send OK trigger to spark container
#echo "Done!" | netcat spark 7777 -q 1



#echo "namenode Done!" | netcat $HIVEMETASTORE 7778 -q 1
#echo "namenode Done!" | netcat 172.20.0.7 7778 -q 1
# Run in daemon mode, don't exit
while true; do
  sleep 100;
done
