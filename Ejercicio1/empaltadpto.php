<?php

$servername = "mysql";
$username = "root";
$password = "rootroot";
$dbname = "empleadosnm";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (!isset($_POST) || empty($_POST)) {
echo '<form action="" method="post">';
?>
	<h1>Alta Departamento:</h1>
	<p>Nombre del departamento: <input type="text" name='ndept' size=15>
	
	</br>
<?php 
echo '<div><input type="submit" value="ALTA Departamento"></div>
	</form>';
}

else{
	$nombre=$_POST["ndept"];

  $sql = "select max(cod_dpto) from departamento";
  $dep = mysqli_query($conn,$sql);

  if ($dep!=null) {
		while ($row = mysqli_fetch_assoc($dep)) {
			$r = $row['max(cod_dpto)'];
			
		}
		
		$ide_dep_nuevo = $r + 1;
		$sql2 = "insert into departamento values ('$ide_dep_nuevo', '$nombre')";
		mysqli_query($conn,$sql2);
	}

}


?>
