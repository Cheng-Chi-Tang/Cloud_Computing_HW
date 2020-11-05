My Step1:
Enter my hadoop directory, and type:

	docker-compose up
  
to build the files and run the containers for hadoop

My Step2:
	Enter the /opt/mapreduce, and copy paste the log files and python files from local computer, here I have used volume to synchronize (hadoop/mapreduce : /opt/mapreduce).

My Step3:
Execute the containers and remember to copy the log file into hadoop cluster, we can type:
  
	hdfs dfs -copyFromLocal ./target_file.txt /logcount/target_file.txt

My Step4:
Write down the correct shell file, I call it execPython.sh and type: 
	
	./execPython

int /opt/mapreduce

My Step5:
It will generate the right file called target_python.log

My Step6:
The same as before. Write down the correct shell file for java, I call it execJava.sh and type: 

	./execJava

My Step7:
It will generate the right file called target_java.log
