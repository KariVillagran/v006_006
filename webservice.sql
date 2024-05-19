-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2024 a las 22:53:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webservice`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('95161d9bd3ebd633d0b748bfe5f0c8d3b4e49c31', '2024-05-13 02:25:31.986220', 2),
('9a80a4c828e60cdc509bca4c15a20c5601e17e64', '2024-05-13 16:40:51.914389', 4),
('bf780afca258cf8d2b012657d8c926ba35f801b3', '2024-05-13 16:44:20.465155', 5),
('c32a0e72924fbe3dff0ae0e0067c651e7fc48846', '2024-05-13 02:48:39.746164', 3),
('fd5937b83a7ae25baf41b0058694622a5ec8094f', '2024-05-13 02:23:23.925033', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add Token', 8, 'add_tokenproxy'),
(30, 'Can change Token', 8, 'change_tokenproxy'),
(31, 'Can delete Token', 8, 'delete_tokenproxy'),
(32, 'Can view Token', 8, 'view_tokenproxy'),
(33, 'Can add item carrito', 9, 'add_itemcarrito'),
(34, 'Can change item carrito', 9, 'change_itemcarrito'),
(35, 'Can delete item carrito', 9, 'delete_itemcarrito'),
(36, 'Can view item carrito', 9, 'view_itemcarrito'),
(37, 'Can add cliente', 10, 'add_cliente'),
(38, 'Can change cliente', 10, 'change_cliente'),
(39, 'Can delete cliente', 10, 'delete_cliente'),
(40, 'Can view cliente', 10, 'view_cliente'),
(41, 'Can add categoria producto', 11, 'add_categoriaproducto'),
(42, 'Can change categoria producto', 11, 'change_categoriaproducto'),
(43, 'Can delete categoria producto', 11, 'delete_categoriaproducto'),
(44, 'Can view categoria producto', 11, 'view_categoriaproducto'),
(45, 'Can add carrito', 12, 'add_carrito'),
(46, 'Can change carrito', 12, 'change_carrito'),
(47, 'Can delete carrito', 12, 'delete_carrito'),
(48, 'Can view carrito', 12, 'view_carrito'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$JzA0jkuNsAuU7zDjGNGyyA$7Hx7tHS5NMIuvIoqvBdv7AlrmzNfBMFdPGycEPhViUw=', NULL, 0, 'erenmati', '', '', '', 0, 1, '2024-05-13 02:23:23.521458'),
(2, 'pbkdf2_sha256$720000$GecJCiFNyx78Xger76P20k$2A/qAh39xehKIMXg7xDPAWvwJT8giLN/SUUyt5GdU9o=', NULL, 0, 'setzler45', '', '', '', 0, 1, '2024-05-13 02:25:31.592785'),
(3, 'pbkdf2_sha256$720000$it6YYjkknUSshjyfzxDzqt$dJk11YjnOI3g1Bkff3vvOI1u2uepX7tI1tB4JPA6ixI=', NULL, 0, 'cooler_cl', '', '', '', 0, 1, '2024-05-13 02:48:39.347544'),
(4, 'pbkdf2_sha256$720000$bOhPmb1hWh9IeEukb0KXBe$e5+682qpr2Bzwkp+V6KuTdVzAsu7ouAV0Y8r6chuDRE=', NULL, 0, 'cooler_cl98', '', '', '', 0, 1, '2024-05-13 16:40:51.489927'),
(5, 'pbkdf2_sha256$720000$YYnfTxBJrjc0H5nkNph6G9$ORhQSjOh+hwUMIVSwZpAfg9EE4PPBMrPqe75hjxr2Lo=', NULL, 0, 'cooler_cl988', '', '', '', 0, 1, '2024-05-13 16:44:20.062933');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_carrito`
--

CREATE TABLE `db_carrito` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `db_carrito`
--

