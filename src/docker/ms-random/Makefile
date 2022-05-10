SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.gitops-1
MODULE ?= backend
COMPONENT ?= ms-random
TARGET ?= $(PROJECT).$(MODULE).$(COMPONENT)

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

CP ?= cp -pv
MKDIR ?= mkdir -p
LN ?= ln
RM ?= rm

BUILD_DIR ?= ./build/

DOCKER_DIR   ?= $(BUILD_DIR)/docker
DOCKER_VARIANT ?= alpine
DOCKER_IMAGES:= with-content v1 v2 v3
DOCKER_REMOTE ?= europe-west3-docker.pkg.dev/ger-dbagntademo-sdb-001/project

all: docker

.PHONY: docker-clean clean docker-distclean distclean docker docker-ls ls docker-test test push docker-push

docker: ../../go/$(COMPONENT)/$(DOCKER_DIR)/$(TARGET)-$(DOCKER_VARIANT).iid \
	$(DOCKER_DIR)/$(TARGET)-with-content.iid \
	$(DOCKER_DIR)/$(TARGET)-v1.iid \
	$(DOCKER_DIR)/$(TARGET)-v2.iid \
	$(DOCKER_DIR)/$(TARGET)-v3.iid

docker-push: push

push:   $(DOCKER_DIR)/$(TARGET)-v1.iid \
	$(DOCKER_DIR)/$(TARGET)-v2.iid \
	$(DOCKER_DIR)/$(TARGET)-v3.iid
	@docker image tag "$(TARGET):v1" "$(DOCKER_REMOTE)/$(TARGET):v1"
	@docker image tag "$(TARGET):v2" "$(DOCKER_REMOTE)/$(TARGET):v2"
	@docker image tag "$(TARGET):v3" "$(DOCKER_REMOTE)/$(TARGET):v3"
	@docker image push "$(DOCKER_REMOTE)/$(TARGET):v1"
	@docker image push "$(DOCKER_REMOTE)/$(TARGET):v2"
	@docker image push "$(DOCKER_REMOTE)/$(TARGET):v3"

../../go/$(COMPONENT)/$(DOCKER_DIR)/$(TARGET)-$(DOCKER_VARIANT).iid:
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	COMPONENT="$(COMPONENT)" \
	MODULE="$(MODULE)" \
	make -C ../../go/$(COMPONENT) docker ; \


$(DOCKER_DIR)/$(TARGET)-with-content.iid: Dockerfile-with-content ../../go/$(COMPONENT)/$(DOCKER_DIR)/$(TARGET)-$(DOCKER_VARIANT).iid
	@echo "### DOCK/DOCK  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT) - with-content"
	@$(MKDIR) "$(DOCKER_DIR)"
	@if [ -f "$(DOCKER_DIR)/$(TARGET)-with-content.iid" ] ; then i=$$( cat "$(DOCKER_DIR)/$(TARGET)-with-content.iid" ); docker image rm -f $$i ; rm -f "$(DOCKER_DIR)/$(TARGET)-with-content.iid"  2>/dev/null ; fi
	@docker image build -f ./Dockerfile-with-content \
	  --progress=plain \
	  --build-arg GITHASH="$(_GITHASH)" \
	  --build-arg COMPONENT=$(COMPONENT) \
	  --build-arg MODULE=$(MODULE) \
	  --build-arg PROJECT=$(PROJECT) \
	  --build-arg CUSTOMER=$(CUSTOMER) \
	  --tag $(TARGET):with-content \
	  --label GITHASH="$(_GITHASH)" \
	  --label COMPONENT=$(COMPONENT) \
	  --label MODULE=$(MODULE) \
	  --label PROJECT=$(PROJECT) \
	  --label CUSTOMER=$(CUSTOMER) \
	  --iidfile "$(DOCKER_DIR)/$(TARGET)-with-content.iid" \
	  .

$(DOCKER_DIR)/$(TARGET)-v1.iid: Dockerfile-v1 
	@echo "### DOCK/DOCK  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT) - v1"
	@$(MKDIR) "$(DOCKER_DIR)"
	@if [ -f "$(DOCKER_DIR)/$(TARGET)-v1.iid" ] ; then i=$$( cat "$(DOCKER_DIR)/$(TARGET)-v1.iid" ); docker image rm -f $$i ; rm -f "$(DOCKER_DIR)/$(TARGET)-v1.iid"  2>/dev/null ; fi
	@docker image build -f ./Dockerfile-v1 \
	  --progress=plain \
	  --build-arg GITHASH="$(_GITHASH)" \
	  --build-arg COMPONENT=$(COMPONENT) \
	  --build-arg MODULE=$(MODULE) \
	  --build-arg PROJECT=$(PROJECT) \
	  --build-arg CUSTOMER=$(CUSTOMER) \
	  --tag $(TARGET):v1 \
	  --label GITHASH="$(_GITHASH)" \
	  --label COMPONENT=$(COMPONENT) \
	  --label MODULE=$(MODULE) \
	  --label PROJECT=$(PROJECT) \
	  --label CUSTOMER=$(CUSTOMER) \
	  --iidfile "$(DOCKER_DIR)/$(TARGET)-v1.iid" \
	  .

