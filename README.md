
## Overview 
This a simple Laravel Web application for Task Mangement System that create and save task in the mysql table.

## Requirments
Create task (info to save: task name, priority, timestamps) <br>
Edit task <br>
Delete task <br>
Reorder tasks with drag and drop in the browser. Priority should automatically be updated based on this. #1 priority goes at top, #2 next down and so on. <br>
Tasks should be saved to a mysql table. <br>
BONUS POINT: add project functionality to the tasks. User should be able to select a project from a dropdown and only view tasks associated with that project.

## Installation & Usage
<hr/>

### Downloading the Project


This project requires PHP 8.0 and uses Laravel 9
.  
You can simply clone  ``Task management system`` like below on your git bash

``` bash
git clone https://github.com/ayangzy/task-management-system.git
```
After cloning the project, please run this command on the project directory
```
composer install
```
### Configure Environment
To run the application you must configure the ```.env``` environment file with your database details
```
cp .env.example .env

```

### Generating app key
Run the following commands each on the project 
```
php artisan key:generate
```

```
php artisan migrate
```

## Seeding DB
Once your database is correctly set up, you can seed your database by running
```
php artisan db:seed
```
### Clear cache if you run into issues
 
Then run this command 
``` 
php artisan optimize

```
### Serving the application, run the below command
``` 
php artisan serve
```

## Security

If you discover any security related issues, please email ayangefelix8@gmail.com instead of using the issue tracker.

## Credits

- [Ayange Felix](https://github.com/ayangzy)


