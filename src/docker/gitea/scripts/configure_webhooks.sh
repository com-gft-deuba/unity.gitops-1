#!/usr/bin/env bash

source /tmp/gitea/scripts/__functions.sh

echo "Configure webhooks."


_curl_api "/api/v1/repos/gitops/go-ms-measure/hooks" POST -d "{
    \"type\": \"gogs\",
    \"config\": {
      \"content_type\": \"json\",
      \"url\": \"http://argocd/api/webhook\"
    },
    \"events\": [
      \"release\"
    ],
    \"active\": true,
    \"branch_filter\": \"*\"
  }"
