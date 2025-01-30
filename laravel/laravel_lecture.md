[TOC]

# How to Install Laravel PHP Framework on Ubuntu 24.04

https://www.howtoforge.com/tutorial/install-laravel-on-ubuntu-for-apache/

## Prerequisites

Before starting this guide, make sure you have the following:

- An Ubuntu 24.04 server.
- A non-root user with administrator privileges

## Installing LAMP Stack and Composer

Laravel is a popular PHP web framework for modern web development. So, you must ensure that PHP and other dependencies are installed on your Ubuntu server. In this section, you'll install Laravel with the LAMP Stack (Linux, Apache, MySQL/MariaDB, and PHP) and Composer.

Before installing the package, run the following command to update your Ubuntu repository.

```
sudo apt update
```

Now run the following command to install Laravel's dependencies, including the LAMP Stack (Linux, Apache, MySQL/MariaDB, and PHP), Composer, and Git.

```
sudo apt install apache2 mariadb-server php php-curl php-bcmath php-json php-mysql php-mbstring php-xml php-tokenizer php-zip composer git
```

Type **Y** to proceed with the installation.



Once the installation is finished, check both Apache and MariaDB service status. Then, check both PHP and Composer versions.

Check the Apache service status with the following command. The default Apache service on Ubuntu should be enabled and running automatically.

```
sudo systemctl is-enabled apache2
sudo systemctl status apache2
```

Now check the MariaDB service using the command below. The MariaDB server should be enabled and running on your Ubuntu system.

```
sudo systemctl is-enabled mariadb
sudo systemctl status mariadb
```

Lastly, check the PHP and Composer versions using the command below. You will see the PHP 8.3 and Composer 2.7.1 installed on your system.

```
php -v
sudo -u www-data composer -v
```



## Optional: Installing Node.js and NPM (Node.js Package Manager)

Node.js and NPM are required if you're using Laravel with a templating engine such as Blade and JavaScript. In this section, you'll install both Node.js and NPM (Node.js Package Manager) via the Ubuntu repository.

To install Node.js and NPM on your Ubuntu system, run the following:

```
sudo apt install nodejs npm
```

Type Y to confirm the installation.

