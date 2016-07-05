#!/usr/bin/env bash

set -x -e

TEMP_DIR="/tmp"


ctx logger info "Starting spark workflow"

#function yum_install {
#    sudo yum install java-1.8.0-openjdk git -y
#    ctx logger info "Installed OpenJDK"
#}

#function apt_install {
    sudo add-apt-repository ppa:webupd8team/java -y
    sudo apt-get update
    sudo apt-get install default-jre default-jdk  git -y
    ctx logger info "OpenJDK Installed"
#}

# setting up scala
cd ${TEMP_DIR}
wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz
sudo tar xvf scala-2.11.8.tgz -C /usr/local
sudo cp -R /usr/local/scala-2.11.8 /usr/local/scala
echo "export SCALA_HOME=/usr/local/scala" | tee -a ~/.bashrc
ctx logger info "scala Installed"

# setting up spark
cd ${TEMP_DIR}
wget http://www-eu.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz
sudo tar xvf spark-1.6.1-bin-hadoop2.6.tgz -C /usr/local/
sudo cp -R /usr/local/spark-1.6.1-bin-hadoop2.6 /usr/local/spark
echo "export PATH=$SCALA_HOME/bin:$PATH" | tee -a ~/.bashrc
. ~/.bashrc

# If you download the source code from Apache spark org, and build with command
# sudo /usr/local/spark/sbt/sbt assembly

ctx logger info "spark Installed"

# adding hostname to /etc/hosts


ipaddr=$(hostname -I)
host=$(hostname)
echo "$ipaddr $host" >> /etc/hosts


ctx logger info "hostname added"

exit 0
