#!/bin/bash

config=$(</opt/kibana/config/kibana.yml);
config=${config//elasticsearch_url: \"http:\/\/localhost:9200\"/elasticsearch_url: \"http:\/\/elasticsearch:9200\"};
printf '%s\n' "$config" >/opt/kibana/config/kibana.yml

eval "$@"
