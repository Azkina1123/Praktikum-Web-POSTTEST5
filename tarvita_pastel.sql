-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 04:50 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tarvita_pastel`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(50) NOT NULL,
  `released_date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `net` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `frame` varchar(10) DEFAULT NULL,
  `technic` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `packing_list` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `released_date`, `name`, `price`, `description`, `stock`, `net`, `width`, `height`, `frame`, `technic`, `material`, `packing_list`, `image`) VALUES
('painting-1', '2022-10-18', 'Hirondelle Amour Painting', 6019905, 'Hand-painted canvas reproduction with quality oil painting.', 14, 34.3, 70.8, 52.3, 'Yes', 'Oil Painting', '', '', 'painting-1.jpg'),
('painting-2', '2022-10-18', 'Koi Alpha Tree Painting', 2190000, 'Koi fish painting with LED FLS and size 50x100 cm.', 12, 34.7, 42.2, 67.1, 'Yes', 'Unknown', '', '', 'painting-2.jpg'),
('painting-3', '2022-10-18', 'Seascape Painting', 690909, 'Large art hand-painted 4pcs/set oil painting on canvas unframed.', 32, 40.2, 33.2, 65.5, 'No', 'Oil Painting', '', '', 'painting-3.jpg'),
('painting-4', '2022-10-18', 'Abstract City Painting', 4976784, 'Landscape painting with modern canvas for living room decoration.', 8, 30.7, 65.1, 51.1, 'Yes', 'Unknown', '', '', 'painting-4.jpg'),
('painting-5', '2022-10-18', 'Girl Full Round Drill Rhinestone', 108450, 'The most popular painting which can perfectly decorate your room.', 23, 22.8, 38.2, 50.1, 'Yes', 'Unknown', '', '', 'painting-5.jpg'),
('tool-1', '2022-10-18', 'Paint Brush', 25500, 'Set professional brushes for acrylic, watercolor, and oil painting.', 34, 0.2, 5, 20, '', '', 'Wood', '1 Set paint brushes (6 pcs)', 'tool-1.jpeg'),
('tool-2', '2022-10-18', 'Painting Canvas', 38402, 'High quality painting canvas with medium texture cotton duck fabric.', 72, 3.6, 20, 30, '', '', 'Canvas', '1 Pcs Canvas', 'tool-2.jpg'),
('tool-3', '2022-10-18', 'Watercolor Paint', 29450, 'Paint with the finest materials, smooth application, and true color.', 112, 1.7, 3.9, 7.1, '', '', 'Watercolor', '1 Set watercolor (white, green, blue, yellow, red', 'tool-3.jpg'),
('tool-4', '2022-10-18', 'Plastic Pallete Painting', 59990, 'Brand new and high quality pallete. Suitable for all water based media.', 41, 0.5, 10.7, 10.7, '', '', 'Plastic', '1 Pcs pallete', 'tool-4.jfif'),
('tool-5', '2022-10-18', 'Craft Painting Tools Kits', 273000, 'The tools set is used for decorating and painting DIY model spraying.', 32, 4.4, 1.2, 13.4, '', '', 'Alluminium', '1 Set craft painting (10 pcs)', 'tool-5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
