<?php

echo 'Hello World!' . PHP_EOL;

try {
    $pdo = new \PDO('mysql:host=mysql;port=3306', 'root', '');
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

var_dump($pdo);
