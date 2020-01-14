################################################################################
#
# perl-list-moreutils
#
################################################################################

PERL_LIST_MOREUTILS_VERSION = 0.428
PERL_LIST_MOREUTILS_SOURCE = List-MoreUtils-$(PERL_LIST_MOREUTILS_VERSION).tar.gz
PERL_LIST_MOREUTILS_SITE = http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK
PERL_LIST_MOREUTILS_LICENSE = Apache
PERL_LIST_MOREUTILS_LICENSE_FILES = LICENSE
PERL_LIST_MOREUTILS_DISTNAME = perl-list-moreutils

$(eval $(perl-package))
