FROM ubuntu-preprocess
# Download Hadoop package
ADD https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz /tmp/

# Download Spark package
#ADD http://ftp.mirror.tw/pub/apache/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz /tmp/

#add hadoop/spark from local
#COPY hadoop-2.7.3.tar.gz /tmp/

# Create /opt directory
RUN mkdir -p /opt/
# Unpack hadoop/spark into /opt/ and set HADOOP_HOME
RUN tar -xzf /tmp/hadoop-2.7.3.tar.gz	 -C /opt/





# Set Hadoop sepcific environment variables
ARG HADOOP_HOME
ENV HADOOP_HOME=${HADOOP_HOME}
ENV HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
ENV HADOOP_LIBEXEC_DIR="${HADOOP_HOME}/libexec"
ENV YARN_HOME="${HADOOP_HOME}"
ENV LD_LIBRARY_PATH="${HADOOP_HOME}/lib/native:$LD_LIBRARY_PATH"
ENV HADOOP_CLASSPATH="${JAVA_HOME}/lib/tools.jar"
RUN sed -i 's/export JAVA_HOME=${JAVA_HOME}/export JAVA_HOME=\/usr\/lib\/jvm\/java-8-openjdk-amd64/' /opt/hadoop-2.7.3/etc/hadoop/hadoop-env.sh

RUN mkdir -p /opt/data/apps/tmp \
&& mkdir -p /opt/data/apps/dfs/name \
&& mkdir -p /opt/data/apps/dfs/data



ENV PATH $PATH:${HADOOP_HOME}/sbin/:${HADOOP_HOME}/bin

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088 10020 19888
#Other ports
EXPOSE 49707 2122

