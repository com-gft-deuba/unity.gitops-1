SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.gitops-1

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

GO_COMPONENTS :=  ms-measure ms-random
ANGULAR_COMPONENTS := fe-weatherstation

DOCKER_REMOTE ?= europe-west3-docker.pkg.dev/ger-dbagntademo-sdb-001/project

all: docker

.PHONY: docker docker-clean clean docker-distclean distclean $(GO_COMPONENTS) $(ANGULAR_COMPONENTS) docker-ls ls docker-test test 

docker:
	@pwd
	@for dir in $(GO_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  ../go/$$dir docker ; \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir all ; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir all ; \
	done

docker-clean clean:
	@for dir in $(GO_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  ../go/$$dir docker-clean ; \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir clean ; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir clean ; \
	done

docker-distclean distclean:
	@for dir in $(GO_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C ../go/$$dir distclean ; \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C $$dir distclean ; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir distclean; \
	done
	@for image in $$( docker image ls --filter "label=PROJECT=$(PROJECT)" --format "{{.ID}}" ) ; do \
		for container in $$(docker container ls --filter "ancestor=$$image" --format "{{.ID}}" ) ; do \
			docker container stop --time 5 "$$container" ; \
		done ; \
		docker image rm -f $$image ; \
	done

push: docker-push

docker-push:
	@pwd
	@for dir in $(GO_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir docker-push ; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir docker-push ; \
	done

docker-ls ls:
	@for dir in $(GO_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir ls ; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir ls ; \
	done

docker-test test:
	@echo "GITHASH: $(GITHASH)"
	@for dir in $(COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C ../go/$$dir docker-test; \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
		make -C $$dir test; \
	done
	@for dir in $(ANGULAR_COMPONENTS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DOCKER_REMOTE="$(DOCKER_REMOTE)" \
		make -C  $$dir ; \
	done
