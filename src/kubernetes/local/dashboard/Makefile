SHELL := /bin/bash

DASBOARD_VERSION ?= 2.5.1

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.gitops-1
MODULE ?= infrastructure
COMPONENT ?= dashboard
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
CAT ?= cat

all: dashboard

.PHONY: clean kubernetes docker dist dep lib include distclean bin dashboard

kubernetes: \
	$(BUILD_DIR)/$(TARGET)-dashboard

dashboard: \
	$(BUILD_DIR)/$(TARGET)-dashboard

manifests/downloaded/kubernetes-dashboard.yaml:
	@echo "### KUB / DASH  / DOWN 1 / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) manifests/downloaded/
	@$(CURL) https://raw.githubusercontent.com/kubernetes/dashboard/v$(DASHBOARD_VERSION)/aio/deploy/recommended.yaml > "$@"

$(BUILD_DIR)/$(TARGET)-dashboard: manifests/downloaded/kubernetes-dashboard.yaml \
	                                     manifests/kubernetes-dashboard-user.yaml
	@echo "### KUB / DASH  / DEPLOY / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) "$(BUILD_DIR)"
	@$(KUBECTL) apply -f manifests/downloaded/kubernetes-dashboard.yaml
	@$(KUBECTL) apply -f manifests/kubernetes-dashboard-user.yaml
	@$(KUBECTL) -n kubernetes-dashboard get secret $$(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" > kubernetes-token.txt
	@echo ; echo -n "TOKEN : " ; $(CAT) kubernetes-token.txt ; echo


ls:

docker-ls:

dist:

docker: 

clean:
	@echo "### KUB / DASH  / CLEAN  / $(PROJECT).$(MODULE).$(COMPONENT)"
	@if [[ -f "manifests/kubernetes-dashboard-user.yaml" ]] ; then kubectl delete -f manifests/kubernetes-dashboard-user.yaml 2>/dev/null || exit 0; fi
	@if [[ -f "manifests/downloaded/kubernetes-dashboard.yaml" ]] ; then kubectl delete -f manifests/downloaded/kubernetes-dashboard.yaml 2>/dev/null || exit 0; fi
	@$(RM) -rf $(BUILD_DIR)
	@$(MKDIR) $(BUILD_DIR)
	@$(MKDIR) manifests/downloaded

docker-clean:

distclean:

docker-distclean: docker-clean

test:
	
docker-test:
