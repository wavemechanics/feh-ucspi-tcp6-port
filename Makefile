# $FreeBSD$

PORTNAME=	feh-ucspi-tcp6
DISTVERSION=	1.11.4
CATEGORIES=	sysutils net
DISTNAME=	ucspi-tcp6-${DISTVERSION}
MASTER_SITES=	https://www.fehcom.de/ipnet/ucspi-tcp6/
EXTRACT_SUFX=   .tgz

BUILD_DEPENDS=	fehQlibs>=14:sysutils/fehQlibs

WRKSRC=		${WRKDIR}/net/ucspi-tcp6/${DISTNAME}

MAINTAINER=	dl-ports@perfec.to
COMMENT=	Command line tools for building TCPv6 client-server applications
LICENSE=	PD
LICENSE_FILE=	${WRKSRC}/doc/LICENSE

PROGRAMS=	addcr \
		argv0 \
		delcr \
		fixcrio \
		mconnect-io \
		rblsmtpd \
		recordio \
		tcpclient \
		tcprules \
		tcprulescheck \
		tcpserver

SCRIPTS=	date@ \
		finger@ \
		http@ \
		mconnect \
		tcpcat \
		who@

MAN_FILES=	addcr.1 \
		argv0.1 \
		date@.1 \
		delcr.1 \
		finger@.1 \
		fixcrio.1 \
		http@.1 \
		mconnect.1 \
		rblsmtpd.1 \
		recordio.1 \
		tcpcat.1 \
		tcpclient.1 \
		tcprules.1 \
		tcprulescheck.1 \
		tcpserver.1 \
		who@.1

do-configure:
	${ECHO_CMD} cc -O2 -g -Wall -I'${PREFIX}'/include > ${WRKSRC}/conf-cc
	${ECHO_CMD} '${PREFIX}' > ${WRKSRC}/conf-home
	${ECHO_CMD} cc -s -L'${PREFIX}'/lib > ${WRKSRC}/conf-ld
	${ECHO_CMD} '${PREFIX}/man' > ${WRKSRC}/conf-man
	${ECHO_CMD} '${PREFIX}' > ${WRKSRC}/conf-qlibs

do-build:
	cd ${WRKSRC} && package/compile

do-install:
.for file_name in ${PROGRAMS}
	${INSTALL_PROGRAM} ${WRKSRC}/command/${file_name} ${STAGEDIR}${PREFIX}/bin
.endfor
.for file_name in ${SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/command/${file_name} ${STAGEDIR}${PREFIX}/bin
.endfor
.for file_name in ${MAN_FILES}
	${INSTALL_MAN} ${WRKSRC}/man/${file_name} ${STAGEDIR}${PREFIX}/man/man1
.endfor

.include <bsd.port.mk>
