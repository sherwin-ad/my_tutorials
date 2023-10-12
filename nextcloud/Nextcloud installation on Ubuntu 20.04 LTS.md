# Nextcloud installation on Ubuntu 20.04 LTS

1. Firstly

   You need to install a required package on your system. Open a terminal and execute the following commands.

   ```
   sudo apt update && sudo apt install software-properties-common -y 
   ```

2. Enable PPA – 

   Next, Use the following command to enable PHP PPA and update apt cache

   ```
   sudo add-apt-repository ppa:ondrej/php 
   ```

3. Install Apache2, MariaDB, PHP PHP modules 

   ```
   apt install apache2 mariadb-server php8.2 libapache2-mod-php8.2
   apt install php8.2-gd php8.2-mysql php8.2-curl php8.2-mbstring php8.2-intl
   apt install php8.2-gmp php8.2-bcmath php-imagick php8.2-xml php8.2-zip
   ```

4. Create database for nextcloud

   ```
   CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
   CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   GRANT ALL PRIVILEGES ON nextcloud.* TO 'username'@'localhost';
   FLUSH PRIVILEGES;
   ```

5. Download nexcloud source code

   ```
   Download latest source code
   # wget https://download.nextcloud.com/server/releases/latest.zip
   
   Download hash code
   # https://download.nextcloud.com/server/releases/latest.zip.md5
   
   Verify hash code
   # # md5sum -c latest.zip.md5 < latest.zip
   latest.zip: OK
   ```

   



```
# pvcreate /dev/vdb

# vgcreate psa-vg /dev/vdb

# lvcreate -n psa-lv -l 50%FREE psa-vg

# mkfs.ext4 /dev/psa-vg/psa-lv
```

