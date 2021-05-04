# Install Odoo 13 on Ubuntu 20.04

https://gist.github.com/parthivgls/70569370528876524abb4f6e7a0cf53f

```
#!/bin/bash
sudo adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'odoo' --group odoo

sudo mkdir /etc/odoo && mkdir /var/log/odoo/

sudo apt-get update && apt-get upgrade -y && apt-get install postgresql postgresql-server-dev-12 build-essential python3-pillow python3-lxml python3-dev python3-pip python3-setuptools npm nodejs git gdebi libldap2-dev libsasl2-dev  libxml2-dev libxslt1-dev libjpeg-dev -y

sudo service postgresql restart

git clone --depth=1 --branch=13.0 https://github.com/odoo/odoo.git /opt/odoo/odoo

sudo chown odoo:odoo /opt/odoo/ -R && sudo chown odoo:odoo /var/log/odoo/ -R && cd /opt/odoo/odoo && sudo pip3 install -r requirements.txt

sudo npm install -g less less-plugin-clean-css rtlcss -y
cd /tmp && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb && sudo gdebi -n wkhtmltox_0.12.5-1.bionic_amd64.deb && rm wkhtmltox_0.12.5-1.bionic_amd64.deb

sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/ && sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/

sudo su - postgres -c "createuser -s odoo"

sudo su - odoo -c "/opt/odoo/odoo/odoo-bin --addons-path=/opt/odoo/odoo/addons -s --stop-after-init"

sudo mv /opt/odoo/.odoorc /etc/odoo/odoo.conf

sudo sed -i "s,^\(logfile = \).*,\1"/var/log/odoo/odoo-server.log"," /etc/odoo/odoo.conf

sudo sed -i "s,^\(logrotate = \).*,\1"True"," /etc/odoo/odoo.conf

sudo sed -i "s,^\(proxy_mode = \).*,\1"True"," /etc/odoo/odoo.conf

sudo cp /opt/odoo/odoo/debian/init /etc/init.d/odoo && chmod +x /etc/init.d/odoo

sudo ln -s /opt/odoo/odoo/odoo-bin /usr/bin/odoo

sudo update-rc.d -f odoo start 20 2 3 4 5 .

sudo service odoo restart
```







```
sudo su odoo

odoo@openeduc-enterprise:$ createdb db_mybusybee 

odoo@openeduc-enterprise:$ psql -d db_mybusybee < mybusybee_postgres.sql

sudo mv filestore /opt/odoo/.local/share/Odoo/.

sudo chown -R odoo:odoo /opt/odoo/.local/share/Odoo/filestore

ubuntu@openeduc-enterprise:/opt/odoo$ sudo mkdir openeducat

sudo mv community-13 /opt/odoo/openeducat/.

sudo mv enterprise-13 /opt/odoo/openeducat/.

sudo mv openeducat_account_budget /opt/odoo/openeducat/community-13/.

sudo mv openeducat_digital_library /opt/odoo/openeducat/enterprise-13/

sudo mv openeducat_account_asset /opt/odoo/openeducat/community-13/.

sudo mv openeducat_account_accountant /opt/odoo/openeducat/community-13/.

chwon odoo:odoo /opt/odoo/openeducat -R
```

/etc/odoo/odoo.conf

```
[options]
addons_path = /opt/odoo/odoo/addons,/opt/odoo/openeducat/community-13,/opt/odoo/openeducat/enterprise-13
admin_passwd = admin
csv_internal_sep = ,
data_dir = /opt/odoo/.local/share/Odoo
db_host = False
db_maxconn = 64
db_name = False
db_password = False
db_port = False
db_sslmode = prefer
db_template = template0
db_user = False
dbfilter = db_mybusybee
demo = {}
email_from = False
geoip_database = /usr/share/GeoIP/GeoLite2-City.mmdb
http_enable = True
http_interface =
http_port = 8069
import_partial =
limit_memory_hard = 2684354560
limit_memory_soft = 2147483648
limit_request = 8192
limit_time_cpu = 60
limit_time_real = 120
limit_time_real_cron = -1
list_db = True
log_db = False
log_db_level = warning
log_handler = :INFO
log_level = info
logfile = /var/log/odoo/odoo-server.log
longpolling_port = 8072
max_cron_threads = 2
osv_memory_age_limit = 1.0
osv_memory_count_limit = False
pg_path =
pidfile =
proxy_mode = True
reportgz = False
screencasts =
screenshots = /tmp/odoo_tests
server_wide_modules = base,web
smtp_password = False
smtp_port = 25
smtp_server = localhost
smtp_ssl = False
smtp_user = False
syslog = False
test_enable = False
test_file =
test_tags = None
translate_modules = ['all']
unaccent = False
upgrade_path =
without_demo = False
workers = 0
```

/opt/odoo/openeducat/enterprise-13/openeducat_web/models/res_users.py

- comment line (onesignal_device_id = fields.Char('One Signal Device ID'))

```
# -*- coding: utf-8 -*-
# Part of OpenEduCat. See LICENSE file for full copyright & licensing details.
#
##############################################################################
#
#    Tech-Receptives Solutions Pvt. Ltd.
#    Copyright (C) 2009-TODAY Tech Receptives(<http://www.techreceptives.com>).
#
##############################################################################

from odoo import models, fields


class ResUsers(models.Model):
    _inherit = 'res.users'

#    onesignal_device_id = fields.Char('One Signal Device ID')
~                                                                                                                            
~                                                          
```

