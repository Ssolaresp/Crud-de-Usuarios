<?php include '../../../includes/inicio.php'; ?>


<h2>Nuevo Rol</h2>

<form method="POST" action="guardar.php">
    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Descripción:</label><br>
    <textarea name="descripcion"></textarea><br><br>

    <button type="submit">Guardar</button>
    <a href="listar.php">Cancelar</a>
</form>
