SHELL := /bin/bash

ISITO_VERSION ?= 1.13.3
ISTIO_ARCH ?= linux-amd64

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.gitops-1
MODULE ?= infrastructure
COMPONENT ?= kiali
TARGET ?= $(PROJECT).$(MODULE).$(COMPONENT)
KUBERNETES_NAMESPACE :=$(shell echo "$PROJECT" | sed 's/[^a-zA-Z0-9_-]/-/g' )

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

BUILD_DIR ?= ./build/

CP ?= cp -pv
MKDIR ?= mkdir -p
LN ?= ln
RM ?= rm
CURL ?= curl
KUBECTL ?= kubectl

all: kiali

.PHONY: clean kubernetes docker dist dep lib include distclean bin kiali

kubernetes: \
	$(BUILD_DIR)/$(TARGET)-kiali

kiali: \
	$(BUILD_DIR)/$(TARGET)-kiali

manifests/downloaded/kiali.yaml:
	@echo "### KUB / KIALI / DOWN 1 / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) manifests/downloaded/
	@$(CURL) 'https://raw.githubusercontent.com/istio/istio/release-$(ISTIO_VERSION)/samples/addons/kiali.yaml' > manifests/downloaded/kiali.yaml

manifests/downloaded/prometheus.yaml:
	@echo "### KUB / KIALI / DOWN 2 / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) manifests/downloaded/
	@$(CURL) 'https://raw.githubusercontent.com/istio/istio/release-$(ISTIO_VERSION)/samples/addons/prometheus.yaml' > manifests/downloaded/prometheus.yaml

manifests/downloaded/jaeger.yaml:
	@echo "### KUB / KIALI / DOWN 3 / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) manifests/downloaded/
	@$(CURL) 'https://raw.githubusercontent.com/istio/istio/release-$(ISTIO_VERSION)/samples/addons/jaeger.yaml' > manifests/downloaded/jaeger.yaml

$(BUILD_DIR)/$(TARGET)-kiali: manifests/downloaded/kiali.yaml \
	                      manifests/downloaded/prometheus.yaml \
	                      manifests/downloaded/jaeger.yaml
	@echo "### KUB / KIALI / DEPLOY / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(KUBECTL) apply -f manifests/downloaded/kiali.yaml
	@$(KUBECTL) apply -f manifests/downloaded/prometheus.yaml
	@$(KUBECTL) apply -f manifests/downloaded/jaeger.yaml
ls:

docker-ls:

dist:

docker: 

clean:
	@echo "### KUB / KIALI / CLEAN - $(PROJECT).$(MODULE).$(COMPONENT)"
	@if [[ -f "manifests/downloaded/kiali.yaml" ]] ; then kubectl delete -f manifests/downloaded/kiali.yaml 2>/dev/null || exit 0; fi
	@if [[ -f "manifests/downloaded/prometheus.yaml" ]] ; then kubectl delete -f manifests/downloaded/prometheus.yaml 2>/dev/null || exit 0; fi
	@if [[ -f "manifests/downloaded/jaeger.yaml" ]] ; then kubectl delete -f manifests/downloaded/jaeger.yaml 2>/dev/null || exit 0; fi
	@$(RM) -rf $(BUILD_DIR)
	@$(MKDIR) $(BUILD_DIR)
	@$(MKDIR) manifests/downloaded

docker-clean:

distclean:

docker-distclean: docker-clean

test:
	
docker-test:
