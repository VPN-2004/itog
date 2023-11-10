-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 10 2023 г., 09:56
-- Версия сервера: 8.0.30
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pfnynhar_m1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `catalogs`
--

CREATE TABLE `catalogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sostav` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `_lft`, `_rgt`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Спорт', 1, 8, NULL, NULL, NULL),
(2, 'Велоспорт', 2, 4, 1, NULL, NULL),
(3, 'Награждение', 3, 4, 1, NULL, NULL),
(4, 'Футбол', 4, 7, 1, NULL, NULL),
(5, 'Младший', 5, 6, 4, NULL, NULL),
(6, 'Взрослый', 6, 7, 4, NULL, NULL),
(7, 'Плавание', 7, 8, 1, NULL, NULL),
(8, 'Пример', 9, 10, NULL, NULL, NULL),
(9, 'Модели', 10, 16, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `user_id`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'images/1699444641Без названия.jpg', '2023-11-08 08:57:21', '2023-11-08 08:57:21'),
(2, 1, 8, 'images/1699510748Subdiv5.png', '2023-11-09 03:19:08', '2023-11-09 03:19:08'),
(3, 1, 6, 'images/1699519831Penguins.jpg', '2023-11-09 05:50:31', '2023-11-09 05:50:31'),
(4, 1, 1, 'images/1699520757Koala.jpg', '2023-11-09 06:05:58', '2023-11-09 06:05:58'),
(5, 1, 8, 'images/1699521454Lighthouse.jpg', '2023-11-09 06:17:34', '2023-11-09 06:17:34'),
(6, 1, 7, 'images/1699521726Jellyfish.jpg', '2023-11-09 06:22:06', '2023-11-09 06:22:06'),
(7, 1, 5, 'images/1699521958Hydrangeas.jpg', '2023-11-09 06:25:58', '2023-11-09 06:25:58');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `custom_class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `url`, `order`, `custom_class`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '/admin', 1, NULL, '2023-11-07 07:12:45', '2023-11-07 07:12:45'),
(2, 'MenuUser', 'menuuser', NULL, 2, NULL, '2023-11-07 07:17:41', '2023-11-07 07:17:41'),
(4, 'MenuPolsov', 'menupolsov', NULL, 3, NULL, '2023-11-07 08:31:22', '2023-11-07 08:31:22'),
(5, 'Guest', 'guest', NULL, 4, NULL, '2023-11-08 00:17:43', '2023-11-08 00:17:43'),
(9, 'Admin-Panel', 'admin-panel', NULL, 5, NULL, '2023-11-08 08:29:21', '2023-11-08 08:29:21');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `route` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleware` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `slug`, `url`, `target`, `parent_id`, `order`, `route`, `params`, `controller`, `middleware`, `icon`, `custom_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'Menu Builder', 'menu-builder', '/admin/menus', '_self', NULL, 1, NULL, NULL, '\\CodexShaper\\Menu\\Http\\Controllers\\MenuController@index', NULL, NULL, NULL, '2023-11-07 07:12:45', '2023-11-07 07:12:45'),
(2, 2, 'О нас', 'o-nas', '/about', '_self', NULL, 1, 'about', '{}', '\\CodexShaper\\Menu\\Http\\Controllers\\MainController@about', NULL, NULL, NULL, '2023-11-07 07:20:22', '2023-11-08 06:22:48'),
(3, 2, 'Галерея', 'galereya', '/gallery', '_self', NULL, 2, NULL, '{}', '\\app\\Http\\Controllers\\MainController@catalog', NULL, NULL, NULL, '2023-11-07 07:21:19', '2023-11-08 06:22:48'),
(4, 2, 'Новости', 'novosti', NULL, '_self', NULL, 3, 'news.index', '{}', NULL, NULL, NULL, NULL, '2023-11-07 07:24:01', '2023-11-08 06:43:56'),
(9, 4, 'Профиль', 'profil', NULL, '_self', NULL, 1, 'profile', '{}', '\\CodexShaper\\Menu\\Http\\Controllers\\MenuController@profile', NULL, NULL, NULL, '2023-11-07 08:31:37', '2023-11-08 06:23:42'),
(11, 4, 'Выйти', 'vyiti', NULL, '_self', NULL, 2, 'logout', '{}', NULL, NULL, NULL, NULL, '2023-11-07 08:32:19', '2023-11-08 08:00:50'),
(12, 5, 'Регистрация', 'registraciya', NULL, '_self', NULL, 5, 'register', '{}', NULL, NULL, NULL, NULL, '2023-11-08 00:20:34', '2023-11-08 00:20:34'),
(13, 5, 'Войти', 'voiti', NULL, '_self', NULL, 6, 'login', '{}', NULL, NULL, NULL, NULL, '2023-11-08 00:20:47', '2023-11-08 00:20:47'),
(19, 9, 'Админ', 'admin', NULL, '_self', NULL, 7, 'admin', '{}', NULL, NULL, NULL, NULL, '2023-11-08 08:29:38', '2023-11-08 08:29:38');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_settings`
--

