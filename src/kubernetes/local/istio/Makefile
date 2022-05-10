SHELL := /bin/bash

ISTIO_VERSION ?= 1.13.3
ISTIO_ARCH ?= linux-amd64

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.gitops-1
MODULE ?= infrastructure
COMPONENT ?= istio
TARGET ?= $(PROJECT).$(MODULE).$(COMPONENT)
KUBERNETES_NAMESPACE :=$(shell echo "$PROJECT" | sed 's/[^a-zA-Z0-9_-]/-/g' )

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

BUILD_DIR ?= ./build/

CD ?= cd
CP ?= cp -pv
MV ?= mv
MKDIR ?= mkdir -p
LN ?= ln
RM ?= rm
TAR ?= tar
WGET ?= wget

all: istio

.PHONY: clean istio dist dep lib include distclean bin

istio: $(BUILD_DIR)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH)

downloaded/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz:
	@echo "### KUB / ISTIO / DOWN 1 / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) -p downloaded/
	@$(WGET) -O "downloaded/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" "https://github.com/istio/istio/releases/download/$(ISTIO_VERSION)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" 

$(BUILD_DIR)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH): downloaded/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz
	@echo "### KUB / ISTIO / DEPLOY / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) "$(BUILD_DIR)"
	@$(MKDIR) "$(BUILD_DIR)/tmp"
	@$(CD) "$(BUILD_DIR)/tmp" && $(TAR) xzvf "../../downloaded/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" "istio-$(ISTIO_VERSION)/bin/istioctl"
	@$(MV) "$(BUILD_DIR)/tmp/istio-$(ISTIO_VERSION)/bin/istioctl" "$(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)"
	@$(RM) -rf "$(BUILD_DIR)/tmp"
	@$(RM) -f "$(BUILD_DIR)/istioctl"
	@$(LN) -s "istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)" "$(BUILD_DIR)/istioctl"
	@"$(BUILD_DIR)/istioctl" install --set profile=demo -y

ls:

docker-ls:

dist:

docker: 

clean:
	@echo "### KUB / ISTIO / CLEAN  / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(RM) -rf $(BUILD_DIR)
	@$(MKDIR) $(BUILD_DIR)

docker-clean:

distclean:

docker-distclean: docker-clean

test:
	
docker-test:
