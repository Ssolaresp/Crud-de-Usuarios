-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2025 at 02:03 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usuarios`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora_estados`
--

CREATE TABLE `bitacora_estados` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bitacora_estados`
--

INSERT INTO `bitacora_estados` (`id`, `nombre`, `descripcion`, `creado_en`, `actualizado_en`) VALUES
(1, 'activo', 'Usuario habilitado para acceder al sistema', '2025-07-29 07:53:47', '2025-07-29 07:53:47'),
(2, 'inactivo', 'Usuario deshabilitado temporalmente', '2025-07-29 07:53:47', '2025-07-29 07:53:47'),
(3, 'suspendido', 'Cuenta suspendida por alguna razón', '2025-07-29 07:53:47', '2025-07-29 07:53:47'),
(4, 'eliminado', 'Cuenta eliminada lógicamente', '2025-07-29 07:53:47', '2025-07-29 07:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `bitacora_sesiones`
--

CREATE TABLE `bitacora_sesiones` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `navegador` text,
  `fecha_ingreso` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_salida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recuperar_contrasena`
--

CREATE TABLE `recuperar_contrasena` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiracion` datetime NOT NULL,
  `utilizado` tinyint(1) DEFAULT '0',
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `creado_en`, `actualizado_en`) VALUES
(1, 'superadmin', 'Acceso total a todo el sistema, incluyendo gestión de usuarios y configuraciones críticas', '2025-07-29 07:54:52', '2025-07-29 07:54:52'),
(2, 'admin', 'Acceso administrativo general: puede crear, editar y eliminar registros importantes', '2025-07-29 07:54:52', '2025-07-29 07:54:52'),
(3, 'moderador', 'Supervisa contenidos y usuarios, pero con acceso limitado a configuraciones', '2025-07-29 07:54:52', '2025-07-29 07:54:52'),
(4, 'editor', 'Puede crear y editar contenido, pero no tiene acceso a usuarios ni configuraciones', '2025-07-29 07:54:52', '2025-07-29 07:54:52'),
(5, 'usuario', 'Usuario estándar del sistema con permisos mínimos', '2025-07-29 07:54:52', '2025-07-29 07:54:52'),
(6, 'invitado', 'Acceso muy limitado, normalmente solo lectura', '2025-07-29 07:54:52', '2025-07-29 07:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  `asignado_en` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rol_usuario`
--

INSERT INTO `rol_usuario` (`id`, `usuario_id`, `rol_id`, `asignado_en`) VALUES
(1, 1, 2, '2025-07-29 07:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado_id` int NOT NULL,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`, `estado_id`, `creado_en`, `actualizado_en`) VALUES
(1, 'Admin', 'admin@example.com', 'admin', 1, '2025-07-29 07:54:36', '2025-07-29 07:54:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora_estados`
--
ALTER TABLE `bitacora_estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `bitacora_sesiones`
--
ALTER TABLE `bitacora_sesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `estado_id` (`estado_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora_estados`
--
ALTER TABLE `bitacora_estados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bitacora_sesiones`
--
ALTER TABLE `bitacora_sesiones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rol_usuario`
--
ALTER TABLE `rol_usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitacora_sesiones`
--
ALTER TABLE `bitacora_sesiones`
  ADD CONSTRAINT `bitacora_sesiones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  ADD CONSTRAINT `recuperar_contrasena_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `bitacora_estados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
