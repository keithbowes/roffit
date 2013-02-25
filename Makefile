# default installation directory
PREFIX=/usr/local
INSTALLDIR=$(PREFIX)/bin
MANDIR=$(DESTDIR)$(PREFIX)/share/man/man1

all:

install:
	install -m 755 roffit $(DESTDIR)$(INSTALLDIR)
	xz -kz9 roffit.1 && install -d -m 755 $(MANDIR) && install -m 644 roffit.1.xz $(MANDIR)
	rm roffit.1.xz

uninstall:
	rm -f $(DESTDIR)$(INSTALLDIR)/roffit
	rm -f $(MANDIR)/roffit.1.xz

test:
	@perl roffit --bare < testpage.1 > testpage.dump
	@if cmp testpage.dump testpage.output; then \
	  echo "SUCCESS"; \
	else \
	  echo "FAIL"; \
	fi
