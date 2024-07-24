# Create Self-signed certificate in windows

**To Create the new certificate for your specific domain:**

Open PowerShell ISE as admin, run the command:

```
New-SelfSignedCertificate -DnsName *.mydomain.example, localhost -CertStoreLocation cert:\LocalMachine\My
```

**To trust the new certificate:**

- Open `mmc.exe`
- Go to Console Root -> Certificates (Local Computer) -> Personal
- Select the certificate you have created, do right click -> All Tasks -> Export and follow the export wizard to create a .pfx file
- Go to Console Root -> Certificates -> Trusted Root Certification Authorities and import the new .pfx file

**To bind the certificate to your site:**

- Open IIS Manager
- Select your site and choose Edit Site -> Bindings in the right pane
- Add new HTTPS binding with the correct hostname and the new certificate





## Creating Self-Signed SSL in Powershell

A Self-Signed SSL certificate is signed by its creator rather than a CA. It allows you to enable HTTPS on your websites and web services to encrypt traffic. However, because a trusted authority does not sign the certificate, users will see errors indicating that the certificate needs to be trusted. Create Self-Signed SSL Certificate in Powershell is a process that allows you to generate a self-signed certificate using the Windows PowerShell command-line interface.

Self-signed certificates are useful for:

- Testing and development environments where you need HTTPS enabled but do not require trusted certificates.
- Internal websites, services, and tools where you control the clients.
- Internet of Things (IoT) devices that require HTTPS but can’t get public certificates.