CREATE TABLE `menu_settings` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int DEFAULT NULL,
  `depth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '5',
  `apply_child_as_parent` tinyint(1) NOT NULL DEFAULT '0',
  `levels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_settings`
--

INSERT INTO `menu_settings` (`id`, `menu_id`, `depth`, `apply_child_as_parent`, `levels`, `created_at`, `updated_at`) VALUES
(1, NULL, '5', 0, '{\"root\":{\"style\":\"vertical\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-07 07:12:45', '2023-11-07 07:12:45'),
(2, 2, '5', 0, '{\"root\":{\"style\":\"horizontal\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-07 07:44:07', '2023-11-07 07:44:21'),
(3, 3, '5', 0, '{\"root\":{\"style\":\"horizontal\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-07 07:58:35', '2023-11-07 07:58:35'),
(4, 5, '1', 0, '{\"margin\":\"3px\",\"root\":{\"style\":\"horizontal\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-08 00:29:05', '2023-11-08 00:43:57'),
(5, 4, '5', 0, '{\"root\":{\"style\":\"horizontal\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-08 01:02:44', '2023-11-08 01:02:44'),
(6, 9, '5', 0, '{\"root\":{\"style\":\"horizontal\"},\"child\":{\"show\":\"onClick\",\"position\":\"right\",\"level_1\":{\"show\":\"onClick\",\"position\":\"bottom\"},\"level_2\":{\"show\":\"onHover\",\"position\":\"right\"}}}', '2023-11-08 08:31:36', '2023-11-08 08:31:36');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_15_051118_create_catalogs_table', 1),
(6, '2019_08_22_221932_create_menus_table', 2),
(7, '2019_08_27_165403_create_menu_items_table', 2),
(8, '2019_08_27_165403_create_menu_settings_table', 2),
(10, '2023_11_08_045832_create_images_table', 3),
(11, '2023_11_08_090224_create_news_table', 4),
(12, '2023_11_09_042903_create_categories_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `tipe`, `content`, `fullcontent`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Почему Go — оптимальный язык для новичка в IT?', 'Новое', 'Эксперты Яндекс Практикума советуют начинать изучать программирование с языка Go. Аргументов масса: Go входит в десятку самых востребованных языков на рынке, применяется во многих сферах бизнеса, а спрос на Go-разработчиков растёт каждый год. Но главное — Go прост в изучении.', NULL, '2023-10-07', '2023-11-01 12:03:57', '2023-11-02 12:03:57'),
(2, 'Microsoft интегрировала поддержку языка программирования Python в Excelфырфы', 'Рекомендуемое', 'Microsoft добавила поддержку языка программирования Python в Excel. Сегодня стала доступна предварительная версия этой функции, которая позволяет пользователям табличного процессора управлять данными и анализировать их с помощью инструкций Python и Power Query, надстройки Excel, обеспечивающей обнаружение, доступ и совместное использование данных для бизнес-аналитики.ывфа', 'фывафыв', '2023-08-22', '2023-11-22 12:46:27', '2023-11-10 03:42:27'),
(4, 'Полный', 'sdf', 'Факты привличения', 'Вся полная информация', '2023-11-16', '2023-11-10 03:54:12', '2023-11-10 03:54:57');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAdmin` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`) VALUES
(1, 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', NULL, '$2y$10$3YmMEN1HnxVO2iJvztyQUekfVcZ5hsQ0Y.9qjH9aOiak2kb/nIs2C', NULL, '2023-11-07 07:07:39', '2023-11-07 07:07:39', 1),
(2, 'Test', 'Test', 'Test', 'Test', 'Test', NULL, '$2y$10$wWwqVjFVTxZEMfi4ijBpne86TQ1aotNr/0WdS2YEGx7wbiSDFoLOS', NULL, '2023-11-08 07:46:14', '2023-11-08 07:46:14', NULL),
(3, 'Menu', 'dsa', 'das', 'user1', 'user1', NULL, '$2y$10$7/Hvox3G2Os8Y/HEdX3gW.6NBCxh2z3FaBnXZv02yLEydAABxcYJm', NULL, '2023-11-09 06:43:22', '2023-11-09 06:43:22', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_settings`
--
ALTER TABLE `menu_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `menu_settings`
--
ALTER TABLE `menu_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
