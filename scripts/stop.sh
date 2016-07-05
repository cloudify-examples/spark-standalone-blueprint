#!/usr/bin/env bash

set -x -e

PID=$(ctx instance runtime_properties pid)

kill -9 ${PID}

ctx logger info "Sucessfully stopped spark (${PID})"

exit 0

