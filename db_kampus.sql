/*
SQLyog Community v11.24 (32 bit)
MySQL - 5.6.20 : Database - db_kampus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_kampus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_kampus`;

/*Table structure for table `dosen_mk` */

DROP TABLE IF EXISTS `dosen_mk`;

CREATE TABLE `dosen_mk` (
  `id_dosen_mk` int(10) NOT NULL AUTO_INCREMENT,
  `id_dosen` varchar(10) NOT NULL,
  `id_mk` varchar(10) NOT NULL,
  PRIMARY KEY (`id_dosen_mk`),
  KEY `id_dosen_cons` (`id_dosen`),
  KEY `id_mk_cons` (`id_mk`),
  CONSTRAINT `id_dosen_cons` FOREIGN KEY (`id_dosen`) REFERENCES `t_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_mk_cons` FOREIGN KEY (`id_mk`) REFERENCES `t_mata_kuliah` (`id_mata_kuliah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `dosen_mk` */

insert  into `dosen_mk`(`id_dosen_mk`,`id_dosen`,`id_mk`) values (1,'11112044','if1111200');

/*Table structure for table `kelas_jadwal` */

DROP TABLE IF EXISTS `kelas_jadwal`;

CREATE TABLE `kelas_jadwal` (
  `id_kelas_jadwal` int(10) NOT NULL AUTO_INCREMENT,
  `id_kelas` int(10) NOT NULL,
  `id_jadwal` int(10) NOT NULL,
  PRIMARY KEY (`id_kelas_jadwal`),
  KEY `cons_id_kelas` (`id_kelas`),
  KEY `cons_id_jadwal` (`id_jadwal`),
  CONSTRAINT `cons_id_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `t_jadwal` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cons_id_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `t_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `kelas_jadwal` */

insert  into `kelas_jadwal`(`id_kelas_jadwal`,`id_kelas`,`id_jadwal`) values (4,2,2);

/*Table structure for table `t_dosen` */

DROP TABLE IF EXISTS `t_dosen`;

CREATE TABLE `t_dosen` (
  `id_dosen` varchar(10) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_dosen` */

insert  into `t_dosen`(`id_dosen`,`nama_dosen`) values ('11112044','Lamhot JM Siagian');

/*Table structure for table `t_jadwal` */

DROP TABLE IF EXISTS `t_jadwal`;

CREATE TABLE `t_jadwal` (
  `id_jadwal` int(10) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(10) NOT NULL,
  `date` date NOT NULL,
  `star_time` time NOT NULL,
  `end_time` time NOT NULL,
  `id_dosen_mk` int(10) NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `cons_id_lokasi` (`id_lokasi`),
  KEY `cons_id_dosen_mk` (`id_dosen_mk`),
  CONSTRAINT `cons_id_dosen_mk` FOREIGN KEY (`id_dosen_mk`) REFERENCES `dosen_mk` (`id_dosen_mk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cons_id_lokasi` FOREIGN KEY (`id_lokasi`) REFERENCES `t_lokasi` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_jadwal` */

insert  into `t_jadwal`(`id_jadwal`,`id_lokasi`,`date`,`star_time`,`end_time`,`id_dosen_mk`) values (2,2,'2015-07-27','07:00:00','08:00:00',1);

/*Table structure for table `t_kelas` */

DROP TABLE IF EXISTS `t_kelas`;

CREATE TABLE `t_kelas` (
  `id_kelas` int(10) NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_kelas` */

insert  into `t_kelas`(`id_kelas`,`nama_kelas`) values (1,'D3-TI02'),(2,'SI 02'),(3,'TI 01');

/*Table structure for table `t_lokasi` */

DROP TABLE IF EXISTS `t_lokasi`;

CREATE TABLE `t_lokasi` (
  `id_lokasi` int(10) NOT NULL AUTO_INCREMENT,
  `nama_lokasi` varchar(100) NOT NULL,
  PRIMARY KEY (`id_lokasi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_lokasi` */

insert  into `t_lokasi`(`id_lokasi`,`nama_lokasi`) values (1,'GD 523'),(2,'Auditorium');

/*Table structure for table `t_mata_kuliah` */

DROP TABLE IF EXISTS `t_mata_kuliah`;

CREATE TABLE `t_mata_kuliah` (
  `id_mata_kuliah` varchar(10) NOT NULL,
  `nama_mata_kuliah` varchar(100) NOT NULL,
  PRIMARY KEY (`id_mata_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_mata_kuliah` */

insert  into `t_mata_kuliah`(`id_mata_kuliah`,`nama_mata_kuliah`) values ('if1111200','Basic Programming'),('if4444444','Database Management');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
