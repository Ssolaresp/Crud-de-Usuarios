<?php
session_start();

// Si no está logueado, redirige al login
if (!isset($_SESSION['usuario_id'])) {
    header('Location: includes/login.php');
    exit;
}

// Si está logueado, muestra el nombre del usuario
$nombre = htmlspecialchars($_SESSION['usuario_nombre']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
</head>
<body>
    <h1>Bienvenido, <?php echo $nombre; ?> 👋</h1>
    <p>Has iniciado sesión correctamente.</p>


    <!-- app/vista/menu.php -->
<nav style="background:#222; padding:10px;">
    <a href="/Crud_usuarios/app/vista/Usuarios/listar.php" style="color:#fff; margin-right:15px; text-decoration:none;">Usuarios</a>
    <a href="/Crud_usuarios/app/vista/Rol_Usuario/listar.php" style="color:#fff; margin-right:15px; text-decoration:none;">Roles Usuarios</a>
  
</nav>




    <a href="includes/logout.php">Cerrar sesión</a>
</body>
</html>
