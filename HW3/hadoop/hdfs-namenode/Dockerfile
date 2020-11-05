FROM hadoop-noconf


# Copy hadoop confs
ADD hdfs-conf/hadoop-conf/ ${HADOOP_HOME}/etc/hadoop/

COPY hdfs-namenode/scripts /usr/bin/.
COPY hdfs-namenode/slaves ${HADOOP_HOME}/etc/hadoop/
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
