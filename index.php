<?php
session_start();
?>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>


<strong>Test Form</strong>
<form action="" method="post">
<input type="text" name="picturenum" <?php if(isset($_session['filename'])) echo 'value="'.$_session['filename'].'"'; ?>/>
<input type="submit" name="Submit" value="Submit!" />
</form>


<?php

// session_start();
//$_session['picturenum'] = 'test';
//$test = $_POST['submit'];
if (isset($_POST['Submit'])) {
    $_session['filename'] = $_POST['picturenum'];
}

echo "<strong>". $_session['filename']."</strong><br/>";?>

</body>
</html>
<?php
//session_start();
// Name of the file
//$_session['filename'] = 'sql.sql';
// MySQL host
$_session['mysql_host'] = 'localhost';
// MySQL username
$_session['mysql_username'] = 'root';
// MySQL password
$_session['mysql_password'] = '';
// Database name
$_session['mysql_database'] = 'db2019';
include('run_sql.php');

?>
