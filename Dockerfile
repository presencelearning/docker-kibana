FROM ubuntu:14.04
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN apt-get install -y wget && wget -O kibana.tar.gz https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-rc1-linux-x64.tar.gz \
  && mkdir -p /opt/kibana && tar xzf kibana.tar.gz -C /opt/kibana --strip-components=1 \
  && rm kibana.tar.gz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5601

CMD ["/opt/kibana/bin/kibana"]
ENTRYPOINT ["/entrypoint.sh"]
