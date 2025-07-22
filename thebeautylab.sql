-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 09:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thebeautylab`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stylist_id` int(11) DEFAULT NULL,
  `service_name` varchar(100) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `booked_date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `total_fee` decimal(10,2) DEFAULT NULL,
  `stylist` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `user_id`, `stylist_id`, `service_name`, `service_id`, `booked_date`, `Time`, `appointment_date`, `total_fee`, `stylist`) VALUES
(17, 33, NULL, 'French Manicure, Gel nails', NULL, '2025-05-19', '23:07:00', '2025-05-29', 6200.00, 'Jessie'),
(18, 78, NULL, 'Protein Treatment, Hair Mask', NULL, '2025-05-20', '22:16:00', '2025-05-30', 4800.00, 'Riya'),
(19, 78, NULL, 'Laser Skin Resurfacing', NULL, '2025-05-20', '22:19:00', '2025-05-28', 8000.00, 'Dr. Mira'),
(20, 78, NULL, 'Indulge & relax, Slimming & drainage', NULL, '2025-05-20', '23:53:00', '2025-05-29', 5000.00, 'Mina'),
(21, 78, NULL, 'Botox', NULL, '2025-05-20', '23:57:00', '2025-06-05', 2000.00, 'Dr. Mira'),
(22, 78, NULL, 'Television make up', NULL, '2025-05-21', '00:31:00', '2025-06-04', 6000.00, 'Samantha'),
(23, 78, NULL, 'Simple Haircut', NULL, '2025-05-21', '05:29:00', '2025-05-29', 300.00, 'Riya'),
(24, 78, NULL, 'Full Hair Color', NULL, '2025-05-21', '00:36:00', '2025-06-07', 2000.00, 'Emily'),
(25, 77, NULL, 'Full Hair Color, Hair Mask', NULL, '2025-05-21', '12:48:00', '2025-06-03', 3800.00, 'Riya'),
(26, 77, NULL, 'Occasion make up', NULL, '2025-05-21', '00:51:00', '2025-05-16', 5000.00, 'Samantha'),
(27, 77, NULL, 'Simple Haircut, Hair Styling', NULL, '2025-05-21', '12:02:00', '2025-06-07', 1300.00, 'Emily'),
(28, 77, NULL, 'Simple Haircut, Hair Styling', NULL, '2025-05-21', '12:02:00', '2025-06-07', 1300.00, 'Emily'),
(29, 77, NULL, 'Simple Haircut, Hair Mask', NULL, '2025-05-21', '01:08:00', '2025-05-29', 2100.00, 'Emily'),
(30, 77, NULL, 'Simple Haircut, Hair Mask', NULL, '2025-05-21', '01:08:00', '2025-05-29', 2100.00, 'Emily'),
(31, 78, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-21', '01:13:00', '2025-05-23', 5000.00, 'Emily'),
(32, 78, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-21', '01:13:00', '2025-05-23', 5000.00, 'Emily'),
(33, 80, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-21', '08:09:00', '2025-06-06', 5000.00, 'Emily'),
(34, 80, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-21', '08:09:00', '2025-06-06', 5000.00, 'Emily'),
(35, 78, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-22', '05:54:00', '2025-06-05', 5000.00, 'Riya'),
(36, 78, NULL, 'Full Hair Color, Protein Treatment', NULL, '2025-05-22', '05:54:00', '2025-06-05', 5000.00, 'Riya'),
(37, 78, NULL, 'Pedicure, Gel Reapplication', NULL, '2025-05-22', '06:12:00', '2025-06-05', 3500.00, 'Tina'),
(38, 78, NULL, 'Pedicure, Gel Reapplication', NULL, '2025-05-22', '06:12:00', '2025-06-05', 3500.00, 'Tina'),
(39, 78, NULL, 'Gel Reapplication', NULL, '2025-05-22', '18:09:00', '2025-06-07', 1000.00, 'Tina'),
(40, 78, NULL, 'Gel Reapplication', NULL, '2025-05-22', '18:09:00', '2025-06-07', 1000.00, 'Tina'),
(41, 78, NULL, 'Chemical Peel', NULL, '2025-05-22', '19:08:00', '2025-05-23', 5000.00, 'Dr. Mira'),
(42, 78, NULL, 'Chemical Peel', NULL, '2025-05-22', '19:08:00', '2025-05-23', 5000.00, 'Dr. Mira');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_service`
--

