#!/usr/bin/env bash

set -x -e

# run from the blueprint manager cli
cfy ssh
sudo yum install gcc python-devel -y

exit
