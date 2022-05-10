SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.gitops-1
TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell ( git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

DIST_DIR ?= ../../../bin

LIBS := 
BINS := ms-random ms-measure 

LIBS_SUBDIRS := $(addprefix ./lib,$(LIBS))
BINS_SUBDIRS := $(addprefix ./,$(BINS))

SUBDIRS = $(LIBS_SUBDIRS) $(BINS_SUBDIRS)

all: dep lib bin

.PHONY: lib bin docker clean distclean dep include

lib:

include:

bin:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
	    make -C $$dir bin ; \
	done

dist:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir dist ; \
	done

dep:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir dep ; \
	done

docker:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir docker; \
	done

clean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir clean ; \
	done

distclean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir distclean ; \
	done

docker-clean:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir docker-clean; \
	done

docker-distclean:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
		make -C  $$dir docker-distclean; \
	done

ls:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
  		  make -C $$dir ls; \
	done

docker-ls:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
  		  make -C $$dir docker-ls; \
	done

test:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
  		  make -C $$dir test; \
	done

docker-test:
	@for dir in $(BINS_SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
	    DIST_DIR="$(DIST_DIR)" \
  		  make -C $$dir docker-test; \
	done
