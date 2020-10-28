CREATE DATABASE  IF NOT EXISTS `urban`;
USE `urban`;

DROP TABLE IF EXISTS `purchased_travel_documents`;
CREATE TABLE `purchased_travel_documents` (
  `code` varchar(20) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `purchaseDate` varchar(45) DEFAULT NULL,
  `tripsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
);

DROP TABLE IF EXISTS `passes`;
CREATE TABLE `passes` (
  `id` varchar(20) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `expirationDate` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `purchased_travel_documents` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `activated_tickets`;
CREATE TABLE `activated_tickets` (
  `id` varchar(20) NOT NULL,
  `expirationDate` varchar(45) DEFAULT NULL,
  `leftTripsNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `inspectors`;
CREATE TABLE `inspectors` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
);