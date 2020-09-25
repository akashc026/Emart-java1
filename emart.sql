-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 27, 2020 at 07:15 PM
-- Server version: 5.5.62-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `custid` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `points` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`oid`),
  KEY `pid` (`id`),
  KEY `id` (`id`),
  KEY `custid` (`custid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `catsubcat`
--

CREATE TABLE IF NOT EXISTS `catsubcat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(5) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `catsubcat`
--

INSERT INTO `catsubcat` (`cid`, `catid`, `name`, `flag`, `img`) VALUES
(1, NULL, 'Apparel & Jewellery', 0, NULL),
(2, NULL, 'Appliances', 0, NULL),
(3, NULL, 'Books & Magazines', 0, NULL),
(4, NULL, 'Electronics', 0, NULL),
(5, NULL, 'Cameras', 0, NULL),
(6, NULL, 'Movie-Music-CDs', 0, NULL),
(7, NULL, 'Health & Beauty', 0, NULL),
(8, NULL, 'Lightings', 0, NULL),
(9, NULL, 'Home Furnishing', 0, NULL),
(10, NULL, 'Kitchen & Bath', 0, NULL),
(11, NULL, 'Essentials', 0, NULL),
(18, 5, 'Compact', 1, NULL),
(19, 5, 'DSLR', 1, NULL),
(20, 4, 'Laptop', 0, NULL),
(21, 4, 'Mobile', 0, NULL),
(22, 4, 'Refrigerator', 1, NULL),
(23, 4, 'TV', 1, NULL),
(24, 20, 'apple', 1, 'assets/img/brand/apple.jpg'),
(25, 20, 'dell', 1, 'assets/img/brand/Dell.jpg '),
(26, 20, 'hp', 1, 'assets/img/brand/hp.jpg'),
(27, 21, 'acer', 1, 'assets/img/brand/acer.jpg'),
(28, 21, 'asus', 1, 'assets/img/brand/Asus.jpg'),
(29, 21, 'lenovo', 1, 'assets/img/brand/lenovo.jpg'),
(30, 21, 'mi', 1, 'assets/img/brand/Mi.jpg'),
(31, 21, 'motorola', 1, 'assets/img/brand/Moto.jpg'),
(32, 21, 'samsung', 1, 'assets/img/brand/samsung.jpg'),
(33, 21, 'sony', 1, 'assets/img/brand/Sony.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobno` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `address1` varchar(250) DEFAULT NULL,
  `primemember` tinyint(1) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`custid`),
  UNIQUE KEY `email` (`email`,`mobno`),
  UNIQUE KEY `UKqkmqxbhx5bwgqyapmhteditu0` (`email`,`mobno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `cname`, `email`, `mobno`, `age`, `gender`, `password`, `address`, `address1`, `primemember`, `points`) VALUES
(1, 'Aditya', 'avbelsare@gmail.com', '7020757025', 23, 'Male', 'aditya', 'qwertyuiop', NULL, 1, 100),
(3, 'Kunal', 'kunal196@gmail.com', '09029303453', 23, 'male', 'kunal', 'asdfghj', NULL, 0, 100),
(4, 'Aishwarya', 'aishwaryajain0009@gmail.com', '7448111399', 23, '', 'qwertyui', 'Shivaji road,mahavir Chowk parbhani', '', 0, 100),
(5, 'manoj', 'manoj@gmail.com', '7448111399', 23, '', 'qwertyui', 'vita', '', 1, 100),
(6, 'Ketki', 'ketkimam@gmai;.com', '7984561232', 30, 'Female', 'qwertyui', 'sadfghjk', '', 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pdetail` varchar(250) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '100',
  `price` int(11) NOT NULL,
  `primeprice` int(11) NOT NULL,
  `image` varchar(80) DEFAULT NULL,
  `modelno` varchar(20) DEFAULT NULL,
  `cgst` float DEFAULT NULL,
  `sgst` float DEFAULT NULL,
  `promotional` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `pdetail`, `cid`, `points`, `price`, `primeprice`, `image`, `modelno`, `cgst`, `sgst`, `promotional`) VALUES
(3, 'apple_1', 'Apple MacBook Air Core i5 5th Gen - (8 GB/128 GB SSD/Mac OS Sierra)', 24, 100, 59990, 58990, 'assets/img/Electronics/laptop/apple/apple_1.jpg', '001', 9, 9, 1),
(4, 'Apple_2', 'Apple_MacBook_Air_13_inch_2', 24, 100, 62999, 61999, 'assets/img/Electronics/laptop/apple/Apple_2.jpg', '002', 9, 9, 0),
(7, 'dell_1', 'Dell G3 Series Core i5 8th Gen - (8 GB/1 TB HDD/128 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA Geforce GTX 1050) 3579 Gaming Laptop  (15.6 inch, Licorice Black, 2.53 kg, With MS Office)', 25, 100, 67599, 66599, 'assets/img/Electronics/laptop/dell/dell_1.jpg', '003', 9, 9, 0),
(8, 'dell_2', 'DELL_Inspiron_15', 25, 100, 62999, 61999, 'assets/img/Electronics/laptop/dell/dell_2.jpg', '004', 9, 9, 0),
(9, 'dell_3', 'Dell G3 Series Core i5 8th Gen - (8 GB/1 TB HDD/128 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA Geforce GTX 1050) 3579 Gaming Laptop  (15.6 inch, Licorice Black, 2.53 kg, With MS Office)', 25, 100, 59990, 58990, 'assets/img/Electronics/laptop/dell/dell_3.jpg', '005', 9, 9, 0),
(10, 'hp_1', 'HP_15-bu004tu', 26, 100, 42990, 41990, 'assets/img/Electronics/laptop/hp/hp_1.jpg', '006', 9, 9, 0),
(11, 'hp_2', 'HP_16-bu004tu', 26, 100, 45990, 45990, 'assets/img/Electronics/laptop/hp/hp_2.jpg', '007', 9, 9, 0),
(12, 'hp_3', 'HP_16-bu004tu', 26, 100, 45990, 44990, 'assets/img/Electronics/laptop/hp/hp_3.jpg', '008', 9, 9, 1),
(13, 'hp_4', 'HP_12-bu004tu', 26, 100, 62999, 61999, 'assets/img/Electronics/laptop/hp/hp_4.png', '008', 9, 9, 0),
(14, 'sony_1', 'Sony_DSC_W830', 18, 100, 5999, 5599, 'assets/img/Cameras/Compact/sony_1.jpg', '009', 9, 9, 1),
(15, 'sony_2', 'Sony_DSC_W830', 18, 100, 18999, 18599, 'assets/img/Cameras/Compact/sony_2.jpg', '009', 9, 9, 0),
(16, 'canon', 'CANON', 19, 100, 46499, 45999, 'assets/img/Cameras/Dslr/canon.jpg', '009', 9, 9, 0),
(17, 'Canon_EOS_700D', 'Canon_EOS_700D', 19, 100, 48999, 47999, 'assets/img/Cameras/Dslr/Canon_EOS_700D.jpg', '010', 9, 9, 0),
(18, 'nikon', 'nikon D-XXXXX08', 19, 100, 47999, 47599, 'assets/img/Cameras/Dslr/nikon.jpg', '011', 9, 9, 0),
(19, 'Nikon_D5300', 'Nikon_D5300', 19, 100, 48999, 47999, 'assets/img/Cameras/Dslr/Nikon_D5300.JPG', '012', 9, 9, 0),
(20, 'Nikon_D5300_DSLR', 'Nikon_D5300_DSLR', 19, 100, 59990, 58990, 'assets/img/Cameras/Dslr/Nikon_D.jpg', '013', 9, 9, 0),
(21, 'Acer1', 'Acer1_xxxxx', 27, 100, 7190, 7000, 'assets/img/Electronics/mobile/acer/Acer1.jpg', '014', 9, 9, 1),
(22, 'Acer2', 'Acer2_xxxx', 27, 100, 7999, 7599, 'assets/img/Electronics/mobile/acer/Acer2.jpg', '015', 9, 9, 1),
(23, 'Acer3', 'Acer3_xxx', 27, 100, 8999, 8699, 'assets/img/Electronics/mobile/acer/Acer3.jpg', '016', 9, 9, 0),
(24, 'Acer4', 'Acer4_zzzz', 27, 100, 6599, 6399, 'assets/img/Electronics/mobile/acer/Acer4.jpg', '017', 9, 9, 0),
(25, 'Acer5', 'Acer5_xxxx', 27, 100, 9899, 9699, 'assets/img/Electronics/mobile/acer/Acer5.jpg', '018', 9, 9, 0),
(26, 'Asus1', 'Asus1_xxxx', 28, 100, 9999, 9599, 'assets/img/Electronics/mobile/asus/Asus1.jpg', '019', 9, 9, 0),
(27, 'Asus2', 'Asus2-xxxx', 28, 100, 8999, 8599, 'assets/img/Electronics/mobile/asus/Asus2.jpg', '020', 9, 9, 0),
(28, 'Asus3', 'Asus3-xxxxx', 28, 100, 9499, 9299, 'assets/img/Electronics/mobile/asus/Asus3.jpg', '021', 9, 9, 0),
(29, 'Asus4', 'Asus4-xxxx', 28, 100, 7799, 7699, 'assets/img/Electronics/mobile/asus/Asus4.jpg', '022', 9, 9, 0),
(30, 'Asus5', 'Asus5-xxxx', 28, 100, 7499, 7299, 'assets/img/Electronics/mobile/asus/Asus5.jpg', '023', 9, 9, 0),
(35, 'doubledoor', 'doubledoor-xxxx', 22, 100, 30000, 29000, 'assets/img/Electronics/Refrigerator/doubledoor.jpg', '024', 9, 9, 1),
(36, 'Electrolux_370', 'Electrolux_370-xxx', 22, 100, 48999, 47999, 'assets/img/Electronics/Refrigerator/Electrolux_370.jpg', '025', 9, 9, 0),
(37, 'LG_190', 'LG_190-xxxx', 22, 100, 45000, 44000, 'assets/img/Electronics/Refrigerator/LG_190.jpg', '026', 9, 9, 0),
(38, 'refrigerator', 'refrigerator-xxxx', 22, 100, 46000, 45000, 'assets/img/Electronics/Refrigerator/refrigerator.jpg', '027', 9, 9, 1),
(39, 'singledoor', 'singledoor-xxxxx', 22, 100, 22999, 21999, 'assets/img/Electronics/Refrigerator/singledoor.jpg', '028', 9, 9, 0),
(40, 'tripledoor', 'tripledoor-xxxxx', 22, 100, 50999, 50000, 'assets/img/Electronics/Refrigerator/tripledoor.jpg', '029', 9, 9, 0),
(41, 'whirlpool_340', 'whirlpool_340-xxx', 22, 100, 32000, 31000, 'assets/img/Electronics/Refrigerator/whirlpool_340.jpg', '030', 9, 9, 0),
(42, '24in', '24in-xxxxx', 23, 100, 12999, 12599, 'assets/img/Electronics/TV/24in.jpg', '031', 9, 9, 0),
(43, '24in1', '24in1-xxxxx', 23, 100, 13999, 13599, 'assets/img/Electronics/TV/24in1.jpg', '032', 9, 9, 0),
(44, '24inches&below1', '24inches&below1-xxxx', 23, 100, 14999, 14599, 'assets/img/Electronics/TV/24inches&below1.jpg', '033', 9, 9, 0),
(45, '24inches&below2', '24inches&below2-xxxx', 23, 100, 15999, 15599, 'assets/img/Electronics/TV/24inches&below2.jpg', '033', 9, 9, 1),
(46, '24inches&below3', '24inches&below3-xxxx', 23, 100, 16999, 16599, 'assets/img/Electronics/TV/24inches&below3.jpg', '035', 9, 9, 0),
(47, '24inches&below4', '24inches&below4-xxxxx', 23, 100, 17999, 17599, 'assets/img/Electronics/TV/24inches&below4.jpg', '036', 9, 9, 0),
(48, '24inches&below5', '24inches&below5-xxxx', 23, 100, 18999, 18599, 'assets/img/Electronics/TV/24inches&below5.jpg', '037', 9, 9, 0),
(49, 'LG_HD', 'LG_HD-xxxx', 23, 100, 19999, 19599, 'assets/img/Electronics/TV/LG_HD.jpg', '038', 9, 9, 0),
(50, 'micromax_HD', 'micromax_HD-xxxx', 23, 100, 20999, 20599, 'assets/img/Electronics/TV/micromax_HD.jpg', '039', 9, 9, 0),
(51, 'vu_hd', 'vu_hd-xxxx', 23, 100, 21999, 21599, 'assets/img/Electronics/TV/vu_hd.jpg', '040', 9, 9, 0),
(52, 'Lenovo1', 'Lenovo1-xxxxx', 29, 100, 6000, 5599, 'assets/img/Electronics/mobile/lenovo/Lenovo1.jpg', '028', 9, 9, 1),
(53, 'Lenovo2', 'Lenovo2-xxxxxxxxxx', 29, 20, 7000, 6599, 'assets/img/Electronics/mobile/lenovo/Lenovo2.jpg', '029', 9, 9, 0),
(54, 'Lenovo3', 'Lenovo3-xxxxx', 29, 20, 8000, 7599, 'assets/img/Electronics/mobile/lenovo/Lenovo3.jpg', '030', 9, 9, 0),
(55, 'Lenovo4', 'Lenovo4-xxxxxxxxx', 29, 20, 9000, 8599, 'assets/img/Electronics/mobile/lenovo/Lenovo4.jpg', '031', 9, 9, 0),
(56, 'Lenovo5', 'Lenovo5-xxxxxxxx', 29, 20, 9000, 8599, 'assets/img/Electronics/mobile/lenovo/Lenovo5.jpg', '032', 9, 9, 0),
(57, 'Mi1', 'Mi1-xxxxx', 30, 100, 6000, 5699, 'assets/img/Electronics/mobile/mi/Mi1.jpg', '033', 9, 9, 1),
(58, 'Mi2', 'Mi2-xxxx', 30, 100, 7000, 6500, 'assets/img/Electronics/mobile/mi/Mi2.jpg', '034', 9, 9, 0),
(59, 'Mi3', 'Mi3-xxxxxx', 30, 100, 7000, 6499, 'assets/img/Electronics/mobile/mi/Mi3.jpg', '035', 9, 9, 0),
(60, 'Mi4', 'Mi4--xxxxxxxxx', 30, 100, 8000, 7599, 'assets/img/Electronics/mobile/mi/Mi4.jpg', '035', 9, 9, 0),
(61, 'Moto_E4_Plus', 'Moto_E4_Plus-xxxxxxxxx', 31, 100, 9000, 8899, 'assets/img/Electronics/mobile/motorola/Moto_E4_Plus.jpg', '036', 9, 9, 1),
(62, 'Moto_G5s_Plus', 'Moto_G5s_Plus-xxxxxxx', 31, 100, 12999, 12599, 'assets/img/Electronics/mobile/motorola/Moto_G5s_Plus.jpg', '037', 9, 9, 0),
(63, 'Motorola1', 'Motorola1-xxxxxxx', 31, 100, 11999, 11499, 'assets/img/Electronics/mobile/motorola/Motorola1.jpg', '038', 9, 9, 0),
(64, 'Motorola2', 'Motorola2-xxxxxx', 31, 100, 13000, 12999, 'assets/img/Electronics/mobile/motorola/Motorola1.jpg', '038', 9, 9, 0),
(65, 'samsung', 'samsung-xxxxxx', 32, 100, 8000, 7599, 'assets/img/Electronics/samsung/samsung.jpg', '039', 9, 9, 0),
(66, 'Samsung1', 'Samsung1-xxxx', 32, 100, 9000, 8599, 'assets/img/Electronics/mobile/samsung/Samsung1.jpg', '040', 9, 9, 1),
(67, 'Sony2', 'Sony2-xxxx', 32, 100, 15000, 14500, 'assets/img/Electronics/mobile/sony/Sony2.jpg', '041', 9, 9, 0),
(68, 'Sony4', 'Sony4-xxxxxx', 32, 100, 18999, 18499, 'assets/img/Electronics/mobile/sony/Sony4.jpg', '042', 9, 9, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `catsubcat` (`cid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
