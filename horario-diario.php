<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/imprimir.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="img/eo.ico" type="image/gif" sizes="16x16">
</head>



<body>

<?php
$tomorrow = new DateTime('tomorrow');
$tday =  $tomorrow->format('Y-m-d H:i:s');
if(empty($_GET['date'])){
	echo "<META HTTP-EQUIV='REFRESH' CONTENT='5;URL=reportes.php'>
	<div class='container'>
		<div class='error row'> 
			<img id='cargando' src='img/cargando.gif'><br>
			<h2 class='text-center'>Informaci&oacute;n no recibida</h2>
		</div>
	</div>";
	return false;
}
$fecha =  $_GET['date'];
$annio = substr($fecha, 0,4);
$mes = substr($fecha, 5,2);
$dia = substr($fecha, 8,2);
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
	<div class="container">
		<div class="row horario">
			<h3>Horario del <?php echo $dia." de ".$nombre_mes. " del ".$annio; ?></h3>
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>ID Personal</th>
						<th>Nombre</th>
						<th>D&iacute;a</th>
						<th>Hora de entrada</th>
						<th>Hora de salida</th>
						<th>Tiempo</th>
					</tr>
					<?php
						include('conexion.php');
						$datos = "select idpersonal,nombre,apellidos,dia_entrada,hora_entrada,hora_salida,tiempo from horario,personal where personal.idpersonal = horario.personal_idpersonal and dia_entrada >= '$fecha' order by hora_entrada";
						$horario = mysql_query($datos, $conexion) or die(mysql_error());
						$totEmp = mysql_num_rows($horario);
						while ($rows = mysql_fetch_assoc($horario)) {
							echo "<tr>";
							$idpersonal = $rows['idpersonal'];
							echo "<td>".$idpersonal."</td>";
							$nombre = $rows['nombre']. " " .$apellido = $rows['apellidos'];
							echo "<td>".$nombre."</td>";
							$dia = $rows['dia_entrada'];
							echo "<td>".$dia."</td>";
							$entrada = $rows['hora_entrada'];
							echo "<td>".$entrada."</td>";
							$salida = $rows['hora_salida'];
							echo "<td>".$salida."</td>";
							$tiempo = $rows['tiempo'];
							echo "<td>".$tiempo."</td>";
							echo "</tr>";
						}
						
					?>
				</table>
			</div>
		</div>
		<button onclick='window.print()' type='button' id='btnImprimir'></button>		
	</div>

</body>