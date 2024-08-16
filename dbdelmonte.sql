-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2024 at 08:31 AM
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
-- Database: `dbdelmonte`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_apply_position`
--

CREATE TABLE `tbl_apply_position` (
  `apply_position_id` int(20) NOT NULL,
  `apply_position_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consent`
--

CREATE TABLE `tbl_consent` (
  `consent_id` int(11) NOT NULL,
  `personal_info_id` int(11) DEFAULT NULL,
  `subscribe_to_email_updates` tinyint(1) DEFAULT NULL,
  `data_privacy_consent` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `courses_id` int(20) NOT NULL,
  `courses_name` varchar(250) NOT NULL,
  `courses_graduate` enum('Secondary Education','Tertiary Education','Graduate Education') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_educational_background`
--

CREATE TABLE `tbl_educational_background` (
  `educational_background_id` int(11) NOT NULL,
  `personal_info_id` int(11) DEFAULT NULL,
  `institution` varchar(255) NOT NULL,
  `courses_id` int(20) NOT NULL,
  `date_of_graduation` date DEFAULT NULL,
  `prc_license_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employment_history`
--

CREATE TABLE `tbl_employment_history` (
  `employment_history_id` int(20) NOT NULL,
  `personal_info_id` int(11) NOT NULL,
  `employment_position_name` varchar(250) NOT NULL,
  `employment_company_name` varchar(250) NOT NULL,
  `employment_start_date` date NOT NULL,
  `employment_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personal_information`
--

CREATE TABLE `tbl_personal_information` (
  `personal_info_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(50) NOT NULL,
  `alternate_contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `alternate_email` varchar(255) DEFAULT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` enum('Male','Female','Other') DEFAULT NULL,
  `sss_number` varchar(50) DEFAULT NULL,
  `tin_number` varchar(50) DEFAULT NULL,
  `philhealth_number` varchar(50) DEFAULT NULL,
  `pagibig_number` varchar(50) DEFAULT NULL,
  `personal_password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_personal_information`
--

INSERT INTO `tbl_personal_information` (`personal_info_id`, `last_name`, `first_name`, `middle_name`, `contact_number`, `alternate_contact_number`, `email`, `alternate_email`, `present_address`, `permanent_address`, `date_of_birth`, `sex`, `sss_number`, `tin_number`, `philhealth_number`, `pagibig_number`, `personal_password`) VALUES
(0, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '0000-00-00', '', 'admin', 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position_applied`
--

CREATE TABLE `tbl_position_applied` (
  `position_applied_id` int(11) NOT NULL,
  `personal_info_id` int(11) DEFAULT NULL,
  `apply_position_id` int(20) NOT NULL,
  `date_time_applied` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_apply_position`
--
ALTER TABLE `tbl_apply_position`
  ADD PRIMARY KEY (`apply_position_id`);

--
-- Indexes for table `tbl_consent`
--
ALTER TABLE `tbl_consent`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `personal_info_id` (`personal_info_id`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`courses_id`);

--
-- Indexes for table `tbl_educational_background`
--
ALTER TABLE `tbl_educational_background`
  ADD PRIMARY KEY (`educational_background_id`),
  ADD KEY `personal_info_id` (`personal_info_id`),
  ADD KEY `courses_id` (`courses_id`);

--
-- Indexes for table `tbl_employment_history`
--
ALTER TABLE `tbl_employment_history`
  ADD PRIMARY KEY (`employment_history_id`),
  ADD KEY `personal_info_id` (`personal_info_id`);

--
-- Indexes for table `tbl_personal_information`
--
ALTER TABLE `tbl_personal_information`
  ADD PRIMARY KEY (`personal_info_id`);

--
-- Indexes for table `tbl_position_applied`
--
ALTER TABLE `tbl_position_applied`
  ADD PRIMARY KEY (`position_applied_id`),
  ADD KEY `personal_info_id` (`personal_info_id`),
  ADD KEY `apply_position_id` (`apply_position_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
