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
	//window.location = window.location.href.split("#")[0];
	</script>
	<?php
		if (isset($_POST['submit'])){
		$_POST = array();
		echo '
		window.location = window.location.pathname;
		<script type="text/javascript">
		location.reload();
		</script>';
		}
	?>
</head>
<!--<body onreload="window.location = window.location.pathname;">-->
<body>
<?php
    function file_force_contents($dir, $contents){
        $parts = explode('/', $dir);
        $file = array_pop($parts);
        $dir = '';
        foreach($parts as $part)
            if(!is_dir($dir .= "/$part")) mkdir($dir);
        file_put_contents("$dir/$file", $contents);
    }
	$default_file = "sql.sql";
	$cashed = '.tmp/.cashed/filename.txt';
	$submit = 0;
	if (!file_exists($cashed) or !file_exists(file_get_contents($cashed))) {
		echo('not exist');
		file_put_contents($cashed, $default_file);
		$filename = $default_file;
	}
	//echo "<strong>hi :". $filename."</strong><br/>";
	elseif (isset($_POST)) {
		$filename = $_POST['filename'];
		//echo('changed');
		file_put_contents($cashed, $filename);
		$submit = 1;
	}
	$filename = file_get_contents($cashed);


?>
<strong>Test Form</strong>
<form action="" method="post">
<input type="text" value="<?php echo $filename; /*or echo($default_file)*/ ;?>" name="filename"/>
<input type="submit" name="Submit" value="run" />
</form>


<?php
/*
$submit = 0;
if (isset($_POST)) {
    $filename = $_POST['filename'];
	//echo('changed');
	file_put_contents($cashed, $filename);
    $submit = 1;
}*/
$_POST = array();
if(!file_exists(file_get_contents($cashed))) {
		die("Your file doesn't exist.");
	}

echo "<strong>".$submit."<br/>". $filename."</strong><br/>";?>

</body>
<script>
    // window.location = window.location.href.split("?")[0];

</script>
<?php
session_start();
// Name of the file
$_session['filename'] = $filename;
// MySQL host
$_session['mysql_host'] = 'localhost';
// MySQL username
$_session['mysql_username'] = 'root';
// MySQL password
$_session['mysql_password'] = '';
// Database name
$_session['mysql_database'] = 'db2019';
echo "<strong>".$submit."<br/>". $filename."</strong><br/>";
$i = 0;
if($submit) {
	$submit = 0;
    include('run_sql.php');
}
$submit = 0;
if (isset($_POST['submit'])){
$_POST = array();
echo '
window.location = window.location.pathname;
<script type="text/javascript">
location.reload();
</script>';
}
?>
</html>
