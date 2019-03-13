<?php
$conn = mysqli_connect("localhost","root","","db2019" );
// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_errno;
    echo "<br/>Error: " . $conn->connect_error;
}

$conn->query('DROP DATABASE db2019;') or print('Error performing query \'<strong>' .'DROP DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
$conn->query('CREATE DATABASE db2019;') or print('Error performing query \'<strong>' . 'CREATE DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
//$conn->query('USE DATABASE db2019;') or print('Error performing query \'<strong>' . 'USE DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
header('Location: .');

?>