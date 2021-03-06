<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="img/eo.ico" type="image/gif" sizes="16x16">
</head>


<body>

	<div class="container">
		<div class="register row">
			<div class="col-md-4">
				<div class="row">
					<img width="100%" align="center" src="img/veotek.png">
				</div>
				<div class=" header row">
					<h3 class="text-center">Bienvenidos a Veotek<br>
					<?php
						include('tolerancia.php');
						$hoy = date("Y-m-j");
						$annio = substr($hoy, 0,4);
						$mes = substr($hoy, 5,2);
						$dia = substr($hoy, 8,2);
						$meses = array('1' =>  'Enero', 
									'2' =>  'Febrero',
									'3' =>  'Marzo',
									'4' =>  'Abril',
									'5' =>  'Mayo',
									'6' =>  'Junio',
									'7' =>  'Julio',
									'8' =>  'Agosto',
									'9' =>  'Septiembre',
									'10' =>  'Octubre',
									'11' =>  'Noviembre',
									'12' =>  'Diciembre',);
						$nombre_mes = $meses[$mes];
					?>
					<?php echo $dia;?> de <?php echo $nombre_mes;?> del <?php echo $annio; ?></h3>
				</div>
				<div class="menu row">
					<ul>
						<li><a href="index.php">Inicio</a></li>
						<li><a href="bitacora.php">Bitacora</a></li>
						<li><a href="administrador.php">Administrador</a></li>
					</ul>
				</div>

				<div class="row">
					<form action="registrar.php" method="post" ctype="multipart/form-data">
						<p class="text-center"><label>Numero de empleado</label></p><br><input class="numero" placeholder="No. de empleado" name="clave">
					<!--	<label>Nombre de Usuario</label><input type="password" placeholder="Nombre de usuario" name="usuario">-->
					<!--	<br><input type="submit" value="Registrar hora">-->
					</form>
				</div>
			</div>
		

			<div class="col-md-8">
				<div class="horario table-responsive">
					<table class="table table-condensed table-bordered salida">
						<tr>
							<th>Nombre</th>
							<th>Hora de entrada</th>
							<th>Hora de salida</th>
							<th>Tiempo</th>
						</tr>
						<?php
							$dateTime = new dateTime("tomorrow");
							$hoy = date("Y-m-d");
							$tomorrow = $dateTime->format("Y-m-d");
							include('conexion.php');
							$datos = "select idpersonal,nombre,apellidos,dia_entrada,hora_entrada,dia_salida,hora_salida,tiempo from horario,personal where dia_entrada = '$hoy' and personal.idpersonal = horario.personal_idpersonal and hora_salida is not null order by hora_salida desc";
							$horario = mysql_query($datos, $conexion) or die(mysql_error());
							$totEmp = mysql_num_rows($horario);
							while ($rows = mysql_fetch_assoc($horario)) {
								echo "<tr>";
								$nombre = $rows['nombre']." ".$rows['apellidos'];
								echo "<td>".$nombre."</td>";
								$hora_entrada = $rows['hora_entrada'];
								echo "<td>".$hora_entrada."</td>";
								$hora_salida = $rows['hora_salida'];
								echo "<td>".$hora_salida."</td>";
								$tiempo = $rows['tiempo'];
								echo "<td>".$tiempo."</td>";
								echo "</tr>";
							}

							?>

					</table>
					<table class="table table-condensed table-bordered entrada">
					<?php
							$datos = "select idpersonal,nombre,apellidos,dia_entrada,hora_entrada,dia_salida,hora_salida from horario,personal where dia_entrada = '$hoy' and personal.idpersonal = horario.personal_idpersonal and hora_salida is null order by hora_entrada desc";
							$horario = mysql_query($datos, $conexion) or die(mysql_error());
							$totEmp = mysql_num_rows($horario);
							while ($rows = mysql_fetch_assoc($horario)) {
								echo "<tr>";
								$nombre = $rows['nombre']." ".$rows['apellidos'];
								echo "<td>".$nombre."</td>";
								$hora_entrada = $rows['hora_entrada'];
								echo "<td>".$hora_entrada."</td>";
								$hora_salida = $rows['hora_salida'];
								echo "</tr>";
							}
/*							if(date("w")=="1"){

								$sabado = date("Y-m-d",strtotime("-2 days"));
							
								$sql = "select * from horario where dia_entrada='$sabado'and hora_salida IS NULL";
								$if_exist_entrada = mysql_query($sql, $conexion) or die(mysql_error());
								$total = mysql_num_rows($if_exist_entrada);
								while ($rowEmp = mysql_fetch_assoc($if_exist_entrada)) {
									$hora_entrada =  $rowEmp['hora_entrada'];	
							

									$hora_salida="17:30:00";

									$total      = strtotime($hora_salida) - strtotime($hora_entrada);
									$hours      = floor($total / 60 / 60);
									$minutes    = round(($total - ($hours * 60 * 60)) / 60);

									$tiempo = $hours.':'.$minutes;

									$hm = explode(":", $tiempo);
									$res = ($hm[0] + ($hm[1]/60));


									$datos = "UPDATE horario SET dia_salida='$sabado',hora_salida='$hora_salida',tiempo='$tiempo',tiempo_decimal='$res' where dia_entrada='$sabado' and hora_salida IS NULL";					
									$actualizar = mysql_query($datos, $conexion) or die(mysql_error());
								}
							}
							else{
								$ayer = date("Y-m-d",strtotime("-1 days"));
								
								$sql = "select * from horario where dia_entrada='$ayer' and hora_salida IS NULL";
								$if_exist_entrada = mysql_query($sql, $conexion) or die("Al encontrar ".mysql_error());
								$total = mysql_num_rows($if_exist_entrada);
								while ($rowEmp = mysql_fetch_assoc($if_exist_entrada)) {
									$hora_entrada =  $rowEmp['hora_entrada'];	

									$hora_salida="19:40:00";

									$total      = strtotime($hora_salida) - strtotime($hora_entrada);
									$hours      = floor($total / 60 / 60);
									$minutes    = round(($total - ($hours * 60 * 60)) / 60);

									$tiempo = $hours.':'.$minutes;

									$hm = explode(":", $tiempo);
									$res = ($hm[0] + ($hm[1]/60));


									$datos = "UPDATE horario SET dia_salida='$ayer',hora_salida='$hora_salida',tiempo='$tiempo',tiempo_decimal='$res' where dia_entrada='$ayer' and hora_salida IS NULL";					
									$actualizar = mysql_query($datos, $conexion) or die("Al actualizar ".mysql_error());
								}

							}
							*/
						?>
					</table>
				</div>
			</div>
		</div>

	</div>
	
</body>