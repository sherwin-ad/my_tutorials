
function print_color()
{
  nc="\033[0m"

  case $1 in 
  "green") color="\033[0;32m:" ;;
  "red") color="\033[0;31m:" ;;
  "*") color="\033[0m" ;;
  esac

  echo -e "${color} $2 ${nc}"
}

function check_service_status()
{
  is_service_active=$(systemctl is-active $1)

  if [ $is_service_active = "active" ]
    then
    print_color "green" "$1 Service is active"
  else
    print_color "red" "$1 Service is not active"
    exit 1
fi
}

function check_firewalld_rule_configured()
{ 
firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)

if [[ $firewalld_ports = *$1* ]]
then
  print_color "green" "Port $1 configured"
else
  print_color "red" "Port $1 not configured"
fi
}    

function check_webpage()
{
web_page=$(curl http://localhost)

if [[ $web_page = *$1* ]]
then
  print_color "green" "Item $1 is present on the web page"
else
  print_color "red" "Item $1 is not present on the web page"
fi      
}

# Install and configure firewalld
print_color "green" "Installing firewalld..."
sudo yum install -y firewalld
sudo service firewalld start
sudo systemctl enable firewalld

check_service_status firewalld


# --------------------Database Configuration------------------

# Install and configure Maria-DB
print_color "green" "Installing MariaDB..."
sudo yum install -y mariadb-server
sudo service mariadb start
sudo systemctl enable mariadb

check_service_status mariadb


# Configure Firewall rules for Database
print_color "green" "Adding firewall rules for DB..."
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

check_firewalld_rule_configured 3306

# Configuring Database
cat > configure-db.sql <<-EOF
CREATE DATABASE ecomdb;
CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
EOF

sudo mysql < configure-db.sql

# Loading inventory into Database
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF

sudo mysql < db-load-script.sql

my_db_results=$(sudo mysql -e "use ecomdb; select * from products")

if [[ $my_db_results = *Laptop* ]]
then 
  print_color "green" "Inventory data loaded"
else 
  print_color "red" "Inventory data not loaded"
  exit 1
fi  

# Install web server packages
sudo yum install -y httpd php php-mysql


# Configure firewalld rules
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

check_firewalld_rule_configured 80

# Update index.php
sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

# --------------------Web Server Configuration------------------

# Start httpd service
sudo service httpd start
sudo systemctl enable httpd

check_service_status httpd


# Download code
sudo yum install -y git
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/



sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php


for item in Laptop Drone VR Watch
do 
    check_webpage $item
done

