## ELK in Docker

### Run Kibana on Docker for development

To start an Elasticsearch container for development or testing, run:

```sh
docker network create elastic
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.16.3
docker run --name es01-test --net elastic -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.16.3
```



To start Kibana and connect it to your Elasticsearch container, run the following commands in a new terminal session:

```sh
docker pull docker.elastic.co/kibana/kibana:7.16.3
docker run --name kib01-test --net elastic -p 127.0.0.1:5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" docker.elastic.co/kibana/kibana:7.16.3
```



To access Kibana, go to [http://localhost:5601](http://localhost:5601/).

### Stop Docker containers

To stop your containers, run:

```sh
docker stop es01-test
docker stop kib01-test
```



To remove the containers and their network, run:

```sh
docker network rm elastic
docker rm es01-test
docker rm kib01-test
```
