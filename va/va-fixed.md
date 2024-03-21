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



## How to check whether the server supports Forward Secrecy

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

