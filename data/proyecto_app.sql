-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2024 a las 06:40:26
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `comentario` varchar(2554) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `id_publicacion`, `comentario`, `created_at`, `updated_at`) VALUES
(1, 7, 6, 'hola', '2024-06-29 08:20:07', '2024-06-29 08:20:07'),
(2, 7, 6, 'comentario de prueba 2', '2024-06-29 08:21:59', '2024-06-29 08:21:59'),
(3, 7, 6, 'comentario de prueba 2', '2024-06-29 08:22:16', '2024-06-29 08:22:16'),
(4, 7, 6, 'hh', '2024-06-29 08:24:48', '2024-06-29 08:24:48'),
(5, 7, 6, 'hola', '2024-06-29 08:25:25', '2024-06-29 08:25:25'),
(6, 7, 5, 'primer comentario oscar', '2024-06-29 08:26:38', '2024-06-29 08:26:38'),
(7, 7, 4, 'hola', '2024-06-29 08:26:59', '2024-06-29 08:26:59'),
(8, 7, 6, 'jelou', '2024-06-29 08:27:48', '2024-06-29 08:27:48'),
(9, 7, 5, 'segundo comentario', '2024-06-29 08:38:03', '2024-06-29 08:38:03'),
(10, 9, 6, 'hola', '2024-06-29 08:45:14', '2024-06-29 08:45:14'),
(11, 9, 6, 'joihoiu', '2024-06-29 09:13:48', '2024-06-29 09:13:48'),
(12, 9, 4, 'esto es un comentario de prueba', '2024-06-29 09:14:54', '2024-06-29 09:14:54'),
(13, 9, 4, ':)', '2024-06-29 09:15:00', '2024-06-29 09:15:00'),
(14, 9, 8, 'jijij', '2024-06-29 09:55:58', '2024-06-29 09:55:58'),
(15, 9, 7, 'hola', '2024-06-30 09:25:33', '2024-06-30 09:25:33'),
(16, 9, 10, 'aja', '2024-06-30 09:30:52', '2024-06-30 09:30:52'),
(17, 9, 9, 'comentario en publicacion de prueba', '2024-06-30 09:32:46', '2024-06-30 09:32:46'),
(18, 10, 10, 'hola joselito', '2024-06-30 19:21:57', '2024-06-30 19:21:57'),
(19, 10, 9, 'holassssssssssss', '2024-06-30 19:22:18', '2024-06-30 19:22:18'),
(20, 10, 11, 'me gusta', '2024-06-30 19:22:50', '2024-06-30 19:22:50'),
(21, 10, 7, 'que carro mas chulo', '2024-06-30 19:23:10', '2024-06-30 19:23:10'),
(22, 10, 11, 'segundo comentario', '2024-06-30 19:23:53', '2024-06-30 19:23:53'),
(23, 9, 11, 'no puede ser', '2024-07-01 07:41:32', '2024-07-01 07:41:32'),
(24, 9, 9, 'no sabes que hacer?', '2024-07-01 07:43:36', '2024-07-01 07:43:36'),
(25, 11, 13, 'primer comentario', '2024-07-01 09:10:32', '2024-07-01 09:10:32'),
(26, 11, 13, '...', '2024-07-01 09:10:47', '2024-07-01 09:10:47'),
(27, 11, 11, 'llll', '2024-07-01 09:10:59', '2024-07-01 09:10:59'),
(28, 7, 21, 'me gusta', '2024-07-02 08:25:55', '2024-07-02 08:25:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL DEFAULT current_timestamp(),
  `fecha_fin` date NOT NULL DEFAULT current_timestamp(),
  `hora_fin` time NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `id_user`, `titulo`, `photo`, `descripcion`, `fecha_inicio`, `hora_inicio`, `fecha_fin`, `hora_fin`, `created_at`, `updated_at`) VALUES
