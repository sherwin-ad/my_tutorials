

### Jenkins in Docker

**Create jenkins docker-compose file**
docker-compose.yml

```
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins:latest
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
networks:
  net: 
```

**Start docker-compose file**

```
docker-compose up -d
```



**Go to Jenkins container terminal**

``` 
docker exec -it jenkins bash
```



**Create centos7 image via dockerfile**
Create Dockerfile
```
FROM centos:7

RUN yum install -y openssh-server

RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh 
    
COPY remote_key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D
```

**Update jenkins docker-compose file**
docker-compose.yml

```
version: '3'
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
  remote_host:
    container_name: remote-host
    image: remote-host
    build:
      context: centos7
    networks:
      - net
networks:
   net:
```

**Build Dockerfile and Update docker-compose file**
```
docker-compose build
docker-compose up -d
```

**Build MySQL Server on Docker**
```
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins:latest
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
  remote_host:
    container_name: remote-host
    image: remote-host
    build:
      context: centos7
    networks:
      - net
  db_host:
    container_name: db
    image: mysql:5.7
    environment: 
      - "MYSQL_ROOT_PASSWORD=1234"
    volumes:
      - "$PWD/db_data:/var/lib/mysql"
    networks:
      - net 
networks:
  net: 
```

**Backup MySQL database and upload it in AWS S3 Bucket**
```
#!/bin/bash

DATE=$(date +%m-%d-%Y-%H:%M:%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5


mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAZNBIMVGNXGWQWJ7O && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "uploading your $BACKUP backup" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP
```

### Install ansible docker + jenkins
**Create Dockerfile**
```
FROM jenkins/jenkins

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade

USER jenkins
```

**Update docker-compose.yml file**
```
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkins-ansible
    build:
      context: jenkins-ansible
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
  remote_host:
    container_name: remote-host
    image: remote-host
    build:
      context: centos7
    volumes:
      - "$PWD/script/aws-s3.sh:/tmp/script.sh"  
    networks:
      - net
  db_host:
    container_name: db
    image: mysql:5.7
    environment: 
      - "MYSQL_ROOT_PASSWORD=1234"
    volumes:
      - "$PWD/db_data:/var/lib/mysql"
    networks:
      - net 
networks:
  net: 
```

### Create ansible  inventory
hosts
```
[all:vars]

ansible_connection = ssh

[test]
test1 ansible_host=remote_host ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote_key
```

Ping test
```
ansible -i hosts -m ping test1
```

### Create ansible playbook
play.yml
```
- hosts: test1
  tasks:

  - shell: echo Hello World from Ansible > /tmp/ansible-file 
```

### Run ansible playbook
```
ansible$ ansible-playbook -i hosts play.yml 

PLAY [test1] ***********************************************************************

TASK [Gathering Facts] *************************************************************
ok: [test1]

TASK [shell] ***********************************************************************
changed: [test1]

PLAY RECAP *************************************************************************
test1                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```

### Bash Script Inserting data to Mysql DB

```
#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
  let counter=counter+1

  name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
  lastname=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}') 
  age=$(shuf -i 20-25 -n 1)

  mysql -u root -p1234 people -e "insert into register values ($counter, '$name', '$lastname', $age)" 
  echo "$counter, $name $lastname, $age was correctly imported":
done 
```

### Building a Docker Nginx Web Sever with PHP

#### Build the image
Dockerfile
```
FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN                                                                          \
  yum -y install nginx openssl && \
  yum install -y \
    yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
  yum-config-manager --enable remi-php74 && \   
  yum -y install    \
    php-fpm      \
    php-cli      \
    php-mysqlnd  \
    php-soap     \
    php-xml      \
    php-zip      \
    php-json     \
    php-mcrypt   \
    php-mbstring \
    php-zip      \
    php-gd       \
  yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm /var/run/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./conf/www.conf /etc/php-fpm.d/www.conf

COPY code /usr/share/nginx/html

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
```

**Update jenkins docker-compose file**
docker-compose.yml

```
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkins-ansible
    build:
      context: jenkins-ansible
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
  remote_host:
    container_name: remote-host
    image: remote-host
    build:
      context: centos7
    volumes:
      - "$PWD/script/aws-s3.sh:/tmp/script.sh"  
    networks:
      - net
  db_host:
    container_name: db
    image: mysql:5.7
    environment: 
      - "MYSQL_ROOT_PASSWORD=1234"
    volumes:
      - "$PWD/db_data:/var/lib/mysql"
    networks:
      - net
  web:
    container_name: web
    image: ansible-web
    build:
      context: jenkins-ansible/web
    ports:
      - "80:80"
    networks:
      - net
networks:
  net: 
```

