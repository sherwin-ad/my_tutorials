# SSL/TLS Settings

## Test your SSL/TLS Settings

```
$ nmap --script ssl-enum-ciphers -p 443 tpb.gov.ph
Starting Nmap 7.80 ( https://nmap.org ) at 2024-03-15 14:38 PST
Nmap scan report for tpb.gov.ph (104.22.51.235)
Host is up (0.066s latency).
Other addresses for tpb.gov.ph (not scanned): 104.22.50.235 172.67.25.112 2606:4700:10::6816:32eb 2606:4700:10::6816:33eb 2606:4700:10::ac43:1970

PORT    STATE SERVICE
443/tcp open  https
| ssl-enum-ciphers: 
|   TLSv1.0: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (ecdh_x25519) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (ecdh_x25519) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|     compressors: 
|       NULL
|     cipher preference: server
|     warnings: 
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|   TLSv1.1: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (ecdh_x25519) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (ecdh_x25519) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|     compressors: 
|       NULL
|     cipher preference: server
|   TLSv1.2: 
|     ciphers: 
|       TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256-draft (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (ecdh_x25519) - A
|       TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256-draft (ecdh_x25519) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_GCM_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_GCM_SHA384 (rsa 2048) - A
|     compressors: 
|       NULL
|     cipher preference: client
|_  least strength: C

Nmap done: 1 IP address (1 host up) scanned in 5.93 seconds

```

OR

```
$ curl -I -v --tlsv1.2 --tls-max 1.2 https://www.tpb.gov.ph
*   Trying 104.22.51.235:443...
* Connected to www.tpb.gov.ph (104.22.51.235) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS header, Certificate Status (22):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Certificate Status (22):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-ECDSA-CHACHA20-POLY1305
* ALPN, server accepted to use h2
* Server certificate:
*  subject: C=US; ST=California; L=San Francisco; O=Cloudflare, Inc.; CN=tpb.gov.ph
*  start date: Aug 24 00:00:00 2023 GMT
*  expire date: Aug 23 23:59:59 2024 GMT
*  subjectAltName: host "www.tpb.gov.ph" matched cert's "*.tpb.gov.ph"
*  issuer: C=US; O=Cloudflare, Inc.; CN=Cloudflare Inc ECC CA-3
*  SSL certificate verify ok.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x55a4726f3eb0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> HEAD / HTTP/2
> Host: www.tpb.gov.ph
> user-agent: curl/7.81.0
> accept: */*
> 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200 
HTTP/2 200 
< date: Fri, 15 Mar 2024 08:03:14 GMT
date: Fri, 15 Mar 2024 08:03:14 GMT
< content-type: text/html; charset=UTF-8
content-type: text/html; charset=UTF-8
< cf-edge-cache: cache,platform=wordpress
cf-edge-cache: cache,platform=wordpress
< access-control-allow-methods: GET,POST
access-control-allow-methods: GET,POST
< access-control-allow-headers: Content-Type, Authorization
access-control-allow-headers: Content-Type, Authorization
< content-security-policy: upgrade-insecure-requests;
content-security-policy: upgrade-insecure-requests;
< cross-origin-embedder-policy: unsafe-none; report-to='default'
cross-origin-embedder-policy: unsafe-none; report-to='default'
< cross-origin-embedder-policy-report-only: unsafe-none; report-to='default'
cross-origin-embedder-policy-report-only: unsafe-none; report-to='default'
< cross-origin-opener-policy: unsafe-none
cross-origin-opener-policy: unsafe-none
< cross-origin-opener-policy-report-only: unsafe-none; report-to='default'
cross-origin-opener-policy-report-only: unsafe-none; report-to='default'
< cross-origin-resource-policy: cross-origin
cross-origin-resource-policy: cross-origin
< permissions-policy: accelerometer=(), autoplay=(), camera=(), cross-origin-isolated=(), display-capture=(self), encrypted-media=(), fullscreen=*, geolocation=(self), gyroscope=(), keyboard-map=(), magnetometer=(), microphone=(), midi=(), payment=*, picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), sync-xhr=(), usb=(), xr-spatial-tracking=(), gamepad=(), serial=()
permissions-policy: accelerometer=(), autoplay=(), camera=(), cross-origin-isolated=(), display-capture=(self), encrypted-media=(), fullscreen=*, geolocation=(self), gyroscope=(), keyboard-map=(), magnetometer=(), microphone=(), midi=(), payment=*, picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), sync-xhr=(), usb=(), xr-spatial-tracking=(), gamepad=(), serial=()
< referrer-policy: strict-origin-when-cross-origin
referrer-policy: strict-origin-when-cross-origin
< strict-transport-security: max-age=15552000; includeSubDomains; preload
strict-transport-security: max-age=15552000; includeSubDomains; preload
< x-content-security-policy: default-src 'self'; img-src *; media-src * data:;
x-content-security-policy: default-src 'self'; img-src *; media-src * data:;
< x-content-type-options: nosniff
x-content-type-options: nosniff
< x-frame-options: SAMEORIGIN
x-frame-options: SAMEORIGIN
< x-xss-protection: 1; mode=block
x-xss-protection: 1; mode=block
< x-permitted-cross-domain-policies: none
x-permitted-cross-domain-policies: none
< link: <https://www.tpb.gov.ph/wp-json/>; rel="https://api.w.org/", <https://www.tpb.gov.ph/wp-json/wp/v2/pages/5>; rel="alternate"; type="application/json", <https://www.tpb.gov.ph/>; rel=shortlink
link: <https://www.tpb.gov.ph/wp-json/>; rel="https://api.w.org/", <https://www.tpb.gov.ph/wp-json/wp/v2/pages/5>; rel="alternate"; type="application/json", <https://www.tpb.gov.ph/>; rel=shortlink
< cf-cache-status: DYNAMIC
cf-cache-status: DYNAMIC
< server: cloudflare
server: cloudflare
< cf-ray: 864afc5a2aa35df9-HKG
cf-ray: 864afc5a2aa35df9-HKG

< 
* Connection #0 to host www.tpb.gov.ph left intact

```



## Disable TLS 1.0 and TLS 1.1 in cPanel

