-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 06:30 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ADMINID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMINUSERNAME` varchar(255) NOT NULL,
  `ADMINPASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMINID`),
  UNIQUE KEY `ADMINUSERNAME` (`ADMINUSERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMINID`, `ADMINUSERNAME`, `ADMINPASSWORD`) VALUES
(1, 'seller1', 'seller1'),
(2, 'seller2', 'seller2'),
(3, 'user', '123'),
(4, 'nim2', '123');

-- --------------------------------------------------------

--
-- Table structure for table `cart_log`
--

CREATE TABLE IF NOT EXISTS `cart_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-checkedout',
  `added_date` datetime NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cart_log`
--

INSERT INTO `cart_log` (`id`, `product_id`, `category_id`, `quantity`, `status`, `added_date`, `user_id`) VALUES
(1, '12', 'Food Cat 2', 5, 0, '2021-05-25 21:47:29', '0'),
(12, 'Pulsar', 'Food Cat 2', 1, 0, '2021-05-26 00:43:00', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CATGID` int(11) NOT NULL AUTO_INCREMENT,
  `CATGNAME` varchar(255) NOT NULL,
  `CATGDESC` varchar(300) NOT NULL,
  PRIMARY KEY (`CATGID`),
  UNIQUE KEY `CATGNAME` (`CATGNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CATGID`, `CATGNAME`, `CATGDESC`) VALUES
(2, 'Food Cat 2', ''),
(3, 'Food Cat 4', ''),
(4, 'Food Cat 8', ''),
(5, 'Food Cat 3', ''),
(9, 'Food Cat 1', ''),
(43, 'Food Cat 5', ''),
(50, 'Food Cat 9', ''),
(52, 'Food Cat 7', ''),
(53, 'Food Cat 6', ''),
(54, 'Food Cat 10', ''),
(55, 'new cat', 'new descs');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `PRODUCTID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCTNAME` varchar(255) NOT NULL,
  `PRODUCTPRICE` double NOT NULL,
  `PRODUCTDESC` varchar(255) DEFAULT NULL,
  `CATGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRODUCTID`),
  UNIQUE KEY `PRODUCTNAME` (`PRODUCTNAME`),
  KEY `FK185958CF82C65A8F` (`CATGID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PRODUCTID`, `PRODUCTNAME`, `PRODUCTPRICE`, `PRODUCTDESC`, `CATGID`) VALUES
(1, 'Sun', 560, 'Fish Bun', 5),
(2, 'Rice 2', 34000, 'Rice 2 Description', 9),
(3, 'Rice 1', 25000, 'Rice 1 Description', 9),
(12, 'Sweet eats 1', 80000, 'Sweet eats 1', 2),
(13, 'Sweet eats 2', 32000, 'Sweet eats 2', 3),
(14, 'Sweet eats 4', 50000, 'Sweet eats 4', 3),
(15, 'Ray Ban', 5000, 'Aviators', 50),
(16, 'Fish Bun', 500, 'Fish Bun', 5),
(17, 'Candy', 2000, 'Candy', 43),
(18, 'Sony Bravia', 45000, 'HD LCD 42" Screen', 4),
(19, 'Panasonic Viera', 40000, '36" LCD Sd ', 4),
(20, 'Armani', 5000, 'Branded World Class Goggles', 50),
(21, 'Pulsar', 81000, '!50 cc Twin Spark Engine. 40 average', 2),
(22, 'Spinkel', 2000, 'Colored HeadPhones', 43);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAILID` varchar(255) NOT NULL,
  `MOBILENO` varchar(255) NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERID`, `USERNAME`, `PASSWORD`, `EMAILID`, `MOBILENO`, `ADDRESS`) VALUES
(1, 'amit', 'user', 'amit@admin.com', '9128347234', ''),
(2, 'atul', 'user', 'atul@admin.com', '23746837', ''),
(3, 'gayanga', '123456', 'gayanga@gmail.com', '077777777', ''),
(5, 'hellow', '123456', 'hello@gmail.com', '000144444', 'helsdfsdf ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK185958CF82C65A8F` FOREIGN KEY (`CATGID`) REFERENCES `category` (`CATGID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
