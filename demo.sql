-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2017 at 12:42 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAll`()
BEGIN 
	SELECT * FROM product; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findById`(`int_id` INT)
BEGIN
   SELECT * FROM product where id = int_id;
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `fullname`, `email`) VALUES
('acc1', '$2a$10$EkzhhSBXV0JOlTlbe6Mzf.1Pv5vXH0GX2DUHxfAX2Db6MwInvcZBG', 'Account 1', 'acc1@gmail.com'),
('acc2', '123', 'Account 2', 'acc2@gmail.com'),
('acc3', '123', 'Account 3', 'acc3@gmail.com'),
('acc4', '123', 'Account 4', 'acc4@gmail.com'),
('acc5', '123', 'Account 5', 'acc5@gmail.com'),
('admin', '123', 'ABC', 'a@gmail.com'),
('dd', '$2a$10$46WRax8fz60y6nK4qQ/RK.z4slASfTWZ.CGxFZ4nlY.2orMrpba0S', 'dd', 'dd'),
('hahaha', '$2a$10$v0CAz.3Xzx4O6YGPMdEaS.1WYUh0Sqnx1gllfJUcDvOZp/whVK3k2', 'cho de', 'mskek'),
('sks', '$2a$10$ppJMYI1R4cbKQfxzuJovrOfE4sIePLsHvEljIoxRXKJyehz/zCKAa', 'aslkdjljsd', 'skalmsa'),
('tien1', '$2a$10$og3cYFrkgNh7up/qLbPfQO1hg/52tdANshLD6.hVOUkxmbaulZY7C', 'nguyen', 'oweuj@mms.com'),
('tien111', '$2a$10$UFLUCX1QrRXSQBnOWk/i1uX3q6pRAjxc6XW4T5h9dUqUucb9TBfY.', 'tien', 'asd'),
('tien1234', '$2a$10$ZbGXfZ09te7cBsmBzHe5W..ZwP29awfRpnWcE5iZFds/F6gOXUPr6', '123', 'aka@gmail.com'),
('tien15', '$2a$10$Tl.ywAQ3UY5OwdbFjWNYUeAyLj/MQ9HOmGrlPGZFeAynuGwW88CdO', 'tienhoang1', 'aitn@gmail.com'),
('tiencho', '$2a$10$U8TVRb2N91XLDtGuhFRyYODT6T.z3Z0BAzcI.7sEjh4Z4CRrjcj2G', 'haha', 'ksksk'),
('tiendepchaihonloc', '$2a$10$b07.5f85S5lF02NrxrOKJ.BTq2n.6vfxDHPG1RmaWOFK4Ww2YUtxG', 'tienhoang1', 'asdkl@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'ABC'),
(5, 'def'),
(6, 'def 111');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `datecreation` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `datecreation`, `status`, `username`) VALUES
(14, 'ord1', '2017-03-03', 0, 'acc2'),
(15, 'ord2', '2016-03-07', 0, 'acc2'),
(16, 'ord3', '2015-05-11', 0, 'acc2'),
(17, 'ord4', '2017-09-10', 0, 'acc4'),
(18, 'Order Name', '2017-08-28', 0, 'tien111'),
(19, 'Order Name', '2017-08-28', 0, 'tien111'),
(20, 'Order Name', '2017-08-28', 1, 'tien111'),
(21, 'Order Name', '2017-08-28', 1, 'tien111');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetail`
--

CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `productid` int(11) NOT NULL,
  `ordersid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`productid`,`ordersid`),
  KEY `mahd` (`ordersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ordersdetail`
--

INSERT INTO `ordersdetail` (`productid`, `ordersid`, `price`, `quantity`) VALUES
(1, 14, '1000.00', 1),
(1, 15, '1000.00', 1),
(2, 14, '999999.00', 1),
(2, 19, '6.00', 1),
(3, 21, '5.00', 1),
(4, 14, '500.00', 1),
(6, 15, '520.00', 1),
(7, 15, '520.00', 1),
(7, 21, '17.00', 1),
(13, 20, '2.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `categoryid` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `description`, `photo`, `categoryid`, `featured`) VALUES
(1, 'Nokia 1', '10.0', 2, 'good', 'thumb1.jpg', 1, 0),
(2, 'Nokia 2', '6.0', 5, 'good', 'thumb2.jpg', 1, 1),
(3, 'Samsung 1', '5.0', 8, 'good', 'thumb3.jpg', 2, 0),
(4, 'Samsung 2', '10.0', 8, 'good', 'thumb1.jpg', 3, 1),
(5, 'Apple 1', '20.0', 8, 'good 11', 'thumb1.jpg', 3, 0),
(6, 'Apple 2', '20.0', 8, 'good', 'thumb2.jpg', 3, 1),
(7, 'Apple 3', '17.0', 8, 'good', 'thumb2.jpg', 3, 0),
(12, 'SamSung 3', '12.0', 456, 'good', 'thumb3.jpg', 3, 1),
(13, 'Apple 4', '2.0', 7777, 'good 111', 'thumb2.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(4, 'user'),
(5, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `enabled` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `enabled`) VALUES
(4, 'employee1', '123', 1),
(5, 'admin', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`userid`, `roleid`, `enable`) VALUES
(4, 4, 1),
(5, 5, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Constraints for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD CONSTRAINT `ordersdetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `ordersdetail_ibfk_2` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
