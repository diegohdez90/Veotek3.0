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
	$dia = date("Y-m-d");
	$hora = date("H:i:sa");
	$clave = $_POST['clave'];


			$acceder = "select * from personal where idpersonal = '$clave'";
			$resAcceder = mysql_query($acceder, $conexion) or die(mysql_error());
			$total = mysql_num_rows($resAcceder);
			if($total==1){
				$sql = "select * from horario where personal_idpersonal = '$clave' and dia_entrada='$dia' and hora_salida IS NULL";
				/*$sql = "insert into horario(entrada,usuario_idusuario) values('$dia','wor$id_system')";*/
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
						$hora_entrada =  $rowEmp['hora_entrada'];	
						$hora_salida = substr($hora, 0,8);

						$total      = strtotime($hora_salida) - strtotime($hora_entrada);
						$hours      = floor($total / 60 / 60);
						$minutes    = round(($total - ($hours * 60 * 60)) / 60);

						$tiempo = $hours.':'.$minutes;

						$hm = explode(":", $tiempo);
						$res = ($hm[0] + ($hm[1]/60));
						
						$sql = "UPDATE horario SET dia_salida='$dia',hora_salida='$hora',tiempo='$tiempo',tiempo_decimal='$res' WHERE personal_idpersonal='$clave' and hora_entrada = '$hora_entrada'";
						$resultado = mysql_query($sql, $conexion) or die(mysql_error());
					}
					
				}
				else{
						
					if(date("w")==1){
						$fin = date("Y-m-d",strtotime("-2 days"));
						$todas_tolerancias = "SELECT * FROM tolerancia";
						$result = mysql_query($todas_tolerancias,$conexion);
						$num_rows = mysql_num_rows($result);
						if($num_rows==0){
							$get_tol = "select nombre,apellidos,tolerancia from personal;";
							$tolerancia = mysql_query($get_tol, $conexion) or die(mysql_error());
							$nrow = mysql_num_rows($tolerancia);
							while ($rs = mysql_fetch_assoc($tolerancia)) {
								$nombre = $rs['nombre']." ".$rs['apellidos'];
								$tol = $rs['tolerancia'];
								$insert_tol = "insert into tolerancia(nombre,tolerancia,fecha) values('$nombre','$tol','$fin')";
								$resultado = mysql_query($insert_tol, $conexion) or die(mysql_error());
							}
							$reiniciar = "update personal set tolerancia='00:00:00'";
							$resultado = mysql_query($reiniciar, $conexion) or die(mysql_error());
						}
						else{
							$ultimo = "SELECT LAST(fecha) AS ultimo FROM tolerancia";
							$result = mysql_query($ultimo,$conexion);
							while ($rs=mysql_fetch_assoc($result)) {
								$ultimo_registro = $rs['ultimo'];
							}
							$get_tol = "select nombre,apellidos,tolerancia from personal;";
							$tolerancia = mysql_query($get_tol, $conexion) or die(mysql_error());
							$nrow = mysql_num_rows($tolerancia);
							while ($rs = mysql_fetch_assoc($tolerancia)) {
								$nombre = $rs['nombre']." ".$rs['apellidos'];
								$tol = $rs['tolerancia'];
								if($ultimo_registro!=$fin){
									$insert_tol = "insert into tolerancia(nombre,tolerancia,fecha) values('$nombre','$tol','$fin')";
									$resultado = mysql_query($insert_tol, $conexion) or die(mysql_error());
								}
							}
							$reiniciar = "update personal set tolerancia='00:00:00'";
							$resultado = mysql_query($reiniciar, $conexion) or die(mysql_error());
						}
					}
							echo "<META HTTP-EQUIV='REFRESH' CONTENT='20;URL=index.php'>
							<div class='container'>
								<div class='error row'> 
									<img id='cargando' src='img/cargando.gif'><br>
									<h2 class='text-center'>Registrando entrada</h2>
								</div>
							</div>";
					$sql = "insert into horario(dia_entrada,hora_entrada,personal_idpersonal) values('$dia','$hora','$clave')";
					$resultado = mysql_query($sql, $conexion) or die(mysql_error());

					if(date("w")==6){
						if($hora>="08:50:00"&&$hora<="12:50:00"){
							$get_tol = "select tolerancia from personal where '$clave'=idpersonal;";
							$tolerancia = mysql_query($get_tol, $conexion) or die(mysql_error());	
							while ($rs = mysql_fetch_assoc($tolerancia)) {
								$tol = $rs['tolerancia'];

								$total      = strtotime($hora) - strtotime("08:50:00");
								$hours      = floor($total / 60 / 60);
								$minutes    = round(($total - ($hours * 60 * 60)) / 60);

								$tiempo = $hours.":".$minutes.':00';
								$suma  = $tol +strtotime($tiempo);
								$sumtime = date("H:i:s",$suma);
					
								$sumar = "update personal set tolerancia='$sumtime' where idpersonal='$clave'";
								$resultado = mysql_query($sumar, $conexion) or die(mysql_error());
							}

						}						
					}
					else{
						if($hora>="08:20:00"&&$hora<="12:50:00"){
							$get_tol = "select tolerancia from personal where '$clave'=idpersonal;";
							$tolerancia = mysql_query($get_tol, $conexion) or die(mysql_error());	
							while ($rs = mysql_fetch_assoc($tolerancia)) {
								$tol = $rs['tolerancia'];

								$total      = strtotime($hora) - strtotime("08:20:00");
								$hours      = floor($total / 60 / 60);
								$minutes    = round(($total - ($hours * 60 * 60)) / 60);

								$tiempo = $hours.":".$minutes.':00';
								$suma  = $tol +strtotime($tiempo);
								$sumtime = date("H:i:s",$suma);
					
								$sumar = "update personal set tolerancia='$sumtime' where idpersonal='$clave'";
								$resultado = mysql_query($sumar, $conexion) or die(mysql_error());
							}
						}
					}


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