This guide will walk you through the steps to generate a [self-signed SSL certificate](https://sslinsights.com/self-signed-ssl-certificate-vs-trusted-ca-certificate/) using Powershell on Windows. We will also cover how to export the certificate and private key to install on servers like IIS and Apache.

### Key Takeaways

- Self-signed SSL certificates allow you to encrypt traffic to your websites and web services without needing to purchase a certificate from a certificate authority. However, users will see warnings that the certificate is not trusted since it is self-signed.
- The New-SelfSignedCertificate cmdlet in Powershell can generate self-signed certificates easily. You can specify the subject, DNS names, key usage, extended key usage, and more.
- Export the self-signed certificate and private key to a PFX file for installation on your web server. Protect the private key file.
- You can create a self-signed certificate that is valid for an extended period by specifying a far-off “NotAfter” date. However, some browsers may only trust certificates with a shorter validity period.
- Self-signed certificates provide a quick and easy way to implement HTTPS for internal sites and testing. However, for public production sites, you should purchase an SSL certificate from a trusted certificate authority.

***Also Read: [How to Setup SSL Certificate on IIS Using PowerShell?](https://sslinsights.com/how-to-setup-ssl-certificate-on-iis-using-powershell/)\***

## Prerequisites

To follow along with this guide, you will need:

- Windows 10 or Windows Server with Powershell 5.1 or later. Any edition, including desktop and server.
- Administrator access to run Powershell commands.
- [OpenSSL](https://sslinsights.com/openssl-command-to-check-certificate/) (if exporting certificate and key).

The drawback is that visitors will see certificate warnings as the certificate is not trusted. Public sites should use CA-signed certificates.

## Prerequisites Before Installing Self-Signed Certificate in IIS

To create and install a self-signed certificate for a website in IIS, you need:

- IIS (Internet Information Services) installed on the Windows Server
- Administrative access rights to the server
- Access to IIS Manager console

## 5 Easy Steps to Create Self-Signed SSL Certificate in PowerShell

- Create Certificate Object in Powershell
- Create an Advanced Self-Signed Certificate
- Export Certificate and Private Key to PFX
- Install Certificate on Web Server
- Trust Certificate

## Step 1 – Create Certificate Object in Powershell

Powershell provides an easy way to generate self-signed SSL certificates with the New-SelfSignedCertificate cmdlet.

Run the following in an elevated Powershell session to create a basic cert:

```
New-SelfSignedCertificate -DnsName "www.example.com" -CertStoreLocation "Cert:\LocalMachine\My"
```

This will create a self-signed certificate for the site www.example.com and place it in the My certificate store on the local machine.

Let’s break down what’s happening:

- -DnsName “www.example.com” – Specifies the DNS Subject Alternative Name (SAN). This allows using the cert for that domain.
- -CertStoreLocation “Cert:\LocalMachine\My” – Puts the generated cert into the My store under Local Machine rather than the default CurrentUser.

You can also provide these parameters:

- -NotAfter – The expiration date for the cert as a DateTime object.
- -KeyUsage – The key usage flags like DigitalSignature, KeyEncipherment, etc.
- -Type – The certificate type is typically SSLServerAuthentication.

This generates a basic cert, but we can provide additional options for a more robust self-signed certificate next.

## Step 2 – Create an Advanced Self-Signed Certificate

Specify additional parameters, such as subject, key usage, extended key usage, and more, to create a more complete self-signed certificate suitable for production use.

For example:

```
$today = Get-Date
$after = $today.AddYears(1)
$certificate = New-SelfSignedCertificate -DnsName "iams.sss.local" -CertStoreLocation "Cert:\LocalMachine\My" `
-KeySpec "KeyExchange" -KeyUsage "DigitalSignature", "KeyEncipherment" `
-Type "SSLServerAuthentication" -NotAfter $after `
-Subject "CN=iam.sss.local, OU=IT, O=Social Security System, L=Quezon City, S=NCR, C=PH" `
-Provider "Microsoft Enhanced RSA and AES Cryptographic Provider" `
-HashAlgorithm "SHA256" -KeyLength 2048
```

Here’s what each additional parameter does:

- -DnsName – Adds additional DNS names and alternative names. Allows using the cert for multiple domains/subdomains.
- -KeySpec “KeyExchange” – Makes the key usable for key exchange, which is required for SSL/TLS.
- -KeyUsage – Allows the use of certs for digital signatures and key encipherment.
- -Type “SSLServerAuthentication” – Specifies this is an SSL/TLS server certificate.
- -NotAfter – Sets expiration 10 years in the future.
- -Subject – Specifies certificate subject attributes like country, org, etc.
- -Provider – Sets crypto provider; this one support AES.
- -HashAlgorithm “SHA256” – Algorthim to hash and sign the certificate.
- -KeyLength 2048 – Bits in the RSA private key. Higher is more secure.

This creates an advanced certificate with options suitable for production use.

## Step 3 – Export Certificate and Private Key to PFX

The self-signed certificate is stored in the local machine personal certificate store. To use it on a web server like [IIS](https://sslinsights.com/iis-redirect-http-to-https-with-windows-10/) or [Apache](https://sslinsights.com/how-to-install-ssl-certificate-on-apache/), you need to export the certificate and private key.

The most common format is PFX, which combines the private key and certificate chain into a single encrypted file.

First, copy the cert thumbprint, then export it along with the private key:

```
$cert = Get-ChildItem -Path "Cert:\LocalMachine\My\" -DnsName "www.example.com"
$thumb = $cert.Thumbprint
Export-PfxCertificate -Cert "Cert:\LocalMachine\My\$thumb" -FilePath "C:\cert\examplecert.pfx" -Password $pwd
```

This exports the certificate + private key to examplecert.pfx protected with the password stored in $pwd.

Keep this PFX file and password safe! It contains the private key that allows the decryption of all traffic secured with the certificate.

You can now import this PFX file into your web server, such as IIS, Apache, Nginx, etc.

## Step 4 – Install Certificate on Web Server

To install the self-signed certificate on your web server, follow these general steps:

### IIS on Windows

- Open the ***IIS Manager*** console.
- Select your ***website***.
- In the Actions pane, open ***Server Certificates***.
- Click ***Import*** under the ***Actions*** panel on the right.
- Import the ***PFX*** file and enter the password.
- ***Select*** the imported cert under the SSL certificate bindings.

***Also Read: [How to Create Self-Signed Certificate in Windows 10](https://sslinsights.com/create-self-signed-certificate-windows-10/)\***

### Apache

- Place the PFX file in a secure folder like /etc/ssl.
- Convert the PFX to a PKCS12 file using [OpenSSL command](https://sslinsights.com/most-common-openssl-commands/).

```
openssl pkcs12 -in examplecert.pfx -out examplecert.pkcs12
```

#### Set the SSL certificate in your virtual host config.

```
SSLCertificateFile "/etc/ssl/examplecert.pkcs12"
SSLCertificateKeyFile "/etc/ssl/examplecert.pkcs12"
SSLCertificateChainFile "/etc/ssl/examplecert.pkcs12"
```

#### Restart Apache to apply the new certificate.

The steps vary slightly for other servers, but in general, you import the PFX file and then configure the webserver to use it.

## Step 5 – Trust Certificate (Optional)

Because the certificate is self-signed rather than signed by a trusted CA, users will see warnings that the cert is not trusted. To avoid this, install the self-signed certificate as a trusted root on any clients.

On Windows, double-click the CER file and install it under [Trusted Root Certificate Authorities](https://sslinsights.com/trusted-root-certification-authorities-in-chrome/).

On Linux and macOS, add the CER to /usr/local/share/ca-certificates and update the trust store.

Now, your self-signed cert will be trusted and will not show errors. However, this only works for clients you control. External users will still see untrusted errors.

For public sites, use free or low-cost certificates from CAs like Let’s Encrypt instead for full trust.