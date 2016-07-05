#!/usr/bin/env bash

<<<<<<< HEAD
set -x -e

PID=$(ctx instance runtime_properties pid)

kill -9 ${PID}

ctx logger info "Sucessfully stopped spark (${PID})"

exit 0
=======
#set -x -e

#PID=$(ctx instance runtime_properties pid)

#kill -9 ${PID}

#ctx logger info "Sucessfully stopped spark (${PID})"

# sudo service spark-worker stop
# sudo service spark-master stop

exit 0
>>>>>>> 7e9521c13d46bc8f3bcfa6552d422ee241a08648
