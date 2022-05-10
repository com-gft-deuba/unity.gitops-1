#!/usr/bin/env bash

source /tmp/gitea/scripts/__functions.sh

echo "Configuring repos."

mkdir -p ~/.ssh
ssh-keyscan localhost > ~/.ssh/known_hosts
cat > ~/.ssh/config <<EOT
Host *
  IdentityFile /tmp/gitea/secret/gitops.id_rsa
EOT
chmod -R og-rwx ~/.ssh

(
  _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-ms-random\", \"private\": false }"
  cd /tmp/gitea/repo/go-ms-random.git 
  git remote add gitea git@localhost:gitops/go-ms-random
  git push gitea master
  git push gitea --tags
)

(
  _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-ms-measure\", \"private\": false }"
  cd /tmp/gitea/repo/go-ms-measure.git 
  git remote add gitea git@localhost:gitops/go-ms-measure
  git push gitea master
  git push gitea --tags
)
(
  _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"go-common\", \"private\": false }"
  cd /tmp/gitea/repo/go-common.git 
  git remote add gitea git@localhost:gitops/go-common
  netstat -tulpen
  git push gitea --tags
)
(
  _curl_api "/api/v1/admin/users/gitops/repos" POST -d "{ \"auto_init\": false, \"default_branch\": \"master\", \"name\": \"angular-fe-weatherstation\", \"private\": false }"
  cd /tmp/gitea/repo/angular-fe-weatherstation.git 
  git remote add gitea git@localhost:gitops/angular-fe-weatherstation
  git push gitea master
  git push gitea --tags
)
exit 0
