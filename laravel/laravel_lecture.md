[TOC]

# How to Install Laravel PHP Framework on Ubuntu 24.04

https://www.howtoforge.com/tutorial/install-laravel-on-ubuntu-for-apache/

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