$(DOCKER_DIR)/$(TARGET)-v2.iid: Dockerfile-v2 
	@echo "### DOCK/DOCK  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT) - v2"
	@$(MKDIR) "$(DOCKER_DIR)"
	@if [ -f "$(DOCKER_DIR)/$(TARGET)-v2.iid" ] ; then i=$$( cat "$(DOCKER_DIR)/$(TARGET)-v2.iid" ); docker image rm -f $$i ; rm -f "$(DOCKER_DIR)/$(TARGET)-v2.iid"  2>/dev/null ; fi
	@docker image build -f ./Dockerfile-v2 \
	  --progress=plain \
	  --build-arg GITHASH="$(_GITHASH)" \
	  --build-arg COMPONENT=$(COMPONENT) \
	  --build-arg MODULE=$(MODULE) \
	  --build-arg PROJECT=$(PROJECT) \
	  --build-arg CUSTOMER=$(CUSTOMER) \
	  --tag $(TARGET):v2 \
	  --label GITHASH="$(_GITHASH)" \
	  --label COMPONENT=$(COMPONENT) \
	  --label MODULE=$(MODULE) \
	  --label PROJECT=$(PROJECT) \
	  --label CUSTOMER=$(CUSTOMER) \
	  --iidfile "$(DOCKER_DIR)/$(TARGET)-v2.iid" \
	  .
$(DOCKER_DIR)/$(TARGET)-v3.iid: Dockerfile-v3 
	@echo "### DOCK/DOCK  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT) - v3"
	@$(MKDIR) "$(DOCKER_DIR)"
	@if [ -f "$(DOCKER_DIR)/$(TARGET)-v3.iid" ] ; then i=$$( cat "$(DOCKER_DIR)/$(TARGET)-v3.iid" ); docker image rm -f $$i ; rm -f "$(DOCKER_DIR)/$(TARGET)-v3.iid"  2>/dev/null ; fi
	@docker image build -f ./Dockerfile-v3 \
	  --progress=plain \
	  --build-arg GITHASH="$(_GITHASH)" \
	  --build-arg COMPONENT=$(COMPONENT) \
	  --build-arg MODULE=$(MODULE) \
	  --build-arg PROJECT=$(PROJECT) \
	  --build-arg CUSTOMER=$(CUSTOMER) \
	  --tag $(TARGET):v3 \
	  --label GITHASH="$(_GITHASH)" \
	  --label COMPONENT=$(COMPONENT) \
	  --label MODULE=$(MODULE) \
	  --label PROJECT=$(PROJECT) \
	  --label CUSTOMER=$(CUSTOMER) \
	  --iidfile "$(DOCKER_DIR)/$(TARGET)-v3.iid" \
	  .

docker-clean clean:
	@echo "### DOCK/DOCLN $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT)"
	@while read img imgname ; do \
	    while read id state name image ; do \
	        printf 'C %-7s %-10s %-20s %s\n' "$$id" "$$state" "$$name" "$$image" ; \
	        echo docker container stop --time 5 "$$id" ; \
	    done < <( docker container ls --filter "ancestor=$$img" --format='{{.ID}} {{.State}} {{.Names}} {{.Image}}'  | sort ) ; \
	    echo "I $$img $$imgname" ; \
	    echo docker image rm -f $$img ; \
	done < <(for v in $(DOCKER_IMAGES) ; do docker image ls --filter "label=PROJECT=$(PROJECT)" --filter "label=COMPONENT=$(COMPONENT)" --filter "label=MODULE=$(MODULE)" --filter "label=CUSTOMER=$(CUSTOMER)" --format='{{.ID}} {{.Repository}}:{{.Tag}}' "$(TARGET):$$v" ; done | sort -k 2) 
	@for v in $(DOCKER_IMAGES) ; do \
	    if [ -f "$(DOCKER_DIR)/$(TARGET)-$$v.iid" ] ; then \
	        i=$$( cat "$(DOCKER_DIR)/$(TARGET)-$$v.iid" ) ; \
	        docker image rm -f $$i 2>/dev/null ; \
	        rm -f "$(DOCKER_DIR)/$(TARGET)-$$v.iid"  2>/dev/null ; \
	    fi ; \
	done
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	COMPONENT="$(COMPONENT)" \
	MODULE="$(MODULE)" \
	make -C ../../go/$(COMPONENT) docker-clean

docker-distclean distclean: clean
	@echo "### DOCK/DDICL $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT)"
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	COMPONENT="$(COMPONENT)" \
	MODULE="$(MODULE)" \
	make -C ../../go/$(COMPONENT) docker-distclean

docker-ls ls:
	@echo "### DOCK/DOLS  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT)"
	@while read img imgname ; do \
		echo "I $$img $$imgname" ; \
		while read id state name image ; do \
			printf 'C %-7s %-10s %-20s %s\n' "$$id" "$$state" "$$name" "$$image" ; \
		done < <( docker container ls --filter "ancestor=$$img" --format='{{.ID}} {{.State}} {{.Names}} {{.Image}}'  | sort ) ; \
	done < <(docker image ls --filter "label=PROJECT=$(PROJECT)" --filter "label=COMPONENT=$(COMPONENT)" --format='{{.ID}} {{.Repository}}:{{.Tag}}' | sort -k 2)

docker-test test:
	@echo "### DOCK/TEST  $(PROJECT).$(MODULE).$(COMPONENT) - $(DOCKER_VARIANT)"
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	COMPONENT="$(COMPONENT)" \
	MODULE="$(MODULE)" \
	make -C ../../go/$(COMPONENT) docker-test
	@echo "GITHASH: $(_GITHASH)"
	
-include $(DEPS)
