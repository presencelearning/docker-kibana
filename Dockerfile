FROM fgaudin/base:3
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN groupadd kibana -g 105601 && useradd kibana -u 105601 -d /opt/kibana -s /usr/sbin/nologin -g 105601

RUN apt-get update &&apt-get install -y wget && \
  wget -O kibana.tar.gz https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-rc1-linux-x64.tar.gz && \
  mkdir -p /opt/kibana && tar xzf kibana.tar.gz -C /opt/kibana --strip-components=1 && \
  rm kibana.tar.gz && chown -R kibana /opt/kibana && rm -rf /var/lib/apt/lists/*

COPY consul_template/conf.d /opt/consul_template/conf.d
COPY consul_template/templates /opt/consul_template/templates
COPY supervisord.conf /etc/supervisor/conf.d/kibana.conf

EXPOSE 5601
