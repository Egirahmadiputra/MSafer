/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - money_safer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`money_safer` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `money_safer`;

/*Table structure for table `balance` */

DROP TABLE IF EXISTS `balance`;

CREATE TABLE `balance` (
  `saldo` int(11) DEFAULT NULL,
  `pemasukan` int(11) DEFAULT NULL,
  `pengeluaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `balance` */

insert  into `balance`(`saldo`,`pemasukan`,`pengeluaran`) values 
(1250000,1500000,250000);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` char(20) DEFAULT NULL,
  `password` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`username`,`password`) values 
('mrmoney','12345');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
