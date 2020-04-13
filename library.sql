-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;

DROP TABLE IF EXISTS `Book`;
CREATE TABLE `Book` (
  `ISBN` varchar(767) NOT NULL,
  `Author` text,
  `Language` text,
  `Pages` int NOT NULL,
  `PublisherID` int DEFAULT NULL,
  `Title` text NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `IX_Book_PublisherID` (`PublisherID`),
  CONSTRAINT `FK_Book_Publisher_PublisherID` FOREIGN KEY (`PublisherID`) REFERENCES `Publisher` (`ID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Book` (`ISBN`, `Author`, `Language`, `Pages`, `PublisherID`, `Title`) VALUES
('978-0544003415',	'J.R.R. Tolkien',	'English',	1216,	1,	'The Lord of the Rings'),
('978-0547247762',	'Emma Donoghue',	'English',	416,	1,	'The Sealed Letter'),
('d41d8cd98f00b204e9800998ecf8427e',	'pepe la rana',	'spanish',	100,	1,	'Una Aventura Maravillosa');

DROP TABLE IF EXISTS `Publisher`;
CREATE TABLE `Publisher` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Publisher` (`ID`, `Name`) VALUES
(1,	'Mariner Books');

-- 2020-04-13 00:53:42