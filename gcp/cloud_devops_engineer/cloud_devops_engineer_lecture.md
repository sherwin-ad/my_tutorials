# GCP Cloud Devops Engineer

## Basics of Docker

### Create a Simple WebApp on Cloud Shell

 Check if python and flask is installed in Cloud Shell

```
sherwinowen@cloudshell:~ (gcp-devops-379408)$ python3
Python 3.9.2 (default, Feb 28 2021, 17:03:44)
[GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import flask
>>> flask.__version__
'2.2.3'
```

or

```
sherwinowen@cloudshell:~ (gcp-devops-379408)$ pip3 show flask
Name: Flask
Version: 2.2.3
Summary: A simple framework for building complex web applications.
Home-page: https://palletsprojects.com/p/flask
Author: Armin Ronacher
Author-email: armin.ronacher@active-4.com
License: BSD-3-Clause
Location: /usr/local/lib/python3.9/dist-packages
Requires: Jinja2, importlib-metadata, itsdangerous, Werkzeug, click
Required-by: Flask-PyMongo
```

main.py

```
from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
        return 'Welcome to Python Flask World'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```



```
sherwinowen@cloudshell:~ (gcp-devops-379408)$ python3 main.py
 * Serving Flask app 'main'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:8080
 * Running on http://172.17.0.4:8080
Press CTRL+C to quit
127.0.0.1 - - [03/Mar/2023 01:15:41] "GET /?authuser=0&redirectedPreviously=true HTTP/1.1" 200 -
127.0.0.1 - - [03/Mar/2023 01:15:41] "GET /favicon.ico HTTP/1.1" 404 -
```



Click Web Preview button

![image-20230303091912305](images/image-20230303091912305.png)

### Create Dockerfile

Dockerfile

```
FROM python:3.9-slim
RUN pip install flask
WORKDIR /myapp
COPY main.py /myapp/main.py
CMD ["python", "/myapp/main.py"]
```

main.py

```
from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
        return 'Welcome to Python Flask World'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

**Build image**

```
$ docker build -t gcr.io/gcp-devops-379408/myfimage:v1.0 .
[+] Building 10.2s (9/9) FINISHED
 => [internal] load .dockerignore                                                                                                                 0.1s
 => => transferring context: 2B                                                                                                                   0.0s
 => [internal] load build definition from Dockerfile                                                                                              0.1s

$ docker images
REPOSITORY                          TAG       IMAGE ID       CREATED          SIZE
gcr.io/gcp-devops-379408/myfimage   v1.0      f425c92fc927   37 seconds ago   136MB
```

**Run image**

```
$ docker run -p 9090:8080 gcr.io/gcp-devops-379408/myfimage:v1.0
 * Serving Flask app 'main'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:8080
 * Running on http://172.18.0.2:8080
