#!/usr/bin/env bash

source /tmp/gitea/scripts/__functions.sh

tries=1
max_tries=10

while sleep 1 ; do

  echo "Checking if gitea is up (try $tries of $max_tries)."
  set +e
  _curl_quiet http://localhost:30000 > /dev/null 2>&1
  status=$?
  set -e

  if [[ $status -eq 0 ]] ; then break ; fi

  tries=$(( tries + 1 ))

  if [[ $tries -le $max_tries ]] ; then  continue ; fi
  
  echo "ERROR! Gitea did not come up in the expected time."
  exit 1

done

exit 0
