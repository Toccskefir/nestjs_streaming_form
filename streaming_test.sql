-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 07. 08:38
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `streaming_test`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `musics`
--

CREATE TABLE `musics` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `artist` varchar(1000) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `length` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `musics`
--

INSERT INTO `musics` (`id`, `title`, `artist`, `length`) VALUES
(1, 'Get Down On It', 'Kool & The Gang', 213),
(2, 'Smooth Criminal', 'Michael Jackson', 258),
(3, 'Everything She Wants!', 'Wham!', 303),
(5, 'Stayin\' Alive', 'Bee Gees', 93),
(6, 'Billie Jean', 'Michael Jackson', 294),
(7, 'Beat It', 'Michael Jackson', 258),
(8, 'How Deep Is Your Love', 'Bee Gees', 245);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'TesztElek', '$2b$10$5I1ja44CGfMUbazTZZUhmuxyOz89l/izWgBHZfBeJGW3CicaAa7mC'),
(2, 'Gipsz Jakab', '$2b$10$.dnFfhbpsvx.mz97t3gq.eCriBUbIiju9Ix0jbbsFDrSuvOZqStTu');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `musics`
--
ALTER TABLE `musics`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `musics`
--
ALTER TABLE `musics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
