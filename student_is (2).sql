-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 05:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_is`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `attendance_status` enum('PRESENT','EXCUSED','ABSENT') DEFAULT NULL,
  `attendance_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `attendance_status`, `attendance_date`, `student_id`) VALUES
(1, 'PRESENT', '2024-03-13 04:09:23', 42),
(2, 'ABSENT', '2024-03-13 04:09:23', 38),
(3, 'EXCUSED', '2024-03-13 08:17:10', 38),
(4, 'ABSENT', '2024-03-13 01:20:49', 42),
(5, 'PRESENT', '2024-03-13 02:45:08', 42),
(6, 'PRESENT', '2024-03-13 03:55:54', 48),
(7, 'EXCUSED', '2024-03-13 03:56:03', 48),
(8, 'ABSENT', '2024-03-13 03:56:17', 48),
(10, 'EXCUSED', '2024-03-18 02:33:56', 56);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `department`) VALUES
(1, 'IT', 'SOECS/CSIT'),
(2, 'CS', 'SOECS/CSIT');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `mobile`, `course_id`) VALUES
(56, 'test', 'test@gmail.com', '12345678', 2),
(60, 'test2', 'test2@gmail.com', '12345678', 2);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_lists_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_lists`
--

CREATE TABLE `subject_lists` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `create_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `create_datetime`) VALUES
(1, 'shaira', 'shaira@gmail.com', '482a53a7536571834cfa06881073227b', '2023-12-12 03:48:13'),
(2, 'lee', 'lee@gmail.com', 'b0f8b49f22c718e9924f5b1165111a67', '2023-12-12 03:51:00'),
(3, 'shin', 'shin@gmail.com', 'e3a93ca5b9c8954839801fa8b8d1fc87', '2023-12-17 06:19:02'),
(4, 'sleep', 'sleep@gmail.com', '5f9e9acea6e6f70a49833fa2f2c784ec', '2023-12-17 10:32:19'),
(5, 'galan', 'galan@gmail.com', '62bd4e38d560f96d54828533bb79b7c2', '2023-12-18 03:49:37'),
(6, 'admin', 'admin@gmail.com', 'a66abb5684c45962d887564f08346e8d', '2023-12-27 02:45:31'),
(7, 'sleep', 'sleep@gmail.com', 'f1ce75417f0bc6eefaba70981f997cc6', '2024-01-08 07:45:49'),
(8, 'one', 'one@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2024-02-19 08:32:50'),
(9, 'Asia', 'asia@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2024-02-19 08:39:48'),
(10, 'Criteria', 'criteria@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2024-02-19 08:42:24'),
(11, 'tester', 'tester@gmail.com', 'cb28e00ef51374b841fb5c189b2b91c9', '2024-02-19 08:45:46'),
(12, 'arvin1234567', 'arvin@gmail.com', 'cb4f762a1f5728a8908c247f0aa0905b', '2024-02-19 09:37:51'),
(13, 'kyle', 'kyle@gmail.com', '63e753cfda5a21878074019d26fdc55a', '2024-02-19 11:32:28'),
(14, 'lahorra', 'lahorra@gmail.com', '07388aae2ebc0fb5310de6ea9878d8fe', '2024-02-19 12:10:48'),
(15, 'lee1234', 'lee@gmail.com', '736fea6de745fc82547f0078435b06a3', '2024-03-11 09:19:52'),
(16, 'lee1234', 'lee@gmail.com', '4ae45a8977431d7f5e2c5c3eb8801db0', '2024-03-11 09:20:12'),
(17, '[value-2]', '[value-3]', '[value-4]', '0000-00-00 00:00:00'),
(18, 'leelee', 'leelee@gmail.com', 'f1ce75417f0bc6eefaba70981f997cc6', '2024-03-11 09:46:50'),
(19, 'test7', 'test7@gmail.com', 'password1234', '2024-03-11 09:47:45'),
(20, '[value-2]', '[value-3]', '[value-4]', '0000-00-00 00:00:00'),
(21, 'shai123', 'shai@gmail.com', 'shai123456', '2024-03-11 11:46:42'),
(22, 'shai456', 'shai@gmail.com', 'e979b9697a1a6b51c8dc993139ab7070', '2024-03-11 11:47:22'),
(23, 'shin123', 'shin@gmail.com', 'de5308be7044d8f9aab6f3b533ee8110', '2024-03-11 12:15:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_lists_id` (`subject_lists_id`);

--
-- Indexes for table `subject_lists`
--
ALTER TABLE `subject_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_lists`
--
ALTER TABLE `subject_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`subject_lists_id`) REFERENCES `subject_lists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
