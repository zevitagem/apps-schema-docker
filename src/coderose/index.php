<?php

echo 'JOSEPH, HELLO WORLD!' . PHP_EOL;

try {
    $dbh = new \PDO('mysql:host=mysql;port=3306', 'root', '');
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

var_dump($dbh);
