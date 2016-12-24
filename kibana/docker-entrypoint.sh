#!/bin/bash
set -e

#echo "172.22.112.250 es-ssl.default" >> /etc/hosts

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
	set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
	if [ "$ELASTICSEARCH_URL" ]; then
		sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 '$ELASTICSEARCH_URL'!" /etc/kibana/kibana.yml
	fi
	#echo "xpack.security.enabled: false" >> /etc/kibana/kibana.yml

	set -- gosu kibana tini -- "$@"
fi

exec "$@"