Press CTRL+C to quit
```

**Push image**

```
$ docker push gcr.io/gcp-devops-379408/myfimage:v1.0
The push refers to repository [gcr.io/gcp-devops-379408/myfimage]
eeac318eb8a2: Pushed
9cce845236fb: Pushed
96b40c8bf4bb: Pushed
1982ff1bb0b0: Layer already exists
8efb5f7a4a15: Layer already exists
0d8a86274fa7: Layer already exists
7d13900c8624: Layer already exists
650abce4b096: Layer already exists
v1.0: digest: sha256:b13077d87de14cf2d37fd5bc70004d9993f73d03a335c4ee4e93a6b192f9b
```



## Docker, Container and Registry

### Create first docker images

**server.js**

```
var http = require('http');
var handleRequest = function(request, response) {
    response.writeHead(200);
    response.end("<h1> Welcome to Container world : Docker </h1>");
}
var www = http.createServer(handleRequest);
www.listen(8080);
```

**Dockerfile**

```
FROM node
EXPOSE 8080
COPY server.js .
CMD node server.js
```

**Test server.js  script**

```
$ node server.js
```

![image-20230307085545121](images/image-20230307085545121.png)

**Build image**

```
$ docker build -t myapp:v1.0 .
[+] Building 21.7s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                              0.1s
 => => transferring dockerfile: 94B                                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                                 0.0s
 => => transferring context: 2B                                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                    1.1s
 => [internal] load build context                                                                                                                 0.0s
 => => transferring context: 276B                                                                                                                 0.0s
 => [1/2] FROM docker.io/library/node@sha256:83841d113e09345a28b146e431f15b062341c5449218e501ba45ef8f9cff6049                                    18.9s
 => => resolve docker.io/library/node@sha256:83841d113e09345a28b146e431f15b062341c5449218e501ba45ef8f9cff6049                                     0.0s
 => => sha256:5b1b50e1f3f5943112b837836b060376fefecdf1d8d049a9514086b6d52b1fb8 2.21kB / 2.21kB                                                    0.0s
 => => sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604 10.88MB / 10.88MB                                                  0.2s
 => => sha256:83841d113e09345a28b146e431f15b062341c5449218e501ba45ef8f9cff6049 1.21kB / 1.21kB                                                    0.0s
 => => sha256:fe9a4b9e181a9dd1b2c87e89dad17f0e7624e97b7bb0ea0bffceac139ca4ddc6 7.51kB / 7.51kB                                                    0.0s
 => => sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0 55.05MB / 55.05MB                                                  0.7s
 => => sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf 5.17MB / 5.17MB                                                    0.2s
 => => sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d 54.59MB / 54.59MB                                                  0.9s
 => => sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c 196.81MB / 196.81MB                                                3.3s
 => => sha256:4f4cf292bc62eeea8a34b4160f3ef1f335b6b7b2bb9d28c605dc4002c8a24bc2 4.21kB / 4.21kB                                                    0.7s
 => => sha256:8347f8b4b86bb4cef9be45637fde2c2718c758a5842f3acf19c1c06e2768dbf5 46.16MB / 46.16MB                                                  1.6s
 => => extracting sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0                                                         2.9s
 => => sha256:c5f20f1b08565a46ecc130c2c8c302015f74d03d88278d7ee72889b06e120898 2.28MB / 2.28MB                                                    1.1s
 => => sha256:d220dfa3e18768d4b6befe0f90b462e6136a99543be319110a2324e963765f42 449B / 449B                                                        1.1s
 => => extracting sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf                                                         0.3s
 => => extracting sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604                                                         0.3s
 => => extracting sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d                                                         2.4s
 => => extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c                                                         7.5s
 => => extracting sha256:4f4cf292bc62eeea8a34b4160f3ef1f335b6b7b2bb9d28c605dc4002c8a24bc2                                                         0.0s
 => => extracting sha256:8347f8b4b86bb4cef9be45637fde2c2718c758a5842f3acf19c1c06e2768dbf5                                                         2.5s
 => => extracting sha256:c5f20f1b08565a46ecc130c2c8c302015f74d03d88278d7ee72889b06e120898                                                         0.2s
 => => extracting sha256:d220dfa3e18768d4b6befe0f90b462e6136a99543be319110a2324e963765f42                                                         0.0s
 => [2/2] COPY server.js .                                                                                                                        1.5s
 => exporting to image                                                                                                                            0.0s
 => => exporting layers                                                                                                                           0.0s
 => => writing image sha256:2ca21b8a8263ebc6589b584567225fd807c6aa85769bbcdbbc08fa6fa9a1aa89                                                      0.0s
 => => naming to docker.io/library/myapp:v1.0                                                              
