-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2023 at 02:31 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pasar_telu`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `p_name` varchar(45) NOT NULL,
  `p_category` varchar(45) NOT NULL,
  `p_link` varchar(45) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_desc` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `p_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `p_name`, `p_category`, `p_link`, `p_price`, `p_desc`, `user_id`, `p_pic`) VALUES
(8, 'Baju HMIT 1', 'Pakaian ', 'https://forms.gle/sL4an2S4wvtNHhav8', 70000, 'Baju Himpunan adalah produk dari Departemen BNC HMIT. Memiliki beberapa desain lain yang menarik yang dapat dipilih', 2, '1672569219-b1.png'),
(9, 'Baju HMIT 2', 'Pakaian ', 'https://forms.gle/sL4an2S4wvtNHhav8', 80000, 'Baju Himpunan adalah produk dari Departemen BNC HMIT. Memiliki beberapa desain lain yang menarik yang dapat dipilih', 2, '1672569609-b2.png'),
(10, 'Baju HMIT 3', 'Pakaian ', 'https://forms.gle/sL4an2S4wvtNHhav8', 70000, 'Baju Himpunan adalah produk dari Departemen BNC HMIT. Memiliki beberapa desain lain yang menarik yang dapat dipilih dengan harga terjangkau', 2, '1672569652-b3.png');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_num` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `profilepic` varchar(45) NOT NULL DEFAULT 'profileicon.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `email`, `phone_num`, `username`, `password`, `profilepic`) VALUES
(1, 'Muhamad Raihan Ramadhan', 'raihanrrmuhamad@gmail.com', '081234567899', 'raihanrr', '12345678', 'profileicon.png'),
(2, 'Budi Petot', 'budi@mail.com', '08111110000', 'budipt', 'budiganteng', 'profileicon.png'),
(3, 'odi', 'odi@gmail.com', '08123', 'odi', 'odi', 'profileicon.png');

-- --------------------------------------------------------

--
-- Table structure for table `pro_cart`
--

CREATE TABLE `pro_cart` (
  `id_relasi` int(10) NOT NULL,
  `id_cart` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantitty` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shopcart`
--

CREATE TABLE `shopcart` (
  `id_cart` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopcart`
--

INSERT INTO `shopcart` (`id_cart`, `id_user`, `date_time`) VALUES
(1, 2, '2022-12-26 09:19:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `product_owner` (`user_id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_cart`
--
ALTER TABLE `pro_cart`
  ADD PRIMARY KEY (`id_relasi`);

--
-- Indexes for table `shopcart`
--
ALTER TABLE `shopcart`
  ADD PRIMARY KEY (`id_cart`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pro_cart`
--
ALTER TABLE `pro_cart`
  MODIFY `id_relasi` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopcart`
--
ALTER TABLE `shopcart`
  MODIFY `id_cart` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_owner` FOREIGN KEY (`user_id`) REFERENCES `profil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
