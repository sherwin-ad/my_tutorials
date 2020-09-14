



# Angular

* framework for building client applications in HTML, CSS, and JavaScript/TypeScript

### Benefits of Using Angular

* Gives our applications a clean structure
* Includes a lot of re-usable code
* Makes our applications more testable
* Makes our life easier

### Setting up the Development Environment

1. Install NodeJs

   Download NodeJs binary archive in https://nodejs.org/en/

   node-v12.18.1-linux-x64.tar.xz

   Unzip the binary archive to any directory you wanna install Node, I use `/usr/local/lib/nodejs`

   ```
    VERSION=v12.18.1
    DISTRO=linux-x64
    sudo mkdir -p /usr/local/lib/nodejs
    sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
   ```

   Set the environment variable `~/.profile`, add below to the end

   ```
   # Nodejs
   VERSION=v12.18.1
   DISTRO=linux-x64
   export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
   ```

   Refresh profile

   ```
   . ~/.profile
   ```

   1. Test installation using

   ```
   node -v
   v12.18.1
   
   npm version
   {
     npm: '6.14.5',
     ares: '1.16.0',
     brotli: '1.0.7',
     cldr: '37.0',
     http_parser: '2.9.3',
     icu: '67.1',
     llhttp: '2.0.4',
     modules: '72',
     napi: '6',
     nghttp2: '1.41.0',
     node: '12.18.1',
     openssl: '1.1.1g',
     tz: '2019c',
     unicode: '13.0',
     uv: '1.38.0',
     v8: '7.8.279.23-node.38',
     zlib: '1.2.11'
   }
   
   npx -v
   6.14.5
   ```


2. Install Angular CLI

   ``` 
   sudo npm install -g @angular/cli
   ```

   Check Angular CLI version

   ```
   ng --version
   
        _                      _                 ____ _     ___
       / \   _ __   __ _ _   _| | __ _ _ __     / ___| |   |_ _|
      / △ \ | '_ \ / _` | | | | |/ _` | '__|   | |   | |    | |
     / ___ \| | | | (_| | |_| | | (_| | |      | |___| |___ | |
    /_/   \_\_| |_|\__, |\__,_|_|\__,_|_|       \____|_____|___|
                   |___/
       
   
   Angular CLI: 10.0.0
   Node: 12.18.1
   OS: linux x64
   
   Angular: 
   ... 
   Ivy Workspace: 
   
   Package                      Version
   ------------------------------------------------------
   @angular-devkit/architect    0.1000.0
   @angular-devkit/core         10.0.0
   @angular-devkit/schematics   10.0.0
   @schematics/angular          10.0.0
   @schematics/update           0.1000.0
   rxjs                         6.5.5
   ```
   
   

Create angular project

```
ng new hello-world
```

Load application in a web server

```
cd hello-world
ng server
```



### Components

1. Create courses.component.ts (src > app)

```
import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: '<h2>Courses</h2>'

})
export class CoursesComponent {
}
```

2. Added course componet in declaration array (src > app > app.modules.ts)

   Install extension Auto Import to automatically import the components

```
import { CoursesComponent } from './courses.component'; //added this 
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent,
    CoursesComponent //added this
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

```

3. Added courses element in (src > app > app.component.html)

```
<h1>Angular</h1>
<courses></courses>
```



#### Create component in terminal

```
ng g c course
CREATE src/app/course/course.component.scss (0 bytes)
CREATE src/app/course/course.component.html (21 bytes)
CREATE src/app/course/course.component.spec.ts (628 bytes)
CREATE src/app/course/course.component.ts (276 bytes)
UPDATE src/app/app.module.ts (475 bytes)
```



### Templates

```
import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: '<h2>{{ title }}</h2>''
  
})
export class CoursesComponent {
    title = "List of Courses";
}
```



### Directives (ngFor)

```

import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: `
        <h2>{{ title }}</h2>
        <ul>
            <li *ngFor="let course of courses">
                {{ course }}
            </li>
        </ul>
    `

})
export class CoursesComponent {
    title = "List of Courses";
    courses = ["course1", "course2", "course3"];
```



### Services

1. Create file courses.services.ts (src > app)

```
export class CoursesService {
    getCourses() {
        return ["course1", "course2", "course3"];
    }
}
```

2. Modify src > app > courses.component.ts

```
import { CoursesService } from './courses.service'; // add this

import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: `
        <h2>{{ title }}</h2>
        <ul>
            <li *ngFor="let course of courses">
                {{ course }}
            </li>
        </ul>
    
    `

})

export class CoursesComponent {
    title = "List of Courses";
    courses;

    constructor(service: CoursesService) { // add this
        this.courses = service.getCourses(); 
    }
}
```

3. Modify src > app > app.module.ts

```
import { CoursesService } from './courses.service'; // add this
import { CoursesComponent } from './courses.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { CourseComponent } from './course/course.component';

@NgModule({
  declarations: [
    AppComponent,
    CoursesComponent,
    CourseComponent 
  ],
  imports: [
    BrowserModule
  ],
  providers: [
    CoursesService  // add this
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

```



#### Create component in terminal

```
ng g s email
CREATE src/app/email.service.spec.ts (352 bytes)
CREATE src/app/email.service.ts (134 bytes)
```



### Bootstap

Install Bootstrap

```
npm install bootstrap --save
```

1. Import bootstrap
   src > styles.scss

```
@import "~bootstrap/dist/css/bootstrap.css";

body { padding: 20px; }
```

2. Create button
   src > app > courses.components.ts

```
import { CoursesService } from './courses.service';

import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: `
        <button class=" btn btn-primary">save</button>
    
    `
})

export class CoursesComponent {
    title = "List of Courses";
    imageUrl = "http://lorempixel.com/400/200/";
    courses;

    constructor(service: CoursesService) {
        this.courses = service.getCourses(); 
    }
}
```



#### Class Binding

```
import { CoursesService } from './courses.service';

import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: `
        <button class=" btn btn-primary" [class.active]="isActive">Save</button> // sample
        `
})

export class CoursesComponent {
   isActive = false;
}
```



#### Style Binding

```
import { CoursesService } from './courses.service';

import { Component } from '@angular/core';

@Component({
    selector: 'courses',
    template: `
        <button [style.backgroundColor]="isActive ? 'blue' : 'white'">Save</button> // sample
        `
})

export class CoursesComponent {
   isActive = true;
}
```