[![install node.js npm](https://www.howtoforge.com/images/how_to_install_laravel_on_ubuntu_2404/6-install-nodejs-npm.png?ezimgfmt=rs:750x116/rscb10/ng:webp/ngcb9)](https://www.howtoforge.com/images/how_to_install_laravel_on_ubuntu_2404/big/6-install-nodejs-npm.png)

When the installation is finished, enter the command below to check the Node.js and NPM version.

```
node --version
npm --version
```

The following output shows that Node.js 18 and NPM 9.5 are installed.

[![check node.js npm version](https://www.howtoforge.com/images/how_to_install_laravel_on_ubuntu_2404/7-check-nodejs-npm.png?ezimgfmt=rs:440x134/rscb10/ng:webp/ngcb9)](https://www.howtoforge.com/images/how_to_install_laravel_on_ubuntu_2404/big/7-check-nodejs-npm.png)

## Configuring PHP

To run Laravel, you must ensure some PHP extensions are enabled, such as **fileinfo, mbstring,** and **openssl**. So now you load those PHP extensions by modifying the 'php.ini' file.

Using the nano editor, edit the default PHP config file '/etc/php/8.3/apache2/php.ini'.

```
sudo nano /etc/php/8.3/apache2/php.ini
```

Uncomment the following lines to enable PHP extensions *fileinfo, mbstring, and openssl*.

```
extension=fileinfo
extension=mbstring
extension=openssl
```

Save the file and exit the editor.

Now run the command below to restart the Apache service and apply the changes on PHP.

```
sudo systemctl restart apache2
```

Next, verify PHP extensions *fileinfo, mbstring, and openssl* with the following command. If those extensions are enabled, each extension name will be shown.

```
sudo php -m | grep 'fileinfo\|mbstring\|openssl'
```



Additionally, you can verify the list of enabled PHP extensions via PHPINFO. Create a new PHPINFO file with the following command.

```
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```

## Configuring MariaDB server

After configuring PHP, you need to secure your MariaDB server and create a new database and user for Laravel.

Run the 'mariadb-secure-installation' command below to secure your MariaDB server. Now you will be prompted with the MariaDB server configurations.

```
sudo mariadb-secure-installation
```

When prompted, input Y to apply the new configuration or type N to reject it.

- The default MariaDB installation comes without a password. Press ENTER when prompted for the password.
- Now, input Y to set up the MariaDB root password. Then, type the new password for MariaDB and repeat the password.
- Input Y to remove the anonymous user from your MariaDB installation.
- Input Y again when prompted to disable the remote login for the MariaDB root user.
- Input Y to remove the default database test from your MariaDB.
- Lastly, input Y to reload table privileges and apply new changes.

After securing the MariaDB server, you must create a new database and user for your Laravel project.

Log in to the MariaDB server using the command below. Input your MariaDB root password when prompted.

```
sudo mariadb -u root -p
```

Now run the following queries to create a new database and user '**laravelapp**', with the password '**password**'.

```
CREATE DATABASE laravelapp;
CREATE USER laravelapp@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON laravelapp.* TO laravelapp@localhost;
FLUSH PRIVILEGES;
```

Next, run the following query to verify privileges for user '**laravelapp**'. This will ensure your user can access the Laravel database '**laravelapp**'.

```
SHOW GRANTS FOR laravelapp@localhost;
```

Lastly, type **quit** to exit from the the MariaDB server.



## Installing Laravel via Composer

Now that you have configured PHP and created MySQL/MariaDB database and user, you can install Laravel. In this section, you will set up the project directory, install Laravel via Composer, and integrate Laravel with MySQL/MariaDB database.

First, run the command below to create directories **/var/www/.cache** (for Composer cache), **/var/www/.config** (for additional Composer configuration), and **/var/www/laravelapp** (for your Laravel project).

```
sudo mkdir -p /var/www/{.cache,.config,laravelapp}
```

Now change the ownership of **/var/www/.cache**, **/var/www/.config**, and **/var/www/laravelapp** directories to the user '**www-data**'.

```
sudo chown -R www-data:www-data /var/www/{.cache,.config,laravelapp}
```

Next, go to the /var/www/laravelapp directory and install Laravel with the Composer command below.

```
cd /var/www/laravelapp/
sudo -u www-data composer create-project laravel/laravel .
```

The Laravel installation should begin like the following:

Now open the '.env' file using the nano editor command below.

```
nano .env
```

Change the default '**APP_URL**' with your local domain name. In this example, Laravel will run on the domain 'laravelapp.local'.

```
APP_URL=http://laravelapp.local
```

Change the default '**DB_CONNECTION**' to '**mysql**', uncomment, and change the database details with your information.

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravelapp
DB_USERNAME=laravelapp
DB_PASSWORD=password
```

Save and exit the file.

Lastly, run the command below to migrate the database for your Laravel project.

```
sudo -u www-data php artisan migrate
```

Output of the Laravel database migration:

## Setting up a virtual host for Laravel

In this section, you will set up the virtual host file for Laravel. Ensure that you have the local domain name ready for your Laravel development.

Before creating a virtual host, enable the Apache '**rewrite**' module with the command below.

```
sudo a2enmod rewrite
```

Create a new virtual host configuration '**/etc/apache2/sites-available/laravelapp.conf**' with the nano editor.

```
sudo nano /etc/apache2/sites-available/laravelapp.conf
```

Add the following configuration and change the **ServerName** option with your Laravel domain name, such as '**laravelapp.local**'.

```
<VirtualHost *:80>

 ServerAdmin admin@laravelapp.local
 ServerName laravelapp.local
 DocumentRoot /var/www/laravelapp/public

 <Directory />
 Options FollowSymLinks
 AllowOverride None
 </Directory>
 <Directory /var/www/laravelapp>
 AllowOverride All
 </Directory>

 ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Save the file and exit the editor.

Now run the command below to activate the '**laravelapp.conf**' virtual host and verify your Apache syntax. If no error, you should see the output '**Syntax OK**'.

```
sudo a2ensite laravelapp.conf
sudo apachectl configtest
```

Restart the Apache service to apply the new Laravel virtual host file. After Apache restarted, your Laravel installation is ready.

```
sudo systemctl restart apache2
```

## Accessing Laravel Project

At this point, you're ready to access your Laravel installation via the 'hosts' file.

For Linux or MacOS users, modify the '**/etc/hosts**' file as root privileges. For Windows users, open the file '**C:\Windows\System32\drivers\etc\hosts**' as administrator.

Add your Ubuntu server IP address followed by the Laravel domain name like the following:

```
192.168.5.30 laravelapp.local
```

Save and exit the file.

Now visit http://laravelapp.local/ with your web browser. If your Laravel installation is successful, you should get the following page:



# Laravel

* Laravel is a PHP web framework who uses the MVC architecture




## MVC

Model

* deals with database

View

* deals with HTML

Controller

* The middle-man



### Install Apache Mysql and Php

```
# Install apache2
sudo apt install apache2

# Install MySQL
sudo apt install mysql-server

# Configure MySQL Security
sudo mysql_secure_installation

# Check Mysql status
sudo service mysql status

# Test MySQL Service
sudo mysql


# Add Php repository
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

# Install php7.4
sudo apt install php libapache2-mod-php php-mysql

# Check php version
php -version

# You can confirm installed version of PHP extension using apt policy command:
apt policy php7.4-gd
php7.4-gd:
  Installed: 7.4.3-4ubuntu2.4
  Candidate: 7.4.3-4ubuntu2.4
  Version table:
 *** 7.4.3-4ubuntu2.4 500
        500 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages
        100 /var/lib/dpkg/status
     7.4.3-4ubuntu1 500
        500 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages


# Test PHP for Apache
sudo nano /var/www/html/info.php

--------------
<?php
phpinfo();
--------------
```



### Install PHP and additional PHP extensions

```
sudo apt install php libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql
```



Server Requirements

* PHP >= 7.2.5
* BCMath PHP Extension
* Ctype PHP Extension
* Fileinfo PHP extension
* JSON PHP Extension
* Mbstring PHP Extension
* OpenSSL PHP Extension
* PDO PHP Extension
* Tokenizer PHP Extension
* XML PHP Extension

Install Server Requirement

```
sudo apt install php7.4-bcmath
sudo apt install php7.4-ctype
sudo apt install php7.4-mbstring
sudo apt install php7.4-pdo
sudo apt install php7.4-xml
```

### Install Composer

Composer is a dependency package manager for PHP. It provides a framework for managing libraries and dependencies and required dependencies. To use Laravel, first install composer.

To download Composer, invoke the command shown.

```
$ curl -sS https://getcomposer.org/installer | php
```

This downloads the `composer.phar` file.

Next, move the composer file to the` /usr/local/bin` path.

```
$ sudo mv composer.phar /usr/local/bin/composer
```

Assign execute permission:

```
$ sudo chmod +x /usr/local/bin/composer
```

Verify the Composer version installed:

```
$ composer --version
Composer version 2.5.1 2022-12-22 15:33:54
```

### Laravel project folder permissions

There are basically two ways to setup your ownership and permissions. Either you give yourself ownership or you make the webserver the owner of all files.

**Webserver as owner (the way most people do it, and the Laravel doc's way):**

assuming www-data (it could be something else) is your webserver user.

```
sudo chown -R www-data:www-data /path/to/your/laravel/root/directory
```

if you do that, the webserver owns all the files, and is also the group, and you will have some problems uploading files or working with files via FTP, because your FTP client will be logged in as you, not your webserver, so add your user to the webserver user group:

```
sudo usermod -a -G www-data ubuntu
```

Of course, this assumes your webserver is running as www-data (the Homestead default), and your user is ubuntu (it's vagrant if you are using Homestead).

Then you set all your directories to 755 and your files to 644... SET file permissions

```
sudo find /path/to/your/laravel/root/directory -type f -exec chmod 644 {} \;    
```

SET directory permissions

```
sudo find /path/to/your/laravel/root/directory -type d -exec chmod 755 {} \;
```

**Your user as owner**

I prefer to own all the directories and files (it makes working with everything much easier), so, go to your laravel root directory:

```php
cd /var/www/html/laravel >> assuming this is your current root directory
sudo chown -R $USER:www-data .
```

Then I give both myself and the webserver permissions:

```
sudo find . -type f -exec chmod 664 {} \;   
sudo find . -type d -exec chmod 775 {} \;
```

**Then give the webserver the rights to read and write to storage and cache**

Whichever way you set it up, then you need to give read and write permissions to the webserver for storage, cache and any other directories the webserver needs to upload or write too (depending on your situation), so run the commands from bashy above :

```
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

Now, you're secure and your website works, AND you can work with the files fairly easily

### Migrating Project

1. Make sure you copy all of the project files including the hidden ones(.env).

2. Prepare your destination computer as in http://laravel.com/docs/

3. Check you have all the necessary PHP extensions available in php.ini as in above link requirements. Also, watch your PHP version!

4. Install composer https://getcomposer.org/doc/00-intro.md

5. When copied, go to your destination folder and run `composer install`.

6. Run php artisan key:generate from the command line.

7. Run php artisan cache:clear from command line

   ```php
   http://php.net/manual/en/install.windows.commandline.php
   ```

8. Make sure your webserver is serving pages from project/public folder.

   ```
   <VirtualHost *:80>
   
   #    ServerAdmin admin@techvblogs.com
   #    ServerName techvblogs.com
       DocumentRoot /var/www/html/bcda-pams/public
   
       <Directory /var/www/html/bcda-pams/public>
         Options +FollowSymlinks
         AllowOverride All
         Require all granted
       </Directory>
   
       ErrorLog ${APACHE_LOG_DIR}/error.log
       CustomLog ${APACHE_LOG_DIR}/access.log combined
   
   </VirtualHost>
   ```

   

If laravel is failing, check the log file to see the cause

```php
your_project/storage/logs/laravel.log
```

### Create Project via composer

```
composer create-project --prefer-dist laravel/laravel cms
```



#### Local Development Server

This command will start a development server at `http://localhost:8000`:

```
php artisan serve
```



### Setup apache2 virtual host for Laravel

Create cmt.test.conf in /etc/apache2/sites-available

```
<VirtualHost *:80>
	ServerName cms.test

	ServerAdmin webmaster@cms.test
	DocumentRoot /var/www/html/cms/public

	<Directory /var/www/html/cms/public/>
    	     Options Indexes FollowSymLinks
             AllowOverride All
             Require all granted
        </Directory>	
     
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```



```
# Change owner 
sudo chown -R $USER:www-data storage
sudo chown -R $USER:www-data bootstrap/cache

# Change permision 
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# Enable rewrite module
sudo a2enmod rewrite

# Disable 000-default.conf
sudo a2dissite 000-default.conf  

# Enable ms.test.conf
sudo a2ensite cms.test.conf

# Restart apache
sudo systemctl restart apache2

```



### Routes

routes

**Route parameters**

```
Route::get('user/{id}', function($id) {
    return 'User '.$id;
});


Route::get('post/{id}/{name}', function($id, $name) {
    return 'post '.$id .' ' .$name;
});

```
**Naming routes**

```
Route::get('admin/posts/example', array('as'=>'admin.home' ,function(){

    $url = \route('admin.home');

    return "this url is". $url;
}));

# Check the route name
$ php artisan route:list
+--------+----------+---------------------+------------+---------+------------+
| Domain | Method   | URI                 | Name       | Action  | Middleware |
+--------+----------+---------------------+------------+---------+------------+
|        | GET|HEAD | /                   |            | Closure | web        |
|        | GET|HEAD | about               |            | Closure | web        |
|        | GET|HEAD | admin/posts/example | admin.home | Closure | web        |
|        | GET|HEAD | api/user            |            | Closure | api        |
|        |          |                     |            |         | auth:api   |
|        | GET|HEAD | contact             |            | Closure | web        |
|        | GET|HEAD | post/{id}/{name}    |            | Closure | web        |
+--------+----------+---------------------+------------+---------+------------+

```



### Controllers

app > Http > Controllers

#### Creating Controller

```
$ php artisan make:controller PostsController
Controller created successfully.

# With resource
$php artisan make:controller --resource PostsController
Controller created successfully.

```

#### Routing Controller

```
Route::get('/post', 'PostsController@index')
```



#### Passing data

**Route**

```
Route::get('/post/{id}', 'PostsController@index');
```

**Controller**

```
   public function index($id)
    {
        //

        return 'The number is ' .$id ;
    }
```

#### Resouces and Controllers

Route

```
Route::resource('posts', 'PostsController');
```



```
$ php artisan route:list
+--------+-----------+-------------------+---------------+----------------------------------------------+------------+
| Domain | Method    | URI               | Name          | Action                                       | Middleware |
+--------+-----------+-------------------+---------------+----------------------------------------------+------------+
|        | GET|HEAD  | api/user          |               | Closure                                      | api        |
|        |           |                   |               |                                              | auth:api   |
|        | GET|HEAD  | posts             | posts.index   | App\Http\Controllers\PostsController@index   | web        |
|        | POST      | posts             | posts.store   | App\Http\Controllers\PostsController@store   | web        |
|        | GET|HEAD  | posts/create      | posts.create  | App\Http\Controllers\PostsController@create  | web        |
|        | GET|HEAD  | posts/{post}      | posts.show    | App\Http\Controllers\PostsController@show    | web        |
|        | PUT|PATCH | posts/{post}      | posts.update  | App\Http\Controllers\PostsController@update  | web        |
|        | DELETE    | posts/{post}      | posts.destroy | App\Http\Controllers\PostsController@destroy | web        |
|        | GET|HEAD  | posts/{post}/edit | posts.edit    | App\Http\Controllers\PostsController@edit    | web        |
+--------+-----------+-------------------+---------------+----------------------------------------------+------------+

```



### Views

resources > views

Views > contact.blade.php

```
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>Laravel</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

</head>
<body>
<div class="container">

    <h1>Contact Page</h1>

</div>
</body>
</html>

```

Controller > PostsController.php

```
 public function contact()
    {
        return view('contact');
    }
```

Routes > web.php

```
Route::get('/contact', 'PostsController@contact');
```

#### Passing data to views

**Single parameter**

Views > post.blade.php

```
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>Laravel</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

</head>
<body>
<div class="container">

    <h1>Post {{$id}}</h1>

</div>
</body>
</html>

```

Controller > PostsController.php

```
    public function show_post($id)
    {
        return view('post')->with('id',$id);
    }
```

Routes > web.php

```
Route::get('post/{id}', 'PostsController@show_post');
```

**Multiple parameters**

Views > post.blade.php

```
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>Laravel</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

</head>
<body>
<div class="container">

    <h1>Post {{$id}} {{$fname}} {{$lname}}</h1>

</div>
</body>
</html>
```

Controller > PostsController.php

```
public function show_post($id, $fname, $lname)
    {

       return view('post', compact('id', 'fname', 'lname'));
    }
```

Routes > web.php

```
Route::get('post/{id}/{fname}/{lname}', 'PostsController@show_post');
```

### Blade 

#### Master Layout

views > layouts > app.blade.php

```
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<div class="container">
    @yield('content')
</div>
    @yield('footer')
</body>
</html>
```

contact.blade.php

```
@extends('layouts.app')


@section('content')
    <h1>Contact Page</h1>
@stop
```

post.blade.php

```
@extends('layouts.app')


@section('content')
    <h1>Post Page {{$id}} {{$fname}} {{$lname}}</h1>
@stop
```

#### Display variables

Controller > PostsController.php

```
public function contact()
{
    $people = ['Sherwin', 'Analette', 'Reine', 'Lesyl', 'Shen'];

    return view('contact', compact('people'));
}
```

contact.blade.php

```
@extends('layouts.app')


@section('content')
    <h1>Contact Page</h1>

    @if(count($people))

        <ul>
        @foreach($people as $person)

            <li>{{$person}}</li>

        @endforeach
        </ul>
    @endif
@stop
```



### Database

database configuration file

* config > database.php
* .env

#### Migration

Folder of table files to be created

* database > migrations

```
# Create table
php artisan migrate

# Drop all tables and re-run all migrations
php artisan migrate:fresh

# Create a new migration file (database > migrations)
php artisan make:migration CreateTableBlog

```



### Create Login Register auth

 ```
composer require laravel/ui

php artisan ui vue --auth

sudo npm install 

sudo npm run dev
 ```

