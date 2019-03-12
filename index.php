<strong>Test Form</strong>
<form action="" method"post">
<input type="text" name="picturenum"/>
<input type="submit" name="Submit" value="Submit!" />
</form>

<?
if (isset($_POST['Submit'])) {
    $_session['picturenum'] = $_POST['picturenum'];
}
?>

<strong><? echo $_session['picturenum'];?></strong>
<?php
// Name of the file
$filename = 'sql.sql';
// MySQL host
$mysql_host = 'localhost';
// MySQL username
$mysql_username = 'root';
// MySQL password
$mysql_password = '';
// Database name
$mysql_database = 'db2019';
?>