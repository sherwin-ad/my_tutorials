



## Laravel

* Laravel is a PHP web framework who uses the MVC architecture

### MVC

Model

* deals with database

View

* deals with HTML

Controller

* The middle-man

### Composer

* dependency manager for PHP

**Install Composer**

```php bin/composer
php composer-setup.php --install-dir=bin --filename=composer

php bin/composer
    
mv composer.phar /usr/bin/composer
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

