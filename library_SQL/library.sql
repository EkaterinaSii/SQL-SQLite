-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AllBookInfos`
--

DROP TABLE IF EXISTS `AllBookInfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AllBookInfos` (
  `AllBookInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `BookID` int(11) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `GenreID` int(11) NOT NULL,
  `PublisherID` int(11) NOT NULL,
  PRIMARY KEY (`AllBookInfoID`),
  KEY `BookID` (`BookID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `GenreID` (`GenreID`),
  KEY `PublisherID` (`PublisherID`),
  CONSTRAINT `AllBookInfos_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
  CONSTRAINT `AllBookInfos_ibfk_2` FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`),
  CONSTRAINT `AllBookInfos_ibfk_3` FOREIGN KEY (`GenreID`) REFERENCES `Genres` (`GenreID`),
  CONSTRAINT `AllBookInfos_ibfk_4` FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AllBookInfos`
--

LOCK TABLES `AllBookInfos` WRITE;
/*!40000 ALTER TABLE `AllBookInfos` DISABLE KEYS */;
INSERT INTO `AllBookInfos` VALUES (1,1,1,1,2),(2,2,1,1,3),(3,3,3,3,1),(4,4,2,4,5),(5,5,4,5,4);
/*!40000 ALTER TABLE `AllBookInfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `LastName` varchar(70) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Mikhail','Bulgakov','Soviet Union'),(2,'Nelle Harper','Lee','United States'),(3,'Hye-young','Pyun','South Korea'),(4,'Richard','Osman','United Kingdom'),(5,'Nikolai','Gogol','Russian Empire');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `YearPublished` year(4) NOT NULL,
  `Pages` smallint(6) NOT NULL,
  `Language` varchar(30) NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1,'The Master and Margarita',1967,448,'Russian'),(2,'A Dog\'s Hert',1925,176,'Russian'),(3,'The Hole',2017,208,'Korean'),(4,'To Kill a Mockingbird',1960,384,'English'),(5,'The Thursday Murder Club',2020,382,'English');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryToOtherLibraries`
--

DROP TABLE IF EXISTS `DeliveryToOtherLibraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeliveryToOtherLibraries` (
  `DeliveryToOtherLibrariesID` int(11) NOT NULL AUTO_INCREMENT,
  `LibraryID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `DeliveryDate` date NOT NULL,
  `WorkerID` int(11) NOT NULL,
  PRIMARY KEY (`DeliveryToOtherLibrariesID`),
  KEY `LibraryID` (`LibraryID`),
  KEY `BookID` (`BookID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `DeliveryToOtherLibraries_ibfk_1` FOREIGN KEY (`LibraryID`) REFERENCES `Libraries` (`LibraryID`),
  CONSTRAINT `DeliveryToOtherLibraries_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
  CONSTRAINT `DeliveryToOtherLibraries_ibfk_3` FOREIGN KEY (`WorkerID`) REFERENCES `Workers` (`WorkerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryToOtherLibraries`
--

LOCK TABLES `DeliveryToOtherLibraries` WRITE;
/*!40000 ALTER TABLE `DeliveryToOtherLibraries` DISABLE KEYS */;
INSERT INTO `DeliveryToOtherLibraries` VALUES (1,2,1,'2022-08-13',2),(2,2,2,'2022-09-04',2),(3,4,4,'2022-10-22',1),(4,3,5,'2022-11-17',5),(5,6,3,'2022-09-20',4);
/*!40000 ALTER TABLE `DeliveryToOtherLibraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genres` (
  `GenreID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`GenreID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (1,'Satire','Satire is a genre of the visual, literary, and performing arts, usually in the form of fiction and less frequently non-fiction, in which vices, follies, abuses, and shortcomings are held up to ridicule, often with the intent of shaming or exposing the perceived flaws of individuals, corporations, government, or society itself into improvement.'),(2,'Romance novel','A romance novel or romantic novel generally refers to a type of genre fiction novel which places its primary focus on the relationship and romantic love between two people, and usually has an emotionally satisfying and optimistic ending'),(3,'Crime fiction','Crime fiction, detective story, murder mystery, mystery novel, and police novel are terms used to describe narratives that centre on criminal acts and especially on the investigation, either by an amateur or a professional detective, of a crime, often a murder.'),(4,'Southern Gothic','Southern Gothic is an artistic subgenre of fiction, country music, film and television that are heavily influenced by Gothic elements and the American South. Common themes of Southern Gothic include storytelling of deeply flawed, disturbing or eccentric characters who may be involved in hoodoo,[1] decayed or derelict settings,[2] grotesque situations, and other sinister events relating to or stemming from poverty, alienation, crime, or violence.'),(5,'Psychological thriller','Psychological thriller is a genre combining the thriller and psychological fiction genres. It is commonly used to describe literature or films that deal with psychological narratives in a thriller or thrilling setting.');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libraries`
--

DROP TABLE IF EXISTS `Libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Libraries` (
  `LibraryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LibraryID`),
  KEY `ManagerID` (`ManagerID`),
  CONSTRAINT `Libraries_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `Workers` (`WorkerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libraries`
--

LOCK TABLES `Libraries` WRITE;
/*!40000 ALTER TABLE `Libraries` DISABLE KEYS */;
INSERT INTO `Libraries` VALUES (1,'Main Cats Library','Cats street 8','Cats','+358-63-782-69',NULL),(2,'Good city\'s main library','Good street 23','Good','+358-93-651-459',1),(3,'Small cats library','Kitty street 2','Cats','+358-96-845-562',NULL),(4,'Wow city\'s main library','Wow street 34','Wow','+358-63-514-781',4),(5,'Good city\'s second library','Ok street 23','Good','+358-30-226-789',2);
/*!40000 ALTER TABLE `Libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loans`
--

DROP TABLE IF EXISTS `Loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Loans` (
  `LoanID` int(11) NOT NULL AUTO_INCREMENT,
  `VisitorID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `BorrowedAt` date NOT NULL,
  `ReturnDay` date NOT NULL,
  `RenewTimes` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`LoanID`),
  KEY `VisitorID` (`VisitorID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `Loans_ibfk_1` FOREIGN KEY (`VisitorID`) REFERENCES `Visitors` (`VisitorID`),
  CONSTRAINT `Loans_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loans`
--

LOCK TABLES `Loans` WRITE;
/*!40000 ALTER TABLE `Loans` DISABLE KEYS */;
INSERT INTO `Loans` VALUES (1,2,5,'2022-11-15','2022-11-30',2),(2,3,4,'2022-09-01','2022-09-30',3),(3,1,1,'2022-10-05','2022-10-15',0),(4,1,5,'2022-11-02','2022-11-09',0),(5,3,3,'2022-11-30','2022-12-10',0);
/*!40000 ALTER TABLE `Loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewBookDeliveries`
--

DROP TABLE IF EXISTS `NewBookDeliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewBookDeliveries` (
  `NewBookDeliveriesID` int(11) NOT NULL AUTO_INCREMENT,
  `Day` date NOT NULL,
  `BookID` int(11) NOT NULL,
  `WorkerID` int(11) NOT NULL,
  PRIMARY KEY (`NewBookDeliveriesID`),
  KEY `BookID` (`BookID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `NewBookDeliveries_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
  CONSTRAINT `NewBookDeliveries_ibfk_2` FOREIGN KEY (`WorkerID`) REFERENCES `Workers` (`WorkerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewBookDeliveries`
--

LOCK TABLES `NewBookDeliveries` WRITE;
/*!40000 ALTER TABLE `NewBookDeliveries` DISABLE KEYS */;
INSERT INTO `NewBookDeliveries` VALUES (1,'2022-11-22',2,4),(2,'2022-11-22',5,4),(3,'2022-10-16',1,2),(4,'2022-10-16',3,2),(5,'2022-10-16',4,2);
/*!40000 ALTER TABLE `NewBookDeliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payments` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `BankNo` varchar(50) NOT NULL,
  `Amount` decimal(5,2) NOT NULL,
  `PayedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,'FI0000000000',23.60,'2022-05-03 08:14:10'),(2,'FI1111111111',16.30,'2022-04-15 19:12:59'),(3,'FI2222222222',5.00,'2022-11-27 02:05:05'),(4,'FI3333333333',0.60,'2022-10-12 12:16:03'),(5,'FI4444444444',5.60,'2022-09-14 03:15:46');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentsLoans`
--

DROP TABLE IF EXISTS `PaymentsLoans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentsLoans` (
  `PaymentsLoansID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentID` int(11) NOT NULL,
  `LoanID` int(11) NOT NULL,
  `Reason` varchar(300) NOT NULL,
  PRIMARY KEY (`PaymentsLoansID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `LoanID` (`LoanID`),
  CONSTRAINT `PaymentsLoans_ibfk_2` FOREIGN KEY (`PaymentID`) REFERENCES `Payments` (`PaymentID`),
  CONSTRAINT `PaymentsLoans_ibfk_3` FOREIGN KEY (`LoanID`) REFERENCES `Loans` (`LoanID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentsLoans`
--

LOCK TABLES `PaymentsLoans` WRITE;
/*!40000 ALTER TABLE `PaymentsLoans` DISABLE KEYS */;
INSERT INTO `PaymentsLoans` VALUES (1,3,4,'Late return'),(2,1,6,'Loss of the book'),(3,2,3,'Damaged book'),(4,4,5,'Late return'),(5,5,2,'Late return');
/*!40000 ALTER TABLE `PaymentsLoans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publishers` (
  `PublisherID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `StartedCooperateAT` date NOT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
INSERT INTO `Publishers` VALUES (1,'Alma Classics','alma.classics@gmail.com','+358-00-000-000','2018-06-18'),(2,'Grove Atlantic','grove.atlantic@gmail.com','+358-11-111-111','2020-03-22'),(3,'Cats Publisher','cats@gmail.com','+358-22-222-222','1956-07-07'),(4,'Meow meow publications','meow.meow@cats.com','+358-33-333-333','1997-12-24'),(5,'Soho Teen','soho.teen@gmail.com','+358-44-444-444','2022-11-29');
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitors`
--

DROP TABLE IF EXISTS `Visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visitors` (
  `VisitorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `LastName` varchar(70) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `RegisteredAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`VisitorID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitors`
--

LOCK TABLES `Visitors` WRITE;
/*!40000 ALTER TABLE `Visitors` DISABLE KEYS */;
INSERT INTO `Visitors` VALUES (1,'Keith','Massey','kmassey@cat.com','+358-99-999-999','Nice street 19, Nice city, Nice country','2015-06-23 19:01:15'),(2,'Peter','Frank','pfrank@cat.com','+358-88-888-888','Cool street 23, Cool city, Cool country','2006-03-09 07:59:59'),(3,'Mr. Whiskers','Meow','meow.meow@cats.com','+358-77-777-777','Cat street 13, Cat city, Cat country','1997-12-24 20:59:59'),(4,'Christopher','Chan','chris.chan@cats.com','+358-66-666-666','Best street 7, Best city, Best country','1980-05-30 02:56:23'),(5,'Yong-Guk','Bang','tiger@tiger.com','+358-55-555-554','Best street 7, Best city, Best country','2016-12-13 18:36:42');
/*!40000 ALTER TABLE `Visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workers`
--

DROP TABLE IF EXISTS `Workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Workers` (
  `WorkerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `LastName` varchar(70) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `HiredAt` date NOT NULL,
  PRIMARY KEY (`WorkerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workers`
--

LOCK TABLES `Workers` WRITE;
/*!40000 ALTER TABLE `Workers` DISABLE KEYS */;
INSERT INTO `Workers` VALUES (1,'Elaine','Abbott','eabbot@lib.fi','+358-12-345-698','Ok street 57, Good city, Good country','1990-07-15'),(2,'Clyde','Benson','clydeb@lib.fi','+358-31-763-956','Nice street 23, Good city, Good country','2015-09-26'),(3,'Damon','Graham','dgraham@lib.fi','+358-64-634-320','Wow street 78, Wow city, Good country','2020-12-25'),(4,'Luna','Desiree','lunad@lib.fi','+358-63-534-634','Cats street 34, Wow city, Good country','2019-02-12'),(5,'Dennis','Tucker','denist@lib.fi','+358-61-617-562','Hmmm street 2, Hmmm city, Good country','2000-01-01');
/*!40000 ALTER TABLE `Workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 20:32:26
