<?php
require_once '../../controlador/RolesControlador.php';
require_once '../../../includes/inicio.php'; 
$controlador = new RolesControlador();
$rol = $controlador->obtener($_GET['id']);
?>

<?php if ($rol): ?>
    <h2>Editar Rol</h2>

    <form method="POST" action="guardar.php">
        <input type="hidden" name="id" value="<?= $rol['id'] ?>">

        <label>Nombre:</label><br>
        <input type="text" name="nombre" value="<?= htmlspecialchars($rol['nombre']) ?>" required><br><br>

        <label>Descripción:</label><br>
        <textarea name="descripcion"><?= htmlspecialchars($rol['descripcion']) ?></textarea><br><br>

        <button type="submit">Guardar Cambios</button>
        <a href="listar.php">Cancelar</a>
    </form>
<?php else: ?>
    <p>Rol no encontrado.</p>
    <a href="listar.php">Volver</a>
<?php endif; ?>
