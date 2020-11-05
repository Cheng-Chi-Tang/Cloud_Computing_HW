FROM hadoop-spark2.7-noconf

# Copy hadoop confs
ADD hadoop-conf/ /opt/hadoop-2.7.3/etc/hadoop/

#connect spark with hadoop
ENV LD_LIBRARY_PATH="${HADOOP_HOME}/lib/native:$LD_LIBRARY_PATH"
COPY spark-conf/spark-defaults.conf /opt/spark-2.4.0-bin-hadoop2.7/conf
COPY spark-conf/spark-env.sh /opt/spark-2.4.0-bin-hadoop2.7/conf