**Build Dockerfile and Update docker-compose file**

```
docker-compose build
docker-compose up -d
```



**Integrate Docker Web Server to Ansible Inventory**

hosts

```
[all:vars]

ansible_connection = ssh

[test]
test1 ansible_host=remote_host ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote_key
web1 ansible_host=web ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote_key

```



**Check if the host added is reachable**

```
jenkins@d7b238ef8d7e:~/ansible$ ansible -m ping -i hosts web1
web1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
```



**Check if all the host added is reachable**

```
jenkins@d7b238ef8d7e:~/ansible$ ansible -m ping -i hosts all
web1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
test1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}

```

**Run ansible-playbook**

1. Create ansible playbook
   people.yml

   ```
   - hosts: web1
     tasks: 
       - name: Transfer template to web server
         template: 
           src: table.j2
           dest: /var/www/html/index.php
   ```

2. Create jinja2 template
   table.j2

   ```
   <!DOCTYPE html>
   <html>
   <head>
    <title>Table with database</title>
    <style>
     table {
      border-collapse: collapse;
      width: 100%;
      color: #588c7e;
      font-family: monospace;
      font-size: 25px;
      text-align: left;
        }
     th {
      background-color: #588c7e;
      color: white;
       }
     tr:nth-child(even) {background-color: #f2f2f2}
    </style>
   </head>
   <body>
    <table>
    <tr>
     <th>id</th>
     <th>name</th>
     <th>lastname</th>
     <th>age</th>
    </tr>
    <?php
     $conn = mysqli_connect("db", "root", "1234", "people");
     // Check connection
     if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
     }
     $sql = "SELECT id, name, lastname, age FROM register {% if PEOPLE_AGE is defined %} where age = {{ PEOPLE_AGE }} {% endif %}";
     $result = $conn->query($sql);
     if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
       echo "<tr><td>" . $row["id"]. "</td><td>" . $row["name"] . "</td><td>"
   . $row["lastname"]. "</td><td>" . $row["age"]. "</td></tr>";
     }
       echo "</table>";
     } else { echo "0 results"; }
     $conn->close();
   ?>
   </table>
   </body>
   </html>
   ```


3. Change the ownership of folder html

   ```
   chown remote_user:remote_user /var/www/html/ -R
   ```

4. Run ansible playbook

   ```
   # Display all the records in the table
   ansible-playbook -i hosts people.yml 
   
   # Display records with age of 25
   ansible$ ansible-playbook -i hosts people.yml -e "PEOPLE_AGE=25"
   ```

**Build in Jenkins**

1. Create new item using Freestyle project. Check This project is parameterized and Add Parameter

   ![](images/parameter.png)

   

   2. Build > Invoke Ansible Playbook

      ![](images/build.png)

   

   3. Click Advanced and add Extra Variables

      ![](images/extra_var.png)

   

   ### Jenkins Global Environment Variables

   https://wiki.jenkins.io/display/JENKINS/Building+a+software+project



### 		Create your own Global Environment Variables

​      Go to Jenkins > Manage Jenkins > System Configuration > Global properties > check the Environment   	    	  variables add click Add to add variables



​      ![](images/global_environment_variables.png)



### 	Execute jobs automatically using Jenkins

​	Go to Project > Configure > Build Triggers and check Build periodically

![](images/build_triggers_periodically.png)



### 	Execute Jenkins jobs from external source

 1. Create a Build User in Jenkins

    Login to Jenkins as Admin User -> Manage Jenkins -> Manage Users -> Create User

2. Create an Authentication Token for Build User

​       Login to Jenkins as BuildUser -> Click on the user and Configure

  	 Enter Name for the Token AuthToken  and click on Generate

​       ![](images/generate_token.png)

3. Go to Manage Jenkins > Manage and Assign Roles

   Create role that has build and read credentials in Jobs and assign the user to this role



```

# Create crumb
crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')


# Without parameters
curl -u "jenkins:111e17fdc836926be8a0f3ad0291be3a83" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec


# With parameters
curl -u "jenkins:111e17fdc836926be8a0f3ad0291be3a83" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-back

curl -u "jenkins:111e17fdc836926be8a0f3ad0291be3a83" -H "$crumb" -X POST  http://jenkins.local:8080/job/ansible-users-db/buildWithParameters?AGE=22

```



  ### Job DSL

* was one of the first popular plugins for **Jenkins** which allows managing configuration as code

