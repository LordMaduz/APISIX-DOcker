#!/usr/bin/env bash

set -eo pipefail

PREFIX=${APISIX_PREFIX:=/usr/local/apisix}

if [[ "$1" == "docker-start" ]]; then
    if [ "$APISIX_STAND_ALONE" = "true" ]; then
        /usr/bin/apisix init
    else
        /usr/bin/apisix init
        /usr/bin/apisix init_etcd
    fi
    
    exec /usr/local/openresty/bin/openresty -p /usr/local/apisix -g 'daemon off;'
fi

exec "$@"