(1, 7, 'totilo', '7_20240702035145.jpg', 'descripcion', '2024-07-10', '12:00:00', '2024-07-10', '14:00:00', '2024-07-02 07:51:45', '2024-07-02 07:51:45'),
(2, 7, 'nuevo evento', '7_20240702042653.jpeg', 'el mejor evento', '2024-07-10', '12:00:00', '2024-07-10', '15:00:00', '2024-07-02 08:26:53', '2024-07-02 08:26:53'),
(3, 7, 'Tecnologia', '7_20240702042819.jpeg', 'Evento de tecnologia', '2024-07-30', '12:00:00', '2024-08-01', '23:00:00', '2024-07-02 08:28:19', '2024-07-02 08:28:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `descripcion` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `created_at`, `updated_at`, `id_user`, `ruta_imagen`, `photo`, `descripcion`) VALUES
(4, '2024-06-29 06:32:03', '2024-06-29 06:32:03', 3, '', '3_20240629023203.png', 'esta es descripcion de prueba'),
(5, '2024-06-29 06:57:57', '2024-06-29 06:57:57', 3, 'uploads/3/3_20240629025757.png', '3_20240629025757.png', 'tyhtyhntymnunm6tu'),
(6, '2024-06-29 07:38:30', '2024-06-29 07:38:30', 7, 'uploads/7/7_20240629033830.jpg', '7_20240629033830.jpg', 'ythtyhtyhtyh'),
(7, '2024-06-29 09:52:08', '2024-06-29 09:52:08', 9, 'uploads/9/9_20240629055208.jpg', '9_20240629055208.jpg', 'ejemplo de descripcion'),
(8, '2024-06-29 09:52:32', '2024-06-29 09:52:32', 9, 'uploads/9/9_20240629055232.jpg', '9_20240629055232.jpg', 'ejemplo de descripcion'),
(9, '2024-06-30 09:26:52', '2024-06-30 09:26:52', 9, 'uploads/9/9_20240630052652.jpg', '9_20240630052652.jpg', 'hola'),
(10, '2024-06-30 09:30:40', '2024-06-30 09:30:40', 9, 'uploads/9/9_20240630053040.png', '9_20240630053040.png', 'hola'),
(11, '2024-06-30 19:22:39', '2024-06-30 19:22:39', 10, 'uploads/10/10_20240630152239.avif', '10_20240630152239.avif', 'es una imagen de estrellas'),
(12, '2024-06-30 20:00:50', '2024-06-30 20:00:50', 10, 'uploads/10/10_20240630160050.jpg', '10_20240630160050.jpg', '14256897'),
(13, '2024-07-01 09:10:17', '2024-07-01 09:10:17', 11, 'uploads/11/11_20240701051017.jpg', '11_20240701051017.jpg', 'descripcion de prueba'),
(14, '2024-07-02 06:51:24', '2024-07-02 06:51:24', 7, 'uploads/7/7_20240702025124.jpg', '7_20240702025124.jpg', 'pixel'),
(15, '2024-07-02 06:52:18', '2024-07-02 06:52:18', 7, 'uploads/7/7_20240702025218.jpg', '7_20240702025218.jpg', 'aja'),
(16, '2024-07-02 06:55:31', '2024-07-02 06:55:31', 7, 'uploads/7/7_20240702025531.jpg', '7_20240702025531.jpg', 'l'),
(17, '2024-07-02 06:55:51', '2024-07-02 06:55:51', 7, 'uploads/7/7_20240702025551.jpg', '7_20240702025551.jpg', 'l'),
(18, '2024-07-02 06:57:25', '2024-07-02 06:57:25', 7, 'uploads/7/7_20240702025725.jpg', '7_20240702025725.jpg', 'l'),
(19, '2024-07-02 06:58:24', '2024-07-02 06:58:24', 7, 'uploads/7/7_20240702025824.jpg', '7_20240702025824.jpg', 'tjtyjyj'),
(20, '2024-07-02 06:59:20', '2024-07-02 06:59:20', 7, 'uploads/7/7_20240702025920.jpg', '7_20240702025920.jpg', 'ghjgtyjytj'),
(21, '2024-07-02 08:25:45', '2024-07-02 08:25:45', 7, 'uploads/7/7_20240702042545.jpeg', '7_20240702042545.jpeg', 'robots');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_naci` date NOT NULL,
  `sexo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  `id_rol` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `apellidos`, `fecha_naci`, `sexo`, `cedula`, `id_rol`, `username`, `photo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'oscar', 'gonzalez@gmail.com', NULL, '12345678', NULL, '', '0000-00-00', '', 0, '0', '', NULL, '', '2024-06-26 07:54:29', '2024-06-26 07:54:29'),
(3, 'oscar', 'gonzalez2@gmail.com', NULL, '12345678', NULL, 'gonzalez', '2024-06-05', 'M', 0, '2', 'ogonza02', NULL, '', '2024-06-26 07:57:43', '2024-06-27 01:55:49'),
(4, 'omar', 'omar@gmail.com', NULL, '12345678', NULL, '', '0000-00-00', '', 0, '0', '', NULL, '', '2024-06-26 08:25:15', '2024-06-26 08:25:15'),
(5, 'omar', 'omar2@gmail.com', NULL, '12345678', NULL, '', '0000-00-00', '', 0, '0', '', NULL, '', '2024-06-26 08:29:04', '2024-06-26 08:29:04'),
(6, 'omar', 'omar3@gmail.com', NULL, '$2y$10$0FsSwgTjQav27QzoFH82gOLbfhmq6uLbIvycE2IDo7k5tekh9//5y', NULL, '', '0000-00-00', '', 0, '0', '', NULL, '', '2024-06-26 08:30:02', '2024-06-26 08:30:02'),
(7, 'oscar', 'gonzalez191901@gmail.com', NULL, '$2y$10$5LE29jf7YIcfPHrrVfXjd.erVIVwVMfYsWevDGQ9QZRVemYTEy8mi', NULL, 'gonzalez', '1997-08-31', 'M', NULL, 'artista', 'gonzalez191901', '7_20240702042525.jpeg', '', '2024-06-27 05:53:51', '2024-07-02 08:25:25'),
(9, 'jose', 'joselito@gmail.com', NULL, '$2y$10$IulAb8tEsoDq/JniLB5MJuOud30jpIJrwhzuF0aRViG4jeCXh01lO', NULL, 'martinez', '1940-08-31', 'M', NULL, 'usuario', 'joselito', '9_20240701033222.jpg', 'mi primera descripcion', '2024-06-29 08:44:54', '2024-07-01 09:04:29'),
(10, 'zahiher', 'zahiher@gmail.com', NULL, '$2y$10$kGA0ACDMeR7YEzK/IZsw6O5KD13TchD4/eejP3zu1ANCOG4R9tthG', NULL, 'gonzalez', '1999-10-14', 'F', NULL, 'usuario', 'zahi1313', NULL, '', '2024-06-30 19:21:25', '2024-06-30 19:21:25'),
(11, 'jose', 'joseperez@gmail.com', NULL, '$2y$10$vZMR9NdyrmScl8yWn2utqOjZLfdbs7/.o/nbWFK7uiMO5mOCYOAnS', NULL, 'perez', '1997-08-31', 'M', NULL, 'usuario', 'joseperez01', '11_20240701050923.jpg', 'descripcion de prueba 02', '2024-07-01 09:08:51', '2024-07-01 09:22:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_jobs_uuid_index` (`uuid`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
