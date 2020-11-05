cd /opt/mapreduce
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
#compile java
hadoop com.sun.tools.javac.Main WordCount.java
jar cf  wc.jar WordCount*.class
#run mapreduce
hadoop fs -rm -r -f /logcount/output
start_time=`date +%s`
hadoop jar wc.jar WordCount /logcount/target_file.txt /logcount/output && echo run time is $(expr `date +%s` - $start_time)s
hdfs dfs -get /logcount/output/part-r-00000 ./target_java.log