CREATE TABLE `appointment_service` (
  `appointment_service_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stylist_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `appointment_time` datetime NOT NULL,
  `appointment_duration` time NOT NULL,
  `report_generated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_to_customer` tinyint(1) DEFAULT 1,
  `sent_to_admin` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `stylist_name` varchar(100) DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `name`, `location`, `stylist_name`, `rating`, `comment`, `user_id`) VALUES
(1, 'adcav', 'adsvad', 'Riya', 'Satisfied', 'advadsv', NULL),
(2, 'kushal', 'asdfadf', 'Riya', 'Satisfied', 'asdfadfcdasdc', NULL),
(3, 'asdfc', 'adf', NULL, 'Good', 'adfads', NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `stylist_id` int(11) DEFAULT NULL,
  `available_day` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service_title` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service_title`, `price`, `duration`, `category`, `image_path`) VALUES
(5, 'Pedicure', 2500.00, 1, 'Nails', 'nails.png'),
(6, 'Simple Haircut', 300.00, 2, 'Hair', 'hair.png'),
(7, 'Daily Make up', 2000.00, 1, 'Makeup', 'makeup.png'),
(10, 'Manicure', 4000.00, 1, 'Nails', 'nails.png'),
(11, 'Night make up', 4000.00, 2, 'Makeup', 'makeup.png'),
(12, 'Bridal make up', 4000.00, 3, 'Makeup', 'makeup.png'),
(13, 'Botox', 2100.00, 2, 'Cosmetology', 'cosmetology.png'),
(14, 'Chemical Peel', 5000.00, 2, 'Cosmetology', 'cosmetology.png'),
(15, 'Body scrub & smoothing', 2000.00, 1, 'Spa', 'spa.jpg'),
(16, 'Indulge & relax', 2999.00, 1, 'Spa', 'spa.jpg'),
(17, 'Laser Hair Removal', 10000.00, 6, 'Cosmetology', 'cosmetology.png'),
(18, 'Hair Styling', 1000.00, 1, 'Hair', 'hair.png'),
(19, 'Full Hair Color', 2000.00, 2, 'Hair', 'hair.png'),
(20, 'Gel nails', 5000.00, 1, 'Nails', 'nails.png'),
(21, ' Slimming & drainage', 5000.00, 2, 'Spa', 'spa.jpg'),
(22, 'Occasion make up', 5000.00, 3, 'Makeup', 'makeup.png'),
(23, 'Television make up', 2000.00, 2, 'Makeup', 'makeup.png'),
(24, 'Protein Treatment', 3000.00, 3, 'Hair', 'hair.png'),
(25, 'Hair Mask', 1800.00, 1, 'Hair', 'hair.png'),
(26, 'French Manicure', 1200.00, 4, 'Nails', 'nails.png'),
(27, 'Gel Reapplication', 1000.00, 2, 'Nails', 'nails.png'),
(28, 'Laser Skin Resurfacing', 8000.00, 2, 'Cosmetology', 'cosmetology.png'),
(29, 'Foot revive treatment', 1800.00, 2, 'Spa', 'spa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stylist`
--

CREATE TABLE `stylist` (
  `stylist_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stylist`
--

INSERT INTO `stylist` (`stylist_id`, `full_name`, `specialization`, `experience_years`) VALUES
(3, ' Samantha', 'Makeup', 2),
(4, 'Olivia', 'Makeup', 3),
(5, 'Emily', 'Hair', 2),
(6, 'Riya', 'Hair', 3),
(7, 'Jessie', 'Nails', 4),
(8, 'Tina', 'Nails', 3),
(9, 'Dr. Mira', 'Cosmetology', 4),
(10, 'Dr. Laxmi', 'Cosmetology', 5),
(11, 'Mina', 'Spa', 2),
(12, 'Luna', 'Spa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `image_path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `username`, `password`, `role_id`, `image_path`) VALUES
(32, 'Admin', 'Adminn', 'admin@gmial.com', '9812122332', 'Male', 'Admin@1234', 'RmlybnNFNjc4OQ==', 2, ''),
(33, 'demokushalshresth', 'shreshta', 'demo@gmail.com', '9823456789', 'Male', 'DemoDemo@1234', 'SWpydElqcnRFNjc4OQ==', 1, ''),
(35, 'Pratik', 'porsai', 'poirsai@gmail.com', '9823232323', 'Male', 'Pratikdona@1', 'VXdmeW5waXRzZkU2', 1, ''),
(77, 'withimageee', 'shreshta', 'gimama40@gmail.com', '9823456789', 'Male', 'Test123@11', 'WWp4eTY3OEU2Ng==', 1, 'userprofileimages/CloudQuest.png'),
(78, 'withimage111', 'shreshta', 'gimama40@gmail.com', '9823456789', 'Male', 'Test123@1', 'WWp4eTY3OEU2', 1, 'userprofileimages/CloudQuest.png'),
(79, 'kushal', 'shrestha', 'gimama40@gmail.com', '9823456789', 'Male', 'Kush@l999', 'UHp4bUVxPj4+', 1, 'userprofileimages/prof.png'),
(80, 'Bikram', 'shrestha', 'Bikku0709@gmail.com', '9822595627', 'Male', 'Biki!3!@', 'R25wbiY4JkU=', 1, 'userprofileimages/WIN_20240807_21_41_42_Pro.jpg'),
(81, 'neewfilee', 'with', 'withimage@gmail.com', '9813123457', 'Male', 'WithnewFIle@1', 'XG55bXNqfEtOcWpFNg==', 1, '/images/userprofileimages/e50c6932-f56d-45de-a1d7-d84cf523669b_porsche-911-gt3-car-ku-2560x1440.jpg'),
(82, 'WIhttth imgaeee', 'shreshta', 'ssskkhayunga@gmail.com', '9823232323', 'Male', 'WithIMAGE21@', 'XG55bU5SRkxKNzZF', 1, '/images/userprofileimages/bde7a988-a59d-4330-8760-a84107025255_Screenshot 2024-07-19 003541.png'),
(83, 'WithImage', 'IMagbeeee', 'withimage@gmail.com', '9823232323', 'Male', 'WithIMAGE21@@', 'XG55bU5SRkxKNzZFRQ==', 1, 'userprofileimages/profilepic.jpg'),
(84, 'withhhhhemojuii', 'withhhhhemojuii', 'withhhhhemojuii@gmail.com', '9823456789', 'Male', 'Withhhhhemojuii@1', 'XG55bW1tbW1qcnRvem5uRTY=', 1, '/images/userprofileimages/dc20fc08-caca-4fc7-8759-4de961ccddcf_CloudQuest.png'),
(85, 'mmmmmmmmm', 'mmmmmmmm', 'mmmmm@gmail.com', '9823456789', 'Male', 'MMMMm@1!2', 'UlJSUnJFNiY3', 1, '/images/userprofileimages/User_profilepic.jpg'),
(86, 'makeing', 'Mkaeing', 'adfadfa@gmail.com', '9843234567', 'Male', 'MMakem@1!2', 'UlJmcGpyRTYmNw==', 1, '/images/userprofileimages/18141076-3cdd-4b51-943e-66804a7a15dd_CloudQuest.png'),
(87, 'withtheimg', 'withtheimg', 'withtheimg@gmai.com', '9823234444', 'Male', 'withtheimG@1', 'fG55bXltam5yTEU2', 1, 'userprofileimages/WIN_20240807_21_41_42_Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role_name`) VALUES
(1, 'user'),
(2, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `appointment_service`
--
ALTER TABLE `appointment_service`
  ADD PRIMARY KEY (`appointment_service_id`),
  ADD KEY `appointment_service_ibfk_2` (`appointment_id`),
  ADD KEY `appointment_service_ibfk_3` (`service_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stylist_id` (`stylist_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `schedule_ibfk_1` (`stylist_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `stylist`
--
ALTER TABLE `stylist`
  ADD PRIMARY KEY (`stylist_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`) USING BTREE;

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `appointment_service`
--
ALTER TABLE `appointment_service`
  MODIFY `appointment_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `stylist`
--
ALTER TABLE `stylist`
  MODIFY `stylist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`stylist_id`) REFERENCES `stylist` (`stylist_id`);

--
-- Constraints for table `appointment_service`
--
ALTER TABLE `appointment_service`
  ADD CONSTRAINT `appointment_service_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  ADD CONSTRAINT `appointment_service_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`stylist_id`) REFERENCES `stylist` (`stylist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_4` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`stylist_id`) REFERENCES `stylist` (`stylist_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
