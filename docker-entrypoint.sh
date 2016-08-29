#!/usr/bin/env bash

set -e

if [[ $# != 2 ]]
then
  printf 'usage: docker run -p 6878:6878 -i -t alzadude/aceget <TORRENT|INFOHASH|PID|RAW|URL> <pid|url|etc>\n'
  exit 1
fi

# TODO if stdout is a tty (i.e. not piped, redirected), check that stdin is a tty (so user can use ctrl+c)

cleanup() {
  local _pid=$1
  printf "docker-entrypoint: sending TERM to pid %s\n" $_pid
  kill -TERM $_pid
}

trap 'cleanup $engine_pid' TERM EXIT
acestreamengine --client-console --bind-all --service-remote-access --log-file /var/log/acestreamengine.log &
engine_pid=$!
echo "docker-entrypoint: started acestreamengine with pid $engine_pid"

wait-for-it -t 10 localhost:62062

aceget localhost 62062 $1 $2

echo "docker-entrypoint: exited normally"
