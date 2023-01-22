<?php

return [
    'app_name' => 'My Laravel App',
    'timezone' => 'UTC',
    'locale' => 'en',
    'debug' => true,
    'url' => 'http://localhost',
    'db' => [
        'driver' => 'mysql',
        'host' => '127.0.0.1',
        'port' => '3306',
        'database' => 'my_database',
        'username' => 'root',
        'password' => 'password',
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => '',
        'strict' => false,
    ],
    'mail' => [
        'driver' => 'smtp',
        'host' => 'smtp.mailtrap.io',
        'port' => '2525',
        'username' => 'username',
        'password' => 'password',
    ],
    'log' => [
        'level' => 'debug',
        'path' => storage_path('logs/laravel.log'),
    ],
];
