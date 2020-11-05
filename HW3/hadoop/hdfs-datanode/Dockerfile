FROM hadoop-noconf

# Copy hadoop confs
#ADD hdfs-conf/hadoop-conf/ /opt/hadoop-2.7.3/etc/hadoop/

COPY hdfs-datanode/scripts /usr/bin/.

ENTRYPOINT ["/usr/bin/bootstrap.sh"]
