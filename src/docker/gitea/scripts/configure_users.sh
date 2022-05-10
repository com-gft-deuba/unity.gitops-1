#!/usr/bin/env bash

source /tmp/gitea/scripts/__functions.sh

echo "Configuring user gitops."

_curl_api "/api/v1/admin/users/gitops" PATCH -d "{ \"allow_create_organizastion\": true, \"allow_git_hook\": true, \"allow_import_local\": true, \"description\": \"$(date)\", \"source_id\": 0, \"login_name\": \"gitops\" }"
_curl_api "/api/v1/admin/users/gitops/keys" POST -d "{ \"key\": \"$( cat /tmp/gitea/secret/gitops.id_rsa.pub )\", \"read_only\": true, \"title\": \"Operations key\" }"

# _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-ms-random\", \"private\": false }"
# _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-ms-measure\", \"private\": false }"
# _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-common\", \"private\": false }"
# _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"angular-fe-weatherstation\", \"private\": false }"


exit 0
