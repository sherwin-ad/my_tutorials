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

   

## Bulk Loading of Data

### Bulk API

- /_bulk
- new-line JSON
- Index, Create, Delete, Update
- --data-binary

**Create File with Requests (make sure to include new line at end of file)**

```
vi reqs
{ "index" : { "_index" : "my-test", "_type" : "my-type", "_id" : "1" } }
{ "col1" : "val1"}
{ "index" : { "_index" : "my-test", "_type" : "my-type", "_id" : "2" } }
{ "col1" : "val2"}
{ "index" : { "_index" : "my-test", "_type" : "my-type", "_id" : "1" } }
{ "col1" : "val3" }
```

**Load from CURL**

``` 
curl -s -H "Content-Type: application/x-ndjson" -XPOST localhost:9200/_bulk --data-binary "@reqs"; echo
```



**Load from Console (Devtools)**

```
POST _bulk
{ "index" : { "_index" : "my-test-console", "_type" : "my-type", "_id" : "1" } }
{ "col1" : "val1" }
{ "index" : { "_index" : "my-test-console", "_type" : "my-type", "_id" : "2" } }
{ "col1" : "val2"}
{ "index" : { "_index" : "my-test-console", "_type" : "my-type", "_id" : "3" } }
{ "col1" : "val3" }
```



**Load via curl, notice the endpoint and type**

```
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
```



**check inside ES**

```
GET /_cat/indices
GET /bank
```



**set index pattern in Kibana**

- Management > Uncheck time-based events > bank



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

### Delete all Index

```
DELETE /_all

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

**Rejecting mapping update**

```
PUT /business/employee/330
{
  "name": "Richard Bell",
  "title": "Senior Accountant",
  "salary_usd": "115000.00",
  "hiredate": "Jan 19, 2013" 
}


{
  "error" : {
    "root_cause" : [
      {
        "type" : "illegal_argument_exception",
        "reason" : "Rejecting mapping update to [business] as the final mapping would have more than 1 type: [building, employee]"
      }
    ],
    "type" : "illegal_argument_exception",
    "reason" : "Rejecting mapping update to [business] as the final mapping would have more than 1 type: [building, employee]"
  },
  "status" : 400
}
```

Indexing employees

```
PUT /employees/_doc/330
{
  "name": "Richard Bell",
  "title": "Senior Accountant",
  "salary_usd": "115000.00",
  "hiredate": "Jan 19, 2013"
  
}

PUT /employees/_doc/331
{
  "name": "Steve Honor",
  "title": "Attorney",
  "salary_usd": "140000.00",
  "hiredate": "Oct 10, 2010"
}

```

Indexing contratcs

```
PUT /contracts/_doc/9987
{
  "name": "property renovation",
  "date_signed": "July 26, 2010",
  "employees_involved": [331, 330, 398]
}
```

 ### Showing indices

Goto Kinaba > Discover

![](/home/sherwinowen/Documents/my_tutorials/elk/images/kibana_discover.png)

### Querying Documents

#### Term Query

It will display document with word "pen" in the address filed name

```
GET business/_search
{
  "query": {
    "term": {
      "address": "pen"
      }
    }
  }
}
```

#### Match_all query

It will display all the documents

```
GET business/_search
{
  "query": {
     "match_all": {}
  }   
}
```

## Distributed Execution of Requests

### What is a shard?

- Data in Elasticsearch is organized into [indices](https://www.elastic.co/guide/en/elasticsearch/guide/2.x/_add_an_index.html). 
- Each index is made up of one or more shards. 
- Each shard is an instance of a Lucene index, which you can think of as a self-contained search engine that indexes and handles queries for a subset of the data in an Elasticsearch cluster.
- As data is written to a shard, it is periodically published into new immutable Lucene segments on disk, and it is at this time it becomes available for querying

![](images/shards.png)

![](images/shards1.png)

## Text Analysis for Indexing and Searching

**Analysis Process**

![](images/analysis_process.png)

**Analysis Steps**

1. **Tokenizing** - splitting the words
2. **Filtering**
	a. **Remove Stop Words** - removing words that are not really important. Ex. the word “the”
   b. **Lowercasing** - case insensitivity
	c. **Stemming** - get into the root of the word. Ex. swimming and swimmers root word is “swim”
	d. **Synonyms** - Ex. “thin” is same meaning a “skinny”



## Index Settings and Mappings

```
PUT /customers
{
  "settings": {
     "number_of_shards": 2,
     "number_of_replicas": 1
  },
  "mappings": {}
}
```

### Set mappings and settings

```
PUT /customers
{
  "mappings": {
    "online": {
      "properties": {
        "gender": {
          "type": "text",
          "analyzer": "standard"
        },
        "age": {
          "type": "integer"
        },
        "total_spent": {
          "type": "float"
        },
        "is_new": {
          "type": "boolean"
        },
        "name": {
          "type": "text",
          "analyzer": "standard"
        }
      }
    }
  },
  "settings": { 
    "number_of_shards": 2,
    "number_of_replicas": 1
  }
}
```

### Insert document

```
PUT customers/online/124
{
  "name": "Mary Cranford",
  "address": "310 Clark Ave",
  "gender":"female",
  "age": 34,
  "total_spent": 550.75,
  "is_new": false
}
```



dynamic:

- If set to **false** - indexing field will be ignored
- If set to **strict** - indexing field will throw error 

### Set dynamic field

```
GET /customers/_mapping/online
{
  "dynamic": "strict"
}
```

### Test whitespace analyzer

```
POST _analyze
{
  "analyzer": "whitespace",
  "text": "The quick brown fox."
}
```

**Results**

```
{
  "tokens": [
    {
      "token": "The",
      "start_offset": 0,
      "end_offset": 3,
      "type": "word",
      "position": 0
    },
    {
      "token": "quick",
      "start_offset": 4,
      "end_offset": 9,
      "type": "word",
      "position": 1
    },
    {
      "token": "brown",
      "start_offset": 10,
      "end_offset": 15,
      "type": "word",
      "position": 2
    },
    {
      "token": "fox.",
      "start_offset": 16,
      "end_offset": 20,
      "type": "word",
      "position": 3
    }
  ]
}
```

## Search Domain Specific Language Query Context



```
PUT /courses
{
  "mappings": {
    "classroom": {
      "properties": {
        "course_description": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "course_publish_date": {
          "type": "date"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "professor": {
          "properties": {
            "department": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "email": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "faculty_type": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "name": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            }
          }
        },
          "room": {
            "type": "text",
            "fields": {
              "keyword": {
                "type": "keyword",
                "ignore_above": 256
              }
            }
          },
          "students_enrolled": {
            "type": "long"
          }
        }
      }
    },
    "settings": {
      "number_of_shards": 2,
      "number_of_replicas": 1
      }
  }
}
```

 ### Search DSL Components

1. **Query Context**
2. **Filter Context**

- Both of these can also be combined to form more complex queries

  

### Query Context Parameters

1. match_all

```
GET /courses/_search
{ 
  "query": {
    "match_all": {}
  }
}
```

2. match

```
GET /courses/_search
{ 
  "query": {
    "match": {"name": "computer"}
  }
}
```

3. exists

   Query if the field exist

```
GET /courses/_search
{
  "query": {
    "exists": {"field": "professor.email"}
  }
}
```

4. must

   Query 2 fields

```
GET /courses/_search
{
  "query": {
    "bool": {
      "must": [
      {"match": {"name": "computer"}},
      {"match": {"room": "c8"}}
      ]
    } 
  }
}
```

5. must_not

```
GET /courses/_search
{
  "query": {
    "bool": {
      "must": [
      {"match": {"name": "accounting"}},
      {"match": {"room": "e3"}}
      ],
      
      "must_not": [
      {"match": {"professor.name": "bill"}}
      ]
    } 
  }
}
```

6. should

```
GET /courses/_search
{
  "query": {
    "bool": {
      "must": [
      {"match": {"name": "accounting"}}
      ],
      
      "must_not": [
      {"match": {"professor.name": "bill"}}
      ],
      "should": [
      {"match": {"room": "e7" }}
      ],
      "minimum_should_match": 1

    } 
  }
}
```

7. mutli_match

```
GET /courses/_search
{
  "query": {
    "multi_match": {
      "query": "accounting",
      "fields": ["name","professor.department"]
    }
  }
}
```

8. match_phrase

   Phrase should be complete

```
GET /courses/_search
{
  "query": {
    "match_phrase": {
      "course_description": "from the business school taken by final year"
    }
  }
}
```

9. match_phrase_prefix

   Query the document even the phrase is not complete

```
GET /courses/_search
{
  "query": {
    "match_phrase_prefix": {
      "course_description": "from the business school taken by fin"
    }
  }
}
```

10. range

```
GET /courses/_search
{
  "query": {
    "range": {
      "students_enrolled": {
        "gte": 10,
        "lte": 30
      }
    }
  }
}


