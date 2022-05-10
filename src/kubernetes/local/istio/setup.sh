COMPONENT=istio
source ../../../../setup.sh
export KUBERNETES_NAMESPACE="${KUBERNETES_BASE_NAMESPACE}"

export PS1='\[\e]0;\[\033[00;34m\]$(nice_path "\w")\[\033[00m\] $(if [[ $? == 0 ]]; then echo -en "\[\033[00;32m\]✓\[\033[00m\]"; else echo -en "\[\033[00;31m\]✗\[\033[00m\]"; fi) \$ '

# export ISTIO_VERSION="1.13.3"
# export ISTIO_ARCH="linux-amd64"
# wget -o "istio-${ISITIO_VERSION}-${ISTIO_ARCH}.tgz" "https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${ISTIO_ARCH}.tar.gz"
