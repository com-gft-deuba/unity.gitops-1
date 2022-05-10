SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.gitops-1
TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

SUBDIRS := go docker

.PHONY : all clean distclean lib bin dep include docker test

all:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir ; \
	done

clean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir clean ; \
	done

docker-clean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir docker-clean ; \
	done

docker:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir docker ; \
	done

distclean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir distclean ; \
	done

docker-distclean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C  $$dir docker-distclean ; \
	done

ls:
	@echo "GITHASH: $(GITHASH)"
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C $$dir ls; \
	done

docker-ls:
	@echo "GITHASH: $(GITHASH)"
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C $$dir docker-ls; \
	done
test:
	@echo "GITHASH: $(GITHASH)"
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C $$dir test; \
	done

docker-test:
	@echo "GITHASH: $(GITHASH)"
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    PROJECT="$(PROJECT)" \
	    CUSTOMER="$(CUSTOMER)" \
		make -C $$dir docker-test; \
	done
