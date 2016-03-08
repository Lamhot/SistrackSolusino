/*
SQLyog Community v11.24 (32 bit)
MySQL - 5.6.20 : Database - file
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`file` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `file`;

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `Id` int(5) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(50) DEFAULT NULL,
  `Umur` int(5) DEFAULT NULL,
  `Lokasi` varchar(50) DEFAULT NULL,
  `pekerjaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

/*Data for the table `data` */

insert  into `data`(`Id`,`Nama`,`Umur`,`Lokasi`,`pekerjaan`) values (76,'Budi Wijaya',20,'Jakarta','Mahasiswa\r\n'),(77,'Rudi Wira',17,'Bandung','Karyawan\r\n'),(78,'Susi Dharma',34,'Bali','Ibu Rumah Tangga'),(79,'Budi Wijaya',20,'Jakarta','Mahasiswa\r\n'),(80,'Rudi Wira',17,'Bandung','Karyawan\r\n'),(81,'Susi Dharma',34,'Bali','Ibu Rumah Tangga');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
