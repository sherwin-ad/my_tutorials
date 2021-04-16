# Installing the Sakai 20.0 binary release on Ubuntu 20.04 LTS

Posted by:[Dustin](https://dustinkenney.com/author/d9f8fc/) - Posted on:May 10, 2020



![img](https://dustinkenney.com/wp-content/uploads/2020/05/SakaiLMS_large-Custom.png)



Last modified: 2020-05-12

The following is a guide on installing **Sakai 20.0** (binary release) on **Ubuntu 20.04 LTS**. Please note that this is a living document that I will continue to update as I learn more.

**NOTE 1**: The guide does not take security into consideration and is not written for production systems. Use at your own risk. The intention is to be able to install and learn more about Sakai in a test environment or virtual machine using recent packages.
**NOTE 2**: The version numbers or available mirrors in some of the commands may have changed on the vendor website since the time of writing. I advise making modifications as you proceed.

A huge help for this adapted guide were the following official guides, in addition to the references at the end of the document:

- Source-based installation guide from the Sakai GitHub located here: https://github.com/sakaiproject/sakai/wiki/Quick-Start-from-Source
- Binary-based installation guide from the Sakai Confluence page located here: https://confluence.sakaiproject.org/pages/viewpage.action?pageId=122617999

Improvements I would like to make to this guide:

- Figure out why Lessons module fails to load in course sites and project sites
  - Using `mariadb-server` and `libmariadb-java` instead of `mysql-server` and `mysql-connector-java` resolved this.
- Figure out why Statistics (Activity) fails to show metrics
  - Using `mariadb-server` and `libmariadb-java` instead of `mysql-server` and `mysql-connector-java` resolved this.
- Configure Tomcat as a service with minimum needed permissions and dedicated tomcat account
- Research file system permissions for Tomcat directory
- Set environment variables to persist after reboot
- Attempt source build to verify other setup component accuracy
- Determine why the time_zone in MySQL needs to be set after a reboot otherwise Sakai will not start
  - Using `mariadb-server` and `libmariadb-java` instead of `mysql-server` and `mysql-connector-java` resolved this.

Begin with a fresh installation of Ubuntu 20.04 LTS amd64.

Install curl, git, OpenJDK 8, MariaDB, and MariaDB Connector/J:

```
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install curl
sudo apt -y install git
sudo apt -y install openjdk-8-jdk
sudo apt -y install mariadb-server
sudo apt -y install libmariadb-java
```

Install Maven
This can be downloaded from:
https://maven.apache.org/download.cgi

```
cd /tmp
curl -O https://apache.claz.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
cd /opt
sudo tar -xvzf /tmp/apache-maven-3.6.3-bin.tar.gz
```

Install Tomcat 9
This can be downloaded from:
https://tomcat.apache.org/download-90.cgi

```
cd /tmp
curl -O https://apache.osuosl.org/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz
cd /opt
sudo tar xzvf /tmp/apache-tomcat-9.0.34.tar.gz
sudo ln -nsf apache-tomcat-9.0.34 tomcat
```

Secure MariaDB:

```
sudo mysql_secure_installation
```

Create MariaDB database, create database user, and configure privileges:

```
sudo mysql
create database sakaidatabase default character set utf8;
create user 'sakaiuser'@'localhost' identified by 'sakaipassword';
grant all  privileges on sakaidatabase.* TO 'sakaiuser'@'localhost';
flush privileges;
quit
```

Set environment variables:

```
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export MAVEN_HOME=/opt/apache-maven-3.6.3
export CATALINA_HOME=/opt/tomcat
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$CATALINA_HOME/bin
export MAVEN_OPTS='-Xms512m -Xmx1024m -Djava.util.Arrays.useLegacyMergeSort=true'
```

Copy MariaDB Connector/J to Tomcat installation directory:

```
sudo cp /usr/share/java/mariadb-java-client.jar /$CATALINA_HOME/lib
```

Create Sakai folder to house sakai.properties in /opt/tomcat:

```
cd /opt/tomcat
sudo mkdir sakai
cd sakai
sudo nano sakai.properties
```

Add the following minimum demonstration settings to sakai.properties (note the addition of a MariaDB database driver):

```
## MySQL settings
# Replace by whatever username you assigned in the database setup
username@javax.sql.BaseDataSource=sakaiuser
# Replace by whatever password you assigned to the sakaiuser in the database setup
password@javax.sql.BaseDataSource=sakaipassword

# use your sakaidatabase name in the URI that starts url@javax.sql.BaseDataSource= , below.

vendor@org.sakaiproject.db.api.SqlService=mysql
#driverClassName@javax.sql.BaseDataSource=com.mysql.jdbc.Driver
driverClassName@javax.sql.BaseDataSource=org.mariadb.jdbc.Driver
hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
url@javax.sql.BaseDataSource=jdbc:mysql://127.0.0.1:3306/sakaidatabase?useUnicode=true&characterEncoding=UTF-8
validationQuery@javax.sql.BaseDataSource=select 1 from DUAL
defaultTransactionIsolationString@javax.sql.BaseDataSource=TRANSACTION_READ_COMMITTED
```

Modify CATALINA_HOME/conf/context.xml to improve startup speed:

```
sudo nano $CATALINA_HOME/conf/context.xml
```

Within the <context> label add the following:

```
<JarScanner>
    <!-- This is to speedup startup so that tomcat doesn't scan as much -->
    <JarScanFilter defaultPluggabilityScan="false" />
</JarScanner>
```

Modify CATALINA_HOME/conf/server.xml for international character support (Sakai is internationalized and has 20 languages available):

```
sudo nano $CATALINA_HOME/conf/server.xml
```

Add URIEncoding to the <Connector> element:

```
port="8080" URIEncoding="UTF-8" ...
```

Create an executable setenv.sh file in the CATALINA_HOME/bin directory:

```
sudo nano $CATALINA_HOME/bin/setenv.sh
```

Add the following JAVA_OPTS to the setenv.sh file:

```
export JAVA_OPTS='-server -Xms512m -Xmx1024m -XX:PermSize=128m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true -Djava.util.Arrays.useLegacyMergeSort=true -Dsakai.demo=true'
```

Download and extract Sakai 20.0 binary to CATALINA_HOME:

```
cd /tmp
curl -O http://source.sakaiproject.org/release/20.0/artifacts/sakai-bin-20.0.tar.gz
cd $CATALINA_HOME
sudo tar xzvf /tmp/sakai-bin-20.0.tar.gz
```

Set permissions for Tomcat sub-directories:

```
cd /opt/tomcat
sudo chmod -R 755 bin conf webapps work components lib logs temp
```

Poke a hole in the Ubuntu firewall to allow TCP to port 8080:

```
sudo ufw allow 8080/tcp
```

Modify nano tomcat-users.xml with user information:

```
sudo nano /opt/tomcat/conf/tomcat-users.xml
```

For instance, add the following between <tomcat-users> and </tomcat-users> in tomcat-users.xml:

```
<user username="admin" password="password" roles="manager-gui,admin-gui"/>
```

Starting and stopping Tomcat while in /opt/tomcat/bin:

```
sudo sh startup.sh
sudo sh shutdown.sh
```

Accessing Sakai:

```
http://localhost:8080/portal
Admin default account:
Username: admin
Password: admin
```

Congratulations! This should be enough to get one started with a test environment, but more configuration options are to come.

![img](https://dustinkenney.com/wp-content/uploads/2020/05/Sakai20Screenshot.png)

![img](https://dustinkenney.com/wp-content/uploads/2020/05/Sakai20VersionPopup.png)

Helpful references used to create this document: