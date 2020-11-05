
hadoop fs -rm -r -f /logcount/output

start_time=`date +%s`
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
	-file /opt/mapreduce/mapper.py -mapper /opt/mapreduce/mapper.py \
	-file /opt/mapreduce/reducer.py -reducer /opt/mapreduce/reducer.py \
	-input "/logcount/target_file.txt" \
	-output "/logcount/output" && echo run time is $(expr `date +%s` - $start_time)s
hdfs dfs -get /logcount/output/part-00000 /opt/mapreduce/target_python.log