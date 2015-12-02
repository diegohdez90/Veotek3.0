<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="icon" href="img/eo.ico" type="image/gif" sizes="16x16">
</head>



<body>
<?php
$usuario = $_GET['usuario'];
?>
	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Hora de entrada</th>
						<th>Hora de salida</th>
					</tr>
					<?php
						include('conexion.php');
						$usuario = $_GET['usuario'];
						$datos = "select * from horario where personal_idpersonal = '$usuario'";
						$horario = mysql_query($datos, $conexion) or die(mysql_error());
						$totEmp = mysql_num_rows($horario);
						while ($rows = mysql_fetch_assoc($horario)) {
							echo "<tr>";
							$entrada = $rows['entrada'];
							echo "<td>".$entrada."</td>";
							$salida = $rows['salida'];
							echo "<td>".$salida."</td>";
							echo "</tr>";
						}
						
					?>
				</table>
			</div>
		</div>
	</div>

</body>