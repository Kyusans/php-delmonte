-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2024 at 12:08 AM
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
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `adm_id` int(11) NOT NULL,
  `adm_name` varchar(50) NOT NULL,
  `adm_email` varchar(50) NOT NULL,
  `adm_password` varchar(50) NOT NULL,
  `adm_userLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`adm_id`, `adm_name`, `adm_email`, `adm_password`, `adm_userLevel`) VALUES
(1, 'Ralph Gallegos', 'ralph@gmail.com', 'ralph', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblapplications`
--

CREATE TABLE `tblapplications` (
  `app_id` int(11) NOT NULL,
  `app_candId` int(11) DEFAULT NULL,
  `app_jobMId` int(20) NOT NULL,
  `app_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblapplications`
--

INSERT INTO `tblapplications` (`app_id`, `app_candId`, `app_jobMId`, `app_datetime`) VALUES
(11, 7, 1, '2024-09-19 12:07:39'),
(12, 7, 11, '2024-09-21 11:10:27'),
(13, 6, 11, '2024-09-23 16:16:11'),
(14, 10, 11, '2024-09-23 16:16:11'),
(15, 7, 10, '2024-10-04 15:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblapplicationstatus`
--

CREATE TABLE `tblapplicationstatus` (
  `appS_id` int(50) NOT NULL,
  `appS_appId` int(50) NOT NULL,
  `appS_statusId` int(50) NOT NULL,
  `appS_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblapplicationstatus`
--

INSERT INTO `tblapplicationstatus` (`appS_id`, `appS_appId`, `appS_statusId`, `appS_date`) VALUES
(5, 11, 2, '2024-09-19 12:07:39'),
(6, 12, 1, '2024-09-21 11:10:27'),
(7, 13, 1, '2024-09-23 10:20:34'),
(8, 14, 1, '2024-09-23 10:20:34'),
(9, 14, 3, '2024-09-24 20:31:50'),
(26, 13, 2, '2024-10-01 08:13:20'),
(27, 12, 2, '2024-10-01 08:13:25'),
(28, 13, 6, '2024-10-01 09:10:55'),
(29, 12, 6, '2024-10-01 09:42:25'),
(30, 13, 5, '2024-10-01 12:31:50'),
(31, 12, 5, '2024-10-01 12:42:09'),
(32, 11, 6, '2024-10-01 01:02:17'),
(33, 15, 1, '2024-10-04 15:40:19'),
(34, 15, 2, '2024-10-05 05:17:08'),
(35, 15, 6, '2024-10-05 05:17:54'),
(36, 15, 5, '2024-10-05 05:18:04'),
(37, 11, 5, '2024-10-05 06:29:06');

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
(2, 9, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandeducbackground`
--

CREATE TABLE `tblcandeducbackground` (
  `educ_back_id` int(11) NOT NULL,
  `educ_canId` int(11) DEFAULT NULL,
  `educ_coursesId` int(20) NOT NULL,
  `educ_institutionId` int(20) NOT NULL,
  `educ_dategraduate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandeducbackground`
--

INSERT INTO `tblcandeducbackground` (`educ_back_id`, `educ_canId`, `educ_coursesId`, `educ_institutionId`, `educ_dategraduate`) VALUES
(1, 8, 23, 1, '2024-09-02'),
(2, 7, 46, 1474, '2024-08-09'),
(22, 7, 57, 1515, '2024-08-10'),
(23, 7, 47, 1516, '2024-07-10'),
(24, 9, 46, 1474, '2024-08-08'),
(25, 10, 23, 1, '2024-09-04'),
(26, 6, 39, 1474, '2024-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandemploymenthistory`
--

CREATE TABLE `tblcandemploymenthistory` (
  `empH_id` int(20) NOT NULL,
  `empH_candId` int(11) NOT NULL,
  `empH_positionName` varchar(250) NOT NULL,
  `empH_companyName` varchar(250) NOT NULL,
  `empH_startdate` date NOT NULL,
  `empH_enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandemploymenthistory`
--

INSERT INTO `tblcandemploymenthistory` (`empH_id`, `empH_candId`, `empH_positionName`, `empH_companyName`, `empH_startdate`, `empH_enddate`) VALUES
(17, 7, 'Project Manager', 'Phinma - Cagayan de Oro College', '2020-10-01', '2024-03-05'),
(18, 9, 'Coordinator', 'La Kreativ', '2021-09-08', '2024-09-08'),
(19, 10, 'Janitor', 'Nasa', '2024-08-01', '2024-09-06'),
(23, 6, 'Programmer', 'GSD', '2022-08-17', '2023-03-15');

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
  `cand_alternateEmail` varchar(255) DEFAULT NULL,
  `cand_presentAddress` text NOT NULL,
  `cand_permanentAddress` text DEFAULT NULL,
  `cand_dateofBirth` date DEFAULT NULL,
  `cand_sex` enum('Male','Female','Other') DEFAULT NULL,
  `cand_sssNo` varchar(50) DEFAULT NULL,
  `cand_tinNo` varchar(50) DEFAULT NULL,
  `cand_philhealthNo` varchar(50) DEFAULT NULL,
  `cand_pagibigNo` varchar(50) DEFAULT NULL,
  `cand_password` varchar(250) NOT NULL,
  `cand_createdDatetime` datetime DEFAULT NULL,
  `cand_updatedDatetime` datetime DEFAULT NULL,
  `cand_pinCode` varchar(50) NOT NULL,
  `cand_activeStatus` int(20) NOT NULL DEFAULT 0,
  `cand_userLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandidates`
--

INSERT INTO `tblcandidates` (`cand_id`, `cand_lastname`, `cand_firstname`, `cand_middlename`, `cand_contactNo`, `cand_alternatecontactNo`, `cand_email`, `cand_alternateEmail`, `cand_presentAddress`, `cand_permanentAddress`, `cand_dateofBirth`, `cand_sex`, `cand_sssNo`, `cand_tinNo`, `cand_philhealthNo`, `cand_pagibigNo`, `cand_password`, `cand_createdDatetime`, `cand_updatedDatetime`, `cand_pinCode`, `cand_activeStatus`, `cand_userLevel`) VALUES
(6, 'macario', 'mel', 'sabido', '096768745321', '096498231232', 'mel@gmail.com', 'mel@gmail.com', 'balay', 'balay', '2024-08-08', 'Male', '031245', '123123', '123123', '123123', 'mel', NULL, NULL, '', 0, 0),
(7, 'Gallegos', 'Ralph Jan', 'Pelino', '09056548089', '09261853553', 'ralphjangallegos@gmail.com', 'ralp.pelino11@gmail.com', 'Iponan', 'Iponan', '2014-08-08', 'Male', '565656565', '5656565', '56566', '565656', '@ralphjan12', NULL, NULL, '', 0, 1),
(8, 'macario', 'kobid', 'joe', '0945635345345', '09456353434545', 'kobid1212@gmail.com', 'kobid12@gmail.com', 'balay', 'dog house', '2024-09-02', 'Male', '123', '123', '123', '123', 'macario123', '2024-09-05 11:32:10', NULL, '', 0, 0),
(9, 'Gallegos', 'Ralph Jan', 'Jan P.', '09056548089', '09056548089', 'rape.gallegos.coc@phinmaed.com', 'rape.gallegos.coc@phinmaed.com', 'Ficoville, Iponan', 'Ficoville, Iponan', '2001-11-08', 'Male', '8998', '7878', '8998', '7878', 'gwapo', '2024-09-11 11:24:50', NULL, '', 0, 0),
(10, 'Roaya', 'Jake', 'Lumaktod', '09675868967857', '09675868967812', 'jake@gmail.com', 'jake12@gmail.com', 'Ficoville, Iponan', 'Ficoville, Iponan', '2002-10-20', 'Other', '8998', '7878', '8998', '7878', 'jake123', '2024-09-12 09:34:22', NULL, '', 0, 0);

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
(2, 7, 1),
(3, 7, 3),
(4, 7, 4),
(7, 9, 1),
(8, 10, 1),
(9, 6, 3),
(10, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandlicense`
--

CREATE TABLE `tblcandlicense` (
  `license_id` int(11) NOT NULL,
  `license_number` int(50) NOT NULL,
  `license_canId` int(11) NOT NULL,
  `license_masterId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandlicense`
--

INSERT INTO `tblcandlicense` (`license_id`, `license_number`, `license_canId`, `license_masterId`) VALUES
(1, 5666264, 7, 9),
(4, 89989, 9, 9),
(5, 89989, 10, 1),
(6, 747546, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandresume`
--

CREATE TABLE `tblcandresume` (
  `canres_id` int(11) NOT NULL,
  `canres_candId` int(11) NOT NULL,
  `canres_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandresume`
--

INSERT INTO `tblcandresume` (`canres_id`, `canres_candId`, `canres_image`) VALUES
(16, 7, 'expected6.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandskills`
--

CREATE TABLE `tblcandskills` (
  `skills_id` int(20) NOT NULL,
  `skills_candId` int(11) NOT NULL,
  `skills_perSId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandskills`
--

INSERT INTO `tblcandskills` (`skills_id`, `skills_candId`, `skills_perSId`) VALUES
(1, 8, 1),
(16, 9, 1),
(17, 10, 1),
(18, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblcandtraining`
--

CREATE TABLE `tblcandtraining` (
  `training_id` int(20) NOT NULL,
  `training_candId` int(20) NOT NULL,
  `training_perTId` int(20) NOT NULL,
  `training_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcandtraining`
--

INSERT INTO `tblcandtraining` (`training_id`, `training_candId`, `training_perTId`, `training_image`) VALUES
(6, 7, 2, 'event.png'),
(8, 7, 3, 'manager.png'),
(12, 9, 2, 'event.png'),
(14, 10, 3, 'manager.png'),
(16, 10, 2, 'fckk.png'),
(17, 7, 2, 'event.png'),
(18, 7, 2, 'assist.png'),
(20, 6, 3, 'manager.png'),
(23, 7, 2, 'event.png'),
(25, 7, 3, 'manager.png'),
(26, 7, 2, 'assist.png'),
(27, 7, 3, 'samples.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourses`
--

CREATE TABLE `tblcourses` (
  `courses_id` int(20) NOT NULL,
  `courses_name` varchar(250) NOT NULL,
  `courses_coursecategoryId` int(20) NOT NULL,
  `courses_courseTypeId` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourses`
--

INSERT INTO `tblcourses` (`courses_id`, `courses_name`, `courses_coursecategoryId`, `courses_courseTypeId`) VALUES
(23, 'Bachelor of Arts (AB) in English', 5, 2),
(24, 'Bachelor of Arts (AB) in Filipino', 5, 2),
(25, 'Bachelor of Arts (AB) in History', 5, 2),
(26, 'Bachelor of Arts (AB) in Philosophy', 5, 2),
(27, 'Bachelor of Arts (AB) in Political Science', 5, 2),
(28, 'Bachelor of Arts (AB) in Psychology', 5, 2),
(29, 'Bachelor of Fine Arts (BFA) in Painting', 5, 2),
(30, 'Bachelor of Fine Arts (BFA) in Sculpture', 5, 2),
(31, 'Bachelor of Fine Arts (BFA) in Graphic Design', 5, 2),
(32, 'Bachelor of Fine Arts (BFA) in Photography', 5, 2),
(33, 'Bachelor of Music (BM) in Performance', 5, 2),
(34, 'Bachelor of Music (BM) in Music Education', 5, 2),
(35, 'Bachelor of Music (BM) in Music Therapy', 5, 2),
(36, 'Bachelor of Science in Business Administration (BSBA) in Accounting', 1, 2),
(37, 'Bachelor of Science in Business Administration (BSBA) in Business Management', 1, 2),
(38, 'Bachelor of Science in Business Administration (BSBA) in Entrepreneurship', 1, 2),
(39, 'Bachelor of Science in Business Administration (BSBA) in Finance', 1, 2),
(40, 'Bachelor of Science in Business Administration (BSBA) in Human Resource Management', 1, 2),
(41, 'Bachelor of Science in Business Administration (BSBA) in Marketing', 1, 2),
(42, 'Bachelor of Science in Business Administration (BSBA) in Operations Management', 1, 2),
(43, 'Bachelor of Science in Entrepreneurship (BSE)', 1, 2),
(44, 'Bachelor of Science in Management (BSM)', 1, 2),
(45, 'Bachelor of Science in Computer Science (BSCS)', 18, 2),
(46, 'Bachelor of Science in Information Technology (BSIT)', 18, 2),
(47, 'Bachelor of Science in Information Systems (BSIS)', 18, 2),
(48, 'Bachelor of Elementary Education (BEEd)', 4, 2),
(49, 'Bachelor of Secondary Education (BSEd) in English', 4, 2),
(50, 'Bachelor of Secondary Education (BSEd) in Filipino', 4, 2),
(51, 'Bachelor of Secondary Education (BSEd) in Mathematics', 4, 2),
(52, 'Bachelor of Secondary Education (BSEd) in Science', 4, 2),
(53, 'Bachelor of Secondary Education (BSEd) in Social Studies', 4, 2),
(54, 'Bachelor of Physical Education (BPE)', 4, 2),
(55, 'Bachelor of Special Needs Education (BSNEd)', 4, 2),
(56, 'Bachelor of Science in Civil Engineering (BSCE)', 2, 2),
(57, 'Bachelor of Science in Computer Engineering (BSCoE)', 2, 2),
(58, 'Bachelor of Science in Electrical Engineering (BSEE)', 2, 2),
(59, 'Bachelor of Science in Electronics Engineering (BSECE)', 2, 2),
(60, 'Bachelor of Science in Mechanical Engineering (BSME)', 2, 2),
(61, 'Bachelor of Science in Industrial Engineering (BSIE)', 2, 2),
(83, 'Bachelor of Science in Nursing (BSN)', 3, 2),
(84, 'Bachelor of Science in Medical Technology (BSMT)', 3, 2),
(85, 'Bachelor of Science in Pharmacy (BSPharm)', 3, 2),
(86, 'Bachelor of Science in Physical Therapy (BSPT)', 3, 2),
(87, 'Bachelor of Science in Occupational Therapy (BSOT)', 3, 2),
(91, 'Bachelor of Science in Hospitality Management (BSHM)', 9, 2),
(92, 'Bachelor of Science in Tourism Management (BSTM)', 9, 2),
(93, 'Bachelor of Science in Biology (BSBio)', 19, 2),
(94, 'Bachelor of Science in Chemistry (BSChem)', 19, 2),
(95, 'Bachelor of Science in Mathematics (BSMath)', 19, 2),
(96, 'Bachelor of Science in Physics (BSPhy)', 19, 2),
(97, 'Bachelor of Science in Statistics (BSStat)', 19, 2),
(98, 'Bachelor of Science in Economics (BSEcon)', 11, 2),
(99, 'Bachelor of Science in Psychology (BSPsy)', 11, 2),
(100, 'Bachelor of Science in Sociology (BSSoc)', 11, 2),
(101, 'Bachelor of Science in Anthropology (BSAnthro)', 11, 2),
(102, 'Bachelor of Science in Criminology (BSCrim)', 20, 2),
(103, 'Bachelor of Science in Environmental Science (BSES)', 20, 2),
(104, 'Bachelor of Science in Forestry (BSFor)', 20, 2),
(105, 'Bachelor of Science in Geology (BSGeo)', 20, 2),
(106, 'Bachelor of Science in Marine Biology (BSMB)', 20, 2),
(107, 'Bachelor of Science in Agriculture (BSA)', 21, 2),
(108, 'Bachelor of Science in Agricultural Business (BSAB)', 21, 2),
(109, 'Bachelor of Science in Agricultural Economics (BSAE)', 21, 2),
(110, 'Bachelor of Science in Agronomy (BSAgr)', 21, 2),
(111, 'Bachelor of Science in Animal Science (BSAS)', 21, 2),
(112, 'Bachelor of Science in Entomology (BSEnt)', 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblcoursescategory`
--

CREATE TABLE `tblcoursescategory` (
  `course_categoryId` int(20) NOT NULL,
  `course_categoryName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcoursescategory`
--

INSERT INTO `tblcoursescategory` (`course_categoryId`, `course_categoryName`) VALUES
(1, 'Business and Management'),
(2, 'Engineering'),
(3, 'Health Sciences'),
(4, 'Education'),
(5, 'Arts and Humanities'),
(6, 'Sciences'),
(7, 'Law and Criminal Justice'),
(8, 'Agriculture and Veterinary Sciences'),
(9, 'Hospitality and Tourism'),
(10, 'Media and Design'),
(11, 'Social Sciences'),
(12, 'Maritime Studies'),
(13, 'Sports and Physical Education'),
(14, 'Theology and Religious Studies'),
(15, 'Language and Literature'),
(16, 'Vocational and Technical Courses'),
(17, 'Specialized and Emerging Fields'),
(18, 'Computer Science and Information Technology'),
(19, 'Math and Sciences'),
(20, 'Other Programs'),
(21, 'Agriculture');

-- --------------------------------------------------------

--
-- Table structure for table `tblcoursetype`
--

CREATE TABLE `tblcoursetype` (
  `crs_type_id` int(11) NOT NULL,
  `crs_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcoursetype`
--

INSERT INTO `tblcoursetype` (`crs_type_id`, `crs_type_name`) VALUES
(1, 'Secondary Education'),
(2, 'Tertiary Education'),
(3, 'Graduate Education');

-- --------------------------------------------------------

--
-- Table structure for table `tblexam`
--

CREATE TABLE `tblexam` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(50) NOT NULL,
  `exam_typeId` int(11) NOT NULL,
  `exam_jobMId` int(11) DEFAULT NULL,
  `exam_duration` int(11) NOT NULL,
  `exam_createdAt` date NOT NULL,
  `exam_updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamapplicantanswer`
--

CREATE TABLE `tblexamapplicantanswer` (
  `examA_id` int(11) NOT NULL,
  `examA_resultId` int(11) NOT NULL,
  `examA_questionId` int(11) NOT NULL,
  `examA_choiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamchoices`
--

CREATE TABLE `tblexamchoices` (
  `examC_id` int(11) NOT NULL,
  `examC_questionId` int(11) NOT NULL,
  `examC_text` varchar(255) NOT NULL,
  `examC_isCorrect` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamquestion`
--

CREATE TABLE `tblexamquestion` (
  `examQ_id` int(11) NOT NULL,
  `examQ_examId` int(11) NOT NULL,
  `examQ_text` varchar(50) NOT NULL,
  `examQ_typeId` int(11) NOT NULL,
  `examQ_createdAt` date NOT NULL,
  `examQ_updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamquestiontype`
--

CREATE TABLE `tblexamquestiontype` (
  `questionT_id` int(11) NOT NULL,
  `questionT_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamquestiontype`
--

INSERT INTO `tblexamquestiontype` (`questionT_id`, `questionT_name`) VALUES
(1, 'Multiple Choice'),
(2, 'Essay');

-- --------------------------------------------------------

--
-- Table structure for table `tblexamresult`
--

CREATE TABLE `tblexamresult` (
  `examR_id` int(11) NOT NULL,
  `examR_candId` int(11) NOT NULL,
  `examR_examId` int(11) NOT NULL,
  `examR_score` int(50) NOT NULL,
  `examR_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblexamtype`
--

CREATE TABLE `tblexamtype` (
  `examT_id` int(11) NOT NULL,
  `examT_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblexamtype`
--

INSERT INTO `tblexamtype` (`examT_id`, `examT_name`) VALUES
(1, 'General'),
(2, 'Specific');

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
-- Table structure for table `tblinstitution`
--

CREATE TABLE `tblinstitution` (
  `institution_id` int(20) NOT NULL,
  `institution_name` varchar(90) DEFAULT NULL,
  `institution_points` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tblinstitution`
--

INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`) VALUES
(1, 'The Adelphi College', 5),
(2, 'Malasiqui Agno Valley College', 5),
(3, 'Asbury College', 5),
(4, 'Asiacareer College Foundation', 5),
(5, 'CICOSAT Colleges', 5),
(6, 'Universidad de Dagupan', 5),
(7, 'Dagupan Colleges Foundation', 5),
(8, 'Data Center College of the Philippines of Laoag City', 5),
(9, 'Divine Word College of Laoag', 5),
(10, 'Divine Word College of Vigan', 5),
(11, 'Don Mariano Marcos Memorial State University-South La Union', 5),
(12, 'Don Mariano Marcos Memorial State University-Mid La Union', 5),
(13, 'Don Mariano Marcos Memorial State University-Open University', 5),
(14, 'Don Mariano Marcos Memorial State University-North La Union-Main Campus', 5),
(15, 'The Great Plebeian College', 5),
(16, 'Ilocos Sur Polytechnic State College-Sta. Maria', 5),
(17, 'Ilocos Sur Community College', 5),
(18, 'Lorma Colleges', 5),
(19, 'Luna Colleges', 5),
(20, 'University of Luzon', 5),
(21, 'Lyceum Northern Luzon', 5),
(22, 'Mariano Marcos State University-Main', 5),
(23, 'Mary Help of Christians College Seminary', 5),
(24, 'Mariano Marcos State University-College of Aquatic Sciences and Applied Technology', 5),
(25, 'Mariano Marcos State University-College of Agriculture and Forestry-Dingras', 5),
(26, 'Mariano Marcos State University-College of Teacher Education-Laoag City', 5),
(27, 'Mariano Marcos State University-College of Industrial Technology-Laoag City', 5),
(28, 'Northern Christian College', 5),
(29, 'Northern Luzon Adventist College', 5),
(30, 'Northern Philippines College for Maritime Science and Technology', 5),
(31, 'Northwestern University', 5),
(32, 'Osias Educational Foundation', 5),
(33, 'Palaris College', 5),
(34, 'Panpacific University', 5),
(35, 'Pangasinan Merchant Marine Academy', 5),
(36, 'Pangasinan State University', 5),
(37, 'Pangasinan State University-Open University', 5),
(38, 'Pangasinan State University-Alaminos City', 5),
(39, 'Perpetual Help College of Pangasinan', 5),
(40, 'Polytechnic College of La union', 5),
(41, 'Philippine College of Science and Technology', 5),
(42, 'PIMSAT Colleges-Dagupan', 5),
(43, 'Pangasinan State University-Asingan', 5),
(44, 'Pangasinan State University-Bayambang', 5),
(45, 'Pangasinan State University-Binmaley', 5),
(46, 'Pangasinan State University-Infanta', 5),
(47, 'Pangasinan State University-San Carlos City', 5),
(48, 'Pangasinan State University-Sta. Maria', 5),
(49, 'Pangasinan State University-Urdaneta City', 5),
(50, 'Saint Columban\'s College', 5),
(51, 'Saint Louis College-City of San Fernando', 5),
(52, 'Saint Mary\'s College Sta. Maria Ilocos Sur', 5),
(53, 'Saint Paul College of Ilocos Sur', 5),
(54, 'San Carlos College', 5),
(55, 'Sea and Sky College', 5),
(56, 'Union Christian College', 5),
(57, 'University of Northern Philippines', 5),
(58, 'University of Pangasinan', 5),
(59, 'Ilocos Sur Polytechnic State College-Main Campus', 5),
(60, 'NJ Valdez Colleges Foundation', 5),
(61, 'Urdaneta City University', 5),
(62, 'Virgen Milagrosa University Foundation', 5),
(63, 'Ilocos Sur Polytechnic State College-College of Engineering and Technology-Santiago', 5),
(64, 'Ilocos Sur Polytechnic State College-College of Arts and Sciences-Tagudin', 5),
(65, 'Ilocos Sur Polytechnic State College-College of Fisheries and Marine Sciences-Narvacan', 5),
(66, 'Ilocos Sur Polytechnic State College-Cervantes', 5),
(67, 'Ilocos Sur Polytechnic State College-Candon', 5),
(68, 'Metro-Dagupan Colleges', 5),
(69, 'Pass College', 5),
(70, 'AMA Computer College-Pangasinan', 5),
(71, 'AMA Computer College-Laoag City', 5),
(72, 'Lyceum Northwestern University', 5),
(73, 'STI College-Dagupan', 5),
(74, 'AMA Computer College-La Union', 5),
(75, 'Golden West Colleges', 5),
(76, 'Lyceum Northwestern University-Urdaneta Campus', 5),
(77, 'Data Center College of the Philippines-Vigan City', 5),
(78, 'Colegio San Jose De Alaminos', 5),
(79, 'Colegio De San Juan De Letran-Manaoag', 5),
(80, 'South Ilocandia College of Arts and Technology', 5),
(81, 'La Union College of Science and Technology', 5),
(82, 'Mystical Rose College of Science and Technology', 5),
(83, 'St. Therese College Foundation', 5),
(84, 'ABE International College of Business and Accountancy-Urdaneta City', 5),
(85, 'Panpacific University North Philippines-Tayug', 5),
(86, 'Kingfisher School of Business & Finance', 5),
(87, 'NICOSAT Colleges', 5),
(88, 'St. Camillus College of Manaoag Foundation', 5),
(89, 'International College for Excellence', 5),
(90, 'Philippine College of Northwestern Luzon', 5),
(91, 'Philippine Darakbang Theological College', 5),
(92, 'Saint John Bosco College of Northern Luzon', 5),
(93, 'University of Eastern Pangasinan', 5),
(94, 'Rosales-Wesleyan Bible College', 5),
(95, 'La Union Christian Comprehensive College', 5),
(96, 'Immaculate Conception School of Theology', 5),
(97, 'WCC Aeronautical & Technological College', 5),
(98, 'PIMSAT Colleges-San Carlos City', 5),
(99, 'Binalatongan Community College', 5),
(100, 'Mary Help of Christians Theology Seminary', 5),
(101, 'STI College-Vigan', 5),
(102, 'STI College-Laoag', 5),
(103, 'Señor Tesoro College', 5),
(104, 'PHINMA-Upang College Urdaneta', 5),
(105, 'Mary Cause of Our Joy College Seminary', 5),
(106, 'St. Benedict College of Northern Luzon', 5),
(107, 'Leading Edge International Aviation Academy', 5),
(108, 'Kingsville Advanced School', 5),
(109, 'Bayambang Polytechnic College', 5),
(110, 'Philippine Remnant College', 5),
(111, 'Aldersgate College', 5),
(112, 'Isabela State University-Angadanan Campus', 5),
(113, 'Batanes State College', 5),
(114, 'University of Cagayan Valley', 5),
(115, 'Cagayan State University-Tuguegarao (Carig)', 5),
(116, 'Isabela State University-Cauayan Campus', 5),
(117, 'Cagayan State University-Aparri', 5),
(118, 'Cagayan State University-Gonzaga', 5),
(119, 'Cagayan State University-Lallo', 5),
(120, 'Cagayan State University-Lasam', 5),
(121, 'Cagayan State University-Piat', 5),
(122, 'Cagayan State University-Sanchez Mira', 5),
(123, 'Isabela State University-San Mariano Campus', 5),
(124, 'Eveland Christian College', 5),
(125, 'Isabela Colleges', 5),
(126, 'Isabela State University-Main (Echague)', 5),
(127, 'Isabela State University-Cabagan', 5),
(128, 'Isabela State University-Ilagan Campus', 5),
(129, 'Isabela State University-Jones Campus', 5),
(130, 'Isabela State University-Roxas Campus', 5),
(131, 'Isabela State University-San Mateo Campus', 5),
(132, 'University of La Salette', 5),
(133, 'Lyceum of Aparri', 5),
(134, 'Lyceum of Tuao', 5),
(135, 'Medical Colleges of Northern Philippines', 5),
(136, 'Northeastern College', 5),
(137, 'Northern Cagayan Colleges Foundation', 5),
(138, 'Nueva Vizcaya State University - Main Bayombong', 5),
(139, 'Nueva Vizcaya State University-Bambang', 5),
(140, 'Our Lady of the Pillar College-Cauayan', 5),
(141, 'Patria Sable Corpus College', 5),
(142, 'PLT College', 5),
(143, 'Philippine Normal University-North Luzon Campus', 5),
(144, 'Quezon Colleges of the North', 5),
(145, 'Quirino State University - Cabarroguis', 5),
(146, 'Quirino State University', 5),
(147, 'Quirino State University - Maddela', 5),
(148, 'Saint Anthony\'s College', 5),
(149, 'Saint Dominic College of Batanes', 5),
(150, 'St. Ferdinand College-Ilagan', 5),
(151, 'Saint Joseph\'s College of Baggao', 5),
(152, 'University of Saint Louis-Tuguegarao', 5),
(153, 'Saint Mary\'s University of Bayombong', 5),
(154, 'Saint Paul University Philippines', 5),
(155, 'Mallig Plains Colleges', 5),
(156, 'FL Vargas College-Tuguegarao', 5),
(157, 'Philippine Law Enforcement College', 5),
(158, 'International School of Asia and the Pacific', 5),
(159, 'Isabela College of Arts and Technology', 5),
(160, 'AMA Computer College-Santiago City', 5),
(161, 'Cagayan Valley Computer and Information Technology College', 5),
(162, 'John Wesley College', 5),
(163, 'AMA Computer College-Tuguegarao City', 5),
(164, 'SISTECH College of Santiago City', 5),
(165, 'Santiago City Colleges', 5),
(166, 'Saint Ferdinand College-Cabagan Campus', 5),
(167, 'F.L. Vargas College-Abulug Campus', 5),
(168, 'Metropolitan School of Science and Technology', 5),
(169, 'University of Perpetual Help System', 5),
(170, 'King\'s College of the Philippines-Bambang', 5),
(171, 'Global Academy of Technology and Entrepreneurship', 5),
(172, 'HGBaquiran College', 5),
(173, 'Infant Jesus Montessori School (College Department)', 5),
(174, 'Maila Rosario Colleges', 5),
(175, 'Our Lady of the Pillar College-Cauayan San Manuel Branch', 5),
(176, 'Northeast Luzon Adventist College', 5),
(177, 'Cagayan State University-Andrews', 5),
(178, 'Isabela State University-Palanan Campus', 5),
(179, 'La Salette of Roxas College', 5),
(180, 'STI College-Cauayan', 5),
(181, 'Angeles University Foundation', 5),
(182, 'Sto. Rosario Sapang Palay College', 5),
(183, 'Baliuag University', 5),
(184, 'Baliwag Maritime Foundation', 5),
(185, 'Bataan Peninsula State University-Dinalupihan', 5),
(186, 'Bataan Peninsula State University-Abucay', 5),
(187, 'Bataan Peninsula State University-Bagac', 5),
(188, 'Bataan Heroes Memorial College', 5),
(189, 'Bulacan Agricultural State College', 5),
(190, 'Bulacan State University-Main', 5),
(191, 'Bulacan State University-Bustos', 5),
(192, 'Bulacan State University-San Jose Del Monte', 5),
(193, 'Bulacan State University-Meneses', 5),
(194, 'Bulacan State University-Hagonoy', 5),
(195, 'Camiling Colleges', 5),
(196, 'CIT Colleges of Paniqui Foundation', 5),
(197, 'Central Luzon Doctors\' Hospital Educational Institution', 5),
(198, 'Central Luzon College of Science and Technology-Olongapo City', 5),
(199, 'Nueva Ecija University of Science and Technology-Main', 5),
(200, 'Central Luzon State University', 5),
(201, 'Centro Escolar University-Malolos City', 5),
(202, 'Colegio De San Pascual Baylon', 5),
(203, 'College of the Immaculate Conception', 5),
(204, 'CORE Gateway College', 5),
(205, 'Columban College-Olongapo City', 5),
(206, 'College for Research and Technology-Cabanatuan City', 5),
(207, 'World Citi Colleges Guimba Campus', 5),
(208, 'Divina Pastora College', 5),
(209, 'Dominican College of Tarlac', 5),
(210, 'Don Honorio Ventura Technological State University-Main', 5),
(211, 'Don Honorio Ventura Technological State University-Mexico', 5),
(212, 'Don Honorio Ventura Technological State University-Porac', 5),
(213, 'Don Honorio Ventura Technological State University-Sto.Thomas', 5),
(214, 'Dr. Gloria D. Lacson Foundation Colleges - Nueva Ecija', 5),
(215, 'Dr. Yanga\'s Colleges', 5),
(216, 'General De Jesus College', 5),
(217, 'The Good Samaritan Colleges', 5),
(218, 'Guagua National Colleges', 5),
(219, 'Holy Angel University', 5),
(220, 'Holy Cross College-Nueva Ecija', 5),
(221, 'Holy Cross College-Pampanga', 5),
(222, 'Immaculate Conception Major Seminary', 5),
(223, 'Interworld College of Technology Foundation-Tarlac', 5),
(224, 'Jesus Is Lord Colleges Foundation', 5),
(225, 'Jose C. Feliciano College Foundation', 5),
(226, 'Lourdes College of Bulacan', 5),
(227, 'Magsaysay Memorial College of Zambales', 5),
(228, 'Manuel V. Gallego Foundation Colleges', 5),
(229, 'Maria Assumpta Seminary', 5),
(230, 'Metro Subic Colleges', 5),
(231, 'Meycauayan College', 5),
(232, 'Microcity College of Business and Technology', 5),
(233, 'MIDWAY COLLEGES Inc.', 5),
(234, 'Mondriaan Aura College', 5),
(235, 'Mother of Good Counsel Seminary', 5),
(236, 'Mt.Carmel College of Bocaue Bulacan', 5),
(237, 'Nazarenus College and Hospital Foundation', 5),
(238, 'Nueva Ecija Doctors\' Colleges', 5),
(239, 'Carthel Science Educational Foundation', 5),
(240, 'Osias Colleges', 5),
(241, 'Our Lady of Peace College Seminary', 5),
(242, 'Araullo University', 5),
(243, 'Pampanga State Agricultural University', 5),
(244, 'Pampanga Colleges', 5),
(245, 'Philippine State College of Aeronautics-Pampanga Extension', 5),
(246, 'Polytechnic University of the Philippines-Mariveles', 5),
(247, 'President Ramon Magsaysay State University', 5),
(248, 'President Ramon Magsaysay State University-Botolan', 5),
(249, 'President Ramon Magsaysay State University-Candelaria', 5),
(250, 'President Ramon Magsaysay State University-Castillejos', 5),
(251, 'President Ramon Magsaysay State University-Masinloc', 5),
(252, 'President Ramon Magsaysay State University-Sta. Cruz', 5),
(253, 'La Consolacion University Philippines', 5),
(254, 'Republic Central Colleges', 5),
(255, 'Nueva Ecija University of Science and Technology-Sebani Estate Agricultural College', 5),
(256, 'Nueva Ecija University of Science and Technology-Atate', 5),
(257, 'Nueva Ecija University of Science and Technology-Fort Magsaysay', 5),
(258, 'Nueva Ecija University of Science and Technology-San Isidro Campus', 5),
(259, 'Nueva Ecija University of Science and Technology-Sumacab Campus', 5),
(260, 'Nueva Ecija University of Science and Technology-Peñaranda', 5),
(261, 'Nueva Ecija University of Science and Technology-Talavera', 5),
(262, 'Nueva Ecija University of Science and Technology-San Leonardo', 5),
(263, 'Nueva Ecija University of Science and Technology-Carranglan', 5),
(264, 'Nueva Ecija University of Science and Technology-San Antonio Campus', 5),
(265, 'Saint Anthony College of Technology', 5),
(266, 'Saint Mary\'s College of Meycauayan', 5),
(267, 'St. Paul University at San Miguel', 5),
(268, 'San Jose Christian Colleges', 5),
(269, 'STI College-City of Tarlac', 5),
(270, 'Systems Plus College Foundation', 5),
(271, 'Tarlac Agricultural University', 5),
(272, 'Tarlac State University', 5),
(273, 'Tomas Del Rosario College', 5),
(274, 'University of the Assumption', 5),
(275, 'Wesleyan University-Philippines (Cabanatuan)', 5),
(276, 'President Ramon Magsaysay State University-San Marcelino', 5),
(277, 'Bataan Peninsula State University-Orani', 5),
(278, 'Interworld Colleges Foundation - Paniqui', 5),
(279, 'STI College-City of San Fernando', 5),
(280, 'STI College-Angeles City', 5),
(281, 'STI College-Meycauayan', 5),
(282, 'STI College-Malolos', 5),
(283, 'United School of Science and Technology Colleges', 5),
(284, 'Concepcion Holy Cross College', 5),
(285, 'Northern Zambales College', 5),
(286, 'Columban College-Sta. Cruz Zambales', 5),
(287, 'College of Saint Lawrence', 5),
(288, 'Sact Mutien College', 5),
(289, 'Fernandez College of Arts and Technology', 5),
(290, 'Micro Asia College of Science and Technology', 5),
(291, 'Sienna College of San Jose', 5),
(292, 'Bataan Peninsula State University', 5),
(293, 'AMA Computer College-Cabanatuan City', 5),
(294, 'Comteq Computer and Business College', 5),
(295, 'Gordon College', 5),
(296, 'Eastwoods Professional College of Science and Technology', 5),
(297, 'AMA Computer College-Malolos', 5),
(298, 'AMA Computer College-San Fernando Pampanga', 5),
(299, 'Limay Polytechnic College', 5),
(300, 'Maritime Academy of Asia and the Pacific', 5),
(301, 'AMA Computer College-Tarlac City', 5),
(302, 'Fundamental Baptist College For Asians', 5),
(303, 'St. Paul Colleges Foundation-Paniqui Tarlac', 5),
(304, 'ABE International College of Business and Economics-Cabanatuan', 5),
(305, 'AMA Computer College-Angeles City', 5),
(306, 'Asia Pacific College of Advanced Studies', 5),
(307, 'College of Mary Immaculate of Pandi Bulacan', 5),
(308, 'Saint Mary\'s College of Baliuag', 5),
(309, 'Saint Augustine Colleges Foundation', 5),
(310, 'Saint Rose College Educational Foundation', 5),
(311, 'ABE International College of Business and Accountancy', 5),
(312, 'AMA Computer College-Olongapo City', 5),
(313, 'La Concepcion College', 5),
(314, 'Colegio De San Gabriel Arcangel', 5),
(315, 'Mary the Queen College-Pampanga', 5),
(316, 'Mount Carmel College of Casiguran', 5),
(317, 'STI College-Sta. Maria', 5),
(318, 'STI College-Balagtas', 5),
(319, 'Lyceum of Subic Bay', 5),
(320, 'Kolehiyo ng Subic', 5),
(321, 'First City Providential College', 5),
(322, 'College of the Most Holy Trinity', 5),
(323, 'Academia de San Lorenzo Dema Ala', 5),
(324, 'Eduardo L. Joson Memorial College', 5),
(325, 'The Manila Times College of Subic', 5),
(326, 'St. Joseph College-Olongapo', 5),
(327, 'Saint Mary\'s Angels College of Pampanga', 5),
(328, 'St. Nicolas College of Business and Technology', 5),
(329, 'Dr. Gloria D. Lacson Foundation Colleges-Cabanatuan City', 5),
(330, 'College of Our Lady of Mt. Carmel (Pampanga)', 5),
(331, 'Central Luzon College of Science and Technology-City of San Fernando (Pampanga)', 5),
(332, 'Colegio de San Juan de Letran-Abucay', 5),
(333, 'College of Subic Montessori-Subic Bay', 5),
(334, 'STI College-Baliuag', 5),
(335, 'ACLC College of Meycauayan', 5),
(336, 'Colegio De Calumpit', 5),
(337, 'Gerona Junior College', 5),
(338, 'Holy Rosary Colleges Foundation', 5),
(339, 'Our Lady of Manaoag Montessori College', 5),
(340, 'Philippine Rehabilitation Institute Foundation-Guagua', 5),
(341, 'Subic Bay Colleges', 5),
(342, 'Mater Redemptoris College of San Jose City', 5),
(343, 'Megabyte College of Science and Technology-Florida', 5),
(344, 'Bataan Peninsula State University-Balanga', 5),
(345, 'Bulacan Agricultural State College-Doña Remedios Trinidad', 5),
(346, 'Philippine Women`s University Career Development and Continuing Education Center-Bataan', 5),
(347, 'Centro Colegio De Tarlac', 5),
(348, 'Philippine Women`s University Career Development and Continuing Education Center - Tarlac', 5),
(349, 'La Verdad Christian College', 5),
(350, 'St. Benilde Center for Global Competence', 5),
(351, 'Marian College of Baliuag', 5),
(352, 'Mabalacat City College', 5),
(353, 'Norzagaray College', 5),
(354, 'Polytechnic College of the City of Meycauayan', 5),
(355, 'ACLC College of Balanga', 5),
(356, 'ACLC College-Baliuag', 5),
(357, 'Liceo de Pulilan Colleges', 5),
(358, 'Our Lady of Sacred Heart College of Guimba', 5),
(359, 'ACLC College of Apalit', 5),
(360, 'City College of San Fernando', 5),
(361, 'Baliwag Polytechnic College', 5),
(362, 'Polytechnic College of Botolan', 5),
(363, 'Pambayang Dalubhasaan ng Marilao', 5),
(364, 'Tarlac Christian Colleges', 5),
(365, 'New Era University-Pampanga', 5),
(366, 'Santa Rita College of Pampanga', 5),
(367, 'Lyceum of Western Luzon - Zambales', 5),
(368, 'SJDM Cornerstone College', 5),
(369, 'STI College San Jose', 5),
(370, 'Colegio de Sebastian-Pampanga', 5),
(371, 'Clark College of Science and Technology', 5),
(372, 'AMA Computer Learning Center College of Mabalacat', 5),
(373, 'College of the Our Lady of Mercy of Pulilan Foundation', 5),
(374, 'Guagua Community College', 5),
(375, 'Immaculate Conception I-College of Arts and Technology', 5),
(376, 'City College of Angeles', 5),
(377, 'Jocson College', 5),
(378, 'ACLC College of Sta. Maria', 5),
(379, 'Lyceum of the East-Aurora', 5),
(380, 'Bestlink College of the Philippines-Bulacan', 5),
(381, 'Bulacan Polytechnic College', 5),
(382, 'Erhard Science College-Bulacan', 5),
(383, 'Golden Valley Colleges', 5),
(384, 'Our Lady of Fatima University-Pampanga', 5),
(385, 'Colleges of Advance Technology and Management of the Philippines', 5),
(386, 'Exact Colleges of Asia', 5),
(387, 'St. Elizabeth Global Skills Institute', 5),
(388, 'St. Thomas More College-Clark', 5),
(389, 'Emmanuel System College of Bulacan', 5),
(390, 'Richwell Colleges', 5),
(391, 'College of Subic Montesorri-Dinalupihan', 5),
(392, 'ACLC College of Malolos', 5),
(393, 'University of Nueva Caceres-Bataan', 5),
(394, 'Golden Olympus College', 5),
(395, 'Virgen Milagrosa Del Rosario College Seminary', 5),
(396, 'OLRA College Foundation', 5),
(397, 'Asian Institute of Science and Technology-Central', 5),
(398, 'Javier E. Garde Essential Colleges', 5),
(399, 'College of Saint Anthony-SJDM Bulacan', 5),
(400, 'FDSA Aviation College of Science and Technology', 5),
(401, 'Mater Dei Academy - Sta. Maria', 5),
(402, 'Village Montessori School and Colleges', 5),
(403, 'Araullo University-San Jose Campus', 5),
(404, 'NU Bulacan', 5),
(405, 'City College of San Jose del Monte', 5),
(406, 'Don Honorio Ventura Technological State University-Lubao', 5),
(407, 'Nueva Ecija University of Science and Technology-Papaya', 5),
(408, 'Nueva Ecija University of Science and Technology-Sto. Domingo', 5),
(409, 'Kinect Academy', 5),
(410, 'Sacred Heart Academy of Sta. Maria Bulacan', 5),
(411, 'Don Honorio Ventura Technological State University-Apalit', 5),
(412, 'Don Honorio Ventura Technological State University-Candaba', 5),
(413, 'Marymount Professional Colleges', 5),
(414, 'Gapan City College', 5),
(415, 'University of the Philippines- Manila School of Health Sciences Extension Campus-Baler', 5),
(416, 'University of the Philippines- Manila School of Health Sciences Extension Campus-Tarlac', 5),
(417, 'West Central College of Arts and Sciences', 5),
(418, 'Aurora State College of Technology', 5),
(419, 'Aurora State College of Technology-Bazal', 5),
(420, 'Aurora State College of Techonolgy-Casiguran', 5),
(421, 'Mount Carmel College-Baler', 5),
(422, 'Wesleyan University-Philippines-Aurora', 5),
(423, 'Philippine Merchant Marine Academy', 5),
(424, 'Polytechnic University of The Philippines-Pulilan', 5),
(425, 'Polytechnic University of the Philippines-Sta. Maria Bulacan', 5),
(426, 'Polytechnic University of the Philippines-Cabiao', 5),
(427, 'University of the Philippines-Diliman (Pampanga)', 5),
(428, 'University of the Philippines-Diliman (Olongapo City)', 5),
(429, 'STI College - San Jose del Monte', 5),
(430, 'Asia Pacific College of Business and Arts Inc.', 5),
(431, 'ACTS Computer College', 5),
(432, 'Batangas State University-Nasugbu', 5),
(433, 'Asia-Pacific Nazarene Theological Seminary', 5),
(434, 'Balian Community College', 5),
(435, 'Calauag Central College', 5),
(436, 'Canossa College - San Pablo ', 5),
(437, 'Private', 5),
(438, 'Cavite State University-Rosario Campus', 5),
(439, 'Cavite State University-Naic Campus', 5),
(440, 'Colegio de Los Baños', 5),
(441, 'Colegio De San Juan De Letran-Calamba', 5),
(442, 'De La Salle Lipa', 5),
(443, 'Deaf Evangelistic Alliance Foundation', 5),
(444, 'Divine Word Seminary', 5),
(445, 'De La Salle University-Dasmariñas', 5),
(446, 'De La Salle Health Sciences Institute', 5),
(447, 'Don Bosco College', 5),
(448, 'Cavite State University-Main', 5),
(449, 'Paete Science and Business College', 5),
(450, 'Eastern Quezon College', 5),
(451, 'Golden Gate Colleges', 5),
(452, 'Harris Memorial College', 5),
(453, 'Immaculate Conception College of Balayan', 5),
(454, 'Imus Institute of Science and Technology', 5),
(455, 'ICCT Colleges-Cainta', 5),
(456, 'Dr. Francisco L. Calingasan Memorial Colleges Foundation', 5),
(457, 'Laguna College', 5),
(458, 'Laguna State Polytechnic University-Sta. Cruz', 5),
(459, 'Laguna College of Business and Arts', 5),
(460, 'Laguna Northwestern College', 5),
(461, 'Laguna State Polytechnic University-Main', 5),
(462, 'Leon Guinto Memorial College', 5),
(463, 'Lipa City Colleges', 5),
(464, 'Laguna State Polytechnic University-Los Baños', 5),
(465, 'Lyceum of the Philippines University-Batangas', 5),
(466, 'Manuel S. Enverga University Foundation-Lucena', 5),
(467, 'Marcelino Fule Memorial College', 5),
(468, 'Calayan Educational Foundation', 5),
(469, 'Manuel S. Enverga University Foundation-Candelaria', 5),
(470, 'Manuel S. Enverga University Foundation-Catanauan', 5),
(471, 'National College of Business and Arts-Taytay', 5),
(472, 'Northern Quezon College', 5),
(473, 'Our Lady of Lourdes Seminary', 5),
(474, 'Batangas State University-Main', 5),
(475, 'Batangas State University-Balayan', 5),
(476, 'Batangas State University-Lipa City', 5),
(477, 'Batangas State University-Lobo', 5),
(478, 'Batangas State University-Rosario', 5),
(479, 'Batangas State University-San Juan', 5),
(480, 'University of Perpetual Help System-Laguna', 5),
(481, 'University of Perpetual Help System-Dr. Jose G. Tamayo Medical University', 5),
(482, 'Adventist University of the Philippines', 5),
(483, 'Philippine Normal University-Lopez', 5),
(484, 'PTS College and Advanced Studies', 5),
(485, 'Philippine State College of Aeronautics-Fernando Air Base', 5),
(486, 'Polytechnic University of the Philippines-Lopez', 5),
(487, 'Polytechnic University of the Philippines-Maragondon', 5),
(488, 'Polytechnic University of the Philippines-Unisan', 5),
(489, 'Quezonian Educational College', 5),
(490, 'Rizal College of Taal', 5),
(491, 'University of Rizal System-Tanay', 5),
(492, 'Rizal College of Laguna', 5),
(493, 'University of Rizal System-Morong', 5),
(494, 'FEU Roosevelt', 5),
(495, 'Sacred Heart College', 5),
(496, 'St. Anne College Lucena', 5),
(497, 'St. Bridget College', 5),
(498, 'St. Francis de Sales Major Seminary', 5),
(499, 'St. Joseph College of Cavite', 5),
(500, 'St. Louis Anne Colleges of San Pedro', 5),
(501, 'Saint Michael\'s College of Laguna', 5),
(502, 'Saint Paul Seminary', 5),
(503, 'St. Peter\'s College Seminary', 5),
(504, 'San Antonio de Padua College', 5),
(505, 'San Ildefonso College', 5),
(506, 'Laguna State Polytechnic University-San Pablo City', 5),
(507, 'San Pablo Colleges', 5),
(508, 'San Pedro College of Business Administration', 5),
(509, 'San Sebastian College-Recoletos de Cavite', 5),
(510, 'Siena College of Taytay', 5),
(511, 'Southeast Asia Interdisciplinary Development Institute', 5),
(512, 'Southern Luzon State University', 5),
(513, 'Tanauan Institute', 5),
(514, 'Tayabas Western Academy', 5),
(515, 'Tomas Claudio Colleges', 5),
(516, 'Technological University of the Philippines-Cavite', 5),
(517, 'Unciano Colleges', 5),
(518, 'Union College of Laguna', 5),
(519, 'University of the Philippines-Los Baños', 5),
(520, 'Western Colleges', 5),
(521, 'University of Batangas', 5),
(522, 'University of the Philippines-Open University', 5),
(523, 'STI College-Lucena', 5),
(524, 'University of Perpetual Help System Dalta-Molino ', 5),
(525, 'STI College-San Pablo', 5),
(526, 'STI College Calamba', 5),
(527, 'Dominican College of Sta. Rosa', 5),
(528, 'Kolehiyo ng Lungsod ng Lipa', 5),
(529, 'Saints John and Paul Educational Foundation', 5),
(530, 'Sta. Teresa College', 5),
(531, 'STI College-Bacoor', 5),
(532, 'STI College-Batangas', 5),
(533, 'STI College-Sta. Cruz', 5),
(534, 'STI College-Lipa', 5),
(535, 'Trace College', 5),
(536, 'Batangas State University-Malvar', 5),
(537, 'STI College Carmona', 5),
(538, 'AMA Computer College-Biñan', 5),
(539, 'Colegio De San Pedro', 5),
(540, 'La Consolacion College-Biñan', 5),
(541, 'Laguna Science and Technology College', 5),
(542, 'Mt. St. Aloysius Seminary', 5),
(543, 'Cainta Catholic College', 5),
(544, 'STI College Ortigas-Cainta', 5),
(545, 'Maryhill College', 5),
(546, 'Polytechnic University of the Philippines-Sto. Tomas', 5),
(547, 'Polytechnic University of the Philippines-Mulanay', 5),
(548, 'University of Perpetual Help System-GMA', 5),
(549, 'Philippine Missionary Institute', 5),
(550, 'Lemery Colleges', 5),
(551, 'AMA Computer College-Sta.Cruz', 5),
(552, 'Colegio San Agustin-Biñan', 5),
(553, 'AMA Computer College-East Rizal', 5),
(554, 'Oblates of Saint Joseph College of Philosophy', 5),
(555, 'Inter-Global College Foundation', 5),
(556, 'University of Perpetual Help System Dalta-Calamba', 5),
(557, 'Dalubhasaan ng Lungsod ng San Pablo', 5),
(558, 'St. Alphonsus School of Theology', 5),
(559, 'IETI College of Science and Technology', 5),
(560, 'Philippine National Police Academy', 5),
(561, 'Adventist International Institute of Advanced Studies', 5),
(562, 'Binangonan Catholic College', 5),
(563, 'AMA College-Cavite', 5),
(564, 'AMA Computer College-Batangas City', 5),
(565, 'Southern Luzon State University-Tagkawayan', 5),
(566, 'Emilio Aguinaldo College', 5),
(567, 'Alitagtag College', 5),
(568, 'AMA Computer College-Lipa City', 5),
(569, 'National College of Science and Technology (NCST) ', 5),
(570, 'University of Rizal System-Angono', 5),
(571, 'University of Rizal System-Pililia', 5),
(572, 'University of Rizal System-Rodriguez', 5),
(573, 'Rogationist College', 5),
(574, 'Southern Luzon State University-Infanta', 5),
(575, 'St. John Colleges', 5),
(576, 'Southern Luzon State University-Alabat', 5),
(577, 'Southern Luzon State University-Lucena', 5),
(578, 'Southern Luzon State University-Polilio', 5),
(579, 'AMA Computer College-Calamba', 5),
(580, 'AMA Computer College-Lucena', 5),
(581, 'Cavite West Point College', 5),
(582, 'Our Lady of Assumption College of Laguna', 5),
(583, 'Southern Philippines Institute of Science and Technology', 5),
(584, 'St. Matthew College', 5),
(585, 'World Citi Colleges-Antipolo City', 5),
(586, 'University of Rizal System-Binangonan', 5),
(587, 'ABE International Business College-Cainta', 5),
(588, 'First Asia Institute of Technology and Humanities', 5),
(589, 'Holy Child Jesus College', 5),
(590, 'Lyceum of the Philippines-Laguna', 5),
(591, 'St. Jude College Dasmarifias Cavite', 5),
(592, 'Saint Francis Institute of Computer Studies', 5),
(593, 'Cavite State University-Cavite City Campus', 5),
(594, 'LPU-St. Cabrini School of Health Sciences', 5),
(595, 'Baptist Bible Seminary and Institute', 5),
(596, 'Baptist Voice Bible College', 5),
(597, 'Calamba Doctors\' College', 5),
(598, 'LNC Corinthian Center', 5),
(599, 'STI College-Rosario', 5),
(600, 'Unida Christian Colleges', 5),
(601, 'Dalubhasaan ng Lungsod ng Lucena', 5),
(602, 'Casa Del Niño College', 5),
(603, 'Mabini College of Batangas', 5),
(604, 'STI College-Balayan', 5),
(605, 'STI College Santa Rosa', 5),
(606, 'University of Rizal System-Cainta', 5),
(607, 'University of Rizal System-Cardona', 5),
(608, 'University of Rizal System-Antipolo', 5),
(609, 'La Consolacion College-Tanauan', 5),
(610, 'DMMC Institute of Health Sciences', 5),
(611, 'Saint Francis of Assisi College-Cavite', 5),
(612, 'Olivarez College-Tagaytay', 5),
(613, 'St. Dominic College of Asia', 5),
(614, 'Power School of Technology', 5),
(615, 'PVVU CDCEC Calamba', 5),
(616, 'Pamantasan ng Cabuyao', 5),
(617, 'Our Lady of the Most Holy Rosary Seminary', 5),
(618, 'Batangas Eastern Colleges', 5),
(619, 'Batangas State University-Lemery', 5),
(620, 'Cavite State University-Carmona Campus', 5),
(621, 'Cavite State University-Imus Campus', 5),
(622, 'Ebenezer International Colleges', 5),
(623, 'Southdale International School of Science Arts and Techology', 5),
(624, 'ISHRM School System-Bacoor', 5),
(625, 'STI College-Dasmariñas', 5),
(626, 'QCRS College', 5),
(627, 'St. Francis de Sales Theological Seminary', 5),
(628, 'Gardner College Cainta', 5),
(629, 'PNTC Colleges', 5),
(630, 'International Peace Leadership College', 5),
(631, 'STI College-Tanauan', 5),
(632, 'Philippine Women\'s University-Career Development and Continuing Education Center-Sta. Cruz', 5),
(633, 'Manuel S. Enverga Institute Foundation-San Antonio', 5),
(634, 'All Nations College', 5),
(635, 'International Christian College of Manila', 5),
(636, 'Philippine International College', 5),
(637, 'Teodoro M. Luansing College of Rosario', 5),
(638, 'Colegio de Montalban', 5),
(639, 'Pambayang Kolehiyo ng Mauban', 5),
(640, 'Cavite State University-Trece Martires City Campus', 5),
(641, 'Our Lady of Assumption College-Cabuyao', 5),
(642, 'Skill Power Institute', 5),
(643, 'Oxfordian Colleges', 5),
(644, 'CVE Colleges', 5),
(645, 'City College of Calamba', 5),
(646, 'San Sebastian College Recoletos-Canlubang', 5),
(647, 'Laguna University', 5),
(648, 'Colegio ng Lungsod ng Batangas', 5),
(649, 'Westmead International School', 5),
(650, 'Agoncillo College', 5),
(651, 'Cavite State University-Silang Campus', 5),
(652, 'Batangas State University-Alangilan', 5),
(653, 'Colegio de Amore', 5),
(654, 'Far Eastern Polytechnic College', 5),
(655, 'Immanuel Theological Seminary', 5),
(656, 'Batangas College of Arts and Sciences', 5),
(657, 'University of Rizal System-Taytay', 5),
(658, 'Southern Luzon State University-Tiaong Campus', 5),
(659, 'Malayan Colleges of Laguna', 5),
(660, 'City College of Tagaytay', 5),
(661, 'NYK-TDG Maritime Academy', 5),
(662, 'Brookfield College in Cavite', 5),
(663, 'Sumulong College of Arts & Sciences (SCAS)', 5),
(664, 'St. Vincent College of Cabuyao', 5),
(665, 'Our Lady of Fatima University-Antipolo', 5),
(666, 'STI College-Tanay', 5),
(667, 'Lyceum of the Philippines-Cavite', 5),
(668, 'Asian Institute of Technology and Education-Tiaong Campus', 5),
(669, 'Cavite State University-Tanza Campus', 5),
(670, 'Cavite State University-Bacoor City Campus', 5),
(671, 'Cavite State University-General Trias Campus', 5),
(672, 'San Mateo Municipal College', 5),
(673, 'Philippine Best Training Systems Colleges', 5),
(674, 'St. Joseph\'s College of Rodriguez', 5),
(675, 'Trece Martires City College', 5),
(676, 'Southern Luzon State University-Gumaca Campus', 5),
(677, 'Colegio de Porta Vaga', 5),
(678, 'STI College-Tagaytay', 5),
(679, 'Colegio de Santo Cristo de Burgos', 5),
(680, 'East Systems College of Rizal', 5),
(681, 'Alpha Centauri Educational System', 5),
(682, 'Asian School of Hospitality Arts', 5),
(683, 'Laguna Northwestern College-SLRMC', 5),
(684, 'FEU Cavite', 5),
(685, 'Trimex Colleges', 5),
(686, 'Granby Colleges of Science & Technology', 5),
(687, 'Kurios Christian Colleges Foundation', 5),
(688, 'ABE International Business College-Quezon', 5),
(689, 'Acts Computer College-Infanta', 5),
(690, 'Asia-Pacific Christian College and Seminary', 5),
(691, 'Asia Technological School of Science and Arts (ASIATECH)', 5),
(692, 'CSTC College of Sciences Technology and Communications-Sariaya', 5),
(693, 'Evangelical Theological College of the Philippines-Luzon', 5),
(694, 'Guinayangan College Foundation', 5),
(695, 'ICCT Colleges-Antipolo', 5),
(696, 'ICCT Colleges-San Mateo', 5),
(697, 'Jesus Reigns Christian College-Amadeo Foundation', 5),
(698, 'Laguna Maritime Arts and Business Colleges', 5),
(699, 'Mary Help of Christian College Salesian Sisters', 5),
(700, 'PIMSAT Colleges-Bacoor', 5),
(701, 'South Forbes City College', 5),
(702, 'The Bearer of Light and Wisdom Colleges', 5),
(703, 'University of Batangas-Lipa', 5),
(704, 'West Point College-Magallanes', 5),
(705, 'Young Ji College', 5),
(706, 'Southern Luzon State University-Catanauan', 5),
(707, 'ACLC College of Taytay', 5),
(708, 'College of Arts and Sciences of Asia and the Pacific', 5),
(709, 'New Sinai School and Colleges-Sta. Rosa', 5),
(710, 'St. Mary Magdalene Colleges of Laguna', 5),
(711, 'BWEST College', 5),
(712, 'Center for Biblical Studies Institute & Seminary', 5),
(713, 'Grain of Wheat College', 5),
(714, 'ICT-ED Institute of Science and Technology', 5),
(715, 'ICCT Colleges-Binangonan', 5),
(716, 'ICCT Colleges-Taytay', 5),
(717, 'Mater Redemptoris Collegium', 5),
(718, 'Mind and Integrity College', 5),
(719, 'College of Saint John Paul II Arts And Sciences', 5),
(720, 'St. Augustine School of Nursing-Lipa', 5),
(721, 'Paul College of Leadership', 5),
(722, 'ACLC College of San Pablo', 5),
(723, 'Citi Global College-Biñan', 5),
(724, 'Far East Asia Pacific Institute of Tourism Science and Technology', 5),
(725, 'Guardian Bona Fide for Hope Foundation', 5),
(726, 'St. Augustine School of Nursing - Lucena', 5),
(727, 'Nova Schola Tanauan', 5),
(728, 'Daehan College of Business and Technology', 5),
(729, 'Citi Global College-Cabuyao', 5),
(730, 'New Era University - Lipa Campus', 5),
(731, 'Saint Joseph College of Rosario Batangas', 5),
(732, 'CARD-MRI Development Institute', 5),
(733, 'Colegio de Sto. Domingo de Silos', 5),
(734, 'Our Lady of La Sallete College Seminary', 5),
(735, 'Antipolo Institute of Technology (AITECH) ', 5),
(736, 'Marasigan Institute of Science and Technology (M.I.S.T.) ', 5),
(737, 'Renaissance School of Science and Technology', 5),
(738, 'Tanauan City College', 5),
(739, 'Grabsum School', 5),
(740, 'Royal British College', 5),
(741, 'Sapphire International Aviation Academy', 5),
(742, 'Southbay Montessori School and Colleges', 5),
(743, 'St. Ignatius Technical Institute of Business and Arts', 5),
(744, 'Westbridge Institute of Technology', 5),
(745, 'AISAT College-Dasmariñas', 5),
(746, 'Lyceum de San Pablo', 5),
(747, 'MOL Magsaysay Maritime Academy', 5),
(748, 'Southern Luzon College of Business Maritime Science and Technology', 5),
(749, 'One Cainta College', 5),
(750, 'Informatics College Cavite', 5),
(751, 'New Era University-Baras Campus', 5),
(752, 'NU Sports Academy', 5),
(753, 'Olinsterg College', 5),
(754, 'Our Lady of Fatima University-Laguna', 5),
(755, 'Red Link Institute of Science & Technology', 5),
(756, 'Saint Peter\'s School (Calauag)', 5),
(757, 'CSTC College of Sciences Technology and Communications-Atimonan', 5),
(758, 'De La Salle-College of Saint Benilde-Antipolo', 5),
(759, 'Saint Benilde International School-Calamba', 5),
(760, 'St. Ignatius Technical Institute of Business and Arts-Cabuyao', 5),
(761, 'St. Therese College of Arts and Sciences', 5),
(762, 'Victory Elijah Christian College', 5),
(763, 'FCD Central Institute', 5),
(764, 'Magna Anima Teachers College', 5),
(765, 'St. John Bosco College of Tayabas', 5),
(766, 'Kolehiyo ng Lungsod ng Dasmariñas', 5),
(767, 'Colegio de La Ciudad de Tayabas', 5),
(768, 'First Industrial Science and Technology College', 5),
(769, 'Lyceum of Southern Luzon', 5),
(770, 'NU Dasmariñas', 5),
(771, 'Philippine Technological Institute of Science Arts and Trade-Central', 5),
(772, 'Samuel Christian College of General Trias', 5),
(773, 'St. Peregrine Institute', 5),
(774, 'CITI Global College-Calamba', 5),
(775, 'Manuel S. Enverga University Foundation-Calauag', 5),
(776, 'Eastern Star Academy', 5),
(777, 'Batangas State University-Mabini', 5),
(778, 'Southern Luzon State University-Tayabas', 5),
(779, 'Asian Seminary of Christian Ministries', 5),
(780, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology-Cavite', 5),
(781, 'Polytechnic University of the Philippines-San Pedro', 5),
(782, 'Polytechnic University of the Philippines-Sta. Rosa', 5),
(783, 'Polytechnic University of the Philippines-Calauan', 5),
(784, 'Polytechnic University of the Philippines-Biñan', 5),
(785, 'Polytechnic University of the Philippines-General Luna Quezon', 5),
(786, 'Polytechnic University of the Philippines-Alfonso', 5),
(787, 'Guang Ming College', 5),
(788, 'NU Lipa', 5),
(789, 'St. Ignatius Technical Institute of Business and Arts-Biñan', 5),
(790, 'Trent Information First Technical Career Institute', 5),
(791, 'Cavite Integrated College', 5),
(792, 'Angono Catholic College', 5),
(793, 'Aemilianum College', 5),
(794, 'Ago Medical and Educational Center', 5),
(795, 'Bicol Christian College of Medicine', 5),
(796, 'De Vera Institute of Technology', 5),
(797, 'Annunciation College of Bacon Sorsogon Unit', 5),
(798, 'University of Santo Tomas-Legazpi', 5),
(799, 'Ateneo de Naga University', 5),
(800, 'Bicol College', 5),
(801, 'Bicol State College of Applied Sciences and Technology', 5),
(802, 'Central Bicol State University of Agriculture-Sipocot', 5),
(803, 'Bicol Merchant Marine College', 5),
(804, 'Bicol University-Main', 5),
(805, 'Bicol University-Daraga Campus', 5),
(806, 'Bicol University-College of Agriculture and Forestry', 5),
(807, 'Bicol University-Tabaco Campus', 5),
(808, 'Camarines Norte College', 5),
(809, 'Camarines Norte State College-Main', 5),
(810, 'City College of Naga', 5),
(811, 'Camarines Sur Polytechnic Colleges', 5),
(812, 'Central Bicol State University of Agriculture-Main', 5),
(813, 'Caramoan Community College', 5),
(814, 'Cataingan Municipal College', 5),
(815, 'Catanduanes State University-Panganiban', 5),
(816, 'Catanduanes Colleges', 5),
(817, 'Catanduanes State University-Main', 5),
(818, 'Ceguera Technological Colleges', 5),
(819, 'St. Louise De Marillac College of Sorsogon', 5),
(820, 'Universidad de Sta. Isabel', 5),
(821, 'Computer Arts and Technological College', 5),
(822, 'Computer Communication Development Institute-Naga', 5),
(823, 'Daniel B. Peña Memorial College Foundation', 5),
(824, 'Divine Word College of Legazpi', 5),
(825, 'Dr. Emilio B. Espinosa Sr. Memorial State College of Agriculture and Technology', 5),
(826, 'Felix O. Alfelor Sr. Foundation College', 5),
(827, 'Alfelor Sr. Memorial College', 5),
(828, 'Fatima School of Science and Technology', 5),
(829, 'Holy Rosary Major Seminary', 5),
(830, 'Holy Trinity College of Camarines Sur', 5),
(831, 'Immaculate Conception College-Albay', 5),
(832, 'La Consolacion College-Iriga City', 5),
(833, 'La Consolacion College-Daet', 5),
(834, 'Liceo de Masbate', 5),
(835, 'Liceo de San Jacinto Foundation', 5),
(836, 'Ligao Community College', 5),
(837, 'Mabini Colleges', 5),
(838, 'Mariners\' Polytechnic Colleges Foundation of Canaman', 5),
(839, 'Mariners\' Polytechnic Colleges Foundation of Naga City', 5),
(840, 'Mariners\' Polytechnic Colleges Foundation of Legazpi City', 5),
(841, 'Masbate Colleges', 5),
(842, 'Mater Salutis College Seminary', 5),
(843, 'Naga College Foundation', 5),
(844, 'Osmeña Colleges', 5),
(845, 'Our Lady of Lourdes College Foundation', 5),
(846, 'Our Lady of Peñafrancia Seminary', 5),
(847, 'Partido College', 5),
(848, 'Partido State University-Main', 5),
(849, 'Perpetual Help Paramedical School', 5),
(850, 'Pili Capital College', 5),
(851, 'Polangui Community College', 5),
(852, 'Polytechnic Institute of Tabaco', 5),
(853, 'Naga View Adventist College', 5),
(854, 'R.G. de Castro Colleges', 5),
(855, 'Republic Colleges of Guinobatan', 5),
(856, 'San Jose Community College', 5),
(857, 'Bicol University-Polangui Campus', 5),
(858, 'Sorsogon State University-Main', 5),
(859, 'Southern Bicol Colleges', 5),
(860, 'Southern Luzon Institute', 5),
(861, 'Southern Masbate Roosevelt College', 5),
(862, 'Tabaco College', 5),
(863, 'Tanchuling College', 5),
(864, 'University of Northeastern Philippines', 5),
(865, 'University of Nueva Caceres', 5),
(866, 'University of Saint Anthony', 5),
(867, 'Veritas College of Irosin', 5),
(868, 'Worldtech Resources Foundation-Naga City', 5),
(869, 'Worldtech Resources Foundation-Iriga City', 5),
(870, 'Camarines Norte State College-Labo Campus', 5),
(871, 'Camarines Norte State College-Mercedes Campus', 5),
(872, 'Camarines Norte State College-Panganiban Campus', 5),
(873, 'Central Bicol State University of Agriculture-Calabanga', 5),
(874, 'STI College-Legazpi', 5),
(875, 'Partido State University-Sagñay Campus', 5),
(876, 'Lower Isarog Foundation Exponent', 5),
(877, 'Partido State University-San Jose Campus', 5),
(878, 'Sorsogon State University-Bulan Campus', 5),
(879, 'Sorsogon State University-Magallanes Campus', 5),
(880, 'Sorsogon State University-Castilla Campus', 5),
(881, 'Speed Computer College', 5),
(882, 'Partido State University-Tinambac Campus', 5),
(883, 'Tiwi Community College', 5),
(884, 'Zamora Memorial College', 5),
(885, 'Colegio De Sta. Monica of Polangui', 5),
(886, 'Computer Communication Development Institute-Legazpi City', 5),
(887, 'Rapu-Rapu Community College', 5),
(888, 'Sorsogon College of Criminology', 5),
(889, 'St. Peter Baptist College Foundation', 5),
(890, 'AMA Computer College-Legazpi City', 5),
(891, 'Dr. Carlos S. Lanting College-Dr. Ruby Lanting Casaul Educational Foundation', 5),
(892, 'PLT College of Guinobatan', 5),
(893, 'Holy Trinity College Seminary', 5),
(894, 'AMA Computer College-Naga City', 5),
(895, 'Camarines Norte School of Law Arts and Sciences', 5),
(896, 'Solis Institute of Technology', 5),
(897, 'The Lewis College', 5),
(898, 'West Coast College', 5),
(899, 'Oas Community College', 5),
(900, 'Libon Community College', 5),
(901, 'Sta. Elena (Camarines Norte) College', 5),
(902, 'Baao Community College', 5),
(903, 'Brentwood College of Asia International School', 5),
(904, 'Partido State University-Salogon Campus', 5),
(905, 'Partido State University-Caramoan Campus', 5),
(906, 'Partido State University-Lagonoy Campus', 5),
(907, 'Calabanga Community College', 5),
(908, 'Capalonga College', 5),
(909, 'Southern Luzon Technological College Foundation-Legazpi', 5),
(910, 'Our Lady of Salvation College', 5),
(911, 'Daraga Community College', 5),
(912, 'Aeronautical Academy of the Philippines', 5),
(913, 'Computer Communication Development Institute-Sorsogon', 5),
(914, 'Amando Cope College', 5),
(915, 'Luis H. Dilanco Sr. Foundation College', 5),
(916, 'Regina Mondi College', 5),
(917, 'Siena College-Tigaon', 5),
(918, 'Balud Municipal College', 5),
(919, 'Camarines Norte State College-Entienza Campus', 5),
(920, 'Estenias Science Foundation School', 5),
(921, 'Our Lady of the Most Holy Trinity College Seminary', 5),
(922, 'Christian Polytechnic Institute of Catanduanes', 5),
(923, 'Community College of Manito', 5),
(924, 'Forbes College', 5),
(925, 'Bicol University Gubat Campus', 5),
(926, 'Shepherdville College', 5),
(927, 'ACLC College of Daet', 5),
(928, 'ACLC College of Sorsogon', 5),
(929, 'STI College-Naga City', 5),
(930, 'Infotech Development Systems Colleges', 5),
(931, 'Southern Luzon Technological College Foundation-Pilar', 5),
(932, 'Southern Luzon Technological College Foundation-Pioduran', 5),
(933, 'Philippine Computer Foundation College-Pili', 5),
(934, 'Central Bicol State University of Agriculture-Pasacao', 5),
(935, 'Belen B. Francisco Foundation-Albay', 5),
(936, 'Camarines Norte College of Arts and Business', 5),
(937, 'ACLC College of Iriga City', 5),
(938, 'Computer Arts and Technological College-Polangui Campus', 5),
(939, 'Computer Arts and Technological College-Ligao City', 5),
(940, 'Mountview College', 5),
(941, 'Aroroy Municipal College', 5),
(942, 'Computer Systems Institute', 5),
(943, 'SPJ International Technology Institute', 5),
(944, 'Cataingan Polytechnic Institute', 5),
(945, 'Masbate Polytechnic and Development College', 5),
(946, 'Donsol Community College', 5),
(947, 'San Pascual Polytechnic College', 5),
(948, 'Masbate Central Technical Institute', 5),
(949, 'Camarines Norte State College-Abaño Campus', 5),
(950, 'Bicol Training and Technological College', 5),
(951, 'St. Francis Carraciolo Culinary Academy', 5),
(952, 'Governor Mariano E. Villafuerte Community College-Garchitorena', 5),
(953, 'Governor Mariano E. Villafuerte Community College-Libmanan', 5),
(954, 'Governor Mariano E. Villafuerte Community College-Siruma', 5),
(955, 'BST Grace College', 5),
(956, 'Governor Mariano E. Villafuerte Community College-Tinambac', 5),
(957, 'Sta. Elena Institute of Science and Technology', 5),
(958, 'Lyceum of St. Dominic', 5),
(959, 'Northills College of Asia (NCA)', 5),
(960, 'King Thomas Learning Academy', 5),
(961, 'Buhi St. Joseph Academy', 5),
(962, 'Polytechnic University of the Philippines-Ragay', 5),
(963, 'Goa Community College', 5),
(964, 'MRDA Academic Center', 5),
(965, 'Nazareth Institute of Alfonso', 5),
(966, 'Camo Integrated School', 5),
(967, 'Aklan Catholic College', 5),
(968, 'Aklan State University-New Washington', 5),
(969, 'Aklan Polytechnic College', 5),
(970, 'Aklan State University-Banga Campus', 5),
(971, 'University of Antique - Hamtic', 5),
(972, 'ACSI College Iloilo', 5),
(973, 'Bago City College', 5),
(974, 'Northern Iloilo State University-Batad Campus', 5),
(975, 'Binalbagan Catholic College', 5),
(976, 'Cabalum Western College', 5),
(977, 'Cabarrus Catholic College', 5),
(978, 'West Visayas State University-Calinog Campus', 5),
(979, 'Capiz State University-Main', 5),
(980, 'Carlos Hilado Memorial State University-Bacolod Campus', 5),
(981, 'Carlos Hilado Memorial State University-Main', 5),
(982, 'Central Philippine Adventist College', 5),
(983, 'Central Philippine University', 5),
(984, 'Colegio de la Purisima Concepcion', 5),
(985, 'Colegio San Agustin-Bacolod', 5),
(986, 'Colegio de San Jose-Jaro', 5),
(987, 'Colegio De Santa Rita De San Carlos', 5),
(988, 'Colegio del Sagrado Corazon de Jesus', 5),
(989, 'Northern Iloilo State University-Concepcion Campus', 5),
(990, 'Vicente A. Javier Memorial Community College', 5),
(991, 'Iloilo State College of Fisheries-Dingle Campus', 5),
(992, 'Iloilo State college of Fisheries-Dumangas Campus', 5),
(993, 'Fellowship Baptist College Of Kabankalan', 5),
(994, 'Filamer Christian University', 5),
(995, 'Garcia College of Technology', 5),
(996, 'Guimaras State College-Main', 5),
(997, 'Guimaras State College-Mosqueda', 5),
(998, 'Iloilo Doctors\' College', 5),
(999, 'Iloilo Doctors\' College of Medicine', 5),
(1000, 'Iloilo State College of Fisheries-Main', 5),
(1001, 'Northern Negros State College of Science and Technology', 5),
(1002, 'Northern Negros State College of Science and Technology-Escalante', 5),
(1003, 'Northern Negros State College of Science and Technology-Calatrava', 5),
(1004, 'John B. Lacson Colleges Foundation-Bacolod', 5),
(1005, 'John B. Lacson Foundation Maritime University-Molo', 5),
(1006, 'John B. Lacson Foundation Maritime University-Arevalo', 5),
(1007, 'Kabankalan Catholic College', 5),
(1008, 'La Carlota City College', 5),
(1009, 'La Consolacion College-Bacolod', 5),
(1010, 'La Consolacion College-Isabela', 5),
(1011, 'West Visayas State University-Lambunao Campus', 5),
(1012, 'Iloilo Science and Technology University-Leon Campus', 5),
(1013, 'Mount Carmel College', 5),
(1014, 'St. Therese-MTC Colleges-Tigbauan', 5),
(1015, 'Central Philippines State University-Main Campus', 5),
(1016, 'Carlos Hilado Memorial State Universit -College of Fisheries-Binalbagan', 5),
(1017, 'Northern Iloilo State University-Barotac Viejo Campus', 5),
(1018, 'North Negros College', 5),
(1019, 'Northern Iloilo State University-Estancia Iloilo', 5),
(1020, 'Northwestern Visayan Colleges', 5),
(1021, 'Capiz State University-Burias Campus', 5),
(1022, 'Philippine Normal University-Cadiz', 5),
(1023, 'University of Antique - Main', 5),
(1024, 'West Visayas State University-Pototan Campus', 5),
(1025, 'Capiz State University-Pontevedra Campus', 5),
(1026, 'Riverside College', 5),
(1027, 'Aklan State University-Kalibo Campus', 5),
(1028, 'St. Anthony College of Roxas City', 5),
(1029, 'Saint Anthony\'s College-Antique', 5),
(1030, 'Saint Gabriel College', 5),
(1031, 'St. Paul University of Iloilo', 5),
(1032, 'St. Vincent Ferrer Seminary', 5),
(1033, 'Iloilo State College of Fisheries-San Enrique Campus', 5),
(1034, 'Sancta Maria Mater et Regina Seminarium', 5),
(1035, 'Silay Institute', 5),
(1036, 'Iloilo Science and Technology University-Miagao Campus', 5),
(1037, 'Santo Niño Seminary', 5),
(1038, 'University of Antique - Tario Lim Antique School of Fisheries', 5),
(1039, 'Technological University of the Philippines-Visayas', 5),
(1040, 'University of Iloilo', 5),
(1041, 'University of Negros Occidental-Recoletos', 5),
(1042, 'University of Saint La Salle', 5),
(1043, 'University of San Agustin', 5),
(1044, 'University of The Philippines-Visayas', 5),
(1045, 'Northern Iloilo State University-Sara Campus', 5),
(1046, 'VMA Global College', 5),
(1047, 'STI West Negros University', 5),
(1048, 'West Visayas State University-Main', 5),
(1049, 'Western Institute of Technology', 5),
(1050, 'Iloilo Science and Technology University-Main', 5),
(1051, 'West Visayas State University-Janiuay Campus', 5),
(1052, 'Northern Iloilo State University-Lemery Campus', 5),
(1053, 'Iloilo State College of Fisheries-Barotac Nuevo Campus', 5),
(1054, 'Northern Iloilo State University-Ajuy Campus', 5),
(1055, 'Capiz State University-Sigma Campus', 5),
(1056, 'Aklan State University-Ibajay Campus', 5),
(1057, 'Aklan State University-Makato', 5),
(1058, 'Pandan Bay Institute', 5),
(1059, 'Batan Integrated College of Technology', 5),
(1060, 'Bacolod City College', 5),
(1061, 'Tañon College', 5),
(1062, 'AMA Computer College-Bacolod', 5),
(1063, 'AMA Computer College-Iloilo', 5),
(1064, 'Interface Computer College-Iloilo', 5),
(1065, 'College of St. John-Roxas', 5),
(1066, 'Mater Dei College-Silay City', 5),
(1067, 'St. Therese-MTC Colleges-La Fiesta', 5),
(1068, 'Carlos Hilado Memorial State University-Alijis', 5),
(1069, 'Iloilo Science and Technology University-Dumangas Campus', 5),
(1070, 'Iloilo Science and Technology University-Barotac Nuevo Campus', 5),
(1071, 'ABE International Business College-Bacolod City', 5),
(1072, 'Integrated Midwives Association of the Philippines Foundation School of Midwifery', 5),
(1073, 'Central Philippines State University-Cauayan Campus', 5);
INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`) VALUES
(1074, 'Central Philippines State University-Sipalay Campus', 5),
(1075, 'Capiz State University-Pilar Campus', 5),
(1076, 'Capiz State University-Tapaz Campus', 5),
(1077, 'St. Therese-MTC Colleges-Magdalo', 5),
(1078, 'ABE International Business College-Iloilo', 5),
(1079, 'Capiz State University-Dumarao Campus', 5),
(1080, 'Central Philippines State University-Ilog Campus', 5),
(1081, 'STI College-Kalibo', 5),
(1082, 'Convention Baptist Bible College', 5),
(1083, 'Hercor College', 5),
(1084, 'Libacao College of Science and Technology', 5),
(1085, 'Altavas College', 5),
(1086, 'Balete Community College', 5),
(1087, 'Passi City College', 5),
(1088, 'Capiz State University-Poblacion Mambusao', 5),
(1089, 'Capiz State University-Dayao', 5),
(1090, 'Sacred Heart Seminary (Bacolod) School', 5),
(1091, 'Saint John Mary Vianney Seminary College', 5),
(1092, 'Central Philippines State University-Moises Padilla Campus', 5),
(1093, 'Central Philippines State University-Hinoba-an Campus', 5),
(1094, 'Central Philippines State University-Candoni', 5),
(1095, 'St. Vincent College of Science and Technology', 5),
(1096, 'Southland College of Kabankalan City', 5),
(1097, 'CEDAR College', 5),
(1098, 'Advance Central College', 5),
(1099, 'GSEF College', 5),
(1100, 'West Visayas State University-College of Agriculture and Forestry Lambunao', 5),
(1101, 'West Visayas State University-Himamaylan Campus Extension', 5),
(1102, 'Central Philippines State University-Hinigaran Campus', 5),
(1103, 'ACLC College of Iloilo', 5),
(1104, 'Central Philippines State University - Victorias City Campus', 5),
(1105, 'Colegio de Sta. Ana de Victorias', 5),
(1106, 'Santa Isabel College of Iloilo City', 5),
(1107, 'Hua Siong College of Iloilo', 5),
(1108, 'Central Philippines State University - San Carlos Campus', 5),
(1109, 'Guimaras State College-Baterna Campus', 5),
(1110, 'Catholic Ming Yuan College', 5),
(1111, 'College of Arts and Sciences of Asia and the Pacific-Bacolod City', 5),
(1112, 'Philippine College of Business and Accountancy', 5),
(1113, 'St. Vincent College of Business and Accountancy', 5),
(1114, 'Iloilo City Community College', 5),
(1115, 'I-Tech College-Bago City', 5),
(1116, 'Iloilo Merchant Marine School', 5),
(1117, 'University of Perpetual Help System Laguna Pueblo de Panay Campus', 5),
(1118, 'Malay College', 5),
(1119, 'Baptist Missionary Association Bible College', 5),
(1120, 'Colegio de Sto. Tomas Recoletos', 5),
(1121, 'USAT College Sagay City', 5),
(1122, 'Green International Technological College', 5),
(1123, 'St. Joseph Regional Seminary Graduate School of Theology', 5),
(1124, 'AMA Computer College-Cebu City', 5),
(1125, 'Asian College of Technology', 5),
(1126, 'BIT International College - Siquijor', 5),
(1127, 'Baptist Theological College', 5),
(1128, 'Blessed Trinity College', 5),
(1129, 'BIT International College-Tagbilaran', 5),
(1130, 'Bohol Institute of Technology-Jagna', 5),
(1131, 'BIT International College-Talibon', 5),
(1132, 'Bohol Island State University - Tagbilaran', 5),
(1133, 'Bohol Island State University - Candijay', 5),
(1134, 'Bohol Island State University - Calape Polytechnic College', 5),
(1135, 'CATS Aero College', 5),
(1136, 'Cebu Doctor\'s University', 5),
(1137, 'Cebu Doctor\'s University College of Medicine', 5),
(1138, 'Cebu Eastern College', 5),
(1139, 'Cebu Institute of Medicine', 5),
(1140, 'Cebu Institute of Technology-University', 5),
(1141, 'Cebu Roosevelt Memorial College', 5),
(1142, 'Saint Paul College Foundation', 5),
(1143, 'Cebu School of Midwifery', 5),
(1144, 'Cebu Normal University', 5),
(1145, 'Cebu Normal University - Balamban', 5),
(1146, 'Cebu Normal University - Medellin', 5),
(1147, 'Cebu Technological University - Main', 5),
(1148, 'College of Technological Sciences-Cebu', 5),
(1149, 'Negros Oriental State University-Main Campus', 5),
(1150, 'Negros Oriental State University-Mabinay Institute of Technology', 5),
(1151, 'Colegio De Santa Catalina De Alejandria', 5),
(1152, 'Concord Technical Institute', 5),
(1153, 'Cebu Technological University-Argao Campus', 5),
(1154, 'Cebu Technological University-Daanbantayan Campus', 5),
(1155, 'Cebu Technological University-Danao City Campus', 5),
(1156, 'Cebu Technological University-Barili Campus', 5),
(1157, 'Cebu Technological University-Moalboal Campus', 5),
(1158, 'Cebu Technological University-San Francisco Campus', 5),
(1159, 'Cebu Technological University-Tuburan Campus', 5),
(1160, 'Negros Oriental State University-Bais1', 5),
(1161, 'Negros Oriental State University-Guihulngan', 5),
(1162, 'Holy Name University', 5),
(1163, 'Diaz College', 5),
(1164, 'Felipe R. Verallo Memorial Foundation-Bogo', 5),
(1165, 'Foundation University', 5),
(1166, 'Negros Oriental State University -Bais II', 5),
(1167, 'University of the Visayas-Gullas College of Medicine', 5),
(1168, 'Holy Trinity College', 5),
(1169, 'Immaculate Heart of Mary Seminary', 5),
(1170, 'Indiana School of Aeronautics', 5),
(1171, 'Siquijor State College', 5),
(1172, 'Mater Dei College-Bohol', 5),
(1173, 'Negros Oriental State University-Bayawan', 5),
(1174, 'Northern Cebu College', 5),
(1175, 'PMI Colleges-Bohol', 5),
(1176, 'Philippine State College of Aeronautics-Mactan Air Base', 5),
(1177, 'Saint Francis College-Guihulngan', 5),
(1178, 'Saint Joseph College of Canlaon', 5),
(1179, 'Saint Joseph Seminary College', 5),
(1180, 'St. Paul University Dumaguete', 5),
(1181, 'Salazar Colleges of Science and Institute of Technology', 5),
(1182, 'San Carlos Seminary College', 5),
(1183, 'Negros Oriental State University-Siaton Community College', 5),
(1184, 'Silliman University', 5),
(1185, 'Southwestern University', 5),
(1186, 'St. Catherine\'S College', 5),
(1187, 'Southwestern University-Matias H. Aznar Memorial College of Medicine', 5),
(1188, 'University of the Visayas-Toledo City Campus', 5),
(1189, 'Trinidad Municipal College', 5),
(1190, 'University of Bohol', 5),
(1191, 'University of Cebu', 5),
(1192, 'University of San Carlos', 5),
(1193, 'University of San Jose-Recoletos', 5),
(1194, 'University of Southern Philippines Foundation', 5),
(1195, 'University of the Visayas', 5),
(1196, 'University of the Philippines-College of Cebu', 5),
(1197, 'Quezon Memorial Institute of Siquijor', 5),
(1198, 'Velez College', 5),
(1199, 'Villaflores College', 5),
(1200, 'Cebu Technological University - College of Fisheries Technology - Carmen', 5),
(1201, 'Batuan Colleges', 5),
(1202, 'Don Bosco Technology Center', 5),
(1203, 'Negros Maritime College Foundation', 5),
(1204, 'Royal Christian College', 5),
(1205, 'University of Cebu-Lapulapu and Mandaue', 5),
(1206, 'Asian College of Science and Technology-Dumaguete', 5),
(1207, 'De La Salle Andres Soriano Memorial College', 5),
(1208, 'Bantayan Southern Institute', 5),
(1209, 'Mount Moriah College', 5),
(1210, 'Presbyterian Theological College', 5),
(1211, 'Visayan Nazarene Bible College', 5),
(1212, 'Bohol Island State University - Bilar', 5),
(1213, 'CBD College', 5),
(1214, 'Consolatrix College of Toledo City', 5),
(1215, 'Evangelical Theological College of the Philippines', 5),
(1216, 'Saint Louise de Marillac College-Bogo', 5),
(1217, 'Seminaryo Mayor de San Carlos', 5),
(1218, 'Centre for International Education Global Colleges', 5),
(1219, 'BIT International College-Carmen', 5),
(1220, 'AMA Computer College-Dumaguete City', 5),
(1221, 'Negros College', 5),
(1222, 'Benedicto College', 5),
(1223, 'Northeastern Cebu Colleges', 5),
(1224, 'Bohol Island State University - Clarin', 5),
(1225, 'University of Cebu-Banilad', 5),
(1226, 'Bohol Northwestern Colleges', 5),
(1227, 'Cebu Sacred Heart College', 5),
(1228, 'Mary\'s Children Formation College', 5),
(1229, 'Rogationist Seminary College-Cebu', 5),
(1230, 'Colegio de San Antonio de Padua', 5),
(1231, 'Bohol Wisdom School', 5),
(1232, 'Buenavista Community College', 5),
(1233, 'Talisay City College', 5),
(1234, 'Central Philippine Bible College', 5),
(1235, 'Cebu Mary Immaculate College', 5),
(1236, 'ACLC College of Mandaue', 5),
(1237, 'Immanuel Bible College', 5),
(1238, 'Cristal e-College (Panglao Campus)', 5),
(1239, 'Cordova Public College', 5),
(1240, 'Professional Academy of the Philippines', 5),
(1241, 'La Consolacion College-Liloan', 5),
(1242, 'Sto. Tomas College-Danao City', 5),
(1243, 'Madridejos Community College', 5),
(1244, 'Microsystem International Institute of Technology', 5),
(1245, 'Metro Dumaguete College', 5),
(1246, 'University of The Visayas-Dalaguete Campus', 5),
(1247, 'Bohol Northern Star College', 5),
(1248, 'La Consolacion College-Bais', 5),
(1249, 'Mandaue City College', 5),
(1250, 'Lyceum of Cebu', 5),
(1251, 'Golden Success College', 5),
(1252, 'St. Cecilia\'s College - Cebu', 5),
(1253, 'Cebu Technological University - Consolacion', 5),
(1254, 'Sibonga Community College', 5),
(1255, 'Bohol Island State University-Balilihan Campus', 5),
(1256, 'Lapu-lapu City College', 5),
(1257, 'Mary Our Help Technical Institute for Women', 5),
(1258, 'Carmelite College - Siquijor', 5),
(1259, 'Rosemont Hills Montessori College', 5),
(1260, 'Salazar Colleges of Science and Institute of Technology-Madredijos', 5),
(1261, 'Tabor Hills College', 5),
(1262, 'Carcar City College', 5),
(1263, 'Rizwoods Colleges', 5),
(1264, 'Bohol International Learning College', 5),
(1265, 'STI College - Dumaguete', 5),
(1266, 'University of Cebu College of Medicine Foundation', 5),
(1267, 'Rizwoods College-Lapulapu', 5),
(1268, 'Sto. Niño Mactan College', 5),
(1269, 'Asian College of Technology International Educational Foundation', 5),
(1270, 'Tagbilaran City College', 5),
(1271, 'Talibon Polytechnic College', 5),
(1272, 'Colegio de Getafe', 5),
(1273, 'Danao Techological College', 5),
(1274, 'Cebu Technological University - Cebu City Mountain Satellite Campus', 5),
(1275, 'Benedicto College-Cebu', 5),
(1276, '', 5),
(1277, 'Cebu Sacred Heart College-Carcar City', 5),
(1278, '', 5),
(1279, 'Mham College', 5),
(1280, '', 5),
(1281, 'Lapu-Lapu Cebu International College', 5),
(1282, '', 5),
(1283, 'Rizwoods College - Bacalso', 5),
(1284, 'Rizwoods College - Liloan', 5),
(1285, 'Information And Communications Technology Academy', 5),
(1286, 'North Coast Bohol Institute', 5),
(1287, 'Abuyog Community College', 5),
(1288, 'Asian Development Foundation College', 5),
(1289, 'Biliran Province State University-Biliran Campus', 5),
(1290, 'Eastern Samar State University-Can-Avid Campus', 5),
(1291, 'Eastern Visayas State University-Carigara Campus', 5),
(1292, 'Christ the King College-Calbayog City', 5),
(1293, 'The College of Maasin', 5),
(1294, 'Dr. V. Orestes Romualdez Educational Foundation', 5),
(1295, 'Doña Remedios Trinidad-Romualdez Medical Foundation', 5),
(1296, 'Eastern Samar State University', 5),
(1297, 'Eastern Samar State University-Guiuan Campus', 5),
(1298, 'Franciscan College of the Immaculate Conception', 5),
(1299, 'Holy Infant College', 5),
(1300, 'Visayas State University-Isabel Campus', 5),
(1301, 'University of Eastern Philippines-Laoang Campus', 5),
(1302, 'Leyte Colleges', 5),
(1303, 'Eastern Visayas State University', 5),
(1304, 'Visayas State University-Villaba Campus', 5),
(1305, 'Leyte Normal University', 5),
(1306, 'Eastern Visayas State University-Tanauan Campus', 5),
(1307, 'Visayas State University-Alang-Alang Campus', 5),
(1308, 'Visayas State University-Tolosa Campus', 5),
(1309, 'Biliran Province State University-Main', 5),
(1310, 'Palompon Institute of Technology', 5),
(1311, 'University of Eastern Philippines-Catubig Campus', 5),
(1312, 'Southern Leyte State University-Bontoc Campus', 5),
(1313, 'St. Mary\'s College of Catbalogan', 5),
(1314, 'Sacred Heart Seminary', 5),
(1315, 'Saint Joseph College', 5),
(1316, 'St. Mary\'s College of Borongan', 5),
(1317, 'St. Peter\'s College of Ormoc', 5),
(1318, 'Saint Vincent De Paul College Seminary', 5),
(1319, 'Samar Colleges', 5),
(1320, 'Northwest Samar State University-San Jorge Campus', 5),
(1321, 'Samar State University-Mercedes Campus', 5),
(1322, 'Samar State University', 5),
(1323, 'Samar State University-Basey Campus', 5),
(1324, 'Southern Leyte State University-San Juan Campus', 5),
(1325, 'Colegio de San Lorenzo Ruiz de Manila of Northern Samar', 5),
(1326, 'Southern Leyte State University-Hinunangan Campus', 5),
(1327, 'Southern Leyte State University', 5),
(1328, 'Eastern Samar State University-Salcedo Campus', 5),
(1329, 'Saint Paul School of Professional Studies', 5),
(1330, 'Saint Thomas Aquinas College', 5),
(1331, 'Sto. Niño College of Ormoc', 5),
(1332, 'Northwest Samar State University', 5),
(1333, 'Southern Leyte State University-Tomas Oppus Campus', 5),
(1334, 'University of Eastern Philippines', 5),
(1335, 'University of the Philippines in the Visayas Tacloban College', 5),
(1336, 'Visayas State University', 5),
(1337, 'Western Leyte College of Ormoc City', 5),
(1338, 'Eastern Visayas State University-Burauen Campus', 5),
(1339, 'JE Mondejar Computer College', 5),
(1340, 'Mater Divinae Gratiae College', 5),
(1341, 'Palompon Institute of Technology-Tabango Campus', 5),
(1342, 'Our Lady of Mercy College', 5),
(1343, 'Bato Institute of Science and Technology', 5),
(1344, 'Holy Cross College of Carigara', 5),
(1345, 'STI College-Ormoc', 5),
(1346, 'Eastern Visayas State University-Ormoc Campus', 5),
(1347, 'Eastern Visayas Central Colleges', 5),
(1348, 'AMA Computer College-Tacloban City', 5),
(1349, 'Saint Scholastica\'s College-Tacloban', 5),
(1350, 'ABE International College of Business and Economics-Tacloban City', 5),
(1351, 'Saint Michael College of Hindang', 5),
(1352, 'Holy Spirit College Foundation of Leyte', 5),
(1353, 'Montano Lamberte Go Collegeof Learning', 5),
(1354, 'Northern Samar Colleges', 5),
(1355, 'Asia College of Advance Studies In Arts Sciences and Technology', 5),
(1356, 'St. John the Evangelist School of Theology', 5),
(1357, 'Colegio de San Juan Samar', 5),
(1358, 'Colegio De Sta. Lourdes of Leyte Foundation', 5),
(1359, 'Colegio de la Salle Fondation de Tacloban', 5),
(1360, 'Holy Virgin of Salvacion Foundation College', 5),
(1361, 'San Lorenzo Ruiz College of Ormoc', 5),
(1362, 'ACLC College-Tacloban City', 5),
(1363, 'Colegio De Las Navas', 5),
(1364, 'Eastern Samar State University-Maydolong Campus', 5),
(1365, 'Calbiga Western Samar College', 5),
(1366, 'Samar State University-Paranas Campus', 5),
(1367, 'ACLC College-Ormoc', 5),
(1368, 'Southern Leyte State University-Maasin City Campus', 5),
(1369, 'Tan Ting Bing Memorial Colleges Foundation', 5),
(1370, 'Global School for Technological Studies', 5),
(1371, 'Burauen Community College', 5),
(1372, 'Eastern Visayas State University-Dulag Campus', 5),
(1373, 'University of the Philippines Manila - School of Health Sciences', 5),
(1374, 'Andres Bonifacio College', 5),
(1375, 'Ateneo de Zamboanga University', 5),
(1376, 'Basilan State College', 5),
(1377, 'Brent Hospital and Colleges', 5),
(1378, 'Claret College of Isabela', 5),
(1379, 'DMC College Foundation', 5),
(1380, 'Dr. Aurelio Mendoza Memorial Colleges', 5),
(1381, 'Immaculate Conception Archdiocesan School', 5),
(1382, 'Juan S. Alano Memorial School', 5),
(1383, 'Jose Rizal Memorial State University-Katipunan Campus', 5),
(1384, 'Marian College', 5),
(1385, 'Blancia College Foundation', 5),
(1386, 'Philippine Advent College', 5),
(1387, 'Pilar Colege of Zamboanga City', 5),
(1388, 'Rizal Memorial Institute of Dapitan City', 5),
(1389, 'Saint Columban College', 5),
(1390, 'St. John College of Buug Foundation', 5),
(1391, 'Saint Joseph College of Sindangan', 5),
(1392, 'Saint Vincent\'s College', 5),
(1393, 'Saint Estanislao Kostka College', 5),
(1394, 'Southern Mindanao College-Agro Tech', 5),
(1395, 'Southern City Colleges', 5),
(1396, 'Southern Mindanao Colleges', 5),
(1397, 'Southern Philippine College', 5),
(1398, 'Western Mindanao State University', 5),
(1399, 'Western Mindanao State University-Alicia', 5),
(1400, 'Western Mindanao State University-Aurora', 5),
(1401, 'Western Mindanao State University-Diplahan', 5),
(1402, 'Western Mindanao State University-Imelda', 5),
(1403, 'Western Mindanao State University-Ipil', 5),
(1404, 'Western Mindanao State University-Mabuhay', 5),
(1405, 'Western Mindanao State University-Malangas', 5),
(1406, 'Western Mindanao State University-Molave', 5),
(1407, 'Western Mindanao State University-Olutanga', 5),
(1408, 'Western Mindanao State University-Pagadian', 5),
(1409, 'Western Mindanao State University-Siay', 5),
(1410, 'Western Mindanao State University-Tungawan', 5),
(1411, 'Western Mindanao State University-Naga', 5),
(1412, 'Western Mindanao State University-Curuan', 5),
(1413, 'Universidad de Zamboanga', 5),
(1414, 'Zamboanga Peninsula Polytechnic State University', 5),
(1415, 'Zamboanga State College of Marine Sciences and Technology', 5),
(1416, 'Josefina H. Cerilles State College', 5),
(1417, 'Josefina H. Cerilles State College - Dumingag', 5),
(1418, 'Medina College-Pagadian', 5),
(1419, 'Pagadian Capitol College', 5),
(1420, 'Aurora Pioneers Memorial College', 5),
(1421, 'Dipolog City Institute of Technology', 5),
(1422, 'Jose Rizal Memorial State University - Main', 5),
(1423, 'Ebenezer Bible College and Seminary', 5),
(1424, 'St. Mary\'s College of Labason', 5),
(1425, 'Josefina H. Cerilles State College-Canuto M.S. Enerio College of Arts and Trades', 5),
(1426, 'Jose Rizal Memorial State University-Dipolog', 5),
(1427, 'Jose Rizal Memorial State University-Siocon', 5),
(1428, 'Colegio de San Francisco Javier of Rizal Zamboanga del Norte', 5),
(1429, 'Computer Technologies Institute of Zamboanga City', 5),
(1430, 'HMIJ Foundation Philippine Islamic College', 5),
(1431, 'Mindanao State University-Buug College', 5),
(1432, 'Eastern Mindanao College of Technology', 5),
(1433, 'Universidad de Zamboanga-Ipil', 5),
(1434, 'Medina College-Ipil', 5),
(1435, 'Philippine Technological and Marine Sciences-Zamboanga del Sur', 5),
(1436, 'Western Mindanao Foundation College', 5),
(1437, 'Southern Peninsula College', 5),
(1438, 'Lucan Central Colleges', 5),
(1439, 'Sibugay Technical Institute', 5),
(1440, 'Universidad de Zamboanga - Pagadian', 5),
(1441, 'Aim High College', 5),
(1442, 'Ave Maria College', 5),
(1443, 'Hyrons College Philippines', 5),
(1444, 'Jose Rizal Memorial State University-Tampilisan', 5),
(1445, 'Nuevo Zamboanga College', 5),
(1446, 'Philippine Advent College-Salug', 5),
(1447, 'Yllana Bay View College', 5),
(1448, 'Alhadeetha Mindanao College', 5),
(1449, 'Zamboanga del Sur Provincial Government College', 5),
(1450, 'Southern City Colleges-West Campus', 5),
(1451, 'ZAMSULA Everlasting College', 5),
(1452, 'Our Lady of Triumph Institute of Technology', 5),
(1453, 'West Prime Horizon Institute', 5),
(1454, 'Colegio de La Ciudad de Zamboanga', 5),
(1455, 'Zamboanga del Sur Provincial Government College - Pagadian', 5),
(1456, 'Ferndale College – Zamboanga Peninsula', 5),
(1457, 'Metro Zampen College', 5),
(1458, 'Emmauss College of Theology Foundation', 5),
(1459, 'Pagadian City International College', 5),
(1460, 'Philippine Advent College - Leon B. Postigo Campus', 5),
(1461, 'Zamboanga del Sur Provincial Government College-Dimataling', 5),
(1462, 'Blessed Mother College', 5),
(1463, 'Bukidnon State University', 5),
(1464, 'Bukidnon State University-Alubijid ESC', 5),
(1465, 'Bukidnon State University-Libona', 5),
(1466, 'Bukidnon State University-Baungon BSU', 5),
(1467, 'Bukidnon State University-Kalilangan BSU', 5),
(1468, 'Bukidnon State University-Medina ESC', 5),
(1469, 'Bukidnon State University-Talakag BSU', 5),
(1470, 'Bukidnon State University-Talisayan ESC', 5),
(1471, 'Bukidnon State University-Malitbog', 5),
(1472, 'Bukidnon State University-Kadingilan', 5),
(1473, 'Capitol University', 5),
(1474, 'Cagayan De Oro College', 5),
(1475, 'Camiguin Polytechnic State College', 5),
(1476, 'Central Mindanao University', 5),
(1477, 'Christ the King College', 5),
(1478, 'Colegio De Santo Niño De Jasaan', 5),
(1479, 'Fatima College of Camiguin', 5),
(1480, 'Gingoog City College', 5),
(1481, 'Gingoog Christian College', 5),
(1482, 'Gov. Alfonso D. Tan College', 5),
(1483, 'La Salle University', 5),
(1484, 'Liceo De Cagayan University', 5),
(1485, 'Lourdes College', 5),
(1486, 'Medina College', 5),
(1487, 'Medina Foundation College', 5),
(1488, 'Mindanao Arts and Technological Institute', 5),
(1489, 'University of Science and Technology of Southern Philippines', 5),
(1490, 'University of Science and Technology of Southern Philippines - Jasaan', 5),
(1491, 'University of Science and Technology of Southern Philippines - Oroquieta', 5),
(1492, 'University of Science and Technology of Southern Philippines - Panaon', 5),
(1493, 'Misamis Institute of Technology', 5),
(1494, 'University of Science and Technology of Southern Philippines - Claveria', 5),
(1495, 'Misamis University', 5),
(1496, 'Misamis University-Oroquieta City', 5),
(1497, 'Mountain View College', 5),
(1498, 'Golden Heritage Polytechnic College', 5),
(1499, 'Northwestern Mindanao Christian Colleges', 5),
(1500, 'Philippine College Foundation', 5),
(1501, 'Pilgrim Christian College', 5),
(1502, 'Quezon Institute of Technology', 5),
(1503, 'Sacred Heart College of Calamba', 5),
(1504, 'St. John Vianney Theological Seminary', 5),
(1505, 'St. Peter\'s College of Misamis Oriental', 5),
(1506, 'St. Rita\'s College of Balingasag', 5),
(1507, 'San Agustin Institute of Technology', 5),
(1508, 'San Isidro College', 5),
(1509, 'Southern Bukidnon Foundation Academy', 5),
(1510, 'Southern Capital Colleges', 5),
(1511, 'Southern De Oro Philippines College', 5),
(1512, 'Stella Maris College', 5),
(1513, 'Northwestern Mindanao State College of Science and Technology', 5),
(1514, 'Valencia Colleges-Bukidnon', 5),
(1515, 'Xavier University (Ateneo de Cagayan)', 5),
(1516, 'STI College-Cagayan De Oro', 5),
(1517, 'AMA Computer College-Cagayan de Oro', 5),
(1518, 'Philippine Countryville College', 5),
(1519, 'Roman C. Villalon Memorial Colleges Foundation', 5),
(1520, 'Oro Bible College', 5),
(1521, 'Dr. Solomon U. Molina College', 5),
(1522, 'Mindanao State University-Naawan', 5),
(1523, 'Adventist Technological Institute', 5),
(1524, 'Southern Maramag Colleges', 5),
(1525, 'Tagoloan Community College', 5),
(1526, 'Initao College', 5),
(1527, 'Opol Community College', 5),
(1528, 'Northern Bukidnon State College', 5),
(1529, 'ACLC College of Bukidnon', 5),
(1530, 'Don Carlos Polytechnic College', 5),
(1531, 'IBA College of Mindanao', 5),
(1532, 'Misamis Oriental Institute of Science and Technology', 5),
(1533, 'The New El Salvador Colleges', 5),
(1534, 'Our Lady of Triumph Institute of Technology', 5),
(1535, 'Vineyard International Polytechnic College', 5),
(1536, 'Pangantucan Bukidnon Community College', 5),
(1537, 'City College of El Salvador', 5),
(1538, 'Community College of Gingoog City', 5),
(1539, 'Magsaysay College', 5),
(1540, 'Salay Community College', 5),
(1541, 'STI College-Iligan', 5),
(1542, 'STI College-Malaybalay', 5),
(1543, 'STI College-Valencia', 5),
(1544, 'Tubod College', 5),
(1545, 'Bukidnon State University-Cabanglasan ESC', 5),
(1546, 'Bukidnon State University-Damulog Satellite ESC', 5),
(1547, 'Bukidnon State University-Kitaotao Satellite ESC', 5),
(1548, 'Bukidnon State University-Quezon Satellite ESC', 5),
(1549, 'Bukidnon State University-San Fernando Satellite ESC', 5),
(1550, 'Bukidnon State University-Impasugong', 5),
(1551, 'University of Science and Technology in Southern Philippines-Alubijid', 5),
(1552, 'University of Science and Technology in Southern Philippines-Balubal', 5),
(1553, 'University of Science and Technology in Southern Philippines-Villanueva', 5),
(1554, 'North Central Mindanao College', 5),
(1555, 'Iligan Capitol College', 5),
(1556, 'Iligan Medical Center College', 5),
(1557, 'Mindanao State University-Lanao Del Norte Agricultural College', 5),
(1558, 'Mindanao State University-Maigo School of Arts and Trades', 5),
(1559, 'Adventist Medical Center College', 5),
(1560, 'Mindanao State University - Iligan Institute of Technology', 5),
(1561, 'St. Michael\'s College', 5),
(1562, 'St. Peter\'s College', 5),
(1563, 'Santa Monica Institute of Technology', 5),
(1564, 'Lyceum of Iligan Foundation', 5),
(1565, 'Christ The King College De Maranding', 5),
(1566, 'Lanao School of Science and Technology', 5),
(1567, 'Masters Technological Institute of Mindanao', 5),
(1568, 'Picardal Institute of Science and Technology', 5),
(1569, 'Agro-Industrial Foundation College of the Philippines-Davao', 5),
(1570, 'AMA Computer College-Davao', 5),
(1571, 'Arriesgado College Foundation', 5),
(1572, 'Assumption College of Nabunturan', 5),
(1573, 'Ateneo de Davao University', 5),
(1574, 'Brokenshire College', 5),
(1575, 'Cor Jesu College', 5),
(1576, 'Davao Central College', 5),
(1577, 'Davao del Norte State College', 5),
(1578, 'Davao Doctors College', 5),
(1579, 'Davao Medical School Foundation', 5),
(1580, 'DMMA College of Southern Philippines', 5),
(1581, 'Davao Oriental State University', 5),
(1582, 'Davao Oriental State University-Cateel Extension Campus', 5),
(1583, 'Davao Oriental State University-San Isidro Campus', 5),
(1584, 'Davao Oriental State University-Banaybanay Campus', 5),
(1585, 'Evelyn E. Fabie College', 5),
(1586, 'General Baptist Bible College', 5),
(1587, 'Holy Cross College of Calinan', 5),
(1588, 'St. Mary\'S College of Bansalan', 5),
(1589, 'Holy Cross of Davao College', 5),
(1590, 'Liceo De Davao', 5),
(1591, 'Mati Polytechnic College', 5),
(1592, 'MATS College of Technology', 5),
(1593, 'Mindanao Medical Foundation College', 5),
(1594, 'North Davao College-Tagum Foundation', 5),
(1595, 'North Davao Colleges-Panabo', 5),
(1596, 'Philippine Women\'s College of Davao', 5),
(1597, 'Polytechnic College of Davao del Sur', 5),
(1598, 'Queen of Apostles College Seminary', 5),
(1599, 'The Rizal Memorial Colleges', 5),
(1600, 'Saint Francis Xavier College Seminary', 5),
(1601, 'St. Mary\'s College of Tagum', 5),
(1602, 'Saint Peter\'s College of Toril', 5),
(1603, 'San Pedro College', 5),
(1604, 'Serapion C. Basalo Memorial Colleges', 5),
(1605, 'Southeastern College of Padada', 5),
(1606, 'Southern Philippines Agriculture Business Marine and Aquatic School of Technology', 5),
(1607, 'South Philippine Adventist College', 5),
(1608, 'Tecarro College Foundation', 5),
(1609, 'UM Bansalan College', 5),
(1610, 'UM Digos College', 5),
(1611, 'UM Panabo College', 5),
(1612, 'UM Tagum College', 5),
(1613, 'University of Mindanao', 5),
(1614, 'University of Southeastern Philippines-Main', 5),
(1615, 'University of the Immaculate Conception', 5),
(1616, 'University of Southeastern Philippines-College of Agriculture-Tagum Mabini', 5),
(1617, 'Davao del Sur State College-Main', 5),
(1618, 'University of Southeastern Philippines-Mintal', 5),
(1619, 'Joji Ilagan Career Center Foundation', 5),
(1620, 'St. Francis Xavier Regional Major Seminary of Mindanao', 5),
(1621, 'University of the Philippines-Mindanao', 5),
(1622, 'Assumption College of Davao', 5),
(1623, 'Interface Computer College', 5),
(1624, 'UM Peñaplata College', 5),
(1625, 'Aces Tagum College', 5),
(1626, 'St. John Paul II College of Davao', 5),
(1627, 'Philippine College of Technology', 5),
(1628, 'Mindanao Kokusai Daigaku', 5),
(1629, 'Holy Child College of Davao', 5),
(1630, 'Mati Doctors College', 5),
(1631, 'Southern Philippines Baptist Theological Seminary', 5),
(1632, 'STI College-Davao', 5),
(1633, 'Jose Maria College', 5),
(1634, 'Christian Colleges of Southeast Asia', 5),
(1635, 'Davao Winchester Colleges', 5),
(1636, 'Legacy College of Compostela', 5),
(1637, 'St. Mary\'s College Baganga', 5),
(1638, 'Kapalong College of Agriculture Sciences and Technology', 5),
(1639, 'Holy Cross College of Sasa', 5),
(1640, 'Laak Institute Foundation', 5),
(1641, 'Tagum Doctors College', 5),
(1642, 'Gabriel Taborin College of Davao Foundation', 5),
(1643, 'ACES Polytechnic College', 5),
(1644, 'Governor Generoso College of Arts Sciences and Technology', 5),
(1645, 'Davao Vision Colleges', 5),
(1646, 'St. Thomas More School of Law and Business', 5),
(1647, 'Monkayo College of Arts Sciences and Technology', 5),
(1648, 'ACQ College of Ministries', 5),
(1649, 'Koinonia Theological Seminary Foundation', 5),
(1650, 'Evangelical Mission College', 5),
(1651, 'Samson Polytechnic College of Davao', 5),
(1652, 'Mt. Apo Science Foundation College', 5),
(1653, 'Kolehiyo ng Pantukan', 5),
(1654, 'Northlink Technological College', 5),
(1655, 'Tagum City College of Science and Technology Foundation', 5),
(1656, 'Davao De Oro State College', 5),
(1657, 'Institute of International Culinary and Hospitality Entrepreneurship Inc.', 5),
(1658, 'Asian International School of Aeronautics and Technology', 5),
(1659, 'Davao De Oro State College-Maragusan Branch', 5),
(1660, 'Davao De Oro State College-Montevista Branch', 5),
(1661, 'Davao De Oro State College-New Bataan Branch', 5),
(1662, 'Joji Ilagan International Management School', 5),
(1663, 'Malayan Colleges Mindanao', 5),
(1664, 'Card-MRI Development Institute', 5),
(1665, 'Sto. Tomas College of Agriculture Sciences and Technology', 5),
(1666, 'Lyceum of the Philippines-Davao', 5),
(1667, 'Maryknoll College of Panabo', 5),
(1668, 'Samal Island City College', 5),
(1669, 'STI College-Tagum', 5),
(1670, 'Colegio de Caraga', 5),
(1671, 'AMYA Polytechnic College', 5),
(1672, 'Maco de Oro College', 5),
(1673, 'St. Alexius College', 5),
(1674, 'Edenton Mission College', 5),
(1675, 'Gensantos Foundation College', 5),
(1676, 'Holy Trinity College of General Santos City', 5),
(1677, 'King\'s College of Marbel', 5),
(1678, 'Mindanao Polytechnic College', 5),
(1679, 'Mindanao State University-General Santos', 5),
(1680, 'Notre Dame of Dadiangas University', 5),
(1681, 'Notre Dame of Marbel University', 5),
(1682, 'Schola de San Jose', 5),
(1683, 'Ramon Magsaysay Memorial Colleges', 5),
(1684, 'Santa Cruz Mission School', 5),
(1685, 'South Cotabato State College', 5),
(1686, 'STI College-Gen. Santos', 5),
(1687, 'Green Valley College Foundation', 5),
(1688, 'Marbel School of Science and Technology', 5),
(1689, 'AMA Computer College-General Santos City', 5),
(1690, 'Central Mindanao Colleges', 5),
(1691, 'Regency Polytechnic College', 5),
(1692, 'Cotabato Foundation College of Science and Technology', 5),
(1693, 'Cotabato Foundation College of Science and Technology-Antipas Campus', 5),
(1694, 'Cotabato Foundation College of Science and Technology-Katipunan Campus', 5),
(1695, 'Cotabato Foundation College of Science and Technology-Pikit Campus', 5),
(1696, 'Cotabato Medical Foundation College', 5),
(1697, 'Dr. Domingo B. Tamondong Memorial Hospital and College Foundation', 5),
(1698, 'King\'s College of Isulan', 5),
(1699, 'Lebak Family Doctors\' School of Midwifery', 5),
(1700, 'University of Southern Mindanao-Kidapawan City Campus', 5),
(1701, 'Colegio de Kidapawan', 5),
(1702, 'Notre Dame of Kidapawan College', 5),
(1703, 'Notre Dame of Midsayap College', 5),
(1704, 'Notre Dame of Salaman College', 5),
(1705, 'Notre Dame of Tacurong College', 5),
(1706, 'Senator Ninoy Aquino College Foundation', 5),
(1707, 'Southern Baptist College', 5),
(1708, 'Southern Christian College', 5),
(1709, 'Southern Mindanao Institute of Technology', 5),
(1710, 'Southern Philippines Methodist College', 5),
(1711, 'Sultan Kudarat Educational Institution', 5),
(1712, 'Sultan Kudarat State University', 5),
(1713, 'Sultan Kudarat State University-Isulan', 5),
(1714, 'Sultan Kudarat State University-Lutayan', 5),
(1715, 'Sultan Kudarat State University-Kalamansig', 5),
(1716, 'Sultan Kudarat State University-Bagumbayan', 5),
(1717, 'Sultan Kudarat State University-Palimbang', 5),
(1718, 'Sultan Kudarat State University-Tacurong', 5),
(1719, 'University of Southern Mindanao-Main', 5),
(1720, 'North Valley College Foundation', 5),
(1721, 'Central Mindanao Computer School', 5),
(1722, 'Adventist College of Technology', 5),
(1723, 'Goldenstate College', 5),
(1724, 'General Santos Doctors\' Medical School Foundation', 5),
(1725, 'Notre Dame-Siena College of Polomolok', 5),
(1726, 'Brokenshire College SOCSKSARGEN', 5),
(1727, 'Holy Child College of Information Technology', 5),
(1728, 'South East Asian Institute of Technology', 5),
(1729, 'VMC Asian College Foundation', 5),
(1730, 'Asian Colleges and Technological Institute', 5),
(1731, 'Stratford International School', 5),
(1732, 'ACLC College of Marbel', 5),
(1733, 'Korbel Foundation College', 5),
(1734, 'STI College of Koronadal City', 5),
(1735, 'i-Link College of Science and Technology', 5),
(1736, 'Goldenstate College of Koronadal City', 5),
(1737, 'Marvelous College of Technology', 5),
(1738, 'STI College - Koronadal City - Tacurong City Branch', 5),
(1739, 'B.E.S.T. College of Polomolok', 5),
(1740, 'Ramon Magsaysay Memorial College - Marbel', 5),
(1741, 'General Santos Academy', 5),
(1742, 'Marbel Institute of Technical College', 5),
(1743, 'Joji Ilagan International School of Hotel & Tourism Management', 5),
(1744, 'MMG College of General Santos City', 5),
(1745, 'Villamor College of Business and Arts', 5),
(1746, 'Cronasia Foundation College', 5),
(1747, 'Kidapawan Doctors College', 5),
(1748, 'Kulaman Academy', 5),
(1749, 'Gensan College of Technology', 5),
(1750, 'Primasia Foundation College', 5),
(1751, 'Southpoint College of Arts and Technology', 5),
(1752, 'Makilala Institute of Science and Technology', 5),
(1753, 'West Celebes College of Technology', 5),
(1754, 'Saint Albert Polytechnic College', 5),
(1755, 'Filipino Canadian Community College Foundation', 5),
(1756, 'New Era University-General Santos City', 5),
(1757, 'Glan Institute of Technology', 5),
(1758, 'Southern Philippine Technical College of Koronadal', 5),
(1759, 'Goldenstate College of Kiamba', 5),
(1760, 'Goldenstate College of Maasim', 5),
(1761, 'Goldenstate College of Malungon', 5),
(1762, 'New Brighton School of the Philippines', 5),
(1763, 'Pacific Southbay College', 5),
(1764, 'Goodwill Colleges of North Eastern Philippines', 5),
(1765, 'King Solomon Institute', 5),
(1766, 'Santo Niño College Foundation', 5),
(1767, 'VMC Asian College of President Quirino', 5),
(1768, 'Envirogreen School of Technology', 5),
(1769, 'New Hope School of Agriculture and Fishery', 5),
(1770, 'Adamson University', 5),
(1771, 'Air Link International Aviation College', 5),
(1772, 'Alliance Graduate School', 5),
(1773, 'AMA Computer College-Makati', 5),
(1774, 'AMA Computer University', 5),
(1775, 'Arellano University-Manila', 5),
(1776, 'Arellano University-Malabon', 5),
(1777, 'Arellano University-Pasay', 5),
(1778, 'Arellano University-Pasig', 5),
(1779, 'Asia Pacific College', 5),
(1780, 'Asian Institute for Distance Education', 5),
(1781, 'Asian Institute of Journalism and Communication', 5),
(1782, 'Asian Institute of Management', 5),
(1783, 'Asian Institute of Maritime Studies', 5),
(1784, 'Asian Social Institute', 5),
(1785, 'Asian Theological Seminary', 5),
(1786, 'Assumption College', 5),
(1787, 'Ateneo de Manila University-Quezon City', 5),
(1788, 'Ateneo De Manila University School of Medicine and Public Health', 5),
(1789, 'Ateneo de Manila University Graduate School of Business', 5),
(1790, 'Bernardo College', 5),
(1791, 'Biblical Seminary of the Philippines', 5),
(1792, 'CAP College Foundation', 5),
(1793, 'University of Asia and the Pacific', 5),
(1794, 'Central Colleges of the Philippines', 5),
(1795, 'Centro Escolar University-Manila', 5),
(1796, 'Chiang Kai Shek College', 5),
(1797, 'Chinese General Hospital Colleges', 5),
(1798, 'Saint Anthony Mary Claret College', 5),
(1799, 'Colegio de San Juan de Letran', 5),
(1800, 'Concordia College', 5),
(1801, 'De La Salle University-Manila', 5),
(1802, 'De Ocampo Memorial College', 5),
(1803, 'Divine Word Mission Seminary', 5),
(1804, 'De La Salle-College of Saint Benilde', 5),
(1805, 'Dominican College', 5),
(1806, 'Don Bosco Technical College', 5),
(1807, 'Dr. Carlos S. Lanting College', 5),
(1808, 'Emilio Aguinaldo College', 5),
(1809, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology', 5),
(1810, 'Far Eastern University', 5),
(1811, 'FEATI University', 5),
(1812, 'Febias College of Bible', 5),
(1813, 'FEU-FERN College', 5),
(1814, 'FEU-Dr. Nicanor Reyes Medical Foundation', 5),
(1815, 'Governor Andres Pascual College', 5),
(1816, 'Greenville College', 5),
(1817, 'De La Salle-Araneta University', 5),
(1818, 'Guzman College of Science and Technology', 5),
(1819, 'Holy Rosary College Foundation', 5),
(1820, 'Institute of Community and Family Health', 5),
(1821, 'Institute of Formation and Religious Studies', 5),
(1822, 'Interface Computer College-Manila', 5),
(1823, 'International Baptist College', 5),
(1824, 'International Graduate School of Leadership', 5),
(1825, 'Jose Rizal University', 5),
(1826, 'University of Caloocan City', 5),
(1827, 'La Consolacion College-Manila', 5),
(1828, 'La Consolacion College-Caloocan', 5),
(1829, 'Lacson College', 5),
(1830, 'Centro Escolar Las Piñas', 5),
(1831, 'Regis Marie College', 5),
(1832, 'Lyceum of the Philippines University', 5),
(1833, 'City of Malabon University', 5),
(1834, 'Manila Central University', 5),
(1835, 'Manila Tytana Colleges', 5),
(1836, 'Manila Law College', 5),
(1837, 'Manila Adventist College', 5),
(1838, 'Manila Theological College', 5),
(1839, 'Manuel L. Quezon University', 5),
(1840, 'Mapua University-Manila', 5),
(1841, 'Mapua University-Makati', 5),
(1842, 'Marikina Polytechnic College', 5),
(1843, 'Martinez Memorial College', 5),
(1844, 'Mary Chiles College', 5),
(1845, 'CICM Maryhill School of Theology', 5),
(1846, 'Metro Business College-Pasay', 5),
(1847, 'Metro Manila College', 5),
(1848, 'Metropolitan Medical Center College of Arts Science and Technology', 5),
(1849, 'Miriam College', 5),
(1850, 'Mother of Life Center', 5),
(1851, 'Pamantasan ng Lungsod ng Muntinlupa', 5),
(1852, 'NAMEI Polytechnic Institute', 5),
(1853, 'National College of Business and Arts-Cubao', 5),
(1854, 'National College of Business and Arts-Fairview', 5),
(1855, 'The National Teachers College', 5),
(1856, 'National University', 5),
(1857, 'Navotas Polytechnic College', 5),
(1858, 'New Era University', 5),
(1859, 'Olivarez College', 5),
(1860, 'Our Lady of Fatima University-Valenzuela', 5),
(1861, 'Our Lady of Lourdes College', 5),
(1862, 'Our Lady of the Angels Seminary', 5),
(1863, 'PACE Graduate School of Christian Education', 5),
(1864, 'Pamantasan ng Lungsod ng Maynila', 5),
(1865, 'City University of Pasay', 5),
(1866, 'University of Makati', 5),
(1867, 'Pasig Catholic College', 5),
(1868, 'PATTS College of Aeronautics', 5),
(1869, 'Perpetual Help College of Manila', 5),
(1870, 'University of Perpetual Help System Dalta', 5),
(1871, 'Philippine Dominican Center of Institutional Studies', 5),
(1872, 'Philippine Christian University', 5),
(1873, 'Philippine College of Criminology', 5),
(1874, 'Philippine College of Health Sciences', 5),
(1875, 'St. Louis College-Valenzuela', 5),
(1876, 'Philippine Law School', 5),
(1877, 'Philippine Merchant Marine School-Manila', 5),
(1878, 'Philippine Merchant Marine School-Las Piñas', 5),
(1879, 'Philippine Normal University-Main', 5),
(1880, 'Philippine School of Business Administration-Quezon City', 5),
(1881, 'Philippine School of Business Administration-Manila', 5),
(1882, 'Philippine State College of Aeronautics-Main', 5),
(1883, 'The Philippine Women\'s University-Manila', 5),
(1884, 'PHILSIN College Foundation', 5),
(1885, 'PMI Colleges-Manila', 5),
(1886, 'PMI Colleges-Quezon City', 5),
(1887, 'Polytechnic University of the Philippines', 5),
(1888, 'Polytechnic University of The Philippines-Open University', 5),
(1889, 'Polytechnic University of the Philippines-San Juan Campus', 5),
(1890, 'Polytechnic University of the Philippines-Parañaque Campus', 5),
(1891, 'Polytechnic University of the Philippines-Taguig', 5),
(1892, 'World Citi Colleges-Quezon City', 5),
(1893, 'Makati Medical Center College', 5),
(1894, 'Republican College', 5),
(1895, 'Rizal Technological University', 5),
(1896, 'Roosevelt College-Marikina', 5),
(1897, 'St. Camillus College Seminary', 5),
(1898, 'St. Francis Divine College', 5),
(1899, 'Saint Francis of Assisi College', 5),
(1900, 'St. Joseph\'s College of Quezon City', 5),
(1901, 'St. Jude College', 5),
(1902, 'St. Paul University-Manila', 5),
(1903, 'St. Paul University-Quezon City', 5),
(1904, 'Saint Rita College-Manila', 5),
(1905, 'St. Scholastica\'s College', 5),
(1906, 'Samson College of Science and Technology-Quezon City', 5),
(1907, 'San Beda University', 5),
(1908, 'San Carlos Seminary', 5),
(1909, 'San Juan de Dios Educational Foundation', 5),
(1910, 'San Sebastian College-Recoletos', 5),
(1911, 'Sta. Catalina College', 5),
(1912, 'Santa Isabel College of Manila', 5),
(1913, 'Siena College', 5),
(1914, 'Southeastern College', 5),
(1915, 'St. Luke\'s College of Medicine-William H. Quasha Memorial', 5),
(1916, 'Stella Maris College', 5),
(1917, 'Systems Plus Computer College-Quezon City', 5),
(1918, 'Technological Institute of the Philippines-Manila', 5),
(1919, 'Technological Institute of the Philippines-Quezon City', 5),
(1920, 'Technological University of the Philippines-Manila', 5),
(1921, 'Trinity University of Asia', 5),
(1922, 'Technological University of the Philippines-Taguig', 5),
(1923, 'Unciano Colleges and General Hospital', 5),
(1924, 'Southeast Asian College', 5),
(1925, 'University of the East-Ramon Magsaysay Memorial Medical Center', 5),
(1926, 'The University of Manila', 5),
(1927, 'University of Santo Tomas', 5),
(1928, 'University of the East-Manila', 5),
(1929, 'University of the East-Caloocan', 5),
(1930, 'University of the Philippines-Diliman', 5),
(1931, 'University of the Philippines-Manila', 5),
(1932, 'Angelicum College', 5),
(1933, 'Asian College of Science and Technology-Cubao', 5),
(1934, 'Universidad de Manila', 5),
(1935, 'Don Bosco Center of Studies', 5),
(1936, 'IETI College-Alabang', 5),
(1937, 'Our Lady of Perpetual Succor College', 5),
(1938, 'San Beda College-Alabang', 5),
(1939, 'St. Dominic Savio College', 5),
(1940, 'St. John Technological College of the Philippines', 5),
(1941, 'STI College-Alabang', 5),
(1942, 'STI College-Cubao', 5),
(1943, 'STI College-Shaw', 5),
(1944, 'STI College-Global City', 5),
(1945, 'STI College-Caloocan', 5),
(1946, 'STI College-Muñoz EDSA', 5),
(1947, 'STI College-Novaliches', 5),
(1948, 'STI College-Fairview', 5),
(1949, 'STI College Pasay-EDSA', 5),
(1950, 'Philippine Rehabilitation Institute Foundation', 5),
(1951, 'Immaculada Concepcion College', 5),
(1952, 'West Bay College', 5),
(1953, 'System Plus Computer College-Caloocan', 5),
(1954, 'Saint Bernadette College of Alabang', 5),
(1955, 'Children of Mary Immaculate College', 5),
(1956, 'Informatics College-Manila', 5),
(1957, 'The Fisher Valley College', 5),
(1958, 'La Consolacion College-Novaliches', 5),
(1959, 'National Defense College', 5),
(1960, 'Philippine Public Safety College', 5),
(1961, 'ABE International College of Business and Economics-Manila', 5),
(1962, 'AMA Computer College-Caloocan', 5),
(1963, 'AMA Computer College-Fairview', 5),
(1964, 'AMA Computer College-Parañaque', 5),
(1965, 'AMA Computer College-Sta. Mesa', 5),
(1966, 'Divine Mercy College Foundation', 5),
(1967, 'Interface Computer College-Caloocan', 5),
(1968, 'Our Lady of Fatima University-Quezon City', 5),
(1969, 'Our Lady of Lourdes Technological College', 5),
(1970, 'St. Clare College of Caloocan', 5),
(1971, 'STI College-Las Piñas', 5),
(1972, 'Dr. Filemon C. Aguilar Memorial College of Las Piñas', 5),
(1973, 'Asia Graduate School of Theology', 5),
(1974, 'AMA Computer College-Las Piñas', 5),
(1975, 'AMA Computer College-Pasig City', 5),
(1976, 'Pamantasan ng Lungsod ng Pasig', 5),
(1977, 'Wesleyan College of Manila', 5),
(1978, 'Loral Douglas Woosley Bethany Colleges', 5),
(1979, 'STI College-Marikina', 5),
(1980, 'IETI College of Science and Technology-Marikina', 5),
(1981, 'Manila Business College Foundation', 5),
(1982, 'Access Computer and Technical Colleges-Manila', 5),
(1983, 'Kalayaan College', 5),
(1984, 'Criminal Justice College', 5),
(1985, 'Entrepreneurs School of Asia', 5),
(1986, 'St. Mary\'s College', 5),
(1987, 'ABE International College of Business and Accountancy-Cubao', 5),
(1988, 'ABE International College of Business and Economics-Las Piñas', 5),
(1989, 'Development Academy of the Philippines', 5),
(1990, 'National Christian Life College', 5),
(1991, 'Global City Innovative College', 5),
(1992, 'Southville International School and Colleges', 5),
(1993, 'Information and Communications Technology Academy', 5),
(1994, 'Our Lady of Guadalupe Colleges', 5),
(1995, 'Access Computer and Technical Colleges-Cubao', 5),
(1996, 'Immaculate Heart of Mary College-Parañaque', 5),
(1997, 'Polytechnic University of the Philippines-Quezon City Campus', 5),
(1998, 'Lyceum of Alabang', 5),
(1999, 'Rogationist Seminary College of Philosophy', 5),
(2000, 'La Consolacion College-Pasig', 5),
(2001, 'Gardner College Diliman', 5),
(2002, 'ABE International Business College-Caloocan City', 5),
(2003, 'WCC Aeronautical & Technological College-North Manila', 5),
(2004, 'Informatics College-Northgate', 5),
(2005, 'Pamantasan ng Lungsod ng Valenzuela', 5),
(2006, 'Marie-Bernarde College', 5),
(2007, 'Mary the Queen College of Quezon City', 5),
(2008, 'St. Bernadette of Lourdes College', 5),
(2009, 'Flight School International', 5),
(2010, 'Capitol Medical Center Colleges', 5),
(2011, 'New England College', 5),
(2012, 'Universal Colleges of Parañaque', 5),
(2013, 'Quezon City University', 5),
(2014, 'Pamantasan ng Lungsod ng Marikina', 5),
(2015, 'Valenzuela City Polytechnic College', 5),
(2016, 'South Mansfield College', 5),
(2017, 'St. John of Beverly School', 5),
(2018, 'Jesus Reigns Christian College Foundation', 5),
(2019, 'Villagers Montessori College', 5),
(2020, 'AMA School of Medicine', 5),
(2021, 'Enderun Colleges', 5),
(2022, 'Pateros Technological College', 5),
(2023, 'Messiah College Foundation', 5),
(2024, 'National Polytechnic College of Science and Technology', 5),
(2025, 'Lady of Lourdes Hospital & Colleges of Caybiga', 5),
(2026, 'College of St. Catherine', 5),
(2027, 'Grace Christian College', 5),
(2028, 'Taguig City University', 5),
(2029, 'Centro Escolar University-Makati', 5),
(2030, 'Philippine Cultural College', 5),
(2031, 'Diliman College', 5),
(2032, 'Colegio de Sta. Teresa de Avila Foundation', 5),
(2033, 'The One Nation Entrepreneur School', 5),
(2034, 'Bestlink College of the Philippines', 5),
(2035, 'Global Reciprocal Colleges', 5),
(2036, 'Golden Link College Foundation', 5),
(2037, 'Pacific InterContinental College', 5),
(2038, 'ACLC College of Taguig', 5),
(2039, 'Asian Institute of Computer Studies-Quezon City', 5),
(2040, 'Far Eastern University-Makati', 5),
(2041, 'Infotech College of Arts and Sciences Philippines', 5),
(2042, 'Treston International College', 5),
(2043, 'Access Computer and Technical Colleges-Lagro', 5),
(2044, 'UBIX Institute of Technologies', 5),
(2045, 'College of Divine Wisdom', 5),
(2046, 'Meridian International College of Business and Arts', 5),
(2047, 'La Consolacion College-Valenzuela', 5),
(2048, 'South SEED LPDH College', 5),
(2049, 'Bethel Bible College of the Assemblies of God', 5),
(2050, 'Christ the King College of Science and Technology', 5),
(2051, 'Colegio de San Gabriel Archangel of Caloocan', 5),
(2052, 'St. Vincent de Ferrer College of Camarin', 5),
(2053, 'Datamex College of Saint Adeline-Fairview', 5),
(2054, 'Asian Institute of Computer Studies-Bicutan', 5),
(2055, 'Access Computer and Technical Colleges-Camarin', 5),
(2056, 'Datamex College of Saint Adeline-Valenzuela', 5),
(2057, 'School of Fashion and the Arts', 5),
(2058, 'ICI Global University', 5),
(2059, 'Southville International School', 5),
(2060, 'St. Therese of the Child Jesus Institute of Arts and Sciences', 5),
(2061, 'Arellano University-Mandaluyong', 5),
(2062, 'La Verdad Christian College-Caloocan', 5),
(2063, 'Rizal Technological University-Pasig', 5),
(2064, 'College of Arts and Sciences of Asia and the Pacific', 5),
(2065, 'Eclaro Academy', 5),
(2066, 'Asia Harvesters College and Seminary', 5),
(2067, 'Don Carlo Cavina School', 5),
(2068, 'Integrated Innovation and Hospitality Colleges', 5),
(2069, 'Philippine School of Interior Design- AHLEN Institute', 5),
(2070, 'Recoletos School of Theology', 5),
(2071, 'Dr. Jose Fabella Memorial Hospital School of Midwifery', 5),
(2072, 'CIIT College of Arts and Technology', 5),
(2073, 'Southeast Asia Christian College', 5),
(2074, 'Datamex College of Saint Adeline-Parañaque', 5),
(2075, 'Asian Institute of Science and Technology', 5),
(2076, 'FEU Institute of Technology', 5),
(2077, 'Makati Science Technological Institute of the Philippines', 5),
(2078, 'Electron College of Technical Education', 5),
(2079, 'Marianum College', 5),
(2080, 'Metropolitan Institute of Arts and Sciences', 5),
(2081, 'Sapphire International Aviation Academy', 5),
(2082, 'ACLC College of Marikina', 5),
(2083, 'FEU Alabang', 5),
(2084, 'GK College of Business Arts and Technology', 5),
(2085, 'NBS College', 5),
(2086, 'St. Chamuel College', 5),
(2087, 'College of Saint Amatiel', 5),
(2088, 'South CompEdge College', 5),
(2089, 'United Christian Academy College of Asia', 5),
(2090, 'Colegio de Muntinlupa', 5),
(2091, 'Parañaque City College', 5),
(2092, 'ACLC College of Commonwealth', 5),
(2093, 'ACLC College of Manila', 5),
(2094, 'FEU Diliman', 5),
(2095, 'NU Fairview', 5),
(2096, 'St. Francis Technical Institute', 5),
(2097, 'Abra State Institute of Science and Technology-Bangued', 5),
(2098, 'Abra State Institute of Science and Technology-Main', 5),
(2099, 'Abra Valley Colleges', 5),
(2100, 'Apayao State College-Main', 5),
(2101, 'Baguio Central University', 5),
(2102, 'University of the Cordilleras', 5),
(2103, 'Benguet State University-Bokod Campus', 5),
(2104, 'Benguet State University-Main', 5),
(2105, 'Benguet State University-Open University', 5),
(2106, 'Benguet State University-Buguias Campus', 5),
(2107, 'Cordillera Career Development College', 5),
(2108, 'Divine Word College of Bangued', 5),
(2109, 'Ifugao State University - Lagawe Campus', 5),
(2110, 'Ifugao State University - Main', 5),
(2111, 'Ifugao State University - Potia', 5),
(2112, 'Kalinga State University-Main', 5),
(2113, 'Philippine Nazarene College', 5),
(2114, 'Mountain Province State Polytechnic College-Main', 5),
(2115, 'Mountain Province State Polytechnic College-Tadian', 5),
(2116, 'Pines City Colleges', 5),
(2117, 'Saint Louis College of Bulanao', 5),
(2118, 'Saint Louis University', 5),
(2119, 'San Pablo Major Seminary', 5),
(2120, 'Casiciaco Recoletos Seminary', 5),
(2121, 'University of Baguio', 5),
(2122, 'University of the Philippines-Baguio', 5),
(2123, 'Easter College', 5),
(2124, 'Kalinga State University-Dagupan', 5),
(2125, 'Philippine Military Academy', 5),
(2126, 'Apayao State College-Luna', 5),
(2127, 'Keystone College', 5),
(2128, 'Ifugao State University - Tinoc', 5),
(2129, 'STI College-Baguio', 5),
(2130, 'Baguio College of Technology', 5),
(2131, 'BVS College', 5),
(2132, 'Cordillera A+ Computer Technology College', 5),
(2133, 'AMA Computer College-Baguio', 5),
(2134, 'Data Center College of the Philippines of Bangued-Abra', 5),
(2135, 'Kalinga Colleges of Science and Technology', 5),
(2136, 'Data Center College of the Philippines of Baguio City', 5),
(2137, 'King\'s College of the Philippines-Benguet', 5),
(2138, 'Saint Tonis College', 5),
(2139, 'BSBT College', 5),
(2140, 'Xijen College of Mt. Province', 5),
(2141, 'Kalinga State University-Rizal', 5),
(2142, 'Remnant International College', 5),
(2143, 'International School of Asia and the Pacific', 5),
(2144, 'Philippine College of Ministry', 5),
(2145, 'Ifugao State University-Hapao', 5),
(2146, 'Ifugao State University-Aguinaldo', 5),
(2147, 'Theological Foundation for Asia (Asia Pacific Theological Seminary)', 5),
(2148, 'Star College', 5),
(2149, 'Basilan State College-Lamitan', 5),
(2150, 'Basilan State College-Maluso', 5),
(2151, 'Basilan State College-Sta. Clara', 5);
INSERT INTO `tblinstitution` (`institution_id`, `institution_name`, `institution_points`) VALUES
(2152, 'Basilan State College-Tipo-Tipo', 5),
(2153, 'Cotabato State University', 5),
(2154, 'Cotabato Foundation College of Science and Technology-Datu Montawal Campus', 5),
(2155, 'De La Vida College', 5),
(2156, 'Dr. P. Ocampo Colleges', 5),
(2157, 'Headstart College of Cotabato', 5),
(2158, 'Jamiatu Marawi Al-Islamia Foundation', 5),
(2159, 'Jamiatu Muslim Mindanao', 5),
(2160, 'Jamiatul Philippine Al-Islamia', 5),
(2161, 'Mindanao State University-Lanao National College of Arts and Trades', 5),
(2162, 'Mapandi Memorial College', 5),
(2163, 'Marawi Capitol College Foundation', 5),
(2164, 'Mindanao Capitol College', 5),
(2165, 'Mindanao State University-Main Campus Marawi City', 5),
(2166, 'Notre Dame Center For Catechesis', 5),
(2167, 'Notre Dame Hospital and School of Midwifery', 5),
(2168, 'Notre Dame University', 5),
(2169, 'Pacasum College', 5),
(2170, 'St. Benedict College of Cotabato', 5),
(2171, 'Shariff Kabunsuan College', 5),
(2172, 'Mindanao Islamic Computer College', 5),
(2173, 'STI College-Cotabato', 5),
(2174, 'Datu Mala Muslim Mindanao Islamic College Foundation', 5),
(2175, 'Antonio R. Pacheco College', 5),
(2176, 'AMA Computer College-Cotabato City', 5),
(2177, 'Bubong Marzok Memorial Foundation College', 5),
(2178, 'Senator Ninoy Aquino College Foundation-Marawi', 5),
(2179, 'Kutawato Darrusalam College', 5),
(2180, 'Notre Dame RVM College of Cotabato', 5),
(2181, 'Coland Systems Technology', 5),
(2182, 'Academia de Tecnologia in Mindanao', 5),
(2183, 'Jamiat Cotabato and Institute of Technology', 5),
(2184, 'Gani L. Abpi College', 5),
(2185, 'Central Sulu College', 5),
(2186, 'Hadji Butu School of Arts and Trades', 5),
(2187, 'Lanao Agricultural College', 5),
(2188, 'Lapak Agricultural School', 5),
(2189, 'Mindanao State University-Maguindanao', 5),
(2190, 'Mindanao State University-Sulu Development Technical College', 5),
(2191, 'Mindanao State University-Tawi-Tawi College of Technology and Oceanography', 5),
(2192, 'Notre Dame of Jolo College', 5),
(2193, 'Parang Foundation College', 5),
(2194, 'Shariff Kabunsuan College (Annex)', 5),
(2195, 'Sultan Kudarat Islamic Academy Foundation College', 5),
(2196, 'Sulu State College', 5),
(2197, 'Tawi-Tawi Regional Agricultural College', 5),
(2198, 'Tawi-Tawi Regional Agricultural College - Tarawakan', 5),
(2199, 'Tawi-Tawi Regional Agricultural College - Languyan', 5),
(2200, 'Tawi-Tawi Regional Agricultural College-Simunul', 5),
(2201, 'Tawi-Tawi Regional Agricultural College - Sibutu', 5),
(2202, 'Unda Memorial National Agricultural School', 5),
(2203, 'Upi Agricultural School-Provincial Technical Institute of Agriculture', 5),
(2204, 'Adiong Memorial Polytechnic State College', 5),
(2205, 'Balabagan Trade School', 5),
(2206, 'Del Sur Good Shepherd College', 5),
(2207, 'Southwestern Mindanao Islamic Institute', 5),
(2208, 'Tawi-Tawi School of Midwifery', 5),
(2209, 'Abubakar Computer Learning Center Foundation', 5),
(2210, 'Lanao Educational Institute', 5),
(2211, 'Mahardika Institute of Technology', 5),
(2212, 'Dansalan Polytechnic College', 5),
(2213, 'Philippine Muslim Teachers\' College', 5),
(2214, 'SAL Foundation College', 5),
(2215, 'Mindanao Autonomous College Foundation', 5),
(2216, 'SPA College', 5),
(2217, 'Datu Ibrahim Paglas Memorial College', 5),
(2218, 'Cali Paramedical College Foundation', 5),
(2219, 'Masiricampo Abantas Memorial Educational Center', 5),
(2220, 'Marawi Islamic College', 5),
(2221, 'Saffrullah M. Dipatuan Foundation Academy', 5),
(2222, 'South Upi College', 5),
(2223, 'St. Benedict College of Maguindanao', 5),
(2224, 'Mariam School of Nursing', 5),
(2225, 'Lanao Islamic Paramedical College Foundation', 5),
(2226, 'Regional Madrasah Graduate Academy', 5),
(2227, 'Lake Lanao College', 5),
(2228, 'Wisdom International School for Higher Education Studies', 5),
(2229, 'Datu Blo Umpar Adiong Agricultural School Foundation', 5),
(2230, 'Bai Malgen Mama College', 5),
(2231, 'Eastern Kutawato College', 5),
(2232, 'RC-Al Khwarizmi International College Foundation', 5),
(2233, 'Mindanao Institute of Healthcare Professionals', 5),
(2234, 'Hardam Furigay Colleges Foundation', 5),
(2235, 'University of Southern Mindanao - Buluan', 5),
(2236, 'Philippine Engineering and Agro-Industrial College', 5),
(2237, 'Illana Bay Integrated Computer College', 5),
(2238, 'Khadijah Mohammad Islamic Academy', 5),
(2239, 'Iranun Foundation College', 5),
(2240, 'Lanao Central College', 5),
(2241, 'Sulu College of Technology', 5),
(2242, 'Enthusiastic College', 5),
(2243, 'Hadji Datu Saidona Pendatun Foundation College', 5),
(2244, 'General Diamongun K. Mangondato College of Agriculture and Fisheries', 5),
(2245, 'Al Bangsamoro Shari\'ah and Professional Education College', 5),
(2246, 'As-Salihein Integrated School Foundation', 5),
(2247, 'Mindanao Autonomous College Foundation-Maluso', 5),
(2248, 'Jamiatu Dansalan Al-Islamia Foundation', 5),
(2249, 'Muslim Mindanao Integrated College Academy', 5),
(2250, 'Maranao Islamic Institute - Ma\'Had Maranao Al-Islamie', 5),
(2251, 'Binnor Pangandaman Integrated College', 5),
(2252, 'Colegio de Upi', 5),
(2253, 'Lamitan Technical Institute', 5),
(2254, 'Mindanaoan Integrated Academy', 5),
(2255, 'Universal College Foundation of Southeast Asia and the Pacific', 5),
(2256, 'Tamparan Populace Islamic College', 5),
(2257, 'Philippine Last Frontier College', 5),
(2258, 'Iqra Development Academy', 5),
(2259, 'Asma Khadijah Islamic Academy', 5),
(2260, 'Agusan Colleges', 5),
(2261, 'Agusan del Sur College', 5),
(2262, 'Agusan Del Sur State College of Agriculture and Technology', 5),
(2263, 'Asian College Foundation', 5),
(2264, 'Butuan City Colleges', 5),
(2265, 'Butuan Doctors\' College', 5),
(2266, 'Don Jose Ecleo Memorial College', 5),
(2267, 'Elisa R. Ochoa Memorial Northern Mindanao School of Midwifery', 5),
(2268, 'Northern Mindanao Colleges', 5),
(2269, 'Caraga State University-Cabadbaran Campus', 5),
(2270, 'Caraga State University-Main Campus', 5),
(2271, 'Northwestern Agusan Colleges', 5),
(2272, 'Philippine Normal University-Mindanao Campus', 5),
(2273, 'Saint Francis Xavier College', 5),
(2274, 'Saint Joseph Institute of Technology', 5),
(2275, 'St. Jude Thaddeus Institute of Technology', 5),
(2276, 'San Francisco Colleges', 5),
(2277, 'St. Paul University Surigao', 5),
(2278, 'Surigao State College of Technology-Main', 5),
(2279, 'Surigao Education Center', 5),
(2280, 'Father Saturnino Urios University', 5),
(2281, 'Northeastern Mindanao Colleges', 5),
(2282, 'Surigao State College of Technology-Del Carmen', 5),
(2283, 'Andres Soriano Colleges of Bislig', 5),
(2284, 'Saint Michael College-Cantilan', 5),
(2285, 'Saint Theresa College of Tandag', 5),
(2286, 'Saint Vincent de Paul Diocesan College', 5),
(2287, 'North Eastern Mindanao State University-Cagwait', 5),
(2288, 'North Eastern Mindanao State University-Lianga', 5),
(2289, 'North Eastern Mindanao State University-Tagbina', 5),
(2290, 'North Eastern Mindanao State University-San Miguel', 5),
(2291, 'Southern Technological Institute of the Philippines', 5),
(2292, 'Surigao Sur Colleges', 5),
(2293, 'North Eastern Mindanao State University-Cantilan', 5),
(2294, 'North Eastern Mindanao State University-Main', 5),
(2295, 'University of Southeastern Philippines-Bislig Campus', 5),
(2296, 'Siargao Island Institute of Technology', 5),
(2297, 'Caraga Institute of Technology', 5),
(2298, 'De La Salle John Bosco College', 5),
(2299, 'Mt. Carmel College of San Francisco', 5),
(2300, 'Surigao State College of Technology-Malimono', 5),
(2301, 'Saint Michael College of Caraga', 5),
(2302, 'Southway College of Technology', 5),
(2303, 'Holy Child Colleges of Butuan City', 5),
(2304, 'STI College-Surigao', 5),
(2305, 'Balite Institute of Technology-Butuan', 5),
(2306, 'Saint Peter College Seminary', 5),
(2307, 'Bucas Grande Foundation College', 5),
(2308, 'ACLC College of Butuan City', 5),
(2309, 'Hinatuan Southern College', 5),
(2310, 'Philippine Electronics and Communication Institute of Technology', 5),
(2311, 'Candelaria Institute of Technology of Cabadbaran', 5),
(2312, 'Surigao Doctors\' College', 5),
(2313, 'Surigao State College of Technology-Mainit', 5),
(2314, 'Merchant Marine Academy of Caraga', 5),
(2315, 'Caraga School of Business', 5),
(2316, 'Abada College', 5),
(2317, 'Colegio De San Sebastian-Sablayan', 5),
(2318, 'Divine Word College of Calapan', 5),
(2319, 'Divine Word College of San Jose', 5),
(2320, 'Eastern Mindoro College', 5),
(2321, 'EMA EMITS College Philippines', 5),
(2322, 'Grace Mission College', 5),
(2323, 'Holy Trinity University', 5),
(2324, 'St. Mary\'s College of Marinduque', 5),
(2325, 'Luna Goco Colleges-Calapan', 5),
(2326, 'Marinduque State University-Main Campus', 5),
(2327, 'Mindoro State University-Main Campus', 5),
(2328, 'Marinduque State University-Torrijos Campus', 5),
(2329, 'Occidental Mindoro State College', 5),
(2330, 'Western Philippines University', 5),
(2331, 'Western Philippines University-El Nido', 5),
(2332, 'Western Philippines University-Busuanga', 5),
(2333, 'Western Philippines University-Culion', 5),
(2334, 'Western Philippines University-Quezon', 5),
(2335, 'Western Philippines University-Rio Tuba', 5),
(2336, 'Palawan Polytechnic College', 5),
(2337, 'Palawan State University', 5),
(2338, 'Palawan State University-Narra', 5),
(2339, 'Palawan State University-Dumaran', 5),
(2340, 'Palawan State University- Balabac', 5),
(2341, 'Palawan State University-Bataraza', 5),
(2342, 'Palawan State University-Sofronio Española', 5),
(2343, 'Romblon State University-San Andres Campus', 5),
(2344, 'Romblon State University-Main', 5),
(2345, 'Saint Augustine Seminary', 5),
(2346, 'San Francisco Javier College', 5),
(2347, 'Santa Cruz Institute-Marinduque', 5),
(2348, 'Seminario De San Jose', 5),
(2349, 'Educational Systems Technological Institute', 5),
(2350, 'Occidental Mindoro State College-Labangan Campus', 5),
(2351, 'Romblon State University-San Fernando Campus', 5),
(2352, 'CLCC Institute of Computer Arts & Technology', 5),
(2353, 'Mindoro State University-Calapan City Campus', 5),
(2354, 'Fullbright College', 5),
(2355, 'Marinduque Midwest College', 5),
(2356, 'Mindoro State University-Bongabong Campus', 5),
(2357, 'Occidental Mindoro State College-Murtha Campus', 5),
(2358, 'Occidental Mindoro State College-Mamburao', 5),
(2359, 'Occidental Mindoro State College-Sablayan Campus', 5),
(2360, 'Prince of Peace College', 5),
(2361, 'John Paul College', 5),
(2362, 'Marinduque State University-Gasan Campus', 5),
(2363, 'Marinduque State University-Sta. Cruz Campus', 5),
(2364, 'Palawan State University-Araceli', 5),
(2365, 'Palawan State University- Brooke\'s Point', 5),
(2366, 'Palawan State University-Coron', 5),
(2367, 'Palawan State University-Cuyo', 5),
(2368, 'Palawan State University-Quezon', 5),
(2369, 'Palawan State University-Roxas', 5),
(2370, 'Palawan State University-Taytay', 5),
(2371, 'Romblon State University-Calatrava Campus', 5),
(2372, 'Romblon State University-San Agustin Campus', 5),
(2373, 'Romblon State University-Cajidiocan Campus', 5),
(2374, 'Romblon State University-Sta. Fe Campus', 5),
(2375, 'Romblon State University-Sta. Maria Campus', 5),
(2376, 'Romblon State University-Romblon Campus', 5),
(2377, 'Western Philippines University-Puerto Princesa', 5),
(2378, 'San Lorenzo Ruiz Seminary', 5),
(2379, 'Palawan State University-New Ibajay El Nido', 5),
(2380, 'Palawan State University-Rizal', 5),
(2381, 'Clarendon College', 5),
(2382, 'Mina de Oro Institute of Science and Technology', 5),
(2383, 'Ark of the Covenant Montessori Chamber of Learning College', 5),
(2384, 'Palawan Technological College', 5),
(2385, 'Innovative College of Science and Technology', 5),
(2386, 'St. Anthony College-Calapan City', 5),
(2387, 'Polytechnic University of the Philippines-Bansud Campus', 5),
(2388, 'Polytechnic University of the Philippines-Sablayan Campus', 5),
(2389, 'Southwestern Institute of Business and Technology', 5),
(2390, 'Paradigm Colleges of Science and Technology', 5),
(2391, 'Erhard Systems Technological Institute', 5),
(2392, 'Institute of Business Science and Medical Arts', 5),
(2393, 'Philippine Central Islands College Foundation', 5),
(2394, 'ACLC College of Calapan', 5),
(2395, 'Pinamalayan Maritime Foundation and Technological College', 5),
(2396, 'STI College-Puerto Princesa', 5),
(2397, 'City College of Calapan', 5),
(2398, 'Palawan State University-Linapacan', 5),
(2399, 'Palawan State University-San Rafael Puerto Princesa City', 5),
(2400, 'Romblon State University-San Jose Campus', 5),
(2401, 'Palawan State University-San Vicente', 5),
(2402, 'Baco Community College', 5),
(2403, 'Erhard Science and Technological Institute-Oriental Mindoro', 5),
(2404, 'Malindig Institute Foundation', 5),
(2405, 'Southwestern College of Maritime Business and Technology', 5),
(2406, 'Occidental Mindoro State College-Lubang Campus', 5),
(2407, 'Pola Community College', 5),
(2408, 'San Brendan College', 5),
(2409, 'Colegio de Puerto Galera', 5);

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

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcategory`
--

CREATE TABLE `tblinterviewcategory` (
  `interview_categ_id` int(11) NOT NULL,
  `interview_categ_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcriteria`
--

CREATE TABLE `tblinterviewcriteria` (
  `criteria_inter_id` int(11) NOT NULL,
  `criteria_inter_name` text NOT NULL,
  `criteria_inter_categId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewcriteriamaster`
--

CREATE TABLE `tblinterviewcriteriamaster` (
  `inter_criteria_id` int(11) NOT NULL,
  `inter_criteria_jobId` int(11) NOT NULL,
  `inter_criteria_categId` int(11) NOT NULL,
  `inter_criteria_name` text NOT NULL,
  `inter_criteria_points` int(11) NOT NULL,
  `inter_criteria_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinterviewpassingpercent`
--

CREATE TABLE `tblinterviewpassingpercent` (
  `passing_id` int(11) NOT NULL,
  `passing_jobId` int(11) NOT NULL,
  `passing_percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinterviewpassingpercent`
--

INSERT INTO `tblinterviewpassingpercent` (`passing_id`, `passing_jobId`, `passing_percent`) VALUES
(1, 1, 50),
(2, 2, 55),
(3, 3, 50),
(4, 4, 50),
(5, 5, 50),
(6, 6, 50),
(7, 7, 50),
(8, 8, 50),
(9, 9, 50),
(10, 10, 50),
(11, 11, 50),
(12, 1, 50),
(13, 2, 50),
(14, 3, 50),
(15, 4, 50),
(16, 5, 50),
(17, 6, 50),
(18, 7, 50),
(19, 8, 50),
(20, 9, 50),
(21, 10, 50),
(22, 11, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobpassing`
--

CREATE TABLE `tbljobpassing` (
  `passing_id` int(20) NOT NULL,
  `passing_jobId` int(11) NOT NULL,
  `passing_points` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobpassing`
--

INSERT INTO `tbljobpassing` (`passing_id`, `passing_jobId`, `passing_points`) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 50),
(4, 4, 70),
(5, 5, 69),
(6, 6, 90),
(7, 7, 30),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobseducation`
--

CREATE TABLE `tbljobseducation` (
  `jeduc_id` int(11) NOT NULL,
  `jeduc_jobId` int(11) NOT NULL,
  `jeduc_text` text NOT NULL,
  `jeduc_categoryId` int(11) NOT NULL,
  `jeduc_points` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobseducation`
--

INSERT INTO `tbljobseducation` (`jeduc_id`, `jeduc_jobId`, `jeduc_text`, `jeduc_categoryId`, `jeduc_points`) VALUES
(1, 1, 'While a high school diploma or its equivalent is common, some employers may prefer candidates with an associate’s or bachelor’s degree in animal science, agriculture, or a related field', 2, 100),
(2, 8, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', 2, 5),
(3, 8, 'Etiam dapibus non ante quis fermentum. Aliquam nibh ipsum, tincidunt id nisl posuere, commodo viverra orci. Donec sagittis libero ultrices velit auctor faucibus. Nunc quis congue sapien. Sed iaculis augue vitae tortor dignissim tristique. Nunc vulputate, tortor a iaculis porta, velit augue egestas lacus, sed pellentesque neque tellus eu odio. Morbi vehicula sit amet urna tempus aliquam. Pellentesque id dui at augue lobortis congue quis vel lacus. Quisque ac erat turpis. Donec ligula est, faucibus sed purus sit amet, imperdiet volutpat augue. Proin eget sapien sed metus sodales lobortis quis ut mauris. Fusce rhoncus semper enim, nec venenatis nibh gravida et. Vestibulum tempus eros eu arcu sollicitudin rutrum.', 9, 30),
(4, 9, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', 2, 5),
(5, 9, 'Etiam dapibus non ante quis fermentum. Aliquam nibh ipsum, tincidunt id nisl posuere, commodo viverra orci. Donec sagittis libero ultrices velit auctor faucibus. Nunc quis congue sapien. Sed iaculis augue vitae tortor dignissim tristique. Nunc vulputate, tortor a iaculis porta, velit augue egestas lacus, sed pellentesque neque tellus eu odio. Morbi vehicula sit amet urna tempus aliquam. Pellentesque id dui at augue lobortis congue quis vel lacus. Quisque ac erat turpis. Donec ligula est, faucibus sed purus sit amet, imperdiet volutpat augue. Proin eget sapien sed metus sodales lobortis quis ut mauris. Fusce rhoncus semper enim, nec venenatis nibh gravida et. Vestibulum tempus eros eu arcu sollicitudin rutrum.', 9, 30),
(6, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', 2, 10),
(7, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', 3, 5),
(8, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.', 2, 50),
(9, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.', 3, 300),
(10, 11, 'arts mo to', 5, 200);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsknowledge`
--

CREATE TABLE `tbljobsknowledge` (
  `jknow_id` int(11) NOT NULL,
  `jknow_jobId` int(11) NOT NULL,
  `jknow_text` text NOT NULL,
  `jknow_knowledgeId` int(11) NOT NULL,
  `jknow_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsknowledge`
--

INSERT INTO `tbljobsknowledge` (`jknow_id`, `jknow_jobId`, `jknow_text`, `jknow_knowledgeId`, `jknow_points`) VALUES
(8, 1, 'Knowledge of modern technologies used in livestock farming, such as automated feeding systems, health monitoring devices, and genetic testing.', 3, 0),
(9, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo. Project Manager', 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobslicense`
--

CREATE TABLE `tbljobslicense` (
  `jlicense_id` int(11) NOT NULL,
  `jlicense_licenceMId` int(11) NOT NULL,
  `jlicense_jobId` int(11) NOT NULL,
  `jlicense_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobslicense`
--

INSERT INTO `tbljobslicense` (`jlicense_id`, `jlicense_licenceMId`, `jlicense_jobId`, `jlicense_points`) VALUES
(2, 9, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsmaster`
--

CREATE TABLE `tbljobsmaster` (
  `jobM_id` int(20) NOT NULL,
  `jobM_title` varchar(250) NOT NULL,
  `jobM_description` text NOT NULL,
  `jobM_createdAt` datetime DEFAULT NULL,
  `jobM_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsmaster`
--

INSERT INTO `tbljobsmaster` (`jobM_id`, `jobM_title`, `jobM_description`, `jobM_createdAt`, `jobM_status`) VALUES
(1, 'Livestock Production Supervisor', 'A Livestock Supervisor oversees daily operations on farms that raise animals for consumption or product use. They manage feeding, health care, and humane treatment of livestock, supervise farm workers, and prepare reports on production and management. Additionally, they coordinate breeding, monitor animal health, and ensure compliance with regulations. If you’re interested in related roles, Livestock Production Managers oversee farm operations for milk, meat, wool, and other products, focusing on safety and yield optimization. ', '2024-08-06 08:48:22', 1),
(2, 'Production Supervisor', '', '2024-08-01 12:48:39', 0),
(3, 'Marketing Intern', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', '2024-08-08 01:48:52', 0),
(4, 'Commercial Capability Development Intern', '', '2024-08-12 18:49:03', 0),
(5, 'Production Shift Supervisor (Tetra Line)', '', '2024-08-15 07:49:19', 0),
(6, 'Quality Assurance Analyst', '', '2024-08-16 09:49:28', 0),
(7, 'Human Resources Supervisor', '', '2024-08-10 16:49:40', 0),
(8, 'Kunwari Job title', 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', '2024-08-23 08:49:55', 0),
(9, 'Kunwari Job title', 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.', '2024-08-23 10:50:05', 0),
(10, 'Programmer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', '2024-08-24 10:50:15', 1),
(11, 'Janitor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vehicula dui gravida ligula fringilla, sed scelerisque mi placerat. Sed in feugiat elit. Donec sed lorem viverra, pharetra risus id, congue tortor. Proin aliquet risus sed neque imperdiet feugiat. Curabitur blandit mattis odio lacinia sollicitudin. Curabitur tempor risus quis sem bibendum aliquet. Integer vel nulla vel risus euismod molestie et sit amet tortor. Sed lacinia, felis id ullamcorper condimentum, odio enim posuere nisi, vitae faucibus nisi libero vel risus. Suspendisse malesuada enim eget nulla mollis, eu tempor quam cursus. Maecenas blandit luctus turpis, et venenatis nulla aliquam eget. In in lectus blandit, eleifend diam in, vehicula nibh.', '2024-09-12 09:30:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsmasterduties`
--

CREATE TABLE `tbljobsmasterduties` (
  `duties_id` int(11) NOT NULL,
  `duties_jobId` int(11) NOT NULL,
  `duties_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsmasterduties`
--

INSERT INTO `tbljobsmasterduties` (`duties_id`, `duties_jobId`, `duties_text`) VALUES
(1, 1, 'Daily Operations: Managing the daily operations of the livestock farm, including feeding and health care of animals.'),
(2, 1, 'Health Monitoring: Inspecting livestock for signs of illness, injury, or unusual behavior and notifying veterinarians or veterinary technicians of any issues.'),
(3, 1, 'Humane Treatment: Ensuring all animals are treated humanely and in accordance with government regulations.'),
(4, 8, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.'),
(5, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.'),
(6, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.'),
(7, 9, 'Nunc nibh justo, sodales ut nunc vitae, fermentum molestie erat. Cras feugiat mauris placerat, imperdiet augue nec, pulvinar ante. Morbi gravida, nisi at aliquam mollis, sem eros rhoncus arcu, in maximus sapien dolor ut orci. Nunc vel commodo nisl, sed sollicitudin est. Nullam auctor gravida mollis. Aenean finibus semper neque, blandit bibendum libero dignissim eu. Duis justo orci, efficitur nec auctor sed, interdum sit amet neque. Cras dignissim facilisis sem, in viverra nisl interdum vel. Vestibulum lacinia semper ligula, at consectetur tortor iaculis id. Sed interdum dignissim mollis. Nunc nisi sapien, condimentum in quam quis, vehicula semper massa.'),
(8, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.'),
(9, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus velit fringilla arcu suscipit, sed blandit est viverra. Nunc finibus elit id dictum maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis tristique commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. In velit purus, interdum eu eros sit amet, posuere dignissim lectus. Donec massa erat, iaculis in sodales ut, dictum et magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis venenatis suscipit sodales. Donec quis consequat libero. Ut maximus ultrices tortor, eget iaculis felis molestie ac. Cras non pharetra dui. Cras ac magna justo.'),
(10, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.'),
(11, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.'),
(12, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vehicula dui gravida ligula fringilla, sed scelerisque mi placerat. Sed in feugiat elit. Donec sed lorem viverra, pharetra risus id, congue tortor. Proin aliquet risus sed neque imperdiet feugiat. Curabitur blandit mattis odio lacinia sollicitudin. Curabitur tempor risus quis sem bibendum aliquet. Integer vel nulla vel risus euismod molestie et sit amet tortor. Sed lacinia, felis id ullamcorper condimentum, odio enim posuere nisi, vitae faucibus nisi libero vel risus. Suspendisse malesuada enim eget nulla mollis, eu tempor quam cursus. Maecenas blandit luctus turpis, et venenatis nulla aliquam eget. In in lectus blandit, eleifend diam in, vehicula nibh.'),
(13, 11, 'Ut nec enim et nisl suscipit dignissim. Nulla odio sem, commodo eget dictum ac, consectetur ac neque. Pellentesque fringilla sed neque vitae bibendum. Fusce vel nibh eu arcu iaculis vulputate mattis eleifend nulla. Nullam libero elit, sodales sed enim a, ullamcorper tincidunt urna. Proin ac commodo tortor, sit amet congue nisi. Maecenas bibendum nunc quis feugiat bibendum. Aenean egestas vulputate nisi eget dictum.');

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsskills`
--

CREATE TABLE `tbljobsskills` (
  `jskills_id` int(11) NOT NULL,
  `jskills_jobId` int(11) NOT NULL,
  `jskills_text` text NOT NULL,
  `jskills_skillsId` int(11) NOT NULL,
  `jskills_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsskills`
--

INSERT INTO `tbljobsskills` (`jskills_id`, `jskills_jobId`, `jskills_text`, `jskills_skillsId`, `jskills_points`) VALUES
(1, 1, 'Ability to oversee daily operations, manage farm laborers, and implement animal husbandry protocols.', 0, 0),
(2, 8, 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 2, 30),
(3, 8, 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 9, 30),
(4, 9, 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 2, 30),
(5, 9, 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 9, 30),
(6, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', 2, 30),
(7, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.', 1, 100),
(8, 11, 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.', 2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobstrainings`
--

CREATE TABLE `tbljobstrainings` (
  `jtrng_id` int(11) NOT NULL,
  `jtrng_jobId` int(11) NOT NULL,
  `jtrng_text` text NOT NULL,
  `jtrng_trainingId` int(11) NOT NULL,
  `jtrng_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobstrainings`
--

INSERT INTO `tbljobstrainings` (`jtrng_id`, `jtrng_jobId`, `jtrng_text`, `jtrng_trainingId`, `jtrng_points`) VALUES
(10, 1, '', 1, 35),
(11, 1, '', 7, 35);

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsworkexperience`
--

CREATE TABLE `tbljobsworkexperience` (
  `jwork_id` int(11) NOT NULL,
  `jwork_jobId` int(11) NOT NULL,
  `jwork_duration` text NOT NULL,
  `jwork_responsibilities` text NOT NULL,
  `jwork_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljobsworkexperience`
--

INSERT INTO `tbljobsworkexperience` (`jwork_id`, `jwork_jobId`, `jwork_duration`, `jwork_responsibilities`, `jwork_points`) VALUES
(1, 1, '3', 'supervisory experience in a Tetra Manufacturing Line.', 0),
(2, 8, '2', 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 0),
(3, 9, '2', 'Nunc feugiat quis dolor vel convallis. Phasellus feugiat tempor justo. Maecenas a sodales elit, quis vulputate tortor. Aenean a sodales ligula. Aenean ac arcu hendrerit, vestibulum leo id, tincidunt orci. Nunc sagittis vitae felis non ullamcorper. Donec ante ligula, vestibulum nec sem a, luctus pretium augue. Aliquam imperdiet euismod sapien vel interdum. Quisque nec ex est. Phasellus posuere gravida ex, sed sagittis metus blandit ac. Ut non nisi lacinia, pellentesque ante at, scelerisque nibh. Nullam dui enim, venenatis at risus eleifend, cursus bibendum purus. Morbi et gravida lorem.', 0),
(4, 10, '10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit congue tellus id interdum. Aliquam id orci vitae velit dictum facilisis. Donec auctor condimentum eros, id dictum leo. Duis eros augue, eleifend id volutpat euismod, pharetra id magna. Nulla facilisi. Phasellus volutpat arcu nec egestas interdum. Morbi aliquet placerat dictum. Maecenas vel ipsum nisi.', 0),
(5, 11, '1', 'Curabitur tempor pellentesque risus, eu viverra ex suscipit nec. Duis faucibus luctus diam, vitae suscipit est porta ac. In eleifend molestie semper. In ut lacinia sem. Pellentesque in mollis mi. Vivamus vel gravida libero. Nam non quam eu urna varius ultricies nec nec sapien. In hac habitasse platea dictumst. Curabitur varius orci lacus, nec vestibulum nunc viverra sed. Project Etiam id finibus arcu, quis consequat quam. Duis pharetra mi leo, nec venenatis arcu pulvinar quis. Morbi iaculis augue orci, sit amet convallis ligula facilisis nec. Sed luctus non ante ac luctus. Morbi leo orci, porttitor quis iaculis a, lobortis eget velit. Praesent varius cursus commodo.\nJanitor manager', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbllicensemaster`
--

CREATE TABLE `tbllicensemaster` (
  `license_master_id` int(11) NOT NULL,
  `license_master_name` varchar(100) NOT NULL,
  `license_master_typeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllicensemaster`
--

INSERT INTO `tbllicensemaster` (`license_master_id`, `license_master_name`, `license_master_typeId`) VALUES
(1, 'Accountancy', 1),
(2, 'Aeronautical Engineering\r\n', 1),
(3, 'Agricultural Engineering\r\n', 1),
(4, 'Agricultural and Biosystems Engineering\r\n', 1),
(5, 'Agriculture', 1),
(6, 'Architecture', 1),
(7, 'Chemical Engineering\r\n', 1),
(8, 'Chemistry', 1),
(9, 'Civil Engineering\r\n', 1),
(10, 'Criminology', 1),
(11, 'Customs Brokers\r\n', 1),
(12, 'Dentistry', 1),
(13, 'Electronics Engineering\r\n', 1),
(14, 'Electrical Engineering\r\n', 1),
(15, 'Environmental Planning\r\n', 1),
(16, 'Fisheries Technology\r\n', 1),
(17, 'Forestry', 1),
(18, 'Geodetic Engineering\r\n', 1),
(19, 'Geology\r\n', 1),
(20, 'Guidance and Counseling\r\n', 1),
(21, 'Interior Design\r\n', 1),
(22, 'Landscape Architecture\r\n', 1),
(23, 'Librarianship\r\n', 1),
(24, 'Marine Deck and Marine Engineer Officers\r\n', 1),
(25, 'Mechanical Engineering\r\n', 1),
(26, 'Medical Technology\r\n', 1),
(27, 'Medicine', 1),
(28, 'Midwifery', 1),
(29, 'Mining Engineering\r\n', 1),
(30, 'Naval Architecture\r\n', 1),
(31, 'Nursing\r\n', 1),
(32, 'Nutrition and Dietetics\r\n', 1),
(33, 'Occupational Therapy\r\n', 1),
(34, 'Optometry\r\n', 1),
(35, 'Pharmacy', 1),
(36, 'Physical Therapy\r\n', 1),
(37, 'Professional Teachers\r\n', 1),
(38, 'Psychology', 1),
(39, 'Radiologic Technology\r\n', 1),
(40, 'Real Estate Service\r\n', 1),
(41, 'Respiratory Therapy\r\n', 1),
(42, 'Sanitary Engineering\r\n', 1),
(43, 'Social Work\r\n', 1),
(44, 'Speech-Language Pathology\r\n', 1),
(45, 'Veterinary Medicine\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbllicensetype`
--

CREATE TABLE `tbllicensetype` (
  `license_type_id` int(11) NOT NULL,
  `license_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllicensetype`
--

INSERT INTO `tbllicensetype` (`license_type_id`, `license_type_name`) VALUES
(1, ' Professional Regulation Commission (PRC)');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonalknowledge`
--

CREATE TABLE `tblpersonalknowledge` (
  `knowledge_id` int(11) NOT NULL,
  `knowledge_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersonalknowledge`
--

INSERT INTO `tblpersonalknowledge` (`knowledge_id`, `knowledge_name`) VALUES
(1, 'Quality Management Practices (QMP)\r\n'),
(2, 'Hazard Analysis and Critical Control Points (HACCP)\r\n'),
(3, 'Good Manufacturing Practices (GMP)\r\n'),
(4, 'Food Safety Management Systems (FSMS)');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonalskills`
--

CREATE TABLE `tblpersonalskills` (
  `perS_id` int(20) NOT NULL,
  `perS_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersonalskills`
--

INSERT INTO `tblpersonalskills` (`perS_id`, `perS_name`) VALUES
(1, 'Project management'),
(2, 'Data analysis'),
(3, 'Computer literacy'),
(4, 'Organizational Skills'),
(5, 'Technical Aptitude'),
(6, 'Machine Learning'),
(7, 'Leadership '),
(8, 'Data visualization'),
(9, 'Presentation competency'),
(10, 'Research expertise');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonaltraining`
--

CREATE TABLE `tblpersonaltraining` (
  `perT_id` int(20) NOT NULL,
  `perT_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersonaltraining`
--

INSERT INTO `tblpersonaltraining` (`perT_id`, `perT_name`) VALUES
(1, 'Human Resources Manager'),
(2, 'Event Coordinator'),
(3, 'Project Manager (Web Development)'),
(4, 'Sales Trainer'),
(5, 'Customer Support Trainer'),
(6, 'Technical Trainer (Software Development)'),
(7, 'Operations Trainer'),
(8, 'Sales and Marketing Trainer'),
(9, 'Retail Training Manager'),
(10, 'IT Trainer');

-- --------------------------------------------------------

--
-- Table structure for table `tblstatus`
--

CREATE TABLE `tblstatus` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblstatus`
--

INSERT INTO `tblstatus` (`status_id`, `status_name`) VALUES
(1, 'Pending'),
(2, 'Process'),
(3, 'Accept'),
(4, 'Decline'),
(5, 'Exam'),
(6, 'Interview');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupervisor`
--

CREATE TABLE `tblsupervisor` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(50) NOT NULL,
  `sup_email` varchar(50) NOT NULL,
  `sup_password` varchar(50) NOT NULL,
  `sup_user_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsupervisor`
--

INSERT INTO `tblsupervisor` (`sup_id`, `sup_name`, `sup_email`, `sup_password`, `sup_user_level`) VALUES
(1, 'jake', 'jake@gmail.com', 'jake', 'supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `tbluserlevel`
--

CREATE TABLE `tbluserlevel` (
  `userL_id` int(11) NOT NULL,
  `userL_level` decimal(4,1) NOT NULL,
  `UserL_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluserlevel`
--

INSERT INTO `tbluserlevel` (`userL_id`, `userL_level`, `UserL_description`) VALUES
(1, 1.0, 'Candidates'),
(2, 100.0, 'Admin'),
(3, 200.0, 'Super Admin'),
(4, 50.0, 'HR Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`adm_id`),
  ADD KEY `adm_userLevel` (`adm_userLevel`);

--
-- Indexes for table `tblapplications`
--
ALTER TABLE `tblapplications`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `personal_info_id` (`app_candId`),
  ADD KEY `apply_position_id` (`app_jobMId`);

--
-- Indexes for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  ADD PRIMARY KEY (`appS_id`),
  ADD KEY `appS_appId` (`appS_appId`),
  ADD KEY `appS_statusId` (`appS_statusId`);

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
  ADD KEY `institution_id` (`educ_institutionId`);

--
-- Indexes for table `tblcandemploymenthistory`
--
ALTER TABLE `tblcandemploymenthistory`
  ADD PRIMARY KEY (`empH_id`),
  ADD KEY `personal_info_id` (`empH_candId`);

--
-- Indexes for table `tblcandidates`
--
ALTER TABLE `tblcandidates`
  ADD PRIMARY KEY (`cand_id`);

--
-- Indexes for table `tblcandknowledge`
--
ALTER TABLE `tblcandknowledge`
  ADD PRIMARY KEY (`canknow_id`),
  ADD KEY `canknow_canId` (`canknow_canId`),
  ADD KEY `canknow_knowledgeId` (`canknow_knowledgeId`);

--
-- Indexes for table `tblcandlicense`
--
ALTER TABLE `tblcandlicense`
  ADD PRIMARY KEY (`license_id`),
  ADD KEY `license_canId` (`license_canId`),
  ADD KEY `license_masterId` (`license_masterId`);

--
-- Indexes for table `tblcandresume`
--
ALTER TABLE `tblcandresume`
  ADD PRIMARY KEY (`canres_id`);

--
-- Indexes for table `tblcandskills`
--
ALTER TABLE `tblcandskills`
  ADD PRIMARY KEY (`skills_id`),
  ADD KEY `personal_info_id` (`skills_candId`),
  ADD KEY `personal_skills_id` (`skills_perSId`);

--
-- Indexes for table `tblcandtraining`
--
ALTER TABLE `tblcandtraining`
  ADD PRIMARY KEY (`training_id`),
  ADD KEY `personal_info_id` (`training_candId`),
  ADD KEY `personal_training_id` (`training_perTId`);

--
-- Indexes for table `tblcourses`
--
ALTER TABLE `tblcourses`
  ADD PRIMARY KEY (`courses_id`),
  ADD KEY `course_category_id` (`courses_coursecategoryId`),
  ADD KEY `tblcourses_ibfk_1` (`courses_courseTypeId`);

--
-- Indexes for table `tblcoursescategory`
--
ALTER TABLE `tblcoursescategory`
  ADD PRIMARY KEY (`course_categoryId`);

--
-- Indexes for table `tblcoursetype`
--
ALTER TABLE `tblcoursetype`
  ADD PRIMARY KEY (`crs_type_id`);

--
-- Indexes for table `tblexam`
--
ALTER TABLE `tblexam`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `exam_typeId` (`exam_typeId`),
  ADD KEY `exam_jobMId` (`exam_jobMId`);

--
-- Indexes for table `tblexamapplicantanswer`
--
ALTER TABLE `tblexamapplicantanswer`
  ADD PRIMARY KEY (`examA_id`),
  ADD KEY `examA_choiceId` (`examA_choiceId`),
  ADD KEY `examA_questionId` (`examA_questionId`),
  ADD KEY `examA_resultId` (`examA_resultId`);

--
-- Indexes for table `tblexamchoices`
--
ALTER TABLE `tblexamchoices`
  ADD PRIMARY KEY (`examC_id`);

--
-- Indexes for table `tblexamquestion`
--
ALTER TABLE `tblexamquestion`
  ADD PRIMARY KEY (`examQ_id`),
  ADD KEY `examQ_examId` (`examQ_examId`),
  ADD KEY `examQ_typeId` (`examQ_typeId`);

--
-- Indexes for table `tblexamquestiontype`
--
ALTER TABLE `tblexamquestiontype`
  ADD PRIMARY KEY (`questionT_id`);

--
-- Indexes for table `tblexamresult`
--
ALTER TABLE `tblexamresult`
  ADD PRIMARY KEY (`examR_id`),
  ADD KEY `examR_candId` (`examR_candId`),
  ADD KEY `examR_examId` (`examR_examId`);

--
-- Indexes for table `tblexamtype`
--
ALTER TABLE `tblexamtype`
  ADD PRIMARY KEY (`examT_id`);

--
-- Indexes for table `tblforgotpassword`
--
ALTER TABLE `tblforgotpassword`
  ADD PRIMARY KEY (`forgotpass_id`),
  ADD KEY `personal_info_id` (`forgotpass_candId`);

--
-- Indexes for table `tblinstitution`
--
ALTER TABLE `tblinstitution`
  ADD PRIMARY KEY (`institution_id`);

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
  ADD PRIMARY KEY (`interview_categ_id`);

--
-- Indexes for table `tblinterviewcriteria`
--
ALTER TABLE `tblinterviewcriteria`
  ADD PRIMARY KEY (`criteria_inter_id`),
  ADD KEY `criteria_inter_categId` (`criteria_inter_categId`);

--
-- Indexes for table `tblinterviewcriteriamaster`
--
ALTER TABLE `tblinterviewcriteriamaster`
  ADD PRIMARY KEY (`inter_criteria_id`),
  ADD KEY `inter_criteria_interviewId` (`inter_criteria_jobId`),
  ADD KEY `inter_criteria_categId` (`inter_criteria_categId`);

--
-- Indexes for table `tblinterviewpassingpercent`
--
ALTER TABLE `tblinterviewpassingpercent`
  ADD PRIMARY KEY (`passing_id`),
  ADD KEY `passing_jobId` (`passing_jobId`);

--
-- Indexes for table `tbljobpassing`
--
ALTER TABLE `tbljobpassing`
  ADD PRIMARY KEY (`passing_id`);

--
-- Indexes for table `tbljobseducation`
--
ALTER TABLE `tbljobseducation`
  ADD PRIMARY KEY (`jeduc_id`),
  ADD KEY `jeduc_jobId` (`jeduc_jobId`);

--
-- Indexes for table `tbljobsknowledge`
--
ALTER TABLE `tbljobsknowledge`
  ADD PRIMARY KEY (`jknow_id`),
  ADD KEY `jknow_jobId` (`jknow_jobId`),
  ADD KEY `jknow_knowledgeId` (`jknow_knowledgeId`);

--
-- Indexes for table `tbljobslicense`
--
ALTER TABLE `tbljobslicense`
  ADD PRIMARY KEY (`jlicense_id`),
  ADD KEY `jlicense_licenceMId` (`jlicense_licenceMId`),
  ADD KEY `jlicense_jobId` (`jlicense_jobId`);

--
-- Indexes for table `tbljobsmaster`
--
ALTER TABLE `tbljobsmaster`
  ADD PRIMARY KEY (`jobM_id`);

--
-- Indexes for table `tbljobsmasterduties`
--
ALTER TABLE `tbljobsmasterduties`
  ADD PRIMARY KEY (`duties_id`),
  ADD KEY `duties_jobId` (`duties_jobId`);

--
-- Indexes for table `tbljobsskills`
--
ALTER TABLE `tbljobsskills`
  ADD PRIMARY KEY (`jskills_id`),
  ADD KEY `jskills_jobId` (`jskills_jobId`);

--
-- Indexes for table `tbljobstrainings`
--
ALTER TABLE `tbljobstrainings`
  ADD PRIMARY KEY (`jtrng_id`),
  ADD KEY `jtrng_jobId` (`jtrng_jobId`),
  ADD KEY `jtrng_trainingId` (`jtrng_trainingId`);

--
-- Indexes for table `tbljobsworkexperience`
--
ALTER TABLE `tbljobsworkexperience`
  ADD PRIMARY KEY (`jwork_id`),
  ADD KEY `jwork_jobId` (`jwork_jobId`);

--
-- Indexes for table `tbllicensemaster`
--
ALTER TABLE `tbllicensemaster`
  ADD PRIMARY KEY (`license_master_id`),
  ADD KEY `license_master_typeId` (`license_master_typeId`);

--
-- Indexes for table `tbllicensetype`
--
ALTER TABLE `tbllicensetype`
  ADD PRIMARY KEY (`license_type_id`);

--
-- Indexes for table `tblpersonalknowledge`
--
ALTER TABLE `tblpersonalknowledge`
  ADD PRIMARY KEY (`knowledge_id`);

--
-- Indexes for table `tblpersonalskills`
--
ALTER TABLE `tblpersonalskills`
  ADD PRIMARY KEY (`perS_id`);

--
-- Indexes for table `tblpersonaltraining`
--
ALTER TABLE `tblpersonaltraining`
  ADD PRIMARY KEY (`perT_id`);

--
-- Indexes for table `tblstatus`
--
ALTER TABLE `tblstatus`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tblsupervisor`
--
ALTER TABLE `tblsupervisor`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `tbluserlevel`
--
ALTER TABLE `tbluserlevel`
  ADD PRIMARY KEY (`userL_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblapplications`
--
ALTER TABLE `tblapplications`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  MODIFY `appS_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblcandconsent`
--
ALTER TABLE `tblcandconsent`
  MODIFY `cons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcandeducbackground`
--
ALTER TABLE `tblcandeducbackground`
  MODIFY `educ_back_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblcandemploymenthistory`
--
ALTER TABLE `tblcandemploymenthistory`
  MODIFY `empH_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblcandidates`
--
ALTER TABLE `tblcandidates`
  MODIFY `cand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcandknowledge`
--
ALTER TABLE `tblcandknowledge`
  MODIFY `canknow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcandlicense`
--
ALTER TABLE `tblcandlicense`
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcandresume`
--
ALTER TABLE `tblcandresume`
  MODIFY `canres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblcandskills`
--
ALTER TABLE `tblcandskills`
  MODIFY `skills_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tblcandtraining`
--
ALTER TABLE `tblcandtraining`
  MODIFY `training_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblcourses`
--
ALTER TABLE `tblcourses`
  MODIFY `courses_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `tblcoursescategory`
--
ALTER TABLE `tblcoursescategory`
  MODIFY `course_categoryId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblcoursetype`
--
ALTER TABLE `tblcoursetype`
  MODIFY `crs_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblexam`
--
ALTER TABLE `tblexam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblexamapplicantanswer`
--
ALTER TABLE `tblexamapplicantanswer`
  MODIFY `examA_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblexamchoices`
--
ALTER TABLE `tblexamchoices`
  MODIFY `examC_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblexamquestion`
--
ALTER TABLE `tblexamquestion`
  MODIFY `examQ_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblexamquestiontype`
--
ALTER TABLE `tblexamquestiontype`
  MODIFY `questionT_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblexamresult`
--
ALTER TABLE `tblexamresult`
  MODIFY `examR_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `tblinterviewcandpoints`
--
ALTER TABLE `tblinterviewcandpoints`
  MODIFY `interviewP_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblinterviewcategory`
--
ALTER TABLE `tblinterviewcategory`
  MODIFY `interview_categ_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblinterviewcriteria`
--
ALTER TABLE `tblinterviewcriteria`
  MODIFY `criteria_inter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblinterviewcriteriamaster`
--
ALTER TABLE `tblinterviewcriteriamaster`
  MODIFY `inter_criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblinterviewpassingpercent`
--
ALTER TABLE `tblinterviewpassingpercent`
  MODIFY `passing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbljobpassing`
--
ALTER TABLE `tbljobpassing`
  MODIFY `passing_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbljobseducation`
--
ALTER TABLE `tbljobseducation`
  MODIFY `jeduc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbljobsknowledge`
--
ALTER TABLE `tbljobsknowledge`
  MODIFY `jknow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbljobslicense`
--
ALTER TABLE `tbljobslicense`
  MODIFY `jlicense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbljobsmaster`
--
ALTER TABLE `tbljobsmaster`
  MODIFY `jobM_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbljobsmasterduties`
--
ALTER TABLE `tbljobsmasterduties`
  MODIFY `duties_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbljobsskills`
--
ALTER TABLE `tbljobsskills`
  MODIFY `jskills_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbljobstrainings`
--
ALTER TABLE `tbljobstrainings`
  MODIFY `jtrng_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbljobsworkexperience`
--
ALTER TABLE `tbljobsworkexperience`
  MODIFY `jwork_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbllicensemaster`
--
ALTER TABLE `tbllicensemaster`
  MODIFY `license_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbllicensetype`
--
ALTER TABLE `tbllicensetype`
  MODIFY `license_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpersonalknowledge`
--
ALTER TABLE `tblpersonalknowledge`
  MODIFY `knowledge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpersonalskills`
--
ALTER TABLE `tblpersonalskills`
  MODIFY `perS_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpersonaltraining`
--
ALTER TABLE `tblpersonaltraining`
  MODIFY `perT_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblstatus`
--
ALTER TABLE `tblstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsupervisor`
--
ALTER TABLE `tblsupervisor`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbluserlevel`
--
ALTER TABLE `tbluserlevel`
  MODIFY `userL_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD CONSTRAINT `tbladmin_ibfk_1` FOREIGN KEY (`adm_userLevel`) REFERENCES `tbluserlevel` (`userL_id`);

--
-- Constraints for table `tblapplications`
--
ALTER TABLE `tblapplications`
  ADD CONSTRAINT `tblapplications_ibfk_1` FOREIGN KEY (`app_candId`) REFERENCES `tblcandidates` (`cand_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblapplications_ibfk_2` FOREIGN KEY (`app_jobMId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tblapplicationstatus`
--
ALTER TABLE `tblapplicationstatus`
  ADD CONSTRAINT `tblapplicationstatus_ibfk_1` FOREIGN KEY (`appS_appId`) REFERENCES `tblapplications` (`app_id`),
  ADD CONSTRAINT `tblapplicationstatus_ibfk_2` FOREIGN KEY (`appS_statusId`) REFERENCES `tblstatus` (`status_id`);

--
-- Constraints for table `tblcandconsent`
--
ALTER TABLE `tblcandconsent`
  ADD CONSTRAINT `tblcandconsent_ibfk_1` FOREIGN KEY (`cons_candId`) REFERENCES `tblcandidates` (`cand_id`) ON DELETE CASCADE;

--
-- Constraints for table `tblcandeducbackground`
--
ALTER TABLE `tblcandeducbackground`
  ADD CONSTRAINT `tblcandeducbackground_ibfk_1` FOREIGN KEY (`educ_canId`) REFERENCES `tblcandidates` (`cand_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblcandeducbackground_ibfk_2` FOREIGN KEY (`educ_coursesId`) REFERENCES `tblcourses` (`courses_id`),
  ADD CONSTRAINT `tblcandeducbackground_ibfk_5` FOREIGN KEY (`educ_institutionId`) REFERENCES `tblinstitution` (`institution_id`);

--
-- Constraints for table `tblcandemploymenthistory`
--
ALTER TABLE `tblcandemploymenthistory`
  ADD CONSTRAINT `tblcandemploymenthistory_ibfk_1` FOREIGN KEY (`empH_candId`) REFERENCES `tblcandidates` (`cand_id`);

--
-- Constraints for table `tblcandknowledge`
--
ALTER TABLE `tblcandknowledge`
  ADD CONSTRAINT `tblcandknowledge_ibfk_1` FOREIGN KEY (`canknow_canId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblcandknowledge_ibfk_2` FOREIGN KEY (`canknow_knowledgeId`) REFERENCES `tblpersonalknowledge` (`knowledge_id`);

--
-- Constraints for table `tblcandlicense`
--
ALTER TABLE `tblcandlicense`
  ADD CONSTRAINT `tblcandlicense_ibfk_1` FOREIGN KEY (`license_canId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblcandlicense_ibfk_2` FOREIGN KEY (`license_masterId`) REFERENCES `tbllicensemaster` (`license_master_id`);

--
-- Constraints for table `tblcandskills`
--
ALTER TABLE `tblcandskills`
  ADD CONSTRAINT `tblcandskills_ibfk_1` FOREIGN KEY (`skills_candId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblcandskills_ibfk_2` FOREIGN KEY (`skills_perSId`) REFERENCES `tblpersonalskills` (`perS_id`);

--
-- Constraints for table `tblcandtraining`
--
ALTER TABLE `tblcandtraining`
  ADD CONSTRAINT `tblcandtraining_ibfk_1` FOREIGN KEY (`training_candId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblcandtraining_ibfk_2` FOREIGN KEY (`training_perTId`) REFERENCES `tblpersonaltraining` (`perT_id`);

--
-- Constraints for table `tblcourses`
--
ALTER TABLE `tblcourses`
  ADD CONSTRAINT `tblcourses_ibfk_1` FOREIGN KEY (`courses_courseTypeId`) REFERENCES `tblcoursetype` (`crs_type_id`);

--
-- Constraints for table `tblexam`
--
ALTER TABLE `tblexam`
  ADD CONSTRAINT `tblexam_ibfk_1` FOREIGN KEY (`exam_typeId`) REFERENCES `tblexamtype` (`examT_id`),
  ADD CONSTRAINT `tblexam_ibfk_2` FOREIGN KEY (`exam_jobMId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tblexamapplicantanswer`
--
ALTER TABLE `tblexamapplicantanswer`
  ADD CONSTRAINT `tblexamapplicantanswer_ibfk_1` FOREIGN KEY (`examA_choiceId`) REFERENCES `tblexamchoices` (`examC_id`),
  ADD CONSTRAINT `tblexamapplicantanswer_ibfk_2` FOREIGN KEY (`examA_questionId`) REFERENCES `tblexamquestion` (`examQ_id`),
  ADD CONSTRAINT `tblexamapplicantanswer_ibfk_3` FOREIGN KEY (`examA_resultId`) REFERENCES `tblexamresult` (`examR_id`);

--
-- Constraints for table `tblexamquestion`
--
ALTER TABLE `tblexamquestion`
  ADD CONSTRAINT `tblexamquestion_ibfk_1` FOREIGN KEY (`examQ_examId`) REFERENCES `tblexam` (`exam_id`),
  ADD CONSTRAINT `tblexamquestion_ibfk_2` FOREIGN KEY (`examQ_typeId`) REFERENCES `tblexamquestiontype` (`questionT_id`);

--
-- Constraints for table `tblexamresult`
--
ALTER TABLE `tblexamresult`
  ADD CONSTRAINT `tblexamresult_ibfk_1` FOREIGN KEY (`examR_candId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblexamresult_ibfk_2` FOREIGN KEY (`examR_examId`) REFERENCES `tblexam` (`exam_id`);

--
-- Constraints for table `tblforgotpassword`
--
ALTER TABLE `tblforgotpassword`
  ADD CONSTRAINT `tblforgotpassword_ibfk_1` FOREIGN KEY (`forgotpass_candId`) REFERENCES `tblcandidates` (`cand_id`);

--
-- Constraints for table `tblinterviewcandpoints`
--
ALTER TABLE `tblinterviewcandpoints`
  ADD CONSTRAINT `tblinterviewcandpoints_ibfk_1` FOREIGN KEY (`interviewP_candId`) REFERENCES `tblcandidates` (`cand_id`),
  ADD CONSTRAINT `tblinterviewcandpoints_ibfk_2` FOREIGN KEY (`interviewP_criteriaId`) REFERENCES `tblinterviewcriteriamaster` (`inter_criteria_id`),
  ADD CONSTRAINT `tblinterviewcandpoints_ibfk_3` FOREIGN KEY (`interviewP_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tblinterviewcriteria`
--
ALTER TABLE `tblinterviewcriteria`
  ADD CONSTRAINT `tblinterviewcriteria_ibfk_1` FOREIGN KEY (`criteria_inter_categId`) REFERENCES `tblinterviewcategory` (`interview_categ_id`);

--
-- Constraints for table `tblinterviewcriteriamaster`
--
ALTER TABLE `tblinterviewcriteriamaster`
  ADD CONSTRAINT `tblinterviewcriteriamaster_ibfk_2` FOREIGN KEY (`inter_criteria_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tblinterviewpassingpercent`
--
ALTER TABLE `tblinterviewpassingpercent`
  ADD CONSTRAINT `tblinterviewpassingpercent_ibfk_1` FOREIGN KEY (`passing_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbljobseducation`
--
ALTER TABLE `tbljobseducation`
  ADD CONSTRAINT `tbljobseducation_ibfk_1` FOREIGN KEY (`jeduc_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbljobsknowledge`
--
ALTER TABLE `tbljobsknowledge`
  ADD CONSTRAINT `tbljobsknowledge_ibfk_1` FOREIGN KEY (`jknow_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`),
  ADD CONSTRAINT `tbljobsknowledge_ibfk_2` FOREIGN KEY (`jknow_knowledgeId`) REFERENCES `tblpersonalknowledge` (`knowledge_id`);

--
-- Constraints for table `tbljobslicense`
--
ALTER TABLE `tbljobslicense`
  ADD CONSTRAINT `tbljobslicense_ibfk_1` FOREIGN KEY (`jlicense_licenceMId`) REFERENCES `tbllicensemaster` (`license_master_id`),
  ADD CONSTRAINT `tbljobslicense_ibfk_2` FOREIGN KEY (`jlicense_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbljobsmasterduties`
--
ALTER TABLE `tbljobsmasterduties`
  ADD CONSTRAINT `tbljobsmasterduties_ibfk_1` FOREIGN KEY (`duties_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbljobsskills`
--
ALTER TABLE `tbljobsskills`
  ADD CONSTRAINT `tbljobsskills_ibfk_1` FOREIGN KEY (`jskills_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbljobstrainings`
--
ALTER TABLE `tbljobstrainings`
  ADD CONSTRAINT `tbljobstrainings_ibfk_1` FOREIGN KEY (`jtrng_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`),
  ADD CONSTRAINT `tbljobstrainings_ibfk_2` FOREIGN KEY (`jtrng_trainingId`) REFERENCES `tblpersonaltraining` (`perT_id`);

--
-- Constraints for table `tbljobsworkexperience`
--
ALTER TABLE `tbljobsworkexperience`
  ADD CONSTRAINT `tbljobsworkexperience_ibfk_1` FOREIGN KEY (`jwork_jobId`) REFERENCES `tbljobsmaster` (`jobM_id`);

--
-- Constraints for table `tbllicensemaster`
--
ALTER TABLE `tbllicensemaster`
  ADD CONSTRAINT `tbllicensemaster_ibfk_1` FOREIGN KEY (`license_master_typeId`) REFERENCES `tbllicensetype` (`license_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
