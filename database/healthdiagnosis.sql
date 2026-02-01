-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2025 at 11:15 AM
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
-- Database: `healthdiagnosis`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user_id`, `is_admin`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 1),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  `normal_user_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `authority_id`, `normal_user_id`, `doctor_id`, `date`, `description`) VALUES
(1, 2, 1, 3, '2024-01-10', 'Routine checkup for general health assessment.'),
(2, 3, 6, 1, '2024-01-15', 'Follow-up appointment for treatment plan review.'),
(3, 5, 7, 2, '2024-01-20', 'Specialist consultation for cardiac issues.'),
(4, 3, 1, 2, '2024-01-25', 'Orthopedic consultation for back pain.'),
(5, 2, 6, 1, '2024-02-01', 'General examination and prescription update.'),
(6, 5, 6, 3, '2024-02-05', 'Dermatology appointment for skin condition review.'),
(7, 2, 7, 3, '2024-02-10', 'Oncology consultation for post-treatment follow-up.');

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `user_id` int(11) NOT NULL,
  `is_authority` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`user_id`, `is_authority`) VALUES
(1, 0),
(2, 1),
(3, 1),
(4, 0),
(5, 1),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`name`, `phone`, `email`) VALUES
('Cardiology', '9876544444', 'cardiology@hospital.com'),
('Dermatology', '9876543333', 'dermatology@hospital.com'),
('Neurology', '1243245345', 'neurology@hospital.com'),
('Oncology', '9876543255', 'oncology@hospital.com'),
('Orthopedics', '9876543213', 'orthopedics@hospital.com'),
('Pediatrics', '9876543212', 'pediatrics@hospital.com'),
('Radiology', '9876543214', 'radiology@hospital.com');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_staff_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_staff_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `staff_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `staff_id`) VALUES
(1, 'Stethoscope', 1),
(2, 'Bandages', 2),
(3, 'Syringes', 3),
(4, 'Thermometer', 4),
(5, 'Blood Pressure Monitor', 5),
(6, 'ECG Machine', 6),
(7, 'Surgical Gloves', 7);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  `normal_user_id` int(11) NOT NULL,
  `message_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `authority_id`, `normal_user_id`, `message_content`) VALUES
(1, 2, 1, 'Request for a new appointment slot.'),
(2, 3, 7, 'Inquiry about test results.'),
(3, 5, 6, 'Complaint about equipment malfunction.'),
(4, 3, 6, 'Need clarification on medical reports.'),
(5, 2, 1, 'Request for vaccination details.'),
(6, 5, 1, 'Feedback on services received.'),
(7, 3, 7, 'Query about billing and payment methods.');

-- --------------------------------------------------------

--
-- Table structure for table `newappointment`
--

CREATE TABLE `newappointment` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `date_of_birth` date NOT NULL,
  `appointed_doc` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `slotno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newappointment`
--

INSERT INTO `newappointment` (`name`, `email`, `phone_num`, `date_of_birth`, `appointed_doc`, `department`, `slotno`) VALUES
('Ahmed Ali', 'ahmed.ali@email.com', '01712345678', '1990-05-12', 'Dr Kanm', 'Cardiology', 1),
('Ayesha Begum', 'ayesha.begum@email.com', '01767890123', '1995-07-05', 'Dr Chowdhury', 'Pediatrics', 1),
('Fatima Rahman', 'fatima.rahman@email.com', '01723456789', '1985-03-15', 'DC Hossain', 'Dermatology', 2),
('Hassan Khan', 'hassan.khan@email.com', '01778901234', '1991-04-10', 'Dr Kanm', 'Radiology', 2),
('Ibrahim Siddiq', 'ibrahim.siddiq@email.com', '01790123456', '1988-12-14', 'Dr Alam', 'Dermatology', 4),
('Maryam Nadir', 'maryam.nadir@email.com', '01701234567', '1996-06-30', 'Dr Mahmud', 'Neurology', 5),
('Muhammad Tariq', 'muhammad.tariq@email.com', '01734567890', '1992-08-20', 'Dr Alam', 'Neurology', 3),
('Omar Farooq', 'omar.farooq@email.com', '01756789012', '1987-01-22', 'Dr Rahim', 'Orthopedics', 5),
('Zainab Ahmed', 'zainab.ahmed@email.com', '01745678901', '1994-11-10', 'Dr Mahmud', 'Oncology', 4);

-- --------------------------------------------------------

--
-- Table structure for table `newuser`
--

