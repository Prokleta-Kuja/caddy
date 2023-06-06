#!/usr/bin/env sh

set -e

OPTS=""

OPTS="$OPTS -listen :5080"
OPTS="$OPTS -tls http"
OPTS="$OPTS -db $GOATCOUNTER_DB"

goatcounter serve $OPTS