# Apache Tomcat 

**Download Java SE 8 JDK**

https://www.oracle.com/ph/java/technologies/javase/javase8u211-later-archive-downloads.html

- jdk-8u351-linux-x64.tar.gz

**Download Tomcat 9**

https://tomcat.apache.org/download-90.cgi

- apache-tomcat-9.0.72.tar.gz

## Install Java 8

```
# apt install openjdk-8-jdk
```

**Confirm Java Version**

```
# java -version
openjdk version "1.8.0_362"
OpenJDK Runtime Environment (build 1.8.0_362-8u362-ga-0ubuntu1~20.04.1-b09)
OpenJDK 64-Bit Server VM (build 25.362-b09, mixed mode)
```

**Extract apache-tomcat-9.0.72.tar.gz and jdk-8u351-linux-x64.tar.gz**

```
# tar -xvzf apache-tomcat-9.0.72.tar.gz .
# tar -xvzf jdk-8u351-linux-x64.tar.gz .
```

**Rename folder**

```
# mv jdk-8u351 jdk8
# mv apache-tomcat-9.0.72 tomcat9
```

**Start tomcat**

```
# tomcat9/bin/startup.sh 
```



