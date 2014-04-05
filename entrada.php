<?php 

$nombre = $_POST['usuario']; 
$clave = $_POST['password']; 

if ($nombre=="pdisolutions" && $clave =="software") { 

echo "<h1>Hola Usuario<h1>"; 
echo "Bienvenido al sistema"; 

} 
else { 

				if ($nombre=="admin" && $clave =="admin") { 

					echo "<h1>Hola administrador<h1>"; 
				echo "Bienvenido al sistema"; 

			} else { 

echo "<p>Su Login es Incorrecto</p>"; 
echo "Se ha pulsado el boton enviar"; 

} 
} 

?>