INSERT INTO `db_carrito` (`id`, `cliente_id`) VALUES
(7, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_categoria`
--

CREATE TABLE `db_categoria` (
  `id` bigint(20) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `db_categoria`
--

INSERT INTO `db_categoria` (`id`, `categoria`) VALUES
(2, 'Herramientas'),
(3, 'Tornillos'),
(5, 'Taladros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_cliente`
--

CREATE TABLE `db_cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `create_at` date NOT NULL,
  `update_at` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `db_cliente`
--

INSERT INTO `db_cliente` (`id`, `nombre`, `email`, `direccion`, `create_at`, `update_at`, `user_id`) VALUES
(1, 'erenmati', '', NULL, '2024-05-12', '2024-05-12', 1),
(2, 'setzler45', '', NULL, '2024-05-12', '2024-05-12', 2),
(3, 'cooler_cl', '', NULL, '2024-05-12', '2024-05-12', 3),
(4, 'cooler_cl98', '', NULL, '2024-05-13', '2024-05-13', 4),
(5, 'cooler_cl988', '', NULL, '2024-05-13', '2024-05-13', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_item_carrito`
--

CREATE TABLE `db_item_carrito` (
  `id` bigint(20) NOT NULL,
  `cant` int(11) DEFAULT NULL,
  `carrito_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `db_item_carrito`
--

INSERT INTO `db_item_carrito` (`id`, `cant`, `carrito_id`, `producto_id`) VALUES
(3, 5, 4, 1),
(4, 5, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(12, 'api', 'carrito'),
(11, 'api', 'categoriaproducto'),
(10, 'api', 'cliente'),
(9, 'api', 'itemcarrito'),
(13, 'api', 'producto'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-13 02:22:32.893040'),
(2, 'auth', '0001_initial', '2024-05-13 02:22:33.441337'),
(3, 'admin', '0001_initial', '2024-05-13 02:22:33.547677'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-13 02:22:33.554679'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-13 02:22:33.562681'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-13 02:22:33.618262'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-13 02:22:33.669464'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-05-13 02:22:33.682467'),
(9, 'auth', '0004_alter_user_username_opts', '2024-05-13 02:22:33.690468'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-05-13 02:22:33.734507'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-05-13 02:22:33.736507'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-13 02:22:33.743508'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-05-13 02:22:33.757141'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-13 02:22:33.769516'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-05-13 02:22:33.782518'),
(16, 'auth', '0011_update_proxy_permissions', '2024-05-13 02:22:33.791521'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-13 02:22:33.805529'),
(18, 'authtoken', '0001_initial', '2024-05-13 02:22:33.878067'),
(19, 'authtoken', '0002_auto_20160226_1747', '2024-05-13 02:22:33.901073'),
(20, 'authtoken', '0003_tokenproxy', '2024-05-13 02:22:33.904074'),
(21, 'authtoken', '0004_alter_tokenproxy_options', '2024-05-13 02:22:33.909074'),
(22, 'sessions', '0001_initial', '2024-05-13 02:22:33.948084'),
(23, 'api', '0001_initial', '2024-05-13 02:22:44.835567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre_producto`, `precio`, `cantidad`, `descripcion`, `create_at`, `update_at`) VALUES
(1, 'Martillo', 5000, 5, 'Pega muy fuerte', '2024-05-13 15:51:44.961998', '2024-05-13 16:01:07.007232'),
(2, 'Tornillo grande', 2000, 15, 'Tornillo grande para construcciones grandes', '2024-05-13 15:52:36.046723', '2024-05-13 15:52:36.046723'),
(3, 'Tornillo grande', 2000, 15, 'Tornillo grande para construcciones grandes', '2024-05-13 15:52:58.529808', '2024-05-13 15:52:58.529808');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

CREATE TABLE `producto_categoria` (
  `id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `categoriaproducto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`id`, `producto_id`, `categoriaproducto_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_carrito_cliente_id_8b7922d4_fk_db_cliente_id` (`cliente_id`);

--
-- Indices de la tabla `db_categoria`
--
ALTER TABLE `db_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `db_cliente`
--
ALTER TABLE `db_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_cliente_user_id_d70d65b6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `db_item_carrito`
--
ALTER TABLE `db_item_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_item_carrito_carrito_id_445a1f58_fk_db_carrito_id` (`carrito_id`),
  ADD KEY `db_item_carrito_producto_id_44361e86_fk_Producto_id` (`producto_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Producto_categoria_producto_id_categoriapro_78ec5658_uniq` (`producto_id`,`categoriaproducto_id`),
  ADD KEY `Producto_categoria_categoriaproducto_id_b1d95ec8_fk_db_catego` (`categoriaproducto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `db_categoria`
--
ALTER TABLE `db_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `db_cliente`
--
ALTER TABLE `db_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `db_item_carrito`
--
ALTER TABLE `db_item_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  ADD CONSTRAINT `db_carrito_cliente_id_8b7922d4_fk_db_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `db_cliente` (`id`);

--
-- Filtros para la tabla `db_cliente`
--
ALTER TABLE `db_cliente`
  ADD CONSTRAINT `db_cliente_user_id_d70d65b6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `db_item_carrito`
--
ALTER TABLE `db_item_carrito`
  ADD CONSTRAINT `db_item_carrito_carrito_id_445a1f58_fk_db_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `db_carrito` (`id`),
  ADD CONSTRAINT `db_item_carrito_producto_id_44361e86_fk_Producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD CONSTRAINT `Producto_categoria_categoriaproducto_id_b1d95ec8_fk_db_catego` FOREIGN KEY (`categoriaproducto_id`) REFERENCES `db_categoria` (`id`),
  ADD CONSTRAINT `Producto_categoria_producto_id_d0df3b1c_fk_Producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
