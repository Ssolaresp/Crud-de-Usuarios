Descripción del Proyecto

Este proyecto es un sistema web desarrollado bajo el patrón MVC (Modelo-Vista-Controlador) que implementa un CRUD completo para cada tabla de la base de datos, ofreciendo una gestión integral y segura de usuarios, roles y sesiones, con funcionalidades avanzadas de auditoría.
Características principales:

    CRUD completo para todas las tablas:

        usuarios: Gestión total de usuarios con creación, edición, eliminación y listado.

        roles: Administración detallada de roles con permisos y descripciones.

        rol_usuario: Asociación dinámica entre usuarios y roles, permitiendo múltiples roles por usuario.

        bitacora_estados: Control y gestión de estados de usuario (activo, inactivo, suspendido, eliminado) mediante CRUD.

        bitacora_sesiones: Registro completo de sesiones de usuario, incluyendo IP, navegador, fecha de ingreso y fecha de salida, para auditoría y control.

       

    Módulo de autenticación (login) seguro:
    Validación de usuarios con chequeo de estado (activo, inactivo, suspendido), para acceso controlado y seguro al sistema.

    Bitácora y auditoría:
    Registro detallado de actividades y cambios en el sistema, para monitoreo y seguridad.

    Base de datos relacional optimizada:
    Uso de claves foráneas, índices y restricciones para garantizar integridad referencial y rendimiento óptimo.

    Arquitectura modular y escalable:
    Separación clara entre modelos, vistas y controladores para facilitar mantenimiento, escalabilidad y futuras mejoras.
