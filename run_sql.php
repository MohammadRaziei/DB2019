<?php
/*
$servername = "localhost";
$username = "root";
$password = "";
$database = "db2019";

//// Create connection
//$conn = new mysqli($servername,$username, $password );
$conn = mysqli_connect($servername,$username,$password,$database );
//$conn = mysqli_connect("localhost","root","","db2019" );
    


//// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";
*/
?>

<?php

//// Name of the file
//$filename = 'sql.sql';
//// MySQL host
//$mysql_host = 'localhost';
//// MySQL username
//$mysql_username = 'root';
//// MySQL password
//$mysql_password = '';
//// Database name
//$mysql_database = 'db2019';

//session_start();
// Name of the file
$filename = $_session['filename'];
// MySQL host
$mysql_host = $_session['mysql_host'];
// MySQL username
$mysql_username = $_session['mysql_username'];
// MySQL password
$mysql_password = $_session['mysql_password'];
// Database name
$mysql_database = $_session['mysql_database'];

// Connect to MySQL server
$conn = @new mysqli($mysql_host,$mysql_username,$mysql_password,$mysql_database);

// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_errno;
    echo "<br/>Error: " . $conn->connect_error;
}

// Temporary variable, used to store current query
$templine = '';
// Read in entire file
$lines = file($filename);
$numline = count($lines); $i = 0;
try {
    // Loop through each line
    foreach ($lines as $line) {
        // Skip it if it's a comment
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;
        // Add this line to the current segment
        $templine .= $line;
        // If it has a semicolon at the end, it's the end of the query
        if ((substr(trim($line), -1, 1) == ';') or ++$i == $numline ){
            // Perform the query
            $conn->query($templine);
//            $conn->query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . $conn->error() . '<br /><br />');
            // Reset temp variable to empty
            $templine = '';
        }
    }
    exit( "Tables imported successfully");
}
catch (Exception $e){
    print('Error');
}
$conn->close();