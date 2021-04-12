## Run odoo

```
python3 odoo-bin --addons-path=addons -d odoo
```



##### Prepare

Odoo needs a [PostgreSQL](http://www.postgresql.org/) server to run properly. The default configuration for the Odoo ‘deb’ package is to use the PostgreSQL server on the same host as your Odoo instance. Execute the following command in order to install the PostgreSQL server:

```
$ sudo apt install postgresql -y
```

### Warning

`wkhtmltopdf` is not installed through **pip** and must be installed manually in version [0.12.5](https://github.com/wkhtmltopdf/wkhtmltopdf/releases/tag/0.12.5) for it to support headers and footers. See our [wiki](https://github.com/odoo/odoo/wiki/Wkhtmltopdf) for more details on the various versions.

##### Repository

Odoo S.A. provides a repository that can be used with Debian and Ubuntu distributions. It can be used to install *Odoo Community Edition* by executing the following commands **as root**:

```
# wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
# echo "deb http://nightly.odoo.com/14.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
# apt-get update && apt-get install odoo
```