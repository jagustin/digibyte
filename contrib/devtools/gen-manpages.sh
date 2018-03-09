#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

DIGIBYTED=${DIGIBYTED:-$SRCDIR/lekcoind}
DIGIBYTECLI=${DIGIBYTECLI:-$SRCDIR/lekcoin-cli}
DIGIBYTETX=${DIGIBYTETX:-$SRCDIR/lekcoin-tx}
DIGIBYTEQT=${DIGIBYTEQT:-$SRCDIR/qt/lekcoin-qt}

[ ! -x $DIGIBYTED ] && echo "$DIGIBYTED not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
LEKVER=($($DIGIBYTECLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for lekcoind if --version-string is not set,
# but has different outcomes for lekcoin-qt and lekcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$DIGIBYTED --version | sed -n '1!p' >> footer.h2m

for cmd in $DIGIBYTED $DIGIBYTECLI $DIGIBYTETX $DIGIBYTEQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${LEKVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${LEKVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
