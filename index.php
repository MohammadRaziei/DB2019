<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	  
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
	<style>
		*{box-sizing : border-box;}
	</style>
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
	$prefix = 'Workspace/';
	$default_file = "sql.sql";
	$cashed = '.tmp/.cashed/filename.txt';
	$submit = 0;
	if (!file_exists($cashed) or !file_exists($prefix.file_get_contents($cashed))) {
		echo('not exist');
		file_put_contents($cashed, $default_file);
		$filename = $default_file;
	}
	//echo "<strong>hi :". $filename."</strong><br/>";
	elseif (isset($_POST['filename'])) {
		$filename = $_POST['filename'];
		//echo('changed');
		file_put_contents($cashed, $filename);
		$submit = 1;
	}
	$filename = file_get_contents($cashed);


?>
<?php /*
<strong>Test Form</strong>
<form action="" method="post">
<input type="text" value="<?php echo $filename;?>" name="filename"/>
<input type="submit" name="run" value="run" />
</form>
<form action="clean.php" method="post">
<input type="submit" name="clean" value="clean" />
</form>
*/
?>
  <div class="collapse navbar-collapse" >

    <div class="col-sm-3 col-md-3">
        <form class="navbar-form" action="" method="post">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="filename" value="<?php echo $filename;?>" name="filename"/>
            <div class="input-group-btn" style="heigth : 10px;">
                <button name="run" class="btn btn-success" type="submit"><i class="glyphicon glyphicon-share"></i></button>
            </div>
        </div>
        </form>

		<form style="margin-left: 15px;" action="clean.php" method="post">
			<input type="submit" class="btn btn-danger" name="clean" value="clean" />
		</form>
	



		<p style = "margin-top : 20px;margin-left : 15px;">
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
			if(!file_exists($prefix.file_get_contents($cashed))) {
					die("Your file doesn't exist.");
				}

			//echo "<strong>".$submit."<br/>". $prefix.$filename."</strong><br/>";?>


			<?php
			session_start();
			// Name of the file
			$_session['filename'] = $prefix.$filename;
			// MySQL host
			$_session['mysql_host'] = 'localhost';
			// MySQL username
			$_session['mysql_username'] = 'root';
			// MySQL password
			$_session['mysql_password'] = '';
			// Database name
			$_session['mysql_database'] = 'db2019';
			//echo "<strong>".$submit."<br/>". $prefix.$filename."</strong><br/>";
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
		</p>

	</div><!-- /.navbar-collapse -->
</div>

</body>

</html>