```

**List images**

```
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
myapp        v1.0      2ca21b8a8263   38 seconds ago   999MB
```



### Optimize dcocker images and run docker container

**Dockerfile**

```
FROM node:
EXPOSE 8080
COPY server.js .
CMD node server.js
```

**Build image**

```
$ docker build -t myapp:v1.0 .
[+] Building 5.1s (7/7) FINISHED
 => [internal] load .dockerignore                                                                                                                 0.0s
 => => transferring context: 2B                                                                                                                   0.0s
 => [internal] load build definition from Dockerfile                                                                                              0.0s
 => => transferring dockerfile: 109B                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/node:19-alpine3.16                                                                             1.2s
 => [internal] load build context                                                                                                                 0.0s
 => => transferring context: 276B                                                                                                                 0.0s
 => [1/2] FROM docker.io/library/node:19-alpine3.16@sha256:f5b2f5862dec95bd1d83991efe71470b31607e915b7d3495f73e078726a0ab04                       3.1s
 => => resolve docker.io/library/node:19-alpine3.16@sha256:f5b2f5862dec95bd1d83991efe71470b31607e915b7d3495f73e078726a0ab04                       0.0s
 => => extracting sha256:ef5531b6e74e7865f5d142926b572d742ad47c153211de707903b4f5dd8d9e77                                                         0.2s
 => => sha256:d50abd2625cdf62d2db66d62a8f8dd5be9316ade7df50913a08e71547b9b24e0 47.94MB / 47.94MB                                                  0.7s
 => => sha256:bb413c268b2046cfeb14cb07cff40874ba407529dcb80da5c4ec2f0e14236678 2.35MB / 2.35MB                                                    0.1s
 => => sha256:df6096689c3e44d6098ddab5f742db1e6d34d907eaa7f789c077426ea60772ff 450B / 450B                                                        0.2s
 => => sha256:f5b2f5862dec95bd1d83991efe71470b31607e915b7d3495f73e078726a0ab04 1.43kB / 1.43kB                                                    0.0s
 => => sha256:790c72e7ddea6f08470cb33bdcdd39b24c4f767ff297f3130626e0c98b80ee7a 1.16kB / 1.16kB                                                    0.0s
 => => sha256:d75ece5b9b346378f87bcf3b63595c9a7298e3d661d94612346c571ea1a4d648 6.44kB / 6.44kB                                                    0.0s
 => => sha256:ef5531b6e74e7865f5d142926b572d742ad47c153211de707903b4f5dd8d9e77 2.81MB / 2.81MB                                                    0.1s
 => => extracting sha256:d50abd2625cdf62d2db66d62a8f8dd5be9316ade7df50913a08e71547b9b24e0                                                         1.8s
 => => extracting sha256:bb413c268b2046cfeb14cb07cff40874ba407529dcb80da5c4ec2f0e14236678                                                         0.1s
 => => extracting sha256:df6096689c3e44d6098ddab5f742db1e6d34d907eaa7f789c077426ea60772ff                                                         0.0s
 => [2/2] COPY server.js .                                                                                                                        0.7s
 => exporting to image                                                                                                                            0.0s
 => => exporting layers                                                                                                                           0.0s
 => => writing image sha256:a6148e1b38f60cd61ef5fae0fec52e156bf352e1ca62ec5cbe872fb6b22fe9bc                                                      0.0s
 => => naming to docker.io/library/myapp:v1.0                                                                                                            
```

**List image**

```
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
myapp        v1.0      a6148e1b38f6   10 seconds ago   174MB
```

**Run docker image**

```
$ docker run -d -p 8082:8080 myapp:v1.0
a24301d47fe2fafcbde3a7eca401b4f2f11449c1c9ca68cc9af426ced5d211dc

$ docker ps
CONTAINER ID   IMAGE        COMMAND                  CREATED              STATUS              PORTS                    NAMES
a24301d47fe2   myapp:v1.0   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:8082->8080/tcp   zen_spence
```

![image-20230307104512659](images/image-20230307104512659.png)

**Stop running container** 

```
$ docker stop a24301d47fe2
a24301d47fe2

$ docker ps -a
CONTAINER ID   IMAGE        COMMAND                  CREATED         STATUS                        PORTS     NAMES
a24301d47fe2   myapp:v1.0   "docker-entrypoint.s…"   5 minutes ago   Exited (137) 20 seconds ago             zen_spence
```

**Remove container**

```
$ docker rm a24301d47fe2
a24301d47fe2

$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

### Push docker image to Container registry

**Naming convention**

- HostName/ProjectID/ImageName
- gcr.io/[ProjectID]/nginx:1.0

**Create a tag TARGET_IMAGE**

```
$ docker tag myapp:v1.0 gcr.io/$DEVSHELL_PROJECT_ID/myapp:v1.0

$ docker images
REPOSITORY                       TAG       IMAGE ID       CREATED          SIZE
myapp                            v1.0      a6148e1b38f6   26 minutes ago   174MB
gcr.io/gcp-devops-379408/myapp   v1.0      a6148e1b38f6   26 minutes ago   174MB
```

**Push image to Container registry**

