-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2022 at 04:31 PM
-- Server version: 8.0.29
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizby`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `subject` varchar(20) NOT NULL,
  `credits` int NOT NULL,
  `professor_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int NOT NULL,
  `question_number` int NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `coption` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_number`, `is_correct`, `coption`) VALUES
(1, 1, 0, 'Dynamic'),
(2, 1, 1, 'Use of pointers'),
(3, 1, 0, 'Object-oriented'),
(4, 1, 0, 'Architecture Neutral'),
(5, 2, 1, 'Bytecode is executed by JVMs'),
(6, 2, 0, 'The applet makes the Java code secure and portable'),
(7, 2, 0, 'Use of exception handling'),
(8, 2, 0, 'Dynamic binding between objects'),
(9, 3, 0, 'JVM'),
(10, 3, 0, 'JRE'),
(11, 3, 1, 'JDK'),
(12, 3, 0, 'JDB'),
(13, 4, 1, 'f=ma'),
(14, 4, 0, 'f = mg'),
(15, 4, 0, 'f = mv');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `USN` char(10) NOT NULL,
  `marks` int DEFAULT NULL,
  `Subject` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`USN`, `marks`, `Subject`) VALUES
('1bm20cs018', 6, 'Computer'),
('1bm20cs020', 4, 'Computer'),
('1bm20cs021', 1, 'Computer');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_number` int NOT NULL,
  `question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_number`, `question_text`) VALUES
(1, 'Which of the following is not a Java features?'),
(2, 'Which of the following option leads to the portability and security of Java? '),
(3, '_____ is used to find and fix bugs in the Java programs.'),
(4, '2nd law');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `name` varchar(20) DEFAULT NULL,
  `phoneNo` bigint DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `USN` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`name`, `phoneNo`, `password`, `USN`) VALUES
('aaa', 98347589437, 'hello5', '1bm20cs001'),
('akash', 89742894, 'hello4', '1bm20cs007'),
('ansha', 9487598375, 'hello3', '1bm20cs018'),
('anushree', 923478923, 'hello2', '1bm20cs020'),
('aravind', 10203040, 'hello', '1bm20cs021');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `USN` char(10) DEFAULT NULL,
  `reviews` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`USN`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_number`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`USN`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD KEY `USN` (`USN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student_info` (`USN`);

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student_info` (`USN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