GET /courses/_search
{
  "query": {
    "range": {
      "course_publish_date": {
        "gt": "2013-08-27"
   
      }
    }
  }
}

```

11. Multiple parameters

```
GET /courses/_search
{
  "query": {
    "bool": {
      "must": [
        {"match": {"name": "accounting"}}
      ],
      "must_not": [
        {"match": {"room": "e7"}}
      ],
      "should": [
        {"range": {
          "students_enrolled": {
            "gte": 10,
            "lte": 20
          }
        } 
        } 
      ]
    }
  }
}
```



## Search Domain Specific Language Filter Context

### Difference between query and filter 

- **Query** is used when you want to perform a search on your documents with scoring. 

- **Filters** are used to narrow down the set of results obtained by using **query**. **Filters** are boolean.

```
GET /courses/_search
{
  "query": {
    "bool": {
      "filter": {
        "match": {"name": "accounting"}
      }
    }
  }
}
```

```
GET /courses/_search
{
  "query": {
    "bool": {
      "filter": {
        "bool": {
          "must":[
            {"match":{"name": "accounting"}},
            {"match":{"professor.name": "bill"}}
          ],
          "must_not":[
            {"match": {"room": "e7"}}
            ]
        }
      }
    }
  }
}
```

### Combination of filter and query

```
GET /courses/_search
{
  "query": {
    "bool": {
      "filter": {
        "bool": {
          "must":[
            {"range":{
              "students_enrolled":{
                "gte": 19}
              }
            }
          ]
        }
      },
      
      "must": [
        {"match": {"room": "e3"}}
      ]
    }
  }
}
```

### Field boosting course_description

```
GET /courses/_search
{
  "query": {
    "bool": {
      "filter": {
        "bool": {
          "must":[
            {"range":{
              "students_enrolled":{
                "gte": 12}
              }
            }
          ]
        }
      },
      
      "should": [
        {"match": {"room": "e3"}},
        {"range": {
          "students_enrolled": {
            "gte": 13,
            "lte": 14}
          }
        },
        {"multi_match": {
          "query": "market",
          "fields": ["name", "course_description^2"]}
        }
      ]
    }
  }
}
```



## Analysis and Tokenization

### Standard

```
GET bank/_analyze
{
  "tokenizer": "standard",
  "text": "The Moon is Made of Cheese Some Say"
}
```

Output

```

  "tokens" : [
    {
      "token" : "The",
      "start_offset" : 0,
      "end_offset" : 3,
      "type" : "<ALPHANUM>",
      "position" : 0
    },
    {
      "token" : "Moon",
      "start_offset" : 4,
      "end_offset" : 8,
      "type" : "<ALPHANUM>",
      "position" : 1
    },
    {
      "token" : "is",
      "start_offset" : 9,
      "end_offset" : 11,
      "type" : "<ALPHANUM>",
      "position" : 2
    },
    {
      "token" : "Made",
      "start_offset" : 12,
      "end_offset" : 16,
      "type" : "<ALPHANUM>",
      "position" : 3
    },
    {
      "token" : "of",
      "start_offset" : 17,
      "end_offset" : 19,
      "type" : "<ALPHANUM>",
      "position" : 4
    },
    {
      "token" : "Cheese",
      "start_offset" : 20,
      "end_offset" : 26,
      "type" : "<ALPHANUM>",
      "position" : 5
    },
    {
      "token" : "Some",
      "start_offset" : 27,
      "end_offset" : 31,
      "type" : "<ALPHANUM>",
      "position" : 6
    },
    {
      "token" : "Say",
      "start_offset" : 32,
      "end_offset" : 35,
      "type" : "<ALPHANUM>",
      "position" : 7
    }
  ]
}
```

### Letter

```
GET bank/_analyze
{
  "tokenizer": "letter",
  "text": "The Moon-is-Made of Cheese Some Say$"
}
```

Output

```
{
  "tokens" : [
    {
      "token" : "you@example.com",
      "start_offset" : 0,
      "end_offset" : 15,
      "type" : "<EMAIL>",
      "position" : 0
    },
    {
      "token" : "login",
      "start_offset" : 16,
      "end_offset" : 21,
      "type" : "<ALPHANUM>",
      "position" : 1
    },
    {
      "token" : "at",
      "start_offset" : 22,
      "end_offset" : 24,
      "type" : "<ALPHANUM>",
      "position" : 2
    },
    {
      "token" : "https://bensullins.com",
      "start_offset" : 25,
      "end_offset" : 47,
      "type" : "<URL>",
      "position" : 3
    },
    {
      "token" : "attempt",
      "start_offset" : 48,
      "end_offset" : 55,
      "type" : "<ALPHANUM>",
      "position" : 4
    }
  ]
}
```

### uax_url_email

```
GET bank/_analyze
{
  "tokenizer": "uax_url_email",
  "text": "you@example.com login at https://bensullins.com attempt"
}
```

Output

```
{
  "tokens" : [
    {
      "token" : "you@example.com",
      "start_offset" : 0,
      "end_offset" : 15,
      "type" : "<EMAIL>",
      "position" : 0
    },
    {
      "token" : "login",
      "start_offset" : 16,
      "end_offset" : 21,
      "type" : "<ALPHANUM>",
      "position" : 1
    },
    {
      "token" : "at",
      "start_offset" : 22,
      "end_offset" : 24,
      "type" : "<ALPHANUM>",
      "position" : 2
    },
    {
      "token" : "https://bensullins.com",
      "start_offset" : 25,
      "end_offset" : 47,
      "type" : "<URL>",
      "position" : 3
    },
    {
      "token" : "attempt",
      "start_offset" : 48,
      "end_offset" : 55,
      "type" : "<ALPHANUM>",
      "position" : 4
    }
  ]
}
```



## Aggregations

### Indexing bulk document vehicles

```
POST /vehicles/cars/_bulk
{ "index": {}}
{ "price" : 10000, "color" : "white", "make" : "honda", "sold" : "2016-10-28", "condition": "okay"}
{ "index": {}}
{ "price" : 20000, "color" : "white", "make" : "honda", "sold" : "2016-11-05", "condition": "new" }
{ "index": {}}
{ "price" : 30000, "color" : "green", "make" : "ford", "sold" : "2016-05-18", "condition": "new" }
{ "index": {}}
{ "price" : 15000, "color" : "blue", "make" : "toyota", "sold" : "2016-07-02", "condition": "good" }
{ "index": {}}
{ "price" : 12000, "color" : "green", "make" : "toyota", "sold" : "2016-08-19" , "condition": "good"}
{ "index": {}}
{ "price" : 18000, "color" : "red", "make" : "dodge", "sold" : "2016-11-05", "condition": "good"  }
{ "index": {}}
{ "price" : 80000, "color" : "red", "make" : "bmw", "sold" : "2016-01-01", "condition": "new"  }
{ "index": {}}
{ "price" : 25000, "color" : "blue", "make" : "ford", "sold" : "2016-08-22", "condition": "new"  }
{ "index": {}}
{ "price" : 10000, "color" : "gray", "make" : "dodge", "sold" : "2016-02-12", "condition": "okay" }
{ "index": {}}
{ "price" : 19000, "color" : "red", "make" : "dodge", "sold" : "2016-02-12", "condition": "good" }
{ "index": {}}
{ "price" : 20000, "color" : "red", "make" : "chevrolet", "sold" : "2016-08-15", "condition": "good" }
{ "index": {}}
{ "price" : 13000, "color" : "gray", "make" : "chevrolet", "sold" : "2016-11-20", "condition": "okay" }
{ "index": {}}
{ "price" : 12500, "color" : "gray", "make" : "dodge", "sold" : "2016-03-09", "condition": "okay" }
{ "index": {}}
{ "price" : 35000, "color" : "red", "make" : "dodge", "sold" : "2016-04-10", "condition": "new" }
{ "index": {}}
{ "price" : 28000, "color" : "blue", "make" : "chevrolet", "sold" : "2016-08-15", "condition": "new" }
{ "index": {}}
{ "price" : 30000, "color" : "gray", "make" : "bmw", "sold" : "2016-11-20", "condition": "good" }
```

### List top 10 documents (by default)

```
GET /vehicles/cars/_search
{
  "query": {
    "match_all": {}
  }
}
```

### List Documents with size parameter

```
GET /vehicles/cars/_search
{
  "size": 20, 
  "query": {
    "match_all": {}
  }
}
```

### Listing Document with with parameters: from, size and sort

```
GET /vehicles/cars/_search
{
  "from": 0, 
  "size": 10, 
  "query": {
    "match_all": {}
  },
  "sort": [
    {
      "price": {
        "order": "desc"
      }
    }
  ]
}
```

### Count vehicles document manufactured by Dodge

```
GET /vehicles/cars/_count
{
  "query": {
    "match": {
      "make": "dodge"
    }
  }
}
```

### Aggregation of popular cars

```
GET /vehicles/cars/_search
{
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      }
    }
  }
}
```

**Results**

```
{
  "took": 19,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 5
        },
        {
          "key": "chevrolet",
          "doc_count": 3
        },
        {
          "key": "bmw",
          "doc_count": 2
        },
        {
          "key": "ford",
          "doc_count": 2
        },
        {
          "key": "honda",
          "doc_count": 2
        },
        {
          "key": "toyota",
          "doc_count": 2
        }
      ]
    }
  }
}
```

### Aggregation of popular cars with average price per car manufacturers

```
GET /vehicles/cars/_search
{
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
           }
        }
      }
    }
  }
}
```

Results

```
  "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 5,
          "avg_price": {
            "value": 18900
          }
        },
        {
          "key": "chevrolet",
          "doc_count": 3,
          "avg_price": {
            "value": 20333.333333333332
          }
        },
        {
          "key": "bmw",
          "doc_count": 2,
          "avg_price": {
            "value": 55000
          }
        },
        {
          "key": "ford",
          "doc_count": 2,
          "avg_price": {
            "value": 27500
          }
        },
        {
          "key": "honda",
          "doc_count": 2,
          "avg_price": {
            "value": 15000
          }
        },
        {
          "key": "toyota",
          "doc_count": 2,
          "avg_price": {
            "value": 13500
          }
```

### Aggregation of popular cars with average, maximum and minimum price per car manufacturers

```
GET /vehicles/cars/_search
{
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
           }
        },
        "max_price":{
          "max": {
            "field": "price"
          }
        },
        "min_price":{
          "min": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

**Result**

```
 "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 5,
          "max_price": {
            "value": 35000
          },
          "min_price": {
            "value": 10000
          },
          "avg_price": {
            "value": 18900
          }
        },
        {
          "key": "chevrolet",
          "doc_count": 3,
          "max_price": {
            "value": 28000
          },
          "min_price": {
            "value": 13000
          },
          "avg_price": {
            "value": 20333.333333333332
          }
        },
        {
          "key": "bmw",
          "doc_count": 2,
          "max_price": {
            "value": 80000
          },
          "min_price": {
            "value": 30000
          },
          "avg_price": {
            "value": 55000
          }
        },
        {
          "key": "ford",
          "doc_count": 2,
          "max_price": {
            "value": 30000
          },
          "min_price": {
            "value": 25000
          },
          "avg_price": {
            "value": 27500
          }
        },
        {
          "key": "honda",
          "doc_count": 2,
          "max_price": {
            "value": 20000
          },
          "min_price": {
            "value": 10000
          },
          "avg_price": {
            "value": 15000
          }
        },
        {
          "key": "toyota",
          "doc_count": 2,
          "max_price": {
            "value": 15000
          },
          "min_price": {
            "value": 12000
          },
          "avg_price": {
            "value": 13500
          }
        }
```

### Aggregation with query

```
GET /vehicles/cars/_search
{
  "size": 0, 
  "query": {
    "match": {
      "color": "red"
    }
  }, 
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
           }
        },
        "max_price":{
          "max": {
            "field": "price"
          }
        },
        "min_price":{
          "min": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

**Result**

```
{
  "took": 4,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 5,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 3,
          "max_price": {
            "value": 35000
          },
          "min_price": {
            "value": 18000
          },
          "avg_price": {
            "value": 24000
          }
        },
        {
          "key": "bmw",
          "doc_count": 1,
          "max_price": {
            "value": 80000
          },
          "min_price": {
            "value": 80000
          },
          "avg_price": {
            "value": 80000
          }
        },
        {
          "key": "chevrolet",
          "doc_count": 1,
          "max_price": {
            "value": 20000
          },
          "min_price": {
            "value": 20000
          },
          "avg_price": {
            "value": 20000
          }
        }
      ]
    }
  }
}
```

### Aggregation using stats

- It will compute for Minimum, Maximum, Average and Sum 

```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },
      "aggs": {
        "stats_on_price": {
          "stats": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

**Results**

```
{
  "took": 5,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 16,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 5,
          "stats_on_price": {
            "count": 5,
            "min": 10000,
            "max": 35000,
            "avg": 18900,
            "sum": 94500
          }
        },
        {
          "key": "chevrolet",
          "doc_count": 3,
          "stats_on_price": {
            "count": 3,
            "min": 13000,
            "max": 28000,
            "avg": 20333.333333333332,
            "sum": 61000
          }
        },
        {
          "key": "bmw",
          "doc_count": 2,
          "stats_on_price": {
            "count": 2,
            "min": 30000,
            "max": 80000,
            "avg": 55000,
            "sum": 110000
          }
        },
        {
          "key": "ford",
          "doc_count": 2,
          "stats_on_price": {
            "count": 2,
            "min": 25000,
            "max": 30000,
            "avg": 27500,
            "sum": 55000
          }
        },
        {
          "key": "honda",
          "doc_count": 2,
          "stats_on_price": {
            "count": 2,
            "min": 10000,
            "max": 20000,
            "avg": 15000,
            "sum": 30000
          }
        },
        {
          "key": "toyota",
          "doc_count": 2,
          "stats_on_price": {
            "count": 2,
            "min": 12000,
            "max": 15000,
            "avg": 13500,
            "sum": 27000
          }
        }
      ]
    }
  }
}
```

### Aggregation with range parameter

```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },

      "aggs": {
        "sold_date_ranges": {
          "range": {
            "field": "sold",
            "ranges": [
              {
                "from": "2016-01-01",
                "to": "2016-05-18"
              },
              {
                "from": "2016-05-18",
                "to": "2017-01-01"
              }  
            ]
          }
        }
      }

    }
  }
}
```

**Results**

```
{
  "took": 14,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 16,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "popular_cars": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "dodge",
          "doc_count": 5,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 4
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 1
              }
            ]
          }
        },
        {
          "key": "chevrolet",
          "doc_count": 3,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 0
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 3
              }
            ]
          }
        },
        {
          "key": "bmw",
          "doc_count": 2,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 1
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 1
              }
            ]
          }
        },
        {
          "key": "ford",
          "doc_count": 2,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 0
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 2
              }
            ]
          }
        },
        {
          "key": "honda",
          "doc_count": 2,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 0
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 2
              }
            ]
          }
        },
        {
          "key": "toyota",
          "doc_count": 2,
          "sold_date_ranges": {
            "buckets": [
              {
                "key": "2016-01-01T00:00:00.000Z-2016-05-18T00:00:00.000Z",
                "from": 1451606400000,
                "from_as_string": "2016-01-01T00:00:00.000Z",
                "to": 1463529600000,
                "to_as_string": "2016-05-18T00:00:00.000Z",
                "doc_count": 0
              },
              {
                "key": "2016-05-18T00:00:00.000Z-2017-01-01T00:00:00.000Z",
                "from": 1463529600000,
                "from_as_string": "2016-05-18T00:00:00.000Z",
                "to": 1483228800000,
                "to_as_string": "2017-01-01T00:00:00.000Z",
                "doc_count": 2
              }
            ]
          }
        }
      ]
    }
  }
}
```

```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "popular_cars": {
      "terms": {
        "field": "make.keyword"
      },

      "aggs": {
        "sold_date_ranges": {
          "range": {
            "field": "sold",
            "ranges": [
              {
                "from": "2016-01-01",
                "to": "2016-05-18"
              },
              {
                "from": "2016-05-18",
                "to": "2017-01-01"
              }  
            ]
          },
          "aggs": {
            "avg_price": {
              "avg": {
                "field": "price"
              }
            }
          }
        }
      }

    }
  }
}
```



```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "car_conditions": {
      "terms": {
        "field": "condition.keyword"
       },
       "aggs": {
         "avg_price": {
           "avg": {
             "field": "price"
           }
         }
       }
    }
  }
}
```

**Results**

```
{
  "took": 2,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 16,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "car_conditions": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "good",
          "doc_count": 6,
          "avg_price": {
            "value": 19000
          }
        },
        {
          "key": "new",
          "doc_count": 6,
          "avg_price": {
            "value": 36333.333333333336
          }
        },
        {
          "key": "okay",
          "doc_count": 4,
          "avg_price": {
            "value": 11375
          }
        }
      ]
    }
  }
}
```



```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "car_conditions": {
      "terms": {
        "field": "condition.keyword"
       },
       "aggs": {
         "avg_price": {
           "avg": {
             "field": "price"
           }
         },
        "make": {
          "terms": {
            "field": "make.keyword"
          }
        }
       }
    }
  }
}
```

**Results**

```
{
  "took": 7,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 16,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "car_conditions": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "good",
          "doc_count": 6,
          "avg_price": {
            "value": 19000
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "dodge",
                "doc_count": 2
              },
              {
                "key": "toyota",
                "doc_count": 2
              },
              {
                "key": "bmw",
                "doc_count": 1
              },
              {
                "key": "chevrolet",
                "doc_count": 1
              }
            ]
          }
        },
        {
          "key": "new",
          "doc_count": 6,
          "avg_price": {
            "value": 36333.333333333336
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "ford",
                "doc_count": 2
              },
              {
                "key": "bmw",
                "doc_count": 1
              },
              {
                "key": "chevrolet",
                "doc_count": 1
              },
              {
                "key": "dodge",
                "doc_count": 1
              },
              {
                "key": "honda",
                "doc_count": 1
              }
            ]
          }
        },
        {
          "key": "okay",
          "doc_count": 4,
          "avg_price": {
            "value": 11375
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "dodge",
                "doc_count": 2
              },
              {
                "key": "chevrolet",
                "doc_count": 1
              },
              {
                "key": "honda",
                "doc_count": 1
              }
            ]
          }
        }
      ]
    }
  }
}
```

```
GET /vehicles/cars/_search
{
  "size": 0, 
  "aggs": {
    "car_conditions": {
      "terms": {
        "field": "condition.keyword"
       },
       "aggs": {
         "avg_price": {
           "avg": {
             "field": "price"
           }
         },
        "make": {
          "terms": {
            "field": "make.keyword"
          },
          "aggs": {
            "min_price": {
              "min": {
                "field": "price"
              }
            },
            "max_price": {
              "max": {
                "field": "price"
              }
            }
          }
          }
        }
       }
    }
  }
}
```

**Results**

```
{
  "took": 8,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 16,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "car_conditions": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "good",
          "doc_count": 6,
          "avg_price": {
            "value": 19000
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "dodge",
                "doc_count": 2,
                "max_price": {
                  "value": 19000
                },
                "min_price": {
                  "value": 18000
                }
              },
              {
                "key": "toyota",
                "doc_count": 2,
                "max_price": {
                  "value": 15000
                },
                "min_price": {
                  "value": 12000
                }
              },
              {
                "key": "bmw",
                "doc_count": 1,
                "max_price": {
                  "value": 30000
                },
                "min_price": {
                  "value": 30000
                }
              },
              {
                "key": "chevrolet",
                "doc_count": 1,
                "max_price": {
                  "value": 20000
                },
                "min_price": {
                  "value": 20000
                }
              }
            ]
          }
        },
        {
          "key": "new",
          "doc_count": 6,
          "avg_price": {
            "value": 36333.333333333336
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "ford",
                "doc_count": 2,
                "max_price": {
                  "value": 30000
                },
                "min_price": {
                  "value": 25000
                }
              },
              {
                "key": "bmw",
                "doc_count": 1,
                "max_price": {
                  "value": 80000
                },
                "min_price": {
                  "value": 80000
                }
              },
              {
                "key": "chevrolet",
                "doc_count": 1,
                "max_price": {
                  "value": 28000
                },
                "min_price": {
                  "value": 28000
                }
              },
              {
                "key": "dodge",
                "doc_count": 1,
                "max_price": {
                  "value": 35000
                },
                "min_price": {
                  "value": 35000
                }
              },
              {
                "key": "honda",
                "doc_count": 1,
                "max_price": {
                  "value": 20000
                },
                "min_price": {
                  "value": 20000
                }
              }
            ]
          }
        },
        {
          "key": "okay",
          "doc_count": 4,
          "avg_price": {
            "value": 11375
          },
          "make": {
            "doc_count_error_upper_bound": 0,
            "sum_other_doc_count": 0,
            "buckets": [
              {
                "key": "dodge",
                "doc_count": 2,
                "max_price": {
                  "value": 12500
                },
                "min_price": {
                  "value": 10000
                }
              },
              {
                "key": "chevrolet",
                "doc_count": 1,
                "max_price": {
                  "value": 13000
                },
                "min_price": {
                  "value": 13000
                }
              },
              {
                "key": "honda",
                "doc_count": 1,
                "max_price": {
                  "value": 10000
                },
                "min_price": {
                  "value": 10000
                }
              }
            ]
          }
        }
      ]
    }
  }
}
```



## Download and Configure Logtash

### Logstash

- is a very powerfull open source data processing pipeline engine 
- it is used to ingest data from a multitude of sources

### 3 Stages to the logstash pipeline

![](images/logstash_pipeline.png)

1. Inputs
2. Filters
3. Outputs

```
input
{
...
}

filter
{
...
}

output 
{
...
}
```

 ### Test logstash

- **Prerequisite JDK version 8**

#### Changing JDK version

To set the JAVA_HOME environment variable run following command and copy the path you want to be set as JAVA_HOME.

```
sudo update-alternatives --config java
```

**Run the following command to set the JAVA_HOME variable.**

```
sudo nano /etc/environment
```

**Add the following line to the end of file**

```
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
```

**Apply the changes by running the following command.**

```
source /etc/environment
```

**Now verify JAVA_HOME path typing:**

```
echo $JAVA_HOME
```

**Test logstash**

```
$ bin/logstash -e 'input { stdin {}} output { stdout {}}'
Sending Logstash's logs to /home/sherwinowen/Documents/elk/old_version/logstash-6.3.2/logs which is now configured via log4j2.properties
[2021-01-03T09:12:26,260][INFO ][logstash.setting.writabledirectory] Creating directory {:setting=>"path.queue", :path=>"/home/sherwinowen/Documents/elk/old_version/logstash-6.3.2/data/queue"}
[2021-01-03T09:12:26,272][INFO ][logstash.setting.writabledirectory] Creating directory {:setting=>"path.dead_letter_queue", :path=>"/home/sherwinowen/Documents/elk/old_version/logstash-6.3.2/data/dead_letter_queue"}
[2021-01-03T09:12:26,854][WARN ][logstash.config.source.multilocal] Ignoring the 'pipelines.yml' file because modules or command line options are specified
[2021-01-03T09:12:26,905][INFO ][logstash.agent           ] No persistent UUID file found. Generating new UUID {:uuid=>"0a0e2ad2-db6c-44c8-b61b-d742fd149988", :path=>"/home/sherwinowen/Documents/elk/old_version/logstash-6.3.2/data/uuid"}
[2021-01-03T09:12:27,653][INFO ][logstash.runner          ] Starting Logstash {"logstash.version"=>"6.3.2"}
[2021-01-03T09:12:31,070][INFO ][logstash.pipeline        ] Starting pipeline {:pipeline_id=>"main", "pipeline.workers"=>4, "pipeline.batch.size"=>125, "pipeline.batch.delay"=>50}
[2021-01-03T09:12:31,225][INFO ][logstash.pipeline        ] Pipeline started successfully {:pipeline_id=>"main", :thread=>"#<Thread:0x7a1523d4 run>"}
The stdin plugin is now waiting for input:
[2021-01-03T09:12:31,334][INFO ][logstash.agent           ] Pipelines running {:count=>1, :running_pipelines=>[:main], :non_running_pipelines=>[]}
[2021-01-03T09:12:31,863][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9600}
Hello there
{
       "message" => "Hello there",
    "@timestamp" => 2021-01-03T01:23:15.374Z,
          "host" => "owenbox",
      "@version" => "1"
}
Today is a nice day
{
       "message" => "Today is a nice day",
    "@timestamp" => 2021-01-03T01:23:32.347Z,
          "host" => "owenbox",
      "@version" => "1"
}
```



## Overview of Logstash & Indexing Apache Logs

apache.conf

```
input 
{
	file {
		path => "/home/sherwinowen/Documents/elk/data/logs/logs"
		type => "logs"
		start_position => "beginning"
	}
	
}

filter
{
	grok{
		match => {
			"message" => "%{COMBINEDAPACHELOG}"
		}
	}
	mutate{
		convert => { "bytes" => "integer" }
	}
	date {
		match => [ "timestamp", "dd/MMM/YYYY:HH:mm:ss Z" ]
		locale => en
		remove_field => "timestamp"
	}
	geoip {
		source => "clientip"
	}
	useragent {
		source => "agent"
		target => "useragent"
	}
}


output
{
	stdout {
		codec => dots
	}

 	elasticsearch {

  	}

}
```

 Ingest apache log to elasticsearch

```
$ bin/logstash -f/home/sherwinowen/Documents/elk/data/apache.conf
```

### Grok Pattern

```
USERNAME [a-zA-Z0-9._-]+
USER %{USERNAME}
EMAILLOCALPART [a-zA-Z][a-zA-Z0-9_.+-=:]+
EMAILADDRESS %{EMAILLOCALPART}@%{HOSTNAME}
INT (?:[+-]?(?:[0-9]+))
BASE10NUM (?<![0-9.+-])(?>[+-]?(?:(?:[0-9]+(?:\.[0-9]+)?)|(?:\.[0-9]+)))
NUMBER (?:%{BASE10NUM})
BASE16NUM (?<![0-9A-Fa-f])(?:[+-]?(?:0x)?(?:[0-9A-Fa-f]+))
BASE16FLOAT \b(?<![0-9A-Fa-f.])(?:[+-]?(?:0x)?(?:(?:[0-9A-Fa-f]+(?:\.[0-9A-Fa-f]*)?)|(?:\.[0-9A-Fa-f]+)))\b

POSINT \b(?:[1-9][0-9]*)\b
NONNEGINT \b(?:[0-9]+)\b
WORD \b\w+\b
NOTSPACE \S+
SPACE \s*
DATA .*?
GREEDYDATA .*
QUOTEDSTRING (?>(?<!\\)(?>"(?>\\.|[^\\"]+)+"|""|(?>'(?>\\.|[^\\']+)+')|''|(?>`(?>\\.|[^\\`]+)+`)|``))
UUID [A-Fa-f0-9]{8}-(?:[A-Fa-f0-9]{4}-){3}[A-Fa-f0-9]{12}
# URN, allowing use of RFC 2141 section 2.3 reserved characters
URN urn:[0-9A-Za-z][0-9A-Za-z-]{0,31}:(?:%[0-9a-fA-F]{2}|[0-9A-Za-z()+,.:=@;$_!*'/?#-])+

# Networking
MAC (?:%{CISCOMAC}|%{WINDOWSMAC}|%{COMMONMAC})
CISCOMAC (?:(?:[A-Fa-f0-9]{4}\.){2}[A-Fa-f0-9]{4})
WINDOWSMAC (?:(?:[A-Fa-f0-9]{2}-){5}[A-Fa-f0-9]{2})
COMMONMAC (?:(?:[A-Fa-f0-9]{2}:){5}[A-Fa-f0-9]{2})
IPV6 ((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?
IPV4 (?<![0-9])(?:(?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])[.](?:[0-1]?[0-9]{1,2}|2[0-4][0-9]|25[0-5]))(?![0-9])
IP (?:%{IPV6}|%{IPV4})
HOSTNAME \b(?:[0-9A-Za-z][0-9A-Za-z-]{0,62})(?:\.(?:[0-9A-Za-z][0-9A-Za-z-]{0,62}))*(\.?|\b)
IPORHOST (?:%{IP}|%{HOSTNAME})
HOSTPORT %{IPORHOST}:%{POSINT}

# paths (only absolute paths are matched)
PATH (?:%{UNIXPATH}|%{WINPATH})
UNIXPATH (/[[[:alnum:]]_%!$@:.,+~-]*)+
TTY (?:/dev/(pts|tty([pq])?)(\w+)?/?(?:[0-9]+))
WINPATH (?>[A-Za-z]+:|\\)(?:\\[^\\?*]*)+
URIPROTO [A-Za-z]([A-Za-z0-9+\-.]+)+
URIHOST %{IPORHOST}(?::%{POSINT:port})?
# uripath comes loosely from RFC1738, but mostly from what Firefox
# doesn't turn into %XX
URIPATH (?:/[A-Za-z0-9$.+!*'(){},~:;=@#%&_\-]*)+
#URIPARAM \?(?:[A-Za-z0-9]+(?:=(?:[^&]*))?(?:&(?:[A-Za-z0-9]+(?:=(?:[^&]*))?)?)*)?
URIPARAM \?[A-Za-z0-9$.+!*'|(){},~@#%&/=:;_?\-\[\]<>]*
URIPATHPARAM %{URIPATH}(?:%{URIPARAM})?
URI %{URIPROTO}://(?:%{USER}(?::[^@]*)?@)?(?:%{URIHOST})?(?:%{URIPATHPARAM})?

# Months: January, Feb, 3, 03, 12, December
MONTH \b(?:[Jj]an(?:uary|uar)?|[Ff]eb(?:ruary|ruar)?|[Mm](?:a|ä)?r(?:ch|z)?|[Aa]pr(?:il)?|[Mm]a(?:y|i)?|[Jj]un(?:e|i)?|[Jj]ul(?:y|i)?|[Aa]ug(?:ust)?|[Ss]ep(?:tember)?|[Oo](?:c|k)?t(?:ober)?|[Nn]ov(?:ember)?|[Dd]e(?:c|z)(?:ember)?)\b
MONTHNUM (?:0?[1-9]|1[0-2])
MONTHNUM2 (?:0[1-9]|1[0-2])
MONTHDAY (?:(?:0[1-9])|(?:[12][0-9])|(?:3[01])|[1-9])

# Days: Monday, Tue, Thu, etc...
DAY (?:Mon(?:day)?|Tue(?:sday)?|Wed(?:nesday)?|Thu(?:rsday)?|Fri(?:day)?|Sat(?:urday)?|Sun(?:day)?)

# Years?
YEAR (?>\d\d){1,2}
HOUR (?:2[0123]|[01]?[0-9])
MINUTE (?:[0-5][0-9])
# '60' is a leap second in most time standards and thus is valid.
SECOND (?:(?:[0-5]?[0-9]|60)(?:[:.,][0-9]+)?)
TIME (?!<[0-9])%{HOUR}:%{MINUTE}(?::%{SECOND})(?![0-9])
# datestamp is YYYY/MM/DD-HH:MM:SS.UUUU (or something like it)
DATE_US %{MONTHNUM}[/-]%{MONTHDAY}[/-]%{YEAR}
DATE_EU %{MONTHDAY}[./-]%{MONTHNUM}[./-]%{YEAR}
ISO8601_TIMEZONE (?:Z|[+-]%{HOUR}(?::?%{MINUTE}))
ISO8601_SECOND (?:%{SECOND}|60)
TIMESTAMP_ISO8601 %{YEAR}-%{MONTHNUM}-%{MONTHDAY}[T ]%{HOUR}:?%{MINUTE}(?::?%{SECOND})?%{ISO8601_TIMEZONE}?
DATE %{DATE_US}|%{DATE_EU}
DATESTAMP %{DATE}[- ]%{TIME}
TZ (?:[APMCE][SD]T|UTC)
DATESTAMP_RFC822 %{DAY} %{MONTH} %{MONTHDAY} %{YEAR} %{TIME} %{TZ}
DATESTAMP_RFC2822 %{DAY}, %{MONTHDAY} %{MONTH} %{YEAR} %{TIME} %{ISO8601_TIMEZONE}
DATESTAMP_OTHER %{DAY} %{MONTH} %{MONTHDAY} %{TIME} %{TZ} %{YEAR}
DATESTAMP_EVENTLOG %{YEAR}%{MONTHNUM2}%{MONTHDAY}%{HOUR}%{MINUTE}%{SECOND}

# Syslog Dates: Month Day HH:MM:SS
SYSLOGTIMESTAMP %{MONTH} +%{MONTHDAY} %{TIME}
PROG [\x21-\x5a\x5c\x5e-\x7e]+
SYSLOGPROG %{PROG:program}(?:\[%{POSINT:pid}\])?
SYSLOGHOST %{IPORHOST}
SYSLOGFACILITY <%{NONNEGINT:facility}.%{NONNEGINT:priority}>
HTTPDATE %{MONTHDAY}/%{MONTH}/%{YEAR}:%{TIME} %{INT}

# Shortcuts
QS %{QUOTEDSTRING}

# Log formats
SYSLOGBASE %{SYSLOGTIMESTAMP:timestamp} (?:%{SYSLOGFACILITY} )?%{SYSLOGHOST:logsource} %{SYSLOGPROG}:

# Log Levels
LOGLEVEL ([Aa]lert|ALERT|[Tt]race|TRACE|[Dd]ebug|DEBUG|[Nn]otice|NOTICE|[Ii]nfo?(?:rmation)?|INFO?(?:RMATION)?|[Ww]arn?(?:ing)?|WARN?(?:ING)?|[Ee]rr?(?:or)?|ERR?(?:OR)?|[Cc]rit?(?:ical)?|CRIT?(?:ICAL)?|[Ff]atal|FATAL|[Ss]evere|SEVERE|EMERG(?:ENCY)?|[Ee]merg(?:ency)?)
```



## Kibana Visualization and Dashboard Overview

 Count total number of documents in the indices

```
http://localhost:9200/logstash-*/_count

or 

GET /logstash-*/_count
```



## Filebeat

- Lightweight shipper for logs
- Ship to Elasticsearch or Logstash. Visualize in Kibana. 



### Setting up Filebeat

![]()![filebeat](images/filebeat.png)



## Indexing Using Filebeat With Logstash

**filebeat.yml**

```
###################### Filebeat Configuration Example #########################

# This file is an example configuration file highlighting only the most common
# options. The filebeat.reference.yml file from the same directory contains all the
# supported options with more comments. You can use it as a reference.
#
# You can find the full configuration reference here:
# https://www.elastic.co/guide/en/beats/filebeat/index.html

# For more available modules and options, please see the filebeat.reference.yml sample
# configuration file.

#=========================== Filebeat inputs =============================

filebeat.inputs:

# Each - is an input. Most options can be set at the input level, so
# you can use different inputs for various configurations.
# Below are the input specific configurations.

- type: log

  # Change to true to enable this input configuration.
  enabled: true

  # Paths that should be crawled and fetched. Glob based paths.
  paths:
    - /home/sherwinowen/Documents/elk/data/logs/*
    #- /var/log/*.log
    #- c:\programdata\elasticsearch\logs\*

  # Exclude lines. A list of regular expressions to match. It drops the lines that are
  # matching any regular expression from the list.
  #exclude_lines: ['^DBG']

  # Include lines. A list of regular expressions to match. It exports the lines that are
  # matching any regular expression from the list.
  #include_lines: ['^ERR', '^WARN']

  # Exclude files. A list of regular expressions to match. Filebeat drops the files that
  # are matching any regular expression from the list. By default, no files are dropped.
  #exclude_files: ['.gz$']

  # Optional additional fields. These fields can be freely picked
  # to add additional information to the crawled log files for filtering
  #fields:
  #  level: debug
  #  review: 1

  ### Multiline options

  # Mutiline can be used for log messages spanning multiple lines. This is common
  # for Java Stack Traces or C-Line Continuation

  # The regexp Pattern that has to be matched. The example pattern matches all lines starting with [
  #multiline.pattern: ^\[

  # Defines if the pattern set under pattern should be negated or not. Default is false.
  #multiline.negate: false

  # Match can be set to "after" or "before". It is used to define if lines should be append to a pattern
  # that was (not) matched before or after or as long as a pattern is not matched based on negate.
  # Note: After is the equivalent to previous and before is the equivalent to to next in Logstash
  #multiline.match: after


#============================= Filebeat modules ===============================

filebeat.config.modules:
  # Glob pattern for configuration loading
  path: ${path.config}/modules.d/*.yml

  # Set to true to enable config reloading
  reload.enabled: false

  # Period on which files under path should be checked for changes
  #reload.period: 10s

#==================== Elasticsearch template setting ==========================

setup.template.settings:
  index.number_of_shards: 3
  #index.codec: best_compression
  #_source.enabled: false

#================================ General =====================================

# The name of the shipper that publishes the network data. It can be used to group
# all the transactions sent by a single shipper in the web interface.
#name:

# The tags of the shipper are included in their own field with each
# transaction published.
#tags: ["service-X", "web-tier"]

# Optional fields that you can specify to add additional information to the
# output.
#fields:
#  env: staging


#============================== Dashboards =====================================
# These settings control loading the sample dashboards to the Kibana index. Loading
# the dashboards is disabled by default and can be enabled either by setting the
# options here, or by using the `-setup` CLI flag or the `setup` command.
#setup.dashboards.enabled: false

# The URL from where to download the dashboards archive. By default this URL
# has a value which is computed based on the Beat name and version. For released
# versions, this URL points to the dashboard archive on the artifacts.elastic.co
# website.
#setup.dashboards.url:

#============================== Kibana =====================================

# Starting with Beats version 6.0.0, the dashboards are loaded via the Kibana API.
# This requires a Kibana endpoint configuration.
setup.kibana:

  # Kibana Host
  # Scheme and port can be left out and will be set to the default (http and 5601)
  # In case you specify and additional path, the scheme is required: http://localhost:5601/path
  # IPv6 addresses should always be defined as: https://[2001:db8::1]:5601
  #host: "localhost:5601"

#============================= Elastic Cloud ==================================

# These settings simplify using filebeat with the Elastic Cloud (https://cloud.elastic.co/).

# The cloud.id setting overwrites the `output.elasticsearch.hosts` and
# `setup.kibana.host` options.
# You can find the `cloud.id` in the Elastic Cloud web UI.
#cloud.id:

# The cloud.auth setting overwrites the `output.elasticsearch.username` and
# `output.elasticsearch.password` settings. The format is `<user>:<pass>`.
#cloud.auth:

#================================ Outputs =====================================

# Configure what output to use when sending the data collected by the beat.

#-------------------------- Elasticsearch output ------------------------------
# output.elasticsearch:
  # Array of hosts to connect to.
  #hosts: ["localhost:9200"]

  # Optional protocol and basic auth credentials.
  #protocol: "https"
  #username: "elastic"
  #password: "changeme"

#----------------------------- Logstash output --------------------------------
output.logstash:
  # The Logstash hosts
   hosts: ["localhost:5044"]

  # Optional SSL. By default is off.
  # List of root certificates for HTTPS server verifications
  #ssl.certificate_authorities: ["/etc/pki/root/ca.pem"]

  # Certificate for SSL client authentication
  #ssl.certificate: "/etc/pki/client/cert.pem"

  # Client Certificate Key
  #ssl.key: "/etc/pki/client/cert.key"

#================================ Logging =====================================

# Sets log level. The default log level is info.
# Available log levels are: error, warning, info, debug
#logging.level: debug

# At debug level, you can selectively enable logging only for some components.
# To enable all selectors use ["*"]. Examples of other selectors are "beat",
# "publish", "service".
#logging.selectors: ["*"]

#============================== Xpack Monitoring ===============================
# filebeat can export internal metrics to a central Elasticsearch monitoring
# cluster.  This requires xpack monitoring to be enabled in Elasticsearch.  The
# reporting is disabled by default.

# Set to true to enable the monitoring reporter.
#xpack.monitoring.enabled: false

# Uncomment to send the metrics to Elasticsearch. Most settings from the
# Elasticsearch output are accepted here as well. Any setting that is not set is
# automatically inherited from the Elasticsearch output configuration, so if you
# have the Elasticsearch output configured, you can simply uncomment the
# following line.
#xpack.monitoring.elasticsearch:

```

**filebeat.conf**

```
input 
{
	beats {
		port => 5044
	}
	
}

filter
{
	grok{
		match => {
			"message" => "%{COMBINEDAPACHELOG}"
		}
	}
	mutate{
		convert => { "bytes" => "integer" }
	}
	date {
		match => [ "timestamp", "dd/MMM/YYYY:HH:mm:ss Z" ]
		locale => en
		remove_field => "timestamp"
	}
	geoip {
		source => "clientip"
	}
	useragent {
		source => "agent"
		target => "useragent"
	}
}


output
{
	stdout {
		codec => dots
	}

 	elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}" 
  }

}
```

**Run logstash**

```
$ bin/logstash -f ~/Documents/elk/data/filebeat.conf
```

**Run filebeat**

```
$./filebeat
```

## Snapshot Repository

### Create snapshot



## docker-compose.yml

Add the following:

```
volumes:
  elasticsearch-data:
  es_backup:    
```

```
 volumes:
      - elasticsearch-data:/usr/share/elasticsearch/data
      - es_backup:/usr/share/elasticsearch/es_backup
```

```
version: '3.5'

# To Join any other app setup using another network, change name and set external = true
networks:
  default:
    name: elastic
    external: false

# will contain all elasticsearch data.
volumes:
  elasticsearch-data:
  es_backup:        

secrets:
  elasticsearch.keystore:
    file: ./secrets/keystore/elasticsearch.keystore
  elastic.ca:
    file: ./secrets/certs/ca/ca.crt
  elasticsearch.certificate:
    file: ./secrets/certs/elasticsearch/elasticsearch.crt
  elasticsearch.key:
    file: ./secrets/certs/elasticsearch/elasticsearch.key
  kibana.certificate:
    file: ./secrets/certs/kibana/kibana.crt
  kibana.key:
    file: ./secrets/certs/kibana/kibana.key

services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}
    restart: unless-stopped
    environment:
      ELASTIC_USERNAME: ${ELASTIC_USERNAME}
      ELASTIC_PASSWORD: ${ELASTIC_PASSWORD}
      ELASTIC_CLUSTER_NAME: ${ELASTIC_CLUSTER_NAME}
      ELASTIC_NODE_NAME: ${ELASTIC_NODE_NAME}
      ELASTIC_INIT_MASTER_NODE: ${ELASTIC_INIT_MASTER_NODE}
      ELASTIC_DISCOVERY_SEEDS: ${ELASTIC_DISCOVERY_SEEDS}
      ES_JAVA_OPTS: "-Xmx${ELASTICSEARCH_HEAP} -Xms${ELASTICSEARCH_HEAP} -Des.enforce.bootstrap.checks=true -Dlog4j2.formatMsgNoLookups=true"
      bootstrap.memory_lock: "true"
    volumes:
      - elasticsearch-data:/usr/share/elasticsearch/data
      - es_backup:/usr/share/elasticsearch/es_backup  
      - ./elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
      - ./elasticsearch/config/log4j2.properties:/usr/share/elasticsearch/config/log4j2.properties
    secrets:
      - source: elasticsearch.keystore
        target: /usr/share/elasticsearch/config/elasticsearch.keystore
      - source: elastic.ca
        target: /usr/share/elasticsearch/config/certs/ca.crt
      - source: elasticsearch.certificate
        target: /usr/share/elasticsearch/config/certs/elasticsearch.crt
      - source: elasticsearch.key
        target: /usr/share/elasticsearch/config/certs/elasticsearch.key
    ports:
      - "9200:9200"
      - "9300:9300"
    ulimits:
      memlock:
        soft: -1
        hard: -1
      nofile:
        soft: 200000
        hard: 200000
    healthcheck:
      test: ["CMD", "sh", "-c", "curl -sf --insecure https://$ELASTIC_USERNAME:$ELASTIC_PASSWORD@localhost:9200/_cat/health | grep -ioE 'green|yellow' || echo 'not green/yellow cluster status'"]

  logstash:
    image: docker.elastic.co/logstash/logstash:${ELK_VERSION}
    restart: unless-stopped
    volumes:
      - ./logstash/config/logstash.yml:/usr/share/logstash/config/logstash.yml:ro
      - ./logstash/config/pipelines.yml:/usr/share/logstash/config/pipelines.yml:ro
      - ./logstash/pipeline:/usr/share/logstash/pipeline:ro
    secrets:
      - source: elastic.ca
        target: /certs/ca.crt
    environment:
      ELASTIC_USERNAME: ${ELASTIC_USERNAME}
      ELASTIC_PASSWORD: ${ELASTIC_PASSWORD}
      ELASTICSEARCH_HOST_PORT: https://${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}
      LS_JAVA_OPTS: "-Xmx${LOGSTASH_HEAP} -Xms${LOGSTASH_HEAP} -Dlog4j2.formatMsgNoLookups=true"
    ports:
      - "5044:5044"
      - "9600:9600"
    healthcheck:
      test: ["CMD", "curl", "-s" ,"-XGET", "http://127.0.0.1:9600"]

  kibana:
    image: docker.elastic.co/kibana/kibana:${ELK_VERSION}
    restart: unless-stopped
    volumes:
      - ./kibana/config/:/usr/share/kibana/config:ro
    environment:
      ELASTIC_USERNAME: ${ELASTIC_USERNAME}
      ELASTIC_PASSWORD: ${ELASTIC_PASSWORD}
      ELASTICSEARCH_HOST_PORT: https://${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}
    secrets:
      - source: elastic.ca
        target: /certs/ca.crt
      - source: kibana.certificate
        target: /certs/kibana.crt
      - source: kibana.key
        target: /certs/kibana.key
    ports:
      - "5601:5601"
```





1. Stop the ElasticSearch service.

```
systemctl stop elasticsearch
```

2. Create a local directory to store the Snapshot.

```
mkdir /backup
chown -R elasticsearch:elasticsearch /backup
```

3. Edit the ElasticSearch configuration file named: elasticsearch.yml

```
vi /etc/elasticsearch/elasticsearch.yml
```

Add the following line at the end of the file.

```
path.repo: ["/home/sherwinowen/my_lab/elk/es_backup"]

path.repo: ["/usr/share/elasticsearch/es_backup"]
```

4. Register a new Snapshot repository

Open Kibana goto Management > Stack Management > Snapshot and Restore > Repositories > Register repository

List all Snapshot repositories.

```
$ curl -X GET "http://localhost:9200/_snapshot/_all?pretty"{
  "es_backup" : {
    "type" : "fs",
    "settings" : {
      "location" : "/home/sherwinowen/my_lab/elk/es_backup"
    }
  }
}
```



5. Create a Snapshot of the ElasticSearch database.

**Using Devtools**

Open Kibana goto management > devtools

Create snapshot of all indices

```
PUT /_snapshot/es_backup/esdata
```



**Specific index**

```
PUT /_snapshot/es_backup/elk02srv01-2022.02.04-snapshot
{
  "indices": "elk02srv01-2022.02.04",
  "ignore_unavailable": "true",
  "include_global_state": false
} 
```



**Multiple indices**

```
PUT _snapshot/anurag_backup/snapshot_some_indices
{
 "indices": "index1, index2"
}
```



**List specific snapshot**

```
GET /_snapshot/es_backup/snapshot_sample
```



**List all the snapshot**

```
GET /_snapshot/es_backup/_all
```

**Using Curl**

Create a Snapshot of the ElasticSearch database.

```
curl -X PUT "http://localhost:9200/_snapshot/es_backup/snapshot_001?wait_for_completion=true&pretty"
```

- In our example, we created a snapshot named SNAPSHOT_001.
- In our example, we stored this snapshot inside the repository named: BACKUP.This 
- Snapshot stores all the Elasticsearch information.

Here is the command output:

Copy to Clipboard

```
{
  "snapshot" : {
    "snapshot" : "snapshot_001",
    "uuid" : "mJWX4FD9SVqFvzKpG7y3_w",
    "version_id" : 7060299,
    "version" : "7.6.2",
    "indices" : [ ],
    "include_global_state" : true,
    "state" : "SUCCESS",
    "start_time" : "2020-05-01T16:33:21.959Z",
    "start_time_in_millis" : 1588350801959,
    "end_time" : "2020-05-01T16:33:21.959Z",
    "end_time_in_millis" : 1588350801959,
    "duration_in_millis" : 0,
    "failures" : [ ],
    "shards" : {
      "total" : 0,
      "failed" : 0,
      "successful" : 0
    }
  }
}
```



To create a Snapshot of a specific ElasticSearch index, use the following command.

```
curl -X PUT "http://localhost:9200/_snapshot/backup/snapshot_index_account_001?wait_for_completion=true&pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "accounts",
  "ignore_unavailable": true,
  "include_global_state": false,
  "metadata": {
    "taken_by": "Bruno",
    "taken_because": "Backup of the index named ACCOUNTS"
  }
}
'
```

Here is the command output:

```
{
  "snapshot" : {
    "snapshot" : "snapshot_index_account_001",
    "uuid" : "Zfv3LmIoTbu9amZImqo15Q",
    "version_id" : 7060299,
    "version" : "7.6.2",
    "indices" : [
      "accounts"
    ],
    "include_global_state" : false,
    "metadata" : {
      "taken_by" : "Bruno",
      "taken_because" : "Backup of the index named ACCOUNTS"
    },
    "state" : "SUCCESS",
    "start_time" : "2020-05-01T18:10:21.027Z",
    "start_time_in_millis" : 1588356621027,
    "end_time" : "2020-05-01T18:10:21.227Z",
    "end_time_in_millis" : 1588356621227,
    "duration_in_millis" : 200,
    "failures" : [ ],
    "shards" : {
      "total" : 1,
      "failed" : 0,
      "successful" : 1
    }
  }
}
```

List all Snapshots available on the repository named BACKUP.

```
curl -X GET "http://192.168.100.7:9200/_cat/snapshots/backup?v&s=id&pretty"
```

Here is the command output:

```
id                          status start_epoch start_time end_epoch  end_time duration indices successful_shards failed_shards total_shards
snapshot_001               SUCCESS 1588350801  16:33:21   1588350801 16:33:21       0s       0                 0             0            0
snapshot_index_account_001 SUCCESS 1588356621  18:10:21   1588356621 18:10:21    200ms       1                 1             0            1
```

Use this command to list information from a specific Snapshot.

```
curl -X GET "http://192.168.100.7:9200/_snapshot/backup/snapshot_001?pretty"
```

Here is the command output:

```
{
  "snapshots" : [
    {
      "snapshot" : "snapshot_001",
      "uuid" : "mJWX4FD9SVqFvzKpG7y3_w",
      "version_id" : 7060299,
      "version" : "7.6.2",
      "indices" : [ ],
      "include_global_state" : true,
      "state" : "SUCCESS",
      "start_time" : "2020-05-01T16:33:21.959Z",
      "start_time_in_millis" : 1588350801959,
      "end_time" : "2020-05-01T16:33:21.959Z",
      "end_time_in_millis" : 1588350801959,
      "duration_in_millis" : 0,
      "failures" : [ ],
      "shards" : {
        "total" : 0,
        "failed" : 0,
        "successful" : 0
      }
    }
  ]
}
```

In our example, we listed the information from a Snapshot named SNAPSHOT_001 that was stored on the repository named BACKUP.

### Restore Snaphot

Copy repository folder in elastic_elasticsearch_1 container

```
docker cp -a es_backup/. elastic_elasticsearch_1:/usr/share/elasticsearch/es_backup/
```



**Using Devtools**

Show the snapshot info

```
GET /_snapshot/es_backup/_all
```


To restore the whole snapshot:

```
POST /_snapshot/es_backup/esdata/_restore
```



To restore an individual index:

```
POST /_snapshot/es_backup/esdata/_restore
{
  "indices": "logstash-2015.05.18"
}
```

To restore and rename the index:

```
POST /_snapshot/es_backup/esdata/_restore
{
  "indices": "logstash-2015.05.18",
  "rename_pattern": "logstash-2015.05.18",
  "rename_replacement": "logstash-new"
}
```



Close all index

```
POST _all/_close
```

Close index

```
POST .kibana-event-log-7.16.3-000001/_close
```



**Using Curl**

Restore the ElasticSearch Snapshot named: SNAPSHOT_INDEX_ACCOUNT_001

```
curl -X POST "http://localhost:9200/_snapshot/backup/snapshot_index_account_001/_restore?pretty"
```

Here is the command output:

```
{
  "accepted" : true
}
```



```
curl 'localhost:9200/_cat/indices?v'
```

