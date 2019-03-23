<?php

/*
$filename = $_session['filename'];
// MySQL host
$mysql_host = $_session['mysql_host'];
// MySQL username
$mysql_username = $_session['mysql_username'];
// MySQL password
$mysql_password = $_session['mysql_password'];
// Database name
$mysql_database = $_session['mysql_database'];


$conn = @new mysqli($mysql_host,$mysql_username,$mysql_password);
*/
$mysql_database = "db2019";
$conn = mysqli_connect("localhost","root","");
// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_errno;
    echo "<br/>Error: " . $conn->connect_error;
}
$conn->query('CREATE DATABASE IF NOT EXISTS '.$mysql_database.';'); // for first run
mysqli_select_db ( $conn , $mysql_database );
$conn->query('DROP DATABASE db2019;') or print('Error performing query \'<strong>' .'DROP DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
$conn->query('CREATE DATABASE db2019;') or print('Error performing query \'<strong>' . 'CREATE DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
//$conn->query('USE DATABASE db2019;') or print('Error performing query \'<strong>' . 'USE DATABASE db2019;' . '\': ' . $conn->error() . '<br /><br />');
header('Location: .');

?>