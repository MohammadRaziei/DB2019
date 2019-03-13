<?php
//session_unset();
?>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script>
    </script>
</head>
<!--<body onreload="window.location = window.location.pathname;">-->
<body>
<?php
session_start();
//$_session['filename'] = "10";
echo '<p>'.$_session['filename'].'</p>';
$default_file = "test.sql";
if(!isset($_session['filename']))
    $_session['filename'] = $default_file;


?>
<strong>Test Form</strong>
<form action="" method="post">
<input type="text" value="<?php echo($_session['filename']) /*or echo($default_file)*/ ;?>" name="filename"/>
<input type="submit" name="Submit" value="run" />
</form>


<?php


//$_session['picturenum'] = 'test';
//$test = $_POST['submit'];
if (isset($_POST['Submit'])) {
    $_session['filename'] = $_POST['filename'];
    $submit = true;
}
else{
    $submit = false;
}

echo "<strong>".$submit."<br/>". $_session['filename']."</strong><br/>";?>

</body>
<script>
    // window.location = window.location.href.split("?")[0];

</script>
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
if($submit) {
    include('run_sql.php');
}
?>