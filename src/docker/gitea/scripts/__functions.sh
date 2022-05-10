set -e

read GITEA_TOKEN < <(cat /tmp/gitea/secret/access_token.gitea)

function fix_url() {
  local url="$1" ; shift
  local prefix=""
  local host
  local path
  local query

  if [[ "${url:0:4}" == "http" ]] ; then

    read prefix url < <( echo "$url" | sed 's%^\(https*://\)%\1 %' ) 
    read host path < <( echo "$url" | sed 's%^\([^/?]*\)%\1 %' ) 

  else

    path="$url"
    prefix="http://"
    host="localhost:30000"

  fi

  if [[ "${path:0:1}" == "/" ]] ; then

    read path query < <( echo "$path" | sed 's/?/ /' )

  elif [[ "${path:0:1}" == "?" ]] ; then

    query="$path"
    path=""

  fi

  url="$prefix$host$path$query"
  echo -n "$url"

  return
}

function __curl() {
  local url="$1" ; shift

  url=$( fix_url "$url" )

  if [[ $# -gt 0 ]] ; then

    curl --insecure --connect-timeout 5   \
      --silent \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -H "Authorization: token $GITEA_TOKEN" \
      "$@" \
      "$url"

  else

    curl --insecure --connect-timeout 5   \
      --silent \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -H "Authorization: token $GITEA_TOKEN" \
      "$url"

  fi

}

function _curl_quiet() {
  local url="$1" ; shift

   __curl "$url" "$@" --fail-early --silent --fail  

}

function _curl() {
  local url="$1" ; shift

  url=$( fix_url "$url" )
  __curl "$url" "$@"
}

function _curl_api() {
  local url="$1" ; shift
  local op="$1" ; shift

  url=$( fix_url "$url" )

  if [[ -z "$op" ]] ; then op="GET" ; fi

  __curl "$url" -X "$op" "$@" 
}
