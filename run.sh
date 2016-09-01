#!/bin/bash

JMX_HOST=$(curl http://rancher-metadata/2015-12-19/self/host/agent_ip)
CASSANDRA_METRICS_LOGENTRIES_TOKEN=$(curl http://rancher-metadata/2015-12-19/self/host/labels/cassandra_metrics_logentries_token)

sed -i 's/%%JMX_PORT%%/'"$JMX_PORT"'/g; s/%%JMX_HOST%%/'"$JMX_HOST"'/g; s/%%JMX_USERNAME%%/'"$JMX_USERNAME"'/g; s/%%JMX_PASSWORD%%/'"$JMX_PASSWORD"'/g' /config/queries.json
sed -i 's/%%CASSANDRA_METRICS_LOGENTRIES_TOKEN%%/'"$CASSANDRA_METRICS_LOGENTRIES_TOKEN"'/g' /config/log4j_logentries.xml
