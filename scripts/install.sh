#!/usr/bin/env bash

set -x -e

TEMP_DIR="/tmp"

ctx logger info "Starting spark workflow"

# adding hostname to /etc/hosts
ipaddr=$(hostname -I)
host=$(hostname)
echo "$ipaddr $host" | sudo tee -a /etc/hosts
ctx logger info "hostname added"

# verify os type
function install_java_per_os {
    local yum_cmd=$(which yum)
    local apt_get_cmd=$(which apt-get)

    if [[ ! -z $yum_cmd ]]; then
        sudo yum -y -q install java-1.8.0-openjdk-devel
        ctx logger info "OpenJDK Installed centos"
    elif [[ ! -z $apt_get_cmd ]]; then
         sudo add-apt-repository -y ppa:openjdk-r/ppa
         sudo apt-get update
         sudo apt-get -qq -y --no-upgrade install openjdk-8-jdk
         ctx logger info "OpenJDK Installed ubuntu"
    else
        ctx logger error "This OS is not supported."
        exit 1
    fi
}

ctx logger info "Starting spark workflow"

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

install_java_per_os

ctx logger info "spark Installed"

exit 0

