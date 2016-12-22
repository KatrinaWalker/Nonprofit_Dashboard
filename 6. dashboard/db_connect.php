<?php
	$db_name = "db_npo";
	$un = "gseuser";
	$pw = "gsepass";
	$host = "ubuntu@52.210.252.110";
	
	mysql_connect($host, $un, $pw) or die (mysql_error());
	echo("Connected to mySQL Database");
	
	mysql_select_db($db_name)or die (mysql_error());
	echo("Connected to NPO");
	
	
	
?>
