<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="img/eo.ico" type="image/gif" sizes="16x16">
<META HTTP-EQUIV="REFRESH" CONTENT="1;URL=index.php">
</head>
<body>

	<?php

	if(empty($_POST['clave'])){
		echo "<META HTTP-EQUIV='REFRESH' CONTENT='5;URL=index.php'>
		<div class='container'>
			<div class='error row'> 
				<img id='cargando' src='img/cargando.gif'><br>
				<h2 class='text-center'>Informaci&oacute;n no recibida</h2>
			</div>
		</div>";
		return false;
	}
	include('conexion.php');
	$dia = date("Y-m-d H:i:sa");
	$clave = $_POST['clave'];


			$acceder = "select * from personal where idpersonal = '$clave'";
			$resAcceder = mysql_query($acceder, $conexion) or die(mysql_error());
			$total = mysql_num_rows($resAcceder);
			if($total==1){
				$sql = "select * from horario where personal_idpersonal = '$clave' and salida IS NULL";
				/*$sql = "insert into horario(entrada,usuario_idusuario) values('$dia','$id_system')";*/
				$if_exist_entrada = mysql_query($sql, $conexion) or die(mysql_error());
				$total = mysql_num_rows($if_exist_entrada);
				if ($total==1) {
					while ($rowEmp = mysql_fetch_assoc($if_exist_entrada)) {
							echo "<META HTTP-EQUIV='REFRESH' CONTENT='3;URL=index.php'>
							<div class='container'>
								<div class='error row'> 
									<img id='cargando' src='img/cargando.gif'><br>
									<h2 class='text-center'>Registrando salida</h2>
								</div>
							</div>";
						$entrada = $rowEmp['entrada'];
						$sql = "UPDATE horario SET salida='$dia' WHERE personal_idpersonal='$clave' and entrada = '$entrada'";
						$resultado = mysql_query($sql, $conexion) or die(mysql_error());
					}
					
				}
				else{
							echo "<META HTTP-EQUIV='REFRESH' CONTENT='3;URL=index.php'>
							<div class='container'>
								<div class='error row'> 
									<img id='cargando' src='img/cargando.gif'><br>
									<h2 class='text-center'>Registrando entrada</h2>
								</div>
							</div>";
					$sql = "insert into horario(entrada,personal_idpersonal) values('$dia','$clave')";
					$resultado = mysql_query($sql, $conexion) or die(mysql_error());

				}

		}
		else{
				echo "<META HTTP-EQUIV='REFRESH' CONTENT='3;URL=index.php'>
					<div class='container'>
						<div class='error row'> 
							<img id='cargando' src='img/cargando.gif'><br>
							<h2 class='text-center'>Algo anda mal</h2>
						</div>
					</div>";

		}

	?>

</body>