CREATE TABLE `newuser` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newuser`
--

INSERT INTO `newuser` (`name`, `email`, `id`, `phone_num`) VALUES
('ahmed', 'ahmed@example.com', 7, '0123456795'),
('amira', 'amira@example.com', 24, '0123456812'),
('bilal', 'bilal@example.com', 23, '0123456811'),
('fatima', 'fatima@example.com', 8, '0123456796'),
('hassan', 'hassan@example.com', 11, '0123456799'),
('ibrahim', 'ibrahim@example.com', 19, '0123456807'),
('karim', 'karim@example.com', 5, '0123456793'),
('khadija', 'khadija@example.com', 14, '0123456802'),
('khalid', 'khalid@example.com', 21, '0123456809'),
('lara', 'lara@example.com', 26, '0123456814'),
('layla', 'layla@example.com', 16, '0123456804'),
('mariam', 'mariam@example.com', 22, '0123456810'),
('molla', 'molla@example.com', 2, '0123456790'),
('mustafa', 'mustafa@example.com', 17, '0123456805'),
('nura', 'nura@example.com', 20, '0123456808'),
('omar', 'omar@example.com', 13, '0123456801'),
('rakib', 'rakib@example.com', 4, '0123456792'),
('renu', 'renu@example.com', 6, '0123456794'),
('salim', 'salim@example.com', 25, '0123456813'),
('sara', 'sara@example.com', 18, '0123456806'),
('youssef', 'youssef@example.com', 15, '0123456803'),
('zainab', 'zainab@example.com', 12, '0123456800');

-- --------------------------------------------------------

--
-- Table structure for table `normal_user`
--

CREATE TABLE `normal_user` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `normal_user`
--

INSERT INTO `normal_user` (`user_id`) VALUES
(1),
(6),
(7);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurse_staff_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_staff_id`) VALUES
(5),
(6);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `receptionist_staff_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`receptionist_staff_id`) VALUES
(3),
(7);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `feedback` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `rating` int(10) NOT NULL,
  `inventory_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`feedback`, `date`, `rating`, `inventory_id`, `user_id`, `staff_id`) VALUES
('Helpful and friendly staff.', '2023-10-01', 5, 1, 1, 1),
('Efficient and professional service.', '2023-10-02', 4, 2, 2, 2),
('Clean and well-maintained.', '2023-10-03', 5, 3, 3, 3),
('Exceptional leadership from Farhan.', '2023-10-04', 5, 4, 4, 4),
('Very thorough consultation.', '2023-10-05', 5, 5, 5, 5),
('Room was not clean.', '2023-10-06', 2, 6, 6, 6),
('Friendly but disorganized.', '2023-10-07', 3, 7, 7, 7),
('Excellent service!', '2025-01-02', 5, 1, 3, 1),
('so good', '2025-01-02', 4, 1, 2, 1),
('its was very nice', '2025-01-02', 5, 1, 5, 1),
('very good', '2025-01-02', 4, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `phone`, `email`, `name`, `department_name`) VALUES
(1, '9123456780', 'john.doe@hospital.com', 'John Doe', 'Cardiology'),
(2, '9123456781', 'jane.smith@hospital.com', 'Jane Smith', 'Neurology'),
(3, '9123456782', 'david.brown@hospital.com', 'David Brown', 'Pediatrics'),
(4, '9123456783', 'farhan.labib@hospital.com', 'Farhan Labib', 'Orthopedics'),
(5, '9123456784', 'liam.wilson@hospital.com', 'Liam Wilson', 'Radiology'),
(6, '9123456785', 'olivia.taylor@hospital.com', 'Olivia Taylor', 'Oncology'),
(7, '9123456786', 'noah.davis@hospital.com', 'Noah Davis', 'Dermatology');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `mail`, `password`) VALUES
(1, 'John Doe', 'john.doe@mail.com', 'password123'),
(2, 'Jane Smith', 'jane.smith@mail.com', 'pass1234'),
(3, 'David Brown', 'david.brown@mail.com', 'securePass1'),
(4, 'Farhan Labib', 'farhan.labib@mail.com', 'deeznuts'),
(5, 'Liam Wilson', 'liam.wilson@mail.com', 'welcome2023'),
(6, 'Olivia Taylor', 'olivia.taylor@mail.com', 'helloWorld'),
(7, 'Noah Davis', 'noah.davis@mail.com', 'passw0rd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `authority_id` (`authority_id`),
  ADD KEY `normal_user_id` (`normal_user_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_staff_id`),
  ADD KEY `FOREIGN` (`doctor_staff_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FOREIGN` (`staff_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `authority_id` (`authority_id`),
  ADD KEY `normal_user_id` (`normal_user_id`);

--
-- Indexes for table `newappointment`
--
ALTER TABLE `newappointment`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `newuser`
--
ALTER TABLE `newuser`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `normal_user`
--
ALTER TABLE `normal_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurse_staff_id`),
  ADD KEY `FOREIGN` (`nurse_staff_id`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionist_staff_id`),
  ADD KEY `FOREIGN` (`receptionist_staff_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD KEY `FOREIGN1` (`inventory_id`),
  ADD KEY `FOREIGN2` (`user_id`),
  ADD KEY `FOREIGN3` (`staff_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD KEY `FOREIGN` (`department_name`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`normal_user_id`) REFERENCES `normal_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_staff_id`) ON DELETE CASCADE;

--
-- Constraints for table `authority`
--
ALTER TABLE `authority`
  ADD CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`normal_user_id`) REFERENCES `normal_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `normal_user`
--
ALTER TABLE `normal_user`
  ADD CONSTRAINT `normal_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`receptionist_staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_name`) REFERENCES `department` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