```
$ docker push gcr.io/gcp-devops-379408/myapp:v1.0
The push refers to repository [gcr.io/gcp-devops-379408/myapp]
9cb91f58bfb5: Pushed
ffa7464fd1a4: Layer already exists
cef63ef2ff34: Layer already exists
1bbd7bb69a3a: Layer already exists
aa5968d388b8: Layer already exists
v1.0: digest: sha256:37ad21e7cf123ae6c72c32c9deb7a622c631343dba9ed1a51019c6723ac82386 size: 1365
```



### Introduction to Artifact Registry

**Artifact Registry**

- Artifact Registry comes with fine-grained access control via Cloud IAM

- Multiple Repository per project

- Regional & Multi-region repositories

- It can store not just Docker image but many more thing like NPM, maven, Python

- asia-southeast1-docker.pkg.dev/[ProjectID]/[repo]/nginx:v1.0

- Create Repo (Not Required for Container Registry)

  

**Artifact Registry Role**

![image-20230307113132388](images/image-20230307113132388.png)



### Push docker image to Artifact Registry

- Configure :

  - gcloud auth configure-docker asia-southeast1-docker.pkg.dev

    ```
    $ gcloud auth configure-docker asia-southeast1-docker.pkg.dev
    ```

    **Check configurastion**

    ```
    $ cat /home/sherwinowen/.docker/config.json 
    {
      "credHelpers": {
        "gcr.io": "gcloud",
        "us.gcr.io": "gcloud",
        "eu.gcr.io": "gcloud",
        "asia.gcr.io": "gcloud",
        "staging-k8s.gcr.io": "gcloud",
        "marketplace.gcr.io": "gcloud",
        "asia-east1-docker.pkg.dev": "gcloud",
        "asia-southeast1-docker.pkg.dev": "gcloud"
      }
    }
    ```

    

- Let's see

  - How to configure via gcloud
  
  - Push image to Artifact Registry
  
    **Create a tag TARGET_IMAGE**
  
    ```
    $ docker tag myapp:v1.0 asia-southeast1-docker.pkg.dev/gcp-devops-379408/demorepo/myapp:v1.0
    
    $ docker images
    REPOSITORY                                                        TAG       IMAGE ID       CREATED             SIZE
    asia-southeast1-docker.pkg.dev/gcp-devops-379408/demorepo/myapp   v1.0      a6148e1b38f6   About an hour ago   174MB
    myapp                                                             v1.0      a6148e1b38f6   About an hour ago   174MB
    gcr.io/gcp-devops-379408/myapp                                    v1.0      a6148e1b38f6   About an hour ago   174MB
    ```
  
    **Push image to Artifact Registry**
  
    ```
    $ docker push asia-southeast1-docker.pkg.dev/gcp-devops-379408/demorepo/myapp:v1.0
    The push refers to repository [asia-southeast1-docker.pkg.dev/gcp-devops-379408/demorepo/myapp]
    9cb91f58bfb5: Pushed
    ffa7464fd1a4: Pushed
    cef63ef2ff34: Pushed
    1bbd7bb69a3a: Pushed
    aa5968d388b8: Pushed
    v1.0: digest: sha256:37ad21e7cf123ae6c72c32c9deb7a622c631343dba9ed1a51019c6723ac82386 size: 1365
    ```
  
    ![image-20230307120355655](images/image-20230307120355655.png)



## Deploy Application on Google Cloud

### Deployment methods

- **Blue/green Deployment**

  ![image-20230307121451183](images/image-20230307121451183.png)

- **Rolling Deployment**

  ![image-20230307121556821](images/image-20230307121556821.png)

- **Canary Deployment**

  ![image-20230307121635425](images/image-20230307121635425.png)

- **Traffic splitting Deployment**

  - Small Percentage of user will be served new version (ex : 10-20%)
  - If everything is fine, Redirect all user to new version.
  - Traffic splitting can be used for A/B Testing.



### Deploy Cloud Functions





### Deploy app on Google App Engine



**Check python and flask version**

```
$ python3
Python 3.9.2 (default, Feb 28 2021, 17:03:44)
[GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import flask
>>> print(flask.__version__)
2.2.3
```

**main.py**

```
from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
        return 'Welcome to Python Flask World'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

**requirements.txt**

```
FLASK==2.2.3
```

**app.yaml**

```
runtime: python39
```



