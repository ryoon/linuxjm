#
# Build macro for JM project.  If something don't work well,
# please refer the description in admin/JM-CVS/JM-CVS.sgml.
#
include ./JM.rules

#
# defs
#
MKRWWW=bin/mkmanweb.perl
MKPWWW=bin/mkpodweb.perl
MKDIST=bin/mkdist.perl
MKSPDIST=bin/mksplitdist.perl
CHKCVS=bin/chkcvs.sh

ROFFSRC=./manual
PODSRC=./pod
INFOSRC=./info

JMVER=0.5
JMRELEASE := $(shell env LANG=C date +"%Y%m%d")
DIST := man-pages-ja-$(JMRELEASE)

JMRPMDIST := jman_pages-$(JMVER)-$(JMRELEASE)
JMRPMSRC := $(TMPDIR)/$(DIST).tar.gz
JMRPMSPEC=jman_pages.spec
JMRPM_BUILD_ROOT=$(TMPDIR)/man-pages-ja-root

#
# global rules
#
periodic: chkcvs roff infoman html web cgi guide web-extra

all: periodic archive-install 

#
# update check for CVS checkout
#
chkcvs:
	$(CHKCVS)

stamp/cvs-release-modified stamp/cvs-status-modified: chkcvs

#
# roff tree
#
roff: stamp/www-roff-modified

stamp/www-roff-modified: stamp/cvs-status-modified
	@mkdir -p $(WWWROFF)
	$(RSYNC) -a --delete -v $(ROFFSRC)/ $(WWWROFF)
	@mkdir -p $(WWWPOD)
	$(RSYNC) -a --delete -v $(PODSRC)/ $(WWWPOD)
	touch $@

#
# html tree
#
html: stamp/www-html-modified

stamp/www-html-modified: stamp/cvs-release-modified
	-$(RM) -rf $(WWWHTML)
	mkdir -p $(WWWHTML)
	$(MKRWWW) $(ROFFSRC) $(WWWHTML) $(MAN2HTML)
	$(MKPWWW) $(PODSRC) $(WWWHTML) $(POD2HTML)
#	$(MAKE) -C $(INFOSRC) install
	# Remove temporary files generated by pod2html
	rm -f pod2htmd.tmp pod2htmi.tmp
	touch $@

#
# info tree
#
infoman: stamp/www-info-modified

stamp/www-info-modified: stamp/info-release-modified
	$(MAKE) -C $(INFOSRC) install
	touch $@

#
# web & cgi contents
#
web:
	$(MAKE) -C www/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT) WORKDIR=$(TMPDIR)\
		install

cgi:
	$(MAKE) -C admin/cgi/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		install

.PHONY:	guide
guide:
	$(MAKE) -C guide/ -f Makefile.venv-wrap install WWWROOT=$(WWWROOT) install

.PHONY:	web-extra
web-extra:
	rsync -av manual/LDP_man-pages/untrans.html $(WWWROOT)/LDP_untrans.html

#
# archive related rules
#
archive-install: stamp/latest-archive-modified
	-$(RM) www/man-pages-ja-*.tar.gz www/per-pkg/*.gz
	-$(RM) www/rpm/*.rpm
	cp $(TMPDIR)/$(DIST).tar.gz www/
	mkdir -p www/per-pkg
	cp $(TMPDIR)/man-pages-ja-*-$(JMRELEASE).tar.gz www/per-pkg
	mkdir -p www/rpm
	-cp $(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm www/rpm
	-cp $(RPMROOT)/SRPMS/$(JMRPMDIST).src.rpm www/rpm
	touch $<
	make -C www/ DATE=$(JMRELEASE)\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		download.html index.html
	make -C www/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		install

stamp/latest-archive-modified: tarball rpm

#
# tarball
#
tarball: $(TMPDIR)/$(DIST).tar.gz

$(TMPDIR)/$(DIST).tar.gz:
	$(MKDIST) . $(TMPDIR)/$(DIST) $(POD2MAN)
	$(MAKE) -f Makefile.dist install
	(cd $(TMPDIR); tar czf $(DIST).tar.gz $(DIST))
	$(MKSPDIST) $(TMPDIR)/$(DIST)
	touch stamp/latest-archive-modified

#
# rpm
#
rpm: $(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm

$(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm: $(JMRPMSRC)
ifdef NORPM
else
	mkdir -p $(RPMROOT)/SOURCES
	mkdir -p $(RPMROOT)/SPECS
	mkdir -p $(RPMROOT)/BUILD
	mkdir -p $(RPMROOT)/RPMS/noarch
	mkdir -p $(RPMROOT)/SRPMS
	mkdir -p $(RPMROOT)/db
	mkdir -p $(RPMROOT)/tmp
	cp $(JMRPMSRC) $(RPMROOT)/SOURCES/
	sed     -e "s/@@version@@/$(JMVER)/" \
		-e "s/@@release@@/$(JMRELEASE)/" \
		-e "s%@@buildroot@@%$(JMRPM_BUILD_ROOT)%" \
	    www/rpm/$(JMRPMSPEC) > $(RPMROOT)/SPECS/$(JMRPMSPEC)
	$(RPM) --dbpath $(RPMROOT)/db --rebuilddb
	$(RPMB) --define "buildroot $(JMRPM_BUILD_ROOT)" \
	    --dbpath $(RPMROOT)/db \
	    --define "_topdir $(RPMROOT)"  \
	    --define "_tmppath $(RPMROOT)/tmp"  \
	    --define "_sourcedir $(RPMROOT)/SOURCES" \
	    --define "_mandir /usr/share/man" -ba \
	    $(RPMROOT)/SPECS/$(JMRPMSPEC)
	touch stamp/latest-archive-modified
endif

#
# clean
#
clean:	tmpclean
	rm -f stamp/*-modified
	$(MAKE) -C admin/cgi/ clean
	$(MAKE) -C www/ clean
	$(MAKE) -f Makefile.dist clean

tmpclean:
	rm -rf $(TMPDIR)
	rm -rf $(JMRPM_BUILD_ROOT)
	rm -rf $(RPMROOT)/BUILD/$(DIST)
	for i in $(JMRPMSRC); do \
	    rm -f $(RPMROOT)/SOURCES/`basename $$i` ; \
	done

realclean:	clean
	$(RM) -rf $(WWWROOT)/*
	$(RM) -rf $(CGIROOT)/*
