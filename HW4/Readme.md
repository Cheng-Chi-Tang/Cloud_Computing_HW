Please add these files to the directory that you create in spark cluster (I use this one https://github.com/bitnami/bitnami-docker-spark). 

Set the path of data set file in each python file.

Then type:

	python yourPath/run-spark-ex.py

to reproduce the result in local.

Later, to use spark cluster, try to type:

	bin/spark-submit  --deploy-mode client  yourPath/logistic_regression.py yourPath/data_banknote_authentication.txt 50

where 50 means the number of iterations. An you will see the iteration process in the spark cluster.
