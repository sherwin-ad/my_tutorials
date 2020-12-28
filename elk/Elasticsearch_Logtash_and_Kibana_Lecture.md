[TOC]



# Elasticsearch Logtash and Kibana

## Elasticsearch Overview

**Elasticsearch**

- is a search engine
- is Document Oriented
  - **insert**, **delete**, **retrieve**, **analyze** and **search** documents



| Relational DB | Elasticsearch |
| ------------- | ------------- |
| Table         | Index         |
| Row           | Document      |
| Column        | Field         |



## Install Elasticsearch

1. Download and extract Elasticsearch

2. Run Elasticsearch from the command line

   ```
   ./bin/elasticsearch
   ```

3. Check Elasticsearch is running

   ```
   $ curl http://localhost:9200/
   {
     "name" : "owenbox",
     "cluster_name" : "elasticsearch",
     "cluster_uuid" : "IhwVdaciQ2KgeYRJajyQdQ",
     "version" : {
       "number" : "7.10.1",
       "build_flavor" : "default",
       "build_type" : "tar",
       "build_hash" : "1c34507e66d7db1211f66f3513706fdf548736aa",
       "build_date" : "2020-12-05T01:00:33.671820Z",
       "build_snapshot" : false,
       "lucene_version" : "8.7.0",
       "minimum_wire_compatibility_version" : "6.8.0",
       "minimum_index_compatibility_version" : "6.0.0-beta1"
     },
     "tagline" : "You Know, for Search"
   }
   ```

   

## Install Kibana

1. Download and extract Kibana

2. Open config/kibana.yml in an editor

   Set elacticsearch.url to point at your Elasticsearch instance

   ```
   elasticsearch.hosts: ["http://localhost:9200"]
   ```

3. Run Kibana from the command line

   ```
   ./bin/elasticsearch
   ```

4. Browse http://localhost:5601

   

## Indexing, Retrieving and Deleting Documents

| Relational DB | Elasticsearch |
| ------------- | ------------- |
| Table         | Index         |
| Row           | Document      |
| Column        | Field         |

 Indexing = Inserting

### Indexing Document

```
PUT /{index}/{type}/{id}
{
  "field1":"value1",
  "field2":"value2",
  ...
}
```

```
PUT /vehicles/car/123
{
    "make": "Honda",
    "Color": "Black",
    "HP": 250,
    "milage": 24000,
    "price": 19300.97
}
```

### Retrieving Document

```
GET /vehicles/car/123

{
  "_index" : "vehicles",
  "_type" : "car",
  "_id" : "123",
  "_version" : 4,
  "_seq_no" : 3,
  "_primary_term" : 1,
  "found" : true,
  "_source" : {
    "make" : "Honda",
    "Color" : "Black",
    "HP" : 250,
    "milage" : 24000,
    "price" : 19300.97
  }
}
```

Display only data without meta fields

```
GET /vehicles/car/123/_source

{
  "make" : "Honda",
  "Color" : "Black",
  "HP" : 250,
  "milage" : 24000,
  "price" : 19300.97
}
```

Display if the document exist

```
HEAD /vehicles/car/123

200 - OK
```

Display if the document exist

```
HEAD /vehicles/car/125

{"statusCode":404,"error":"Not Found","message":"404 - Not Found"}
```

### Updating Document

```
POST /vehicles/car/123/_update
{
	"doc": {
		"price":30000,
		"driver":"Dante"
	}
}

GET /vehicles/car/123/_source

{
  "make" : "Honda",
  "Color" : "Black",
  "HP" : 250,
  "milage" : 24000,
  "price" : 30000,
  "driver" : "Dante"
}
```

### Delete Document

```
DELETE /vehicles/car/123

{
  "_index" : "vehicles",
  "_type" : "car",
  "_id" : "123",
  "_version" : 7,
  "result" : "deleted",
  "_shards" : {
    "total" : 2,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 6,
  "_primary_term" : 2
}


GET /vehicles/car/123

{
  "_index" : "vehicles",
  "_type" : "car",
  "_id" : "123",
  "found" : false
}
```

### Delete Index

```
DELETE /vehicles

{
  "acknowledged" : true
}
```



## Components of an index

```
PUT /business/building/110
{
  "address":"57 New Dover Ln",
  "floors": 10,
  "offices": 21,
  "loc": {
      "lat": 40.707519,
      "lon": -74.008560
  }
}

{
  "_index" : "business",
  "_type" : "building",
  "_id" : "110",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 2,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 0,
  "_primary_term" : 1
}
```

```
GET /business

{
  "business" : {
    "aliases" : { },
    "mappings" : {
      "properties" : {
        "address" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        },
        "floors" : {
          "type" : "long"
        },
        "loc" : {
          "properties" : {
            "lat" : {
              "type" : "float"
            },
            "lon" : {
              "type" : "float"
            }
          }
        },
        "offices" : {
          "type" : "long"
        }
      }
    },
    "settings" : {
      "index" : {
        "routing" : {
          "allocation" : {
            "include" : {
              "_tier_preference" : "data_content"
            }
          }
        },
        "number_of_shards" : "1",
        "provided_name" : "business",
        "creation_date" : "1608964838398",
        "number_of_replicas" : "1",
        "uuid" : "paQrlSXmQZirWyohxHU3OA",
        "version" : {
          "created" : "7100199"
        }
      }
    }
  }
}

```

```
PUT /business/building/217
{
  "address":"11 Pen Ave",
  "floors": 5,
  "offices": 7,
  "price": 450000,
  "loc": {
      "lat": 40.693519,
      "lon": -73.988560
  }
}

{
  "_index" : "business",
  "_type" : "building",
  "_id" : "217",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 2,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 1,
  "_primary_term" : 1
}
```

