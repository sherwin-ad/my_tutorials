



## Laravel

* Laravel is a PHP web framework who uses the MVC architecture

### MVC

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

# Test PHP for Apache
sudo nano /var/www/html/info.php

--------------
<?php
phpinfo();
--------------
```



### Install Laravel

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



### Download Composer

```
# Download composer-setup.php
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Verify if the composer-setup.php file is legit
$ php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
Installer verified

$ php composer-setup.php
All settings correct for using Composer
Downloading...

Composer (version 1.10.7) successfully installed to: /home/sherwinowen/composer.phar
Use it: php composer.phar

$ php -r "unlink('composer-setup.php');"

$ mv composer.phar /usr/local/bin/composer
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

