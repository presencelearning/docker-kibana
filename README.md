# logstash
Docker image for logstash

### Base Docker Image

* [ubuntu:14.04](https://registry.hub.docker.com/_/ubuntu/)

## usage
    docker run --name kibana -d --link es:elasticsearch -p 5601:5601 fgaudin/kibana4
