#!/bin/bash

config=$(</opt/kibana/config/kibana.yml);
PORT=${ELASTICSEARCH_PORT_9200_TCP_PORT:?"9200"}
if [ -n "$ELASTICSEARCH_PORT_9200_TCP_ADDR" ]; then
  config=${config//elasticsearch_url: \"http:\/\/localhost:9200\"/elasticsearch_url: \"http:\/\/$ELASTICSEARCH_PORT_9200_TCP_ADDR:$PORT\"};
fi
printf '%s\n' "$config" >/opt/kibana/config/kibana.yml

$@