1. [Log into WebHost Manager (WHM) as root](https://www.inmotionhosting.com/support/edu/whm/log-into-whm/).

2. On the left, select **Apache Configuration**.

3. Select **Global Configuration**.

4. Beside

    

   SSL/TLS Protocols

   . you’ll likely see text similar to the following:

    

   ```
   SSLv23:!SSLv2:!SSLv3:!TLSv1:!TLSv1_1
   ```

   . Select the radio button beside “

   TLSv1.2

   ```
   default
   ```

   .” If you wish to support the latest TLS version, TLS 1.3, select the radio button beside the text field and type the following:

   **after**

   ```
   TLSv1.2 +TLSv1.3 
   ```

   **before**

   ```
   all -SSLv2 -SSLv3
   ```

   

5. At the bottom, select **Save**.

6. Select **Rebuild Configuration and Restart Apache**.

7. If your cPanel server runs Nginx, follow the [Nginx section below](https://www.inmotionhosting.com/support/website/ssl/disable-tls-versions/#nginx). If not, [test your TLS settings](https://www.inmotionhosting.com/support/website/ssl/disable-tls-versions/#test).

## Enable TLS 1.2 in Cloudflare

Edit the following setting from the cloudflare panel. SSL/TLS > Edge Certificates > Minimum TLS Version > TLS 1.2



# HTTP Strict Transport Security (HSTS)

## Enable HTTP Strict Transport Security (HSTS) in Cloudflare

https://developers.cloudflare.com/ssl/edge-certificates/additional-options/http-strict-transport-security/



## Enable HSTS on a cPanel server

**Procedure**

1. Log into WHM as the 'root' user.

2. Navigate to "*WHM / Service Configuration / Apache Configuration*."

3. Click "*Include Editor*."

4. Select "All Versions" from the drop-down menu under "*Pre-Main Include*."

5. Add the following text.

   ```
   <IfModule mod_headers.c>
   Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
   Header always edit Set-Cookie (.*) "$1;HttpOnly;Secure"
   Header always set X-Frame-Options "sameorigin"
   Header setifempty Referrer-Policy: same-origin
   Header set X-XSS-Protection "1; mode=block"
   Header set X-Permitted-Cross-Domain-Policies "none"
   Header set Referrer-Policy "no-referrer"
   Header set X-Content-Type-Options: nosniff
   </IfModule>
   ```

6. Click the "*Update*" button.

7. Click the "*Restart Apache*" button.

## To confirm that your site now has the strict-transport-security header, run the following command:

```
read -p "Domain: " domain ; curl -sI https://${domain}/ | grep -i Strict-Transport-Security
```

**The command above will request a domain. Here is an example:**

```
$ read -p "Domain: " domain ; curl -sI https://${domain}/ | grep -i Strict-Transport-Security
Domain: tpb.gov.ph     
strict-transport-security: max-age=31536000; includeSubDomains; preload
```

 

# SSL/TLS Forward Secrecy Cipher Suites 

## Configuring Apache for Forward Secrecy

Before you configure your Apache server for Forward Secrecy, your web server and SSL/TLS library should support Elliptic Curve cryptography (ECC).

Minimum Required Versions

- OpenSSL 1.0.1c+
- Apache 2.4x

**Note:**  Because of the Heartbleed bug and OpenSSL vulnerabilities, you should update to the most recent versions (i.e. OpenSSL version 1.0.1h).

## How to Configure Apache for Forward Secrecy

To configure Apache for Forward Secrecy, you configure the server to actively choose cipher suites and then activate the right OpenSSL cipher suite configuration string.

1. Locate your SSL Protocol Configuration on your Apache server.

   For example,

   1. Type the following command:

      

      **grep -i -r "SSLEngine" /etc/apache**

      In this example, ***\*/etc/apache\**** is the base directory for the Apache installation.

   2. The command will out put the available Virtual Hosts.

   3. Open the Virtual Host for which you are enabling Forward Secrecy.

2. Add the following lines to your configuration:

   1. 

      **SSLProtocol all -SSLv2 -SSLv3**

   2. 

      **SSLHonorCipherOrder on**

   3. For **SSLCipherSuite**, use one of the following configurations:

      - **Configure with RC4**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and RC4 (RC4 is resistant to BEAST). To improve performance, use the faster ECDHE suites whenever possible.

        

        **SSLCipherSuite "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS"**

      - **Configure without RC4**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and you prefer not to use RC4. To improve performance, use the faster ECDHE suites whenever possible.

        

        **SSLCipherSuite "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS !RC4"**

      - **Configure with RC4 as a last resort to support wide range and older browsers**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and you want to use RC4 only as a last resort in order to support a wide range of browsers and/or older browsers. To improve performance, use the faster ECDHE suites whenever possible.

        

        **SSLCipherSuite "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS +RC4 RC4"**

3. Restart Apache.

   For example, type the following command:

   

   **apachectl -k restart**

4. To verify that you have enabled Forward Secrecy, use [Discovery](https://docs.digicert.com/certificate-tools/discovery-user-guide/) to test your configuration.

5. You have successfully configured Apache for Forward Secrecy.

## Configuring Nginx for Forward Secrecy

Before you configure your Nginx server for Forward Secrecy, your web server and SSL/TLS library should support Elliptic Curve cryptography (ECC).

Minimum Required Versions

- OpenSSL 1.0.1c+
- Nginx 1.0.6+ and 1.1.0+

**Note:**  Because of the Heartbleed bug and OpenSSL vulnerabilities, you should update to the most recent versions (i.e. OpenSSL version 1.0.1h).

## How to Configure Nginx for Forward Secrecy

To configure Nginx for Forward Secrecy, you configure the server to actively choose cipher suites and then activate the right OpenSSL cipher suite configuration string.

1. Locate your SSL Protocol Configuration on your Nginx server.

   For example,

   1. Type the following command:

      

      **grep -r ssl_protocol /etc/nginx**

      In this example, ***\*/etc/nginx\**** is the base directory for the Nginx installation.

   2. The command will out put the available Server Blocks.

   3. Open the Server Block for which you are enabling Forward Secrecy.

2. Add the following lines to your configuration:

   1. 

      **ssl_protocols TLSv1.2 TLSv1.1 TLSv1;**

   2. 

      **ssl_prefer_server_ciphers on;**

   3. For **ssl_ciphers**, use one of the following configurations:

      - **Configure with RC4**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and RC4 (RC4 is resistant to BEAST). To improve performance, use the faster ECDHE suites whenever possible.

        

        **ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS";**

      - **Configure without RC4**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and you prefer not to use RC4. To improve performance, use the faster ECDHE suites whenever possible.

        

        **ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS !RC4";**

      - **Configure with RC4 as a last resort to support wide range and older browsers**

        Use this configuration if you have a preference for GCM (Galois Counter Mode) suites (these suites are resistant to timing attacks) and you want to use RC4 only as a last resort in order to support a wide range of browsers and/or older browsers. To improve performance, use the faster ECDHE suites whenever possible.

        

        **ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS +RC4 RC4";**

3. Restart Nginx.

   For example, type the following command:

   

   **sudo service nginx restart**

4. To verify that you have enabled Forward Secrecy, use [Discovery](https://docs.digicert.com/certificate-tools/discovery-user-guide/) to test your configuration.

5. You have successfully configured Nginx for Forward Secrecy.

## [Perfect Forward Secrecy with Apache 2.2 on a cPanel Server](https://cpsmblog.wordpress.com/2014/06/12/perfect-forward-secrecy-with-apache-2-2-on-a-cpanel-server/)

Perfect Forward Secrecy (PFS) is a security measure that helps to ensure that a session key cannot be compromised if one of the long-term keys in its set is compromised at a later date.  With PFS, if a single key is compromised, only data protected by that key has the potential to be compromised as well.  This is a feature specific to SSL connections that is now a somewhat standard requirement for passing PCI scans.

Apache 2.4 has this ability built-in, but Apache 2.2 supports the PFS-required ciphers as of 2.2.26.  To enable this, you’ll need to make a few adjustments to the main Apache template.  First, you need to change the *SSLCipherSuite* value. You can adjust this in **WHM** -> **Apache Configuration** -> **Global Configuration**, in the *SSL Cipher Suite* box.  Change this value to:

```
SSLCipherSuite EECDH+AES:EDH+AES:-SHA1:EECDH+RC4:EDH+RC4:RC4-SHA:EECDH+AES256:EDH+AES256:AES256-SHA:!aNULL:!eNULL:!EXP:!LOW:!MD5
```

Then save the file.  You can also adjust this in */var/cpanel/conf/apache/local*.

From here, you will need to add an additional setting to tell Apache to honor the cipher order you just defined.  To do this:

> cp /var/cpanel/templates/apache2/main.default /var/cpanel/templates/apache2/main.local

If main.local already exists, just use the existing file.

look for “SSLCipherSuite” in the template, it will look something like this:

*[% IF main.sslciphersuite.item.sslciphersuite.length %]SSLCipherSuite [% main.sslciphersuite.item.sslciphersuite %][% END %]*

Above this, add the following line:

**SSLHonorCipherOrder on**

Save the file, then apply the settings:

> /scripts/rebuildhttpdconf
>
> service httpd restart

 

To confirm PFS is working, you can run an SSL test here:

https://www.ssllabs.com/ssltest/



## How to check wether the server supports Forward Secrecy

In [this article](https://www.namecheap.com/support/knowledgebase/article.aspx/9652/38/perfect-forward-secrecy-what-it-is/) we have reviewed what is Perfect Forward Secrecy and how it works. Here we will discuss the way to check if your server supports FS.

There are lots of ways to check whether the server uses the key exchange that provides Forward Secrecy.
In this section we will review only a few of them, which, in our view, might come in handy.



### **Method 1.** Check the connection details in your browser.

You can easily detect whether FS is supported by a server with your browser.

For *Google Chrome,* do the following:

1. Connect to the website you wish to check.

2. Click on the ellipsis/three dots in the browser's top-right corner.

3. Select **More tools** > **Developer tools** > **Security**:

   ![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFS1.png)

   

4. In the **Connection** section, you can check both parties' key exchange protocol when establishing the session.


We have learned that only DHE and ECDHE key exchanges provide FS, so let's take a look at a few examples of how that would look:

![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFS2.png)


This example shows that our connection to Namecheap is secured using the AES_128_GCM encryption algorithm, while the session key generation relies on the ECDHE key exchange mechanism.

Also, the following message may appear:

![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFSexample1.png)


Here, the key exchange is performed using X25519, which refers to the elliptic curve ECDH key exchange algorithm, and the actual data encryption is accomplished using the AES_256_GCM symmetric encryption algorithm.

![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFSexample2.png)

In the example above, the same curve is used for the key exchange, and the AES_128_GCM symmetric encryption algorithm is used for the symmetric encryption algorithm.

In all cases, the combination of X25519 for key exchange and AES_256_GCM or AES_128_GCM for encryption supports FS.





For *Mozilla Firefox*, you can check in a similar way:

1. Connect to the website you wish to check.

2. Hit the padlock sign in the URL address bar.

3. Select **Connection Secure** > **More Information**.

   ![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFS_moz1.png)

   

4. In a new window, you will see whether the connection was established using the key exchanges that provide FS (ECDHE, EDH).

   ![img](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/PFS_moz2.png)

5. 

6. Again, we see that the RSA keys are used here for authentication purposes, the first part of the line (which contains ECDHE) is for the key exchange and the second part (AES ...) is for the encryption itself.

7. Non-FS connection will look like this:

8. ![pfs_7](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/pfs_7.png)

   

### **Method 2.** Check it with SSL Labs server test.

1. Another easy way to check the support of the FS key exchanges is to run the [SSL Labs test](https://www.ssllabs.com/ssltest/analyze.html).
   Just enter the domain name you wish to check and hit the **Submit** button.
2. This global tool allows you to check a great number of the server-side and SSL-related settings and see the grade of the current configuration.
3. In order to preeminently check the support of the Forward Secrecy property, after the server analysis is completed, you will need to scroll the results page down to the “Protocol Details” section and check the value of the Forward Secrecy parameter:
4. 

![pfs_8](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/pfs_8.png)Sometimes, you can see the following result:
![pfs_9](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/pfs_9.png)
This means that the server is configured to prioritize the key exchanges that provide FS when connecting to modern browsers, however, has a few non-FS cipher suites enabled to include the support of legacy systems.
If the server does not support the FS property, you’ll be notified about that on the Summary page:
![pfs_10](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/pfs_10.png)

### **Method 3.** Check it with OpenSSL.

OpenSSL toolkit also allows you to check the support of the FS key exchanges.

The following commands should be used:

``` ***openssl s_client -connect example.com:443 -cipher "ECDHE, EECDH"
openssl s_client -connect example.com:443 -cipher "ECDHE, EECDH"
openssl s_client -connect example.com:443 -cipher "DHE, EDH"
```

Be sure to change the example.com to the domain you wish to check.

ECDHE, EECDH and DHE, EDH define the Elliptic-Curve Diffie-Hellman and Diffie-Hellman Ephemeral key exchange mechanisms respectively.

If the command results in a “sslv3 alert handshake failure” error, the Forward Secrecy property is not supported by the server.

Note: If the server’s certificate uses SNI, you’ll need to include the “-servername example.com” option. Example:

```
$ openssl s_client -connect tpb.gov.ph:443 -cipher "ECDHE, EECDH"
CONNECTED(00000003)
depth=2 C = IE, O = Baltimore, OU = CyberTrust, CN = Baltimore CyberTrust Root
verify return:1
depth=1 C = US, O = "Cloudflare, Inc.", CN = Cloudflare Inc ECC CA-3
verify return:1
depth=0 C = US, ST = California, L = San Francisco, O = "Cloudflare, Inc.", CN = tpb.gov.ph
verify return:1
---
Certificate chain
 0 s:C = US, ST = California, L = San Francisco, O = "Cloudflare, Inc.", CN = tpb.gov.ph
   i:C = US, O = "Cloudflare, Inc.", CN = Cloudflare Inc ECC CA-3
   a:PKEY: id-ecPublicKey, 256 (bit); sigalg: ecdsa-with-SHA256
   v:NotBefore: Aug 24 00:00:00 2023 GMT; NotAfter: Aug 23 23:59:59 2024 GMT
 1 s:C = US, O = "Cloudflare, Inc.", CN = Cloudflare Inc ECC CA-3
   i:C = IE, O = Baltimore, OU = CyberTrust, CN = Baltimore CyberTrust Root
   a:PKEY: id-ecPublicKey, 256 (bit); sigalg: RSA-SHA256
   v:NotBefore: Jan 27 12:48:08 2020 GMT; NotAfter: Dec 31 23:59:59 2024 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIFETCCBLegAwIBAgIQB86B1g3V6jMOq1K3qTWM/jAKBggqhkjOPQQDAjBKMQsw
CQYDVQQGEwJVUzEZMBcGA1UEChMQQ2xvdWRmbGFyZSwgSW5jLjEgMB4GA1UEAxMX
Q2xvdWRmbGFyZSBJbmMgRUNDIENBLTMwHhcNMjMwODI0MDAwMDAwWhcNMjQwODIz
MjM1OTU5WjBqMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQG
A1UEBxMNU2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQQ2xvdWRmbGFyZSwgSW5jLjET
MBEGA1UEAxMKdHBiLmdvdi5waDBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABK0p
KcDqVNXBifoJ1MYJaQz6ZFZslGYMdDcxxXtfw9toe00HXCMQtvK+wf+zHjL4f7II
DazSWWP3G4TI3QOEdKOjggNdMIIDWTAfBgNVHSMEGDAWgBSlzjfq67B1DpRniLRF
+tkkEIeWHzAdBgNVHQ4EFgQUhLRhgkCK4LiJ0kfFZrdguauQu+0wIwYDVR0RBBww
GoIMKi50cGIuZ292LnBoggp0cGIuZ292LnBoMA4GA1UdDwEB/wQEAwIHgDAdBgNV
HSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL0Nsb3VkZmxhcmVJbmNFQ0NDQS0zLmNybDA3
oDWgM4YxaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0Nsb3VkZmxhcmVJbmNFQ0ND
QS0zLmNybDA+BgNVHSAENzA1MDMGBmeBDAECAjApMCcGCCsGAQUFBwIBFhtodHRw
Oi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwdgYIKwYBBQUHAQEEajBoMCQGCCsGAQUF
BzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQAYIKwYBBQUHMAKGNGh0dHA6
Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9DbG91ZGZsYXJlSW5jRUNDQ0EtMy5jcnQw
DAYDVR0TAQH/BAIwADCCAX4GCisGAQQB1nkCBAIEggFuBIIBagFoAHUA7s3QZNXb
Gs7FXLedtM0TojKHRny87N7DUUhZRnEftZsAAAGKJXh+agAABAMARjBEAiA1aqJI
xnhlbhiZy3HoUCauO/UuKq/QStQMnqOJim7ynwIgeiIomHC9WNjhNIME/1mPNpgO
T2G+mF6117GFfd95EzgAdgBIsONr2qZHNA/lagL6nTDrHFIBy1bdLIHZu7+rOdiE
cwAAAYoleH6jAAAEAwBHMEUCIQCTvozjWiLpj+pHN/16DTEXi+wcjr4FRSeRh4N4
GNoosAIgBC4tOPm1Nc0nNk5eBtscpDRS1YFUDnjBwM3mlEk9iEYAdwDatr9rP7W2
Ip+bwrtca+hwkXFsu1GEhTS9pD0wSNf7qwAAAYoleH5wAAAEAwBIMEYCIQCdO1I2
TdvbYKs6ey7nB/G7jWI/HwKVclK3da2LLE3l5gIhAMJNQDHLaLx4nu6vOGG7AwqL
ia5OB04Q61Ff1i1aLJIZMAoGCCqGSM49BAMCA0gAMEUCIQDTfRzBmAHrwevHV8yg
tiod9QNu4BvRIjnj5ioKiQeYxgIgJTDgQaohnx/tpoJSxcEXG9C3JY/Ar4lUPLui
NVj/X1Y=
-----END CERTIFICATE-----
subject=C = US, ST = California, L = San Francisco, O = "Cloudflare, Inc.", CN = tpb.gov.ph
issuer=C = US, O = "Cloudflare, Inc.", CN = Cloudflare Inc ECC CA-3
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: ECDSA
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 2592 bytes and written 390 bytes
Verification: OK
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 256 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: AA56CD53C1277B22D27155EC6AD9C8121A430966850E3C7D0A609FF07498769D
    Session-ID-ctx: 
    Resumption PSK: 6D2E5888A256421477574507C6DC54E7ACB4666B65FFF3405E1DBF6078B800C606101E79C9FF5193012C1AC80B14DE5A
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 64800 (seconds)
    TLS session ticket:
    0000 - 92 6b ed 14 07 93 bf 5c-9e f1 7b ae 95 55 4d e1   .k.....\..{..UM.
    0010 - ff 72 7a c0 ab f3 9a d7-27 f4 01 d0 5d 92 3c 50   .rz.....'...].<P
    0020 - b1 82 06 4b 63 c3 48 e0-0a 63 b4 eb ee 37 42 09   ...Kc.H..c...7B.
    0030 - 21 18 81 5a aa ec 9b 8a-05 f4 9a 01 55 ee 2a 09   !..Z........U.*.
    0040 - e7 46 f8 f8 a4 72 64 dc-6c ff 7a f5 b4 a7 1e cb   .F...rd.l.z.....
    0050 - eb 06 2f ca 10 b9 1b cb-2c 18 0b 98 3b 45 29 65   ../.....,...;E)e
    0060 - d8 64 6d a3 f6 4b f0 2c-a9 66 c4 78 95 50 e9 7b   .dm..K.,.f.x.P.{
    0070 - 37 5b 95 f7 a1 d0 5e a4-9a 27 1e 49 09 ba fa 9c   7[....^..'.I....
    0080 - 2a 31 45 7e a5 c8 e2 8c-a4 83 6e cb db 1d 5c 56   *1E~......n...\V
    0090 - 6d f4 3b bc cd c1 62 bb-1f 2c 36 44 bc b7 cc 4a   m.;...b..,6D...J
    00a0 - b7 a6 17 6b 47 9c c2 21-49 6f 03 07 18 db db 6f   ...kG..!Io.....o
    00b0 - 45 15 86 ec 33 c1 dc 68-40 f2 ce 59 30 68 bd 82   E...3..h@..Y0h..

    Start Time: 1710985601
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 2D3A5F6193A279B7CA961F15F20A0D1460B0EAD19FE8706ED78A9930177B4167
    Session-ID-ctx: 
    Resumption PSK: E3C25F8308F0C83AB45362F092B866FA9060C0F809CD8C8326F19E7957A5D3BE89B77B8AFD7BD3F17C454BD386880989
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 64800 (seconds)
    TLS session ticket:
    0000 - 92 6b ed 14 07 93 bf 5c-9e f1 7b ae 95 55 4d e1   .k.....\..{..UM.
    0010 - af b3 8e 5d 2f b5 3e 59-cd 0c 9a 34 70 99 70 2e   ...]/.>Y...4p.p.
    0020 - 5a e4 0f 87 44 e8 36 09-87 0b 8a 28 a9 3f f7 03   Z...D.6....(.?..
    0030 - 59 7e 12 6d 08 af 61 0e-e0 2c 89 e5 3f 8d 50 20   Y~.m..a..,..?.P 
    0040 - 48 57 39 f9 9a e8 cb a2-fe d5 40 ca f0 b3 b3 09   HW9.......@.....
    0050 - a2 b6 d6 aa 25 22 d4 8a-f5 f1 86 67 cd 91 d1 61   ....%".....g...a
    0060 - 61 a7 41 d3 e4 6d c5 32-91 ac f5 ae ba 40 82 c9   a.A..m.2.....@..
    0070 - dc cd cd 94 c7 45 40 8b-6b 52 b7 68 e1 02 48 04   .....E@.kR.h..H.
    0080 - d5 81 b1 e5 87 2e eb 9d-b6 cb 41 a3 31 2f 34 03   ..........A.1/4.
    0090 - fa b2 a0 17 1e 57 00 05-4f a5 49 ed b2 9c e3 7a   .....W..O.I....z
    00a0 - c9 10 e1 6d cf 9a 8b 03-05 d0 ca 22 fc 47 e8 2e   ...m.......".G..
    00b0 - 2e 9c 9e c1 f4 78 dc 63-24 7b c8 b7 1b 40 60 94   .....x.c${...@`.

    Start Time: 1710985601
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
closed
```



# HTTP Verb Tampering

## Testing for HTTP Verb Tampering

### Summary

HTTP Verb Tampering tests the web application’s response to different HTTP methods accessing system objects. For every system object discovered during spidering, the tester should attempt accessing all of those objects with every HTTP method.

The HTTP specification includes request methods other than the standard GET and POST requests. A standards compliant web server may respond to these alternative methods in ways not anticipated by developers. Although the common description is `verb` tampering, the HTTP 1.1 standard refers to these request types as different HTTP `methods`.

The full [HTTP 1.1 specification](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) defines the following valid HTTP request methods, or verbs:

- [`OPTIONS`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.2)
- [`GET`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.3)
- [`HEAD`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.4)
- [`POST`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.5)
- [`PUT`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.6)
- [`DELETE`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.7)
- [`TRACE`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.8)
- [`CONNECT`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.9)

If enabled, the Web Distributed Authoring and Version [(WebDAV)](http://www.webdav.org/specs/rfc2518.html) [extensions](https://tools.ietf.org/html/rfc4918) permit several more HTTP methods:

- [`PROPFIND`](http://www.webdav.org/specs/rfc2518.html#METHOD_PROPFIND)
- [`PROPPATCH`](http://www.webdav.org/specs/rfc2518.html#METHOD_PROPPATCH)
- [`MKCOL`](http://www.webdav.org/specs/rfc2518.html#METHOD_MKCOL)
- [`COPY`](http://www.webdav.org/specs/rfc2518.html#METHOD_COPY)
- [`MOVE`](http://www.webdav.org/specs/rfc2518.html#METHOD_MOVE)
- [`LOCK`](http://www.webdav.org/specs/rfc2518.html#METHOD_LOCK)
- [`UNLOCK`](http://www.webdav.org/specs/rfc2518.html#METHOD_UNLOCK)

However, most web applications only need to respond to GET and POST requests, providing user data in the URL query string or appended to the request respectively. The standard `<a href=""></a>` style links trigger a GET request; form data submitted via `<form method='POST'></form>`trigger POST requests. Forms defined without a method also send data via GET by default.

Oddly, the other valid HTTP methods are not supported by the [HTML standard](https://www.w3.org/TR/REC-html40/interact/forms.html#h-17.13.1). Any HTTP method other than GET or POST needs to be called outside the HTML document. However, JavaScript and AJAX calls may send methods other than GET and POST.

As long as the web application being tested does not specifically call for any non-standard HTTP methods, testing for HTTP verb tampering is quite simple. If the server accepts a request other than GET or POST, the test fails. The solutions is to disable all non GET or POST functionality within the web application server, or in a web application firewall.

If methods such as HEAD or OPTIONS are required for your application, this increases the burden of testing substantially. Each action within the system will need to be verified that these alternate methods do not trigger actions without proper authentication or reveal information about the contents or workings web application. If possible, limit alternate HTTP method usage to a single page that contains no user actions, such the default landing page (example: index.html).

### How to Test

As the HTML standard does not support request methods other than GET or POST, we will need to craft custom HTTP requests to test the other methods. We highly recommend using a tool to do this, although we will demonstrate how to do manually as well.

### Manual HTTP Verb Tampering Testing

This example is written using the netcat package from openbsd (standard with most Linux distributions). You may also use telnet (included with Windows) in a similar fashion.

1. Crafting custom HTTP requests

   Each HTTP 1.1 request follows the following basic formatting and syntax. Elements surrounded by brackets `[ ]` are contextual to your application. The empty newline at the end is required.

   ```
   [METHOD] /[index.htm] HTTP/1.1
   host: [www.example.com]
   ```

   In order to craft separate requests, you can manually type each request into netcat or telnet and examine the response. However, to speed up testing, you may also store each request in a separate file. This second approach is what we’ll demonstrate in these examples. Use your favorite editor to create a text file for each method. Modify for your application’s landing page and domain.

   1.1 OPTIONS

   ```
   OPTIONS /index.html HTTP/1.1
   host: www.example.com
   ```

   1.2 GET

   ```
   GET /index.html HTTP/1.1
   host: www.example.com
   ```

   1.3 HEAD

   ```
   HEAD /index.html HTTP/1.1
   host: www.example.com
   ```

   1.4 POST

   ```
   POST /index.html HTTP/1.1
   host: www.example.com
   ```

   1.5 PUT

   ```
   PUT /index.html HTTP/1.1
   host: www.example.com
   ```

   1.6 DELETE

   ```
   DELETE /index.html HTTP/1.1
   host: www.example.com
   ```

   1.7 TRACE

   ```
   TRACE /index.html HTTP/1.1
   host: www.example.com
   ```

   1.8 CONNECT

   ```
   CONNECT /index.html HTTP/1.1
   host: www.example.com
   ```

2. Sending HTTP requests

   For each method or method text file, send the request to your web server via netcat or telnet on port 80 (HTTP):

   `nc www.example.com 80 < OPTIONS.http.txt`

3. Parsing HTTP responses

   Although each HTTP method can potentially return different results, there is only a single valid result for all methods other than GET and POST. The web server should either ignore the request completely or return an error. Any other response indicates a test failure as the server is responding to methods/verbs that are unnecessary. These methods should be disabled.

   An example of a failed test (ie, the server supports OPTIONS despite no need for it):

   ![OPTIONS Verb Tampering](https://owasp.org/www-project-web-security-testing-guide/v41/4-Web_Application_Security_Testing/07-Input_Validation_Testing/images/OPTIONS_verb_tampering.png)
   *Figure 4.7.3-1: OPTIONS Verb Tampering*

### Automated HTTP Verb Tampering Testing

If you are able to analyze your application via simple HTTP status codes (200 OK, 501 Error, etc) - then the following bash script will test all available HTTP methods.

```
#!/bin/bash

for webservmethod in GET POST PUT TRACE CONNECT OPTIONS PROPFIND;

do
printf "$webservmethod " ;
printf "$webservmethod / HTTP/1.1\nHost: $1\n\n" | nc -q 1 $1 80 | grep "HTTP/1.1"

done
```

## Limit HTTP VERBS on Apache2

Add this in .htaccess or httpd.conf file

Use the mod_rewrite to correctly respond to unwanted HTTP methods:

```
RewriteEngine On
RewriteCond %{REQUEST_METHOD} !=GET
RewriteCond %{REQUEST_METHOD} !=POST 
RewriteRule .* /error/405.html [R=405,L] 
```



# Cache-Control Header

Cache-Control, in simple terms, is a set of instructions used by websites to tell web browsers and other services how to store and manage the website's content. These instructions help websites load faster, save internet bandwidth, and ensure users see the most recent version of the content.

Imagine you visit a website with images, text, and other elements. Instead of downloading all the elements each time you visit, the browser can temporarily save some on your device. This is called caching, and Cache-Control provides rules for this process, like how long to keep the protected content or if certain content shouldn't be saved.

For example, Cache-Control can tell the browser to keep an image for 1 hour, and after that, it should check with the website to see if there's a newer version. If there's no new version, the browser continues to use the saved image. This helps the website load faster and uses less internet data.

## **What exactly is meant by the term "Cache-Control Header"?**

The Cache-Control header is an HTTP (Hypertext Transfer Protocol) response header used to specify directives for caching the response on the client side, such as web browsers or intermediate caching proxies. The primary purpose of the Cache-Control header is to define how and for how long the client should cache a particular web resource, thereby helping optimize performance, reduce server load, and minimize bandwidth usage.

The Cache-Control header contains a series of directives that define caching behaviour. Some common Cache-Control demands include:

1. `public`: Indicates that the response is cacheable by any cache, even if the user is authenticated.
2. `private`: Specifies that the response is specific to the user and should not be cached by shared caches (e.g., proxies). The user's browser can cache it.
3. `no-cache`: The response can be cached but must be revalidated with the server before each use.
4. `no-store`: The response should not be stored in any cache. This is used for sensitive information that should not be cached.
5. `max-age`: Sets the maximum time, in seconds, that the resource is considered fresh. Once the age of the cached resource exceeds the max-age value, the cache must revalidate the resource with the server.

You can use multiple directives in a Cache-Control header, separated by commas. For example, the following Cache-Control header indicates that the response can be cached privately by the user's browser and has a freshness lifetime of 1 hour:

```
Cache-Control: private, max-age=3600
```

Using appropriate Cache-Control directives helps improve web applications' performance and user experience by reducing the need for repeated requests to the server for the same resources.

**Here’s an example of an HTTP response header from google.com, with a focus on the Cache-Control header:**

```
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 10:00:00 GMT
Expires: -1
Cache-Control: private, max-age=0
Content-Type: text/html; charset=UTF-8
Server: gws
X-XSS-Protection: 0
X-Content-Type-Options: nosniff
Content-Length: 45432
Connection: keep-alive
```

In this example, the Cache-Control header contains two directives: `private` and `max-age=0`. The `private` The Directive indicates that the response is specific to the user and should not be cached by shared caches (e.g., caching proxies). The browser can cache the response, but due to the `max-age=0` the Directive, the cache is considered stale immediately, and the browser must revalidate the resource with the server before using it.

Other headers shown in this example include:

- `Date`: The date and time when the server generated the response.
- `Expires`: Indicates when the resource is considered expired. In this case, it's set to -1, meaning the resource has expired.
- `Content-Type`: Specifies the type of content being returned (in this case, HTML).
- `Server`: Identifies the server software handling the request (in this case, Google's custom web server, "gws").
- `X-XSS-Protection`: A security header to protect against cross-site scripting (XSS) attacks.
- `X-Content-Type-Options`: A security header to prevent MIME-type confusion attacks.
- `Content-Length`: The length of the response body in bytes.
- `Connection`: Indicates whether the connection should be kept open or closed after the response.

## Cache-Control: Max-Age

The `Cache-Control: max-age` the Directive is used to specify the maximum amount of time, in seconds, that a cached resource is considered fresh. When the max-age value is reached, the cache is considered stale, and the client (e.g., a web browser) must revalidate the resource with the server before using it.

For example, consider the following Cache-Control header:

```
Cache-Control: max-age=3600
```

In this case, the `max-age` It is set to 3600 seconds, which is equivalent to 1 hour. This means the client can cache and use the resource without contacting the server for up to 1 hour. After 1 hour, the client must revalidate the resource with the server to ensure it has the most up-to-date version.

Using appropriate max-age values helps improve website performance by reducing the need for clients to request resources from the server repeatedly. It also helps minimize bandwidth usage, as resources can be served from the local cache rather than downloaded from the server each time they are needed.

## Cache-Control: No-Cache

The `Cache-Control: no-cache` the Directive is used to specify that the client (e.g., a web browser) can cache a resource, but it must revalidate the resource with the server before using it each time. This ensures that the client always has the most up-to-date resource version.

Here’s an example of an HTTP response header with the `Cache-Control: no-cache` directive:

```
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 10:30:00 GMT
Cache-Control: no-cache
Content-Type: text/html; charset=UTF-8
Content-Length: 51234
Connection: keep-alive
```

In this example, the Cache-Control header is set to `no-cache`. As a result, the client can cache the resource, but it must check with the server for updates each time it wants to use the resource. If the server confirms that the cached resource is still the latest version, the client can use the cached resource. Otherwise, the client must download the updated resource from the server.

Using the `no-cache` the Directive can be helpful when it's important to have up-to-date information but still want to take advantage of caching to reduce server load and improve performance.

## Cache-Control: No-Store

The `Cache-Control: no-store` the Directive is used to specify that the response must not be stored in any cache. This Directive is typically used for sensitive information the client should not cache (e.g., a web browser) or any intermediate caching proxies.

Here’s an example of an HTTP response header with the `Cache-Control: no-store` directive:

```
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 11:00:00 GMT
Cache-Control: no-store
Content-Type: application/json; charset=UTF-8
Content-Length: 12345
Connection: keep-alive
```

In this example, the Cache-Control header is set to `no-store`. This means that the client must not store the response in any cache and must request the resource from the server each time it's needed. This is useful for protecting sensitive information, such as personal or financial data, which should not be stored in caches where unauthorized users can access or accidentally leak it.

Using the `no-store` the Directive ensures that sensitive information is constantly retrieved directly from the server, minimizing the risk of data exposure through caching.

## Cache-Control: Public

The `Cache-Control: public` the Directive specifies that the response can be cached by any cache, including shared caches (e.g., caching proxies) and private caches (e.g., a web browser's cache). This Directive is helpful for resources that are not user-specific and can be safely cached by multiple clients.

Here’s an example of an HTTP response header with the `Cache-Control: public` directive:

```
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 12:00:00 GMT
Cache-Control: public, max-age=86400
Content-Type: image/jpeg
Content-Length: 102400
Connection: keep-alive
```

In this example, the Cache-Control header is set to `public`, with an additional `max-age` Directive of 86400 seconds (24 hours). This means that the response can be cached by any cache (both shared and private), and it's considered fresh for up to 24 hours. After 24 hours, the cache must revalidate the resource with the server.

Using the `public` the Directive can help improve website performance by allowing resources to be cached by multiple clients, reducing the need for repeated requests to the server and minimizing bandwidth usage.

## Cache-Control: Private

The `Cache-Control: private` the Directive is used to specify that the response is specific to the user and should only be cached by the user's private cache (e.g., a web browser's cache). Shared caches, such as caching proxies, must not cache the response.

Here’s an example of an HTTP response header with the `Cache-Control: private` directive:

```
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 13:00:00 GMT
Cache-Control: private, max-age=7200
Content-Type: text/html; charset=UTF-8
Content-Length: 54321
Connection: keep-alive
```

In this example, the Cache-Control header is set to `private`, with an additional `max-age` Directive of 7200 seconds (2 hours). This means that the response is specific to the user and can be cached by their browser but not by shared caches. The cached resource is considered fresh for up to 2 hours. After 2 hours, the browser must revalidate the resource with the server.

Using the `private` the Directive can help maintain user privacy and ensure personalized content is not accidentally cached and served to other users through shared caches.

## **Additional Headers for the HTTP Cache**

In addition to the Cache-Control header, several other HTTP headers are related to caching. These headers help manage cached resources' storage, retrieval, and validation. Some of the most common HTTP cache headers include:

1. `ETag` (Entity Tag): The ETag header provides a unique identifier (usually a hash) for a specific resource version. Clients can use the ETag value to perform conditional requests, allowing the server to respond with a "304 Not Modified" status if the client's cached version matches the current ETag value. This mechanism helps save bandwidth and optimize resource fetching.
2. `Last-Modified`: The Last-Modified header indicates the date and time when the resource was last modified. Like the ETag header, it can be used for conditional requests to validate whether the cached resource is still up-to-date. If the Last-Modified value provided by the client matches the server's value, the server can respond with a "304 Not Modified" status, indicating that the client's cached resource is still valid.
3. `Expires`: The Expires header sets an absolute expiration date and time for the resource, after which it is considered stale. While the Cache-Control header with the `max-age` The directive is more flexible and widely used; the Expires header can still be helpful for older clients that do not support the Cache-Control header. If both Cache-Control and Expires headers are present, Cache-Control takes precedence.
4. `Vary`: The Vary header indicates which request headers should be considered when determining if a cached response can be used for a new request. This is important for resources with different representations based on request headers, such as the `Accept-Encoding` header (which indicates the client's supported compression methods). The Vary header helps ensure that caches only serve responses that match the client's request headers.
5. `Pragma`: The Pragma header is an older HTTP/1.0 header mainly used for backward compatibility. Its primary purpose is to specify cache directives for HTTP/1.0 clients that do not support the Cache-Control header. The most common usage is equivalent to the `Cache-Control: no-cache` The order is in HTTP/1.1.

While the Cache-Control header is the most prominent and flexible header for controlling caching behaviour, combining these additional headers can provide more granular control over caching and help optimize the performance, efficiency, and user experience of web applications.

## Cache-Control and Content Distribution Networks

A Content Delivery Network (CDN) is a system of distributed servers that delivers web content and other resources to users based on their geographic location, the origin of the web page, and the server’s performance. CDNs are designed to improve web applications' performance, reliability, and security by caching and serving content from edge servers closer to end users, thus reducing latency and network congestion.

Cache-Control headers are crucial in the interaction between CDNs and web resources. The directives provided in the Cache-Control header help CDNs determine how to cache and serve the content to end-users. Here’s how various Cache-Control directives can impact the caching behaviour of CDNs:

1. `public`: The `public` The Directive allows CDNs to cache the content and serve it to multiple users. It is beneficial for static resources like images, stylesheets, or scripts that stay the same frequency and are not user-specific.
2. `private`: The `private` the Directive indicates that the content is user-specific and should not be cached by shared caches, such as CDNs. This Directive is important for personalized content or resources containing sensitive information that the user's browser should only cache.
3. `no-cache`: The `no-cache` the Directive allows CDNs to cache the content, but they must revalidate it with the origin server before serving it to users. This ensures that users receive the most up-to-date version of the content while benefiting from the reduced latency offered by CDNs.
4. `no-store`: The `no-store` directive prevents CDNs from caching the content at all. This is typically used for sensitive information or resources that should always be fetched directly from the origin server.
5. `max-age`: The `max-age` the Directive specifies the maximum amount of time, in seconds, that the resource is considered fresh. CDNs use this information to determine how long they can serve the cached content before needing to revalidate it with the origin server.
6. `s-maxage`: The `s-maxage` The directive is similar `max-age`, but it targets explicitly shared caches like CDNs. It `s-maxage` is present CDNs will use this value instead of `max-age` to determine the resource's freshness.

## Disabling caching in .htaccess

Add this code at the bottom of the .htaccess file to turn off caching. Delete the code to turn caching on again.

```
# DISABLE CACHING
<IfModule mod_headers.c>
    Header set Cache-Control "no-cache, no-store, must-revalidate"
    Header set Pragma "no-cache"
    Header set Expires 0
</IfModule>

<FilesMatch "\.(css|flv|gif|htm|html|ico|jpe|jpeg|jpg|js|mp3|mp4|png|pdf|swf|txt)$">
    <IfModule mod_expires.c>
        ExpiresActive Off
    </IfModule>
    <IfModule mod_headers.c>
        FileETag None
        Header unset ETag
        Header unset Pragma
        Header unset Cache-Control
        Header unset Last-Modified
        Header set Pragma "no-cache"
        Header set Cache-Control "max-age=0, no-cache, no-store, must-revalidate"
        Header set Expires "Thu, 1 Jan 1970 00:00:00 GMT"
    </IfModule>
</FilesMatch>
```

# Secure cookie with HttpOnly and Secure flag in Apache

Implement cookie HTTP header flag with HTTPOnly & Secure to protect a website from XSS attacks

Do you know you can mitigate most common **XSS attacks** using `HttpOnly` and `Secure` flag with your cookie?

[XSS](https://owasp.org/www-community/attacks/xss/) is dangerous. By looking at an increasing number of XSS attacks daily, you must consider [securing your web applications](https://geekflare.com/secure-web-application-server/).

Without having HttpOnly and Secure flag in the HTTP response header, it is possible to steal or manipulate web application sessions and cookies.

It’s better to manage this within the application code. However, due to developers’ unawareness, it comes to Web Server administrators.

I will not talk about how to set these at the code level. You can refer [here](https://owasp.org/www-community/HttpOnly).

## Implementation Procedure in Apache

- Ensure you have `mod_headers.so` enabled in Apache HTTP server
- Add following entry in httpd.conf

```markup
Header always edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure
```

Copy

- Restart Apache HTTP server to test

*Note*: Header edit is not compatible with [lower than Apache 2.2.4 version](http://httpd.apache.org/docs/2.2/mod/mod_headers.html).

You can use the following to set the [HttpOnly and Secure](https://geekflare.com/enable-cors-httponly-cookie-secure-token/) flag in lower than the 2.2.4 version. Thanks to Ytse for sharing this information.

```markup
Header set Set-Cookie HttpOnly;Secure
```



## Implementation Procedure in Apache

**Enable HttpOnly Flag in IIS**

Set HttpOnly flag in IIS Edit the web.config file of your web application and add the following:     

```
<system.web>  
  ...  
  <httpCookies httpOnlyCookies="true" requireSSL="true" />  
  ...  
</system.web>
```



**Enable Secure Flag in IIS**

To enable secure flag in IIS, it is better to use URL Rewrite and add the following to your web.config file:

```
<system.webServer>  
  <rewrite>  
    <outboundRules>  
      <rule name="Use only secure cookies" preCondition="Unsecured cookie">  
        <match serverVariable="RESPONSE_SET_COOKIE" pattern=".*" negate="false" />  
        <action type="Rewrite" value="{R:0}; secure" />  
      </rule>  
      <preConditions>  
        <preCondition name="Unsecured cookie">  
          <add input="{RESPONSE_SET_COOKIE}" pattern="." />  
          <add input="{RESPONSE_SET_COOKIE}" pattern="; secure" negate="true" />  
        </preCondition>  
      </preConditions>  
    </outboundRules>  
  </rewrite>  
...  
</system.webServer>
```



## Verification





You can either leverage the browser’s inbuilt developer tools to check the response header or use an https://domsignal.com/http-headers-test



# Secure Wordpress with X-Frame-Options & HTTPOnly Cookie

https://geekflare.com/wordpress-x-frame-options-httponly-cookie/



# Fix HTTP Headers and cookies vulnerabilities in WordPress

- Install Http Headers plugins in Wordpress and configure
