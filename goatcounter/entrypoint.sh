#!/usr/bin/env sh

set -eu

create_site ()
{
  goatcounter db create site \
    -createdb \
    -vhost "$INITIAL_DOMAIN" \
    -user.email "$INITIAL_EMAIL" \
    -password "$INITIAL_PASSWORD" \
    -db "$GOATCOUNTER_DB";

    echo "Site $INITIAL_DOMAIN added. Use $INITIAL_EMAIL and password $INITIAL_PASSWORD to login. Do not forget to delete this user."
}

# silence any errors
if ! create_site; then
  /bin/true
fi

exec "$@"