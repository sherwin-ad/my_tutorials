## ELK in Docker

### Elasticsearch

#### Starting a single node cluster with Docker

```
docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:7.7.1
```

#### Starting a multi-node cluster with Docker Compose

```
version: "3"

services: 
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.7.1
    container_name: elasticsearch
    environment: 
      - discovery.type=single-node
      - xpack.security.enabled=false
    volumes:
      - $PWD/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
      - $PWD/elasticsearch/data:/usr/share/elasticsearch/data
    ports:
      - 9200:9200
    networks: 
      - logging-network

  kibana:
    image: docker.elastic.co/kibana/kibana:7.7.1
    container_name: kibana
    volumes:
      - $PWD/kibana/config/kibana.yml:/usr/share/kibana/config/kibana.yml
    ports: 
      - 5601:5601
    networks:  
      - logging-network

networks: 
  logging-network:
    driver: bridge
```

### Kibana

```
docker run --link elasticsearch -p 5601:5601 --name kibana docker.elastic.co/kibana/kibana:7.7.1
```

