FROM ubuntu:14.04
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN groupadd kibana -g 105601 && useradd kibana -u 105601 -d /opt/kibana -s /usr/sbin/nologin -g 105601

RUN apt-get install -y wget && wget -O kibana.tar.gz https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-rc1-linux-x64.tar.gz \
  && mkdir -p /opt/kibana && tar xzf kibana.tar.gz -C /opt/kibana --strip-components=1 \
  && rm kibana.tar.gz && chown -R kibana /opt/kibana

USER kibana

RUN ["/bin/bash", "-c", "config=$(</opt/kibana/config/kibana.yml); \
  config=${config//localhost:9200/elasticsearch:9200}; \
  printf '%s\n' \"$config\" >/opt/kibana/config/kibana.yml"]

EXPOSE 5601

CMD ["/opt/kibana/bin/kibana"]