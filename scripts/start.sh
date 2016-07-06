#!/usr/bin/env bash

set -x -e

source ~/.bashrc
cd $SPARK_HOME

# to start the spark-shell ssh to the instance and type at the shell:
# /usr/local/spark/bin/spark-shell

# to start spark streaming in background:
# nohup spark-submit <parameters> 2>&1 < /dev/null &
/usr/local/spark/bin/spark-shell

