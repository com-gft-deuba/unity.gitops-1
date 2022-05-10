SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.gitops-1
MODULE ?= infrastructure
COMPONENT ?= step-3
TARGET ?= $(PROJECT).$(MODULE).$(COMPONENT)
KUBERNETES_NAMESPACE :=$(shell echo "$$PROJECT" | sed 's/[^a-zA-Z0-9_-]/-/g' )

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell ( git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

all: 

.PHONY: lib bin docker clean distclean dep include

lib:

include:

bin:

dist:

dep:

docker:

kubernetes: 

ls:
	@echo "### KUB / LS    $(KUBERNETES_NAMESPACE) - step-3"
	@for o in $$( kubectl api-resources --namespaced=true --verbs=delete -o name | sort ) ; do \
	  kubectl get -n $(KUBERNETES_NAMESPACE) "$$o" 2>/dev/null | sed -e '1i\'$$'\n'"    $$o" -e 's/^/        /' ; \
	done

clean: clean-ns
	@echo "### KUB / CLEAN $(KUBERNETES_NAMESPACE) - step-3"
	@CMD="" ; \
	while read f ; do \
	    CMD="$$CMD -f $$f" ; \
	done < <( find . -type f -not -name "*-namespace*" \( -name "*.yml" -o -name "*.yaml" \) ) ; \
	kubectl delete $$CMD 2>/dev/null || exit 0

clean-ns:
	@echo "### KUB / NSCLN $(KUBERNETES_NAMESPACE) - step-3"
	@kubectl delete namespace "$(KUBERNETES_NAMESPACE)" 2>/dev/null || exit 0
	@kubectl delete -f ../common/  2>/dev/null || exit 0

distclean: 
	@echo "### KUB / DCLN  $(KUBERNETES_NAMESPACE) - step-3"
	@CMD="" ; \
	while read f ; do \
	    CMD="$$CMD -f $$f" ; \
	done < <( find . -type f  \( -name "*.yml" -o -name "*.yaml" \) ) ; \
	kubectl delete $$CMD 2>/dev/null || exit 0
	@kubectl delete namespace $(KUBERNETES_NAMESPACE) 2> /dev/null || exit 0
	@kubectl delete -f ../common/ 2>/dev/null || exit 0

docker-clean:

docker-distclean:

ls:

docker-ls:

test:

docker-test:

