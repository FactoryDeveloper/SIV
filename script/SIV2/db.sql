-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2017 at 02:36 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amaclone`
--
CREATE DATABASE IF NOT EXISTS `siv2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siv2`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `marcas` (
  `marca_id` int(100) NOT NULL,
  `marca_titulo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `marcas` (`marca_id`, `marca_titulo`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(5, 'LG'),
(6, 'Biba'),
(7, 'Flying Machine'),
(8, 'Nike'),
(9, 'Adidas'),
(10, 'Kidzee'),
(11, 'Ikea'),
(12, 'Philips');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `carrito` (
  `carrito_id` int(10) NOT NULL,
  `producto_id` int(10) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `usuario_id` int(10) NOT NULL,
  `producto_titulo` varchar(100) NOT NULL,
  `producto_imagen` varchar(300) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `precio` int(100) NOT NULL,
  `total_cantidad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `carrito` (`carrito_id`, `producto_id`, `ip`, `usuario_id`, `producto_titulo`, `producto_imagen`, `cantidad`, `precio`, `total_cantidad`) VALUES
(79, 11, '0.0.0.0', 2, 'Baby Shirt', 'babyshirt.JPG', 1, 500, 500),
(80, 2, '0.0.0.0', 2, 'iPhone 5s', 'iphonemobile.JPG', 1, 25000, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_titulo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_titulo`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wear'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Home Appliances'),
(6, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `orden_cliente` (
  `ordencliente_id` int(100) NOT NULL,
  `usuario_id` int(100) NOT NULL,
  `producto_id` int(100) NOT NULL,
  `producto_nombre` varchar(255) NOT NULL,
  `producto_precio` int(100) NOT NULL,
  `producto_cantidad` int(100) NOT NULL,
  `producto_estado` varchar(100) NOT NULL,
  `tr_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `orden_cliente` (`ordencliente_id`, `usuario_id`, `producto_id`, `producto_nombre`, `producto_precio`, `producto_cantidad`, `producto_estado`, `tr_id`) VALUES
(30, 2, 6, 'LG Aqua 2', 15000, 1, 'CONFIRMED', '15179'),
(31, 2, 15, 'Football Shoes', 2500, 1, 'CONFIRMED', '15179'),
(32, 2, 16, 'Football', 600, 1, 'CONFIRMED', '15179');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `productos` (
  `producto_id` int(100) NOT NULL,
  `producto_categoria` varchar(100) NOT NULL,
  `producto_marca` varchar(100) NOT NULL,
  `producto_titulo` varchar(50) NOT NULL,
  `producto_precio` int(100) NOT NULL,
  `producto_precio2` int(100) NOT NULL,
  `producto_descripcion` text NOT NULL,
  `producto_imagen` text NOT NULL,
  `producto_palabraclave` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `productos` (`producto_id`, `producto_categoria`, `producto_marca`, `producto_titulo`, `producto_precio`,`producto_precio2`, `producto_descripcion`, `producto_imagen`, `producto_palabraclave`) VALUES
(1, '1', '2', 'Samsung Duos 2', 5000, 2500, 'Samsung Duos 2 mobile phone', 'samsungduos.JPG', 'samsung mobile electronics'),
(2, '1', '3', 'iPhone 5s', 2500, 1250, 'iPhone mobile ', 'iphonemobile.JPG', 'apple iphone mobile electronics'),
(3, '1', '3', 'iPad', 3000, 1500, 'iPad tablet for use', 'iPad.jpg', 'apple ipad tablet'),
(4, '1', '2', 'Samsung Tab', 1000, 500, 'samsung tablet for home use', 'samsungtab.JPG', 'samsung tablet electronics'),
(5, '1', '4', 'Sony Vaio Laptop', 2500, 1250, 'Vaio Laptop', 'vaio.JPG', 'sony laptop vaio'),
(6, '1', '5', 'LG Aqua 2', 1500, 750, 'LG aqua mobile phone all featured', 'lgaqua.JPG', 'lg mobile phone aqua'),
(7, '2', '6', 'Draped Lehenga', 1500, 750, 'Matching Lehenga', 'lehenga.JPG', 'lehenga biba'),
(8, '2', '6', 'SIlk Saree', 1000, 500, 'Pure Silk Saree', 'saree.JPG', 'biba saree'),
(9, '3', '7', 'T-Shirt', 700, 350, 'T-Shirt for summer', 'tshirt.JPG', 'flying machine tshirt'),
(10, '3', '7', 'FM Jeans', 1800, 900, 'Jeans for the ones who do', 'jeans.JPG', 'flying machine jeans'),
(11, '4', '10', 'Baby Shirt', 500, 250, 'Shirt for the babies', 'babyshirt.JPG', 'kids shirt kidzee'),
(12, '4', '10', 'Kids Jeans', 800, 400, 'Jeans for kids', 'kidsjeans.JPG', 'kids jeans kidzee'),
(13, '5', '11', 'Computer Table', 2000, 1000, 'Table for computer', 'computertable.JPG', 'computer table ikea '),
(14, '5', '12', 'Trimmer', 1500, 750, 'Trimmer by Philips', 'philipstrimmer.JPG', 'philips trimmer'),
(15, '6', '8', 'Football Shoes', 2500, 1250, 'Shoes to play football by Nike', 'nikeshoes.JPG', 'nike shoes football'),
(16, '6', '9', 'Football', 600, 300, 'Football by Adidas', 'adidasfootball.JPG', 'football adidas');

-- --------------------------------------------------------

--
-- Table structure for table `received_payment`
--

CREATE TABLE `pago_recivido` (
  `pagorecivido_id` int(100) NOT NULL,
  `usuarui_id` int(100) NOT NULL,
  `amt` int(100) NOT NULL,
  `tr_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion1` varchar(300) NOT NULL,
  `direccion2` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `usuarios` (`usuario_id`, `nombres`, `apellidos`, `email`, `password`, `telefono`, `direccion1`, `direccion2`) VALUES
(1, 'Cesar', 'Medina', 'cmedinavera@gmail.com', 'fc9ab88a31718b303e63962bd78e3af5', '9900096980', 'av', 'av');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`carrito_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `orden_cliente`
  ADD PRIMARY KEY (`ordencliente_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indexes for table `received_payment`
--
ALTER TABLE `pago_recivido`
  ADD PRIMARY KEY (`pagorecivido_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `carrito`
  MODIFY `carrito_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `orden_cliente`
  MODIFY `ordencliente_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `received_payment`
--
ALTER TABLE `pago_recivido`
  MODIFY `pagorecivido_id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
