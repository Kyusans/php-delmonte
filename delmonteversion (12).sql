-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2025 at 02:51 AM
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
-- Database: `delmonteversion`
--

-- --------------------------------------------------------

--
-- Table structure for table `companyprofile`
--

CREATE TABLE `companyprofile` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ProductVariants` text DEFAULT NULL,
  `MainProducts` text DEFAULT NULL,
  `PineappleOperationSize` varchar(255) DEFAULT NULL,
  `PineappleOperationLocation` varchar(255) DEFAULT NULL,
  `ManufacturingPlantSize` varchar(255) DEFAULT NULL,
  `ManufacturingPlantCapacity` varchar(255) DEFAULT NULL,
  `EmployeeCount` int(11) DEFAULT NULL,
  `EmployeeLocationMindanao` int(11) DEFAULT NULL,
  `EmployeeLocationMetroManila` int(11) DEFAULT NULL,
  `LogoImagePath` varchar(255) DEFAULT NULL,
  `backgroundImage` varchar(255) NOT NULL,
  `Facebook` varchar(255) NOT NULL,
  `LinkedIn` varchar(255) NOT NULL,
  `hr_userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companyprofile`
--

INSERT INTO `companyprofile` (`id`, `CompanyName`, `Description`, `ProductVariants`, `MainProducts`, `PineappleOperationSize`, `PineappleOperationLocation`, `ManufacturingPlantSize`, `ManufacturingPlantCapacity`, `EmployeeCount`, `EmployeeLocationMindanao`, `EmployeeLocationMetroManila`, `LogoImagePath`, `backgroundImage`, `Facebook`, `LinkedIn`, `hr_userId`) VALUES
(1, 'Del Monte Philippines, Inc.', 'A leading producer of pineapple and other food products, operating the largest integrated pineapple operation in the world.', 'Pineapple products, juices, tomato-based products, condiments, pasta.', 'Pineapple products, tomato-based products, condiments, pasta', '25,000 hectares', 'Bukidnon, Misamis Oriental', '23-hectare complex', '700,000 tons of pineapple and papaya processed annually', 4000, 3600, 400, NULL, '', 'https://web.facebook.com/DelMonteCareersPH?_rdc=1&_rdr', 'https://www.linkedin.com/company/delmontephilippines/posts/?feedView=all', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl2fa`
--

CREATE TABLE `tbl2fa` (
  `email` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl2fa`
--

INSERT INTO `tbl2fa` (`email`, `code`, `expires_at`, `created_at`) VALUES
('ralp.pelino11@gmail.com', '602123', '2025-07-14 06:33:59', '2025-03-11 14:32:23'),
('rape.gallegos.coc@phinmaed.com', '206671', '2025-05-03 05:38:59', '2025-03-16 06:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl2fasetting`
--

CREATE TABLE `tbl2fasetting` (
  `setting_id` int(11) NOT NULL,
  `setting_everylogs` int(11) NOT NULL,
  `setting_days` int(11) DEFAULT NULL,
  `setting_email` varchar(255) NOT NULL,
  `setting_number` varchar(100) DEFAULT NULL,
  `last_verification` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl2fasetting`
--

INSERT INTO `tbl2fasetting` (`setting_id`, `setting_everylogs`, `setting_days`, `setting_email`, `setting_number`, `last_verification`) VALUES
(6, 0, NULL, 'ralp.pelino11@gmail.com', '09056548089', '2025-07-14 14:24:41'),
(7, 0, NULL, 'rape.gallegos.coc@phinmaed.com', NULL, '2025-05-03 13:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl2fa_verification`
--

CREATE TABLE `tbl2fa_verification` (
  `email` varchar(255) NOT NULL,
  `last_verification` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl2fa_verification`
--

INSERT INTO `tbl2fa_verification` (`email`, `last_verification`) VALUES
('ralphjangallegos@gmail.com', '2025-03-07 06:03:45'),
('rape.gallegos.coc@phinmaed.com', '2025-03-08 17:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblapplications`
--

CREATE TABLE `tblapplications` (
  `app_id` int(11) NOT NULL,
  `app_candId` int(11) DEFAULT NULL,
  `app_jobMId` int(20) NOT NULL,
  `app_branchId` int(11) NOT NULL,
  `app_datetime` datetime NOT NULL,
  `app_updatedAt` datetime DEFAULT NULL,
  `app_statusUpdate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblapplications`
--

INSERT INTO `tblapplications` (`app_id`, `app_candId`, `app_jobMId`, `app_branchId`, `app_datetime`, `app_updatedAt`, `app_statusUpdate`) VALUES
(1, 40, 17, 1, '2025-08-04 03:15:47', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblapplicationstatus`
--

CREATE TABLE `tblapplicationstatus` (
  `appS_id` int(50) NOT NULL,
  `appS_appId` int(50) NOT NULL,
  `appS_statusId` int(50) NOT NULL,
  `appS_hrId` int(11) DEFAULT NULL,
  `appS_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblapplicationstatus`
--

INSERT INTO `tblapplicationstatus` (`appS_id`, `appS_appId`, `appS_statusId`, `appS_hrId`, `appS_date`) VALUES
(1, 1, 1, NULL, '2025-08-04 03:15:47'),
(2, 1, 2, 1, '2025-08-11 02:53:59'),
(3, 1, 6, 1, '2025-08-11 02:54:18'),
(4, 1, 5, 1, '2025-08-11 02:54:34'),
(9, 1, 9, NULL, '2025-08-11 15:17:02');

--
-- Triggers `tblapplicationstatus`
--
DELIMITER $$
CREATE TRIGGER `notify_status_change` AFTER INSERT ON `tblapplicationstatus` FOR EACH ROW BEGIN
    DECLARE status_message TEXT;
    DECLARE interview_date VARCHAR(50);
    
    SET interview_date = COALESCE(
        (SELECT intsched_date 
         FROM tblinterviewschedule s
         JOIN tblapplications a ON s.intsched_jobId = a.app_jobMId 
         WHERE a.app_id = NEW.appS_appId
         ORDER BY s.intsched_date DESC
         LIMIT 1),
        'Not scheduled'
    );
    
    SET status_message = IF(
        (SELECT status_name FROM tblstatus WHERE status_id = NEW.appS_statusId) = 'Interview',
        CONCAT('You have been scheduled for an interview on ', 
               DATE_FORMAT(interview_date, '%M %d, %Y %l:%i %p'), '.'),
        CONCAT('Your application status has been updated to "', 
               (SELECT status_name FROM tblstatus WHERE status_id = NEW.appS_statusId),
               '".')
    );
    
    INSERT INTO tblnotifications 
    (notification_candId, notification_appId, notification_statusId, notification_message, notification_date)
    SELECT 
        app_candId,
        NEW.appS_appId,
        NEW.appS_statusId,
        status_message,
        NOW()
    FROM tblapplications 
    WHERE app_id = NEW.appS_appId;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblapprovalstatus`
--

CREATE TABLE `tblapprovalstatus` (
  `approvalS_id` int(11) NOT NULL,
  `approvalS_name` varchar(50) NOT NULL,
  `approvalS_hrId` int(11) DEFAULT NULL,
  `approvalS_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblapprovalstatus`
--

INSERT INTO `tblapprovalstatus` (`approvalS_id`, `approvalS_name`, `approvalS_hrId`, `approvalS_datetime`) VALUES
(1, 'Pending', NULL, NULL),
(2, 'Approved', NULL, NULL),
(3, 'Rejected', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbackgroundcheckcategory`
--

CREATE TABLE `tblbackgroundcheckcategory` (
  `backgroundC_id` int(11) NOT NULL,
  `backgroundC_name` varchar(50) NOT NULL,
  `backgroundC_hrId` int(11) DEFAULT NULL,
  `backgroundC_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbackgroundcheckcategory`
--

INSERT INTO `tblbackgroundcheckcategory` (`backgroundC_id`, `backgroundC_name`, `backgroundC_hrId`, `backgroundC_datetime`) VALUES
(1, 'Employment Check', NULL, NULL),
(2, 'Education Check', NULL, NULL),
(3, 'Character Reference', NULL, NULL),
(4, 'Credit Check', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbicheckresult`
--

CREATE TABLE `tblbicheckresult` (
  `biC_id` int(11) NOT NULL,
  `biC_bireportId` int(11) NOT NULL,
  `biC_categoryId` int(11) NOT NULL,
  `biC_details` varchar(255) NOT NULL,
  `biC_hrId` int(11) NOT NULL,
  `biC_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbireport`
--

CREATE TABLE `tblbireport` (
  `bireport_id` int(11) NOT NULL,
  `bireport_candId` int(11) NOT NULL,
  `bireport_statusId` int(11) NOT NULL,
  `bireport_recommendation` varchar(255) NOT NULL,
  `bireport _hrId` int(11) NOT NULL,
  `bireport_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbranch`
--

CREATE TABLE `tblbranch` (
  `branch_id` int(11) NOT NULL,
  `branch_location` varchar(100) NOT NULL,
  `branch_userId` int(11) NOT NULL,
  `branch_createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbranch`
--

INSERT INTO `tblbranch` (`branch_id`, `branch_location`, `branch_userId`, `branch_createdAt`) VALUES
(1, 'Bugo', 3, '2025-08-04 08:26:52'),
(2, 'Opol', 3, '2025-08-04 08:26:52'),
(3, 'Manila', 3, '2025-08-04 08:26:52'),
(4, 'Cebu', 3, '2025-08-04 08:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandconsent`
--

CREATE TABLE `tblcandconsent` (
  `cons_id` int(11) NOT NULL,
  `cons_candId` int(11) DEFAULT NULL,
  `cons_subscribetoemailupdates` tinyint(1) DEFAULT NULL,
  `cons_dataprivacyconsent` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandconsent`
--

INSERT INTO `tblcandconsent` (`cons_id`, `cons_candId`, `cons_subscribetoemailupdates`, `cons_dataprivacyconsent`) VALUES
(1, 8, 1, NULL),
(2, 9, 1, NULL),
(3, 11, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandeducbackground`
--

CREATE TABLE `tblcandeducbackground` (
  `educ_back_id` int(11) NOT NULL,
  `educ_canId` int(11) DEFAULT NULL,
  `educ_coursesId` int(20) NOT NULL,
  `educ_institutionId` int(20) NOT NULL,
  `educ_dategraduate` date NOT NULL,
  `educ_diploma_path` varchar(250) NOT NULL,
  `educ_createdAt` datetime DEFAULT NULL,
  `educ_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandeducbackground`
--

INSERT INTO `tblcandeducbackground` (`educ_back_id`, `educ_canId`, `educ_coursesId`, `educ_institutionId`, `educ_dategraduate`, `educ_diploma_path`, `educ_createdAt`, `educ_updatedAt`) VALUES
(6, 37, 48, 1484, '0000-00-00', '', NULL, NULL),
(11, 24, 46, 2422, '0000-00-00', '', '2025-07-12 11:10:13', NULL),
(13, 39, 132, 1476, '2025-07-02', 'diploma4.jpg', '2025-07-21 00:39:14', '2025-07-23 20:37:18'),
(24, 41, 102, 2435, '0000-00-00', '', '2025-07-23 21:46:02', NULL),
(25, 41, 135, 2436, '0000-00-00', '', '2025-07-23 21:46:02', NULL),
(26, 41, 49, 2436, '0000-00-00', '', '2025-07-23 21:46:02', NULL),
(27, 41, 48, 2437, '0000-00-00', '', '2025-07-23 21:46:02', NULL),
(29, 40, 49, 2422, '2024-07-12', 'secondaryEducation.jpg', '2025-07-24 14:04:56', '2025-07-24 14:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandeducpoints`
--

CREATE TABLE `tblcandeducpoints` (
  `candEduc_id` int(11) NOT NULL,
  `candEduc_educId` int(11) NOT NULL,
  `candEduc_appId` int(11) NOT NULL,
  `candEduc_points` int(20) DEFAULT NULL,
  `candEduc_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandeducpoints`
--

INSERT INTO `tblcandeducpoints` (`candEduc_id`, `candEduc_educId`, `candEduc_appId`, `candEduc_points`, `candEduc_datetime`) VALUES
(1, 17, 1, 11, '2025-08-04 03:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandemploymenthistory`
--

CREATE TABLE `tblcandemploymenthistory` (
  `empH_id` int(20) NOT NULL,
  `empH_candId` int(11) NOT NULL,
  `empH_positionName` varchar(250) DEFAULT NULL,
  `empH_responsibilities` varchar(250) DEFAULT NULL,
  `empH_companyName` varchar(250) DEFAULT NULL,
  `empH_startdate` varchar(100) DEFAULT NULL,
  `empH_enddate` varchar(100) DEFAULT NULL,
  `empH_createdAt` datetime DEFAULT NULL,
  `empH_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandemploymenthistory`
--

INSERT INTO `tblcandemploymenthistory` (`empH_id`, `empH_candId`, `empH_positionName`, `empH_responsibilities`, `empH_companyName`, `empH_startdate`, `empH_enddate`, `empH_createdAt`, `empH_updatedAt`) VALUES
(30, 37, 'Student Teacher Intern', 'Facilitated lessons in English, Mathematics, and Araling Panlipunan. Created engaging lesson plans and instructional materials. Assessed student learning and assisted in remedial instruction. Practiced effective classroom management strategies', 'Carmen Elementary School', 'January 2025 – May 2025', NULL, NULL, NULL),
(44, 24, 'Supplier Specialist', 'Orchestrated end-to-end logistical planning for diverse events, ranging from corporate conferences to social gatherings, ensuring seamless execution.\n\nManaged supplier sourcing, negotiation, and relationship management to secure optimal resources and', 'La Kreativ Events Organizing Services', '12/2024', '03/2025', '2025-07-12 11:10:13', '2025-07-21 10:55:21'),
(46, 24, 'Event Coordinator', 'Providing crucial support to the lead coordinator. Pre-event planning. Vendor coordination. On-site execution. Post-event follow-up. Managing logistics. Assisting with client communication. Ensuring timely vendor setups.', 'La Kreativ Events Organizing Services', '02/2022', '08/2024', '2025-07-21 10:59:00', NULL),
(51, 41, 'Youth Treasurer', '', 'Youth Quarry Organization', '2019-2020', NULL, '2025-07-23 21:46:02', NULL),
(52, 41, 'Army recervist', '', 'Army', '2022', NULL, '2025-07-23 21:46:02', NULL),
(55, 40, 'Student Intern', 'Assisted cooperating teachers in lesson planning, classroom management, and instructional delivery.. Conducted actual teaching sessions in accordance with the Department of Education\'s curriculum standards.. Developed teaching materials and facilitat', 'Bulua National High School - Cagayan de Oro City', 'August', 'October 2023', '2025-07-24 14:04:56', NULL),
(56, 40, 'Student Intern', 'Delivered daily classroom instruction to junior high school students under the guidance of a mentor teacher.. Applied varied teaching strategies to accommodate diverse learners.. Utilized educational technology tools for interactive learning.. Conduc', 'Kauswagan National High School - Cagayan de Oro City', 'January', 'March 2024', '2025-07-24 14:04:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandemppoints`
--

CREATE TABLE `tblcandemppoints` (
  `candEmp_id` int(11) NOT NULL,
  `candEmp_appId` int(11) NOT NULL,
  `candEmp_jworkId` int(11) NOT NULL,
  `candEmp_points` int(11) DEFAULT NULL,
  `candEmp_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandemppoints`
--

INSERT INTO `tblcandemppoints` (`candEmp_id`, `candEmp_appId`, `candEmp_jworkId`, `candEmp_points`, `candEmp_datetime`) VALUES
(1, 1, 16, 11, '2025-08-04 03:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidates`
--

CREATE TABLE `tblcandidates` (
  `cand_id` int(11) NOT NULL,
  `cand_lastname` varchar(255) NOT NULL,
  `cand_firstname` varchar(255) NOT NULL,
  `cand_middlename` varchar(255) DEFAULT NULL,
  `cand_contactNo` varchar(50) NOT NULL,
  `cand_alternatecontactNo` varchar(50) DEFAULT NULL,
  `cand_email` varchar(255) NOT NULL,
  `cand_google_id` varchar(255) DEFAULT NULL,
  `cand_alternateEmail` varchar(255) DEFAULT NULL,
  `cand_dateofBirth` date DEFAULT NULL,
  `cand_sex` enum('Male','Female','Other') DEFAULT NULL,
  `cand_sssNo` varchar(50) DEFAULT NULL,
  `cand_tinNo` varchar(50) DEFAULT NULL,
  `cand_philhealthNo` varchar(50) DEFAULT NULL,
  `cand_pagibigNo` varchar(50) DEFAULT NULL,
  `cand_password` varchar(250) NOT NULL,
  `cand_presentStreet` varchar(100) DEFAULT NULL,
  `cand_presentBarangay` varchar(100) DEFAULT NULL,
  `cand_presentCity` varchar(100) DEFAULT NULL,
  `cand_presentProvince` varchar(100) DEFAULT NULL,
  `cand_presentPostalCode` int(50) DEFAULT NULL,
  `cand_permanentStreet` varchar(100) DEFAULT NULL,
  `cand_permanentBarangay` varchar(100) DEFAULT NULL,
  `cand_permanentCity` varchar(100) DEFAULT NULL,
  `cand_permanentProvince` varchar(100) DEFAULT NULL,
  `cand_permanentPostalCode` int(50) DEFAULT NULL,
  `cand_createdDatetime` datetime DEFAULT NULL,
  `cand_updatedDatetime` datetime DEFAULT NULL,
  `cand_pinCode` varchar(50) NOT NULL,
  `cand_activeStatus` int(20) NOT NULL DEFAULT 0,
  `cand_userLevel` int(11) NOT NULL,
  `cand_profPic` varchar(100) NOT NULL,
  `cand_isEmployed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandidates`
--

INSERT INTO `tblcandidates` (`cand_id`, `cand_lastname`, `cand_firstname`, `cand_middlename`, `cand_contactNo`, `cand_alternatecontactNo`, `cand_email`, `cand_google_id`, `cand_alternateEmail`, `cand_dateofBirth`, `cand_sex`, `cand_sssNo`, `cand_tinNo`, `cand_philhealthNo`, `cand_pagibigNo`, `cand_password`, `cand_presentStreet`, `cand_presentBarangay`, `cand_presentCity`, `cand_presentProvince`, `cand_presentPostalCode`, `cand_permanentStreet`, `cand_permanentBarangay`, `cand_permanentCity`, `cand_permanentProvince`, `cand_permanentPostalCode`, `cand_createdDatetime`, `cand_updatedDatetime`, `cand_pinCode`, `cand_activeStatus`, `cand_userLevel`, `cand_profPic`, `cand_isEmployed`) VALUES
(24, 'Gallegos', 'Ralph Jan', 'Pelino', '09056548089', '09056548089', 'ralp.pelino11@gmail.com', NULL, 'ralphjanpelino1@gmail.com', '2001-11-08', 'Male', '', '123544', '23355', '466-', '$2y$10$obaOkyOtY84By2tRkIv8Oue9xzy95ixpm9pyTjITO.dKk6O1zxi9K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-06 06:13:50', NULL, '', 0, 1, '21004063.jpg', 0),
(36, 'Sacay', 'Grizon', NULL, '', NULL, 'grba.sacay.coc@phinmaed.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MfNpeYEVRRhQMfN4RUorN.UY7PTL17TpP6yDLiKLa86nzQj3/qhU.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-24 21:46:35', NULL, '', 0, 1, '', 0),
(37, 'Roaya', 'Francis Jake', 'Lumactod ', '', NULL, 'frlu.roaya.coc@phinmaed.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ohYxHGco8IIqfEEBWyeXaeGi2s.ilqTlGDZrmJa9BVKH6IHREYgvu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-26 09:23:08', NULL, '', 0, 1, '', 0),
(39, 'Macario', 'Jimboy', 'Sabido', '+63 090 565 4808', '+63 090 565 4878', 'rape.gallegos.coc@phinmaed.com', NULL, '', '2001-11-08', 'Male', NULL, NULL, NULL, NULL, '$2y$10$V7GXI99Z3N0.lO4zMgJXmeHG7Jz9rZ.MqejDIwq5Wq1PiYKWoCYlO', 'Ficoville', 'Bulua', 'Cagayan de Oro City', 'Misamis Oriental', 9000, '', '', '', '', 0, '2025-07-19 01:04:34', NULL, '', 0, 1, '', 0),
(40, 'Ruaya', 'Suzanne Gell', 'B', '+63 909 601 5541', '+63 909 601 5541', 'ralphjanpelino@gmail.com', NULL, '', '1990-10-17', 'Female', NULL, NULL, NULL, NULL, '$2y$10$DbI31rU8iIOc/teu8/QSY.D.nCZDBd6y6SdRzTI6SpUdkvgZxH9I.', 'P-3', 'San Isidro', 'Talakag', 'Bukidnon', 9000, '', '', '', '', 0, '2025-07-22 09:38:10', NULL, '', 0, 1, '', 0),
(41, 'Taba', 'Rhea Jean', 'B', '+63 090 909 0909', '+63 090 909 0909', 'ralphjangallegos11@gmail.com', NULL, '', '2006-12-07', 'Female', NULL, NULL, NULL, NULL, '$2y$10$VbV0Q6/GW1ocqzoK1FdzG.Xl73sygev5pKjwcSMM7ohk3E0o/0UrC', 'Zone 7, Acacia EXT', 'Carmen', 'Cagayan de Oro City', 'Misamis Oriental', 9000, '', '', '', '', 0, '2025-07-23 08:48:24', NULL, '', 0, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandknowledge`
--

CREATE TABLE `tblcandknowledge` (
  `canknow_id` int(11) NOT NULL,
  `canknow_canId` int(11) NOT NULL,
  `canknow_knowledgeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandknowledge`
--

INSERT INTO `tblcandknowledge` (`canknow_id`, `canknow_canId`, `canknow_knowledgeId`) VALUES
(1, 8, 1),
(7, 9, 1),
(8, 10, 1),
(9, 6, 3),
(11, 11, 3),
(16, 7, 1),
(17, 7, 7),
(18, 13, 9),
(19, 13, 10),
(20, 17, 11),
(21, 17, 4),
(23, 18, 15),
(24, 18, 14),
(25, 19, 1),
(26, 20, 4),
(27, 21, 13),
(28, 18, 4),
(29, 18, 16),
(35, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandknowpoints`
--

CREATE TABLE `tblcandknowpoints` (
  `candKnow_id` int(11) NOT NULL,
  `candKnow_appId` int(11) NOT NULL,
  `candKnow_perKId` int(11) NOT NULL,
  `candKnow_points` int(11) DEFAULT NULL,
  `candKnow_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcandlicense`
--

CREATE TABLE `tblcandlicense` (
  `license_id` int(11) NOT NULL,
  `license_number` int(50) NOT NULL,
  `license_canId` int(11) NOT NULL,
  `license_masterId` int(11) NOT NULL,
  `license_image` varchar(250) DEFAULT NULL,
  `license_createdAt` datetime DEFAULT NULL,
  `license_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcandlicensepoints`
--

CREATE TABLE `tblcandlicensepoints` (
  `candLic_id` int(11) NOT NULL,
  `candLic_appId` int(11) NOT NULL,
  `candLic_licenseId` int(11) NOT NULL,
  `candLic_points` int(11) DEFAULT NULL,
  `candLic_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcandresume`
--

CREATE TABLE `tblcandresume` (
  `canres_id` int(11) NOT NULL,
  `canres_candId` int(11) NOT NULL,
  `canres_file` varchar(255) NOT NULL,
  `canres_datetime` datetime NOT NULL,
  `canres_createdAt` datetime DEFAULT NULL,
  `canres_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandresume`
--

INSERT INTO `tblcandresume` (`canres_id`, `canres_candId`, `canres_file`, `canres_datetime`, `canres_createdAt`, `canres_updatedAt`) VALUES
(126, 37, 'Francis_Jake_Roaya_Resume.docx', '0000-00-00 00:00:00', NULL, NULL),
(130, 38, 'simo.docx', '0000-00-00 00:00:00', NULL, NULL),
(136, 24, 'resume.docx', '0000-00-00 00:00:00', NULL, NULL),
(142, 41, 'resumeRJ.docx', '0000-00-00 00:00:00', NULL, NULL),
(144, 40, 'zanne.pdf', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandskillpoints`
--

CREATE TABLE `tblcandskillpoints` (
  `candSkill_id` int(11) NOT NULL,
  `candSkill_appId` int(11) NOT NULL,
  `candSkill_jobSkillsId` int(11) NOT NULL,
  `candSkill_points` int(11) DEFAULT NULL,
  `candSkill_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandskillpoints`
--

INSERT INTO `tblcandskillpoints` (`candSkill_id`, `candSkill_appId`, `candSkill_jobSkillsId`, `candSkill_points`, `candSkill_datetime`) VALUES
(1, 1, 27, 0, '2025-08-04 03:15:47'),
(2, 1, 28, 0, '2025-08-04 03:15:47'),
(3, 1, 29, 0, '2025-08-04 03:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandskills`
--

CREATE TABLE `tblcandskills` (
  `skills_id` int(20) NOT NULL,
  `skills_candId` int(11) NOT NULL,
  `skills_name` varchar(50) NOT NULL,
  `skills_description` varchar(250) DEFAULT NULL,
  `skills_createdAt` datetime NOT NULL,
  `skills_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandskills`
--

INSERT INTO `tblcandskills` (`skills_id`, `skills_candId`, `skills_name`, `skills_description`, `skills_createdAt`, `skills_updatedAt`) VALUES
(138, 37, 'Lesson Planning and Facilitation', '', '2025-06-26 10:39:21', NULL),
(139, 37, 'Classroom and Behavior Management', '', '2025-06-26 10:39:21', NULL),
(140, 37, 'Student-Centered Teaching Approach', '', '2025-06-26 10:39:21', NULL),
(141, 37, 'Communication and Interpersonal Skills', '', '2025-06-26 10:39:21', NULL),
(142, 37, 'Educational Technology (Google Classroom, MS Offic', '', '2025-06-26 10:39:21', NULL),
(185, 24, 'Communication', NULL, '2025-07-12 11:10:13', NULL),
(186, 24, 'Leadership', NULL, '2025-07-12 11:10:13', NULL),
(187, 24, 'Time Management', NULL, '2025-07-12 11:10:13', NULL),
(188, 24, 'Coordination', NULL, '2025-07-12 11:10:13', NULL),
(189, 24, 'Attention to Detail', NULL, '2025-07-12 11:10:13', NULL),
(190, 24, 'Client Relations', NULL, '2025-07-12 11:10:13', NULL),
(191, 24, 'Programming', NULL, '2025-07-12 11:10:13', NULL),
(192, 24, 'Organizing Events', NULL, '2025-07-12 11:10:13', NULL),
(193, 24, 'Logistics Planning', NULL, '2025-07-12 11:10:13', NULL),
(194, 24, 'Vendor Management', NULL, '2025-07-12 11:10:13', NULL),
(195, 24, 'Inventory Management', NULL, '2025-07-12 11:10:13', NULL),
(196, 24, 'Event Setup and Breakdown', NULL, '2025-07-12 11:10:13', NULL),
(197, 24, 'Data Analysis', 'Strong understanding of statistical concepts (e.g., hypothesis testing, regression, correlation) and ability to apply them to real-world data.', '2025-07-18 23:01:53', NULL),
(198, 24, 'Microsoft Excel', 'Expert level skills for data cleaning, data analysis, pivot tables, VLOOKUP, and advanced formulas.', '2025-07-18 23:03:05', '2025-07-19 22:15:43'),
(199, 24, 'Data Manager', 'Proficiency in data manipulation tools like SQL and Python is crucial for efficiently extracting, cleaning, and transforming raw data into usable formats, eLearning and AI courseware..', '2025-07-19 14:15:02', '2025-07-19 22:41:49'),
(206, 41, 'Creativity', NULL, '2025-07-23 21:46:02', NULL),
(207, 41, 'Adaptability', NULL, '2025-07-23 21:46:02', NULL),
(214, 40, 'Educational Technology (e.g., Google Classroom, Po', NULL, '2025-07-24 14:04:56', NULL),
(215, 40, 'Communication and Interpersonal Skills', NULL, '2025-07-24 14:04:56', NULL),
(216, 40, 'Time Management', NULL, '2025-07-24 14:04:56', NULL),
(217, 40, 'Student Engagement', NULL, '2025-07-24 14:04:56', NULL),
(218, 40, 'Lesson Planning and Instruction', NULL, '2025-07-24 14:04:56', NULL),
(219, 40, 'Classroom Management', NULL, '2025-07-24 14:04:56', NULL),
(221, 39, 'Project management', 'Managing business with have a multiple project', '2025-08-12 22:14:32', NULL),
(224, 39, 'Business analysis', 'Analyze data of the any business', '2025-08-12 22:38:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandtraining`
--

CREATE TABLE `tblcandtraining` (
  `training_id` int(20) NOT NULL,
  `training_candId` int(20) NOT NULL,
  `training_name` varchar(20) NOT NULL,
  `training_image` varchar(50) NOT NULL,
  `training_createdAt` datetime DEFAULT NULL,
  `training_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandtraining`
--

INSERT INTO `tblcandtraining` (`training_id`, `training_candId`, `training_name`, `training_image`, `training_createdAt`, `training_updatedAt`) VALUES
(11, 37, 'Innovative Strategie', '', NULL, NULL),
(12, 37, 'Campus Teaching Demo', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandtrainpoints`
--

CREATE TABLE `tblcandtrainpoints` (
  `candTrain_id` int(11) NOT NULL,
  `candTrain_appId` int(11) NOT NULL,
  `candTrain_trngId` int(11) NOT NULL,
  `candTrain_points` int(11) DEFAULT NULL,
  `candTrain_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandtrainpoints`
--

INSERT INTO `tblcandtrainpoints` (`candTrain_id`, `candTrain_appId`, `candTrain_trngId`, `candTrain_points`, `candTrain_datetime`) VALUES
(1, 1, 25, NULL, '2025-08-04 03:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblcolorstatus`
--

CREATE TABLE `tblcolorstatus` (
  `colorS_id` int(11) NOT NULL,
  `colorS_name` varchar(50) NOT NULL,
  `colorS_description` varchar(50) NOT NULL,
  `colorS_hrId` int(11) DEFAULT NULL,
  `colorS_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcolorstatus`
--

INSERT INTO `tblcolorstatus` (`colorS_id`, `colorS_name`, `colorS_description`, `colorS_hrId`, `colorS_datetime`) VALUES
(1, 'Positive', 'No Adverse Findings', NULL, NULL),
(2, 'Negative', 'With Adverse Findings', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcourses`
--

CREATE TABLE `tblcourses` (
  `courses_id` int(20) NOT NULL,
  `courses_name` varchar(250) DEFAULT NULL,
  `courses_coursecategoryId` int(20) DEFAULT NULL,
  `courses_courseTypeId` int(11) DEFAULT NULL,
  `courses_hrId` int(11) DEFAULT NULL,
  `courses_datetime` datetime DEFAULT NULL,
  `courses_passpercentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourses`
--

INSERT INTO `tblcourses` (`courses_id`, `courses_name`, `courses_coursecategoryId`, `courses_courseTypeId`, `courses_hrId`, `courses_datetime`, `courses_passpercentage`) VALUES
(23, 'Bachelor of Arts (AB) in English', 5, 2, NULL, NULL, 60),
(24, 'Bachelor of Arts (AB) in Filipino', 5, 2, NULL, NULL, 60),
(25, 'Bachelor of Arts (AB) in History', 5, 2, NULL, NULL, 60),
(26, 'Bachelor of Arts (AB) in Philosophy', 5, 2, NULL, NULL, 60),
(27, 'Bachelor of Arts (AB) in Political Science', 5, 2, NULL, NULL, 60),
(28, 'Bachelor of Arts (AB) in Psychology', 5, 2, NULL, NULL, 60),
(29, 'Bachelor of Fine Arts (BFA) in Painting', 5, 2, NULL, NULL, 60),
(30, 'Bachelor of Fine Arts (BFA) in Sculpture', 5, 2, NULL, NULL, 60),
(31, 'Bachelor of Fine Arts (BFA) in Graphic Design', 5, 2, NULL, NULL, 60),
(32, 'Bachelor of Fine Arts (BFA) in Photography', 5, 2, NULL, NULL, 60),
(33, 'Bachelor of Music (BM) in Performance', 5, 2, NULL, NULL, 60),
(34, 'Bachelor of Music (BM) in Music Education', 5, 2, NULL, NULL, 60),
(35, 'Bachelor of Music (BM) in Music Therapy', 5, 2, NULL, NULL, 60),
(36, 'Bachelor of Science in Business Administration (BSBA) in Accounting', 1, 2, NULL, NULL, 60),
(37, 'Bachelor of Science in Business Administration (BSBA) in Business Management', 1, 2, NULL, NULL, 60),
(38, 'Bachelor of Science in Business Administration (BSBA) in Entrepreneurship', 1, 2, NULL, NULL, 60),
(39, 'Bachelor of Science in Business Administration (BSBA) in Finance', 1, 2, NULL, NULL, 60),
(40, 'Bachelor of Science in Business Administration (BSBA) in Human Resource Management', 1, 2, NULL, NULL, 60),
(41, 'Bachelor of Science in Business Administration (BSBA) in Marketing', 1, 2, NULL, NULL, 60),
(42, 'Bachelor of Science in Business Administration (BSBA) in Operations Management', 1, 2, NULL, NULL, 60),
(43, 'Bachelor of Science in Entrepreneurship (BSE)', 1, 2, NULL, NULL, 60),
(44, 'Bachelor of Science in Management (BSM)', 1, 2, NULL, NULL, 60),
(45, 'Bachelor of Science in Computer Science (BSCS)', 18, 2, NULL, NULL, 60),
(46, 'Bachelor of Science in Information Technology (BSIT)', 18, 2, NULL, NULL, 60),
(47, 'Bachelor of Science in Information Systems (BSIS)', 18, 2, NULL, NULL, 60),
(48, 'Bachelor of Elementary Education (BEEd)', 4, 2, NULL, NULL, 60),
(49, 'Bachelor of Secondary Education (BSEd) in English', 4, 2, NULL, NULL, 60),
(50, 'Bachelor of Secondary Education (BSEd) in Filipino', 4, 2, NULL, NULL, 60),
(51, 'Bachelor of Secondary Education (BSEd) in Mathematics', 4, 2, NULL, NULL, 60),
(52, 'Bachelor of Secondary Education (BSEd) in Science', 4, 2, NULL, NULL, 60),
(53, 'Bachelor of Secondary Education (BSEd) in Social Studies', 4, 2, NULL, NULL, 60),
(54, 'Bachelor of Physical Education (BPE)', 4, 2, NULL, NULL, 60),
(55, 'Bachelor of Special Needs Education (BSNEd)', 4, 2, NULL, NULL, 60),
(56, 'Bachelor of Science in Civil Engineering (BSCE)', 2, 2, NULL, NULL, 60),
(57, 'Bachelor of Science in Computer Engineering (BSCoE)', 2, 2, NULL, NULL, 60),
(58, 'Bachelor of Science in Electrical Engineering (BSEE)', 2, 2, NULL, NULL, 60),
(59, 'Bachelor of Science in Electronics Engineering (BSECE)', 2, 2, NULL, NULL, 60),
(60, 'Bachelor of Science in Mechanical Engineering (BSME)', 2, 2, NULL, NULL, 60),
(61, 'Bachelor of Science in Industrial Engineering (BSIE)', 2, 2, NULL, NULL, 60),
(83, 'Bachelor of Science in Nursing (BSN)', 3, 2, NULL, NULL, 60),
(84, 'Bachelor of Science in Medical Technology (BSMT)', 3, 2, NULL, NULL, 60),
(85, 'Bachelor of Science in Pharmacy (BSPharm)', 3, 2, NULL, NULL, 60),
(86, 'Bachelor of Science in Physical Therapy (BSPT)', 3, 2, NULL, NULL, 60),
(87, 'Bachelor of Science in Occupational Therapy (BSOT)', 3, 2, NULL, NULL, 60),
(91, 'Bachelor of Science in Hospitality Management (BSHM)', 9, 2, NULL, NULL, 60),
(92, 'Bachelor of Science in Tourism Management (BSTM)', 9, 2, NULL, NULL, 60),
(93, 'Bachelor of Science in Biology (BSBio)', 19, 2, NULL, NULL, 60),
(94, 'Bachelor of Science in Chemistry (BSChem)', 19, 2, NULL, NULL, 60),
(95, 'Bachelor of Science in Mathematics (BSMath)', 19, 2, NULL, NULL, 60),
(96, 'Bachelor of Science in Physics (BSPhy)', 19, 2, NULL, NULL, 60),
(97, 'Bachelor of Science in Statistics (BSStat)', 19, 2, NULL, NULL, 60),
(98, 'Bachelor of Science in Economics (BSEcon)', 11, 2, NULL, NULL, 60),
(99, 'Bachelor of Science in Psychology (BSPsy)', 11, 2, NULL, NULL, 60),
(100, 'Bachelor of Science in Sociology (BSSoc)', 11, 2, NULL, NULL, 60),
(101, 'Bachelor of Science in Anthropology (BSAnthro)', 11, 2, NULL, NULL, 60),
(102, 'Bachelor of Science in Criminology (BSCrim)', 20, 2, NULL, NULL, 60),
(103, 'Bachelor of Science in Environmental Science (BSES)', 20, 2, NULL, NULL, 60),
(104, 'Bachelor of Science in Forestry (BSFor)', 20, 2, NULL, NULL, 60),
(105, 'Bachelor of Science in Geology (BSGeo)', 20, 2, NULL, NULL, 60),
(106, 'Bachelor of Science in Marine Biology (BSMB)', 20, 2, NULL, NULL, 60),
(107, 'Bachelor of Science in Agriculture (BSA)', 21, 2, NULL, NULL, 60),
(108, 'Bachelor of Science in Agricultural Business (BSAB)', 21, 2, NULL, NULL, 60),
(109, 'Bachelor of Science in Agricultural Economics (BSAE)', 21, 2, NULL, NULL, 60),
(110, 'Bachelor of Science in Agronomy (BSAgr)', 21, 2, NULL, NULL, 60),
(111, 'Bachelor of Science in Animal Science (BSAS)', 21, 2, NULL, NULL, 60),
(112, 'Bachelor of Science in Entomology (BSEnt)', 21, 2, NULL, NULL, 60),
(113, 'Bachelor of Science Criminal', 4, 2, NULL, NULL, 60),
(118, 'Bachelor of Science Criminal', 22, 4, NULL, NULL, 60),
(119, 'Bachelor of Science Programmer', 18, 2, NULL, NULL, 60),
(121, 'Bachelor of Programming', 18, 2, NULL, NULL, 60),
(122, 'Bachelor of Make Up', 1, 2, NULL, NULL, 60),
(132, 'Bachelor of Science in Agribusiness Management', 1, 2, NULL, NULL, 50),
(135, 'Senior High School', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcoursescategory`
--

CREATE TABLE `tblcoursescategory` (
  `course_categoryId` int(20) NOT NULL,
  `course_categoryName` varchar(250) NOT NULL,
  `course_categoryhrId` int(11) DEFAULT NULL,
  `course_categorydatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcoursescategory`
--

INSERT INTO `tblcoursescategory` (`course_categoryId`, `course_categoryName`, `course_categoryhrId`, `course_categorydatetime`) VALUES
(1, 'Business and Management', NULL, NULL),
(2, 'Engineering', NULL, NULL),
(3, 'Health Sciences', NULL, NULL),
(4, 'Education', NULL, NULL),
(5, 'Arts and Humanities', NULL, NULL),
(6, 'Sciences', NULL, NULL),
(7, 'Law and Criminal Justice', NULL, NULL),
(8, 'Agriculture and Veterinary Sciences', NULL, NULL),
(9, 'Hospitality and Tourism', NULL, NULL),
(10, 'Media and Design', NULL, NULL),
(11, 'Social Sciences', NULL, NULL),
(12, 'Maritime Studies', NULL, NULL),
(13, 'Sports and Physical Education', NULL, NULL),
(14, 'Theology and Religious Studies', NULL, NULL),
(15, 'Language and Literature', NULL, NULL),
(16, 'Vocational and Technical Courses', NULL, NULL),
(17, 'Specialized and Emerging Fields', NULL, NULL),
(18, 'Computer Science and Information Technology', NULL, NULL),
(19, 'Math and Sciences', NULL, NULL),
(20, 'Other Programs', NULL, NULL),
(21, 'Agriculture', NULL, NULL),
(22, 'Crim', NULL, NULL),
(23, 'BSIT', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcoursetype`
--

CREATE TABLE `tblcoursetype` (
  `crs_type_id` int(11) NOT NULL,
  `crs_type_name` varchar(100) NOT NULL,
  `crs_type_hrId` int(11) DEFAULT NULL,
  `crs_type_datetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcoursetype`
--

INSERT INTO `tblcoursetype` (`crs_type_id`, `crs_type_name`, `crs_type_hrId`, `crs_type_datetime`) VALUES
(1, 'Secondary Education', NULL, NULL),
(2, 'Tertiary Education', NULL, NULL),
(3, 'Graduate Education', NULL, NULL),
(4, 'No Education', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblexam`
--

CREATE TABLE `tblexam` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(50) NOT NULL,
  `exam_typeId` int(11) NOT NULL,
  `exam_jobMId` int(11) DEFAULT NULL,
  `exam_isGeneral` tinyint(1) NOT NULL DEFAULT 0,
  `exam_duration` int(11) NOT NULL,
  `exam_createdAt` date NOT NULL,
  `exam_updatedAt` date NOT NULL,
  `exam_hrId` int(11) DEFAULT NULL,
  `exam_isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexam`
--

INSERT INTO `tblexam` (`exam_id`, `exam_name`, `exam_typeId`, `exam_jobMId`, `exam_isGeneral`, `exam_duration`, `exam_createdAt`, `exam_updatedAt`, `exam_hrId`, `exam_isActive`) VALUES
(1, 'General Exam mo to', 1, NULL, 1, 1, '2024-10-01', '2024-10-19', NULL, 0),
(2, 'Production Supervisor', 2, 1, 0, 30, '2024-10-02', '2025-01-08', NULL, 0),
(3, 'Management', 2, 12, 0, 60, '2024-10-19', '2025-02-24', NULL, 0),
(4, 'Developing', 2, 10, 0, 30, '2024-10-24', '2024-10-24', NULL, 0),
(5, 'Analysis', 2, 13, 0, 30, '2024-10-24', '2024-12-08', NULL, 0),
(6, 'Secretary exam', 2, 14, 0, 1, '2024-10-24', '2024-10-24', NULL, 0),
(7, 'Accounting', 2, 16, 0, 1, '2024-12-03', '2024-12-08', NULL, 0),
(8, 'Marketing', 2, 3, 0, 30, '2024-12-08', '2024-12-08', NULL, 0),
(9, 'Business', 2, 17, 0, 60, '2025-01-08', '2025-03-12', NULL, 0),
(10, 'Untitled Exam', 2, 18, 0, 120, '2025-01-09', '2025-01-09', NULL, 0),
(11, 'Production Supervisor', 2, 19, 0, 60, '2025-03-11', '2025-03-11', NULL, 0),
(12, 'Untitled Exam', 2, 20, 0, 120, '2025-06-01', '2025-06-01', NULL, 0),
(13, 'Untitled Exam', 2, 21, 0, 120, '2025-06-26', '2025-06-26', NULL, 0),
(14, 'Untitled Exam', 2, 22, 0, 120, '2025-07-04', '2025-07-04', NULL, 0),
(15, 'Untitled Exam', 2, 23, 0, 120, '2025-07-19', '2025-07-19', NULL, 0),
(16, 'Untitled Exam', 2, 24, 0, 120, '2025-07-24', '2025-07-24', NULL, 0),
(17, 'Untitled Exam', 2, 25, 0, 120, '2025-07-24', '2025-07-24', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamcandidateanswer`
--

CREATE TABLE `tblexamcandidateanswer` (
  `examcandA_id` int(11) NOT NULL,
  `examcandA_resultId` int(11) NOT NULL,
  `examcandA_questionId` int(11) NOT NULL,
  `examcandA_choiceId` int(11) DEFAULT NULL,
  `examcandA_essay` text DEFAULT NULL,
  `examcandA_pointsEarned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamcandidateanswer`
--

INSERT INTO `tblexamcandidateanswer` (`examcandA_id`, `examcandA_resultId`, `examcandA_questionId`, `examcandA_choiceId`, `examcandA_essay`, `examcandA_pointsEarned`) VALUES
(19, 1, 1, 5, NULL, 0),
(20, 1, 2, 10, NULL, 5),
(21, 1, 5, 21, NULL, 0),
(22, 1, 7, 31, NULL, 0),
(23, 1, 45, 211, NULL, 5),
(24, 1, 46, 213, NULL, 0),
(25, 1, 47, 220, NULL, 0),
(26, 1, 48, 223, NULL, 5),
(27, 1, 49, 228, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamchoices`
--

CREATE TABLE `tblexamchoices` (
  `examC_id` int(11) NOT NULL,
  `examC_questionId` int(11) NOT NULL,
  `examC_text` varchar(255) NOT NULL,
  `examC_isCorrect` tinyint(1) NOT NULL,
  `examC_hrId` int(11) DEFAULT NULL,
  `examC_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamchoices`
--

INSERT INTO `tblexamchoices` (`examC_id`, `examC_questionId`, `examC_text`, `examC_isCorrect`, `examC_hrId`, `examC_datetime`) VALUES
(5, 1, 'Standard Query Language', 0, NULL, NULL),
(6, 1, 'Simple Query Language', 0, NULL, NULL),
(7, 1, 'Structured Query Language', 1, NULL, NULL),
(8, 1, 'System Query Language', 0, NULL, NULL),
(9, 2, 'Stack', 0, NULL, NULL),
(10, 2, 'Queue', 1, NULL, NULL),
(11, 2, 'Linked List', 0, NULL, NULL),
(12, 2, 'Binary Tree', 0, NULL, NULL),
(21, 5, 'MySQL', 0, NULL, NULL),
(22, 5, 'PostgreSQL', 0, NULL, NULL),
(23, 5, 'MongoDB', 1, NULL, NULL),
(24, 5, 'SQL Server', 0, NULL, NULL),
(29, 7, 'git commit', 0, NULL, NULL),
(30, 7, 'git checkout', 0, NULL, NULL),
(31, 7, 'git merge', 0, NULL, NULL),
(32, 7, 'git branch', 1, NULL, NULL),
(41, 11, 'const', 0, NULL, NULL),
(42, 11, 'let', 1, NULL, NULL),
(43, 11, 'var', 0, NULL, NULL),
(44, 11, 'function', 0, NULL, NULL),
(45, 12, 'GET', 0, NULL, NULL),
(46, 12, 'POST', 1, NULL, NULL),
(47, 12, 'DELETE', 0, NULL, NULL),
(48, 12, 'PUT', 0, NULL, NULL),
(49, 13, 'O(log n)', 1, NULL, NULL),
(50, 13, 'O(n)', 0, NULL, NULL),
(51, 13, 'O(1)', 0, NULL, NULL),
(52, 13, 'O(n log n', 0, NULL, NULL),
(53, 14, 'O(n)', 0, NULL, NULL),
(54, 14, 'O(log n)', 1, NULL, NULL),
(55, 14, 'O(n²)', 0, NULL, NULL),
(56, 14, 'O(1)', 0, NULL, NULL),
(57, 15, 'Increase redundancy', 0, NULL, NULL),
(58, 15, 'Optimize query performance', 0, NULL, NULL),
(59, 15, 'Eliminate duplicate data and ensure data integrity', 1, NULL, NULL),
(60, 15, 'Decrease disk storage requirements', 0, NULL, NULL),
(61, 16, 'To select all records that match from both tables', 0, NULL, NULL),
(62, 16, 'To select only the records that do not match from either table', 0, NULL, NULL),
(63, 16, 'To select all records from the left table and only the matched records from the right table', 1, NULL, NULL),
(64, 16, 'To select all records from the right table and only the matched records from the left table', 0, NULL, NULL),
(65, 17, 'Mean', 0, NULL, NULL),
(66, 17, 'Mode', 0, NULL, NULL),
(67, 17, 'Median', 1, NULL, NULL),
(68, 17, 'Standard deviation', 0, NULL, NULL),
(69, 18, 'To sort the data in descending order', 0, NULL, NULL),
(70, 18, 'To combine rows that have the same values into summary rows', 1, NULL, NULL),
(71, 18, 'To filter the results based on a condition', 0, NULL, NULL),
(72, 18, 'To limit the number of rows returned', 0, NULL, NULL),
(73, 19, 'Making executive decisions', 0, NULL, NULL),
(74, 19, 'Managing office correspondence and scheduling appointments', 1, NULL, NULL),
(75, 19, 'Overseeing company finances', 0, NULL, NULL),
(76, 19, 'Hiring new employees', 0, NULL, NULL),
(77, 20, 'Using all capital letters to emphasize points', 0, NULL, NULL),
(78, 20, 'Addressing the recipient by their first name only', 0, NULL, NULL),
(79, 20, 'Using a clear and concise subject line', 1, NULL, NULL),
(80, 20, 'Avoiding formal salutations and signatures', 0, NULL, NULL),
(81, 21, 'Complete the easiest tasks first to reduce workload quickly', 0, NULL, NULL),
(82, 21, 'Handle urgent and important tasks first, followed by less urgent tasks', 1, NULL, NULL),
(83, 21, 'Delay important tasks in favor of multiple smaller tasks', 0, NULL, NULL),
(84, 21, 'Only work on tasks assigned directly by senior management', 0, NULL, NULL),
(85, 22, 'Accounts Payable', 0, NULL, NULL),
(86, 22, 'Cash', 1, NULL, NULL),
(87, 22, 'Revenue', 0, NULL, NULL),
(88, 22, 'Owner’s Equity', 0, NULL, NULL),
(89, 23, 'Revenue = Expenses + Equity', 0, NULL, NULL),
(90, 23, 'Assets = Liabilities + Equity', 1, NULL, NULL),
(91, 23, 'Assets = Revenue - Liabilities', 0, NULL, NULL),
(92, 23, 'Liabilities = Assets + Equity', 0, NULL, NULL),
(93, 24, 'Income Statement', 0, NULL, NULL),
(94, 24, 'Cash Flow Statement', 1, NULL, NULL),
(95, 24, 'Balance Sheet', 0, NULL, NULL),
(96, 24, 'Statement of Retained Earnings', 0, NULL, NULL),
(101, 26, 'Search Engine Optimization', 1, NULL, NULL),
(102, 26, 'Social Engagement Optimization', 0, NULL, NULL),
(103, 26, 'Strategic Email Outreach', 0, NULL, NULL),
(104, 26, 'Sales and Events Organization', 0, NULL, NULL),
(105, 27, 'Instagram', 0, NULL, NULL),
(106, 27, 'LinkedIn', 1, NULL, NULL),
(107, 27, 'Snapchat', 0, NULL, NULL),
(108, 27, 'TikTok', 0, NULL, NULL),
(109, 28, 'To create graphic designs', 0, NULL, NULL),
(110, 28, 'To track customer interactions and sales', 1, NULL, NULL),
(111, 28, 'To schedule social media posts', 0, NULL, NULL),
(112, 28, 'To analyze competitors\' websites', 0, NULL, NULL),
(113, 29, 'Number of emails sent', 0, NULL, NULL),
(114, 29, 'Click-through rate (CTR)', 1, NULL, NULL),
(115, 29, 'Design of the email', 0, NULL, NULL),
(116, 29, 'Length of the subject line', 0, NULL, NULL),
(121, 25, 'Increase brand awareness', 1, NULL, NULL),
(122, 25, 'Reduce product quality', 0, NULL, NULL),
(123, 25, 'Eliminate competition', 0, NULL, NULL),
(124, 25, 'Decrease customer engagement', 0, NULL, NULL),
(125, 3, 'Monitoring livestock health and welfare', 1, NULL, NULL),
(126, 3, 'Managing the financial accounting of the entire farm', 0, NULL, NULL),
(127, 3, 'Overseeing the design of new machinery for production', 0, NULL, NULL),
(128, 3, 'Conducting laboratory experiments on feed composition', 0, NULL, NULL),
(129, 4, 'Cost of the feed', 0, NULL, NULL),
(130, 4, 'Nutritional requirements of the animals', 1, NULL, NULL),
(131, 4, 'The availability of labor', 0, NULL, NULL),
(132, 4, 'Storage capacity for feed', 0, NULL, NULL),
(133, 6, 'Isolate the affected animals', 1, NULL, NULL),
(134, 6, 'Administer antibiotics to all animals', 0, NULL, NULL),
(135, 6, 'Notify government authorities', 0, NULL, NULL),
(136, 6, 'Increase feed supply', 0, NULL, NULL),
(137, 8, 'Restricting their water intake', 0, NULL, NULL),
(138, 8, 'Reducing loading and unloading times', 1, NULL, NULL),
(139, 8, 'Increasing the vehicle speed', 0, NULL, NULL),
(140, 8, 'Mixing different species together', 0, NULL, NULL),
(141, 30, 'Random mating of animals', 0, NULL, NULL),
(142, 30, 'Implementing an artificial insemination program', 1, NULL, NULL),
(143, 30, 'Allowing livestock to graze freely', 0, NULL, NULL),
(144, 30, 'Using feed supplements without tracking', 0, NULL, NULL),
(145, 31, 'Disposing of manure in nearby water bodies', 0, NULL, NULL),
(146, 31, 'Using antibiotics routinely in healthy animals', 0, NULL, NULL),
(147, 31, 'Rotational grazing to preserve pastures', 1, NULL, NULL),
(148, 31, 'Relying exclusively on imported feed', 0, NULL, NULL),
(149, 32, 'Ensuring livestock reach the maximum weight', 0, NULL, NULL),
(150, 32, 'Protecting livestock from infectious diseases', 1, NULL, NULL),
(151, 32, 'Increasing market demand for livestock products', 0, NULL, NULL),
(152, 32, 'Improving the palatability of feed', 0, NULL, NULL),
(153, 33, 'Excessive ammonia odor in the facility', 0, NULL, NULL),
(154, 33, 'Adequate ventilation and proper drainage', 1, NULL, NULL),
(155, 33, 'Crowding livestock to maximize space', 0, NULL, NULL),
(156, 33, 'Constant artificial lighting', 0, NULL, NULL),
(157, 34, 'Conducting regular pregnancy tests', 1, NULL, NULL),
(158, 34, 'Increasing feed quantity during the breeding season', 0, NULL, NULL),
(159, 34, 'Isolating animals for an extended period', 0, NULL, NULL),
(160, 34, 'Ignoring signs of heat cycles', 0, NULL, NULL),
(161, 35, 'Simplifying tax reporting', 0, NULL, NULL),
(162, 35, 'Tracking performance and identifying areas for improvement', 1, NULL, NULL),
(163, 35, 'Reducing the need for inspections', 0, NULL, NULL),
(164, 35, 'Avoiding the use of technology in daily operations', 0, NULL, NULL),
(165, 9, 'Writing technical code for the project', 0, NULL, NULL),
(166, 9, 'Defining project scope, goals, and deliverables', 1, NULL, NULL),
(167, 9, 'Conducting customer surveys', 0, NULL, NULL),
(168, 9, 'Managing the organization’s HR policies', 0, NULL, NULL),
(169, 10, 'To track the company’s financial data', 0, NULL, NULL),
(170, 10, 'To schedule and monitor project timelines and tasks', 1, NULL, NULL),
(171, 10, 'To evaluate employee performance', 0, NULL, NULL),
(172, 10, 'To manage customer feedback', 0, NULL, NULL),
(173, 36, 'Waterfall', 0, NULL, NULL),
(174, 36, 'Agile', 1, NULL, NULL),
(175, 36, 'Six Sigma', 0, NULL, NULL),
(176, 36, 'PRINCE2', 0, NULL, NULL),
(177, 37, 'Cancel the project', 0, NULL, NULL),
(178, 37, 'Inform the stakeholders immediately', 0, NULL, NULL),
(179, 37, 'Analyze the reasons for the overrun and adjust the project plan', 1, NULL, NULL),
(180, 37, 'Request additional funds without explanation', 0, NULL, NULL),
(181, 38, 'Coding expertise', 0, NULL, NULL),
(182, 38, 'Strong leadership and communication skills', 1, NULL, NULL),
(183, 38, 'Budget management', 0, NULL, NULL),
(184, 38, 'Knowledge of graphic design', 0, NULL, NULL),
(185, 39, 'Risk Register', 0, NULL, NULL),
(186, 39, 'Project Charter', 1, NULL, NULL),
(187, 39, 'Status Report', 0, NULL, NULL),
(188, 39, 'Resource Plan', 0, NULL, NULL),
(189, 40, ' Designing new products.', 0, NULL, NULL),
(190, 40, 'Overseeing and coordinating production activities.', 1, NULL, NULL),
(191, 40, 'Managing the company\'s finances.', 0, NULL, NULL),
(192, 40, 'Conducting market research.', 0, NULL, NULL),
(193, 41, 'Monitoring production output.', 0, NULL, NULL),
(194, 41, 'Training and mentoring production workers.', 0, NULL, NULL),
(195, 41, 'Developing marketing strategies.', 1, NULL, NULL),
(196, 41, 'Implementing safety protocols.', 0, NULL, NULL),
(197, 42, 'To track employee attendance.', 0, NULL, NULL),
(198, 42, 'To monitor production efficiency and identify areas for improvement.', 1, NULL, NULL),
(199, 42, 'To calculate employee salaries.', 0, NULL, NULL),
(200, 42, 'To comply with environmental regulations.', 0, NULL, NULL),
(201, 43, 'Ignore the issue and hope it resolves itself.', 0, NULL, NULL),
(202, 43, 'Blame the production workers for negligence.', 0, NULL, NULL),
(203, 43, 'Investigate the root cause of the problem.', 1, NULL, NULL),
(204, 43, 'Order new raw materials.', 0, NULL, NULL),
(205, 44, 'Employee satisfaction.', 0, NULL, NULL),
(206, 44, 'Customer retention rate.', 0, NULL, NULL),
(207, 44, 'Production output per hour.', 1, NULL, NULL),
(208, 44, 'Number of social media followers.', 0, NULL, NULL),
(209, 45, 'Writing code for software applications.', 0, NULL, NULL),
(210, 45, 'Designing user interfaces.', 0, NULL, NULL),
(211, 45, 'Bridging the gap between business needs and technical solutions.', 1, NULL, NULL),
(212, 45, 'Managing project budgets.', 0, NULL, NULL),
(213, 46, 'Documenting existing system architecture.', 0, NULL, NULL),
(214, 46, 'Identifying and understanding stakeholder needs.', 1, NULL, NULL),
(215, 46, 'Creating test cases.', 0, NULL, NULL),
(216, 46, 'Developing project timelines.', 0, NULL, NULL),
(217, 47, 'Database normalization.', 0, NULL, NULL),
(218, 47, 'Use case diagrams.', 1, NULL, NULL),
(219, 47, 'Network topology mapping.', 0, NULL, NULL),
(220, 47, 'Algorithm optimization.', 0, NULL, NULL),
(221, 48, ' A person who writes code.', 0, NULL, NULL),
(222, 48, 'A person who has an interest in or is affected by the project.', 0, NULL, NULL),
(223, 48, 'A person who manages the IT infrastructure.', 1, NULL, NULL),
(224, 48, 'A person who conducts market research.', 0, NULL, NULL),
(225, 49, 'To identify differences between current and desired states.', 1, NULL, NULL),
(226, 49, 'To estimate project costs.', 0, NULL, NULL),
(227, 49, 'To measure team performance.', 0, NULL, NULL),
(228, 49, 'To design database schemas.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamquestion`
--

CREATE TABLE `tblexamquestion` (
  `examQ_id` int(11) NOT NULL,
  `examQ_examId` int(11) NOT NULL,
  `examQ_text` text NOT NULL,
  `examQ_typeId` int(11) NOT NULL,
  `examQ_createdAt` date NOT NULL,
  `examQ_updatedAt` date NOT NULL,
  `examQ_points` int(11) NOT NULL,
  `examQ_hrId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamquestion`
--

INSERT INTO `tblexamquestion` (`examQ_id`, `examQ_examId`, `examQ_text`, `examQ_typeId`, `examQ_createdAt`, `examQ_updatedAt`, `examQ_points`, `examQ_hrId`) VALUES
(1, 1, 'What does SQL stand for?', 1, '2024-10-14', '0000-00-00', 5, NULL),
(2, 1, 'Which data structure uses a First In First Out (FIFO) method?', 1, '2024-10-14', '0000-00-00', 5, NULL),
(3, 2, 'Which of the following is the primary responsibility of a Livestock Production Supervisor?', 1, '2024-10-14', '2025-01-08', 5, NULL),
(4, 2, 'What is the most critical factor to consider when planning a feeding schedule for livestock?', 1, '2024-10-14', '2025-01-08', 5, NULL),
(5, 1, 'Which of the following is a NoSQL database?', 1, '2024-10-14', '0000-00-00', 5, NULL),
(6, 2, 'When identifying a disease outbreak in livestock, which of the following is the FIRST step to take?', 1, '2024-10-14', '2025-01-08', 5, NULL),
(7, 1, 'In version control systems like Git, which command is used to create a new branch?', 1, '2024-10-14', '0000-00-00', 5, NULL),
(8, 2, 'Which of the following is an effective method for reducing stress in livestock during transportation?', 1, '2024-10-14', '2025-01-08', 5, NULL),
(9, 3, 'What is the primary responsibility of a Project Manager?', 1, '2024-10-19', '2025-01-09', 5, NULL),
(10, 3, 'Which of the following best describes the purpose of a Gantt chart in project management?', 1, '2024-10-19', '2025-01-09', 5, NULL),
(11, 4, 'In JavaScript, which of the following is used to declare a variable that can change over time?', 1, '2024-10-24', '2024-10-24', 5, NULL),
(12, 4, 'What HTTP method is typically used to submit form data to a server?', 1, '2024-10-24', '2024-10-24', 5, NULL),
(13, 4, 'What is the time complexity of inserting an element into a max heap?', 1, '2024-10-24', '2024-10-24', 5, NULL),
(14, 4, 'What is the time complexity of a binary search algorithm?', 1, '2024-10-24', '2024-10-24', 7, NULL),
(15, 5, 'Which of the following is the primary goal of data normalization in a relational database?', 1, '2024-10-24', '2024-10-24', 10, NULL),
(16, 5, 'In which situation would you use a LEFT JOIN in SQL?', 1, '2024-10-24', '2024-10-24', 10, NULL),
(17, 5, 'Which metric would you most likely use to measure the central tendency of a dataset that contains outliers?', 1, '2024-10-24', '2024-10-24', 10, NULL),
(18, 5, 'What is the purpose of the GROUP BY clause in SQL?', 1, '2024-10-24', '2024-10-24', 13, NULL),
(19, 6, 'What is the primary function of a secretary in an organization?', 1, '2024-10-24', '2024-10-24', 1, NULL),
(20, 6, 'Which of the following is considered proper email etiquette in a professional environment?', 1, '2024-10-24', '2024-10-24', 1, NULL),
(21, 6, 'What is the correct way to prioritize tasks when managing a busy office schedule?', 1, '2024-10-24', '2024-10-24', 1, NULL),
(22, 7, 'Which of the following is an example of an asset?', 1, '2024-12-03', '2024-12-03', 5, NULL),
(23, 7, 'What is the accounting equation?', 1, '2024-12-03', '2024-12-03', 5, NULL),
(24, 7, 'Which financial statement summarizes a company’s financial position at a specific point in time?', 1, '2024-12-03', '2024-12-03', 5, NULL),
(25, 8, 'Which of the following is a key objective of a marketing campaign?', 1, '2024-12-08', '2024-12-08', 5, NULL),
(26, 8, 'What does SEO stand for in digital marketing?', 1, '2024-12-08', '2024-12-08', 5, NULL),
(27, 8, 'Which platform is most suitable for running professional B2B marketing campaigns?', 1, '2024-12-08', '2024-12-08', 1, NULL),
(28, 8, 'What is the primary purpose of using a Customer Relationship Management (CRM) tool?', 1, '2024-12-08', '2024-12-08', 5, NULL),
(29, 8, 'Which metric is most important for measuring the success of an email marketing campaign?', 1, '2024-12-08', '2024-12-08', 5, NULL),
(30, 2, 'In a livestock production system, which practice is most effective for improving breeding outcomes?', 1, '2025-01-08', '2025-01-08', 5, NULL),
(31, 2, 'Which of the following is a sustainable practice in livestock production?', 1, '2025-01-08', '2025-01-08', 3, NULL),
(32, 2, 'What is the purpose of a biosecurity program in livestock production?', 1, '2025-01-08', '2025-01-08', 5, NULL),
(33, 2, 'Which of the following is an indicator of good livestock housing conditions?', 1, '2025-01-08', '2025-01-08', 5, NULL),
(34, 2, 'When managing the breeding cycle of livestock, which of the following is the most effective strategy to monitor reproductive health?', 1, '2025-01-08', '2025-01-08', 5, NULL),
(35, 2, 'What is the primary benefit of maintaining detailed records in livestock production?', 1, '2025-01-08', '2025-01-08', 5, NULL),
(36, 3, 'Which methodology focuses on iterative project development and continuous improvement?', 1, '2025-01-09', '2025-01-09', 5, NULL),
(37, 3, 'When a project goes over budget, what is the first step a Project Manager should take?', 1, '2025-01-09', '2025-01-09', 5, NULL),
(38, 3, 'What key skill is essential for a Project Manager to manage a diverse team effectively?', 1, '2025-01-09', '2025-01-09', 5, NULL),
(39, 3, 'Which document is typically created at the start of a project to outline the project’s goals, scope, and stakeholders?', 1, '2025-01-09', '2025-01-09', 5, NULL),
(40, 11, 'What is the primary responsibility of a Production Supervisor?', 1, '2025-03-11', '2025-03-11', 5, NULL),
(41, 11, 'Which of the following is NOT a typical duty of a Production Supervisor?', 1, '2025-03-11', '2025-03-11', 5, NULL),
(42, 11, 'What is the importance of maintaining accurate production records?', 1, '2025-03-11', '2025-03-11', 5, NULL),
(43, 11, ' A sudden increase in defective products is observed. What should a Production Supervisor do first?', 1, '2025-03-11', '2025-03-11', 5, NULL),
(44, 11, 'Which of the following is a key performance indicator (KPI) for a Production Supervisor?', 1, '2025-03-11', '2025-03-11', 5, NULL),
(45, 9, 'Which of the following is the primary role of a Business Analyst?', 1, '2025-03-12', '2025-03-12', 5, NULL),
(46, 9, 'What does \"elicitation\" refer to in the context of requirements gathering?', 1, '2025-03-12', '2025-03-12', 5, NULL),
(47, 9, 'Which of the following is a common technique for documenting business requirements?', 1, '2025-03-12', '2025-03-12', 1, NULL),
(48, 9, 'What is a \"stakeholder\" in a project?', 1, '2025-03-12', '2025-03-12', 5, NULL),
(49, 9, 'What is the purpose of a \"gap analysis\"?', 1, '2025-03-12', '2025-03-12', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamquestiontype`
--

CREATE TABLE `tblexamquestiontype` (
  `questionT_id` int(11) NOT NULL,
  `questionT_name` varchar(50) NOT NULL,
  `questionT_hrId` int(11) DEFAULT NULL,
  `questionT_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamquestiontype`
--

INSERT INTO `tblexamquestiontype` (`questionT_id`, `questionT_name`, `questionT_hrId`, `questionT_datetime`) VALUES
(1, 'Multiple Choice', NULL, NULL),
(2, 'Essay', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamresult`
--

CREATE TABLE `tblexamresult` (
  `examR_id` int(11) NOT NULL,
  `examR_candId` int(11) NOT NULL,
  `examR_examId` int(11) NOT NULL,
  `examR_jobMId` int(11) NOT NULL,
  `examR_score` int(50) NOT NULL,
  `examR_totalscore` int(11) NOT NULL,
  `examR_date` datetime NOT NULL,
  `examR_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamresult`
--

INSERT INTO `tblexamresult` (`examR_id`, `examR_candId`, `examR_examId`, `examR_jobMId`, `examR_score`, `examR_totalscore`, `examR_date`, `examR_status`) VALUES
(1, 40, 9, 17, 15, 41, '2025-08-11 15:17:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblexamschedule`
--

CREATE TABLE `tblexamschedule` (
  `examS_id` int(11) NOT NULL,
  `examS_appId` int(11) NOT NULL,
  `examS_candId` int(11) NOT NULL,
  `examS_date` datetime NOT NULL,
  `examS_hrId` int(11) NOT NULL,
  `examS_createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamtype`
--

CREATE TABLE `tblexamtype` (
  `examT_id` int(11) NOT NULL,
  `examT_name` varchar(50) NOT NULL,
  `examT_hrId` int(11) DEFAULT NULL,
  `examT_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamtype`
--

INSERT INTO `tblexamtype` (`examT_id`, `examT_name`, `examT_hrId`, `examT_datetime`) VALUES
(1, 'General', NULL, NULL),
(2, 'Specific', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblfailedlogins`
--

CREATE TABLE `tblfailedlogins` (
  `email` varchar(255) NOT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `lock_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblfailedlogins`
--

INSERT INTO `tblfailedlogins` (`email`, `failed_attempts`, `lock_until`) VALUES
('asdsa@gmail.com', 1, NULL),
('hahaha@gmail.com', 1, NULL),
('hjakhsd@mail.com', 1, NULL),
('hjasd@gmail.com', 1, NULL),
('jecham@gmail.com', 3, NULL),
('mel@gmail.com', 1, NULL),
('ralp.pelino11@gmail.com', 1, NULL),
('ralph@gmail.com', 1, NULL),
('raphgwapo@gmail.com', 1, NULL),
('Timbal@gmail.com', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblforgotpassword`
--

CREATE TABLE `tblforgotpassword` (
  `forgotpass_id` int(11) NOT NULL,
  `forgotpass_candId` int(11) NOT NULL,
  `forgotpass_email` varchar(255) NOT NULL,
  `forgotpass_pinCode` varchar(6) NOT NULL,
  `forgotpass_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `forgotpass_status` enum('pending','used','expired') DEFAULT 'pending',
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `tblforgotpassword`
--
DELIMITER $$
CREATE TRIGGER `set_default_expires_at` BEFORE INSERT ON `tblforgotpassword` FOR EACH ROW BEGIN
    IF NEW.expires_at IS NULL THEN
        SET NEW.expires_at = NOW() + INTERVAL 15 MINUTE;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblhr`
--

CREATE TABLE `tblhr` (
  `hr_id` int(11) NOT NULL,
  `hr_firstname` varchar(50) NOT NULL,
  `hr_middlename` varchar(50) NOT NULL,
  `hr_lastname` varchar(50) NOT NULL,
  `hr_contactNo` varchar(50) NOT NULL,
  `hr_email` varchar(255) NOT NULL,
  `hr_alternateEmail` varchar(255) NOT NULL,
  `hr_password` varchar(255) NOT NULL,
  `hr_userLevel` int(11) NOT NULL,
  `hr_hrId` int(11) DEFAULT NULL,
  `hr_createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblhr`
--

INSERT INTO `tblhr` (`hr_id`, `hr_firstname`, `hr_middlename`, `hr_lastname`, `hr_contactNo`, `hr_email`, `hr_alternateEmail`, `hr_password`, `hr_userLevel`, `hr_hrId`, `hr_createdAt`) VALUES
(1, 'Ralph Jan', 'Pelino', 'Gallegos', '09056548089', 'ralphjangallegos@gmail.com', 'ralphjangallegos11@gmail.com', '$2y$10$ZVd.PA0HsxV5nC8nQQ7l0ufv44ApjwOR3HB6HUmjepuu.lhQkdyeG', 2, NULL, '2025-03-02 12:22:41'),
(2, 'Maria Alva', 'C.', 'Espiritu', '9056548089', 'EspirituMAC@delmonte-phil.com', '', '$2y$10$6bbkjIZK7O20P9NA7ooMxO4tSJFoRWHrGmG1URhMLy7hQQa9t9.x6', 4, NULL, '2025-05-22 12:29:01'),
(3, 'Jalil', 'E.', 'Quinal', '9096015541', 'QuinalJE@delmonte-phil.com', '', '$2y$10$dmJ2i0s5RVocQlvT/.GnXOejGh3vYmOa5XJiA9Hn/eFGc9SRniP2.', 5, NULL, '2025-05-22 12:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblinstitution`
--

CREATE TABLE `tblinstitution` (
  `institution_id` int(20) NOT NULL,
  `institution_name` varchar(90) DEFAULT NULL,
  `institution_points` int(11) NOT NULL DEFAULT 5,
  `institution_hrId` int(11) DEFAULT NULL,
  `institution_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tblinstitution`
--

INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`, `institution_hrId`, `institution_datetime`) VALUES
(1, 'The Adelphi College', 5, NULL, NULL),
(2, 'Malasiqui Agno Valley College', 5, NULL, NULL),
(3, 'Asbury College', 5, NULL, NULL),
(4, 'Asiacareer College Foundation', 5, NULL, NULL),
(5, 'CICOSAT Colleges', 5, NULL, NULL),
(6, 'Universidad de Dagupan', 5, NULL, NULL),
(7, 'Dagupan Colleges Foundation', 5, NULL, NULL),
(8, 'Data Center College of the Philippines of Laoag City', 5, NULL, NULL),
(9, 'Divine Word College of Laoag', 5, NULL, NULL),
(10, 'Divine Word College of Vigan', 5, NULL, NULL),
(11, 'Don Mariano Marcos Memorial State University-South La Union', 5, NULL, NULL),
(12, 'Don Mariano Marcos Memorial State University-Mid La Union', 5, NULL, NULL),
(13, 'Don Mariano Marcos Memorial State University-Open University', 5, NULL, NULL),
(14, 'Don Mariano Marcos Memorial State University-North La Union-Main Campus', 5, NULL, NULL),
(15, 'The Great Plebeian College', 5, NULL, NULL),
(16, 'Ilocos Sur Polytechnic State College-Sta. Maria', 5, NULL, NULL),
(17, 'Ilocos Sur Community College', 5, NULL, NULL),
(18, 'Lorma Colleges', 5, NULL, NULL),
(19, 'Luna Colleges', 5, NULL, NULL),
(20, 'University of Luzon', 5, NULL, NULL),
(21, 'Lyceum Northern Luzon', 5, NULL, NULL),
(22, 'Mariano Marcos State University-Main', 5, NULL, NULL),
(23, 'Mary Help of Christians College Seminary', 5, NULL, NULL),
(24, 'Mariano Marcos State University-College of Aquatic Sciences and Applied Technology', 5, NULL, NULL),
(25, 'Mariano Marcos State University-College of Agriculture and Forestry-Dingras', 5, NULL, NULL),
(26, 'Mariano Marcos State University-College of Teacher Education-Laoag City', 5, NULL, NULL),
(27, 'Mariano Marcos State University-College of Industrial Technology-Laoag City', 5, NULL, NULL),
(28, 'Northern Christian College', 5, NULL, NULL),
(29, 'Northern Luzon Adventist College', 5, NULL, NULL),
(30, 'Northern Philippines College for Maritime Science and Technology', 5, NULL, NULL),
(31, 'Northwestern University', 5, NULL, NULL),
(32, 'Osias Educational Foundation', 5, NULL, NULL),
(33, 'Palaris College', 5, NULL, NULL),
(34, 'Panpacific University', 5, NULL, NULL),
(35, 'Pangasinan Merchant Marine Academy', 5, NULL, NULL),
(36, 'Pangasinan State University', 5, NULL, NULL),
(37, 'Pangasinan State University-Open University', 5, NULL, NULL),
(38, 'Pangasinan State University-Alaminos City', 5, NULL, NULL),
(39, 'Perpetual Help College of Pangasinan', 5, NULL, NULL),
(40, 'Polytechnic College of La union', 5, NULL, NULL),
(41, 'Philippine College of Science and Technology', 5, NULL, NULL),
(42, 'PIMSAT Colleges-Dagupan', 5, NULL, NULL),
(43, 'Pangasinan State University-Asingan', 5, NULL, NULL),
(44, 'Pangasinan State University-Bayambang', 5, NULL, NULL),
(45, 'Pangasinan State University-Binmaley', 5, NULL, NULL),
(46, 'Pangasinan State University-Infanta', 5, NULL, NULL),
(47, 'Pangasinan State University-San Carlos City', 5, NULL, NULL),
(48, 'Pangasinan State University-Sta. Maria', 5, NULL, NULL),
(49, 'Pangasinan State University-Urdaneta City', 5, NULL, NULL),
(50, 'Saint Columban\'s College', 5, NULL, NULL),
(51, 'Saint Louis College-City of San Fernando', 5, NULL, NULL),
(52, 'Saint Mary\'s College Sta. Maria Ilocos Sur', 5, NULL, NULL),
(53, 'Saint Paul College of Ilocos Sur', 5, NULL, NULL),
(54, 'San Carlos College', 5, NULL, NULL),
(55, 'Sea and Sky College', 5, NULL, NULL),
(56, 'Union Christian College', 5, NULL, NULL),
(57, 'University of Northern Philippines', 5, NULL, NULL),
(58, 'University of Pangasinan', 5, NULL, NULL),
(59, 'Ilocos Sur Polytechnic State College-Main Campus', 5, NULL, NULL),
(60, 'NJ Valdez Colleges Foundation', 5, NULL, NULL),
(61, 'Urdaneta City University', 5, NULL, NULL),
(62, 'Virgen Milagrosa University Foundation', 5, NULL, NULL),
(63, 'Ilocos Sur Polytechnic State College-College of Engineering and Technology-Santiago', 5, NULL, NULL),
(64, 'Ilocos Sur Polytechnic State College-College of Arts and Sciences-Tagudin', 5, NULL, NULL),
(65, 'Ilocos Sur Polytechnic State College-College of Fisheries and Marine Sciences-Narvacan', 5, NULL, NULL),
(66, 'Ilocos Sur Polytechnic State College-Cervantes', 5, NULL, NULL),
(67, 'Ilocos Sur Polytechnic State College-Candon', 5, NULL, NULL),
(68, 'Metro-Dagupan Colleges', 5, NULL, NULL),
(69, 'Pass College', 5, NULL, NULL),
(70, 'AMA Computer College-Pangasinan', 5, NULL, NULL),
(71, 'AMA Computer College-Laoag City', 5, NULL, NULL),
(72, 'Lyceum Northwestern University', 5, NULL, NULL),
(73, 'STI College-Dagupan', 5, NULL, NULL),
(74, 'AMA Computer College-La Union', 5, NULL, NULL),
(75, 'Golden West Colleges', 5, NULL, NULL),
(76, 'Lyceum Northwestern University-Urdaneta Campus', 5, NULL, NULL),
(77, 'Data Center College of the Philippines-Vigan City', 5, NULL, NULL),
(78, 'Colegio San Jose De Alaminos', 5, NULL, NULL),
(79, 'Colegio De San Juan De Letran-Manaoag', 5, NULL, NULL),
(80, 'South Ilocandia College of Arts and Technology', 5, NULL, NULL),
(81, 'La Union College of Science and Technology', 5, NULL, NULL),
(82, 'Mystical Rose College of Science and Technology', 5, NULL, NULL),
(83, 'St. Therese College Foundation', 5, NULL, NULL),
(84, 'ABE International College of Business and Accountancy-Urdaneta City', 5, NULL, NULL),
(85, 'Panpacific University North Philippines-Tayug', 5, NULL, NULL),
(86, 'Kingfisher School of Business & Finance', 5, NULL, NULL),
(87, 'NICOSAT Colleges', 5, NULL, NULL),
(88, 'St. Camillus College of Manaoag Foundation', 5, NULL, NULL),
(89, 'International College for Excellence', 5, NULL, NULL),
(90, 'Philippine College of Northwestern Luzon', 5, NULL, NULL),
(91, 'Philippine Darakbang Theological College', 5, NULL, NULL),
(92, 'Saint John Bosco College of Northern Luzon', 5, NULL, NULL),
(93, 'University of Eastern Pangasinan', 5, NULL, NULL),
(94, 'Rosales-Wesleyan Bible College', 5, NULL, NULL),
(95, 'La Union Christian Comprehensive College', 5, NULL, NULL),
(96, 'Immaculate Conception School of Theology', 5, NULL, NULL),
(97, 'WCC Aeronautical & Technological College', 5, NULL, NULL),
(98, 'PIMSAT Colleges-San Carlos City', 5, NULL, NULL),
(99, 'Binalatongan Community College', 5, NULL, NULL),
(100, 'Mary Help of Christians Theology Seminary', 5, NULL, NULL),
(101, 'STI College-Vigan', 5, NULL, NULL),
(102, 'STI College-Laoag', 5, NULL, NULL),
(103, 'Señor Tesoro College', 5, NULL, NULL),
(104, 'PHINMA-Upang College Urdaneta', 5, NULL, NULL),
(105, 'Mary Cause of Our Joy College Seminary', 5, NULL, NULL),
(106, 'St. Benedict College of Northern Luzon', 5, NULL, NULL),
(107, 'Leading Edge International Aviation Academy', 5, NULL, NULL),
(108, 'Kingsville Advanced School', 5, NULL, NULL),
(109, 'Bayambang Polytechnic College', 5, NULL, NULL),
(110, 'Philippine Remnant College', 5, NULL, NULL),
(111, 'Aldersgate College', 5, NULL, NULL),
(112, 'Isabela State University-Angadanan Campus', 5, NULL, NULL),
(113, 'Batanes State College', 5, NULL, NULL),
(114, 'University of Cagayan Valley', 5, NULL, NULL),
(115, 'Cagayan State University-Tuguegarao (Carig)', 5, NULL, NULL),
(116, 'Isabela State University-Cauayan Campus', 5, NULL, NULL),
(117, 'Cagayan State University-Aparri', 5, NULL, NULL),
(118, 'Cagayan State University-Gonzaga', 5, NULL, NULL),
(119, 'Cagayan State University-Lallo', 5, NULL, NULL),
(120, 'Cagayan State University-Lasam', 5, NULL, NULL),
(121, 'Cagayan State University-Piat', 5, NULL, NULL),
(122, 'Cagayan State University-Sanchez Mira', 5, NULL, NULL),
(123, 'Isabela State University-San Mariano Campus', 5, NULL, NULL),
(124, 'Eveland Christian College', 5, NULL, NULL),
(125, 'Isabela Colleges', 5, NULL, NULL),
(126, 'Isabela State University-Main (Echague)', 5, NULL, NULL),
(127, 'Isabela State University-Cabagan', 5, NULL, NULL),
(128, 'Isabela State University-Ilagan Campus', 5, NULL, NULL),
(129, 'Isabela State University-Jones Campus', 5, NULL, NULL),
(130, 'Isabela State University-Roxas Campus', 5, NULL, NULL),
(131, 'Isabela State University-San Mateo Campus', 5, NULL, NULL),
(132, 'University of La Salette', 5, NULL, NULL),
(133, 'Lyceum of Aparri', 5, NULL, NULL),
(134, 'Lyceum of Tuao', 5, NULL, NULL),
(135, 'Medical Colleges of Northern Philippines', 5, NULL, NULL),
(136, 'Northeastern College', 5, NULL, NULL),
(137, 'Northern Cagayan Colleges Foundation', 5, NULL, NULL),
(138, 'Nueva Vizcaya State University - Main Bayombong', 5, NULL, NULL),
(139, 'Nueva Vizcaya State University-Bambang', 5, NULL, NULL),
(140, 'Our Lady of the Pillar College-Cauayan', 5, NULL, NULL),
(141, 'Patria Sable Corpus College', 5, NULL, NULL),
(142, 'PLT College', 5, NULL, NULL),
(143, 'Philippine Normal University-North Luzon Campus', 5, NULL, NULL),
(144, 'Quezon Colleges of the North', 5, NULL, NULL),
(145, 'Quirino State University - Cabarroguis', 5, NULL, NULL),
(146, 'Quirino State University', 5, NULL, NULL),
(147, 'Quirino State University - Maddela', 5, NULL, NULL),
(148, 'Saint Anthony\'s College', 5, NULL, NULL),
(149, 'Saint Dominic College of Batanes', 5, NULL, NULL),
(150, 'St. Ferdinand College-Ilagan', 5, NULL, NULL),
(151, 'Saint Joseph\'s College of Baggao', 5, NULL, NULL),
(152, 'University of Saint Louis-Tuguegarao', 5, NULL, NULL),
(153, 'Saint Mary\'s University of Bayombong', 5, NULL, NULL),
(154, 'Saint Paul University Philippines', 5, NULL, NULL),
(155, 'Mallig Plains Colleges', 5, NULL, NULL),
(156, 'FL Vargas College-Tuguegarao', 5, NULL, NULL),
(157, 'Philippine Law Enforcement College', 5, NULL, NULL),
(158, 'International School of Asia and the Pacific', 5, NULL, NULL),
(159, 'Isabela College of Arts and Technology', 5, NULL, NULL),
(160, 'AMA Computer College-Santiago City', 5, NULL, NULL),
(161, 'Cagayan Valley Computer and Information Technology College', 5, NULL, NULL),
(162, 'John Wesley College', 5, NULL, NULL),
(163, 'AMA Computer College-Tuguegarao City', 5, NULL, NULL),
(164, 'SISTECH College of Santiago City', 5, NULL, NULL),
(165, 'Santiago City Colleges', 5, NULL, NULL),
(166, 'Saint Ferdinand College-Cabagan Campus', 5, NULL, NULL),
(167, 'F.L. Vargas College-Abulug Campus', 5, NULL, NULL),
(168, 'Metropolitan School of Science and Technology', 5, NULL, NULL),
(169, 'University of Perpetual Help System', 5, NULL, NULL),
(170, 'King\'s College of the Philippines-Bambang', 5, NULL, NULL),
(171, 'Global Academy of Technology and Entrepreneurship', 5, NULL, NULL),
(172, 'HGBaquiran College', 5, NULL, NULL),
(173, 'Infant Jesus Montessori School (College Department)', 5, NULL, NULL),
(174, 'Maila Rosario Colleges', 5, NULL, NULL),
(175, 'Our Lady of the Pillar College-Cauayan San Manuel Branch', 5, NULL, NULL),
(176, 'Northeast Luzon Adventist College', 5, NULL, NULL),
(177, 'Cagayan State University-Andrews', 5, NULL, NULL),
(178, 'Isabela State University-Palanan Campus', 5, NULL, NULL),
(179, 'La Salette of Roxas College', 5, NULL, NULL),
(180, 'STI College-Cauayan', 5, NULL, NULL),
(181, 'Angeles University Foundation', 5, NULL, NULL),
(182, 'Sto. Rosario Sapang Palay College', 5, NULL, NULL),
(183, 'Baliuag University', 5, NULL, NULL),
(184, 'Baliwag Maritime Foundation', 5, NULL, NULL),
(185, 'Bataan Peninsula State University-Dinalupihan', 5, NULL, NULL),
(186, 'Bataan Peninsula State University-Abucay', 5, NULL, NULL),
(187, 'Bataan Peninsula State University-Bagac', 5, NULL, NULL),
(188, 'Bataan Heroes Memorial College', 5, NULL, NULL),
(189, 'Bulacan Agricultural State College', 5, NULL, NULL),
(190, 'Bulacan State University-Main', 5, NULL, NULL),
(191, 'Bulacan State University-Bustos', 5, NULL, NULL),
(192, 'Bulacan State University-San Jose Del Monte', 5, NULL, NULL),
(193, 'Bulacan State University-Meneses', 5, NULL, NULL),
(194, 'Bulacan State University-Hagonoy', 5, NULL, NULL),
(195, 'Camiling Colleges', 5, NULL, NULL),
(196, 'CIT Colleges of Paniqui Foundation', 5, NULL, NULL),
(197, 'Central Luzon Doctors\' Hospital Educational Institution', 5, NULL, NULL),
(198, 'Central Luzon College of Science and Technology-Olongapo City', 5, NULL, NULL),
(199, 'Nueva Ecija University of Science and Technology-Main', 5, NULL, NULL),
(200, 'Central Luzon State University', 5, NULL, NULL),
(201, 'Centro Escolar University-Malolos City', 5, NULL, NULL),
(202, 'Colegio De San Pascual Baylon', 5, NULL, NULL),
(203, 'College of the Immaculate Conception', 5, NULL, NULL),
(204, 'CORE Gateway College', 5, NULL, NULL),
(205, 'Columban College-Olongapo City', 5, NULL, NULL),
(206, 'College for Research and Technology-Cabanatuan City', 5, NULL, NULL),
(207, 'World Citi Colleges Guimba Campus', 5, NULL, NULL),
(208, 'Divina Pastora College', 5, NULL, NULL),
(209, 'Dominican College of Tarlac', 5, NULL, NULL),
(210, 'Don Honorio Ventura Technological State University-Main', 5, NULL, NULL),
(211, 'Don Honorio Ventura Technological State University-Mexico', 5, NULL, NULL),
(212, 'Don Honorio Ventura Technological State University-Porac', 5, NULL, NULL),
(213, 'Don Honorio Ventura Technological State University-Sto.Thomas', 5, NULL, NULL),
(214, 'Dr. Gloria D. Lacson Foundation Colleges - Nueva Ecija', 5, NULL, NULL),
(215, 'Dr. Yanga\'s Colleges', 5, NULL, NULL),
(216, 'General De Jesus College', 5, NULL, NULL),
(217, 'The Good Samaritan Colleges', 5, NULL, NULL),
(218, 'Guagua National Colleges', 5, NULL, NULL),
(219, 'Holy Angel University', 5, NULL, NULL),
(220, 'Holy Cross College-Nueva Ecija', 5, NULL, NULL),
(221, 'Holy Cross College-Pampanga', 5, NULL, NULL),
(222, 'Immaculate Conception Major Seminary', 5, NULL, NULL),
(223, 'Interworld College of Technology Foundation-Tarlac', 5, NULL, NULL),
(224, 'Jesus Is Lord Colleges Foundation', 5, NULL, NULL),
(225, 'Jose C. Feliciano College Foundation', 5, NULL, NULL),
(226, 'Lourdes College of Bulacan', 5, NULL, NULL),
(227, 'Magsaysay Memorial College of Zambales', 5, NULL, NULL),
(228, 'Manuel V. Gallego Foundation Colleges', 5, NULL, NULL),
(229, 'Maria Assumpta Seminary', 5, NULL, NULL),
(230, 'Metro Subic Colleges', 5, NULL, NULL),
(231, 'Meycauayan College', 5, NULL, NULL),
(232, 'Microcity College of Business and Technology', 5, NULL, NULL),
(233, 'MIDWAY COLLEGES Inc.', 5, NULL, NULL),
(234, 'Mondriaan Aura College', 5, NULL, NULL),
(235, 'Mother of Good Counsel Seminary', 5, NULL, NULL),
(236, 'Mt.Carmel College of Bocaue Bulacan', 5, NULL, NULL),
(237, 'Nazarenus College and Hospital Foundation', 5, NULL, NULL),
(238, 'Nueva Ecija Doctors\' Colleges', 5, NULL, NULL),
(239, 'Carthel Science Educational Foundation', 5, NULL, NULL),
(240, 'Osias Colleges', 5, NULL, NULL),
(241, 'Our Lady of Peace College Seminary', 5, NULL, NULL),
(242, 'Araullo University', 5, NULL, NULL),
(243, 'Pampanga State Agricultural University', 5, NULL, NULL),
(244, 'Pampanga Colleges', 5, NULL, NULL),
(245, 'Philippine State College of Aeronautics-Pampanga Extension', 5, NULL, NULL),
(246, 'Polytechnic University of the Philippines-Mariveles', 5, NULL, NULL),
(247, 'President Ramon Magsaysay State University', 5, NULL, NULL),
(248, 'President Ramon Magsaysay State University-Botolan', 5, NULL, NULL),
(249, 'President Ramon Magsaysay State University-Candelaria', 5, NULL, NULL),
(250, 'President Ramon Magsaysay State University-Castillejos', 5, NULL, NULL),
(251, 'President Ramon Magsaysay State University-Masinloc', 5, NULL, NULL),
(252, 'President Ramon Magsaysay State University-Sta. Cruz', 5, NULL, NULL),
(253, 'La Consolacion University Philippines', 5, NULL, NULL),
(254, 'Republic Central Colleges', 5, NULL, NULL),
(255, 'Nueva Ecija University of Science and Technology-Sebani Estate Agricultural College', 5, NULL, NULL),
(256, 'Nueva Ecija University of Science and Technology-Atate', 5, NULL, NULL),
(257, 'Nueva Ecija University of Science and Technology-Fort Magsaysay', 5, NULL, NULL),
(258, 'Nueva Ecija University of Science and Technology-San Isidro Campus', 5, NULL, NULL),
(259, 'Nueva Ecija University of Science and Technology-Sumacab Campus', 5, NULL, NULL),
(260, 'Nueva Ecija University of Science and Technology-Peñaranda', 5, NULL, NULL),
(261, 'Nueva Ecija University of Science and Technology-Talavera', 5, NULL, NULL),
(262, 'Nueva Ecija University of Science and Technology-San Leonardo', 5, NULL, NULL),
(263, 'Nueva Ecija University of Science and Technology-Carranglan', 5, NULL, NULL),
(264, 'Nueva Ecija University of Science and Technology-San Antonio Campus', 5, NULL, NULL),
(265, 'Saint Anthony College of Technology', 5, NULL, NULL),
(266, 'Saint Mary\'s College of Meycauayan', 5, NULL, NULL),
(267, 'St. Paul University at San Miguel', 5, NULL, NULL),
(268, 'San Jose Christian Colleges', 5, NULL, NULL),
(269, 'STI College-City of Tarlac', 5, NULL, NULL),
(270, 'Systems Plus College Foundation', 5, NULL, NULL),
(271, 'Tarlac Agricultural University', 5, NULL, NULL),
(272, 'Tarlac State University', 5, NULL, NULL),
(273, 'Tomas Del Rosario College', 5, NULL, NULL),
(274, 'University of the Assumption', 5, NULL, NULL),
(275, 'Wesleyan University-Philippines (Cabanatuan)', 5, NULL, NULL),
(276, 'President Ramon Magsaysay State University-San Marcelino', 5, NULL, NULL),
(277, 'Bataan Peninsula State University-Orani', 5, NULL, NULL),
(278, 'Interworld Colleges Foundation - Paniqui', 5, NULL, NULL),
(279, 'STI College-City of San Fernando', 5, NULL, NULL),
(280, 'STI College-Angeles City', 5, NULL, NULL),
(281, 'STI College-Meycauayan', 5, NULL, NULL),
(282, 'STI College-Malolos', 5, NULL, NULL),
(283, 'United School of Science and Technology Colleges', 5, NULL, NULL),
(284, 'Concepcion Holy Cross College', 5, NULL, NULL),
(285, 'Northern Zambales College', 5, NULL, NULL),
(286, 'Columban College-Sta. Cruz Zambales', 5, NULL, NULL),
(287, 'College of Saint Lawrence', 5, NULL, NULL),
(288, 'Sact Mutien College', 5, NULL, NULL),
(289, 'Fernandez College of Arts and Technology', 5, NULL, NULL),
(290, 'Micro Asia College of Science and Technology', 5, NULL, NULL),
(291, 'Sienna College of San Jose', 5, NULL, NULL),
(292, 'Bataan Peninsula State University', 5, NULL, NULL),
(293, 'AMA Computer College-Cabanatuan City', 5, NULL, NULL),
(294, 'Comteq Computer and Business College', 5, NULL, NULL),
(295, 'Gordon College', 5, NULL, NULL),
(296, 'Eastwoods Professional College of Science and Technology', 5, NULL, NULL),
(297, 'AMA Computer College-Malolos', 5, NULL, NULL),
(298, 'AMA Computer College-San Fernando Pampanga', 5, NULL, NULL),
(299, 'Limay Polytechnic College', 5, NULL, NULL),
(300, 'Maritime Academy of Asia and the Pacific', 5, NULL, NULL),
(301, 'AMA Computer College-Tarlac City', 5, NULL, NULL),
(302, 'Fundamental Baptist College For Asians', 5, NULL, NULL),
(303, 'St. Paul Colleges Foundation-Paniqui Tarlac', 5, NULL, NULL),
(304, 'ABE International College of Business and Economics-Cabanatuan', 5, NULL, NULL),
(305, 'AMA Computer College-Angeles City', 5, NULL, NULL),
(306, 'Asia Pacific College of Advanced Studies', 5, NULL, NULL),
(307, 'College of Mary Immaculate of Pandi Bulacan', 5, NULL, NULL),
(308, 'Saint Mary\'s College of Baliuag', 5, NULL, NULL),
(309, 'Saint Augustine Colleges Foundation', 5, NULL, NULL),
(310, 'Saint Rose College Educational Foundation', 5, NULL, NULL),
(311, 'ABE International College of Business and Accountancy', 5, NULL, NULL),
(312, 'AMA Computer College-Olongapo City', 5, NULL, NULL),
(313, 'La Concepcion College', 5, NULL, NULL),
(314, 'Colegio De San Gabriel Arcangel', 5, NULL, NULL),
(315, 'Mary the Queen College-Pampanga', 5, NULL, NULL),
(316, 'Mount Carmel College of Casiguran', 5, NULL, NULL),
(317, 'STI College-Sta. Maria', 5, NULL, NULL),
(318, 'STI College-Balagtas', 5, NULL, NULL),
(319, 'Lyceum of Subic Bay', 5, NULL, NULL),
(320, 'Kolehiyo ng Subic', 5, NULL, NULL),
(321, 'First City Providential College', 5, NULL, NULL),
(322, 'College of the Most Holy Trinity', 5, NULL, NULL),
(323, 'Academia de San Lorenzo Dema Ala', 5, NULL, NULL),
(324, 'Eduardo L. Joson Memorial College', 5, NULL, NULL),
(325, 'The Manila Times College of Subic', 5, NULL, NULL),
(326, 'St. Joseph College-Olongapo', 5, NULL, NULL),
(327, 'Saint Mary\'s Angels College of Pampanga', 5, NULL, NULL),
(328, 'St. Nicolas College of Business and Technology', 5, NULL, NULL),
(329, 'Dr. Gloria D. Lacson Foundation Colleges-Cabanatuan City', 5, NULL, NULL),
(330, 'College of Our Lady of Mt. Carmel (Pampanga)', 5, NULL, NULL),
(331, 'Central Luzon College of Science and Technology-City of San Fernando (Pampanga)', 5, NULL, NULL),
(332, 'Colegio de San Juan de Letran-Abucay', 5, NULL, NULL),
(333, 'College of Subic Montessori-Subic Bay', 5, NULL, NULL),
(334, 'STI College-Baliuag', 5, NULL, NULL),
(335, 'ACLC College of Meycauayan', 5, NULL, NULL),
(336, 'Colegio De Calumpit', 5, NULL, NULL),
(337, 'Gerona Junior College', 5, NULL, NULL),
(338, 'Holy Rosary Colleges Foundation', 5, NULL, NULL),
(339, 'Our Lady of Manaoag Montessori College', 5, NULL, NULL),
(340, 'Philippine Rehabilitation Institute Foundation-Guagua', 5, NULL, NULL),
(341, 'Subic Bay Colleges', 5, NULL, NULL),
(342, 'Mater Redemptoris College of San Jose City', 5, NULL, NULL),
(343, 'Megabyte College of Science and Technology-Florida', 5, NULL, NULL),
(344, 'Bataan Peninsula State University-Balanga', 5, NULL, NULL),
(345, 'Bulacan Agricultural State College-Doña Remedios Trinidad', 5, NULL, NULL),
(346, 'Philippine Women`s University Career Development and Continuing Education Center-Bataan', 5, NULL, NULL),
(347, 'Centro Colegio De Tarlac', 5, NULL, NULL),
(348, 'Philippine Women`s University Career Development and Continuing Education Center - Tarlac', 5, NULL, NULL),
(349, 'La Verdad Christian College', 5, NULL, NULL),
(350, 'St. Benilde Center for Global Competence', 5, NULL, NULL),
(351, 'Marian College of Baliuag', 5, NULL, NULL),
(352, 'Mabalacat City College', 5, NULL, NULL),
(353, 'Norzagaray College', 5, NULL, NULL),
(354, 'Polytechnic College of the City of Meycauayan', 5, NULL, NULL),
(355, 'ACLC College of Balanga', 5, NULL, NULL),
(356, 'ACLC College-Baliuag', 5, NULL, NULL),
(357, 'Liceo de Pulilan Colleges', 5, NULL, NULL),
(358, 'Our Lady of Sacred Heart College of Guimba', 5, NULL, NULL),
(359, 'ACLC College of Apalit', 5, NULL, NULL),
(360, 'City College of San Fernando', 5, NULL, NULL),
(361, 'Baliwag Polytechnic College', 5, NULL, NULL),
(362, 'Polytechnic College of Botolan', 5, NULL, NULL),
(363, 'Pambayang Dalubhasaan ng Marilao', 5, NULL, NULL),
(364, 'Tarlac Christian Colleges', 5, NULL, NULL),
(365, 'New Era University-Pampanga', 5, NULL, NULL),
(366, 'Santa Rita College of Pampanga', 5, NULL, NULL),
(367, 'Lyceum of Western Luzon - Zambales', 5, NULL, NULL),
(368, 'SJDM Cornerstone College', 5, NULL, NULL),
(369, 'STI College San Jose', 5, NULL, NULL),
(370, 'Colegio de Sebastian-Pampanga', 5, NULL, NULL),
(371, 'Clark College of Science and Technology', 5, NULL, NULL),
(372, 'AMA Computer Learning Center College of Mabalacat', 5, NULL, NULL),
(373, 'College of the Our Lady of Mercy of Pulilan Foundation', 5, NULL, NULL),
(374, 'Guagua Community College', 5, NULL, NULL),
(375, 'Immaculate Conception I-College of Arts and Technology', 5, NULL, NULL),
(376, 'City College of Angeles', 5, NULL, NULL),
(377, 'Jocson College', 5, NULL, NULL),
(378, 'ACLC College of Sta. Maria', 5, NULL, NULL),
(379, 'Lyceum of the East-Aurora', 5, NULL, NULL),
(380, 'Bestlink College of the Philippines-Bulacan', 5, NULL, NULL),
(381, 'Bulacan Polytechnic College', 5, NULL, NULL),
(382, 'Erhard Science College-Bulacan', 5, NULL, NULL),
(383, 'Golden Valley Colleges', 5, NULL, NULL),
(384, 'Our Lady of Fatima University-Pampanga', 5, NULL, NULL),
(385, 'Colleges of Advance Technology and Management of the Philippines', 5, NULL, NULL),
(386, 'Exact Colleges of Asia', 5, NULL, NULL),
(387, 'St. Elizabeth Global Skills Institute', 5, NULL, NULL),
(388, 'St. Thomas More College-Clark', 5, NULL, NULL),
(389, 'Emmanuel System College of Bulacan', 5, NULL, NULL),
(390, 'Richwell Colleges', 5, NULL, NULL),
(391, 'College of Subic Montesorri-Dinalupihan', 5, NULL, NULL),
(392, 'ACLC College of Malolos', 5, NULL, NULL),
(393, 'University of Nueva Caceres-Bataan', 5, NULL, NULL),
(394, 'Golden Olympus College', 5, NULL, NULL),
(395, 'Virgen Milagrosa Del Rosario College Seminary', 5, NULL, NULL),
(396, 'OLRA College Foundation', 5, NULL, NULL),
(397, 'Asian Institute of Science and Technology-Central', 5, NULL, NULL),
(398, 'Javier E. Garde Essential Colleges', 5, NULL, NULL),
(399, 'College of Saint Anthony-SJDM Bulacan', 5, NULL, NULL),
(400, 'FDSA Aviation College of Science and Technology', 5, NULL, NULL),
(401, 'Mater Dei Academy - Sta. Maria', 5, NULL, NULL),
(402, 'Village Montessori School and Colleges', 5, NULL, NULL),
(403, 'Araullo University-San Jose Campus', 5, NULL, NULL),
(404, 'NU Bulacan', 5, NULL, NULL),
(405, 'City College of San Jose del Monte', 5, NULL, NULL),
(406, 'Don Honorio Ventura Technological State University-Lubao', 5, NULL, NULL),
(407, 'Nueva Ecija University of Science and Technology-Papaya', 5, NULL, NULL),
(408, 'Nueva Ecija University of Science and Technology-Sto. Domingo', 5, NULL, NULL),
(409, 'Kinect Academy', 5, NULL, NULL),
(410, 'Sacred Heart Academy of Sta. Maria Bulacan', 5, NULL, NULL),
(411, 'Don Honorio Ventura Technological State University-Apalit', 5, NULL, NULL),
(412, 'Don Honorio Ventura Technological State University-Candaba', 5, NULL, NULL),
(413, 'Marymount Professional Colleges', 5, NULL, NULL),
(414, 'Gapan City College', 5, NULL, NULL),
(415, 'University of the Philippines- Manila School of Health Sciences Extension Campus-Baler', 5, NULL, NULL),
(416, 'University of the Philippines- Manila School of Health Sciences Extension Campus-Tarlac', 5, NULL, NULL),
(417, 'West Central College of Arts and Sciences', 5, NULL, NULL),
(418, 'Aurora State College of Technology', 5, NULL, NULL),
(419, 'Aurora State College of Technology-Bazal', 5, NULL, NULL),
(420, 'Aurora State College of Techonolgy-Casiguran', 5, NULL, NULL),
(421, 'Mount Carmel College-Baler', 5, NULL, NULL),
(422, 'Wesleyan University-Philippines-Aurora', 5, NULL, NULL),
(423, 'Philippine Merchant Marine Academy', 5, NULL, NULL),
(424, 'Polytechnic University of The Philippines-Pulilan', 5, NULL, NULL),
(425, 'Polytechnic University of the Philippines-Sta. Maria Bulacan', 5, NULL, NULL),
(426, 'Polytechnic University of the Philippines-Cabiao', 5, NULL, NULL),
(427, 'University of the Philippines-Diliman (Pampanga)', 5, NULL, NULL),
(428, 'University of the Philippines-Diliman (Olongapo City)', 5, NULL, NULL),
(429, 'STI College - San Jose del Monte', 5, NULL, NULL),
(430, 'Asia Pacific College of Business and Arts Inc.', 5, NULL, NULL),
(431, 'ACTS Computer College', 5, NULL, NULL),
(432, 'Batangas State University-Nasugbu', 5, NULL, NULL),
(433, 'Asia-Pacific Nazarene Theological Seminary', 5, NULL, NULL),
(434, 'Balian Community College', 5, NULL, NULL),
(435, 'Calauag Central College', 5, NULL, NULL),
(436, 'Canossa College - San Pablo ', 5, NULL, NULL),
(437, 'Private', 5, NULL, NULL),
(438, 'Cavite State University-Rosario Campus', 5, NULL, NULL),
(439, 'Cavite State University-Naic Campus', 5, NULL, NULL),
(440, 'Colegio de Los Baños', 5, NULL, NULL),
(441, 'Colegio De San Juan De Letran-Calamba', 5, NULL, NULL),
(442, 'De La Salle Lipa', 5, NULL, NULL),
(443, 'Deaf Evangelistic Alliance Foundation', 5, NULL, NULL),
(444, 'Divine Word Seminary', 5, NULL, NULL),
(445, 'De La Salle University-Dasmariñas', 5, NULL, NULL),
(446, 'De La Salle Health Sciences Institute', 5, NULL, NULL),
(447, 'Don Bosco College', 5, NULL, NULL),
(448, 'Cavite State University-Main', 5, NULL, NULL),
(449, 'Paete Science and Business College', 5, NULL, NULL),
(450, 'Eastern Quezon College', 5, NULL, NULL),
(451, 'Golden Gate Colleges', 5, NULL, NULL),
(452, 'Harris Memorial College', 5, NULL, NULL),
(453, 'Immaculate Conception College of Balayan', 5, NULL, NULL),
(454, 'Imus Institute of Science and Technology', 5, NULL, NULL),
(455, 'ICCT Colleges-Cainta', 5, NULL, NULL),
(456, 'Dr. Francisco L. Calingasan Memorial Colleges Foundation', 5, NULL, NULL),
(457, 'Laguna College', 5, NULL, NULL),
(458, 'Laguna State Polytechnic University-Sta. Cruz', 5, NULL, NULL),
(459, 'Laguna College of Business and Arts', 5, NULL, NULL),
(460, 'Laguna Northwestern College', 5, NULL, NULL),
(461, 'Laguna State Polytechnic University-Main', 5, NULL, NULL),
(462, 'Leon Guinto Memorial College', 5, NULL, NULL),
(463, 'Lipa City Colleges', 5, NULL, NULL),
(464, 'Laguna State Polytechnic University-Los Baños', 5, NULL, NULL),
(465, 'Lyceum of the Philippines University-Batangas', 5, NULL, NULL),
(466, 'Manuel S. Enverga University Foundation-Lucena', 5, NULL, NULL),
(467, 'Marcelino Fule Memorial College', 5, NULL, NULL),
(468, 'Calayan Educational Foundation', 5, NULL, NULL),
(469, 'Manuel S. Enverga University Foundation-Candelaria', 5, NULL, NULL),
(470, 'Manuel S. Enverga University Foundation-Catanauan', 5, NULL, NULL),
(471, 'National College of Business and Arts-Taytay', 5, NULL, NULL),
(472, 'Northern Quezon College', 5, NULL, NULL),
(473, 'Our Lady of Lourdes Seminary', 5, NULL, NULL),
(474, 'Batangas State University-Main', 5, NULL, NULL),
(475, 'Batangas State University-Balayan', 5, NULL, NULL),
(476, 'Batangas State University-Lipa City', 5, NULL, NULL),
(477, 'Batangas State University-Lobo', 5, NULL, NULL),
(478, 'Batangas State University-Rosario', 5, NULL, NULL),
(479, 'Batangas State University-San Juan', 5, NULL, NULL),
(480, 'University of Perpetual Help System-Laguna', 5, NULL, NULL),
(481, 'University of Perpetual Help System-Dr. Jose G. Tamayo Medical University', 5, NULL, NULL),
(482, 'Adventist University of the Philippines', 5, NULL, NULL),
(483, 'Philippine Normal University-Lopez', 5, NULL, NULL),
(484, 'PTS College and Advanced Studies', 5, NULL, NULL),
(485, 'Philippine State College of Aeronautics-Fernando Air Base', 5, NULL, NULL),
(486, 'Polytechnic University of the Philippines-Lopez', 5, NULL, NULL),
(487, 'Polytechnic University of the Philippines-Maragondon', 5, NULL, NULL),
(488, 'Polytechnic University of the Philippines-Unisan', 5, NULL, NULL),
(489, 'Quezonian Educational College', 5, NULL, NULL),
(490, 'Rizal College of Taal', 5, NULL, NULL),
(491, 'University of Rizal System-Tanay', 5, NULL, NULL),
(492, 'Rizal College of Laguna', 5, NULL, NULL),
(493, 'University of Rizal System-Morong', 5, NULL, NULL),
(494, 'FEU Roosevelt', 5, NULL, NULL),
(495, 'Sacred Heart College', 5, NULL, NULL),
(496, 'St. Anne College Lucena', 5, NULL, NULL),
(497, 'St. Bridget College', 5, NULL, NULL),
(498, 'St. Francis de Sales Major Seminary', 5, NULL, NULL),
(499, 'St. Joseph College of Cavite', 5, NULL, NULL),
(500, 'St. Louis Anne Colleges of San Pedro', 5, NULL, NULL),
(501, 'Saint Michael\'s College of Laguna', 5, NULL, NULL),
(502, 'Saint Paul Seminary', 5, NULL, NULL),
(503, 'St. Peter\'s College Seminary', 5, NULL, NULL),
(504, 'San Antonio de Padua College', 5, NULL, NULL),
(505, 'San Ildefonso College', 5, NULL, NULL),
(506, 'Laguna State Polytechnic University-San Pablo City', 5, NULL, NULL),
(507, 'San Pablo Colleges', 5, NULL, NULL),
(508, 'San Pedro College of Business Administration', 5, NULL, NULL),
(509, 'San Sebastian College-Recoletos de Cavite', 5, NULL, NULL),
(510, 'Siena College of Taytay', 5, NULL, NULL),
(511, 'Southeast Asia Interdisciplinary Development Institute', 5, NULL, NULL),
(512, 'Southern Luzon State University', 5, NULL, NULL),
(513, 'Tanauan Institute', 5, NULL, NULL),
(514, 'Tayabas Western Academy', 5, NULL, NULL),
(515, 'Tomas Claudio Colleges', 5, NULL, NULL),
(516, 'Technological University of the Philippines-Cavite', 5, NULL, NULL),
(517, 'Unciano Colleges', 5, NULL, NULL),
(518, 'Union College of Laguna', 5, NULL, NULL),
(519, 'University of the Philippines-Los Baños', 5, NULL, NULL),
(520, 'Western Colleges', 5, NULL, NULL),
(521, 'University of Batangas', 5, NULL, NULL),
(522, 'University of the Philippines-Open University', 5, NULL, NULL),
(523, 'STI College-Lucena', 5, NULL, NULL),
(524, 'University of Perpetual Help System Dalta-Molino ', 5, NULL, NULL),
(525, 'STI College-San Pablo', 5, NULL, NULL),
(526, 'STI College Calamba', 5, NULL, NULL),
(527, 'Dominican College of Sta. Rosa', 5, NULL, NULL),
(528, 'Kolehiyo ng Lungsod ng Lipa', 5, NULL, NULL),
(529, 'Saints John and Paul Educational Foundation', 5, NULL, NULL),
(530, 'Sta. Teresa College', 5, NULL, NULL),
(531, 'STI College-Bacoor', 5, NULL, NULL),
(532, 'STI College-Batangas', 5, NULL, NULL),
(533, 'STI College-Sta. Cruz', 5, NULL, NULL),
(534, 'STI College-Lipa', 5, NULL, NULL),
(535, 'Trace College', 5, NULL, NULL),
(536, 'Batangas State University-Malvar', 5, NULL, NULL),
(537, 'STI College Carmona', 5, NULL, NULL),
(538, 'AMA Computer College-Biñan', 5, NULL, NULL),
(539, 'Colegio De San Pedro', 5, NULL, NULL),
(540, 'La Consolacion College-Biñan', 5, NULL, NULL),
(541, 'Laguna Science and Technology College', 5, NULL, NULL),
(542, 'Mt. St. Aloysius Seminary', 5, NULL, NULL),
(543, 'Cainta Catholic College', 5, NULL, NULL),
(544, 'STI College Ortigas-Cainta', 5, NULL, NULL),
(545, 'Maryhill College', 5, NULL, NULL),
(546, 'Polytechnic University of the Philippines-Sto. Tomas', 5, NULL, NULL),
(547, 'Polytechnic University of the Philippines-Mulanay', 5, NULL, NULL),
(548, 'University of Perpetual Help System-GMA', 5, NULL, NULL),
(549, 'Philippine Missionary Institute', 5, NULL, NULL),
(550, 'Lemery Colleges', 5, NULL, NULL),
(551, 'AMA Computer College-Sta.Cruz', 5, NULL, NULL),
(552, 'Colegio San Agustin-Biñan', 5, NULL, NULL),
(553, 'AMA Computer College-East Rizal', 5, NULL, NULL),
(554, 'Oblates of Saint Joseph College of Philosophy', 5, NULL, NULL),
(555, 'Inter-Global College Foundation', 5, NULL, NULL),
(556, 'University of Perpetual Help System Dalta-Calamba', 5, NULL, NULL),
(557, 'Dalubhasaan ng Lungsod ng San Pablo', 5, NULL, NULL),
(558, 'St. Alphonsus School of Theology', 5, NULL, NULL),
(559, 'IETI College of Science and Technology', 5, NULL, NULL),
(560, 'Philippine National Police Academy', 5, NULL, NULL),
(561, 'Adventist International Institute of Advanced Studies', 5, NULL, NULL),
(562, 'Binangonan Catholic College', 5, NULL, NULL),
(563, 'AMA College-Cavite', 5, NULL, NULL),
(564, 'AMA Computer College-Batangas City', 5, NULL, NULL),
(565, 'Southern Luzon State University-Tagkawayan', 5, NULL, NULL),
(566, 'Emilio Aguinaldo College', 5, NULL, NULL),
(567, 'Alitagtag College', 5, NULL, NULL),
(568, 'AMA Computer College-Lipa City', 5, NULL, NULL),
(569, 'National College of Science and Technology (NCST) ', 5, NULL, NULL),
(570, 'University of Rizal System-Angono', 5, NULL, NULL),
(571, 'University of Rizal System-Pililia', 5, NULL, NULL),
(572, 'University of Rizal System-Rodriguez', 5, NULL, NULL),
(573, 'Rogationist College', 5, NULL, NULL),
(574, 'Southern Luzon State University-Infanta', 5, NULL, NULL),
(575, 'St. John Colleges', 5, NULL, NULL),
(576, 'Southern Luzon State University-Alabat', 5, NULL, NULL),
(577, 'Southern Luzon State University-Lucena', 5, NULL, NULL),
(578, 'Southern Luzon State University-Polilio', 5, NULL, NULL),
(579, 'AMA Computer College-Calamba', 5, NULL, NULL),
(580, 'AMA Computer College-Lucena', 5, NULL, NULL),
(581, 'Cavite West Point College', 5, NULL, NULL),
(582, 'Our Lady of Assumption College of Laguna', 5, NULL, NULL),
(583, 'Southern Philippines Institute of Science and Technology', 5, NULL, NULL),
(584, 'St. Matthew College', 5, NULL, NULL),
(585, 'World Citi Colleges-Antipolo City', 5, NULL, NULL),
(586, 'University of Rizal System-Binangonan', 5, NULL, NULL),
(587, 'ABE International Business College-Cainta', 5, NULL, NULL),
(588, 'First Asia Institute of Technology and Humanities', 5, NULL, NULL),
(589, 'Holy Child Jesus College', 5, NULL, NULL),
(590, 'Lyceum of the Philippines-Laguna', 5, NULL, NULL),
(591, 'St. Jude College Dasmarifias Cavite', 5, NULL, NULL),
(592, 'Saint Francis Institute of Computer Studies', 5, NULL, NULL),
(593, 'Cavite State University-Cavite City Campus', 5, NULL, NULL),
(594, 'LPU-St. Cabrini School of Health Sciences', 5, NULL, NULL),
(595, 'Baptist Bible Seminary and Institute', 5, NULL, NULL),
(596, 'Baptist Voice Bible College', 5, NULL, NULL),
(597, 'Calamba Doctors\' College', 5, NULL, NULL),
(598, 'LNC Corinthian Center', 5, NULL, NULL),
(599, 'STI College-Rosario', 5, NULL, NULL),
(600, 'Unida Christian Colleges', 5, NULL, NULL),
(601, 'Dalubhasaan ng Lungsod ng Lucena', 5, NULL, NULL),
(602, 'Casa Del Niño College', 5, NULL, NULL),
(603, 'Mabini College of Batangas', 5, NULL, NULL),
(604, 'STI College-Balayan', 5, NULL, NULL),
(605, 'STI College Santa Rosa', 5, NULL, NULL),
(606, 'University of Rizal System-Cainta', 5, NULL, NULL),
(607, 'University of Rizal System-Cardona', 5, NULL, NULL),
(608, 'University of Rizal System-Antipolo', 5, NULL, NULL),
(609, 'La Consolacion College-Tanauan', 5, NULL, NULL),
(610, 'DMMC Institute of Health Sciences', 5, NULL, NULL),
(611, 'Saint Francis of Assisi College-Cavite', 5, NULL, NULL),
(612, 'Olivarez College-Tagaytay', 5, NULL, NULL),
(613, 'St. Dominic College of Asia', 5, NULL, NULL),
(614, 'Power School of Technology', 5, NULL, NULL),
(615, 'PVVU CDCEC Calamba', 5, NULL, NULL),
(616, 'Pamantasan ng Cabuyao', 5, NULL, NULL),
(617, 'Our Lady of the Most Holy Rosary Seminary', 5, NULL, NULL),
(618, 'Batangas Eastern Colleges', 5, NULL, NULL),
(619, 'Batangas State University-Lemery', 5, NULL, NULL),
(620, 'Cavite State University-Carmona Campus', 5, NULL, NULL),
(621, 'Cavite State University-Imus Campus', 5, NULL, NULL),
(622, 'Ebenezer International Colleges', 5, NULL, NULL),
(623, 'Southdale International School of Science Arts and Techology', 5, NULL, NULL),
(624, 'ISHRM School System-Bacoor', 5, NULL, NULL),
(625, 'STI College-Dasmariñas', 5, NULL, NULL),
(626, 'QCRS College', 5, NULL, NULL),
(627, 'St. Francis de Sales Theological Seminary', 5, NULL, NULL),
(628, 'Gardner College Cainta', 5, NULL, NULL),
(629, 'PNTC Colleges', 5, NULL, NULL),
(630, 'International Peace Leadership College', 5, NULL, NULL),
(631, 'STI College-Tanauan', 5, NULL, NULL),
(632, 'Philippine Women\'s University-Career Development and Continuing Education Center-Sta. Cruz', 5, NULL, NULL),
(633, 'Manuel S. Enverga Institute Foundation-San Antonio', 5, NULL, NULL),
(634, 'All Nations College', 5, NULL, NULL),
(635, 'International Christian College of Manila', 5, NULL, NULL),
(636, 'Philippine International College', 5, NULL, NULL),
(637, 'Teodoro M. Luansing College of Rosario', 5, NULL, NULL),
(638, 'Colegio de Montalban', 5, NULL, NULL),
(639, 'Pambayang Kolehiyo ng Mauban', 5, NULL, NULL),
(640, 'Cavite State University-Trece Martires City Campus', 5, NULL, NULL),
(641, 'Our Lady of Assumption College-Cabuyao', 5, NULL, NULL),
(642, 'Skill Power Institute', 5, NULL, NULL),
(643, 'Oxfordian Colleges', 5, NULL, NULL),
(644, 'CVE Colleges', 5, NULL, NULL),
(645, 'City College of Calamba', 5, NULL, NULL),
(646, 'San Sebastian College Recoletos-Canlubang', 5, NULL, NULL),
(647, 'Laguna University', 5, NULL, NULL),
(648, 'Colegio ng Lungsod ng Batangas', 5, NULL, NULL),
(649, 'Westmead International School', 5, NULL, NULL),
(650, 'Agoncillo College', 5, NULL, NULL),
(651, 'Cavite State University-Silang Campus', 5, NULL, NULL),
(652, 'Batangas State University-Alangilan', 5, NULL, NULL),
(653, 'Colegio de Amore', 5, NULL, NULL),
(654, 'Far Eastern Polytechnic College', 5, NULL, NULL),
(655, 'Immanuel Theological Seminary', 5, NULL, NULL),
(656, 'Batangas College of Arts and Sciences', 5, NULL, NULL),
(657, 'University of Rizal System-Taytay', 5, NULL, NULL),
(658, 'Southern Luzon State University-Tiaong Campus', 5, NULL, NULL),
(659, 'Malayan Colleges of Laguna', 5, NULL, NULL),
(660, 'City College of Tagaytay', 5, NULL, NULL),
(661, 'NYK-TDG Maritime Academy', 5, NULL, NULL),
(662, 'Brookfield College in Cavite', 5, NULL, NULL),
(663, 'Sumulong College of Arts & Sciences (SCAS)', 5, NULL, NULL),
(664, 'St. Vincent College of Cabuyao', 5, NULL, NULL),
(665, 'Our Lady of Fatima University-Antipolo', 5, NULL, NULL),
(666, 'STI College-Tanay', 5, NULL, NULL),
(667, 'Lyceum of the Philippines-Cavite', 5, NULL, NULL),
(668, 'Asian Institute of Technology and Education-Tiaong Campus', 5, NULL, NULL),
(669, 'Cavite State University-Tanza Campus', 5, NULL, NULL),
(670, 'Cavite State University-Bacoor City Campus', 5, NULL, NULL),
(671, 'Cavite State University-General Trias Campus', 5, NULL, NULL),
(672, 'San Mateo Municipal College', 5, NULL, NULL),
(673, 'Philippine Best Training Systems Colleges', 5, NULL, NULL),
(674, 'St. Joseph\'s College of Rodriguez', 5, NULL, NULL),
(675, 'Trece Martires City College', 5, NULL, NULL),
(676, 'Southern Luzon State University-Gumaca Campus', 5, NULL, NULL),
(677, 'Colegio de Porta Vaga', 5, NULL, NULL),
(678, 'STI College-Tagaytay', 5, NULL, NULL),
(679, 'Colegio de Santo Cristo de Burgos', 5, NULL, NULL),
(680, 'East Systems College of Rizal', 5, NULL, NULL),
(681, 'Alpha Centauri Educational System', 5, NULL, NULL),
(682, 'Asian School of Hospitality Arts', 5, NULL, NULL),
(683, 'Laguna Northwestern College-SLRMC', 5, NULL, NULL),
(684, 'FEU Cavite', 5, NULL, NULL),
(685, 'Trimex Colleges', 5, NULL, NULL),
(686, 'Granby Colleges of Science & Technology', 5, NULL, NULL),
(687, 'Kurios Christian Colleges Foundation', 5, NULL, NULL),
(688, 'ABE International Business College-Quezon', 5, NULL, NULL),
(689, 'Acts Computer College-Infanta', 5, NULL, NULL),
(690, 'Asia-Pacific Christian College and Seminary', 5, NULL, NULL),
(691, 'Asia Technological School of Science and Arts (ASIATECH)', 5, NULL, NULL),
(692, 'CSTC College of Sciences Technology and Communications-Sariaya', 5, NULL, NULL),
(693, 'Evangelical Theological College of the Philippines-Luzon', 5, NULL, NULL),
(694, 'Guinayangan College Foundation', 5, NULL, NULL),
(695, 'ICCT Colleges-Antipolo', 5, NULL, NULL),
(696, 'ICCT Colleges-San Mateo', 5, NULL, NULL),
(697, 'Jesus Reigns Christian College-Amadeo Foundation', 5, NULL, NULL),
(698, 'Laguna Maritime Arts and Business Colleges', 5, NULL, NULL),
(699, 'Mary Help of Christian College Salesian Sisters', 5, NULL, NULL),
(700, 'PIMSAT Colleges-Bacoor', 5, NULL, NULL),
(701, 'South Forbes City College', 5, NULL, NULL),
(702, 'The Bearer of Light and Wisdom Colleges', 5, NULL, NULL),
(703, 'University of Batangas-Lipa', 5, NULL, NULL),
(704, 'West Point College-Magallanes', 5, NULL, NULL),
(705, 'Young Ji College', 5, NULL, NULL),
(706, 'Southern Luzon State University-Catanauan', 5, NULL, NULL),
(707, 'ACLC College of Taytay', 5, NULL, NULL),
(708, 'College of Arts and Sciences of Asia and the Pacific', 5, NULL, NULL),
(709, 'New Sinai School and Colleges-Sta. Rosa', 5, NULL, NULL),
(710, 'St. Mary Magdalene Colleges of Laguna', 5, NULL, NULL),
(711, 'BWEST College', 5, NULL, NULL),
(712, 'Center for Biblical Studies Institute & Seminary', 5, NULL, NULL),
(713, 'Grain of Wheat College', 5, NULL, NULL),
(714, 'ICT-ED Institute of Science and Technology', 5, NULL, NULL),
(715, 'ICCT Colleges-Binangonan', 5, NULL, NULL),
(716, 'ICCT Colleges-Taytay', 5, NULL, NULL),
(717, 'Mater Redemptoris Collegium', 5, NULL, NULL),
(718, 'Mind and Integrity College', 5, NULL, NULL),
(719, 'College of Saint John Paul II Arts And Sciences', 5, NULL, NULL),
(720, 'St. Augustine School of Nursing-Lipa', 5, NULL, NULL),
(721, 'Paul College of Leadership', 5, NULL, NULL),
(722, 'ACLC College of San Pablo', 5, NULL, NULL),
(723, 'Citi Global College-Biñan', 5, NULL, NULL),
(724, 'Far East Asia Pacific Institute of Tourism Science and Technology', 5, NULL, NULL),
(725, 'Guardian Bona Fide for Hope Foundation', 5, NULL, NULL),
(726, 'St. Augustine School of Nursing - Lucena', 5, NULL, NULL),
(727, 'Nova Schola Tanauan', 5, NULL, NULL),
(728, 'Daehan College of Business and Technology', 5, NULL, NULL),
(729, 'Citi Global College-Cabuyao', 5, NULL, NULL),
(730, 'New Era University - Lipa Campus', 5, NULL, NULL),
(731, 'Saint Joseph College of Rosario Batangas', 5, NULL, NULL),
(732, 'CARD-MRI Development Institute', 5, NULL, NULL),
(733, 'Colegio de Sto. Domingo de Silos', 5, NULL, NULL),
(734, 'Our Lady of La Sallete College Seminary', 5, NULL, NULL),
(735, 'Antipolo Institute of Technology (AITECH) ', 5, NULL, NULL),
(736, 'Marasigan Institute of Science and Technology (M.I.S.T.) ', 5, NULL, NULL),
(737, 'Renaissance School of Science and Technology', 5, NULL, NULL),
(738, 'Tanauan City College', 5, NULL, NULL),
(739, 'Grabsum School', 5, NULL, NULL),
(740, 'Royal British College', 5, NULL, NULL),
(741, 'Sapphire International Aviation Academy', 5, NULL, NULL),
(742, 'Southbay Montessori School and Colleges', 5, NULL, NULL),
(743, 'St. Ignatius Technical Institute of Business and Arts', 5, NULL, NULL),
(744, 'Westbridge Institute of Technology', 5, NULL, NULL),
(745, 'AISAT College-Dasmariñas', 5, NULL, NULL),
(746, 'Lyceum de San Pablo', 5, NULL, NULL),
(747, 'MOL Magsaysay Maritime Academy', 5, NULL, NULL),
(748, 'Southern Luzon College of Business Maritime Science and Technology', 5, NULL, NULL),
(749, 'One Cainta College', 5, NULL, NULL),
(750, 'Informatics College Cavite', 5, NULL, NULL),
(751, 'New Era University-Baras Campus', 5, NULL, NULL),
(752, 'NU Sports Academy', 5, NULL, NULL),
(753, 'Olinsterg College', 5, NULL, NULL),
(754, 'Our Lady of Fatima University-Laguna', 5, NULL, NULL),
(755, 'Red Link Institute of Science & Technology', 5, NULL, NULL),
(756, 'Saint Peter\'s School (Calauag)', 5, NULL, NULL),
(757, 'CSTC College of Sciences Technology and Communications-Atimonan', 5, NULL, NULL),
(758, 'De La Salle-College of Saint Benilde-Antipolo', 5, NULL, NULL),
(759, 'Saint Benilde International School-Calamba', 5, NULL, NULL),
(760, 'St. Ignatius Technical Institute of Business and Arts-Cabuyao', 5, NULL, NULL),
(761, 'St. Therese College of Arts and Sciences', 5, NULL, NULL),
(762, 'Victory Elijah Christian College', 5, NULL, NULL),
(763, 'FCD Central Institute', 5, NULL, NULL),
(764, 'Magna Anima Teachers College', 5, NULL, NULL),
(765, 'St. John Bosco College of Tayabas', 5, NULL, NULL),
(766, 'Kolehiyo ng Lungsod ng Dasmariñas', 5, NULL, NULL),
(767, 'Colegio de La Ciudad de Tayabas', 5, NULL, NULL),
(768, 'First Industrial Science and Technology College', 5, NULL, NULL),
(769, 'Lyceum of Southern Luzon', 5, NULL, NULL),
(770, 'NU Dasmariñas', 5, NULL, NULL),
(771, 'Philippine Technological Institute of Science Arts and Trade-Central', 5, NULL, NULL),
(772, 'Samuel Christian College of General Trias', 5, NULL, NULL),
(773, 'St. Peregrine Institute', 5, NULL, NULL),
(774, 'CITI Global College-Calamba', 5, NULL, NULL),
(775, 'Manuel S. Enverga University Foundation-Calauag', 5, NULL, NULL),
(776, 'Eastern Star Academy', 5, NULL, NULL),
(777, 'Batangas State University-Mabini', 5, NULL, NULL),
(778, 'Southern Luzon State University-Tayabas', 5, NULL, NULL),
(779, 'Asian Seminary of Christian Ministries', 5, NULL, NULL),
(780, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology-Cavite', 5, NULL, NULL),
(781, 'Polytechnic University of the Philippines-San Pedro', 5, NULL, NULL),
(782, 'Polytechnic University of the Philippines-Sta. Rosa', 5, NULL, NULL),
(783, 'Polytechnic University of the Philippines-Calauan', 5, NULL, NULL),
(784, 'Polytechnic University of the Philippines-Biñan', 5, NULL, NULL),
(785, 'Polytechnic University of the Philippines-General Luna Quezon', 5, NULL, NULL),
(786, 'Polytechnic University of the Philippines-Alfonso', 5, NULL, NULL),
(787, 'Guang Ming College', 5, NULL, NULL),
(788, 'NU Lipa', 5, NULL, NULL),
(789, 'St. Ignatius Technical Institute of Business and Arts-Biñan', 5, NULL, NULL),
(790, 'Trent Information First Technical Career Institute', 5, NULL, NULL),
(791, 'Cavite Integrated College', 5, NULL, NULL),
(792, 'Angono Catholic College', 5, NULL, NULL),
(793, 'Aemilianum College', 5, NULL, NULL),
(794, 'Ago Medical and Educational Center', 5, NULL, NULL),
(795, 'Bicol Christian College of Medicine', 5, NULL, NULL),
(796, 'De Vera Institute of Technology', 5, NULL, NULL),
(797, 'Annunciation College of Bacon Sorsogon Unit', 5, NULL, NULL),
(798, 'University of Santo Tomas-Legazpi', 5, NULL, NULL),
(799, 'Ateneo de Naga University', 5, NULL, NULL),
(800, 'Bicol College', 5, NULL, NULL),
(801, 'Bicol State College of Applied Sciences and Technology', 5, NULL, NULL),
(802, 'Central Bicol State University of Agriculture-Sipocot', 5, NULL, NULL),
(803, 'Bicol Merchant Marine College', 5, NULL, NULL),
(804, 'Bicol University-Main', 5, NULL, NULL),
(805, 'Bicol University-Daraga Campus', 5, NULL, NULL),
(806, 'Bicol University-College of Agriculture and Forestry', 5, NULL, NULL),
(807, 'Bicol University-Tabaco Campus', 5, NULL, NULL),
(808, 'Camarines Norte College', 5, NULL, NULL),
(809, 'Camarines Norte State College-Main', 5, NULL, NULL),
(810, 'City College of Naga', 5, NULL, NULL),
(811, 'Camarines Sur Polytechnic Colleges', 5, NULL, NULL),
(812, 'Central Bicol State University of Agriculture-Main', 5, NULL, NULL),
(813, 'Caramoan Community College', 5, NULL, NULL),
(814, 'Cataingan Municipal College', 5, NULL, NULL),
(815, 'Catanduanes State University-Panganiban', 5, NULL, NULL),
(816, 'Catanduanes Colleges', 5, NULL, NULL),
(817, 'Catanduanes State University-Main', 5, NULL, NULL),
(818, 'Ceguera Technological Colleges', 5, NULL, NULL),
(819, 'St. Louise De Marillac College of Sorsogon', 5, NULL, NULL),
(820, 'Universidad de Sta. Isabel', 5, NULL, NULL),
(821, 'Computer Arts and Technological College', 5, NULL, NULL),
(822, 'Computer Communication Development Institute-Naga', 5, NULL, NULL),
(823, 'Daniel B. Peña Memorial College Foundation', 5, NULL, NULL),
(824, 'Divine Word College of Legazpi', 5, NULL, NULL),
(825, 'Dr. Emilio B. Espinosa Sr. Memorial State College of Agriculture and Technology', 5, NULL, NULL),
(826, 'Felix O. Alfelor Sr. Foundation College', 5, NULL, NULL),
(827, 'Alfelor Sr. Memorial College', 5, NULL, NULL),
(828, 'Fatima School of Science and Technology', 5, NULL, NULL),
(829, 'Holy Rosary Major Seminary', 5, NULL, NULL),
(830, 'Holy Trinity College of Camarines Sur', 5, NULL, NULL),
(831, 'Immaculate Conception College-Albay', 5, NULL, NULL),
(832, 'La Consolacion College-Iriga City', 5, NULL, NULL),
(833, 'La Consolacion College-Daet', 5, NULL, NULL),
(834, 'Liceo de Masbate', 5, NULL, NULL),
(835, 'Liceo de San Jacinto Foundation', 5, NULL, NULL),
(836, 'Ligao Community College', 5, NULL, NULL),
(837, 'Mabini Colleges', 5, NULL, NULL),
(838, 'Mariners\' Polytechnic Colleges Foundation of Canaman', 5, NULL, NULL),
(839, 'Mariners\' Polytechnic Colleges Foundation of Naga City', 5, NULL, NULL),
(840, 'Mariners\' Polytechnic Colleges Foundation of Legazpi City', 5, NULL, NULL),
(841, 'Masbate Colleges', 5, NULL, NULL),
(842, 'Mater Salutis College Seminary', 5, NULL, NULL),
(843, 'Naga College Foundation', 5, NULL, NULL),
(844, 'Osmeña Colleges', 5, NULL, NULL),
(845, 'Our Lady of Lourdes College Foundation', 5, NULL, NULL),
(846, 'Our Lady of Peñafrancia Seminary', 5, NULL, NULL),
(847, 'Partido College', 5, NULL, NULL),
(848, 'Partido State University-Main', 5, NULL, NULL),
(849, 'Perpetual Help Paramedical School', 5, NULL, NULL),
(850, 'Pili Capital College', 5, NULL, NULL),
(851, 'Polangui Community College', 5, NULL, NULL),
(852, 'Polytechnic Institute of Tabaco', 5, NULL, NULL),
(853, 'Naga View Adventist College', 5, NULL, NULL),
(854, 'R.G. de Castro Colleges', 5, NULL, NULL),
(855, 'Republic Colleges of Guinobatan', 5, NULL, NULL),
(856, 'San Jose Community College', 5, NULL, NULL),
(857, 'Bicol University-Polangui Campus', 5, NULL, NULL);
INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`, `institution_hrId`, `institution_datetime`) VALUES
(858, 'Sorsogon State University-Main', 5, NULL, NULL),
(859, 'Southern Bicol Colleges', 5, NULL, NULL),
(860, 'Southern Luzon Institute', 5, NULL, NULL),
(861, 'Southern Masbate Roosevelt College', 5, NULL, NULL),
(862, 'Tabaco College', 5, NULL, NULL),
(863, 'Tanchuling College', 5, NULL, NULL),
(864, 'University of Northeastern Philippines', 5, NULL, NULL),
(865, 'University of Nueva Caceres', 5, NULL, NULL),
(866, 'University of Saint Anthony', 5, NULL, NULL),
(867, 'Veritas College of Irosin', 5, NULL, NULL),
(868, 'Worldtech Resources Foundation-Naga City', 5, NULL, NULL),
(869, 'Worldtech Resources Foundation-Iriga City', 5, NULL, NULL),
(870, 'Camarines Norte State College-Labo Campus', 5, NULL, NULL),
(871, 'Camarines Norte State College-Mercedes Campus', 5, NULL, NULL),
(872, 'Camarines Norte State College-Panganiban Campus', 5, NULL, NULL),
(873, 'Central Bicol State University of Agriculture-Calabanga', 5, NULL, NULL),
(874, 'STI College-Legazpi', 5, NULL, NULL),
(875, 'Partido State University-Sagñay Campus', 5, NULL, NULL),
(876, 'Lower Isarog Foundation Exponent', 5, NULL, NULL),
(877, 'Partido State University-San Jose Campus', 5, NULL, NULL),
(878, 'Sorsogon State University-Bulan Campus', 5, NULL, NULL),
(879, 'Sorsogon State University-Magallanes Campus', 5, NULL, NULL),
(880, 'Sorsogon State University-Castilla Campus', 5, NULL, NULL),
(881, 'Speed Computer College', 5, NULL, NULL),
(882, 'Partido State University-Tinambac Campus', 5, NULL, NULL),
(883, 'Tiwi Community College', 5, NULL, NULL),
(884, 'Zamora Memorial College', 5, NULL, NULL),
(885, 'Colegio De Sta. Monica of Polangui', 5, NULL, NULL),
(886, 'Computer Communication Development Institute-Legazpi City', 5, NULL, NULL),
(887, 'Rapu-Rapu Community College', 5, NULL, NULL),
(888, 'Sorsogon College of Criminology', 5, NULL, NULL),
(889, 'St. Peter Baptist College Foundation', 5, NULL, NULL),
(890, 'AMA Computer College-Legazpi City', 5, NULL, NULL),
(891, 'Dr. Carlos S. Lanting College-Dr. Ruby Lanting Casaul Educational Foundation', 5, NULL, NULL),
(892, 'PLT College of Guinobatan', 5, NULL, NULL),
(893, 'Holy Trinity College Seminary', 5, NULL, NULL),
(894, 'AMA Computer College-Naga City', 5, NULL, NULL),
(895, 'Camarines Norte School of Law Arts and Sciences', 5, NULL, NULL),
(896, 'Solis Institute of Technology', 5, NULL, NULL),
(897, 'The Lewis College', 5, NULL, NULL),
(898, 'West Coast College', 5, NULL, NULL),
(899, 'Oas Community College', 5, NULL, NULL),
(900, 'Libon Community College', 5, NULL, NULL),
(901, 'Sta. Elena (Camarines Norte) College', 5, NULL, NULL),
(902, 'Baao Community College', 5, NULL, NULL),
(903, 'Brentwood College of Asia International School', 5, NULL, NULL),
(904, 'Partido State University-Salogon Campus', 5, NULL, NULL),
(905, 'Partido State University-Caramoan Campus', 5, NULL, NULL),
(906, 'Partido State University-Lagonoy Campus', 5, NULL, NULL),
(907, 'Calabanga Community College', 5, NULL, NULL),
(908, 'Capalonga College', 5, NULL, NULL),
(909, 'Southern Luzon Technological College Foundation-Legazpi', 5, NULL, NULL),
(910, 'Our Lady of Salvation College', 5, NULL, NULL),
(911, 'Daraga Community College', 5, NULL, NULL),
(912, 'Aeronautical Academy of the Philippines', 5, NULL, NULL),
(913, 'Computer Communication Development Institute-Sorsogon', 5, NULL, NULL),
(914, 'Amando Cope College', 5, NULL, NULL),
(915, 'Luis H. Dilanco Sr. Foundation College', 5, NULL, NULL),
(916, 'Regina Mondi College', 5, NULL, NULL),
(917, 'Siena College-Tigaon', 5, NULL, NULL),
(918, 'Balud Municipal College', 5, NULL, NULL),
(919, 'Camarines Norte State College-Entienza Campus', 5, NULL, NULL),
(920, 'Estenias Science Foundation School', 5, NULL, NULL),
(921, 'Our Lady of the Most Holy Trinity College Seminary', 5, NULL, NULL),
(922, 'Christian Polytechnic Institute of Catanduanes', 5, NULL, NULL),
(923, 'Community College of Manito', 5, NULL, NULL),
(924, 'Forbes College', 5, NULL, NULL),
(925, 'Bicol University Gubat Campus', 5, NULL, NULL),
(926, 'Shepherdville College', 5, NULL, NULL),
(927, 'ACLC College of Daet', 5, NULL, NULL),
(928, 'ACLC College of Sorsogon', 5, NULL, NULL),
(929, 'STI College-Naga City', 5, NULL, NULL),
(930, 'Infotech Development Systems Colleges', 5, NULL, NULL),
(931, 'Southern Luzon Technological College Foundation-Pilar', 5, NULL, NULL),
(932, 'Southern Luzon Technological College Foundation-Pioduran', 5, NULL, NULL),
(933, 'Philippine Computer Foundation College-Pili', 5, NULL, NULL),
(934, 'Central Bicol State University of Agriculture-Pasacao', 5, NULL, NULL),
(935, 'Belen B. Francisco Foundation-Albay', 5, NULL, NULL),
(936, 'Camarines Norte College of Arts and Business', 5, NULL, NULL),
(937, 'ACLC College of Iriga City', 5, NULL, NULL),
(938, 'Computer Arts and Technological College-Polangui Campus', 5, NULL, NULL),
(939, 'Computer Arts and Technological College-Ligao City', 5, NULL, NULL),
(940, 'Mountview College', 5, NULL, NULL),
(941, 'Aroroy Municipal College', 5, NULL, NULL),
(942, 'Computer Systems Institute', 5, NULL, NULL),
(943, 'SPJ International Technology Institute', 5, NULL, NULL),
(944, 'Cataingan Polytechnic Institute', 5, NULL, NULL),
(945, 'Masbate Polytechnic and Development College', 5, NULL, NULL),
(946, 'Donsol Community College', 5, NULL, NULL),
(947, 'San Pascual Polytechnic College', 5, NULL, NULL),
(948, 'Masbate Central Technical Institute', 5, NULL, NULL),
(949, 'Camarines Norte State College-Abaño Campus', 5, NULL, NULL),
(950, 'Bicol Training and Technological College', 5, NULL, NULL),
(951, 'St. Francis Carraciolo Culinary Academy', 5, NULL, NULL),
(952, 'Governor Mariano E. Villafuerte Community College-Garchitorena', 5, NULL, NULL),
(953, 'Governor Mariano E. Villafuerte Community College-Libmanan', 5, NULL, NULL),
(954, 'Governor Mariano E. Villafuerte Community College-Siruma', 5, NULL, NULL),
(955, 'BST Grace College', 5, NULL, NULL),
(956, 'Governor Mariano E. Villafuerte Community College-Tinambac', 5, NULL, NULL),
(957, 'Sta. Elena Institute of Science and Technology', 5, NULL, NULL),
(958, 'Lyceum of St. Dominic', 5, NULL, NULL),
(959, 'Northills College of Asia (NCA)', 5, NULL, NULL),
(960, 'King Thomas Learning Academy', 5, NULL, NULL),
(961, 'Buhi St. Joseph Academy', 5, NULL, NULL),
(962, 'Polytechnic University of the Philippines-Ragay', 5, NULL, NULL),
(963, 'Goa Community College', 5, NULL, NULL),
(964, 'MRDA Academic Center', 5, NULL, NULL),
(965, 'Nazareth Institute of Alfonso', 5, NULL, NULL),
(966, 'Camo Integrated School', 5, NULL, NULL),
(967, 'Aklan Catholic College', 5, NULL, NULL),
(968, 'Aklan State University-New Washington', 5, NULL, NULL),
(969, 'Aklan Polytechnic College', 5, NULL, NULL),
(970, 'Aklan State University-Banga Campus', 5, NULL, NULL),
(971, 'University of Antique - Hamtic', 5, NULL, NULL),
(972, 'ACSI College Iloilo', 5, NULL, NULL),
(973, 'Bago City College', 5, NULL, NULL),
(974, 'Northern Iloilo State University-Batad Campus', 5, NULL, NULL),
(975, 'Binalbagan Catholic College', 5, NULL, NULL),
(976, 'Cabalum Western College', 5, NULL, NULL),
(977, 'Cabarrus Catholic College', 5, NULL, NULL),
(978, 'West Visayas State University-Calinog Campus', 5, NULL, NULL),
(979, 'Capiz State University-Main', 5, NULL, NULL),
(980, 'Carlos Hilado Memorial State University-Bacolod Campus', 5, NULL, NULL),
(981, 'Carlos Hilado Memorial State University-Main', 5, NULL, NULL),
(982, 'Central Philippine Adventist College', 5, NULL, NULL),
(983, 'Central Philippine University', 5, NULL, NULL),
(984, 'Colegio de la Purisima Concepcion', 5, NULL, NULL),
(985, 'Colegio San Agustin-Bacolod', 5, NULL, NULL),
(986, 'Colegio de San Jose-Jaro', 5, NULL, NULL),
(987, 'Colegio De Santa Rita De San Carlos', 5, NULL, NULL),
(988, 'Colegio del Sagrado Corazon de Jesus', 5, NULL, NULL),
(989, 'Northern Iloilo State University-Concepcion Campus', 5, NULL, NULL),
(990, 'Vicente A. Javier Memorial Community College', 5, NULL, NULL),
(991, 'Iloilo State College of Fisheries-Dingle Campus', 5, NULL, NULL),
(992, 'Iloilo State college of Fisheries-Dumangas Campus', 5, NULL, NULL),
(993, 'Fellowship Baptist College Of Kabankalan', 5, NULL, NULL),
(994, 'Filamer Christian University', 5, NULL, NULL),
(995, 'Garcia College of Technology', 5, NULL, NULL),
(996, 'Guimaras State College-Main', 5, NULL, NULL),
(997, 'Guimaras State College-Mosqueda', 5, NULL, NULL),
(998, 'Iloilo Doctors\' College', 5, NULL, NULL),
(999, 'Iloilo Doctors\' College of Medicine', 5, NULL, NULL),
(1000, 'Iloilo State College of Fisheries-Main', 5, NULL, NULL),
(1001, 'Northern Negros State College of Science and Technology', 5, NULL, NULL),
(1002, 'Northern Negros State College of Science and Technology-Escalante', 5, NULL, NULL),
(1003, 'Northern Negros State College of Science and Technology-Calatrava', 5, NULL, NULL),
(1004, 'John B. Lacson Colleges Foundation-Bacolod', 5, NULL, NULL),
(1005, 'John B. Lacson Foundation Maritime University-Molo', 5, NULL, NULL),
(1006, 'John B. Lacson Foundation Maritime University-Arevalo', 5, NULL, NULL),
(1007, 'Kabankalan Catholic College', 5, NULL, NULL),
(1008, 'La Carlota City College', 5, NULL, NULL),
(1009, 'La Consolacion College-Bacolod', 5, NULL, NULL),
(1010, 'La Consolacion College-Isabela', 5, NULL, NULL),
(1011, 'West Visayas State University-Lambunao Campus', 5, NULL, NULL),
(1012, 'Iloilo Science and Technology University-Leon Campus', 5, NULL, NULL),
(1013, 'Mount Carmel College', 5, NULL, NULL),
(1014, 'St. Therese-MTC Colleges-Tigbauan', 5, NULL, NULL),
(1015, 'Central Philippines State University-Main Campus', 5, NULL, NULL),
(1016, 'Carlos Hilado Memorial State Universit -College of Fisheries-Binalbagan', 5, NULL, NULL),
(1017, 'Northern Iloilo State University-Barotac Viejo Campus', 5, NULL, NULL),
(1018, 'North Negros College', 5, NULL, NULL),
(1019, 'Northern Iloilo State University-Estancia Iloilo', 5, NULL, NULL),
(1020, 'Northwestern Visayan Colleges', 5, NULL, NULL),
(1021, 'Capiz State University-Burias Campus', 5, NULL, NULL),
(1022, 'Philippine Normal University-Cadiz', 5, NULL, NULL),
(1023, 'University of Antique - Main', 5, NULL, NULL),
(1024, 'West Visayas State University-Pototan Campus', 5, NULL, NULL),
(1025, 'Capiz State University-Pontevedra Campus', 5, NULL, NULL),
(1026, 'Riverside College', 5, NULL, NULL),
(1027, 'Aklan State University-Kalibo Campus', 5, NULL, NULL),
(1028, 'St. Anthony College of Roxas City', 5, NULL, NULL),
(1029, 'Saint Anthony\'s College-Antique', 5, NULL, NULL),
(1030, 'Saint Gabriel College', 5, NULL, NULL),
(1031, 'St. Paul University of Iloilo', 5, NULL, NULL),
(1032, 'St. Vincent Ferrer Seminary', 5, NULL, NULL),
(1033, 'Iloilo State College of Fisheries-San Enrique Campus', 5, NULL, NULL),
(1034, 'Sancta Maria Mater et Regina Seminarium', 5, NULL, NULL),
(1035, 'Silay Institute', 5, NULL, NULL),
(1036, 'Iloilo Science and Technology University-Miagao Campus', 5, NULL, NULL),
(1037, 'Santo Niño Seminary', 5, NULL, NULL),
(1038, 'University of Antique - Tario Lim Antique School of Fisheries', 5, NULL, NULL),
(1039, 'Technological University of the Philippines-Visayas', 5, NULL, NULL),
(1040, 'University of Iloilo', 5, NULL, NULL),
(1041, 'University of Negros Occidental-Recoletos', 5, NULL, NULL),
(1042, 'University of Saint La Salle', 5, NULL, NULL),
(1043, 'University of San Agustin', 5, NULL, NULL),
(1044, 'University of The Philippines-Visayas', 5, NULL, NULL),
(1045, 'Northern Iloilo State University-Sara Campus', 5, NULL, NULL),
(1046, 'VMA Global College', 5, NULL, NULL),
(1047, 'STI West Negros University', 5, NULL, NULL),
(1048, 'West Visayas State University-Main', 5, NULL, NULL),
(1049, 'Western Institute of Technology', 5, NULL, NULL),
(1050, 'Iloilo Science and Technology University-Main', 5, NULL, NULL),
(1051, 'West Visayas State University-Janiuay Campus', 5, NULL, NULL),
(1052, 'Northern Iloilo State University-Lemery Campus', 5, NULL, NULL),
(1053, 'Iloilo State College of Fisheries-Barotac Nuevo Campus', 5, NULL, NULL),
(1054, 'Northern Iloilo State University-Ajuy Campus', 5, NULL, NULL),
(1055, 'Capiz State University-Sigma Campus', 5, NULL, NULL),
(1056, 'Aklan State University-Ibajay Campus', 5, NULL, NULL),
(1057, 'Aklan State University-Makato', 5, NULL, NULL),
(1058, 'Pandan Bay Institute', 5, NULL, NULL),
(1059, 'Batan Integrated College of Technology', 5, NULL, NULL),
(1060, 'Bacolod City College', 5, NULL, NULL),
(1061, 'Tañon College', 5, NULL, NULL),
(1062, 'AMA Computer College-Bacolod', 5, NULL, NULL),
(1063, 'AMA Computer College-Iloilo', 5, NULL, NULL),
(1064, 'Interface Computer College-Iloilo', 5, NULL, NULL),
(1065, 'College of St. John-Roxas', 5, NULL, NULL),
(1066, 'Mater Dei College-Silay City', 5, NULL, NULL),
(1067, 'St. Therese-MTC Colleges-La Fiesta', 5, NULL, NULL),
(1068, 'Carlos Hilado Memorial State University-Alijis', 5, NULL, NULL),
(1069, 'Iloilo Science and Technology University-Dumangas Campus', 5, NULL, NULL),
(1070, 'Iloilo Science and Technology University-Barotac Nuevo Campus', 5, NULL, NULL),
(1071, 'ABE International Business College-Bacolod City', 5, NULL, NULL),
(1072, 'Integrated Midwives Association of the Philippines Foundation School of Midwifery', 5, NULL, NULL),
(1073, 'Central Philippines State University-Cauayan Campus', 5, NULL, NULL),
(1074, 'Central Philippines State University-Sipalay Campus', 5, NULL, NULL),
(1075, 'Capiz State University-Pilar Campus', 5, NULL, NULL),
(1076, 'Capiz State University-Tapaz Campus', 5, NULL, NULL),
(1077, 'St. Therese-MTC Colleges-Magdalo', 5, NULL, NULL),
(1078, 'ABE International Business College-Iloilo', 5, NULL, NULL),
(1079, 'Capiz State University-Dumarao Campus', 5, NULL, NULL),
(1080, 'Central Philippines State University-Ilog Campus', 5, NULL, NULL),
(1081, 'STI College-Kalibo', 5, NULL, NULL),
(1082, 'Convention Baptist Bible College', 5, NULL, NULL),
(1083, 'Hercor College', 5, NULL, NULL),
(1084, 'Libacao College of Science and Technology', 5, NULL, NULL),
(1085, 'Altavas College', 5, NULL, NULL),
(1086, 'Balete Community College', 5, NULL, NULL),
(1087, 'Passi City College', 5, NULL, NULL),
(1088, 'Capiz State University-Poblacion Mambusao', 5, NULL, NULL),
(1089, 'Capiz State University-Dayao', 5, NULL, NULL),
(1090, 'Sacred Heart Seminary (Bacolod) School', 5, NULL, NULL),
(1091, 'Saint John Mary Vianney Seminary College', 5, NULL, NULL),
(1092, 'Central Philippines State University-Moises Padilla Campus', 5, NULL, NULL),
(1093, 'Central Philippines State University-Hinoba-an Campus', 5, NULL, NULL),
(1094, 'Central Philippines State University-Candoni', 5, NULL, NULL),
(1095, 'St. Vincent College of Science and Technology', 5, NULL, NULL),
(1096, 'Southland College of Kabankalan City', 5, NULL, NULL),
(1097, 'CEDAR College', 5, NULL, NULL),
(1098, 'Advance Central College', 5, NULL, NULL),
(1099, 'GSEF College', 5, NULL, NULL),
(1100, 'West Visayas State University-College of Agriculture and Forestry Lambunao', 5, NULL, NULL),
(1101, 'West Visayas State University-Himamaylan Campus Extension', 5, NULL, NULL),
(1102, 'Central Philippines State University-Hinigaran Campus', 5, NULL, NULL),
(1103, 'ACLC College of Iloilo', 5, NULL, NULL),
(1104, 'Central Philippines State University - Victorias City Campus', 5, NULL, NULL),
(1105, 'Colegio de Sta. Ana de Victorias', 5, NULL, NULL),
(1106, 'Santa Isabel College of Iloilo City', 5, NULL, NULL),
(1107, 'Hua Siong College of Iloilo', 5, NULL, NULL),
(1108, 'Central Philippines State University - San Carlos Campus', 5, NULL, NULL),
(1109, 'Guimaras State College-Baterna Campus', 5, NULL, NULL),
(1110, 'Catholic Ming Yuan College', 5, NULL, NULL),
(1111, 'College of Arts and Sciences of Asia and the Pacific-Bacolod City', 5, NULL, NULL),
(1112, 'Philippine College of Business and Accountancy', 5, NULL, NULL),
(1113, 'St. Vincent College of Business and Accountancy', 5, NULL, NULL),
(1114, 'Iloilo City Community College', 5, NULL, NULL),
(1115, 'I-Tech College-Bago City', 5, NULL, NULL),
(1116, 'Iloilo Merchant Marine School', 5, NULL, NULL),
(1117, 'University of Perpetual Help System Laguna Pueblo de Panay Campus', 5, NULL, NULL),
(1118, 'Malay College', 5, NULL, NULL),
(1119, 'Baptist Missionary Association Bible College', 5, NULL, NULL),
(1120, 'Colegio de Sto. Tomas Recoletos', 5, NULL, NULL),
(1121, 'USAT College Sagay City', 5, NULL, NULL),
(1122, 'Green International Technological College', 5, NULL, NULL),
(1123, 'St. Joseph Regional Seminary Graduate School of Theology', 5, NULL, NULL),
(1124, 'AMA Computer College-Cebu City', 5, NULL, NULL),
(1125, 'Asian College of Technology', 5, NULL, NULL),
(1126, 'BIT International College - Siquijor', 5, NULL, NULL),
(1127, 'Baptist Theological College', 5, NULL, NULL),
(1128, 'Blessed Trinity College', 5, NULL, NULL),
(1129, 'BIT International College-Tagbilaran', 5, NULL, NULL),
(1130, 'Bohol Institute of Technology-Jagna', 5, NULL, NULL),
(1131, 'BIT International College-Talibon', 5, NULL, NULL),
(1132, 'Bohol Island State University - Tagbilaran', 5, NULL, NULL),
(1133, 'Bohol Island State University - Candijay', 5, NULL, NULL),
(1134, 'Bohol Island State University - Calape Polytechnic College', 5, NULL, NULL),
(1135, 'CATS Aero College', 5, NULL, NULL),
(1136, 'Cebu Doctor\'s University', 5, NULL, NULL),
(1137, 'Cebu Doctor\'s University College of Medicine', 5, NULL, NULL),
(1138, 'Cebu Eastern College', 5, NULL, NULL),
(1139, 'Cebu Institute of Medicine', 5, NULL, NULL),
(1140, 'Cebu Institute of Technology-University', 5, NULL, NULL),
(1141, 'Cebu Roosevelt Memorial College', 5, NULL, NULL),
(1142, 'Saint Paul College Foundation', 5, NULL, NULL),
(1143, 'Cebu School of Midwifery', 5, NULL, NULL),
(1144, 'Cebu Normal University', 5, NULL, NULL),
(1145, 'Cebu Normal University - Balamban', 5, NULL, NULL),
(1146, 'Cebu Normal University - Medellin', 5, NULL, NULL),
(1147, 'Cebu Technological University - Main', 5, NULL, NULL),
(1148, 'College of Technological Sciences-Cebu', 5, NULL, NULL),
(1149, 'Negros Oriental State University-Main Campus', 5, NULL, NULL),
(1150, 'Negros Oriental State University-Mabinay Institute of Technology', 5, NULL, NULL),
(1151, 'Colegio De Santa Catalina De Alejandria', 5, NULL, NULL),
(1152, 'Concord Technical Institute', 5, NULL, NULL),
(1153, 'Cebu Technological University-Argao Campus', 5, NULL, NULL),
(1154, 'Cebu Technological University-Daanbantayan Campus', 5, NULL, NULL),
(1155, 'Cebu Technological University-Danao City Campus', 5, NULL, NULL),
(1156, 'Cebu Technological University-Barili Campus', 5, NULL, NULL),
(1157, 'Cebu Technological University-Moalboal Campus', 5, NULL, NULL),
(1158, 'Cebu Technological University-San Francisco Campus', 5, NULL, NULL),
(1159, 'Cebu Technological University-Tuburan Campus', 5, NULL, NULL),
(1160, 'Negros Oriental State University-Bais1', 5, NULL, NULL),
(1161, 'Negros Oriental State University-Guihulngan', 5, NULL, NULL),
(1162, 'Holy Name University', 5, NULL, NULL),
(1163, 'Diaz College', 5, NULL, NULL),
(1164, 'Felipe R. Verallo Memorial Foundation-Bogo', 5, NULL, NULL),
(1165, 'Foundation University', 5, NULL, NULL),
(1166, 'Negros Oriental State University -Bais II', 5, NULL, NULL),
(1167, 'University of the Visayas-Gullas College of Medicine', 5, NULL, NULL),
(1168, 'Holy Trinity College', 5, NULL, NULL),
(1169, 'Immaculate Heart of Mary Seminary', 5, NULL, NULL),
(1170, 'Indiana School of Aeronautics', 5, NULL, NULL),
(1171, 'Siquijor State College', 5, NULL, NULL),
(1172, 'Mater Dei College-Bohol', 5, NULL, NULL),
(1173, 'Negros Oriental State University-Bayawan', 5, NULL, NULL),
(1174, 'Northern Cebu College', 5, NULL, NULL),
(1175, 'PMI Colleges-Bohol', 5, NULL, NULL),
(1176, 'Philippine State College of Aeronautics-Mactan Air Base', 5, NULL, NULL),
(1177, 'Saint Francis College-Guihulngan', 5, NULL, NULL),
(1178, 'Saint Joseph College of Canlaon', 5, NULL, NULL),
(1179, 'Saint Joseph Seminary College', 5, NULL, NULL),
(1180, 'St. Paul University Dumaguete', 5, NULL, NULL),
(1181, 'Salazar Colleges of Science and Institute of Technology', 5, NULL, NULL),
(1182, 'San Carlos Seminary College', 5, NULL, NULL),
(1183, 'Negros Oriental State University-Siaton Community College', 5, NULL, NULL),
(1184, 'Silliman University', 5, NULL, NULL),
(1185, 'Southwestern University', 5, NULL, NULL),
(1186, 'St. Catherine\'S College', 5, NULL, NULL),
(1187, 'Southwestern University-Matias H. Aznar Memorial College of Medicine', 5, NULL, NULL),
(1188, 'University of the Visayas-Toledo City Campus', 5, NULL, NULL),
(1189, 'Trinidad Municipal College', 5, NULL, NULL),
(1190, 'University of Bohol', 5, NULL, NULL),
(1191, 'University of Cebu', 5, NULL, NULL),
(1192, 'University of San Carlos', 5, NULL, NULL),
(1193, 'University of San Jose-Recoletos', 5, NULL, NULL),
(1194, 'University of Southern Philippines Foundation', 5, NULL, NULL),
(1195, 'University of the Visayas', 5, NULL, NULL),
(1196, 'University of the Philippines-College of Cebu', 5, NULL, NULL),
(1197, 'Quezon Memorial Institute of Siquijor', 5, NULL, NULL),
(1198, 'Velez College', 5, NULL, NULL),
(1199, 'Villaflores College', 5, NULL, NULL),
(1200, 'Cebu Technological University - College of Fisheries Technology - Carmen', 5, NULL, NULL),
(1201, 'Batuan Colleges', 5, NULL, NULL),
(1202, 'Don Bosco Technology Center', 5, NULL, NULL),
(1203, 'Negros Maritime College Foundation', 5, NULL, NULL),
(1204, 'Royal Christian College', 5, NULL, NULL),
(1205, 'University of Cebu-Lapulapu and Mandaue', 5, NULL, NULL),
(1206, 'Asian College of Science and Technology-Dumaguete', 5, NULL, NULL),
(1207, 'De La Salle Andres Soriano Memorial College', 5, NULL, NULL),
(1208, 'Bantayan Southern Institute', 5, NULL, NULL),
(1209, 'Mount Moriah College', 5, NULL, NULL),
(1210, 'Presbyterian Theological College', 5, NULL, NULL),
(1211, 'Visayan Nazarene Bible College', 5, NULL, NULL),
(1212, 'Bohol Island State University - Bilar', 5, NULL, NULL),
(1213, 'CBD College', 5, NULL, NULL),
(1214, 'Consolatrix College of Toledo City', 5, NULL, NULL),
(1215, 'Evangelical Theological College of the Philippines', 5, NULL, NULL),
(1216, 'Saint Louise de Marillac College-Bogo', 5, NULL, NULL),
(1217, 'Seminaryo Mayor de San Carlos', 5, NULL, NULL),
(1218, 'Centre for International Education Global Colleges', 5, NULL, NULL),
(1219, 'BIT International College-Carmen', 5, NULL, NULL),
(1220, 'AMA Computer College-Dumaguete City', 5, NULL, NULL),
(1221, 'Negros College', 5, NULL, NULL),
(1222, 'Benedicto College', 5, NULL, NULL),
(1223, 'Northeastern Cebu Colleges', 5, NULL, NULL),
(1224, 'Bohol Island State University - Clarin', 5, NULL, NULL),
(1225, 'University of Cebu-Banilad', 5, NULL, NULL),
(1226, 'Bohol Northwestern Colleges', 5, NULL, NULL),
(1227, 'Cebu Sacred Heart College', 5, NULL, NULL),
(1228, 'Mary\'s Children Formation College', 5, NULL, NULL),
(1229, 'Rogationist Seminary College-Cebu', 5, NULL, NULL),
(1230, 'Colegio de San Antonio de Padua', 5, NULL, NULL),
(1231, 'Bohol Wisdom School', 5, NULL, NULL),
(1232, 'Buenavista Community College', 5, NULL, NULL),
(1233, 'Talisay City College', 5, NULL, NULL),
(1234, 'Central Philippine Bible College', 5, NULL, NULL),
(1235, 'Cebu Mary Immaculate College', 5, NULL, NULL),
(1236, 'ACLC College of Mandaue', 5, NULL, NULL),
(1237, 'Immanuel Bible College', 5, NULL, NULL),
(1238, 'Cristal e-College (Panglao Campus)', 5, NULL, NULL),
(1239, 'Cordova Public College', 5, NULL, NULL),
(1240, 'Professional Academy of the Philippines', 5, NULL, NULL),
(1241, 'La Consolacion College-Liloan', 5, NULL, NULL),
(1242, 'Sto. Tomas College-Danao City', 5, NULL, NULL),
(1243, 'Madridejos Community College', 5, NULL, NULL),
(1244, 'Microsystem International Institute of Technology', 5, NULL, NULL),
(1245, 'Metro Dumaguete College', 5, NULL, NULL),
(1246, 'University of The Visayas-Dalaguete Campus', 5, NULL, NULL),
(1247, 'Bohol Northern Star College', 5, NULL, NULL),
(1248, 'La Consolacion College-Bais', 5, NULL, NULL),
(1249, 'Mandaue City College', 5, NULL, NULL),
(1250, 'Lyceum of Cebu', 5, NULL, NULL),
(1251, 'Golden Success College', 5, NULL, NULL),
(1252, 'St. Cecilia\'s College - Cebu', 5, NULL, NULL),
(1253, 'Cebu Technological University - Consolacion', 5, NULL, NULL),
(1254, 'Sibonga Community College', 5, NULL, NULL),
(1255, 'Bohol Island State University-Balilihan Campus', 5, NULL, NULL),
(1256, 'Lapu-lapu City College', 5, NULL, NULL),
(1257, 'Mary Our Help Technical Institute for Women', 5, NULL, NULL),
(1258, 'Carmelite College - Siquijor', 5, NULL, NULL),
(1259, 'Rosemont Hills Montessori College', 5, NULL, NULL),
(1260, 'Salazar Colleges of Science and Institute of Technology-Madredijos', 5, NULL, NULL),
(1261, 'Tabor Hills College', 5, NULL, NULL),
(1262, 'Carcar City College', 5, NULL, NULL),
(1263, 'Rizwoods Colleges', 5, NULL, NULL),
(1264, 'Bohol International Learning College', 5, NULL, NULL),
(1265, 'STI College - Dumaguete', 5, NULL, NULL),
(1266, 'University of Cebu College of Medicine Foundation', 5, NULL, NULL),
(1267, 'Rizwoods College-Lapulapu', 5, NULL, NULL),
(1268, 'Sto. Niño Mactan College', 5, NULL, NULL),
(1269, 'Asian College of Technology International Educational Foundation', 5, NULL, NULL),
(1270, 'Tagbilaran City College', 5, NULL, NULL),
(1271, 'Talibon Polytechnic College', 5, NULL, NULL),
(1272, 'Colegio de Getafe', 5, NULL, NULL),
(1273, 'Danao Techological College', 5, NULL, NULL),
(1274, 'Cebu Technological University - Cebu City Mountain Satellite Campus', 5, NULL, NULL),
(1275, 'Benedicto College-Cebu', 5, NULL, NULL),
(1276, '', 5, NULL, NULL),
(1277, 'Cebu Sacred Heart College-Carcar City', 5, NULL, NULL),
(1278, '', 5, NULL, NULL),
(1279, 'Mham College', 5, NULL, NULL),
(1280, '', 5, NULL, NULL),
(1281, 'Lapu-Lapu Cebu International College', 5, NULL, NULL),
(1282, '', 5, NULL, NULL),
(1283, 'Rizwoods College - Bacalso', 5, NULL, NULL),
(1284, 'Rizwoods College - Liloan', 5, NULL, NULL),
(1285, 'Information And Communications Technology Academy', 5, NULL, NULL),
(1286, 'North Coast Bohol Institute', 5, NULL, NULL),
(1287, 'Abuyog Community College', 5, NULL, NULL),
(1288, 'Asian Development Foundation College', 5, NULL, NULL),
(1289, 'Biliran Province State University-Biliran Campus', 5, NULL, NULL),
(1290, 'Eastern Samar State University-Can-Avid Campus', 5, NULL, NULL),
(1291, 'Eastern Visayas State University-Carigara Campus', 5, NULL, NULL),
(1292, 'Christ the King College-Calbayog City', 5, NULL, NULL),
(1293, 'The College of Maasin', 5, NULL, NULL),
(1294, 'Dr. V. Orestes Romualdez Educational Foundation', 5, NULL, NULL),
(1295, 'Doña Remedios Trinidad-Romualdez Medical Foundation', 5, NULL, NULL),
(1296, 'Eastern Samar State University', 5, NULL, NULL),
(1297, 'Eastern Samar State University-Guiuan Campus', 5, NULL, NULL),
(1298, 'Franciscan College of the Immaculate Conception', 5, NULL, NULL),
(1299, 'Holy Infant College', 5, NULL, NULL),
(1300, 'Visayas State University-Isabel Campus', 5, NULL, NULL),
(1301, 'University of Eastern Philippines-Laoang Campus', 5, NULL, NULL),
(1302, 'Leyte Colleges', 5, NULL, NULL),
(1303, 'Eastern Visayas State University', 5, NULL, NULL),
(1304, 'Visayas State University-Villaba Campus', 5, NULL, NULL),
(1305, 'Leyte Normal University', 5, NULL, NULL),
(1306, 'Eastern Visayas State University-Tanauan Campus', 5, NULL, NULL),
(1307, 'Visayas State University-Alang-Alang Campus', 5, NULL, NULL),
(1308, 'Visayas State University-Tolosa Campus', 5, NULL, NULL),
(1309, 'Biliran Province State University-Main', 5, NULL, NULL),
(1310, 'Palompon Institute of Technology', 5, NULL, NULL),
(1311, 'University of Eastern Philippines-Catubig Campus', 5, NULL, NULL),
(1312, 'Southern Leyte State University-Bontoc Campus', 5, NULL, NULL),
(1313, 'St. Mary\'s College of Catbalogan', 5, NULL, NULL),
(1314, 'Sacred Heart Seminary', 5, NULL, NULL),
(1315, 'Saint Joseph College', 5, NULL, NULL),
(1316, 'St. Mary\'s College of Borongan', 5, NULL, NULL),
(1317, 'St. Peter\'s College of Ormoc', 5, NULL, NULL),
(1318, 'Saint Vincent De Paul College Seminary', 5, NULL, NULL),
(1319, 'Samar Colleges', 5, NULL, NULL),
(1320, 'Northwest Samar State University-San Jorge Campus', 5, NULL, NULL),
(1321, 'Samar State University-Mercedes Campus', 5, NULL, NULL),
(1322, 'Samar State University', 5, NULL, NULL),
(1323, 'Samar State University-Basey Campus', 5, NULL, NULL),
(1324, 'Southern Leyte State University-San Juan Campus', 5, NULL, NULL),
(1325, 'Colegio de San Lorenzo Ruiz de Manila of Northern Samar', 5, NULL, NULL),
(1326, 'Southern Leyte State University-Hinunangan Campus', 5, NULL, NULL),
(1327, 'Southern Leyte State University', 5, NULL, NULL),
(1328, 'Eastern Samar State University-Salcedo Campus', 5, NULL, NULL),
(1329, 'Saint Paul School of Professional Studies', 5, NULL, NULL),
(1330, 'Saint Thomas Aquinas College', 5, NULL, NULL),
(1331, 'Sto. Niño College of Ormoc', 5, NULL, NULL),
(1332, 'Northwest Samar State University', 5, NULL, NULL),
(1333, 'Southern Leyte State University-Tomas Oppus Campus', 5, NULL, NULL),
(1334, 'University of Eastern Philippines', 5, NULL, NULL),
(1335, 'University of the Philippines in the Visayas Tacloban College', 5, NULL, NULL),
(1336, 'Visayas State University', 5, NULL, NULL),
(1337, 'Western Leyte College of Ormoc City', 5, NULL, NULL),
(1338, 'Eastern Visayas State University-Burauen Campus', 5, NULL, NULL),
(1339, 'JE Mondejar Computer College', 5, NULL, NULL),
(1340, 'Mater Divinae Gratiae College', 5, NULL, NULL),
(1341, 'Palompon Institute of Technology-Tabango Campus', 5, NULL, NULL),
(1342, 'Our Lady of Mercy College', 5, NULL, NULL),
(1343, 'Bato Institute of Science and Technology', 5, NULL, NULL),
(1344, 'Holy Cross College of Carigara', 5, NULL, NULL),
(1345, 'STI College-Ormoc', 5, NULL, NULL),
(1346, 'Eastern Visayas State University-Ormoc Campus', 5, NULL, NULL),
(1347, 'Eastern Visayas Central Colleges', 5, NULL, NULL),
(1348, 'AMA Computer College-Tacloban City', 5, NULL, NULL),
(1349, 'Saint Scholastica\'s College-Tacloban', 5, NULL, NULL),
(1350, 'ABE International College of Business and Economics-Tacloban City', 5, NULL, NULL),
(1351, 'Saint Michael College of Hindang', 5, NULL, NULL),
(1352, 'Holy Spirit College Foundation of Leyte', 5, NULL, NULL),
(1353, 'Montano Lamberte Go Collegeof Learning', 5, NULL, NULL),
(1354, 'Northern Samar Colleges', 5, NULL, NULL),
(1355, 'Asia College of Advance Studies In Arts Sciences and Technology', 5, NULL, NULL),
(1356, 'St. John the Evangelist School of Theology', 5, NULL, NULL),
(1357, 'Colegio de San Juan Samar', 5, NULL, NULL),
(1358, 'Colegio De Sta. Lourdes of Leyte Foundation', 5, NULL, NULL),
(1359, 'Colegio de la Salle Fondation de Tacloban', 5, NULL, NULL),
(1360, 'Holy Virgin of Salvacion Foundation College', 5, NULL, NULL),
(1361, 'San Lorenzo Ruiz College of Ormoc', 5, NULL, NULL),
(1362, 'ACLC College-Tacloban City', 5, NULL, NULL),
(1363, 'Colegio De Las Navas', 5, NULL, NULL),
(1364, 'Eastern Samar State University-Maydolong Campus', 5, NULL, NULL),
(1365, 'Calbiga Western Samar College', 5, NULL, NULL),
(1366, 'Samar State University-Paranas Campus', 5, NULL, NULL),
(1367, 'ACLC College-Ormoc', 5, NULL, NULL),
(1368, 'Southern Leyte State University-Maasin City Campus', 5, NULL, NULL),
(1369, 'Tan Ting Bing Memorial Colleges Foundation', 5, NULL, NULL),
(1370, 'Global School for Technological Studies', 5, NULL, NULL),
(1371, 'Burauen Community College', 5, NULL, NULL),
(1372, 'Eastern Visayas State University-Dulag Campus', 5, NULL, NULL),
(1373, 'University of the Philippines Manila - School of Health Sciences', 5, NULL, NULL),
(1374, 'Andres Bonifacio College', 5, NULL, NULL),
(1375, 'Ateneo de Zamboanga University', 5, NULL, NULL),
(1376, 'Basilan State College', 5, NULL, NULL),
(1377, 'Brent Hospital and Colleges', 5, NULL, NULL),
(1378, 'Claret College of Isabela', 5, NULL, NULL),
(1379, 'DMC College Foundation', 5, NULL, NULL),
(1380, 'Dr. Aurelio Mendoza Memorial Colleges', 5, NULL, NULL),
(1381, 'Immaculate Conception Archdiocesan School', 5, NULL, NULL),
(1382, 'Juan S. Alano Memorial School', 5, NULL, NULL),
(1383, 'Jose Rizal Memorial State University-Katipunan Campus', 5, NULL, NULL),
(1384, 'Marian College', 5, NULL, NULL),
(1385, 'Blancia College Foundation', 5, NULL, NULL),
(1386, 'Philippine Advent College', 5, NULL, NULL),
(1387, 'Pilar Colege of Zamboanga City', 5, NULL, NULL),
(1388, 'Rizal Memorial Institute of Dapitan City', 5, NULL, NULL),
(1389, 'Saint Columban College', 5, NULL, NULL),
(1390, 'St. John College of Buug Foundation', 5, NULL, NULL),
(1391, 'Saint Joseph College of Sindangan', 5, NULL, NULL),
(1392, 'Saint Vincent\'s College', 5, NULL, NULL),
(1393, 'Saint Estanislao Kostka College', 5, NULL, NULL),
(1394, 'Southern Mindanao College-Agro Tech', 5, NULL, NULL),
(1395, 'Southern City Colleges', 5, NULL, NULL),
(1396, 'Southern Mindanao Colleges', 5, NULL, NULL),
(1397, 'Southern Philippine College', 5, NULL, NULL),
(1398, 'Western Mindanao State University', 5, NULL, NULL),
(1399, 'Western Mindanao State University-Alicia', 5, NULL, NULL),
(1400, 'Western Mindanao State University-Aurora', 5, NULL, NULL),
(1401, 'Western Mindanao State University-Diplahan', 5, NULL, NULL),
(1402, 'Western Mindanao State University-Imelda', 5, NULL, NULL),
(1403, 'Western Mindanao State University-Ipil', 5, NULL, NULL),
(1404, 'Western Mindanao State University-Mabuhay', 5, NULL, NULL),
(1405, 'Western Mindanao State University-Malangas', 5, NULL, NULL),
(1406, 'Western Mindanao State University-Molave', 5, NULL, NULL),
(1407, 'Western Mindanao State University-Olutanga', 5, NULL, NULL),
(1408, 'Western Mindanao State University-Pagadian', 5, NULL, NULL),
(1409, 'Western Mindanao State University-Siay', 5, NULL, NULL),
(1410, 'Western Mindanao State University-Tungawan', 5, NULL, NULL),
(1411, 'Western Mindanao State University-Naga', 5, NULL, NULL),
(1412, 'Western Mindanao State University-Curuan', 5, NULL, NULL),
(1413, 'Universidad de Zamboanga', 5, NULL, NULL),
(1414, 'Zamboanga Peninsula Polytechnic State University', 5, NULL, NULL),
(1415, 'Zamboanga State College of Marine Sciences and Technology', 5, NULL, NULL),
(1416, 'Josefina H. Cerilles State College', 5, NULL, NULL),
(1417, 'Josefina H. Cerilles State College - Dumingag', 5, NULL, NULL),
(1418, 'Medina College-Pagadian', 5, NULL, NULL),
(1419, 'Pagadian Capitol College', 5, NULL, NULL),
(1420, 'Aurora Pioneers Memorial College', 5, NULL, NULL),
(1421, 'Dipolog City Institute of Technology', 5, NULL, NULL),
(1422, 'Jose Rizal Memorial State University - Main', 5, NULL, NULL),
(1423, 'Ebenezer Bible College and Seminary', 5, NULL, NULL),
(1424, 'St. Mary\'s College of Labason', 5, NULL, NULL),
(1425, 'Josefina H. Cerilles State College-Canuto M.S. Enerio College of Arts and Trades', 5, NULL, NULL),
(1426, 'Jose Rizal Memorial State University-Dipolog', 5, NULL, NULL),
(1427, 'Jose Rizal Memorial State University-Siocon', 5, NULL, NULL),
(1428, 'Colegio de San Francisco Javier of Rizal Zamboanga del Norte', 5, NULL, NULL),
(1429, 'Computer Technologies Institute of Zamboanga City', 5, NULL, NULL),
(1430, 'HMIJ Foundation Philippine Islamic College', 5, NULL, NULL),
(1431, 'Mindanao State University-Buug College', 5, NULL, NULL),
(1432, 'Eastern Mindanao College of Technology', 5, NULL, NULL),
(1433, 'Universidad de Zamboanga-Ipil', 5, NULL, NULL),
(1434, 'Medina College-Ipil', 5, NULL, NULL),
(1435, 'Philippine Technological and Marine Sciences-Zamboanga del Sur', 5, NULL, NULL),
(1436, 'Western Mindanao Foundation College', 5, NULL, NULL),
(1437, 'Southern Peninsula College', 5, NULL, NULL),
(1438, 'Lucan Central Colleges', 5, NULL, NULL),
(1439, 'Sibugay Technical Institute', 5, NULL, NULL),
(1440, 'Universidad de Zamboanga - Pagadian', 5, NULL, NULL),
(1441, 'Aim High College', 5, NULL, NULL),
(1442, 'Ave Maria College', 5, NULL, NULL),
(1443, 'Hyrons College Philippines', 5, NULL, NULL),
(1444, 'Jose Rizal Memorial State University-Tampilisan', 5, NULL, NULL),
(1445, 'Nuevo Zamboanga College', 5, NULL, NULL),
(1446, 'Philippine Advent College-Salug', 5, NULL, NULL),
(1447, 'Yllana Bay View College', 5, NULL, NULL),
(1448, 'Alhadeetha Mindanao College', 5, NULL, NULL),
(1449, 'Zamboanga del Sur Provincial Government College', 5, NULL, NULL),
(1450, 'Southern City Colleges-West Campus', 5, NULL, NULL),
(1451, 'ZAMSULA Everlasting College', 5, NULL, NULL),
(1452, 'Our Lady of Triumph Institute of Technology', 5, NULL, NULL),
(1453, 'West Prime Horizon Institute', 5, NULL, NULL),
(1454, 'Colegio de La Ciudad de Zamboanga', 5, NULL, NULL),
(1455, 'Zamboanga del Sur Provincial Government College - Pagadian', 5, NULL, NULL),
(1456, 'Ferndale College – Zamboanga Peninsula', 5, NULL, NULL),
(1457, 'Metro Zampen College', 5, NULL, NULL),
(1458, 'Emmauss College of Theology Foundation', 5, NULL, NULL),
(1459, 'Pagadian City International College', 5, NULL, NULL),
(1460, 'Philippine Advent College - Leon B. Postigo Campus', 5, NULL, NULL),
(1461, 'Zamboanga del Sur Provincial Government College-Dimataling', 5, NULL, NULL),
(1462, 'Blessed Mother College', 5, NULL, NULL),
(1463, 'Bukidnon State University', 5, NULL, NULL),
(1464, 'Bukidnon State University-Alubijid ESC', 5, NULL, NULL),
(1465, 'Bukidnon State University-Libona', 5, NULL, NULL),
(1466, 'Bukidnon State University-Baungon BSU', 5, NULL, NULL),
(1467, 'Bukidnon State University-Kalilangan BSU', 5, NULL, NULL),
(1468, 'Bukidnon State University-Medina ESC', 5, NULL, NULL),
(1469, 'Bukidnon State University-Talakag BSU', 5, NULL, NULL),
(1470, 'Bukidnon State University-Talisayan ESC', 5, NULL, NULL),
(1471, 'Bukidnon State University-Malitbog', 5, NULL, NULL),
(1472, 'Bukidnon State University-Kadingilan', 5, NULL, NULL),
(1473, 'Capitol University', 5, NULL, NULL),
(1474, 'Cagayan De Oro College', 5, NULL, NULL),
(1475, 'Camiguin Polytechnic State College', 5, NULL, NULL),
(1476, 'Central Mindanao University', 5, NULL, NULL),
(1477, 'Christ the King College', 5, NULL, NULL),
(1478, 'Colegio De Santo Niño De Jasaan', 5, NULL, NULL),
(1479, 'Fatima College of Camiguin', 5, NULL, NULL),
(1480, 'Gingoog City College', 5, NULL, NULL),
(1481, 'Gingoog Christian College', 5, NULL, NULL),
(1482, 'Gov. Alfonso D. Tan College', 5, NULL, NULL),
(1483, 'La Salle University', 5, NULL, NULL),
(1484, 'Liceo De Cagayan University', 5, NULL, NULL),
(1485, 'Lourdes College', 5, NULL, NULL),
(1486, 'Medina College', 5, NULL, NULL),
(1487, 'Medina Foundation College', 5, NULL, NULL),
(1488, 'Mindanao Arts and Technological Institute', 5, NULL, NULL),
(1489, 'University of Science and Technology of Southern Philippines', 5, NULL, NULL),
(1490, 'University of Science and Technology of Southern Philippines - Jasaan', 5, NULL, NULL),
(1491, 'University of Science and Technology of Southern Philippines - Oroquieta', 5, NULL, NULL),
(1492, 'University of Science and Technology of Southern Philippines - Panaon', 5, NULL, NULL),
(1493, 'Misamis Institute of Technology', 5, NULL, NULL),
(1494, 'University of Science and Technology of Southern Philippines - Claveria', 5, NULL, NULL),
(1495, 'Misamis University', 5, NULL, NULL),
(1496, 'Misamis University-Oroquieta City', 5, NULL, NULL),
(1497, 'Mountain View College', 5, NULL, NULL),
(1498, 'Golden Heritage Polytechnic College', 5, NULL, NULL),
(1499, 'Northwestern Mindanao Christian Colleges', 5, NULL, NULL),
(1500, 'Philippine College Foundation', 5, NULL, NULL),
(1501, 'Pilgrim Christian College', 5, NULL, NULL),
(1502, 'Quezon Institute of Technology', 5, NULL, NULL),
(1503, 'Sacred Heart College of Calamba', 5, NULL, NULL),
(1504, 'St. John Vianney Theological Seminary', 5, NULL, NULL),
(1505, 'St. Peter\'s College of Misamis Oriental', 5, NULL, NULL),
(1506, 'St. Rita\'s College of Balingasag', 5, NULL, NULL),
(1507, 'San Agustin Institute of Technology', 5, NULL, NULL),
(1508, 'San Isidro College', 5, NULL, NULL),
(1509, 'Southern Bukidnon Foundation Academy', 5, NULL, NULL),
(1510, 'Southern Capital Colleges', 5, NULL, NULL),
(1511, 'Southern De Oro Philippines College', 5, NULL, NULL),
(1512, 'Stella Maris College', 5, NULL, NULL),
(1513, 'Northwestern Mindanao State College of Science and Technology', 5, NULL, NULL),
(1514, 'Valencia Colleges-Bukidnon', 5, NULL, NULL),
(1515, 'Xavier University (Ateneo de Cagayan)', 5, NULL, NULL),
(1516, 'STI College-Cagayan De Oro', 5, NULL, NULL),
(1517, 'AMA Computer College-Cagayan de Oro', 5, NULL, NULL),
(1518, 'Philippine Countryville College', 5, NULL, NULL),
(1519, 'Roman C. Villalon Memorial Colleges Foundation', 5, NULL, NULL),
(1520, 'Oro Bible College', 5, NULL, NULL),
(1521, 'Dr. Solomon U. Molina College', 5, NULL, NULL),
(1522, 'Mindanao State University-Naawan', 5, NULL, NULL),
(1523, 'Adventist Technological Institute', 5, NULL, NULL),
(1524, 'Southern Maramag Colleges', 5, NULL, NULL),
(1525, 'Tagoloan Community College', 5, NULL, NULL),
(1526, 'Initao College', 5, NULL, NULL),
(1527, 'Opol Community College', 5, NULL, NULL),
(1528, 'Northern Bukidnon State College', 5, NULL, NULL),
(1529, 'ACLC College of Bukidnon', 5, NULL, NULL),
(1530, 'Don Carlos Polytechnic College', 5, NULL, NULL),
(1531, 'IBA College of Mindanao', 5, NULL, NULL),
(1532, 'Misamis Oriental Institute of Science and Technology', 5, NULL, NULL),
(1533, 'The New El Salvador Colleges', 5, NULL, NULL),
(1534, 'Our Lady of Triumph Institute of Technology', 5, NULL, NULL),
(1535, 'Vineyard International Polytechnic College', 5, NULL, NULL),
(1536, 'Pangantucan Bukidnon Community College', 5, NULL, NULL),
(1537, 'City College of El Salvador', 5, NULL, NULL),
(1538, 'Community College of Gingoog City', 5, NULL, NULL),
(1539, 'Magsaysay College', 5, NULL, NULL),
(1540, 'Salay Community College', 5, NULL, NULL),
(1541, 'STI College-Iligan', 5, NULL, NULL),
(1542, 'STI College-Malaybalay', 5, NULL, NULL),
(1543, 'STI College-Valencia', 5, NULL, NULL),
(1544, 'Tubod College', 5, NULL, NULL),
(1545, 'Bukidnon State University-Cabanglasan ESC', 5, NULL, NULL),
(1546, 'Bukidnon State University-Damulog Satellite ESC', 5, NULL, NULL),
(1547, 'Bukidnon State University-Kitaotao Satellite ESC', 5, NULL, NULL),
(1548, 'Bukidnon State University-Quezon Satellite ESC', 5, NULL, NULL),
(1549, 'Bukidnon State University-San Fernando Satellite ESC', 5, NULL, NULL),
(1550, 'Bukidnon State University-Impasugong', 5, NULL, NULL),
(1551, 'University of Science and Technology in Southern Philippines-Alubijid', 5, NULL, NULL),
(1552, 'University of Science and Technology in Southern Philippines-Balubal', 5, NULL, NULL),
(1553, 'University of Science and Technology in Southern Philippines-Villanueva', 5, NULL, NULL),
(1554, 'North Central Mindanao College', 5, NULL, NULL),
(1555, 'Iligan Capitol College', 5, NULL, NULL),
(1556, 'Iligan Medical Center College', 5, NULL, NULL),
(1557, 'Mindanao State University-Lanao Del Norte Agricultural College', 5, NULL, NULL),
(1558, 'Mindanao State University-Maigo School of Arts and Trades', 5, NULL, NULL),
(1559, 'Adventist Medical Center College', 5, NULL, NULL),
(1560, 'Mindanao State University - Iligan Institute of Technology', 5, NULL, NULL),
(1561, 'St. Michael\'s College', 5, NULL, NULL),
(1562, 'St. Peter\'s College', 5, NULL, NULL),
(1563, 'Santa Monica Institute of Technology', 5, NULL, NULL),
(1564, 'Lyceum of Iligan Foundation', 5, NULL, NULL),
(1565, 'Christ The King College De Maranding', 5, NULL, NULL),
(1566, 'Lanao School of Science and Technology', 5, NULL, NULL),
(1567, 'Masters Technological Institute of Mindanao', 5, NULL, NULL),
(1568, 'Picardal Institute of Science and Technology', 5, NULL, NULL),
(1569, 'Agro-Industrial Foundation College of the Philippines-Davao', 5, NULL, NULL),
(1570, 'AMA Computer College-Davao', 5, NULL, NULL),
(1571, 'Arriesgado College Foundation', 5, NULL, NULL),
(1572, 'Assumption College of Nabunturan', 5, NULL, NULL),
(1573, 'Ateneo de Davao University', 5, NULL, NULL),
(1574, 'Brokenshire College', 5, NULL, NULL),
(1575, 'Cor Jesu College', 5, NULL, NULL),
(1576, 'Davao Central College', 5, NULL, NULL),
(1577, 'Davao del Norte State College', 5, NULL, NULL),
(1578, 'Davao Doctors College', 5, NULL, NULL),
(1579, 'Davao Medical School Foundation', 5, NULL, NULL),
(1580, 'DMMA College of Southern Philippines', 5, NULL, NULL),
(1581, 'Davao Oriental State University', 5, NULL, NULL),
(1582, 'Davao Oriental State University-Cateel Extension Campus', 5, NULL, NULL),
(1583, 'Davao Oriental State University-San Isidro Campus', 5, NULL, NULL),
(1584, 'Davao Oriental State University-Banaybanay Campus', 5, NULL, NULL),
(1585, 'Evelyn E. Fabie College', 5, NULL, NULL),
(1586, 'General Baptist Bible College', 5, NULL, NULL),
(1587, 'Holy Cross College of Calinan', 5, NULL, NULL),
(1588, 'St. Mary\'S College of Bansalan', 5, NULL, NULL),
(1589, 'Holy Cross of Davao College', 5, NULL, NULL),
(1590, 'Liceo De Davao', 5, NULL, NULL),
(1591, 'Mati Polytechnic College', 5, NULL, NULL),
(1592, 'MATS College of Technology', 5, NULL, NULL),
(1593, 'Mindanao Medical Foundation College', 5, NULL, NULL),
(1594, 'North Davao College-Tagum Foundation', 5, NULL, NULL),
(1595, 'North Davao Colleges-Panabo', 5, NULL, NULL),
(1596, 'Philippine Women\'s College of Davao', 5, NULL, NULL),
(1597, 'Polytechnic College of Davao del Sur', 5, NULL, NULL),
(1598, 'Queen of Apostles College Seminary', 5, NULL, NULL),
(1599, 'The Rizal Memorial Colleges', 5, NULL, NULL),
(1600, 'Saint Francis Xavier College Seminary', 5, NULL, NULL),
(1601, 'St. Mary\'s College of Tagum', 5, NULL, NULL),
(1602, 'Saint Peter\'s College of Toril', 5, NULL, NULL),
(1603, 'San Pedro College', 5, NULL, NULL),
(1604, 'Serapion C. Basalo Memorial Colleges', 5, NULL, NULL),
(1605, 'Southeastern College of Padada', 5, NULL, NULL),
(1606, 'Southern Philippines Agriculture Business Marine and Aquatic School of Technology', 5, NULL, NULL),
(1607, 'South Philippine Adventist College', 5, NULL, NULL),
(1608, 'Tecarro College Foundation', 5, NULL, NULL),
(1609, 'UM Bansalan College', 5, NULL, NULL),
(1610, 'UM Digos College', 5, NULL, NULL),
(1611, 'UM Panabo College', 5, NULL, NULL),
(1612, 'UM Tagum College', 5, NULL, NULL),
(1613, 'University of Mindanao', 5, NULL, NULL),
(1614, 'University of Southeastern Philippines-Main', 5, NULL, NULL),
(1615, 'University of the Immaculate Conception', 5, NULL, NULL),
(1616, 'University of Southeastern Philippines-College of Agriculture-Tagum Mabini', 5, NULL, NULL),
(1617, 'Davao del Sur State College-Main', 5, NULL, NULL),
(1618, 'University of Southeastern Philippines-Mintal', 5, NULL, NULL),
(1619, 'Joji Ilagan Career Center Foundation', 5, NULL, NULL),
(1620, 'St. Francis Xavier Regional Major Seminary of Mindanao', 5, NULL, NULL),
(1621, 'University of the Philippines-Mindanao', 5, NULL, NULL),
(1622, 'Assumption College of Davao', 5, NULL, NULL),
(1623, 'Interface Computer College', 5, NULL, NULL),
(1624, 'UM Peñaplata College', 5, NULL, NULL),
(1625, 'Aces Tagum College', 5, NULL, NULL),
(1626, 'St. John Paul II College of Davao', 5, NULL, NULL),
(1627, 'Philippine College of Technology', 5, NULL, NULL),
(1628, 'Mindanao Kokusai Daigaku', 5, NULL, NULL),
(1629, 'Holy Child College of Davao', 5, NULL, NULL),
(1630, 'Mati Doctors College', 5, NULL, NULL),
(1631, 'Southern Philippines Baptist Theological Seminary', 5, NULL, NULL),
(1632, 'STI College-Davao', 5, NULL, NULL),
(1633, 'Jose Maria College', 5, NULL, NULL),
(1634, 'Christian Colleges of Southeast Asia', 5, NULL, NULL),
(1635, 'Davao Winchester Colleges', 5, NULL, NULL),
(1636, 'Legacy College of Compostela', 5, NULL, NULL),
(1637, 'St. Mary\'s College Baganga', 5, NULL, NULL),
(1638, 'Kapalong College of Agriculture Sciences and Technology', 5, NULL, NULL),
(1639, 'Holy Cross College of Sasa', 5, NULL, NULL),
(1640, 'Laak Institute Foundation', 5, NULL, NULL),
(1641, 'Tagum Doctors College', 5, NULL, NULL),
(1642, 'Gabriel Taborin College of Davao Foundation', 5, NULL, NULL),
(1643, 'ACES Polytechnic College', 5, NULL, NULL),
(1644, 'Governor Generoso College of Arts Sciences and Technology', 5, NULL, NULL),
(1645, 'Davao Vision Colleges', 5, NULL, NULL),
(1646, 'St. Thomas More School of Law and Business', 5, NULL, NULL),
(1647, 'Monkayo College of Arts Sciences and Technology', 5, NULL, NULL),
(1648, 'ACQ College of Ministries', 5, NULL, NULL),
(1649, 'Koinonia Theological Seminary Foundation', 5, NULL, NULL),
(1650, 'Evangelical Mission College', 5, NULL, NULL),
(1651, 'Samson Polytechnic College of Davao', 5, NULL, NULL),
(1652, 'Mt. Apo Science Foundation College', 5, NULL, NULL),
(1653, 'Kolehiyo ng Pantukan', 5, NULL, NULL),
(1654, 'Northlink Technological College', 5, NULL, NULL),
(1655, 'Tagum City College of Science and Technology Foundation', 5, NULL, NULL),
(1656, 'Davao De Oro State College', 5, NULL, NULL),
(1657, 'Institute of International Culinary and Hospitality Entrepreneurship Inc.', 5, NULL, NULL),
(1658, 'Asian International School of Aeronautics and Technology', 5, NULL, NULL),
(1659, 'Davao De Oro State College-Maragusan Branch', 5, NULL, NULL),
(1660, 'Davao De Oro State College-Montevista Branch', 5, NULL, NULL),
(1661, 'Davao De Oro State College-New Bataan Branch', 5, NULL, NULL),
(1662, 'Joji Ilagan International Management School', 5, NULL, NULL),
(1663, 'Malayan Colleges Mindanao', 5, NULL, NULL),
(1664, 'Card-MRI Development Institute', 5, NULL, NULL),
(1665, 'Sto. Tomas College of Agriculture Sciences and Technology', 5, NULL, NULL),
(1666, 'Lyceum of the Philippines-Davao', 5, NULL, NULL),
(1667, 'Maryknoll College of Panabo', 5, NULL, NULL),
(1668, 'Samal Island City College', 5, NULL, NULL),
(1669, 'STI College-Tagum', 5, NULL, NULL),
(1670, 'Colegio de Caraga', 5, NULL, NULL),
(1671, 'AMYA Polytechnic College', 5, NULL, NULL),
(1672, 'Maco de Oro College', 5, NULL, NULL),
(1673, 'St. Alexius College', 5, NULL, NULL),
(1674, 'Edenton Mission College', 5, NULL, NULL),
(1675, 'Gensantos Foundation College', 5, NULL, NULL),
(1676, 'Holy Trinity College of General Santos City', 5, NULL, NULL),
(1677, 'King\'s College of Marbel', 5, NULL, NULL),
(1678, 'Mindanao Polytechnic College', 5, NULL, NULL),
(1679, 'Mindanao State University-General Santos', 5, NULL, NULL),
(1680, 'Notre Dame of Dadiangas University', 5, NULL, NULL),
(1681, 'Notre Dame of Marbel University', 5, NULL, NULL),
(1682, 'Schola de San Jose', 5, NULL, NULL),
(1683, 'Ramon Magsaysay Memorial Colleges', 5, NULL, NULL),
(1684, 'Santa Cruz Mission School', 5, NULL, NULL),
(1685, 'South Cotabato State College', 5, NULL, NULL),
(1686, 'STI College-Gen. Santos', 5, NULL, NULL),
(1687, 'Green Valley College Foundation', 5, NULL, NULL),
(1688, 'Marbel School of Science and Technology', 5, NULL, NULL),
(1689, 'AMA Computer College-General Santos City', 5, NULL, NULL),
(1690, 'Central Mindanao Colleges', 5, NULL, NULL),
(1691, 'Regency Polytechnic College', 5, NULL, NULL),
(1692, 'Cotabato Foundation College of Science and Technology', 5, NULL, NULL),
(1693, 'Cotabato Foundation College of Science and Technology-Antipas Campus', 5, NULL, NULL),
(1694, 'Cotabato Foundation College of Science and Technology-Katipunan Campus', 5, NULL, NULL),
(1695, 'Cotabato Foundation College of Science and Technology-Pikit Campus', 5, NULL, NULL),
(1696, 'Cotabato Medical Foundation College', 5, NULL, NULL),
(1697, 'Dr. Domingo B. Tamondong Memorial Hospital and College Foundation', 5, NULL, NULL),
(1698, 'King\'s College of Isulan', 5, NULL, NULL);
INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`, `institution_hrId`, `institution_datetime`) VALUES
(1699, 'Lebak Family Doctors\' School of Midwifery', 5, NULL, NULL),
(1700, 'University of Southern Mindanao-Kidapawan City Campus', 5, NULL, NULL),
(1701, 'Colegio de Kidapawan', 5, NULL, NULL),
(1702, 'Notre Dame of Kidapawan College', 5, NULL, NULL),
(1703, 'Notre Dame of Midsayap College', 5, NULL, NULL),
(1704, 'Notre Dame of Salaman College', 5, NULL, NULL),
(1705, 'Notre Dame of Tacurong College', 5, NULL, NULL),
(1706, 'Senator Ninoy Aquino College Foundation', 5, NULL, NULL),
(1707, 'Southern Baptist College', 5, NULL, NULL),
(1708, 'Southern Christian College', 5, NULL, NULL),
(1709, 'Southern Mindanao Institute of Technology', 5, NULL, NULL),
(1710, 'Southern Philippines Methodist College', 5, NULL, NULL),
(1711, 'Sultan Kudarat Educational Institution', 5, NULL, NULL),
(1712, 'Sultan Kudarat State University', 5, NULL, NULL),
(1713, 'Sultan Kudarat State University-Isulan', 5, NULL, NULL),
(1714, 'Sultan Kudarat State University-Lutayan', 5, NULL, NULL),
(1715, 'Sultan Kudarat State University-Kalamansig', 5, NULL, NULL),
(1716, 'Sultan Kudarat State University-Bagumbayan', 5, NULL, NULL),
(1717, 'Sultan Kudarat State University-Palimbang', 5, NULL, NULL),
(1718, 'Sultan Kudarat State University-Tacurong', 5, NULL, NULL),
(1719, 'University of Southern Mindanao-Main', 5, NULL, NULL),
(1720, 'North Valley College Foundation', 5, NULL, NULL),
(1721, 'Central Mindanao Computer School', 5, NULL, NULL),
(1722, 'Adventist College of Technology', 5, NULL, NULL),
(1723, 'Goldenstate College', 5, NULL, NULL),
(1724, 'General Santos Doctors\' Medical School Foundation', 5, NULL, NULL),
(1725, 'Notre Dame-Siena College of Polomolok', 5, NULL, NULL),
(1726, 'Brokenshire College SOCSKSARGEN', 5, NULL, NULL),
(1727, 'Holy Child College of Information Technology', 5, NULL, NULL),
(1728, 'South East Asian Institute of Technology', 5, NULL, NULL),
(1729, 'VMC Asian College Foundation', 5, NULL, NULL),
(1730, 'Asian Colleges and Technological Institute', 5, NULL, NULL),
(1731, 'Stratford International School', 5, NULL, NULL),
(1732, 'ACLC College of Marbel', 5, NULL, NULL),
(1733, 'Korbel Foundation College', 5, NULL, NULL),
(1734, 'STI College of Koronadal City', 5, NULL, NULL),
(1735, 'i-Link College of Science and Technology', 5, NULL, NULL),
(1736, 'Goldenstate College of Koronadal City', 5, NULL, NULL),
(1737, 'Marvelous College of Technology', 5, NULL, NULL),
(1738, 'STI College - Koronadal City - Tacurong City Branch', 5, NULL, NULL),
(1739, 'B.E.S.T. College of Polomolok', 5, NULL, NULL),
(1740, 'Ramon Magsaysay Memorial College - Marbel', 5, NULL, NULL),
(1741, 'General Santos Academy', 5, NULL, NULL),
(1742, 'Marbel Institute of Technical College', 5, NULL, NULL),
(1743, 'Joji Ilagan International School of Hotel & Tourism Management', 5, NULL, NULL),
(1744, 'MMG College of General Santos City', 5, NULL, NULL),
(1745, 'Villamor College of Business and Arts', 5, NULL, NULL),
(1746, 'Cronasia Foundation College', 5, NULL, NULL),
(1747, 'Kidapawan Doctors College', 5, NULL, NULL),
(1748, 'Kulaman Academy', 5, NULL, NULL),
(1749, 'Gensan College of Technology', 5, NULL, NULL),
(1750, 'Primasia Foundation College', 5, NULL, NULL),
(1751, 'Southpoint College of Arts and Technology', 5, NULL, NULL),
(1752, 'Makilala Institute of Science and Technology', 5, NULL, NULL),
(1753, 'West Celebes College of Technology', 5, NULL, NULL),
(1754, 'Saint Albert Polytechnic College', 5, NULL, NULL),
(1755, 'Filipino Canadian Community College Foundation', 5, NULL, NULL),
(1756, 'New Era University-General Santos City', 5, NULL, NULL),
(1757, 'Glan Institute of Technology', 5, NULL, NULL),
(1758, 'Southern Philippine Technical College of Koronadal', 5, NULL, NULL),
(1759, 'Goldenstate College of Kiamba', 5, NULL, NULL),
(1760, 'Goldenstate College of Maasim', 5, NULL, NULL),
(1761, 'Goldenstate College of Malungon', 5, NULL, NULL),
(1762, 'New Brighton School of the Philippines', 5, NULL, NULL),
(1763, 'Pacific Southbay College', 5, NULL, NULL),
(1764, 'Goodwill Colleges of North Eastern Philippines', 5, NULL, NULL),
(1765, 'King Solomon Institute', 5, NULL, NULL),
(1766, 'Santo Niño College Foundation', 5, NULL, NULL),
(1767, 'VMC Asian College of President Quirino', 5, NULL, NULL),
(1768, 'Envirogreen School of Technology', 5, NULL, NULL),
(1769, 'New Hope School of Agriculture and Fishery', 5, NULL, NULL),
(1770, 'Adamson University', 5, NULL, NULL),
(1771, 'Air Link International Aviation College', 5, NULL, NULL),
(1772, 'Alliance Graduate School', 5, NULL, NULL),
(1773, 'AMA Computer College-Makati', 5, NULL, NULL),
(1774, 'AMA Computer University', 5, NULL, NULL),
(1775, 'Arellano University-Manila', 5, NULL, NULL),
(1776, 'Arellano University-Malabon', 5, NULL, NULL),
(1777, 'Arellano University-Pasay', 5, NULL, NULL),
(1778, 'Arellano University-Pasig', 5, NULL, NULL),
(1779, 'Asia Pacific College', 5, NULL, NULL),
(1780, 'Asian Institute for Distance Education', 5, NULL, NULL),
(1781, 'Asian Institute of Journalism and Communication', 5, NULL, NULL),
(1782, 'Asian Institute of Management', 5, NULL, NULL),
(1783, 'Asian Institute of Maritime Studies', 5, NULL, NULL),
(1784, 'Asian Social Institute', 5, NULL, NULL),
(1785, 'Asian Theological Seminary', 5, NULL, NULL),
(1786, 'Assumption College', 5, NULL, NULL),
(1787, 'Ateneo de Manila University-Quezon City', 5, NULL, NULL),
(1788, 'Ateneo De Manila University School of Medicine and Public Health', 5, NULL, NULL),
(1789, 'Ateneo de Manila University Graduate School of Business', 5, NULL, NULL),
(1790, 'Bernardo College', 5, NULL, NULL),
(1791, 'Biblical Seminary of the Philippines', 5, NULL, NULL),
(1792, 'CAP College Foundation', 5, NULL, NULL),
(1793, 'University of Asia and the Pacific', 5, NULL, NULL),
(1794, 'Central Colleges of the Philippines', 5, NULL, NULL),
(1795, 'Centro Escolar University-Manila', 5, NULL, NULL),
(1796, 'Chiang Kai Shek College', 5, NULL, NULL),
(1797, 'Chinese General Hospital Colleges', 5, NULL, NULL),
(1798, 'Saint Anthony Mary Claret College', 5, NULL, NULL),
(1799, 'Colegio de San Juan de Letran', 5, NULL, NULL),
(1800, 'Concordia College', 5, NULL, NULL),
(1801, 'De La Salle University-Manila', 5, NULL, NULL),
(1802, 'De Ocampo Memorial College', 5, NULL, NULL),
(1803, 'Divine Word Mission Seminary', 5, NULL, NULL),
(1804, 'De La Salle-College of Saint Benilde', 5, NULL, NULL),
(1805, 'Dominican College', 5, NULL, NULL),
(1806, 'Don Bosco Technical College', 5, NULL, NULL),
(1807, 'Dr. Carlos S. Lanting College', 5, NULL, NULL),
(1808, 'Emilio Aguinaldo College', 5, NULL, NULL),
(1809, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology', 5, NULL, NULL),
(1810, 'Far Eastern University', 5, NULL, NULL),
(1811, 'FEATI University', 5, NULL, NULL),
(1812, 'Febias College of Bible', 5, NULL, NULL),
(1813, 'FEU-FERN College', 5, NULL, NULL),
(1814, 'FEU-Dr. Nicanor Reyes Medical Foundation', 5, NULL, NULL),
(1815, 'Governor Andres Pascual College', 5, NULL, NULL),
(1816, 'Greenville College', 5, NULL, NULL),
(1817, 'De La Salle-Araneta University', 5, NULL, NULL),
(1818, 'Guzman College of Science and Technology', 5, NULL, NULL),
(1819, 'Holy Rosary College Foundation', 5, NULL, NULL),
(1820, 'Institute of Community and Family Health', 5, NULL, NULL),
(1821, 'Institute of Formation and Religious Studies', 5, NULL, NULL),
(1822, 'Interface Computer College-Manila', 5, NULL, NULL),
(1823, 'International Baptist College', 5, NULL, NULL),
(1824, 'International Graduate School of Leadership', 5, NULL, NULL),
(1825, 'Jose Rizal University', 5, NULL, NULL),
(1826, 'University of Caloocan City', 5, NULL, NULL),
(1827, 'La Consolacion College-Manila', 5, NULL, NULL),
(1828, 'La Consolacion College-Caloocan', 5, NULL, NULL),
(1829, 'Lacson College', 5, NULL, NULL),
(1830, 'Centro Escolar Las Piñas', 5, NULL, NULL),
(1831, 'Regis Marie College', 5, NULL, NULL),
(1832, 'Lyceum of the Philippines University', 5, NULL, NULL),
(1833, 'City of Malabon University', 5, NULL, NULL),
(1834, 'Manila Central University', 5, NULL, NULL),
(1835, 'Manila Tytana Colleges', 5, NULL, NULL),
(1836, 'Manila Law College', 5, NULL, NULL),
(1837, 'Manila Adventist College', 5, NULL, NULL),
(1838, 'Manila Theological College', 5, NULL, NULL),
(1839, 'Manuel L. Quezon University', 5, NULL, NULL),
(1840, 'Mapua University-Manila', 5, NULL, NULL),
(1841, 'Mapua University-Makati', 5, NULL, NULL),
(1842, 'Marikina Polytechnic College', 5, NULL, NULL),
(1843, 'Martinez Memorial College', 5, NULL, NULL),
(1844, 'Mary Chiles College', 5, NULL, NULL),
(1845, 'CICM Maryhill School of Theology', 5, NULL, NULL),
(1846, 'Metro Business College-Pasay', 5, NULL, NULL),
(1847, 'Metro Manila College', 5, NULL, NULL),
(1848, 'Metropolitan Medical Center College of Arts Science and Technology', 5, NULL, NULL),
(1849, 'Miriam College', 5, NULL, NULL),
(1850, 'Mother of Life Center', 5, NULL, NULL),
(1851, 'Pamantasan ng Lungsod ng Muntinlupa', 5, NULL, NULL),
(1852, 'NAMEI Polytechnic Institute', 5, NULL, NULL),
(1853, 'National College of Business and Arts-Cubao', 5, NULL, NULL),
(1854, 'National College of Business and Arts-Fairview', 5, NULL, NULL),
(1855, 'The National Teachers College', 5, NULL, NULL),
(1856, 'National University', 5, NULL, NULL),
(1857, 'Navotas Polytechnic College', 5, NULL, NULL),
(1858, 'New Era University', 5, NULL, NULL),
(1859, 'Olivarez College', 5, NULL, NULL),
(1860, 'Our Lady of Fatima University-Valenzuela', 5, NULL, NULL),
(1861, 'Our Lady of Lourdes College', 5, NULL, NULL),
(1862, 'Our Lady of the Angels Seminary', 5, NULL, NULL),
(1863, 'PACE Graduate School of Christian Education', 5, NULL, NULL),
(1864, 'Pamantasan ng Lungsod ng Maynila', 5, NULL, NULL),
(1865, 'City University of Pasay', 5, NULL, NULL),
(1866, 'University of Makati', 5, NULL, NULL),
(1867, 'Pasig Catholic College', 5, NULL, NULL),
(1868, 'PATTS College of Aeronautics', 5, NULL, NULL),
(1869, 'Perpetual Help College of Manila', 5, NULL, NULL),
(1870, 'University of Perpetual Help System Dalta', 5, NULL, NULL),
(1871, 'Philippine Dominican Center of Institutional Studies', 5, NULL, NULL),
(1872, 'Philippine Christian University', 5, NULL, NULL),
(1873, 'Philippine College of Criminology', 5, NULL, NULL),
(1874, 'Philippine College of Health Sciences', 5, NULL, NULL),
(1875, 'St. Louis College-Valenzuela', 5, NULL, NULL),
(1876, 'Philippine Law School', 5, NULL, NULL),
(1877, 'Philippine Merchant Marine School-Manila', 5, NULL, NULL),
(1878, 'Philippine Merchant Marine School-Las Piñas', 5, NULL, NULL),
(1879, 'Philippine Normal University-Main', 5, NULL, NULL),
(1880, 'Philippine School of Business Administration-Quezon City', 5, NULL, NULL),
(1881, 'Philippine School of Business Administration-Manila', 5, NULL, NULL),
(1882, 'Philippine State College of Aeronautics-Main', 5, NULL, NULL),
(1883, 'The Philippine Women\'s University-Manila', 5, NULL, NULL),
(1884, 'PHILSIN College Foundation', 5, NULL, NULL),
(1885, 'PMI Colleges-Manila', 5, NULL, NULL),
(1886, 'PMI Colleges-Quezon City', 5, NULL, NULL),
(1887, 'Polytechnic University of the Philippines', 5, NULL, NULL),
(1888, 'Polytechnic University of The Philippines-Open University', 5, NULL, NULL),
(1889, 'Polytechnic University of the Philippines-San Juan Campus', 5, NULL, NULL),
(1890, 'Polytechnic University of the Philippines-Parañaque Campus', 5, NULL, NULL),
(1891, 'Polytechnic University of the Philippines-Taguig', 5, NULL, NULL),
(1892, 'World Citi Colleges-Quezon City', 5, NULL, NULL),
(1893, 'Makati Medical Center College', 5, NULL, NULL),
(1894, 'Republican College', 5, NULL, NULL),
(1895, 'Rizal Technological University', 5, NULL, NULL),
(1896, 'Roosevelt College-Marikina', 5, NULL, NULL),
(1897, 'St. Camillus College Seminary', 5, NULL, NULL),
(1898, 'St. Francis Divine College', 5, NULL, NULL),
(1899, 'Saint Francis of Assisi College', 5, NULL, NULL),
(1900, 'St. Joseph\'s College of Quezon City', 5, NULL, NULL),
(1901, 'St. Jude College', 5, NULL, NULL),
(1902, 'St. Paul University-Manila', 5, NULL, NULL),
(1903, 'St. Paul University-Quezon City', 5, NULL, NULL),
(1904, 'Saint Rita College-Manila', 5, NULL, NULL),
(1905, 'St. Scholastica\'s College', 5, NULL, NULL),
(1906, 'Samson College of Science and Technology-Quezon City', 5, NULL, NULL),
(1907, 'San Beda University', 5, NULL, NULL),
(1908, 'San Carlos Seminary', 5, NULL, NULL),
(1909, 'San Juan de Dios Educational Foundation', 5, NULL, NULL),
(1910, 'San Sebastian College-Recoletos', 5, NULL, NULL),
(1911, 'Sta. Catalina College', 5, NULL, NULL),
(1912, 'Santa Isabel College of Manila', 5, NULL, NULL),
(1913, 'Siena College', 5, NULL, NULL),
(1914, 'Southeastern College', 5, NULL, NULL),
(1915, 'St. Luke\'s College of Medicine-William H. Quasha Memorial', 5, NULL, NULL),
(1916, 'Stella Maris College', 5, NULL, NULL),
(1917, 'Systems Plus Computer College-Quezon City', 5, NULL, NULL),
(1918, 'Technological Institute of the Philippines-Manila', 5, NULL, NULL),
(1919, 'Technological Institute of the Philippines-Quezon City', 5, NULL, NULL),
(1920, 'Technological University of the Philippines-Manila', 5, NULL, NULL),
(1921, 'Trinity University of Asia', 5, NULL, NULL),
(1922, 'Technological University of the Philippines-Taguig', 5, NULL, NULL),
(1923, 'Unciano Colleges and General Hospital', 5, NULL, NULL),
(1924, 'Southeast Asian College', 5, NULL, NULL),
(1925, 'University of the East-Ramon Magsaysay Memorial Medical Center', 5, NULL, NULL),
(1926, 'The University of Manila', 5, NULL, NULL),
(1927, 'University of Santo Tomas', 5, NULL, NULL),
(1928, 'University of the East-Manila', 5, NULL, NULL),
(1929, 'University of the East-Caloocan', 5, NULL, NULL),
(1930, 'University of the Philippines-Diliman', 5, NULL, NULL),
(1931, 'University of the Philippines-Manila', 5, NULL, NULL),
(1932, 'Angelicum College', 5, NULL, NULL),
(1933, 'Asian College of Science and Technology-Cubao', 5, NULL, NULL),
(1934, 'Universidad de Manila', 5, NULL, NULL),
(1935, 'Don Bosco Center of Studies', 5, NULL, NULL),
(1936, 'IETI College-Alabang', 5, NULL, NULL),
(1937, 'Our Lady of Perpetual Succor College', 5, NULL, NULL),
(1938, 'San Beda College-Alabang', 5, NULL, NULL),
(1939, 'St. Dominic Savio College', 5, NULL, NULL),
(1940, 'St. John Technological College of the Philippines', 5, NULL, NULL),
(1941, 'STI College-Alabang', 5, NULL, NULL),
(1942, 'STI College-Cubao', 5, NULL, NULL),
(1943, 'STI College-Shaw', 5, NULL, NULL),
(1944, 'STI College-Global City', 5, NULL, NULL),
(1945, 'STI College-Caloocan', 5, NULL, NULL),
(1946, 'STI College-Muñoz EDSA', 5, NULL, NULL),
(1947, 'STI College-Novaliches', 5, NULL, NULL),
(1948, 'STI College-Fairview', 5, NULL, NULL),
(1949, 'STI College Pasay-EDSA', 5, NULL, NULL),
(1950, 'Philippine Rehabilitation Institute Foundation', 5, NULL, NULL),
(1951, 'Immaculada Concepcion College', 5, NULL, NULL),
(1952, 'West Bay College', 5, NULL, NULL),
(1953, 'System Plus Computer College-Caloocan', 5, NULL, NULL),
(1954, 'Saint Bernadette College of Alabang', 5, NULL, NULL),
(1955, 'Children of Mary Immaculate College', 5, NULL, NULL),
(1956, 'Informatics College-Manila', 5, NULL, NULL),
(1957, 'The Fisher Valley College', 5, NULL, NULL),
(1958, 'La Consolacion College-Novaliches', 5, NULL, NULL),
(1959, 'National Defense College', 5, NULL, NULL),
(1960, 'Philippine Public Safety College', 5, NULL, NULL),
(1961, 'ABE International College of Business and Economics-Manila', 5, NULL, NULL),
(1962, 'AMA Computer College-Caloocan', 5, NULL, NULL),
(1963, 'AMA Computer College-Fairview', 5, NULL, NULL),
(1964, 'AMA Computer College-Parañaque', 5, NULL, NULL),
(1965, 'AMA Computer College-Sta. Mesa', 5, NULL, NULL),
(1966, 'Divine Mercy College Foundation', 5, NULL, NULL),
(1967, 'Interface Computer College-Caloocan', 5, NULL, NULL),
(1968, 'Our Lady of Fatima University-Quezon City', 5, NULL, NULL),
(1969, 'Our Lady of Lourdes Technological College', 5, NULL, NULL),
(1970, 'St. Clare College of Caloocan', 5, NULL, NULL),
(1971, 'STI College-Las Piñas', 5, NULL, NULL),
(1972, 'Dr. Filemon C. Aguilar Memorial College of Las Piñas', 5, NULL, NULL),
(1973, 'Asia Graduate School of Theology', 5, NULL, NULL),
(1974, 'AMA Computer College-Las Piñas', 5, NULL, NULL),
(1975, 'AMA Computer College-Pasig City', 5, NULL, NULL),
(1976, 'Pamantasan ng Lungsod ng Pasig', 5, NULL, NULL),
(1977, 'Wesleyan College of Manila', 5, NULL, NULL),
(1978, 'Loral Douglas Woosley Bethany Colleges', 5, NULL, NULL),
(1979, 'STI College-Marikina', 5, NULL, NULL),
(1980, 'IETI College of Science and Technology-Marikina', 5, NULL, NULL),
(1981, 'Manila Business College Foundation', 5, NULL, NULL),
(1982, 'Access Computer and Technical Colleges-Manila', 5, NULL, NULL),
(1983, 'Kalayaan College', 5, NULL, NULL),
(1984, 'Criminal Justice College', 5, NULL, NULL),
(1985, 'Entrepreneurs School of Asia', 5, NULL, NULL),
(1986, 'St. Mary\'s College', 5, NULL, NULL),
(1987, 'ABE International College of Business and Accountancy-Cubao', 5, NULL, NULL),
(1988, 'ABE International College of Business and Economics-Las Piñas', 5, NULL, NULL),
(1989, 'Development Academy of the Philippines', 5, NULL, NULL),
(1990, 'National Christian Life College', 5, NULL, NULL),
(1991, 'Global City Innovative College', 5, NULL, NULL),
(1992, 'Southville International School and Colleges', 5, NULL, NULL),
(1993, 'Information and Communications Technology Academy', 5, NULL, NULL),
(1994, 'Our Lady of Guadalupe Colleges', 5, NULL, NULL),
(1995, 'Access Computer and Technical Colleges-Cubao', 5, NULL, NULL),
(1996, 'Immaculate Heart of Mary College-Parañaque', 5, NULL, NULL),
(1997, 'Polytechnic University of the Philippines-Quezon City Campus', 5, NULL, NULL),
(1998, 'Lyceum of Alabang', 5, NULL, NULL),
(1999, 'Rogationist Seminary College of Philosophy', 5, NULL, NULL),
(2000, 'La Consolacion College-Pasig', 5, NULL, NULL),
(2001, 'Gardner College Diliman', 5, NULL, NULL),
(2002, 'ABE International Business College-Caloocan City', 5, NULL, NULL),
(2003, 'WCC Aeronautical & Technological College-North Manila', 5, NULL, NULL),
(2004, 'Informatics College-Northgate', 5, NULL, NULL),
(2005, 'Pamantasan ng Lungsod ng Valenzuela', 5, NULL, NULL),
(2006, 'Marie-Bernarde College', 5, NULL, NULL),
(2007, 'Mary the Queen College of Quezon City', 5, NULL, NULL),
(2008, 'St. Bernadette of Lourdes College', 5, NULL, NULL),
(2009, 'Flight School International', 5, NULL, NULL),
(2010, 'Capitol Medical Center Colleges', 5, NULL, NULL),
(2011, 'New England College', 5, NULL, NULL),
(2012, 'Universal Colleges of Parañaque', 5, NULL, NULL),
(2013, 'Quezon City University', 5, NULL, NULL),
(2014, 'Pamantasan ng Lungsod ng Marikina', 5, NULL, NULL),
(2015, 'Valenzuela City Polytechnic College', 5, NULL, NULL),
(2016, 'South Mansfield College', 5, NULL, NULL),
(2017, 'St. John of Beverly School', 5, NULL, NULL),
(2018, 'Jesus Reigns Christian College Foundation', 5, NULL, NULL),
(2019, 'Villagers Montessori College', 5, NULL, NULL),
(2020, 'AMA School of Medicine', 5, NULL, NULL),
(2021, 'Enderun Colleges', 5, NULL, NULL),
(2022, 'Pateros Technological College', 5, NULL, NULL),
(2023, 'Messiah College Foundation', 5, NULL, NULL),
(2024, 'National Polytechnic College of Science and Technology', 5, NULL, NULL),
(2025, 'Lady of Lourdes Hospital & Colleges of Caybiga', 5, NULL, NULL),
(2026, 'College of St. Catherine', 5, NULL, NULL),
(2027, 'Grace Christian College', 5, NULL, NULL),
(2028, 'Taguig City University', 5, NULL, NULL),
(2029, 'Centro Escolar University-Makati', 5, NULL, NULL),
(2030, 'Philippine Cultural College', 5, NULL, NULL),
(2031, 'Diliman College', 5, NULL, NULL),
(2032, 'Colegio de Sta. Teresa de Avila Foundation', 5, NULL, NULL),
(2033, 'The One Nation Entrepreneur School', 5, NULL, NULL),
(2034, 'Bestlink College of the Philippines', 5, NULL, NULL),
(2035, 'Global Reciprocal Colleges', 5, NULL, NULL),
(2036, 'Golden Link College Foundation', 5, NULL, NULL),
(2037, 'Pacific InterContinental College', 5, NULL, NULL),
(2038, 'ACLC College of Taguig', 5, NULL, NULL),
(2039, 'Asian Institute of Computer Studies-Quezon City', 5, NULL, NULL),
(2040, 'Far Eastern University-Makati', 5, NULL, NULL),
(2041, 'Infotech College of Arts and Sciences Philippines', 5, NULL, NULL),
(2042, 'Treston International College', 5, NULL, NULL),
(2043, 'Access Computer and Technical Colleges-Lagro', 5, NULL, NULL),
(2044, 'UBIX Institute of Technologies', 5, NULL, NULL),
(2045, 'College of Divine Wisdom', 5, NULL, NULL),
(2046, 'Meridian International College of Business and Arts', 5, NULL, NULL),
(2047, 'La Consolacion College-Valenzuela', 5, NULL, NULL),
(2048, 'South SEED LPDH College', 5, NULL, NULL),
(2049, 'Bethel Bible College of the Assemblies of God', 5, NULL, NULL),
(2050, 'Christ the King College of Science and Technology', 5, NULL, NULL),
(2051, 'Colegio de San Gabriel Archangel of Caloocan', 5, NULL, NULL),
(2052, 'St. Vincent de Ferrer College of Camarin', 5, NULL, NULL),
(2053, 'Datamex College of Saint Adeline-Fairview', 5, NULL, NULL),
(2054, 'Asian Institute of Computer Studies-Bicutan', 5, NULL, NULL),
(2055, 'Access Computer and Technical Colleges-Camarin', 5, NULL, NULL),
(2056, 'Datamex College of Saint Adeline-Valenzuela', 5, NULL, NULL),
(2057, 'School of Fashion and the Arts', 5, NULL, NULL),
(2058, 'ICI Global University', 5, NULL, NULL),
(2059, 'Southville International School', 5, NULL, NULL),
(2060, 'St. Therese of the Child Jesus Institute of Arts and Sciences', 5, NULL, NULL),
(2061, 'Arellano University-Mandaluyong', 5, NULL, NULL),
(2062, 'La Verdad Christian College-Caloocan', 5, NULL, NULL),
(2063, 'Rizal Technological University-Pasig', 5, NULL, NULL),
(2064, 'College of Arts and Sciences of Asia and the Pacific', 5, NULL, NULL),
(2065, 'Eclaro Academy', 5, NULL, NULL),
(2066, 'Asia Harvesters College and Seminary', 5, NULL, NULL),
(2067, 'Don Carlo Cavina School', 5, NULL, NULL),
(2068, 'Integrated Innovation and Hospitality Colleges', 5, NULL, NULL),
(2069, 'Philippine School of Interior Design- AHLEN Institute', 5, NULL, NULL),
(2070, 'Recoletos School of Theology', 5, NULL, NULL),
(2071, 'Dr. Jose Fabella Memorial Hospital School of Midwifery', 5, NULL, NULL),
(2072, 'CIIT College of Arts and Technology', 5, NULL, NULL),
(2073, 'Southeast Asia Christian College', 5, NULL, NULL),
(2074, 'Datamex College of Saint Adeline-Parañaque', 5, NULL, NULL),
(2075, 'Asian Institute of Science and Technology', 5, NULL, NULL),
(2076, 'FEU Institute of Technology', 5, NULL, NULL),
(2077, 'Makati Science Technological Institute of the Philippines', 5, NULL, NULL),
(2078, 'Electron College of Technical Education', 5, NULL, NULL),
(2079, 'Marianum College', 5, NULL, NULL),
(2080, 'Metropolitan Institute of Arts and Sciences', 5, NULL, NULL),
(2081, 'Sapphire International Aviation Academy', 5, NULL, NULL),
(2082, 'ACLC College of Marikina', 5, NULL, NULL),
(2083, 'FEU Alabang', 5, NULL, NULL),
(2084, 'GK College of Business Arts and Technology', 5, NULL, NULL),
(2085, 'NBS College', 5, NULL, NULL),
(2086, 'St. Chamuel College', 5, NULL, NULL),
(2087, 'College of Saint Amatiel', 5, NULL, NULL),
(2088, 'South CompEdge College', 5, NULL, NULL),
(2089, 'United Christian Academy College of Asia', 5, NULL, NULL),
(2090, 'Colegio de Muntinlupa', 5, NULL, NULL),
(2091, 'Parañaque City College', 5, NULL, NULL),
(2092, 'ACLC College of Commonwealth', 5, NULL, NULL),
(2093, 'ACLC College of Manila', 5, NULL, NULL),
(2094, 'FEU Diliman', 5, NULL, NULL),
(2095, 'NU Fairview', 5, NULL, NULL),
(2096, 'St. Francis Technical Institute', 5, NULL, NULL),
(2097, 'Abra State Institute of Science and Technology-Bangued', 5, NULL, NULL),
(2098, 'Abra State Institute of Science and Technology-Main', 5, NULL, NULL),
(2099, 'Abra Valley Colleges', 5, NULL, NULL),
(2100, 'Apayao State College-Main', 5, NULL, NULL),
(2101, 'Baguio Central University', 5, NULL, NULL),
(2102, 'University of the Cordilleras', 5, NULL, NULL),
(2103, 'Benguet State University-Bokod Campus', 5, NULL, NULL),
(2104, 'Benguet State University-Main', 5, NULL, NULL),
(2105, 'Benguet State University-Open University', 5, NULL, NULL),
(2106, 'Benguet State University-Buguias Campus', 5, NULL, NULL),
(2107, 'Cordillera Career Development College', 5, NULL, NULL),
(2108, 'Divine Word College of Bangued', 5, NULL, NULL),
(2109, 'Ifugao State University - Lagawe Campus', 5, NULL, NULL),
(2110, 'Ifugao State University - Main', 5, NULL, NULL),
(2111, 'Ifugao State University - Potia', 5, NULL, NULL),
(2112, 'Kalinga State University-Main', 5, NULL, NULL),
(2113, 'Philippine Nazarene College', 5, NULL, NULL),
(2114, 'Mountain Province State Polytechnic College-Main', 5, NULL, NULL),
(2115, 'Mountain Province State Polytechnic College-Tadian', 5, NULL, NULL),
(2116, 'Pines City Colleges', 5, NULL, NULL),
(2117, 'Saint Louis College of Bulanao', 5, NULL, NULL),
(2118, 'Saint Louis University', 5, NULL, NULL),
(2119, 'San Pablo Major Seminary', 5, NULL, NULL),
(2120, 'Casiciaco Recoletos Seminary', 5, NULL, NULL),
(2121, 'University of Baguio', 5, NULL, NULL),
(2122, 'University of the Philippines-Baguio', 5, NULL, NULL),
(2123, 'Easter College', 5, NULL, NULL),
(2124, 'Kalinga State University-Dagupan', 5, NULL, NULL),
(2125, 'Philippine Military Academy', 5, NULL, NULL),
(2126, 'Apayao State College-Luna', 5, NULL, NULL),
(2127, 'Keystone College', 5, NULL, NULL),
(2128, 'Ifugao State University - Tinoc', 5, NULL, NULL),
(2129, 'STI College-Baguio', 5, NULL, NULL),
(2130, 'Baguio College of Technology', 5, NULL, NULL),
(2131, 'BVS College', 5, NULL, NULL),
(2132, 'Cordillera A+ Computer Technology College', 5, NULL, NULL),
(2133, 'AMA Computer College-Baguio', 5, NULL, NULL),
(2134, 'Data Center College of the Philippines of Bangued-Abra', 5, NULL, NULL),
(2135, 'Kalinga Colleges of Science and Technology', 5, NULL, NULL),
(2136, 'Data Center College of the Philippines of Baguio City', 5, NULL, NULL),
(2137, 'King\'s College of the Philippines-Benguet', 5, NULL, NULL),
(2138, 'Saint Tonis College', 5, NULL, NULL),
(2139, 'BSBT College', 5, NULL, NULL),
(2140, 'Xijen College of Mt. Province', 5, NULL, NULL),
(2141, 'Kalinga State University-Rizal', 5, NULL, NULL),
(2142, 'Remnant International College', 5, NULL, NULL),
(2143, 'International School of Asia and the Pacific', 5, NULL, NULL),
(2144, 'Philippine College of Ministry', 5, NULL, NULL),
(2145, 'Ifugao State University-Hapao', 5, NULL, NULL),
(2146, 'Ifugao State University-Aguinaldo', 5, NULL, NULL),
(2147, 'Theological Foundation for Asia (Asia Pacific Theological Seminary)', 5, NULL, NULL),
(2148, 'Star College', 5, NULL, NULL),
(2149, 'Basilan State College-Lamitan', 5, NULL, NULL),
(2150, 'Basilan State College-Maluso', 5, NULL, NULL),
(2151, 'Basilan State College-Sta. Clara', 5, NULL, NULL),
(2152, 'Basilan State College-Tipo-Tipo', 5, NULL, NULL),
(2153, 'Cotabato State University', 5, NULL, NULL),
(2154, 'Cotabato Foundation College of Science and Technology-Datu Montawal Campus', 5, NULL, NULL),
(2155, 'De La Vida College', 5, NULL, NULL),
(2156, 'Dr. P. Ocampo Colleges', 5, NULL, NULL),
(2157, 'Headstart College of Cotabato', 5, NULL, NULL),
(2158, 'Jamiatu Marawi Al-Islamia Foundation', 5, NULL, NULL),
(2159, 'Jamiatu Muslim Mindanao', 5, NULL, NULL),
(2160, 'Jamiatul Philippine Al-Islamia', 5, NULL, NULL),
(2161, 'Mindanao State University-Lanao National College of Arts and Trades', 5, NULL, NULL),
(2162, 'Mapandi Memorial College', 5, NULL, NULL),
(2163, 'Marawi Capitol College Foundation', 5, NULL, NULL),
(2164, 'Mindanao Capitol College', 5, NULL, NULL),
(2165, 'Mindanao State University-Main Campus Marawi City', 5, NULL, NULL),
(2166, 'Notre Dame Center For Catechesis', 5, NULL, NULL),
(2167, 'Notre Dame Hospital and School of Midwifery', 5, NULL, NULL),
(2168, 'Notre Dame University', 5, NULL, NULL),
(2169, 'Pacasum College', 5, NULL, NULL),
(2170, 'St. Benedict College of Cotabato', 5, NULL, NULL),
(2171, 'Shariff Kabunsuan College', 5, NULL, NULL),
(2172, 'Mindanao Islamic Computer College', 5, NULL, NULL),
(2173, 'STI College-Cotabato', 5, NULL, NULL),
(2174, 'Datu Mala Muslim Mindanao Islamic College Foundation', 5, NULL, NULL),
(2175, 'Antonio R. Pacheco College', 5, NULL, NULL),
(2176, 'AMA Computer College-Cotabato City', 5, NULL, NULL),
(2177, 'Bubong Marzok Memorial Foundation College', 5, NULL, NULL),
(2178, 'Senator Ninoy Aquino College Foundation-Marawi', 5, NULL, NULL),
(2179, 'Kutawato Darrusalam College', 5, NULL, NULL),
(2180, 'Notre Dame RVM College of Cotabato', 5, NULL, NULL),
(2181, 'Coland Systems Technology', 5, NULL, NULL),
(2182, 'Academia de Tecnologia in Mindanao', 5, NULL, NULL),
(2183, 'Jamiat Cotabato and Institute of Technology', 5, NULL, NULL),
(2184, 'Gani L. Abpi College', 5, NULL, NULL),
(2185, 'Central Sulu College', 5, NULL, NULL),
(2186, 'Hadji Butu School of Arts and Trades', 5, NULL, NULL),
(2187, 'Lanao Agricultural College', 5, NULL, NULL),
(2188, 'Lapak Agricultural School', 5, NULL, NULL),
(2189, 'Mindanao State University-Maguindanao', 5, NULL, NULL),
(2190, 'Mindanao State University-Sulu Development Technical College', 5, NULL, NULL),
(2191, 'Mindanao State University-Tawi-Tawi College of Technology and Oceanography', 5, NULL, NULL),
(2192, 'Notre Dame of Jolo College', 5, NULL, NULL),
(2193, 'Parang Foundation College', 5, NULL, NULL),
(2194, 'Shariff Kabunsuan College (Annex)', 5, NULL, NULL),
(2195, 'Sultan Kudarat Islamic Academy Foundation College', 5, NULL, NULL),
(2196, 'Sulu State College', 5, NULL, NULL),
(2197, 'Tawi-Tawi Regional Agricultural College', 5, NULL, NULL),
(2198, 'Tawi-Tawi Regional Agricultural College - Tarawakan', 5, NULL, NULL),
(2199, 'Tawi-Tawi Regional Agricultural College - Languyan', 5, NULL, NULL),
(2200, 'Tawi-Tawi Regional Agricultural College-Simunul', 5, NULL, NULL),
(2201, 'Tawi-Tawi Regional Agricultural College - Sibutu', 5, NULL, NULL),
(2202, 'Unda Memorial National Agricultural School', 5, NULL, NULL),
(2203, 'Upi Agricultural School-Provincial Technical Institute of Agriculture', 5, NULL, NULL),
(2204, 'Adiong Memorial Polytechnic State College', 5, NULL, NULL),
(2205, 'Balabagan Trade School', 5, NULL, NULL),
(2206, 'Del Sur Good Shepherd College', 5, NULL, NULL),
(2207, 'Southwestern Mindanao Islamic Institute', 5, NULL, NULL),
(2208, 'Tawi-Tawi School of Midwifery', 5, NULL, NULL),
(2209, 'Abubakar Computer Learning Center Foundation', 5, NULL, NULL),
(2210, 'Lanao Educational Institute', 5, NULL, NULL),
(2211, 'Mahardika Institute of Technology', 5, NULL, NULL),
(2212, 'Dansalan Polytechnic College', 5, NULL, NULL),
(2213, 'Philippine Muslim Teachers\' College', 5, NULL, NULL),
(2214, 'SAL Foundation College', 5, NULL, NULL),
(2215, 'Mindanao Autonomous College Foundation', 5, NULL, NULL),
(2216, 'SPA College', 5, NULL, NULL),
(2217, 'Datu Ibrahim Paglas Memorial College', 5, NULL, NULL),
(2218, 'Cali Paramedical College Foundation', 5, NULL, NULL),
(2219, 'Masiricampo Abantas Memorial Educational Center', 5, NULL, NULL),
(2220, 'Marawi Islamic College', 5, NULL, NULL),
(2221, 'Saffrullah M. Dipatuan Foundation Academy', 5, NULL, NULL),
(2222, 'South Upi College', 5, NULL, NULL),
(2223, 'St. Benedict College of Maguindanao', 5, NULL, NULL),
(2224, 'Mariam School of Nursing', 5, NULL, NULL),
(2225, 'Lanao Islamic Paramedical College Foundation', 5, NULL, NULL),
(2226, 'Regional Madrasah Graduate Academy', 5, NULL, NULL),
(2227, 'Lake Lanao College', 5, NULL, NULL),
(2228, 'Wisdom International School for Higher Education Studies', 5, NULL, NULL),
(2229, 'Datu Blo Umpar Adiong Agricultural School Foundation', 5, NULL, NULL),
(2230, 'Bai Malgen Mama College', 5, NULL, NULL),
(2231, 'Eastern Kutawato College', 5, NULL, NULL),
(2232, 'RC-Al Khwarizmi International College Foundation', 5, NULL, NULL),
(2233, 'Mindanao Institute of Healthcare Professionals', 5, NULL, NULL),
(2234, 'Hardam Furigay Colleges Foundation', 5, NULL, NULL),
(2235, 'University of Southern Mindanao - Buluan', 5, NULL, NULL),
(2236, 'Philippine Engineering and Agro-Industrial College', 5, NULL, NULL),
(2237, 'Illana Bay Integrated Computer College', 5, NULL, NULL),
(2238, 'Khadijah Mohammad Islamic Academy', 5, NULL, NULL),
(2239, 'Iranun Foundation College', 5, NULL, NULL),
(2240, 'Lanao Central College', 5, NULL, NULL),
(2241, 'Sulu College of Technology', 5, NULL, NULL),
(2242, 'Enthusiastic College', 5, NULL, NULL),
(2243, 'Hadji Datu Saidona Pendatun Foundation College', 5, NULL, NULL),
(2244, 'General Diamongun K. Mangondato College of Agriculture and Fisheries', 5, NULL, NULL),
(2245, 'Al Bangsamoro Shari\'ah and Professional Education College', 5, NULL, NULL),
(2246, 'As-Salihein Integrated School Foundation', 5, NULL, NULL),
(2247, 'Mindanao Autonomous College Foundation-Maluso', 5, NULL, NULL),
(2248, 'Jamiatu Dansalan Al-Islamia Foundation', 5, NULL, NULL),
(2249, 'Muslim Mindanao Integrated College Academy', 5, NULL, NULL),
(2250, 'Maranao Islamic Institute - Ma\'Had Maranao Al-Islamie', 5, NULL, NULL),
(2251, 'Binnor Pangandaman Integrated College', 5, NULL, NULL),
(2252, 'Colegio de Upi', 5, NULL, NULL),
(2253, 'Lamitan Technical Institute', 5, NULL, NULL),
(2254, 'Mindanaoan Integrated Academy', 5, NULL, NULL),
(2255, 'Universal College Foundation of Southeast Asia and the Pacific', 5, NULL, NULL),
(2256, 'Tamparan Populace Islamic College', 5, NULL, NULL),
(2257, 'Philippine Last Frontier College', 5, NULL, NULL),
(2258, 'Iqra Development Academy', 5, NULL, NULL),
(2259, 'Asma Khadijah Islamic Academy', 5, NULL, NULL),
(2260, 'Agusan Colleges', 5, NULL, NULL),
(2261, 'Agusan del Sur College', 5, NULL, NULL),
(2262, 'Agusan Del Sur State College of Agriculture and Technology', 5, NULL, NULL),
(2263, 'Asian College Foundation', 5, NULL, NULL),
(2264, 'Butuan City Colleges', 5, NULL, NULL),
(2265, 'Butuan Doctors\' College', 5, NULL, NULL),
(2266, 'Don Jose Ecleo Memorial College', 5, NULL, NULL),
(2267, 'Elisa R. Ochoa Memorial Northern Mindanao School of Midwifery', 5, NULL, NULL),
(2268, 'Northern Mindanao Colleges', 5, NULL, NULL),
(2269, 'Caraga State University-Cabadbaran Campus', 5, NULL, NULL),
(2270, 'Caraga State University-Main Campus', 5, NULL, NULL),
(2271, 'Northwestern Agusan Colleges', 5, NULL, NULL),
(2272, 'Philippine Normal University-Mindanao Campus', 5, NULL, NULL),
(2273, 'Saint Francis Xavier College', 5, NULL, NULL),
(2274, 'Saint Joseph Institute of Technology', 5, NULL, NULL),
(2275, 'St. Jude Thaddeus Institute of Technology', 5, NULL, NULL),
(2276, 'San Francisco Colleges', 5, NULL, NULL),
(2277, 'St. Paul University Surigao', 5, NULL, NULL),
(2278, 'Surigao State College of Technology-Main', 5, NULL, NULL),
(2279, 'Surigao Education Center', 5, NULL, NULL),
(2280, 'Father Saturnino Urios University', 5, NULL, NULL),
(2281, 'Northeastern Mindanao Colleges', 5, NULL, NULL),
(2282, 'Surigao State College of Technology-Del Carmen', 5, NULL, NULL),
(2283, 'Andres Soriano Colleges of Bislig', 5, NULL, NULL),
(2284, 'Saint Michael College-Cantilan', 5, NULL, NULL),
(2285, 'Saint Theresa College of Tandag', 5, NULL, NULL),
(2286, 'Saint Vincent de Paul Diocesan College', 5, NULL, NULL),
(2287, 'North Eastern Mindanao State University-Cagwait', 5, NULL, NULL),
(2288, 'North Eastern Mindanao State University-Lianga', 5, NULL, NULL),
(2289, 'North Eastern Mindanao State University-Tagbina', 5, NULL, NULL),
(2290, 'North Eastern Mindanao State University-San Miguel', 5, NULL, NULL),
(2291, 'Southern Technological Institute of the Philippines', 5, NULL, NULL),
(2292, 'Surigao Sur Colleges', 5, NULL, NULL),
(2293, 'North Eastern Mindanao State University-Cantilan', 5, NULL, NULL),
(2294, 'North Eastern Mindanao State University-Main', 5, NULL, NULL),
(2295, 'University of Southeastern Philippines-Bislig Campus', 5, NULL, NULL),
(2296, 'Siargao Island Institute of Technology', 5, NULL, NULL),
(2297, 'Caraga Institute of Technology', 5, NULL, NULL),
(2298, 'De La Salle John Bosco College', 5, NULL, NULL),
(2299, 'Mt. Carmel College of San Francisco', 5, NULL, NULL),
(2300, 'Surigao State College of Technology-Malimono', 5, NULL, NULL),
(2301, 'Saint Michael College of Caraga', 5, NULL, NULL),
(2302, 'Southway College of Technology', 5, NULL, NULL),
(2303, 'Holy Child Colleges of Butuan City', 5, NULL, NULL),
(2304, 'STI College-Surigao', 5, NULL, NULL),
(2305, 'Balite Institute of Technology-Butuan', 5, NULL, NULL),
(2306, 'Saint Peter College Seminary', 5, NULL, NULL),
(2307, 'Bucas Grande Foundation College', 5, NULL, NULL),
(2308, 'ACLC College of Butuan City', 5, NULL, NULL),
(2309, 'Hinatuan Southern College', 5, NULL, NULL),
(2310, 'Philippine Electronics and Communication Institute of Technology', 5, NULL, NULL),
(2311, 'Candelaria Institute of Technology of Cabadbaran', 5, NULL, NULL),
(2312, 'Surigao Doctors\' College', 5, NULL, NULL),
(2313, 'Surigao State College of Technology-Mainit', 5, NULL, NULL),
(2314, 'Merchant Marine Academy of Caraga', 5, NULL, NULL),
(2315, 'Caraga School of Business', 5, NULL, NULL),
(2316, 'Abada College', 5, NULL, NULL),
(2317, 'Colegio De San Sebastian-Sablayan', 5, NULL, NULL),
(2318, 'Divine Word College of Calapan', 5, NULL, NULL),
(2319, 'Divine Word College of San Jose', 5, NULL, NULL),
(2320, 'Eastern Mindoro College', 5, NULL, NULL),
(2321, 'EMA EMITS College Philippines', 5, NULL, NULL),
(2322, 'Grace Mission College', 5, NULL, NULL),
(2323, 'Holy Trinity University', 5, NULL, NULL),
(2324, 'St. Mary\'s College of Marinduque', 5, NULL, NULL),
(2325, 'Luna Goco Colleges-Calapan', 5, NULL, NULL),
(2326, 'Marinduque State University-Main Campus', 5, NULL, NULL),
(2327, 'Mindoro State University-Main Campus', 5, NULL, NULL),
(2328, 'Marinduque State University-Torrijos Campus', 5, NULL, NULL),
(2329, 'Occidental Mindoro State College', 5, NULL, NULL),
(2330, 'Western Philippines University', 5, NULL, NULL),
(2331, 'Western Philippines University-El Nido', 5, NULL, NULL),
(2332, 'Western Philippines University-Busuanga', 5, NULL, NULL),
(2333, 'Western Philippines University-Culion', 5, NULL, NULL),
(2334, 'Western Philippines University-Quezon', 5, NULL, NULL),
(2335, 'Western Philippines University-Rio Tuba', 5, NULL, NULL),
(2336, 'Palawan Polytechnic College', 5, NULL, NULL),
(2337, 'Palawan State University', 5, NULL, NULL),
(2338, 'Palawan State University-Narra', 5, NULL, NULL),
(2339, 'Palawan State University-Dumaran', 5, NULL, NULL),
(2340, 'Palawan State University- Balabac', 5, NULL, NULL),
(2341, 'Palawan State University-Bataraza', 5, NULL, NULL),
(2342, 'Palawan State University-Sofronio Española', 5, NULL, NULL),
(2343, 'Romblon State University-San Andres Campus', 5, NULL, NULL),
(2344, 'Romblon State University-Main', 5, NULL, NULL),
(2345, 'Saint Augustine Seminary', 5, NULL, NULL),
(2346, 'San Francisco Javier College', 5, NULL, NULL),
(2347, 'Santa Cruz Institute-Marinduque', 5, NULL, NULL),
(2348, 'Seminario De San Jose', 5, NULL, NULL),
(2349, 'Educational Systems Technological Institute', 5, NULL, NULL),
(2350, 'Occidental Mindoro State College-Labangan Campus', 5, NULL, NULL),
(2351, 'Romblon State University-San Fernando Campus', 5, NULL, NULL),
(2352, 'CLCC Institute of Computer Arts & Technology', 5, NULL, NULL),
(2353, 'Mindoro State University-Calapan City Campus', 5, NULL, NULL),
(2354, 'Fullbright College', 5, NULL, NULL),
(2355, 'Marinduque Midwest College', 5, NULL, NULL),
(2356, 'Mindoro State University-Bongabong Campus', 5, NULL, NULL),
(2357, 'Occidental Mindoro State College-Murtha Campus', 5, NULL, NULL),
(2358, 'Occidental Mindoro State College-Mamburao', 5, NULL, NULL),
(2359, 'Occidental Mindoro State College-Sablayan Campus', 5, NULL, NULL),
(2360, 'Prince of Peace College', 5, NULL, NULL),
(2361, 'John Paul College', 5, NULL, NULL),
(2362, 'Marinduque State University-Gasan Campus', 5, NULL, NULL),
(2363, 'Marinduque State University-Sta. Cruz Campus', 5, NULL, NULL),
(2364, 'Palawan State University-Araceli', 5, NULL, NULL),
(2365, 'Palawan State University- Brooke\'s Point', 5, NULL, NULL),
(2366, 'Palawan State University-Coron', 5, NULL, NULL),
(2367, 'Palawan State University-Cuyo', 5, NULL, NULL),
(2368, 'Palawan State University-Quezon', 5, NULL, NULL),
(2369, 'Palawan State University-Roxas', 5, NULL, NULL),
(2370, 'Palawan State University-Taytay', 5, NULL, NULL),
(2371, 'Romblon State University-Calatrava Campus', 5, NULL, NULL),
(2372, 'Romblon State University-San Agustin Campus', 5, NULL, NULL),
(2373, 'Romblon State University-Cajidiocan Campus', 5, NULL, NULL),
(2374, 'Romblon State University-Sta. Fe Campus', 5, NULL, NULL),
(2375, 'Romblon State University-Sta. Maria Campus', 5, NULL, NULL),
(2376, 'Romblon State University-Romblon Campus', 5, NULL, NULL),
(2377, 'Western Philippines University-Puerto Princesa', 5, NULL, NULL),
(2378, 'San Lorenzo Ruiz Seminary', 5, NULL, NULL),
(2379, 'Palawan State University-New Ibajay El Nido', 5, NULL, NULL),
(2380, 'Palawan State University-Rizal', 5, NULL, NULL),
(2381, 'Clarendon College', 5, NULL, NULL),
(2382, 'Mina de Oro Institute of Science and Technology', 5, NULL, NULL),
(2383, 'Ark of the Covenant Montessori Chamber of Learning College', 5, NULL, NULL),
(2384, 'Palawan Technological College', 5, NULL, NULL),
(2385, 'Innovative College of Science and Technology', 5, NULL, NULL),
(2386, 'St. Anthony College-Calapan City', 5, NULL, NULL),
(2387, 'Polytechnic University of the Philippines-Bansud Campus', 5, NULL, NULL),
(2388, 'Polytechnic University of the Philippines-Sablayan Campus', 5, NULL, NULL),
(2389, 'Southwestern Institute of Business and Technology', 5, NULL, NULL),
(2390, 'Paradigm Colleges of Science and Technology', 5, NULL, NULL),
(2391, 'Erhard Systems Technological Institute', 5, NULL, NULL),
(2392, 'Institute of Business Science and Medical Arts', 5, NULL, NULL),
(2393, 'Philippine Central Islands College Foundation', 5, NULL, NULL),
(2394, 'ACLC College of Calapan', 5, NULL, NULL),
(2395, 'Pinamalayan Maritime Foundation and Technological College', 5, NULL, NULL),
(2396, 'STI College-Puerto Princesa', 5, NULL, NULL),
(2397, 'City College of Calapan', 5, NULL, NULL),
(2398, 'Palawan State University-Linapacan', 5, NULL, NULL),
(2399, 'Palawan State University-San Rafael Puerto Princesa City', 5, NULL, NULL),
(2400, 'Romblon State University-San Jose Campus', 5, NULL, NULL),
(2401, 'Palawan State University-San Vicente', 5, NULL, NULL),
(2402, 'Baco Community College', 5, NULL, NULL),
(2403, 'Erhard Science and Technological Institute-Oriental Mindoro', 5, NULL, NULL),
(2404, 'Malindig Institute Foundation', 5, NULL, NULL),
(2405, 'Southwestern College of Maritime Business and Technology', 5, NULL, NULL),
(2406, 'Occidental Mindoro State College-Lubang Campus', 5, NULL, NULL),
(2407, 'Pola Community College', 5, NULL, NULL),
(2408, 'San Brendan College', 5, NULL, NULL),
(2409, 'Colegio de Puerto Galera', 5, NULL, NULL),
(2411, 'USTP', 5, NULL, NULL),
(2412, 'MOGCHS', 5, NULL, NULL),
(2422, 'PHINMA Cagayan de Oro College', 5, NULL, NULL),
(2426, 'University of Science and Technology of Southern Philippines (USTP)', 5, NULL, NULL),
(2435, 'Phinma-Cagayan de Oro College', 5, NULL, NULL),
(2436, 'Stella Matutina Academy', 5, NULL, NULL),
(2437, 'Migcawayan Elementary Education', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcandpoints`
--

CREATE TABLE `tblinterviewcandpoints` (
  `interviewP_id` int(50) NOT NULL,
  `interviewP_criteriaId` int(11) NOT NULL,
  `interviewP_jobId` int(11) NOT NULL,
  `interviewP_candId` int(11) NOT NULL,
  `interviewP_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewcandpoints`
--

INSERT INTO `tblinterviewcandpoints` (`interviewP_id`, `interviewP_criteriaId`, `interviewP_jobId`, `interviewP_candId`, `interviewP_points`) VALUES
(1, 78, 17, 40, 15),
(2, 79, 17, 40, 10),
(3, 80, 17, 40, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcategory`
--

CREATE TABLE `tblinterviewcategory` (
  `interview_categ_id` int(11) NOT NULL,
  `interview_categ_name` text NOT NULL,
  `interview_categ_status` tinyint(1) NOT NULL DEFAULT 1,
  `interview_categ_hrId` int(11) DEFAULT NULL,
  `interview_categ_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewcategory`
--

INSERT INTO `tblinterviewcategory` (`interview_categ_id`, `interview_categ_name`, `interview_categ_status`, `interview_categ_hrId`, `interview_categ_datetime`) VALUES
(1, 'Technical', 1, NULL, NULL),
(2, 'Behavioral', 1, NULL, NULL),
(3, 'Situational', 1, NULL, NULL),
(4, 'Analytical', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcriteria`
--

CREATE TABLE `tblinterviewcriteria` (
  `criteria_inter_id` int(11) NOT NULL,
  `criteria_inter_name` text NOT NULL,
  `criteria_inter_categId` int(11) NOT NULL,
  `criteria_inter_hrId` int(11) DEFAULT NULL,
  `criteria_inter_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewcriteria`
--

INSERT INTO `tblinterviewcriteria` (`criteria_inter_id`, `criteria_inter_name`, `criteria_inter_categId`, `criteria_inter_hrId`, `criteria_inter_datetime`) VALUES
(7, 'Proficiency in specific software or programming languages', 1, NULL, NULL),
(8, 'Understanding of technical concepts', 1, NULL, NULL),
(9, 'Experience with certain technologies', 1, NULL, NULL),
(10, 'Teamwork', 2, NULL, NULL),
(11, 'Communication', 2, NULL, NULL),
(12, 'Adaptability', 2, NULL, NULL),
(13, 'Leadership', 2, NULL, NULL),
(14, 'Conflict Resolution', 3, NULL, NULL),
(15, 'Decision-Making', 3, NULL, NULL),
(16, 'Handling Pressure', 3, NULL, NULL),
(17, 'Project Management', 3, NULL, NULL),
(18, 'Problem Solving', 4, NULL, NULL),
(19, 'Logical Reasoning', 4, NULL, NULL),
(20, 'Attention to Detail', 4, NULL, NULL),
(21, 'Data Interpretation', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcriteriamaster`
--

CREATE TABLE `tblinterviewcriteriamaster` (
  `inter_criteria_id` int(11) NOT NULL,
  `inter_criteria_jobId` int(11) NOT NULL,
  `inter_criteria_criteriaId` int(11) NOT NULL,
  `inter_criteria_question` text NOT NULL,
  `inter_criteria_points` int(11) NOT NULL,
  `inter_criteria_status` tinyint(1) NOT NULL DEFAULT 1,
  `inter_criteria_hrId` int(11) DEFAULT NULL,
  `inter_criteria_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewcriteriamaster`
--

INSERT INTO `tblinterviewcriteriamaster` (`inter_criteria_id`, `inter_criteria_jobId`, `inter_criteria_criteriaId`, `inter_criteria_question`, `inter_criteria_points`, `inter_criteria_status`, `inter_criteria_hrId`, `inter_criteria_datetime`) VALUES
(23, 11, 7, '', 100, 0, NULL, NULL),
(24, 11, 8, '', 200, 0, NULL, NULL),
(25, 11, 9, '', 200, 0, NULL, NULL),
(26, 11, 10, '', 200, 1, NULL, NULL),
(27, 11, 7, '', 200, 0, NULL, NULL),
(28, 11, 10, '', 200, 0, NULL, NULL),
(29, 11, 15, '', 10, 1, NULL, NULL),
(30, 11, 11, '', 200, 1, NULL, NULL),
(31, 11, 8, '', 200, 1, NULL, NULL),
(32, 11, 9, '', 200, 1, NULL, NULL),
(33, 11, 13, '', 200, 0, NULL, NULL),
(34, 11, 19, '', 10000, 1, NULL, NULL),
(35, 11, 16, '', 200, 1, NULL, NULL),
(36, 11, 13, '', 200, 1, NULL, NULL),
(37, 12, 7, '', 50, 1, NULL, NULL),
(38, 12, 10, '', 50, 1, NULL, NULL),
(39, 12, 14, '', 50, 1, NULL, NULL),
(40, 12, 18, '', 50, 1, NULL, NULL),
(41, 10, 11, '', 50, 1, NULL, NULL),
(42, 10, 17, '', 50, 1, NULL, NULL),
(43, 10, 19, '', 50, 1, NULL, NULL),
(44, 14, 7, '', 200, 0, NULL, NULL),
(45, 14, 8, '', 200, 0, NULL, NULL),
(46, 14, 9, '', 200, 0, NULL, NULL),
(47, 14, 10, '', 200, 0, NULL, NULL),
(48, 15, 11, '', 50, 1, NULL, NULL),
(49, 15, 15, '', 50, 1, NULL, NULL),
(50, 15, 19, '', 50, 1, NULL, NULL),
(51, 15, 8, 'inter_criteria_question', 200, 1, NULL, NULL),
(52, 15, 9, 'inter_criteria_question', 200, 1, NULL, NULL),
(53, 15, 7, 'inter_criteria_question', 200, 1, NULL, NULL),
(54, 15, 10, 'inter_criteria_question', 200, 1, NULL, NULL),
(55, 14, 18, 'How good you are?', 50, 1, NULL, NULL),
(56, 16, 8, 'maayo ka mo fix?', 20, 1, NULL, NULL),
(57, 16, 11, 'unsa imong pamaagi pag talk sa mga sht', 50, 1, NULL, NULL),
(58, 16, 19, 'Maayo ka mo solve sa problem?', 30, 1, NULL, NULL),
(59, 3, 7, 'Are you good at programming?', 20, 1, NULL, NULL),
(60, 3, 13, 'How good are you at leading a team?', 50, 1, NULL, NULL),
(61, 16, 20, 'What is analytics', 50, 1, NULL, NULL),
(62, 3, 18, 'How good are you solving the problem?', 50, 1, NULL, NULL),
(63, 5, 8, 'How good are you for technical', 20, 1, NULL, NULL),
(64, 5, 11, 'How good are you for communicating', 20, 1, NULL, NULL),
(65, 5, 15, 'Describe Decision Making', 20, 1, NULL, NULL),
(66, 5, 19, 'Give me a logic scenario', 20, 1, NULL, NULL),
(67, 1, 18, 'How good are you solving the problem?', 20, 1, NULL, NULL),
(68, 1, 11, 'How good are you in communicating', 20, 1, NULL, NULL),
(69, 1, 15, 'How good are you in decision making', 20, 1, NULL, NULL),
(70, 13, 11, 'How good are you solving the problem?', 10, 1, NULL, NULL),
(71, 14, 8, 'How good are you in understanding of technical concepts', 20, 1, NULL, NULL),
(72, 14, 10, 'How will you communicate to your team?', 20, 1, NULL, NULL),
(73, 14, 15, 'How will you decide in a critical situation?', 10, 1, NULL, NULL),
(74, 19, 9, 'How good are you to use the technology nowadays', 20, 1, NULL, NULL),
(75, 19, 10, 'How will you approach the team to make the project perfect', 30, 1, NULL, NULL),
(76, 19, 15, 'What is decision making', 20, 1, NULL, NULL),
(77, 19, 18, 'How good are you solving the problem?', 30, 1, NULL, NULL),
(78, 17, 8, 'How good are you in understanding of technical concepts', 20, 1, NULL, NULL),
(79, 17, 10, 'How will you communicate a team if there is a problem', 20, 1, NULL, NULL),
(80, 17, 15, 'How good are you in decision making', 20, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewpassingpercent`
--

CREATE TABLE `tblinterviewpassingpercent` (
  `passing_id` int(11) NOT NULL,
  `passing_jobId` int(11) NOT NULL,
  `passing_percent` int(11) NOT NULL,
  `passing_hrId` int(11) DEFAULT NULL,
  `passing_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewpassingpercent`
--

INSERT INTO `tblinterviewpassingpercent` (`passing_id`, `passing_jobId`, `passing_percent`, `passing_hrId`, `passing_datetime`) VALUES
(1, 1, 50, NULL, NULL),
(3, 3, 50, NULL, NULL),
(4, 4, 50, NULL, NULL),
(5, 5, 50, NULL, NULL),
(6, 6, 50, NULL, NULL),
(8, 8, 50, NULL, NULL),
(9, 9, 50, NULL, NULL),
(10, 10, 50, NULL, NULL),
(11, 11, 50, NULL, NULL),
(23, 12, 50, NULL, NULL),
(24, 13, 50, NULL, NULL),
(25, 14, 50, NULL, NULL),
(26, 15, 50, NULL, NULL),
(27, 16, 50, NULL, NULL),
(28, 17, 50, NULL, NULL),
(29, 18, 50, NULL, NULL),
(30, 19, 50, NULL, NULL),
(31, 20, 50, NULL, NULL),
(32, 21, 50, NULL, NULL),
(33, 22, 50, NULL, NULL),
(34, 23, 50, NULL, NULL),
(35, 24, 50, NULL, NULL),
(36, 25, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewresult`
--

CREATE TABLE `tblinterviewresult` (
  `interviewR_id` int(11) NOT NULL,
  `interviewR_candId` int(11) NOT NULL,
  `interviewR_jobId` int(11) NOT NULL,
  `interviewR_score` int(11) NOT NULL,
  `interviewR_totalScore` int(11) NOT NULL,
  `interviewR_date` date NOT NULL,
  `interviewR_status` tinyint(1) NOT NULL COMMENT 'passing = 1',
  `interviewR_hrId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewresult`
--

INSERT INTO `tblinterviewresult` (`interviewR_id`, `interviewR_candId`, `interviewR_jobId`, `interviewR_score`, `interviewR_totalScore`, `interviewR_date`, `interviewR_status`, `interviewR_hrId`) VALUES
(1, 40, 17, 35, 60, '2025-08-11', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewschedule`
--

CREATE TABLE `tblinterviewschedule` (
  `intsched_id` int(11) NOT NULL,
  `intsched_jobId` int(11) NOT NULL,
  `intsched_candId` int(11) NOT NULL,
  `intsched_date` datetime NOT NULL,
  `intsched_hrId` int(11) DEFAULT NULL,
  `intsched_createdAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewschedule`
--

INSERT INTO `tblinterviewschedule` (`intsched_id`, `intsched_jobId`, `intsched_candId`, `intsched_date`, `intsched_hrId`, `intsched_createdAt`) VALUES
(2, 17, 40, '2025-08-27 13:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobbranch`
--

CREATE TABLE `tbljobbranch` (
  `jobB_id` int(11) NOT NULL,
  `jobB_jobMId` int(11) NOT NULL,
  `jobB_branchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobbranch`
--

INSERT INTO `tbljobbranch` (`jobB_id`, `jobB_jobMId`, `jobB_branchId`) VALUES
(1, 17, 1),
(2, 17, 4),
(3, 24, 3),
(4, 25, 4),
(5, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbljoboffer`
--

CREATE TABLE `tbljoboffer` (
  `joboffer_id` int(11) NOT NULL,
  `joboffer_candId` int(11) NOT NULL,
  `joboffer_jobMId` int(11) NOT NULL,
  `joboffer_date` date NOT NULL,
  `joboffer_salary` decimal(10,2) NOT NULL,
  `joboffer_document` varchar(255) NOT NULL,
  `joboffer_expiryDate` date NOT NULL,
  `joboffer_hrId` int(11) DEFAULT NULL,
  `joboffer_createdAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbljobofferstatus`
--

CREATE TABLE `tbljobofferstatus` (
  `jobofferS_id` int(11) NOT NULL,
  `jobofferS_name` varchar(50) NOT NULL,
  `jobofferS_hrId` int(11) DEFAULT NULL,
  `jobofferS_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobofferstatus`
--

INSERT INTO `tbljobofferstatus` (`jobofferS_id`, `jobofferS_name`, `jobofferS_hrId`, `jobofferS_datetime`) VALUES
(1, 'Accept', NULL, NULL),
(2, 'Reject', NULL, NULL),
(3, 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobpassing`
--

CREATE TABLE `tbljobpassing` (
  `passing_id` int(20) NOT NULL,
  `passing_jobId` int(11) NOT NULL,
  `passing_points` int(20) NOT NULL,
  `passing_hrId` int(11) DEFAULT NULL,
  `passing_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobpassing`
--

INSERT INTO `tbljobpassing` (`passing_id`, `passing_jobId`, `passing_points`, `passing_hrId`, `passing_datetime`) VALUES
(1, 1, 50, NULL, NULL),
(2, 11, 50, NULL, NULL),
(3, 4, 50, NULL, NULL),
(5, 3, 5, NULL, NULL),
(6, 5, 50, NULL, NULL),
(8, 10, 70, NULL, NULL),
(9, 6, 50, NULL, NULL),
(10, 12, 50, NULL, NULL),
(11, 13, 10, NULL, NULL),
(12, 14, 50, NULL, NULL),
(13, 15, 60, NULL, NULL),
(14, 16, 70, NULL, NULL),
(15, 17, 50, NULL, NULL),
(16, 18, 50, NULL, NULL),
(17, 19, 60, NULL, NULL),
(18, 20, 60, NULL, NULL),
(19, 21, 60, NULL, NULL),
(20, 22, 60, NULL, NULL),
(21, 23, 60, NULL, NULL),
(22, 24, 60, NULL, NULL),
(23, 25, 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobseducation`
--

CREATE TABLE `tbljobseducation` (
  `jeduc_id` int(11) NOT NULL,
  `jeduc_jobId` int(11) NOT NULL,
  `jeduc_text` text NOT NULL,
  `jeduc_categoryId` int(11) NOT NULL,
  `jeduc_points` int(50) NOT NULL,
  `jeduc_hrId` int(11) DEFAULT NULL,
  `jeduc_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobseducation`
--

INSERT INTO `tbljobseducation` (`jeduc_id`, `jeduc_jobId`, `jeduc_text`, `jeduc_categoryId`, `jeduc_points`, `jeduc_hrId`, `jeduc_datetime`) VALUES
(1, 1, '', 2, 20, NULL, NULL),
(5, 15, '', 19, 100, NULL, NULL),
(6, 16, '', 1, 10, NULL, NULL),
(7, 14, '', 1, 10, NULL, NULL),
(8, 14, '', 18, 10, NULL, NULL),
(9, 3, '', 1, 20, NULL, NULL),
(10, 13, '', 18, 20, NULL, NULL),
(11, 12, '', 2, 20, NULL, NULL),
(12, 12, '', 1, 10, NULL, NULL),
(13, 10, '', 2, 10, NULL, NULL),
(14, 10, '', 18, 10, NULL, NULL),
(15, 6, '', 2, 10, NULL, NULL),
(16, 6, '', 18, 10, NULL, NULL),
(17, 17, '', 1, 20, NULL, NULL),
(18, 18, '', 2, 20, NULL, NULL),
(19, 19, '', 2, 20, NULL, NULL),
(20, 20, '', 1, 20, NULL, NULL),
(21, 20, '', 2, 20, NULL, NULL),
(22, 20, '', 4, 20, NULL, NULL),
(23, 21, '', 4, 20, NULL, NULL),
(24, 22, '', 2, 20, NULL, NULL),
(25, 23, '', 1, 30, NULL, NULL),
(26, 24, '', 2, 30, NULL, NULL),
(27, 25, '', 1, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsknowledge`
--

CREATE TABLE `tbljobsknowledge` (
  `jknow_id` int(11) NOT NULL,
  `jknow_jobId` int(11) NOT NULL,
  `jknow_text` text NOT NULL,
  `jknow_knowledgeId` int(11) NOT NULL,
  `jknow_points` int(11) NOT NULL,
  `jknow_hrId` int(11) DEFAULT NULL,
  `jknow_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsknowledge`
--

INSERT INTO `tbljobsknowledge` (`jknow_id`, `jknow_jobId`, `jknow_text`, `jknow_knowledgeId`, `jknow_points`, `jknow_hrId`, `jknow_datetime`) VALUES
(9, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo. Project Manager', 1, 100, NULL, NULL),
(11, 12, '', 1, 10, NULL, NULL),
(15, 15, '', 7, 100, NULL, NULL),
(16, 16, '', 8, 10, NULL, NULL),
(17, 14, '', 5, 10, NULL, NULL),
(18, 1, '', 4, 10, NULL, NULL),
(19, 3, '', 12, 10, NULL, NULL),
(20, 13, '', 13, 10, NULL, NULL),
(21, 10, '', 14, 10, NULL, NULL),
(22, 10, '', 15, 10, NULL, NULL),
(23, 6, '', 1, 10, NULL, NULL),
(24, 17, '', 1, 10, NULL, NULL),
(25, 18, '', 8, 10, NULL, NULL),
(26, 18, '', 2, 10, NULL, NULL),
(27, 19, '', 17, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobslicense`
--

CREATE TABLE `tbljobslicense` (
  `jlicense_id` int(11) NOT NULL,
  `jlicense_licenceMId` int(11) NOT NULL,
  `jlicense_jobId` int(11) NOT NULL,
  `jlicense_points` int(11) NOT NULL,
  `jlicense_hrId` int(11) DEFAULT NULL,
  `jlicense_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobslicense`
--

INSERT INTO `tbljobslicense` (`jlicense_id`, `jlicense_licenceMId`, `jlicense_jobId`, `jlicense_points`, `jlicense_hrId`, `jlicense_datetime`) VALUES
(2, 9, 1, 50, NULL, NULL),
(3, 9, 22, 10, NULL, NULL),
(4, 1, 23, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsmaster`
--

CREATE TABLE `tbljobsmaster` (
  `jobM_id` int(20) NOT NULL,
  `jobM_title` varchar(250) NOT NULL,
  `jobM_description` text NOT NULL,
  `jobM_createdAt` datetime DEFAULT NULL,
  `jobM_status` tinyint(1) NOT NULL,
  `jobM_passpercentage` int(11) NOT NULL,
  `jobM_hrId` int(11) DEFAULT NULL,
  `jobM_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsmaster`
--

INSERT INTO `tbljobsmaster` (`jobM_id`, `jobM_title`, `jobM_description`, `jobM_createdAt`, `jobM_status`, `jobM_passpercentage`, `jobM_hrId`, `jobM_datetime`) VALUES
(1, 'Livestock Production Supervisor', 'A Livestock Supervisor oversees daily operations on farms that raise animals for consumption or product use. They manage feeding, health care, and humane treatment of livestock, supervise farm workers, and prepare reports on production and management. Additionally, they coordinate breeding, monitor animal health, and ensure compliance with regulations. If you’re interested in related roles, Livestock Production Managers oversee farm operations for milk, meat, wool, and other products, focusing on safety and yield optimization. ', '2024-08-06 08:48:22', 1, 60, NULL, NULL),
(3, 'Marketing Intern', 'The Marketing Intern will play an integral role in supporting the marketing team by assisting with a wide range of tasks including content creation, market research, social media management, and campaign analysis. This position is ideal for a motivated, creative, and detail-oriented individual looking to gain hands-on experience in a fast-paced marketing environment. The intern will have the opportunity to work closely with experienced marketing professionals, learn new skills, and contribute to real-world marketing projects that help drive business growth.', '2024-08-08 01:48:52', 1, 60, NULL, NULL),
(4, 'Commercial Capability Development Intern', '', '2024-08-12 18:49:03', 0, 0, NULL, NULL),
(5, 'Production Shift Supervisor (Tetra Line)', '', '2024-08-15 07:49:19', 0, 0, NULL, NULL),
(6, 'Quality Assurance (QA) Analyst', 'The Quality Assurance (QA) Analyst is responsible for ensuring the delivery of high-quality software by conducting thorough testing at various stages of the software development lifecycle. This includes writing test cases, performing manual and automated testing, and identifying defects to improve the overall software quality. The QA Analyst works closely with developers, product managers, and other stakeholders to ensure that the software meets both functional and performance requirements. The ideal candidate will be detail-oriented, proficient in testing tools, and committed to delivering reliable, secure, and user-friendly software products. The QA Analyst will also contribute to improving processes and methodologies to enhance the quality assurance process across projects.', '2024-08-16 09:49:28', 0, 0, NULL, NULL),
(8, 'Kunwari Job title', 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', '2024-08-23 08:49:55', 0, 0, NULL, NULL),
(9, 'Kunwari Job title', 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', '2024-08-23 10:50:05', 0, 0, NULL, NULL),
(10, 'Software Developer', 'The Software Developer is responsible for creating, testing, and maintaining software applications in a collaborative environment. The role involves developing new features and functionality, troubleshooting issues, and optimizing existing software for better performance. The ideal candidate will have strong programming skills, experience with various software development tools and methodologies, and a passion for delivering high-quality software. This position requires working with cross-functional teams to ensure alignment on project requirements and goals, contributing to both front-end and back-end development as needed. The Software Developer should be proactive, detail-oriented, and eager to stay up-to-date with the latest technology trends.', '2024-08-24 10:50:15', 1, 60, NULL, NULL),
(11, 'Janitor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vehicula dui gravida ligula fringilla, sed scelerisque mi placerat. Sed in feugiat elit. Donec sed lorem viverra, pharetra risus id, congue tortor. Proin aliquet risus sed neque imperdiet feugiat. Curabitur blandit mattis odio lacinia sollicitudin. Curabitur tempor risus quis sem bibendum aliquet. Integer vel nulla vel risus euismod molestie et sit amet tortor. Sed lacinia, felis id ullamcorper condimentum, odio enim posuere nisi, vitae faucibus nisi libero vel risus. Suspendisse malesuada enim eget nulla mollis, eu tempor quam cursus. Maecenas blandit luctus turpis, et venenatis nulla aliquam eget. In in lectus blandit, eleifend diam in, vehicula nibh.', '2024-09-12 09:30:22', 0, 60, NULL, NULL),
(12, 'Project Manager', 'The Project Manager is responsible for leading and managing projects from initiation through to completion, ensuring that each project is completed on time, within scope, and on budget. This role involves coordinating cross-functional teams, managing resources, and monitoring project progress while addressing risks, issues, and changes. The Project Manager will also act as the primary point of contact for clients and stakeholders, ensuring alignment with project goals and business objectives. The ideal candidate will have strong leadership, communication, and problem-solving skills, along with experience managing complex projects in a dynamic environment. This position is suited for a proactive, results-oriented individual who thrives in fast-paced settings and enjoys working with diverse teams to deliver successful project outcomes.', '2024-10-19 07:20:28', 1, 60, NULL, NULL),
(13, 'Data Analyst', 'The Data Analyst will be responsible for analyzing large volumes of data to uncover meaningful insights that drive business decisions. This role requires expertise in data collection, statistical analysis, and data visualization, as well as the ability to present complex data in an understandable way. The Data Analyst will work closely with stakeholders across various departments to support data-driven decision-making and improve operational efficiency. The ideal candidate will possess strong analytical skills, proficiency in tools like Excel, SQL, and Tableau, and have the ability to work independently while collaborating effectively with teams. This position is well-suited for someone who is passionate about data, problem-solving, and delivering actionable business insights.', '2024-10-19 09:03:47', 1, 60, NULL, NULL),
(14, 'Executive Secretary', 'An Executive Secretary plays a vital role in ensuring the smooth functioning of an organization by providing high-level administrative support to executives or departments. This position requires exceptional organizational, communication, and multitasking skills to manage schedules, handle correspondence, prepare reports, and maintain confidential records. The Executive Secretary acts as a central point of coordination, liaising with internal teams and external stakeholders to facilitate efficient workflow. With a keen attention to detail and a proactive approach, they contribute to the overall productivity and professionalism of the organization. The ideal candidate thrives in fast-paced environments and demonstrates discretion, adaptability, and a commitment to excellence.', '2024-10-24 07:35:07', 1, 60, NULL, NULL),
(15, 'Cashier', 'cashierr', '2024-10-24 08:25:52', 0, 55, NULL, NULL),
(16, 'Test job', 'Test jobTest jobTest jobTest jobTest jobTest jobTest jobTest job', '2024-12-03 01:36:47', 0, 60, NULL, NULL),
(17, 'Business Analyst', 'The Human Resources Manager is responsible for overseeing all HR functions, including recruiting, employee development, performance management, and compliance with labor laws. This role is key to ensuring a positive and productive work environment by managing relationships with employees, fostering engagement, and ensuring organizational objectives are met. The HR Manager works closely with leadership teams to align HR strategies with business goals and helps build a strong corporate culture.\n\n', '2025-01-08 06:46:00', 1, 60, NULL, NULL),
(18, 'Test Engineer', 'The Test Engineer is responsible for ensuring the quality of software applications by designing and executing comprehensive test plans, identifying defects, and verifying bug fixes. This position involves manual and automated testing to ensure that the software functions correctly and meets user requirements. The Test Engineer will work closely with developers and other stakeholders to define test strategies, provide feedback on code quality, and ensure timely delivery of high-quality software products. The ideal candidate will have strong testing skills, familiarity with automation tools, and the ability to troubleshoot complex issues. The Test Engineer plays a key role in improving software quality, optimizing testing processes, and ensuring that software releases meet industry standards and organizational goals.', '2025-01-09 11:30:55', 0, 0, NULL, NULL),
(19, 'Production Supervisor', 'The Production Supervisor is responsible for overseeing and coordinating the daily operations of a production team to ensure that manufacturing processes run smoothly, efficiently, and meet quality standards. This role involves supervising production staff, monitoring production output, and implementing strategies to optimize productivity and minimize costs. The Production Supervisor plays a crucial role in maintaining a safe work environment, ensuring product quality, and meeting production targets.', '2025-03-11 02:26:43', 1, 60, NULL, NULL),
(20, 'Talent Management Specialist', 'Administer the organization\'s talent development strategies. This role involves designing, implementing, and evaluating comprehensive learning and development programs, and fostering a culture of continuous learning. By aligning talent development initiatives with the organization\'s strategic goals, the Talent Development Supervisor ensures a high-performing and capable workforce, ultimately driving organizational success and growth.', '2025-06-01 04:28:23', 1, 60, NULL, NULL),
(21, 'Driver', 'We are seeking a reliable and experienced Driver to transport goods and/or passengers in a safe and timely manner. The ideal candidate will have excellent driving skills, a strong sense of responsibility, and a clean driving record. You will be expected to maintain the vehicle in good condition, follow traffic laws, and provide outstanding service during each trip.', '2025-06-26 10:33:02', 1, 60, NULL, NULL),
(22, 'Project Engineering Supervisor for Civil Works', 'Supervise the conceptualization, design, implementation, coordination, and audit of cannery civil engineering works related to capital projects. Supervise other civil engineering related works in the cannery.', '2025-07-04 12:17:59', 1, 60, NULL, NULL),
(23, 'Finance Analyst, International Processed Business', 'Provide accurate and timely financial information based on actual results and/or financial projections for total Internation Processed Business worldwide, and specifically for Del Monte Brands, to allow well-calculated and effective decision making, highlighting opportunities and risks towards achievement of targets for branded exports processed business both under DMPL and DMPI entities.', '2025-07-19 12:37:24', 1, 60, NULL, NULL),
(24, 'Supply Planning Supervisor', 'To provide management relevant information related to pineapple pack planning, supply and demand, shipment trends, monthly production, shipment plan, ending inventories, and recovery estimates.', '2025-07-24 10:32:04', 1, 60, NULL, NULL),
(25, 'Strategic Sourcing Supervisor', 'Serve all Raw Material requirements for Manufacturing Operations at the best price and terms, right quality and quantity, and timely delivery through negotiation and coordination with qualified suppliers and concerned departments within the organization.', '2025-07-24 02:24:30', 1, 40, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsmasterduties`
--

CREATE TABLE `tbljobsmasterduties` (
  `duties_id` int(11) NOT NULL,
  `duties_jobId` int(11) NOT NULL,
  `duties_text` text NOT NULL,
  `duties_hrId` int(11) DEFAULT NULL,
  `duties_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsmasterduties`
--

INSERT INTO `tbljobsmasterduties` (`duties_id`, `duties_jobId`, `duties_text`, `duties_hrId`, `duties_datetime`) VALUES
(1, 1, 'Daily Operations: Managing the daily operations of the livestock farm, including feeding and health care of animals.', NULL, NULL),
(2, 1, 'Health Monitoring: Inspecting livestock for signs of illness, injury, or unusual behavior and notifying veterinarians or veterinary technicians of any issues.', NULL, NULL),
(3, 1, 'Humane Treatment: Ensuring all animals are treated humanely and in accordance with government regulations.', NULL, NULL),
(4, 8, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', NULL, NULL),
(5, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.', NULL, NULL),
(6, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.', NULL, NULL),
(7, 9, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', NULL, NULL),
(8, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.', NULL, NULL),
(9, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.', NULL, NULL),
(10, 10, 'Develop, test, and maintain software applications and systems based on user requirements and specifications.', NULL, NULL),
(11, 10, 'Write clean, efficient, and well-documented code using best practices.', NULL, NULL),
(12, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vehicula dui gravida ligula fringilla, sed scelerisque mi placerat. Sed in feugiat elit. Donec sed lorem viverra, pharetra risus id, congue tortor. Proin aliquet risus sed neque imperdiet feugiat. Curabitur blandit mattis odio lacinia sollicitudin. Curabitur tempor risus quis sem bibendum aliquet. Integer vel nulla vel risus euismod molestie et sit amet tortor. Sed lacinia, felis id ullamcorper condimentum, odio enim posuere nisi, vitae faucibus nisi libero vel risus. Suspendisse malesuada enim eget nulla mollis, eu tempor quam cursus. Maecenas blandit luctus turpis, et venenatis nulla aliquam eget. In in lectus blandit, eleifend diam in, vehicula nibh.', NULL, NULL),
(13, 11, 'Ut nec enim et nisl suscipit dignissim. Nulla odio sem, commodo eget dictum ac, consectetur ac neque. Pellentesque fringilla sed neque vitae bibendum. Fusce vel nibh eu arcu iaculis vulputate mattis eleifend nulla. Nullam libero elit, sodales sed enim a, ullamcorper tincidunt urna. Proin ac commodo tortor, sit amet congue nisi. Maecenas bibendum nunc quis feugiat bibendum. Aenean egestas vulputate nisi eget dictum.', NULL, NULL),
(15, 11, 'Hello', NULL, NULL),
(16, 12, 'Lead and manage projects from inception to completion, ensuring they are delivered on time, within scope, and on budget.', NULL, NULL),
(17, 13, 'Collect, clean, and organize data from various sources to ensure accuracy and consistency.', NULL, NULL),
(18, 14, 'As a Secretary, you will be responsible for managing day-to-day administrative tasks, including organizing schedules, handling correspondence, preparing reports, and maintaining accurate records. You will serve as a key point of communication between departments, ensuring efficient workflow and adherence to organizational protocols. Additionally, you will support management by coordinating meetings, taking minutes, and overseeing office operations to maintain productivity and professionalism. A strong focus on confidentiality, attention to detail, and time management is essential to excel in this role.', NULL, NULL),
(19, 15, 'Cashiering system\n', NULL, NULL),
(20, 16, 'Test jobTest jobTest jobTest jobTest jobTest job', NULL, NULL),
(21, 3, 'Assist in the development and implementation of marketing strategies and campaigns.\n', NULL, NULL),
(22, 3, 'Conduct market research to identify trends, customer preferences, and competitive analysis.\n', NULL, NULL),
(23, 3, 'Create content for digital platforms, including social media, blogs, and newsletters.\n', NULL, NULL),
(24, 3, 'Help maintain and update the company’s website and social media profiles.\n', NULL, NULL),
(25, 3, 'Coordinate marketing events, webinars, and other promotional activities.\n', NULL, NULL),
(26, 13, 'Analyze large datasets to identify trends, patterns, and insights that can help in decision-making.\n', NULL, NULL),
(27, 13, 'Develop reports and dashboards using data visualization tools such as Tableau, Power BI, or Excel.\n', NULL, NULL),
(28, 12, 'Define project scope, objectives, and deliverables, and ensure alignment with the overall business goals.\n', NULL, NULL),
(29, 12, 'Develop detailed project plans, including timelines, milestones, and resource allocation.\n', NULL, NULL),
(30, 12, 'Coordinate with cross-functional teams to ensure effective communication and project execution.\n', NULL, NULL),
(31, 12, 'Monitor and report on project progress, adjusting plans and resources as needed to stay on track.\n', NULL, NULL),
(32, 12, 'Manage client and stakeholder expectations, providing regular updates and addressing any concerns or changes.\n', NULL, NULL),
(33, 10, 'Collaborate with cross-functional teams, including project managers, designers, and quality assurance, to build software solutions.\n', NULL, NULL),
(34, 10, 'Design and implement software features and functionality while optimizing for performance and scalability.\n', NULL, NULL),
(35, 10, 'Maintain and update existing software systems to improve functionality, fix issues, and adapt to changing business needs.\n', NULL, NULL),
(36, 6, 'Develop and execute test plans, test cases, and test scripts to validate software applications and systems.\n', NULL, NULL),
(37, 6, 'Perform manual and automated testing to ensure the software meets functional and non-functional requirements.\n', NULL, NULL),
(38, 6, 'Identify, document, and report software defects and inconsistencies using defect tracking tools.\n', NULL, NULL),
(39, 6, 'Collaborate with developers, project managers, and product owners to understand application requirements and design testing strategies.\n', NULL, NULL),
(40, 6, 'Review and analyze user stories, use cases, and requirements to ensure thorough test coverage.\n', NULL, NULL),
(41, 17, 'Manage recruitment and staffing processes to ensure the company attracts top talent.\n', NULL, NULL),
(42, 17, 'Oversee employee onboarding, training, and development programs.\n', NULL, NULL),
(43, 17, 'Manage employee relations, addressing concerns and ensuring a positive work environment.\n', NULL, NULL),
(44, 17, 'Develop and enforce company policies, ensuring legal compliance with employment laws.\n', NULL, NULL),
(45, 17, 'Handle performance management processes, including appraisals, feedback, and conflict resolution.\n', NULL, NULL),
(46, 18, 'Design, implement, and execute comprehensive test plans and test cases to ensure the quality of software applications.\n', NULL, NULL),
(47, 19, 'Supervise and coordinate the activities of production workers.', NULL, NULL),
(48, 19, 'Assign production tasks and ensure they are completed on time and to the required standards.', NULL, NULL),
(49, 19, 'Monitor production output and identify areas for improvement.', NULL, NULL),
(50, 19, 'Implement strategies to improve productivity, reduce waste, and minimize costs.', NULL, NULL),
(51, 20, 'Diagnose and analyze the learning and development needs of the key stakeholders necessary in identifying the right solutions that will address performance/competency gaps.', NULL, NULL),
(52, 20, 'Design and develop learning solutions based on analysis to deliver and implement appropriate programs that drive development to bridge the identified performance/competency gaps.', NULL, NULL),
(53, 20, 'Deliver learning and development interventions to address employee learning and development needs.', NULL, NULL),
(54, 20, 'Evaluate training to measure and ensure training effectiveness.\nAdminister Corporate Training and Development programs and activities to optimize resource allocation and team efficiency.', NULL, NULL),
(55, 21, 'Operate assigned vehicle safely and responsibly, adhering to all traffic laws and regulations.', NULL, NULL),
(56, 21, 'Transport goods, materials, or passengers to designated locations on time.', NULL, NULL),
(57, 21, 'Keep accurate records of deliveries, mileage, fuel usage, and any incidents.', NULL, NULL),
(58, 21, 'Inspect vehicle regularly for mechanical items and safety issues and perform preventative maintenance as needed.', NULL, NULL),
(59, 22, 'Develop concept and design for the civil works aspect of capital projects.\n', NULL, NULL),
(60, 22, 'Coordinate with the other engineering disciplines in the development of the concept and design of civil works\n', NULL, NULL),
(61, 22, 'Coordinate with department end-user on the concept and design for the civil works\n', NULL, NULL),
(62, 22, 'Facilitate the preparation of detailed CAD construction drawings\n', NULL, NULL),
(63, 22, 'Implement civil works aspect of capital projects within scope of works, allocated budget, and schedule.\n', NULL, NULL),
(64, 23, 'Proactively report on financial performance of the Processed Business highlighting opportunities and risks towards achievement of the team\'s targets.', NULL, NULL),
(65, 23, 'Ensure timely and accurate reporting of business results to management.\n', NULL, NULL),
(66, 23, 'Handle the completion of the regular forecasting exercises in accordance with the targets, covering subsidiaries/entities under DMPL.\n', NULL, NULL),
(67, 23, 'Provide decision making support to the Commercial Team for key initiatives (eg. pricing sensitivities, income optimization, A&P spending updates, etc.) to achieve financial objectives of the group.\n', NULL, NULL),
(68, 23, 'Provide assistance to the commercial team and other support teams to achieve the operational and financial objectives of the team.\n', NULL, NULL),
(69, 24, 'Generate the Customer Service Availability Report (CSAR) for pineapple products', NULL, NULL),
(70, 24, 'Generate the Pineapple Supply & Demand Status', NULL, NULL),
(71, 24, 'Provide materials for the Monthly Supply Review, Monthly Business Review and Board Meetings', NULL, NULL),
(72, 25, 'Negotiations and strategic sourcing in order to achieve the target of at least 5% positive variance versus AOP, handling a total year materials budget of P 75 MM.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsskills`
--

CREATE TABLE `tbljobsskills` (
  `jskills_id` int(11) NOT NULL,
  `jskills_jobId` int(11) NOT NULL,
  `jskills_text` text NOT NULL,
  `jskills_points` int(11) NOT NULL,
  `jskills_hrId` int(11) DEFAULT NULL,
  `jskills_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsskills`
--

INSERT INTO `tbljobsskills` (`jskills_id`, `jskills_jobId`, `jskills_text`, `jskills_points`, `jskills_hrId`, `jskills_datetime`) VALUES
(3, 15, '', 100, NULL, NULL),
(4, 16, '', 50, NULL, NULL),
(8, 1, '', 10, NULL, NULL),
(9, 1, '', 10, NULL, NULL),
(10, 1, '', 10, NULL, NULL),
(11, 3, '', 10, NULL, NULL),
(13, 3, '', 10, NULL, NULL),
(14, 3, '', 10, NULL, NULL),
(15, 13, 'A strong analytical mindset allows Data Analysis to deconstruct complex problems and identify key trends within datasets, eLearning and AI courseware.', 10, NULL, NULL),
(16, 13, 'Proficiency in data manipulation tools like SQL and Python is crucial for efficiently extracting, cleaning, and transforming raw data into usable formats.', 10, NULL, NULL),
(17, 13, 'The ability to effectively communicate insights through compelling data visualizations and clear narratives ensures that findings drive informed business decisions.', 10, NULL, NULL),
(18, 12, '', 10, NULL, NULL),
(19, 12, '', 10, NULL, NULL),
(20, 12, '', 10, NULL, NULL),
(21, 10, 'Deep understanding of language-specific frameworks and libraries (e.g., React, Angular, Spring Boot, Django, .NET).', 10, NULL, NULL),
(22, 10, 'Experience with different methodologies like Agile, Scrum, Kanban, and Waterfall.', 10, NULL, NULL),
(24, 6, '', 10, NULL, NULL),
(25, 6, '', 10, NULL, NULL),
(26, 6, '', 10, NULL, NULL),
(27, 17, '', 10, NULL, NULL),
(28, 17, '', 10, NULL, NULL),
(29, 17, '', 10, NULL, NULL),
(30, 18, '', 10, NULL, NULL),
(31, 18, '', 20, NULL, NULL),
(32, 19, 'Technology Skills - Microsoft Office, understanding of multimedia programs, tools, eLearning and AI courseware.', 10, NULL, NULL),
(33, 19, 'Product Manager', 10, NULL, NULL),
(34, 19, 'Monitoring production', 10, NULL, NULL),
(35, 20, 'Technology Skills - Microsoft Office, understanding of multimedia programs, tools, eLearning and AI courseware.', 10, NULL, NULL),
(36, 21, 'Safe Driving Skills', 10, NULL, NULL),
(37, 21, 'Navigation and Route Planning', 10, NULL, NULL),
(38, 21, 'Vehicle Maintenance Knowledge', 10, NULL, NULL),
(39, 14, 'Office administration', 10, NULL, NULL),
(40, 14, 'Calendar and schedule management', 10, NULL, NULL),
(41, 14, 'Meeting planning and coordination', 10, NULL, NULL),
(42, 22, 'Civil Engineering Design – Proficiency in structural design, layout planning, and construction detailing.', 10, NULL, NULL),
(43, 22, 'Project Management – Experience managing multiple capital projects from concept to completion.', 10, NULL, NULL),
(44, 22, 'Construction Supervision – Strong background in supervising site activities and contractors.', 10, NULL, NULL),
(45, 22, 'Engineering Audit & Compliance – Conducting inspections, audits, and ensuring compliance with safety and quality standards.', 10, NULL, NULL),
(46, 23, 'MS Office Applications.', 10, NULL, NULL),
(47, 23, 'SAP an advantage.', 10, NULL, NULL),
(48, 24, 'Coordinates with Export Sales with regards to supply diversions and reallocations according to market’s requirement/specifications.', 10, NULL, NULL),
(49, 24, 'Compute for long range tonnage requirement', 10, NULL, NULL),
(50, 24, 'Production Planning', 10, NULL, NULL),
(51, 25, 'Sourcing and accreditation of qualified suppliers to serve requirements for materials intended for new product developments.', 10, NULL, NULL),
(52, 25, 'Procurement Information Systems - Delivery tracking reports and other critical database must be readily available.', 10, NULL, NULL),
(53, 25, 'Timely and periodic cascade of SQMP reports to suppliers', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobstrainings`
--

CREATE TABLE `tbljobstrainings` (
  `jtrng_id` int(11) NOT NULL,
  `jtrng_jobId` int(11) NOT NULL,
  `jtrng_text` text NOT NULL,
  `jtrng_points` int(11) NOT NULL,
  `jtrng_hrId` int(11) DEFAULT NULL,
  `jtrng_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobstrainings`
--

INSERT INTO `tbljobstrainings` (`jtrng_id`, `jtrng_jobId`, `jtrng_text`, `jtrng_points`, `jtrng_hrId`, `jtrng_datetime`) VALUES
(14, 15, '', 100, NULL, NULL),
(15, 16, '', 20, NULL, NULL),
(16, 14, '', 20, NULL, NULL),
(17, 1, '', 10, NULL, NULL),
(18, 1, '', 10, NULL, NULL),
(19, 3, '', 10, NULL, NULL),
(20, 13, 'Advanced SQL for Data Analysis: Focus on complex queries, performance optimization, and specific database functionalities.', 20, NULL, NULL),
(21, 12, '', 20, NULL, NULL),
(22, 10, 'Advanced SQL & Database Management', 10, NULL, NULL),
(23, 10, 'Statistical Analysis & Business Analytics', 10, NULL, NULL),
(24, 6, '', 20, NULL, NULL),
(25, 17, '', 20, NULL, NULL),
(26, 18, '', 20, NULL, NULL),
(27, 19, 'Supervising an Events', 10, NULL, NULL),
(28, 19, 'Team leadership', 10, NULL, NULL),
(29, 21, 'Defensive Driving Techniques', 10, NULL, NULL),
(30, 21, 'Cargo Handling and Safety (for Delivery/Truck Drivers)', 10, NULL, NULL),
(31, 22, 'AutoCAD Civil 3D / Revit Structure – for civil design and documentation', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsworkexperience`
--

CREATE TABLE `tbljobsworkexperience` (
  `jwork_id` int(11) NOT NULL,
  `jwork_jobId` int(11) NOT NULL,
  `jwork_duration` text NOT NULL,
  `jwork_responsibilities` text NOT NULL,
  `jwork_points` int(11) NOT NULL,
  `jwork_hrId` int(11) DEFAULT NULL,
  `jwork_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsworkexperience`
--

INSERT INTO `tbljobsworkexperience` (`jwork_id`, `jwork_jobId`, `jwork_duration`, `jwork_responsibilities`, `jwork_points`, `jwork_hrId`, `jwork_datetime`) VALUES
(1, 1, '3', ' supervisor role in a Tetra Manufacturing Line.', 20, NULL, NULL),
(2, 8, '2', 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 0, NULL, NULL),
(3, 9, '2', 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 0, NULL, NULL),
(4, 10, '3', 'software development, working on web applications, mobile applications, or enterprise software.', 20, NULL, NULL),
(5, 11, '1', 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Project Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.\nJanitor manager', 100, NULL, NULL),
(8, 15, '3', 'Cashier', 100, NULL, NULL),
(9, 16, '2', 'Test jobTest jobTest jobTest job ', 10, NULL, NULL),
(10, 14, '2', 'secretarial, administrative, or office assistant role.', 20, NULL, NULL),
(11, 3, '1', 'marketing, communications, or related fields, including internships or part-time roles.', 20, NULL, NULL),
(12, 13, '2', 'data analysis, business analysis, or a related field.', 20, NULL, NULL),
(13, 12, '3', 'project management, with a proven track record of delivering projects on time and within budget.', 10, NULL, NULL),
(15, 6, '2', 'software testing, quality assurance, or a related field.', 20, NULL, NULL),
(16, 17, '5', 'human resources or management roles, with a focus on employee relations, recruitment, and talent management.', 20, NULL, NULL),
(17, 18, '2', 'a testing or QA role, with a focus on software application testing.', 10, NULL, NULL),
(18, 19, '3', 'a production environment, with supervisory experience preferred.', 20, NULL, NULL),
(19, 20, '2', 'Instructional Systems Design (ISD) and courseware development, multimedia based training.', 15, NULL, NULL),
(20, 20, '3', 'Experience with Learning Management Systems, Learning Content Management Systems, industry standards, and accessibility compliance standards.', 10, NULL, NULL),
(21, 21, '3', 'Light vehicle (cars/vans), Medium/heavy trucks', 30, NULL, NULL),
(22, 22, '5', 'commercial and industrial building design, structural design and analysis, project cost estimation, and project scheduling.', 10, NULL, NULL),
(23, 22, '5', 'project implementation.', 10, NULL, NULL),
(24, 23, '2', 'Finance Background', 30, NULL, NULL),
(25, 24, '2', 'production planning, supply planning, forecasting, or other related experience.', 40, NULL, NULL),
(26, 25, '3', 'procurement an advantage.', 40, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblknown_devices`
--

CREATE TABLE `tblknown_devices` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `device` varchar(50) NOT NULL,
  `first_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblknown_locations`
--

CREATE TABLE `tblknown_locations` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `first_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbllicensemaster`
--

CREATE TABLE `tbllicensemaster` (
  `license_master_id` int(11) NOT NULL,
  `license_master_name` varchar(100) NOT NULL,
  `license_master_typeId` int(11) NOT NULL,
  `license_master_hrId` int(11) DEFAULT NULL,
  `license_master_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllicensemaster`
--

INSERT INTO `tbllicensemaster` (`license_master_id`, `license_master_name`, `license_master_typeId`, `license_master_hrId`, `license_master_datetime`) VALUES
(1, 'Accountancy', 1, NULL, NULL),
(2, 'Aeronautical Engineering\r\n', 1, NULL, NULL),
(3, 'Agricultural Engineering\r\n', 1, NULL, NULL),
(4, 'Agricultural and Biosystems Engineering\r\n', 1, NULL, NULL),
(5, 'Agriculture', 1, NULL, NULL),
(6, 'Architecture', 1, NULL, NULL),
(7, 'Chemical Engineering\r\n', 1, NULL, NULL),
(8, 'Chemistry', 1, NULL, NULL),
(9, 'Civil Engineering\r\n', 1, NULL, NULL),
(10, 'Criminology', 1, NULL, NULL),
(11, 'Customs Brokers\r\n', 1, NULL, NULL),
(12, 'Dentistry', 1, NULL, NULL),
(13, 'Electronics Engineering\r\n', 1, NULL, NULL),
(14, 'Electrical Engineering\r\n', 1, NULL, NULL),
(15, 'Environmental Planning\r\n', 1, NULL, NULL),
(16, 'Fisheries Technology\r\n', 1, NULL, NULL),
(17, 'Forestry', 1, NULL, NULL),
(18, 'Geodetic Engineering\r\n', 1, NULL, NULL),
(19, 'Geology\r\n', 1, NULL, NULL),
(20, 'Guidance and Counseling\r\n', 1, NULL, NULL),
(21, 'Interior Design\r\n', 1, NULL, NULL),
(22, 'Landscape Architecture\r\n', 1, NULL, NULL),
(23, 'Librarianship\r\n', 1, NULL, NULL),
(24, 'Marine Deck and Marine Engineer Officers\r\n', 1, NULL, NULL),
(25, 'Mechanical Engineering\r\n', 1, NULL, NULL),
(26, 'Medical Technology\r\n', 1, NULL, NULL),
(27, 'Medicine', 1, NULL, NULL),
(28, 'Midwifery', 1, NULL, NULL),
(29, 'Mining Engineering\r\n', 1, NULL, NULL),
(30, 'Naval Architecture\r\n', 1, NULL, NULL),
(31, 'Nursing\r\n', 1, NULL, NULL),
(32, 'Nutrition and Dietetics\r\n', 1, NULL, NULL),
(33, 'Occupational Therapy\r\n', 1, NULL, NULL),
(34, 'Optometry\r\n', 1, NULL, NULL),
(35, 'Pharmacy', 1, NULL, NULL),
(36, 'Physical Therapy\r\n', 1, NULL, NULL),
(37, 'Professional Teachers\r\n', 1, NULL, NULL),
(38, 'Psychology', 1, NULL, NULL),
(39, 'Radiologic Technology\r\n', 1, NULL, NULL),
(40, 'Real Estate Service\r\n', 1, NULL, NULL),
(41, 'Respiratory Therapy\r\n', 1, NULL, NULL),
(42, 'Sanitary Engineering\r\n', 1, NULL, NULL),
(43, 'Social Work\r\n', 1, NULL, NULL),
(44, 'Speech-Language Pathology\r\n', 1, NULL, NULL),
(45, 'Veterinary Medicine\r\n', 1, NULL, NULL),
(46, 'Driving', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbllicensetype`
--

CREATE TABLE `tbllicensetype` (
  `license_type_id` int(11) NOT NULL,
  `license_type_name` varchar(100) NOT NULL,
  `license_type_hrId` int(11) DEFAULT NULL,
  `license_type_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllicensetype`
--

INSERT INTO `tbllicensetype` (`license_type_id`, `license_type_name`, `license_type_hrId`, `license_type_datetime`) VALUES
(1, ' Professional Regulation Commission (PRC)', NULL, NULL),
(2, 'PRC', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblloginlogs`
--

CREATE TABLE `tblloginlogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_level` varchar(100) DEFAULT NULL,
  `method` enum('password','2fa','google') NOT NULL,
  `status` enum('success','failure','locked','2fa_required') NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(512) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblloginlogs`
--

INSERT INTO `tblloginlogs` (`id`, `email`, `user_id`, `user_level`, `method`, `status`, `ip_address`, `user_agent`, `reason`, `created_at`) VALUES
(1, 'ralphjangallegos@gmail.com', 1, 'HR Administrator', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:01:27'),
(2, 'ralphjanpelino@gmail.com', 40, 'Candidates', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:22:49'),
(3, 'ralphjangallegos@gmail.com', 1, 'HR Administrator', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:28:39'),
(4, 'ralp.pelino11@gmail.com', 24, 'Candidates', 'password', 'success', '::1', 'node', 'Password login successful', '2025-08-12 13:33:43'),
(5, 'rape.gallegos.coc@phinmaed.com', 39, 'Candidates', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:34:05'),
(6, 'ralphjangallegos@gmail.com', 1, 'HR Administrator', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:51:55'),
(7, 'ralphjanpelino@gmail.com', 40, 'Candidates', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-12 13:52:16'),
(8, 'ralphjanpelino@gmail.com', 40, 'Candidates', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-13 03:34:28'),
(9, 'ralphjangallegos@gmail.com', 1, 'HR Administrator', 'google', 'success', '::1', 'node', 'Google login successful', '2025-08-13 03:35:02'),
(10, 'ralp.pelino11@gmail.com', 24, 'Candidates', 'password', 'success', '::1', 'node', 'Password login successful', '2025-08-13 03:42:15'),
(11, 'ralp.pelino11@gmail.com', NULL, NULL, 'password', 'failure', '::1', 'node', 'Invalid credentials', '2025-08-13 03:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `tblmanagementapproval`
--

CREATE TABLE `tblmanagementapproval` (
  `approval_id` int(11) NOT NULL,
  `approval_medicalMId` int(11) NOT NULL,
  `approval_hrId` int(11) NOT NULL,
  `approval_createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblmanagementapprovalstatus`
--

CREATE TABLE `tblmanagementapprovalstatus` (
  `managementAS_id` int(11) NOT NULL,
  `managementAS_approveId` int(11) NOT NULL,
  `managementAS_approveSId` int(11) NOT NULL,
  `managementAS_hrId` int(11) NOT NULL,
  `managementAS_createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalclassification`
--

CREATE TABLE `tblmedicalclassification` (
  `medicalC_id` int(11) NOT NULL,
  `medicalC_type` varchar(100) NOT NULL,
  `medicalC_name` varchar(100) NOT NULL,
  `medicalC_hrId` int(11) DEFAULT NULL,
  `medicalC_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblmedicalclassification`
--

INSERT INTO `tblmedicalclassification` (`medicalC_id`, `medicalC_type`, `medicalC_name`, `medicalC_hrId`, `medicalC_datetime`) VALUES
(1, 'Class A', 'Physically Fit for Employment', 1, '2025-03-11 15:39:08'),
(2, 'Class B', 'Physically Fit with Minor Ailments', 1, '2025-03-11 15:39:08'),
(3, 'Class C1', 'Upgradeable to Class B After Treatment', 1, '2025-03-11 15:40:38'),
(4, 'Class C2', 'Hiring is Upon Company Discretion', 1, '2025-03-11 15:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalmaster`
--

CREATE TABLE `tblmedicalmaster` (
  `medicalM_id` int(11) NOT NULL,
  `medicalM_candId` int(11) NOT NULL,
  `medicalM_medicalCId` int(11) NOT NULL,
  `medicalM_jobMid` int(11) NOT NULL,
  `medicalM_datetime` datetime NOT NULL,
  `medicalM_hrId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblnotifications`
--

CREATE TABLE `tblnotifications` (
  `notification_id` int(11) NOT NULL,
  `notification_candId` int(11) DEFAULT NULL,
  `notification_appId` int(50) DEFAULT NULL,
  `notification_statusId` int(11) DEFAULT NULL,
  `notification_message` text DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL,
  `notification_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnotifications`
--

INSERT INTO `tblnotifications` (`notification_id`, `notification_candId`, `notification_appId`, `notification_statusId`, `notification_message`, `notification_date`, `notification_read`) VALUES
(1, 40, 1, 1, 'Your application status has been updated to \"Pending\".', '2025-08-04 15:15:47', 0),
(2, 40, 1, 2, 'Your application status has been updated to \"Processed\".', '2025-08-11 14:53:59', 0),
(3, 40, 1, 6, 'You have been scheduled for an interview on August 27, 2025 1:00 PM.', '2025-08-11 14:54:22', 0),
(4, 40, 1, 5, 'Your application status has been updated to \"Exam\".', '2025-08-11 14:54:34', 0),
(9, 40, 1, 9, 'Your application status has been updated to \"Failed Exam\".', '2025-08-11 15:17:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonalknowledge`
--

CREATE TABLE `tblpersonalknowledge` (
  `knowledge_id` int(11) NOT NULL,
  `knowledge_name` text NOT NULL,
  `knowledge_hrId` int(11) DEFAULT NULL,
  `knowledge_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpersonalknowledge`
--

INSERT INTO `tblpersonalknowledge` (`knowledge_id`, `knowledge_name`, `knowledge_hrId`, `knowledge_datetime`) VALUES
(1, 'Quality Management Practices (QMP)\r\n', NULL, NULL),
(2, 'Hazard Analysis and Critical Control Points (HACCP)\r\n', NULL, NULL),
(3, 'Good Manufacturing Practices (GMP)\r\n', NULL, NULL),
(4, 'Food Safety Management Systems (FSMS)', NULL, NULL),
(5, 'Organizing Events', NULL, NULL),
(6, 'Communication', NULL, NULL),
(7, 'Calculations', NULL, NULL),
(8, 'Analysis', NULL, NULL),
(9, 'Cyber Security', NULL, NULL),
(10, 'Hacking', NULL, NULL),
(11, 'English Speaking', NULL, NULL),
(12, 'Branding and Marketing Principles', NULL, NULL),
(13, 'Data Protection and Privacy Laws', NULL, NULL),
(14, 'Security Best Practices', NULL, NULL),
(15, 'Adherence to Coding Standards', NULL, NULL),
(16, 'Love life', NULL, NULL),
(17, 'Lean Manufacturing principles and   Six Sigma methodologies is a plus.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonalskills`
--

CREATE TABLE `tblpersonalskills` (
  `perS_id` int(20) NOT NULL,
  `perS_name` varchar(250) NOT NULL,
  `perS_hrId` int(11) DEFAULT NULL,
  `perS_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersonalskills`
--

INSERT INTO `tblpersonalskills` (`perS_id`, `perS_name`, `perS_hrId`, `perS_datetime`) VALUES
(1, 'Project management', NULL, NULL),
(2, 'Data analysis', NULL, NULL),
(3, 'Computer literacy', NULL, NULL),
(4, 'Organizational Skills', NULL, NULL),
(5, 'Technical Aptitude', NULL, NULL),
(6, 'Machine Learning', NULL, NULL),
(7, 'Leadership ', NULL, NULL),
(8, 'Data visualization', NULL, NULL),
(9, 'Presentation competency', NULL, NULL),
(10, 'Research expertise', NULL, NULL),
(22, 'Communication', NULL, NULL),
(24, 'Programming skills', NULL, NULL),
(25, 'Calculations', NULL, NULL),
(26, 'Observing', NULL, NULL),
(27, 'Hacking', NULL, NULL),
(29, 'Networking', NULL, NULL),
(33, 'Analysis', NULL, NULL),
(34, 'Linux', NULL, NULL),
(35, 'Designing UI', NULL, NULL),
(36, 'Problem Solving', NULL, NULL),
(37, 'Data Visualization Skills', NULL, NULL),
(38, 'Programming Languages', NULL, NULL),
(39, 'Database Management', NULL, NULL),
(40, 'Documentation', NULL, NULL),
(41, 'Bug Tracking Systems', NULL, NULL),
(45, 'Testing Tools	', NULL, NULL),
(47, 'Debugging', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonaltraining`
--

CREATE TABLE `tblpersonaltraining` (
  `perT_id` int(20) NOT NULL,
  `perT_name` varchar(250) NOT NULL,
  `perT_percentage` int(11) NOT NULL,
  `perT_hrId` int(11) DEFAULT NULL,
  `perT_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersonaltraining`
--

INSERT INTO `tblpersonaltraining` (`perT_id`, `perT_name`, `perT_percentage`, `perT_hrId`, `perT_datetime`) VALUES
(1, 'Human Resources Manager', 60, NULL, NULL),
(2, 'Event Coordinator', 60, NULL, NULL),
(3, 'Project Manager (Web Development)', 60, NULL, NULL),
(4, 'Sales Trainer', 60, NULL, NULL),
(5, 'Customer Support Trainer', 70, NULL, NULL),
(6, 'Software Testing and Quality Assurance Training', 80, NULL, NULL),
(7, 'Operations Trainer', 65, NULL, NULL),
(8, 'Sales and Marketing Trainer', 65, NULL, NULL),
(9, 'Retail Training Manager', 70, NULL, NULL),
(10, 'IT Trainer', 70, NULL, NULL),
(15, 'Cashiering Calculations', 60, NULL, NULL),
(16, 'Customer Service and Front Desk Training', 60, NULL, NULL),
(17, 'Supervisory and Leadership Training', 70, NULL, NULL),
(18, 'Farm Equipment and Technology Training', 70, NULL, NULL),
(19, 'Digital Marketing and Social Media Training', 70, NULL, NULL),
(20, 'Data Analysis and Statistical Methods Training', 65, NULL, NULL),
(21, 'Software Development Training', 70, NULL, NULL),
(22, 'Database Management and SQL Training', 70, NULL, NULL),
(23, 'HR Management and Compliance Training', 70, NULL, NULL),
(24, 'Lean Manufacturing Principles', 60, NULL, NULL),
(25, 'Quality Control Procedures', 60, NULL, NULL),
(26, 'BIM Coordinator', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstatus`
--

CREATE TABLE `tblstatus` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_hrId` int(11) DEFAULT NULL,
  `status_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblstatus`
--

INSERT INTO `tblstatus` (`status_id`, `status_name`, `status_hrId`, `status_datetime`) VALUES
(1, 'Pending', NULL, NULL),
(2, 'Processed', NULL, NULL),
(3, 'Accept', NULL, NULL),
(4, 'Decline Offer', NULL, NULL),
(5, 'Exam', NULL, NULL),
(6, 'Interview', NULL, NULL),
(7, 'Background Check', NULL, NULL),
(8, 'Job Offer', NULL, NULL),
(9, 'Failed Exam', NULL, NULL),
(10, 'Passed Exam', NULL, NULL),
(11, 'Employed', NULL, NULL),
(12, 'Cancelled', NULL, NULL),
(13, 'Decision Pending', NULL, NULL),
(14, 'Reapply', NULL, NULL),
(15, 'Positive', NULL, NULL),
(16, 'Negative', NULL, NULL),
(17, 'Medical Check', 1, '2025-03-11 15:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblstatusjoboffer`
--

CREATE TABLE `tblstatusjoboffer` (
  `statusjobO_id` int(11) NOT NULL,
  `statusjobO_jobofferId` int(11) NOT NULL,
  `statusjobO_statusId` int(11) NOT NULL,
  `statusjobO_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserlevel`
--

CREATE TABLE `tbluserlevel` (
  `userL_id` int(11) NOT NULL,
  `userL_level` decimal(4,1) NOT NULL,
  `UserL_description` varchar(255) DEFAULT NULL,
  `userL_hrId` int(11) DEFAULT NULL,
  `userL_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluserlevel`
--

INSERT INTO `tbluserlevel` (`userL_id`, `userL_level`, `UserL_description`, `userL_hrId`, `userL_datetime`) VALUES
(1, 1.0, 'Candidates', NULL, NULL),
(2, 100.0, 'HR Administrator', NULL, NULL),
(3, 200.0, 'Super Admin', NULL, NULL),
(4, 50.0, 'HR Manager', NULL, NULL),
(5, 20.0, 'HR Supervisor', NULL, NULL),
(6, 10.0, 'HR Analyst', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `provider_user_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cand_userId` int(11) DEFAULT NULL,
  `hr_userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `provider`, `provider_user_id`, `email`, `first_name`, `last_name`, `created_at`, `last_login`, `cand_userId`, `hr_userId`) VALUES
(1, 'google', '115730185581750494323', 'ralphjangallegos@gmail.com', 'Ralph Jan', 'Gallegos', '2025-03-01 23:51:32', '2025-03-02 01:05:03', NULL, 1),
(3, 'google', '117006513142247955268', 'ralp.pelino11@gmail.com', 'Ralph Jan', 'Gallegos', '2025-03-01 23:55:47', '2025-03-01 23:55:47', 24, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companyprofile`
--
ALTER TABLE `companyprofile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_userId` (`hr_userId`);

--
-- Indexes for table `tbl2fa`
--
ALTER TABLE `tbl2fa`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `tbl2fasetting`
--
ALTER TABLE `tbl2fasetting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tbl2fa_verification`
--
ALTER TABLE `tbl2fa_verification`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `tblapplications`
--
ALTER TABLE `tblapplications`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `personal_info_id` (`app_candId`),
  ADD KEY `apply_position_id` (`app_jobMId`),
  ADD KEY `app_branchId` (`app_branchId`);

--
-- Indexes for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  ADD PRIMARY KEY (`appS_id`),
  ADD KEY `appS_appId` (`appS_appId`),
  ADD KEY `appS_statusId` (`appS_statusId`),
  ADD KEY `appS_hrId` (`appS_hrId`);

--
-- Indexes for table `tblapprovalstatus`
--
ALTER TABLE `tblapprovalstatus`
  ADD PRIMARY KEY (`approvalS_id`),
  ADD KEY `approvalS_hrId` (`approvalS_hrId`);

--
-- Indexes for table `tblbackgroundcheckcategory`
--
ALTER TABLE `tblbackgroundcheckcategory`
  ADD PRIMARY KEY (`backgroundC_id`),
  ADD KEY `backgroundC_hrId` (`backgroundC_hrId`);

--
-- Indexes for table `tblbicheckresult`
--
ALTER TABLE `tblbicheckresult`
  ADD PRIMARY KEY (`biC_id`),
  ADD KEY `biC_biId` (`biC_bireportId`),
  ADD KEY `biC_categoryId` (`biC_categoryId`),
  ADD KEY `biC_hrId` (`biC_hrId`);

--
-- Indexes for table `tblbireport`
--
ALTER TABLE `tblbireport`
  ADD PRIMARY KEY (`bireport_id`),
  ADD KEY `bireport _hrId` (`bireport _hrId`);

--
-- Indexes for table `tblbranch`
--
ALTER TABLE `tblbranch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `branch_userId` (`branch_userId`);

--
-- Indexes for table `tblcandconsent`
--
ALTER TABLE `tblcandconsent`
  ADD PRIMARY KEY (`cons_id`),
  ADD KEY `personal_info_id` (`cons_candId`);

--
-- Indexes for table `tblcandeducbackground`
--
ALTER TABLE `tblcandeducbackground`
  ADD PRIMARY KEY (`educ_back_id`),
  ADD KEY `personal_info_id` (`educ_canId`),
  ADD KEY `courses_id` (`educ_coursesId`),
  ADD KEY `educ_institutionId` (`educ_institutionId`);

--
-- Indexes for table `tblcandeducpoints`
--
ALTER TABLE `tblcandeducpoints`
  ADD PRIMARY KEY (`candEduc_id`),
  ADD KEY `candP_educId` (`candEduc_educId`),
  ADD KEY `candP_appId` (`candEduc_appId`);

--
-- Indexes for table `tblcandemploymenthistory`
--
ALTER TABLE `tblcandemploymenthistory`
  ADD PRIMARY KEY (`empH_id`),
  ADD KEY `personal_info_id` (`empH_candId`);

--
-- Indexes for table `tblcandemppoints`
--
ALTER TABLE `tblcandemppoints`
  ADD PRIMARY KEY (`candEmp_id`),
  ADD KEY `candEmp_appId` (`candEmp_appId`),
  ADD KEY `candEmp_jworkId` (`candEmp_jworkId`);

--
-- Indexes for table `tblcandidates`
--
ALTER TABLE `tblcandidates`
  ADD PRIMARY KEY (`cand_id`),
  ADD UNIQUE KEY `unique_google_id` (`cand_google_id`),
  ADD KEY `idx_cand_google_id` (`cand_google_id`);

--
-- Indexes for table `tblcandknowledge`
--
ALTER TABLE `tblcandknowledge`
  ADD PRIMARY KEY (`canknow_id`),
  ADD KEY `canknow_canId` (`canknow_canId`),
  ADD KEY `canknow_knowledgeId` (`canknow_knowledgeId`);

--
-- Indexes for table `tblcandknowpoints`
--
ALTER TABLE `tblcandknowpoints`
  ADD PRIMARY KEY (`candKnow_id`),
  ADD KEY `candKnow_appId` (`candKnow_appId`),
  ADD KEY `candKnow_perkId` (`candKnow_perKId`);

--
-- Indexes for table `tblcandlicense`
--
ALTER TABLE `tblcandlicense`
  ADD PRIMARY KEY (`license_id`),
  ADD KEY `license_canId` (`license_canId`),
  ADD KEY `license_masterId` (`license_masterId`);

--
-- Indexes for table `tblcandlicensepoints`
--
ALTER TABLE `tblcandlicensepoints`
  ADD PRIMARY KEY (`candLic_id`),
  ADD KEY `candLic_appId` (`candLic_appId`),
  ADD KEY `candLic_licenseId` (`candLic_licenseId`);

--
-- Indexes for table `tblcandresume`
--
ALTER TABLE `tblcandresume`
  ADD PRIMARY KEY (`canres_id`);

--
-- Indexes for table `tblcandskillpoints`
--
ALTER TABLE `tblcandskillpoints`
  ADD PRIMARY KEY (`candSkill_id`),
  ADD KEY `candSkill_appId` (`candSkill_appId`),
  ADD KEY `candSkill_persId` (`candSkill_jobSkillsId`);

--
-- Indexes for table `tblcandskills`
--
ALTER TABLE `tblcandskills`
  ADD PRIMARY KEY (`skills_id`),
  ADD KEY `personal_info_id` (`skills_candId`);

--
-- Indexes for table `tblcandtraining`
--
ALTER TABLE `tblcandtraining`
  ADD PRIMARY KEY (`training_id`),
  ADD KEY `personal_info_id` (`training_candId`);

--
-- Indexes for table `tblcandtrainpoints`
--
ALTER TABLE `tblcandtrainpoints`
  ADD PRIMARY KEY (`candTrain_id`),
  ADD KEY `candTrain_appId` (`candTrain_appId`),
  ADD KEY `candTrain_pertId` (`candTrain_trngId`);

--
-- Indexes for table `tblcolorstatus`
--
ALTER TABLE `tblcolorstatus`
  ADD PRIMARY KEY (`colorS_id`),
  ADD KEY `colorS_hrId` (`colorS_hrId`);

--
-- Indexes for table `tblcourses`
--
ALTER TABLE `tblcourses`
  ADD PRIMARY KEY (`courses_id`),
  ADD KEY `course_category_id` (`courses_coursecategoryId`),
  ADD KEY `tblcourses_ibfk_1` (`courses_courseTypeId`),
  ADD KEY `courses_hrId` (`courses_hrId`);

--
-- Indexes for table `tblcoursescategory`
--
ALTER TABLE `tblcoursescategory`
  ADD PRIMARY KEY (`course_categoryId`),
  ADD KEY `course_categoryhrId` (`course_categoryhrId`);

--
-- Indexes for table `tblcoursetype`
--
ALTER TABLE `tblcoursetype`
  ADD PRIMARY KEY (`crs_type_id`),
  ADD KEY `crs_type_hrId` (`crs_type_hrId`);

--
-- Indexes for table `tblexam`
--
ALTER TABLE `tblexam`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `exam_typeId` (`exam_typeId`),
  ADD KEY `exam_jobMId` (`exam_jobMId`),
  ADD KEY `exam_hrId` (`exam_hrId`);

--
-- Indexes for table `tblexamcandidateanswer`
--
ALTER TABLE `tblexamcandidateanswer`
  ADD PRIMARY KEY (`examcandA_id`),
  ADD KEY `examA_choiceId` (`examcandA_choiceId`),
  ADD KEY `examA_questionId` (`examcandA_questionId`),
  ADD KEY `examA_resultId` (`examcandA_resultId`);

--
-- Indexes for table `tblexamchoices`
--
ALTER TABLE `tblexamchoices`
  ADD PRIMARY KEY (`examC_id`),
  ADD KEY `examC_questionId` (`examC_questionId`),
  ADD KEY `examC_hrId` (`examC_hrId`);

--
-- Indexes for table `tblexamquestion`
--
ALTER TABLE `tblexamquestion`
  ADD PRIMARY KEY (`examQ_id`),
  ADD KEY `examQ_examId` (`examQ_examId`),
  ADD KEY `examQ_typeId` (`examQ_typeId`),
  ADD KEY `examQ_hrId` (`examQ_hrId`);

--
-- Indexes for table `tblexamquestiontype`
--
ALTER TABLE `tblexamquestiontype`
  ADD PRIMARY KEY (`questionT_id`),
  ADD KEY `questionT_hrId` (`questionT_hrId`);

--
-- Indexes for table `tblexamresult`
--
ALTER TABLE `tblexamresult`
  ADD PRIMARY KEY (`examR_id`),
  ADD KEY `examR_candId` (`examR_candId`),
  ADD KEY `examR_examId` (`examR_examId`),
  ADD KEY `examR_jobMId` (`examR_jobMId`);

--
-- Indexes for table `tblexamschedule`
--
ALTER TABLE `tblexamschedule`
  ADD PRIMARY KEY (`examS_id`),
  ADD KEY `examS_appId` (`examS_appId`),
  ADD KEY `examS_candId` (`examS_candId`),
  ADD KEY `examS_hrId` (`examS_hrId`);

--
-- Indexes for table `tblexamtype`
--
ALTER TABLE `tblexamtype`
  ADD PRIMARY KEY (`examT_id`),
  ADD KEY `examT_hrId` (`examT_hrId`);

--
-- Indexes for table `tblfailedlogins`
--
ALTER TABLE `tblfailedlogins`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `tblforgotpassword`
--
ALTER TABLE `tblforgotpassword`
  ADD PRIMARY KEY (`forgotpass_id`),
  ADD KEY `personal_info_id` (`forgotpass_candId`);

--
-- Indexes for table `tblhr`
--
ALTER TABLE `tblhr`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `hr_userLevel` (`hr_userLevel`),
  ADD KEY `hr_hrId` (`hr_hrId`);

--
-- Indexes for table `tblinstitution`
--
ALTER TABLE `tblinstitution`
  ADD PRIMARY KEY (`institution_id`),
  ADD KEY `institution_hrId` (`institution_hrId`);

--
-- Indexes for table `tblinterviewcandpoints`
--
ALTER TABLE `tblinterviewcandpoints`
  ADD PRIMARY KEY (`interviewP_id`),
  ADD KEY `interviewP_candId` (`interviewP_candId`),
  ADD KEY `interviewP_criteriaId` (`interviewP_criteriaId`),
  ADD KEY `interviewP_jobId` (`interviewP_jobId`);

--
-- Indexes for table `tblinterviewcategory`
--
ALTER TABLE `tblinterviewcategory`
  ADD PRIMARY KEY (`interview_categ_id`),
  ADD KEY `interview_categ_hrId` (`interview_categ_hrId`);

--
-- Indexes for table `tblinterviewcriteria`
--
ALTER TABLE `tblinterviewcriteria`
  ADD PRIMARY KEY (`criteria_inter_id`),
  ADD KEY `criteria_inter_categId` (`criteria_inter_categId`),
  ADD KEY `criteria_inter_hrId` (`criteria_inter_hrId`);

--
-- Indexes for table `tblinterviewcriteriamaster`
--
ALTER TABLE `tblinterviewcriteriamaster`
  ADD PRIMARY KEY (`inter_criteria_id`),
  ADD KEY `inter_criteria_interviewId` (`inter_criteria_jobId`),
  ADD KEY `inter_criteria_criteriaId` (`inter_criteria_criteriaId`),
  ADD KEY `inter_criteria_hrId` (`inter_criteria_hrId`);

--
-- Indexes for table `tblinterviewpassingpercent`
--
ALTER TABLE `tblinterviewpassingpercent`
  ADD PRIMARY KEY (`passing_id`),
  ADD KEY `passing_jobId` (`passing_jobId`),
  ADD KEY `passing_hrId` (`passing_hrId`);

--
-- Indexes for table `tblinterviewresult`
--
ALTER TABLE `tblinterviewresult`
  ADD PRIMARY KEY (`interviewR_id`),
  ADD KEY `interviewR_candId` (`interviewR_candId`),
  ADD KEY `interviewR_jobId` (`interviewR_jobId`),
  ADD KEY `interviewR_hrId` (`interviewR_hrId`);

--
-- Indexes for table `tblinterviewschedule`
--
ALTER TABLE `tblinterviewschedule`
  ADD PRIMARY KEY (`intsched_id`),
  ADD KEY `intsched_jobId` (`intsched_jobId`),
  ADD KEY `intsched_candId` (`intsched_candId`),
  ADD KEY `intsched_hrId` (`intsched_hrId`);

--
-- Indexes for table `tbljobbranch`
--
ALTER TABLE `tbljobbranch`
  ADD PRIMARY KEY (`jobB_id`),
  ADD KEY `jobB_jobMId` (`jobB_jobMId`),
  ADD KEY `jobB_branchId` (`jobB_branchId`);

--
-- Indexes for table `tbljoboffer`
--
ALTER TABLE `tbljoboffer`
  ADD PRIMARY KEY (`joboffer_id`),
  ADD KEY `joboffer_candId` (`joboffer_candId`),
  ADD KEY `joboffer_jobMId` (`joboffer_jobMId`),
  ADD KEY `joboffer_hrId` (`joboffer_hrId`);

--
-- Indexes for table `tbljobofferstatus`
--
ALTER TABLE `tbljobofferstatus`
  ADD PRIMARY KEY (`jobofferS_id`),
  ADD KEY `jobofferS_hrId` (`jobofferS_hrId`);

--
-- Indexes for table `tbljobpassing`
--
ALTER TABLE `tbljobpassing`
  ADD PRIMARY KEY (`passing_id`),
  ADD KEY `passing_jobId` (`passing_jobId`),
  ADD KEY `passing_hrId` (`passing_hrId`);

--
-- Indexes for table `tbljobseducation`
--
ALTER TABLE `tbljobseducation`
  ADD PRIMARY KEY (`jeduc_id`),
  ADD KEY `jeduc_jobId` (`jeduc_jobId`),
  ADD KEY `jeduc_categoryId` (`jeduc_categoryId`),
  ADD KEY `jeduc_hrId` (`jeduc_hrId`);

--
-- Indexes for table `tbljobsknowledge`
--
ALTER TABLE `tbljobsknowledge`
  ADD PRIMARY KEY (`jknow_id`),
  ADD KEY `jknow_jobId` (`jknow_jobId`),
  ADD KEY `jknow_knowledgeId` (`jknow_knowledgeId`),
  ADD KEY `jknow_hrId` (`jknow_hrId`);

--
-- Indexes for table `tbljobslicense`
--
ALTER TABLE `tbljobslicense`
  ADD PRIMARY KEY (`jlicense_id`),
  ADD KEY `jlicense_licenceMId` (`jlicense_licenceMId`),
  ADD KEY `jlicense_jobId` (`jlicense_jobId`),
  ADD KEY `jlicense_hrId` (`jlicense_hrId`);

--
-- Indexes for table `tbljobsmaster`
--
ALTER TABLE `tbljobsmaster`
  ADD PRIMARY KEY (`jobM_id`),
  ADD KEY `jobM_hrId` (`jobM_hrId`);

--
-- Indexes for table `tbljobsmasterduties`
--
ALTER TABLE `tbljobsmasterduties`
  ADD PRIMARY KEY (`duties_id`),
  ADD KEY `duties_jobId` (`duties_jobId`),
  ADD KEY `duties_hrId` (`duties_hrId`);

--
-- Indexes for table `tbljobsskills`
--
ALTER TABLE `tbljobsskills`
  ADD PRIMARY KEY (`jskills_id`),
  ADD KEY `jskills_jobId` (`jskills_jobId`),
  ADD KEY `jskills_hrId` (`jskills_hrId`);

--
-- Indexes for table `tbljobstrainings`
--
ALTER TABLE `tbljobstrainings`
  ADD PRIMARY KEY (`jtrng_id`),
  ADD KEY `jtrng_jobId` (`jtrng_jobId`),
  ADD KEY `jtrng_hrId` (`jtrng_hrId`);

--
-- Indexes for table `tbljobsworkexperience`
--
ALTER TABLE `tbljobsworkexperience`
  ADD PRIMARY KEY (`jwork_id`),
  ADD KEY `jwork_jobId` (`jwork_jobId`),
  ADD KEY `jwork_hrId` (`jwork_hrId`);

--
-- Indexes for table `tblknown_devices`
--
ALTER TABLE `tblknown_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_device` (`email`,`browser`,`os`,`device`) USING HASH;

--
-- Indexes for table `tblknown_locations`
--
ALTER TABLE `tblknown_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_location` (`email`,`location`);

--
-- Indexes for table `tbllicensemaster`
--
ALTER TABLE `tbllicensemaster`
  ADD PRIMARY KEY (`license_master_id`),
  ADD KEY `license_master_typeId` (`license_master_typeId`),
  ADD KEY `license_master_hrId` (`license_master_hrId`);

--
-- Indexes for table `tbllicensetype`
--
ALTER TABLE `tbllicensetype`
  ADD PRIMARY KEY (`license_type_id`),
  ADD KEY `license_type_hrId` (`license_type_hrId`);

--
-- Indexes for table `tblloginlogs`
--
ALTER TABLE `tblloginlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_created_at` (`email`,`created_at`),
  ADD KEY `idx_user_id_created_at` (`user_id`,`created_at`),
  ADD KEY `idx_status_created_at` (`status`,`created_at`),
  ADD KEY `idx_method_created_at` (`method`,`created_at`);

--
-- Indexes for table `tblmanagementapproval`
--
ALTER TABLE `tblmanagementapproval`
  ADD PRIMARY KEY (`approval_id`),
  ADD KEY `approval_medicalMId` (`approval_medicalMId`),
  ADD KEY `approval_hrId` (`approval_hrId`);

--
-- Indexes for table `tblmanagementapprovalstatus`
--
ALTER TABLE `tblmanagementapprovalstatus`
  ADD PRIMARY KEY (`managementAS_id`),
  ADD KEY `managementAS_approveId` (`managementAS_approveId`),
  ADD KEY `managementAS_approveSId` (`managementAS_approveSId`),
  ADD KEY `managementAS_hrId` (`managementAS_hrId`);

--
-- Indexes for table `tblmedicalclassification`
--
ALTER TABLE `tblmedicalclassification`
  ADD PRIMARY KEY (`medicalC_id`),
  ADD KEY `medicalC_hrId` (`medicalC_hrId`);

--
-- Indexes for table `tblmedicalmaster`
--
ALTER TABLE `tblmedicalmaster`
  ADD PRIMARY KEY (`medicalM_id`),
  ADD KEY `medicalM_candId` (`medicalM_candId`),
  ADD KEY `medicalM_medicalCId` (`medicalM_medicalCId`),
  ADD KEY `medicalM_hrId` (`medicalM_hrId`),
  ADD KEY `medicalC_jobMId` (`medicalM_jobMid`);

--
-- Indexes for table `tblnotifications`
--
ALTER TABLE `tblnotifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_candId` (`notification_candId`),
  ADD KEY `notification_appId` (`notification_appId`),
  ADD KEY `notification_statusId` (`notification_statusId`);

--
-- Indexes for table `tblpersonalknowledge`
--
ALTER TABLE `tblpersonalknowledge`
  ADD PRIMARY KEY (`knowledge_id`),
  ADD KEY `knowledge_hrId` (`knowledge_hrId`);

--
-- Indexes for table `tblpersonalskills`
--
ALTER TABLE `tblpersonalskills`
  ADD PRIMARY KEY (`perS_id`);

--
-- Indexes for table `tblpersonaltraining`
--
ALTER TABLE `tblpersonaltraining`
  ADD PRIMARY KEY (`perT_id`),
  ADD KEY `perT_hrId` (`perT_hrId`);

--
-- Indexes for table `tblstatus`
--
ALTER TABLE `tblstatus`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `status_hrId` (`status_hrId`);

--
-- Indexes for table `tblstatusjoboffer`
--
ALTER TABLE `tblstatusjoboffer`
  ADD PRIMARY KEY (`statusjobO_id`),
  ADD KEY `statusjobO_jobofferId` (`statusjobO_jobofferId`),
  ADD KEY `statusjobO_statusId` (`statusjobO_statusId`);

--
-- Indexes for table `tbluserlevel`
--
ALTER TABLE `tbluserlevel`
  ADD PRIMARY KEY (`userL_id`),
  ADD KEY `userL_hrId` (`userL_hrId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_provider_user` (`provider`,`provider_user_id`),
  ADD KEY `cand_userId` (`cand_userId`),
  ADD KEY `hr_userId` (`hr_userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companyprofile`
--
ALTER TABLE `companyprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl2fasetting`
--
ALTER TABLE `tbl2fasetting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblapplications`
--
ALTER TABLE `tblapplications`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  MODIFY `appS_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblapprovalstatus`
--
ALTER TABLE `tblapprovalstatus`
  MODIFY `approvalS_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblbackgroundcheckcategory`
--
ALTER TABLE `tblbackgroundcheckcategory`
  MODIFY `backgroundC_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblbicheckresult`
--
ALTER TABLE `tblbicheckresult`
  MODIFY `biC_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbireport`
--
ALTER TABLE `tblbireport`
  MODIFY `bireport_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbranch`
--
ALTER TABLE `tblbranch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcandconsent`
--
ALTER TABLE `tblcandconsent`
  MODIFY `cons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcandeducbackground`
--
ALTER TABLE `tblcandeducbackground`
  MODIFY `educ_back_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblcandeducpoints`
--
ALTER TABLE `tblcandeducpoints`
  MODIFY `candEduc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcandemploymenthistory`
--
ALTER TABLE `tblcandemploymenthistory`
  MODIFY `empH_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tblcandemppoints`
--
ALTER TABLE `tblcandemppoints`
  MODIFY `candEmp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcandidates`
--
ALTER TABLE `tblcandidates`
  MODIFY `cand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblcandknowledge`
--
ALTER TABLE `tblcandknowledge`
  MODIFY `canknow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tblcandknowpoints`
--
ALTER TABLE `tblcandknowpoints`
  MODIFY `candKnow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcandlicense`
--
ALTER TABLE `tblcandlicense`
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcandlicensepoints`
--
ALTER TABLE `tblcandlicensepoints`
  MODIFY `candLic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcandresume`
--
ALTER TABLE `tblcandresume`
  MODIFY `canres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `tblcandskillpoints`
--
ALTER TABLE `tblcandskillpoints`
  MODIFY `candSkill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcandskills`
--
ALTER TABLE `tblcandskills`
  MODIFY `skills_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `tblcandtraining`
--
ALTER TABLE `tblcandtraining`
  MODIFY `training_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblcandtrainpoints`
--
ALTER TABLE `tblcandtrainpoints`
  MODIFY `candTrain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcolorstatus`
--
ALTER TABLE `tblcolorstatus`
  MODIFY `colorS_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcourses`
--
ALTER TABLE `tblcourses`
  MODIFY `courses_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `tblcoursescategory`
--
ALTER TABLE `tblcoursescategory`
  MODIFY `course_categoryId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tblcoursetype`
--
ALTER TABLE `tblcoursetype`
  MODIFY `crs_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblexam`
--
ALTER TABLE `tblexam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblexamcandidateanswer`
--
ALTER TABLE `tblexamcandidateanswer`
  MODIFY `examcandA_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblexamchoices`
--
ALTER TABLE `tblexamchoices`
  MODIFY `examC_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `tblexamquestion`
--
ALTER TABLE `tblexamquestion`
  MODIFY `examQ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tblexamquestiontype`
--
ALTER TABLE `tblexamquestiontype`
  MODIFY `questionT_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblexamresult`
--
ALTER TABLE `tblexamresult`
  MODIFY `examR_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblexamschedule`
--
ALTER TABLE `tblexamschedule`
  MODIFY `examS_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblexamtype`
--
ALTER TABLE `tblexamtype`
  MODIFY `examT_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblforgotpassword`
--
ALTER TABLE `tblforgotpassword`
  MODIFY `forgotpass_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblhr`
--
ALTER TABLE `tblhr`
  MODIFY `hr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinstitution`
--
ALTER TABLE `tblinstitution`
  MODIFY `institution_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2438;

--
-- AUTO_INCREMENT for table `tblinterviewcandpoints`
--
ALTER TABLE `tblinterviewcandpoints`
  MODIFY `interviewP_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinterviewcategory`
--
ALTER TABLE `tblinterviewcategory`
  MODIFY `interview_categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblinterviewcriteria`
--
ALTER TABLE `tblinterviewcriteria`
  MODIFY `criteria_inter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblinterviewcriteriamaster`
--
ALTER TABLE `tblinterviewcriteriamaster`
  MODIFY `inter_criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `tblinterviewpassingpercent`
--
ALTER TABLE `tblinterviewpassingpercent`
  MODIFY `passing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tblinterviewresult`
--
ALTER TABLE `tblinterviewresult`
  MODIFY `interviewR_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblinterviewschedule`
--
ALTER TABLE `tblinterviewschedule`
  MODIFY `intsched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbljobbranch`
--
ALTER TABLE `tbljobbranch`
  MODIFY `jobB_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbljoboffer`
--
ALTER TABLE `tbljoboffer`
  MODIFY `joboffer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbljobofferstatus`
--
ALTER TABLE `tbljobofferstatus`
  MODIFY `jobofferS_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbljobpassing`
--
ALTER TABLE `tbljobpassing`
  MODIFY `passing_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbljobseducation`
--
ALTER TABLE `tbljobseducation`
  MODIFY `jeduc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbljobsknowledge`
--
ALTER TABLE `tbljobsknowledge`
  MODIFY `jknow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbljobslicense`
--
ALTER TABLE `tbljobslicense`
  MODIFY `jlicense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbljobsmaster`
--
ALTER TABLE `tbljobsmaster`
  MODIFY `jobM_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbljobsmasterduties`
--
ALTER TABLE `tbljobsmasterduties`
  MODIFY `duties_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbljobsskills`
--
ALTER TABLE `tbljobsskills`
  MODIFY `jskills_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tbljobstrainings`
--
ALTER TABLE `tbljobstrainings`
  MODIFY `jtrng_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbljobsworkexperience`
--
ALTER TABLE `tbljobsworkexperience`
  MODIFY `jwork_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblknown_devices`
--
ALTER TABLE `tblknown_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblknown_locations`
--
ALTER TABLE `tblknown_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbllicensemaster`
--
ALTER TABLE `tbllicensemaster`
  MODIFY `license_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbllicensetype`
--
ALTER TABLE `tbllicensetype`
  MODIFY `license_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblloginlogs`
--
ALTER TABLE `tblloginlogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblmanagementapproval`
--
ALTER TABLE `tblmanagementapproval`
  MODIFY `approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmanagementapprovalstatus`
--
ALTER TABLE `tblmanagementapprovalstatus`
  MODIFY `managementAS_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmedicalclassification`
--
ALTER TABLE `tblmedicalclassification`
  MODIFY `medicalC_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmedicalmaster`
--
ALTER TABLE `tblmedicalmaster`
  MODIFY `medicalM_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblnotifications`
--
ALTER TABLE `tblnotifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblpersonalknowledge`
--
ALTER TABLE `tblpersonalknowledge`
  MODIFY `knowledge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblpersonalskills`
--
ALTER TABLE `tblpersonalskills`
  MODIFY `perS_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tblpersonaltraining`
--
ALTER TABLE `tblpersonaltraining`
  MODIFY `perT_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblstatus`
--
ALTER TABLE `tblstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblstatusjoboffer`
--
ALTER TABLE `tblstatusjoboffer`
  MODIFY `statusjobO_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluserlevel`
--
ALTER TABLE `tbluserlevel`
  MODIFY `userL_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companyprofile`
--
ALTER TABLE `companyprofile`
  ADD CONSTRAINT `companyprofile_ibfk_1` FOREIGN KEY (`hr_userId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblapplications`
--
ALTER TABLE `tblapplications`
  ADD CONSTRAINT `tblapplications_ibfk_1` FOREIGN KEY (`app_candId`) REFERENCES `tblcandidates` (`cand_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblapplications_ibfk_2` FOREIGN KEY (`app_jobMId`) REFERENCES `tbljobsmaster` (`jobM_id`),
  ADD CONSTRAINT `tblapplications_ibfk_3` FOREIGN KEY (`app_branchId`) REFERENCES `tblbranch` (`branch_id`);

--
-- Constraints for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  ADD CONSTRAINT `tblapplicationstatus_ibfk_1` FOREIGN KEY (`appS_appId`) REFERENCES `tblapplications` (`app_id`),
  ADD CONSTRAINT `tblapplicationstatus_ibfk_2` FOREIGN KEY (`appS_statusId`) REFERENCES `tblstatus` (`status_id`),
  ADD CONSTRAINT `tblapplicationstatus_ibfk_3` FOREIGN KEY (`appS_hrId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblapprovalstatus`
--
ALTER TABLE `tblapprovalstatus`
  ADD CONSTRAINT `tblapprovalstatus_ibfk_1` FOREIGN KEY (`approvalS_hrId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblbackgroundcheckcategory`
--
ALTER TABLE `tblbackgroundcheckcategory`
  ADD CONSTRAINT `tblbackgroundcheckcategory_ibfk_1` FOREIGN KEY (`backgroundC_hrId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblbicheckresult`
--
ALTER TABLE `tblbicheckresult`
  ADD CONSTRAINT `tblbicheckresult_ibfk_1` FOREIGN KEY (`biC_bireportId`) REFERENCES `tblbireport` (`bireport_id`),
  ADD CONSTRAINT `tblbicheckresult_ibfk_2` FOREIGN KEY (`biC_categoryId`) REFERENCES `tblbackgroundcheckcategory` (`backgroundC_id`),
  ADD CONSTRAINT `tblbicheckresult_ibfk_3` FOREIGN KEY (`biC_hrId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblbireport`
--
ALTER TABLE `tblbireport`
  ADD CONSTRAINT `tblbireport_ibfk_1` FOREIGN KEY (`bireport _hrId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblbranch`
--
ALTER TABLE `tblbranch`
  ADD CONSTRAINT `tblbranch_ibfk_1` FOREIGN KEY (`branch_userId`) REFERENCES `tblhr` (`hr_id`);

--
-- Constraints for table `tblcandeducbackground`
--
ALTER TABLE `tblcandeducbackground`
  ADD CONSTRAINT `tblcandeducbackground_ibfk_1` FOREIGN KEY (`educ_canId`) REFERENCES `tblcandidates` (`cand_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblcandeducbackground_ibfk_2` FOREIGN KEY (`educ_coursesId`) REFERENCES `tblcourses` (`courses_id`),
  ADD CONSTRAINT `tblcandeducbackground_ibfk_3` FOREIGN KEY (`educ_institutionId`) REFERENCES `tblinstitution` (`institution_id`);

--
-- Constraints for table `tblexamschedule`
--
ALTER TABLE `tblexamschedule`
  ADD CONSTRAINT `tblexamschedule_ibfk_1` FOREIGN KEY (`examS_appId`) REFERENCES `tblapplications` (`app_id`),
  ADD CONSTRAINT `tblexamschedule_ibfk_2` FOREIGN KEY (`examS_candId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblexamschedule_ibfk_3` FOREIGN KEY (`examS_hrId`) REFERENCES `tblhr` (`hr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
