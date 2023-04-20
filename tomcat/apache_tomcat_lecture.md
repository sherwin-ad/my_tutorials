# Apache Tomcat 

# Install Apache Tomcal



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
cd /usr/binaries
```



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



# Enabling SSL - Generating Certificate

**Create SSL Key**

```
/usr/binaries/jdk8/bin# keytool -genkey -keyalg RSA -alias myKey -keystore /usr/binaries/sslkey/demoKey.jks
Enter keystore password:  
Keystore password is too short - must be at least 6 characters
Enter keystore password:  
Keystore password is too short - must be at least 6 characters
Enter keystore password:  
Re-enter new password: 
What is your first and last name?
  [Unknown]:  Demo
What is the name of your organizational unit?
  [Unknown]:  Demo Unit
What is the name of your organization?
  [Unknown]:  Demo Org
What is the name of your City or Locality?
  [Unknown]:  Demo City
What is the name of your State or Province?
  [Unknown]:  Demo Province
What is the two-letter country code for this unit?
  [Unknown]:  PH
Is CN=Demo, OU=Demo Unit, O=Demo Org, L=Demo City, ST=Demo Province, C=PH correct?
  [no]:  yes
```



**Uncomment this part and edit "certificateKeyFile"**

**tomcat/conf/server.xml**

```
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true">
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="/usr/binaries/sslkey/demoKey.jks"
                         type="RSA"
                         certificateKeystorePassword="abcd1234" />
        </SSLHostConfig>
    </Connector>
```



**Restart tomcat**

```
tomcat9/bin# ./shutdown.sh
tomcat9/bin# ./startup.sh
```

**Browse**

```
https://localhost:8443
```



## Redirect http to https

**Edit tomcat/webapps/manager/WEB-INF/web.xml**

And this lines

```
<user-data-constraint>
       <transport-guarantee>CONFIDENTIAL</transport-guarantee>     
</user-data-constraint>
```

Should look like this

```
<security-constraint>
    <web-resource-collection>
      <web-resource-name>HTML Manager interface (for humans)</web-resource-name>
      <url-pattern>/html/*</url-pattern>
    </web-resource-collection>
    <auth-constraint>
       <role-name>manager-gui</role-name>
    </auth-constraint>
    <user-data-constraint>
       <transport-guarantee>CONFIDENTIAL</transport-guarantee>     
    </user-data-constraint>
</security-constraint>
```

**Restart tomcat**

```
tomcat9/bin# ./shutdown.sh
tomcat9/bin# ./startup.sh
```

- Try to browse http://localhost:8080/manager it will redirect to https://localhost:8443/manager

## Virtual Host

1. Create folder website1-webapp, website2-webapp, website3-webapp in tomcat folder

   ```
   root@owenbox:/usr/binaries/tomcat9# ls -l 
   total 160
   drwxr-x--- 2 root root  4096 Mar  9 15:32 bin
   -rw-r----- 1 root root 19992 Feb 18 17:25 BUILDING.txt
   drwx------ 3 root root  4096 Mar  9 16:57 conf
   -rw-r----- 1 root root  6210 Feb 18 17:25 CONTRIBUTING.md
   drwxr-x--- 2 root root  4096 Mar  3 18:15 lib
   -rw-r----- 1 root root 57092 Feb 18 17:25 LICENSE
   drwxr-x--- 2 root root  4096 Mar  9 15:29 logs
   -rw-r----- 1 root root  2333 Feb 18 17:25 NOTICE
   -rw-r----- 1 root root  3398 Feb 18 17:25 README.md
   -rw-r----- 1 root root  6901 Feb 18 17:25 RELEASE-NOTES
   -rw-r----- 1 root root 16505 Feb 18 17:25 RUNNING.txt
   drwxr-x--- 2 root root  4096 Mar  3 18:15 temp
   drwxr-x--- 8 root root  4096 Mar  9 15:36 webapps
   drwxr-xr-x 3 root root  4096 Mar  9 20:24 website1-webapp
   drwxr-xr-x 3 root root  4096 Mar  9 20:24 website2-webapp
   drwxr-xr-x 3 root root  4096 Mar  9 20:24 website3-webapp
   drwxr-x--- 3 root root  4096 Mar  3 18:52 work
   ```

2. Create ROOT folder in website1-webapp, website2-webapp, website3-webapp folder

   ```
   ├── website1-webapp
   │   └── ROOT
   ├── website2-webapp
   │   └── ROOT
   ├── website3-webapp
   │   └── ROOT
   ```

3. Edit /tomcat/conf/server.xml

   Add the following lines:

   ```
         <Host name="localhost"  appBase="webapps"
               unpackWARs="true" autoDeploy="true">
          
    	    <!-- SingleSignOn valve, share authentication between web applications
                Documentation at: /docs/config/valve.html -->
           <!--
           <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
           -->
   
           <!-- Access log processes all example.
                Documentation at: /docs/config/valve.html
                Note: The pattern used is equivalent to using pattern="common" -->
           <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
                  prefix="localhost_access_log" suffix=".txt"
                  pattern="%h %l %u %t &quot;%r&quot; %s %b" />   
         </Host>
         <Host name="www.website1.com"  appBase="website1-webapps"
               unpackWARs="true" autoDeploy="true">
          
    	    <!-- SingleSignOn valve, share authentication between web applications
                Documentation at: /docs/config/valve.html -->
           <!--
           <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
           -->
   
           <!-- Access log processes all example.
                Documentation at: /docs/config/valve.html
                Note: The pattern used is equivalent to using pattern="common" -->
           <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
                  prefix="localhost_access_log" suffix=".txt"
                  pattern="%h %l %u %t &quot;%r&quot; %s %b" />   
         </Host>
         <Host name="www.website2.com"  appBase="website2-webapps"
               unpackWARs="true" autoDeploy="true">
          
    	    <!-- SingleSignOn valve, share authentication between web applications
                Documentation at: /docs/config/valve.html -->
           <!--
           <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
           -->
   
           <!-- Access log processes all example.
                Documentation at: /docs/config/valve.html
                Note: The pattern used is equivalent to using pattern="common" -->
           <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
                  prefix="localhost_access_log" suffix=".txt"
                  pattern="%h %l %u %t &quot;%r&quot; %s %b" />   
         </Host>
         <Host name="www.website3.com"  appBase="website3-webapps"
               unpackWARs="true" autoDeploy="true">
          
    	    <!-- SingleSignOn valve, share authentication between web applications
                Documentation at: /docs/config/valve.html -->
           <!--
           <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
           -->
   
           <!-- Access log processes all example.
                Documentation at: /docs/config/valve.html
                Note: The pattern used is equivalent to using pattern="common" -->
           <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
                  prefix="localhost_access_log" suffix=".txt"
                  pattern="%h %l %u %t &quot;%r&quot; %s %b" />   
         </Host>                                                      
   ```

4. Edit local dns /etc/hosts

   Add the following lines:

   ```
   127.0.0.1       www.website1.com
   127.0.0.1       www.website2.com
   127.0.0.1       www.website3.com
   ```

5. **Restart tomcat**

   ```
   tomcat9/bin# ./shutdown.sh
   tomcat9/bin# ./startup.sh
   ```









 
