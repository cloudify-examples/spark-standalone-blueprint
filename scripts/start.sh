#!/usr/bin/env bash

set -x -e

source ~/.bashrc
cd $SPARK_HOME
/usr/local/spark/bin/spark-shell
