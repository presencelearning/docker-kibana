# logstash
Docker image for logstash

### Base Docker Image

* [ubuntu:14.04](https://registry.hub.docker.com/_/ubuntu/)

## usage
    docker run --name kibana -d --link es:elasticsearch -p 5601:5601 fgaudin/kibana4

If you want to run everything:

    docker create --name es-data elasticsearch:1.4.3
    docker run --name es -d --volumes-from es-data elasticsearch:1.4.3
    docker run --name logstash -d --link es:elasticsearch fgaudin/logstash
    docker run --name nginx -d --link logstash:logstash --volumes-from logstash -p 8082:80 fgaudin/nginx
    docker run --name kibana -d --link es:elasticsearch -p 15601:5601 fgaudin/kibana

Nginx is based on [dockerfile/nginx](https://registry.hub.docker.com/u/dockerfile/nginx/) and sends its logs to lostash.

When all the containers are running, go generate some logs first on Nginx: http://localhost:8082/
then go check Kibana: http://localhost:15601/