1. Add DSL plugins
2. Go to Build > Add Process Job DSL 



#### Create Job Item

```
job('example') {
    
}
```

#### Create Job Item with description

```
job('example') {
    description('My first job')
}
```


#### Parameters

```
job('job_dsl_example') {

    description('This is my awesome Job')
  
    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

}
```

#### Source Code Management

```
job('job_dsl_example') {

    description('This is my awesome Job')

    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master')
    }

}
```

#### Source Code Management

```
job('job_dsl_example') {

    description('This is my awesome Job')

    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master')
    }

}
```

#### Triggers

```
job('job_dsl_example') {

    description('This is my awesome Job')
  
    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master')
    }

    triggers {
        cron('H 5 * * 7')
    }

}
```



#### Steps

```
job('job_dsl_example') {

    description('This is my awesome Job')
  
    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master')
    }

    triggers {
        cron('H 5 * * 7')
    }

    steps {
        shell("echo 'Hello World'")
    }
}
```

Multiple step lines

```
steps {
        shell("""
                echo 'Hello World'
                echo 'Running script'
                /tmp/script.sh
              """)
      }
```

#### Mailer

```
job('job_dsl_example') {

    description('This is my awesome Job')

    parameters {
        stringParam('Planet', defaultValue = 'world', description = 'This is the world')
	    booleanParam('FLAG', true)
        choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
    }

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master')
    }

    triggers {
        cron('H 5 * * 7')
    }

    steps {
        shell("echo 'Hello World'")
        shell("echo 'Hello World2'")
    }

    publishers {
        mailer('me@example.com', true, true)
    }
}
```

#### Ansible Job DSL

```
job('ansible-users-db-dsl') {

    description('Update the html table based on the input')

  
    parameters {
        choiceParam('AGE', ['21 (default)', '22', '23', '24', '25'])
    }

    steps {

        wrappers {
            colorizeOutput(colorMap = 'xterm')
        }
        ansiblePlaybook('/var/jenkins_home/ansible/people.yml') {
            inventoryPath('/var/jenkins_home/ansible/hosts')
            colorizedOutput(true)
            extraVars {
                extraVar("PEOPLE_AGE", '${AGE}', false)
            }
        }
    }

}
```

#### Maven Job DSL

```
job('maven_dsl') {

    description('Maven dsl project')

    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app', 'master', {node -> node / 'extensions' << '' })
    }
  
    steps {
        maven {
            mavenInstallation('jenkins-maven')
            goals('-B -DskipTests clean package')
        }
        maven {
            mavenInstallation('jenkins-maven')
            goals('test')
        }
        shell('''
            echo ************RUNNING THE JAR************************     
            java -jar /var/jenkins_home/workspace/mavn/target/my-app-1.0-SNAPSHOT.jar
        ''')
    }

    publishers {
        archiveArtifacts('target/*.jar')
        archiveJunit('target/surefire-reports/*.xml')
        mailer('ricardo.andre.gonzalez07@gmail.com', true, true)
    }
}
```



### Declarative Pipeline

```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
```

#### Multiple Steps

```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "My first pipeline"'
                sh '''
                    echo "By the way, I can do more stuff in here"
                    ls -lah
                '''
            }
        }
    }
}
```

#### Retry

```
pipeline {
    agent any
    stages {
        stage('Timeout') {
            steps {
                retry(3) {
                    sh 'I am not going to work :c'
                }
            }
        }
    }
}
```

#### Timeout

```
pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                retry(3) {
                    sh 'echo hello'
                }

                timeout(time: 3, unit: 'SECONDS') {
                    sh 'sleep 5'
                }
            }
        }
    }
}
```

#### Environment Variables

```
pipeline {
    agent any

    environment {
        NAME = 'ricardo'
        LASTNAME = 'gonzalez'
    }

    stages {
        stage('Build') {
            steps {
                sh 'echo $NAME $LASTNAME'
            }
        }
    }
}
```

#### Credentials

```
pipeline {
    agent any

    environment {
        secret = credentials('TEST')
    }
    stages {
        stage('Example stage 1') {
            steps {
                sh 'echo $secret'
            }
        }
    }
}
```

#### Post Actions

```
pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'echo "Fail!"; exit 1'
            }
        }
    }
    post {
        always {
            echo 'I will always get executed :D'
        }
        success {
            echo 'I will only get executed if this success'
        }
        failure {
            echo 'I will only get executed if this fails'
        }
        unstable {
            echo 'I will only get executed if this is unstable'
        }
    }
}
```

