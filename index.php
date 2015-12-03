<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="img/eo.ico" type="image/gif" sizes="16x16">
</head>


<body>

	<div class="container">
		<div class=" header row">
			<div class="col-md-8">
				<h3>Bienvenidos a Veotek<br>Registra tu hora</h3>
			</div>
			<div class="col-md-4">
				<img width="100%" align="center" src="img/veotek.png">
			</div>
		</div>
		<div class="menu row">
			<ul>
				<li><a href="index.php">Inicio</a></li>
				<li><a href="bitacora.php">Bitacora</a></li>
				<li><a href="administrador.php">Administrador</a></li>
			</ul>
		</div>
		<div class="register row">
			<form action="registrar.php" method="post" ctype="multipart/form-data">
				<label>Numero de empleado</label><input placeholder="Numero de empleado" name="clave">
			<!--	<label>Nombre de Usuario</label><input type="password" placeholder="Nombre de usuario" name="usuario">-->
				<input type="submit" value="Registrar hora">
			</form>
		</div>

		<div class="horario table-responsive">
			<table class="table table-condensed table-bordered">
				<tr>
					<th>ID Personal</th>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>Hora de entrada</th>
					<th>Hora de salida</th>
				</tr>
				<?php
					$hoy = date("Y-m-d");
					$dateTime = new dateTime("tomorrow");
					$tomorrow = $dateTime->format("Y-m-d");
					include('conexion.php');
					$datos = "select idpersonal,nombre,apellidos,entrada,salida from horario,personal where entrada >= '$hoy' and entrada <= '$tomorrow' and personal.idpersonal = horario.personal_idpersonal order by entrada desc";
					$horario = mysql_query($datos, $conexion) or die(mysql_error());
					$totEmp = mysql_num_rows($horario);
					while ($rows = mysql_fetch_assoc($horario)) {
						echo "<tr>";
						$idpersonal = $rows['idpersonal'];
						echo "<td>".$idpersonal."</td>";
						$nombre = $rows['nombre'];
						echo "<td>".$nombre."</td>";
						$apellido = $rows['apellidos'];
						echo "<td>".$apellido."</td>";
						$entrada = $rows['entrada'];
						echo "<td>".$entrada."</td>";
						$salida = $rows['salida'];
						echo "<td>".$salida."</td>";
						echo "</tr>";
					}
					$salida = date("Y-m-d 21:30:00",strtotime("-1 days"));
					$datos = "UPDATE horario SET salida='$salida' where salida IS NULL";					
					$actualizar = mysql_query($datos, $conexion) or die(mysql_error());
				?>
			</table>
		</div>


	</div>
	
</body>