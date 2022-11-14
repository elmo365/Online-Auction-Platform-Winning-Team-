-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 03:25 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_accounts`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid_order`
--

CREATE TABLE `bid_order` (
  `id` int(50) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `timer` time DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `base_price` float NOT NULL,
  `increment` float DEFAULT NULL,
  `minimum_increment` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bid_order_bidding_log`
--

CREATE TABLE `bid_order_bidding_log` (
  `id` int(50) NOT NULL,
  `user_bid_registration_id` int(11) DEFAULT NULL,
  `bid_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `base` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Has authority of users and roles and permissions.'),
(2, 'Seller', 'Can upload and sell their products'),
(3, 'Buyer', 'Can buy products'),
(4, 'forum manager', 'manages forum posts and replies to posts with regard to system.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `omang_passport` varchar(50) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `firstname`, `surname`, `email`, `password`, `omang_passport`, `profile_picture`, `created_at`, `updated_at`) VALUES
(4, 1, 'elmo366', 'Ricardo', 'Diane', 'ricardodiane366@gmail.com', '$2y$10$kKSPbUvo9QinMf1HTyNan.nNCD1e0EJwdDjmSdGYSHhzpoikuyU5m', '4667776', '2022.11.12IMG_20220228_060719 - Copy.jpg', '2022-11-12 08:11:54', '2022-11-12 08:11:54'),
(5, 1, 'elmo365', 'Ricardo', 'Diane', 'ricardodiane365@gmail.com', '$2y$10$exzQrbAq/OPZI/9H2xpFKOvxST4eT/gVgpDIzZ2g7vtDDpSzF/iLG', '1234567', '2022.11.12IMG_20220228_060719 - Copy.jpg', '2022-11-12 10:26:00', '2022-11-12 10:26:00'),
(7, NULL, 'el', 'Kgalalelo', 'Lesetedi', 'rdiane@maranyane.com', '$2y$10$ftNcUOLpp22KMgSziJO43.F3SWragA5T8aCvWgxAFaZfzXZM8PXXq', '47999', '2022.11.12IMG_20220228_060719 - Copy.jpg', '2022-11-12 11:12:50', '2022-11-12 12:12:50'),
(8, NULL, 'mic', 'Michael', 'Kenosi', 'michaelmkenosi@gmail.com', '$2y$10$w8YBkJmsGLCiL1RfuBiQCOkvzv9JG0ZTGiJCM7RmUWrBXLAUFGTwu', '123890', NULL, '2022-11-14 09:48:07', '2022-11-14 10:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_bidding_registration`
--

CREATE TABLE `user_bidding_registration` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bid_order_id` int(50) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet_bid_transactions_log`
--

CREATE TABLE `user_wallet_bid_transactions_log` (
  `id` int(50) NOT NULL,
  `wallet_id` int(50) DEFAULT NULL,
  `bid_order_bidding_log_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 7, 1000, '2022-11-14 12:40:27', '2022-11-14 14:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_deposit_log`
--

CREATE TABLE `wallet_deposit_log` (
  `id` int(50) NOT NULL,
  `wallet_id` int(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `deposit_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bid_order`
--
ALTER TABLE `bid_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_idfk_1` (`product_id`);

--
-- Indexes for table `bid_order_bidding_log`
--
ALTER TABLE `bid_order_bidding_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bidding_registration_idfk` (`user_bid_registration_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_ibfk_3` (`user_id`),
  ADD KEY `users_ibfk_4` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `omang_passport` (`omang_passport`),
  ADD KEY `users_ibfk_1` (`role_id`);

--
-- Indexes for table `user_bidding_registration`
--
ALTER TABLE `user_bidding_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet_bid_transactions_log`
--
ALTER TABLE `user_wallet_bid_transactions_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_idfk_1` (`wallet_id`),
  ADD KEY `bid_order_bidding_log_ibfk_2` (`bid_order_bidding_log_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_ibfk_5` (`user_id`);

--
-- Indexes for table `wallet_deposit_log`
--
ALTER TABLE `wallet_deposit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_ibfk_2` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bid_order`
--
ALTER TABLE `bid_order`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bid_order_bidding_log`
--
ALTER TABLE `bid_order_bidding_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_bidding_registration`
--
ALTER TABLE `user_bidding_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wallet_bid_transactions_log`
--
ALTER TABLE `user_wallet_bid_transactions_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallet_deposit_log`
--
ALTER TABLE `wallet_deposit_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid_order`
--
ALTER TABLE `bid_order`
  ADD CONSTRAINT `product_idfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `bid_order_bidding_log`
--
ALTER TABLE `bid_order_bidding_log`
  ADD CONSTRAINT `user_bidding_registration_idfk` FOREIGN KEY (`user_bid_registration_id`) REFERENCES `user_bidding_registration` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `user_wallet_bid_transactions_log`
--
ALTER TABLE `user_wallet_bid_transactions_log`
  ADD CONSTRAINT `bid_order_bidding_log_ibfk_2` FOREIGN KEY (`bid_order_bidding_log_id`) REFERENCES `bid_order_bidding_log` (`id`),
  ADD CONSTRAINT `wallet_idfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `wallet_deposit_log`
--
ALTER TABLE `wallet_deposit_log`
  ADD CONSTRAINT `wallet_ibfk_2` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
