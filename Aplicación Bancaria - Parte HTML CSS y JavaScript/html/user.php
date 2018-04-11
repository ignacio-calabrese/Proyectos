<?php
    $nombre = $_POST["name"];
	$password = $_POST["password"];
	
?>

<!DOCTYPE html> 
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>Datos de Sesiòn</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		
	</head>
	<body>
		<center>
			<header><h1>Aplicación Bancaria</h1></header>
			<h1>Datos de Sesiòn</h1>
			<h2>Sus datos de usuario</h2>
			<p><?php echo "Su usuario es: " . $nombre . " y su clave es: " . $password;?></p>
			<br>
			<br>
			<br>
		</center>
		<footer><tt><center>2018 - Esta pàgina fue diseñada por Plan 111Mil Programadores - Turno sàbado</center></tt></footer>
		<script src="js/index.js"></script>
	</body>
</html>

