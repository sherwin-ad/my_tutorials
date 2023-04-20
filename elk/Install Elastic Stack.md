## Install Elastic Stack



### Install Elasticsearch

#### Download and install archive for Linux

The Linux archive for Elasticsearch v7.7.1 can be downloaded and installed as follows:

```sh
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.7.1-linux-x86_64.tar.gz
tar -xzvf elasticsearch-7.7.1-linux-x86_64.tar.gz
cd elasticsearch-7.7.1
```

#### Start Elasticsearch

```
./bin/elasticsearch 

# Start elasticsearch in backgroud and creates pid file
./bin/elasticsearch -d -p pid
```



#### Change the IP 

Change the IP in network.host and discovery.seed_hosts in elasticsearch.yml


```
network.host: 192.168.1.14
#
# Set a custom port for HTTP:
#
# http.port: 9200
#
# For more information, consult the network module documentation.
#
# --------------------------------- Discovery ----------------------------------
#
# Pass an initial list of hosts to perform discovery when this node is started:
# The default list of hosts is ["127.0.0.1", "[::1]"]
#
discovery.seed_hosts: 192.168.1.14
```



#### Make sure Elasticsearch is up and running

```
curl http://127.0.0.1:9200

{
  "name" : "owenbox",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "4PjUg5cQRouup0XrxyWkzA",
  "version" : {
    "number" : "7.7.0",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "81a1e9eda8e6183f5237786246f6dced26a10eaf",
    "build_date" : "2020-05-12T02:01:37.602180Z",
    "build_snapshot" : false,
    "lucene_version" : "8.5.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
```



### Install Kibana

```sh
curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-7.7.1-linux-x86_64.tar.gz
tar xzvf kibana-7.7.1-linux-x86_64.tar.gz
cd kibana-7.7.1-linux-x86_64/
./bin/kibana
```



#### Change IP

Change the ip of the server.host and the elasticsearch.hosts: ["http://192.168.1.14:9200"]

```
server.host: 192.168.1.14

# Enables you to specify a path to mount Kibana at if you are running behind a proxy.
# Use the `server.rewriteBasePath` setting to tell Kibana if it should remove the basePath
# from requests it receives, and to prevent a deprecation warning at startup.
# This setting cannot end in a slash.
#server.basePath: ""

# Specifies whether Kibana should rewrite requests that are prefixed with
# `server.basePath` or require that they are rewritten by your reverse proxy.
# This setting was effectively always `false` before Kibana 6.3 and will
# default to `true` starting in Kibana 7.0.
#server.rewriteBasePath: false

# The maximum payload size in bytes for incoming server requests.
#server.maxPayloadBytes: 1048576

# The Kibana server's name.  This is used for display purposes.
server.name: "elk"

# The URLs of the Elasticsearch instances to use for all your queries.
elasticsearch.hosts: ["http://192.168.1.14:9200"]
```



#### Start Kibana

```
./bin/kibana
```



### Install Metricbeat

```sh
$ curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.7.1-x86_64.rpm
$ sudo rpm -vi metricbeat-7.7.1-x86_64.rpm
```

To set up the `system` module and start collecting system metrics:

1. From the Metricbeat install directory, enable the `system` module:

   ```yaml
   sudo metricbeat modules enable system
   ```

2. Set up the initial environment:

   ```
   sudo metricbeat setup -e
   ```

3. Start Metricbeat:

   ```
   sudo service metricbeat start
   ```

   

### Install Logstash (optional)

```
curl -L -O https://artifacts.elastic.co/downloads/logstash/logstash-7.7.1.tar.gz
tar -xzvf logstash-7.7.1.tar.gz
```



### Install Filebeat

1. Download and install Filebeat

```
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.7.1-x86_64.rpm
sudo rpm -vi filebeat-7.7.1-x86_64.rpm
```

2. Edit the configuration

Modify `/etc/filebeat/filebeat.yml` to set the connection information:

```
output.elasticsearch:
  hosts: ["<es_url>"]
  username: "elastic"
  password: "<password>"
setup.kibana:
  host: "<kibana_url>"
```

Where `<password>` is the password of the `elastic` user, `<es_url>` is the URL of Elasticsearch, and `<kibana_url>` is the URL of Kibana.

3. Enable and configure the nginx module

```
sudo filebeat modules enable nginx
```

Modify the settings in the `/etc/filebeat/modules.d/nginx.yml` file.

4. Start Filebeat

The `setup` command loads the Kibana dashboards. If the dashboards are already set up, omit this command.

```
sudo filebeat setup
sudo service filebeat start
```