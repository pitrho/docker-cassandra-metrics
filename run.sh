#!/bin/bash

JMX_HOST=$(curl http://rancher-metadata/2015-12-19/self/host/agent_ip)

sed -i 's/%%JMX_PORT%%/'"$JMX_PORT"'/g; s/%%JMX_HOST%%/'"$JMX_HOST"'/g; s/%%JMX_USERNAME%%/'"$JMX_USERNAME"'/g; s/%%JMX_PASSWORD%%/'"$JMX_PASSWORD"'/g' /config/queries.json
