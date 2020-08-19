-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2020 at 10:09 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mentalhealthcounselingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `u_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `name`, `email`, `phone`, `u_id`) VALUES
(1, 'Ruhi', 'r@gmail.com', '012566568', 7);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `p_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'requested',
  `scheduled_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `description`, `p_id`, `d_id`, `status`, `scheduled_date`) VALUES
(1, 'I want to consult about my mental health', 1, 1, 'accepted', '2020-08-13 10:40:00'),
(2, 'I want to consult about my mental health', 2, 1, 'declined', NULL),
(3, 'I want to consult about my mental health', 1, 1, 'accepted', '2020-08-19 19:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `callrecord`
--

CREATE TABLE `callrecord` (
  `cl_id` int(5) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `p_id` int(5) NOT NULL,
  `d_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ch_id` int(5) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `sender` int(5) NOT NULL,
  `receiver` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `c_id` int(5) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `u_id` int(5) NOT NULL,
  `f_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`c_id`, `comment`, `date`, `u_id`, `f_id`) VALUES
(1, 'testing comment....', '2020-08-13 22:57:32', 5, 1),
(4, 'asfaasdf', '2020-08-14 02:10:08', 3, 1),
(5, 'asfasf', '2020-08-14 02:12:05', 3, 1),
(6, 'asdfsdf', '2020-08-14 02:12:13', 3, 1),
(8, 'asdfa', '2020-08-14 03:35:44', 3, 2),
(9, 'adsf', '2020-08-14 04:15:13', 3, 2),
(10, 'testing 3', '2020-08-14 04:27:02', 5, 2),
(11, 'testing 4', '2020-08-14 04:27:17', 5, 1),
(12, 'hasfasfs', '2020-08-14 04:33:21', 5, 3),
(13, 'testing comment', '2020-08-14 10:06:08', 3, 4),
(14, 'gadsfgsd', '2020-08-16 03:08:39', 3, 5),
(15, 'asdfasf', '2020-08-16 03:23:34', 3, 6),
(16, 'asdfaad', '2020-08-16 11:17:51', 3, 9),
(17, 'asdfas', '2020-08-16 11:17:59', 3, 9),
(18, 'asdfasf', '2020-08-16 11:18:05', 3, 9),
(19, 'asdfasfds', '2020-08-17 16:19:54', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `d_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `license_num` varchar(50) NOT NULL,
  `qualifications` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `propic` varchar(100) NOT NULL DEFAULT 'doctor.png',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`d_id`, `name`, `email`, `phone`, `gender`, `license_num`, `qualifications`, `specialty`, `propic`, `user_id`) VALUES
(1, 'Hanif', 'hanif.hf.05@gmail.com', '01738309854', 'Male', 'asdfasewrr', 'MBBS', 'Human Factors Psychology', '1me.png', 3),
(2, 'Joseph H Gervais', 'pibeben611@link3mail.com', '5102585719', 'Male', 'asdfasewrr32324', 'sdfasfdasfw', 'Addiction Psychology', 'doctor.png', 4),
(3, 'Rashed', 'hanif.hf.5@gmail.com', '01738309854', 'Male', 'asdfasewrr3232', 'safsfds', 'Addiction Psychology', '3me.png', 5),
(4, 'Rahul', 'rahul@gmai.com', '01738309854', 'Male', 'uyuytyttr', 'MBBS', 'Addiction Psychology', 'doctor.png', 10);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `feedback` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `f_id` int(5) NOT NULL,
  `date` datetime NOT NULL,
  `post` varchar(500) NOT NULL,
  `u_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`f_id`, `date`, `post`, `u_id`) VALUES
(1, '2020-08-13 22:56:41', 'testing post', 3),
(2, '2020-08-14 02:28:33', 'asdfasddsfs', 3),
(3, '2020-08-14 04:27:35', 'test post', 5),
(4, '2020-08-14 10:04:52', 'Testing 123', 3),
(5, '2020-08-16 03:08:16', 'asfasdfAfsdfs', 3),
(6, '2020-08-16 03:23:24', 'dfasfafasfa', 3),
(7, '2020-08-16 10:44:13', 'testing asfas', 3),
(8, '2020-08-16 10:51:56', 'sdfas test .......................... ......................... ........................... ...................................... ................................ ........................... .............................. ..................................... .......................', 3),
(9, '2020-08-16 10:54:55', 'asdfasd afasfasdfs afas', 3),
(10, '2020-08-17 16:19:45', 'sadfadsfads', 3);

-- --------------------------------------------------------

--
-- Table structure for table `healthrecord`
--

CREATE TABLE `healthrecord` (
  `h_id` int(5) NOT NULL,
  `height` decimal(5,0) NOT NULL,
  `weight` decimal(5,0) NOT NULL,
  `bp` int(8) NOT NULL,
  `pulseRate` int(5) NOT NULL,
  `mood` varchar(50) NOT NULL,
  `sleepDuration` int(5) NOT NULL,
  `description` varchar(500) NOT NULL,
  `p_id` int(5) NOT NULL,
  `se_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `healthrecord`
--

INSERT INTO `healthrecord` (`h_id`, `height`, `weight`, `bp`, `pulseRate`, `mood`, `sleepDuration`, `description`, `p_id`, `se_id`) VALUES
(1, '174', '60', 120, 100, 'anxious', 4, 'I am worried about .....\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `p_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `propic` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`p_id`, `name`, `email`, `phone`, `gender`, `bloodtype`, `propic`, `user_id`) VALUES
(1, 'Rahel', 'Rahel@gmail.com', '4646465465', 'Male', 'AB+', 'me.png', 8),
(2, 'Jewel', 'j@gmail.com', '01734554545', 'Male', 'AB-', 'user.png', 12);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pr_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `qty` int(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `duration` int(5) NOT NULL,
  `timing` varchar(8) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `notes` varchar(500) NOT NULL,
  `p_id` int(5) NOT NULL,
  `d_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pr_id`, `name`, `qty`, `type`, `duration`, `timing`, `date`, `notes`, `p_id`, `d_id`) VALUES
(1, 'asdfds', 20, 'Tablet', 3, '1+0+1', '2020-08-13 02:25:31', 'dvsfs', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `r_id` int(5) NOT NULL,
  `review` int(2) NOT NULL,
  `feedback` varchar(500) DEFAULT NULL,
  `se_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`r_id`, `review`, `feedback`, `se_id`) VALUES
(1, 3, 'test review', 1),
(2, 4, 'Test Review 2 ........................ ...................... ............................. ....................... .................... ....................... .................... ....................... ................... .............. ................... .................... ..................... ............................. ............... ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `se_id` int(5) NOT NULL,
  `date` datetime NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `p_id` int(5) NOT NULL,
  `d_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`se_id`, `date`, `path`, `p_id`, `d_id`) VALUES
(1, '2020-08-11 13:12:31', 'me.png', 1, 1),
(2, '2020-08-13 01:52:56', NULL, 1, 1),
(3, '2020-08-13 01:55:27', NULL, 2, 1),
(4, '2020-08-13 01:56:40', NULL, 1, 3),
(5, '2020-08-13 02:03:38', NULL, 1, 3),
(6, '2020-08-13 02:10:00', NULL, 1, 3),
(7, '2020-08-13 02:24:01', NULL, 1, 3),
(8, '2020-08-16 03:23:52', NULL, 1, 3),
(9, '2020-08-17 16:18:54', NULL, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `s_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`s_id`, `name`, `email`, `phone`, `user_id`) VALUES
(1, 'Hasan Ahmed', 'H@gmail.com', '498798768', 9);

-- --------------------------------------------------------

--
-- Table structure for table `subplan`
--

CREATE TABLE `subplan` (
  `sp_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `duration` int(5) NOT NULL,
  `features` varchar(100) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `sub_id` int(5) NOT NULL,
  `regDate` datetime NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `p_id` int(5) NOT NULL,
  `subplan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `t_id` int(5) NOT NULL,
  `amount` int(5) NOT NULL,
  `type` varchar(15) NOT NULL,
  `sender` int(5) NOT NULL,
  `receiver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'patient',
  `ammount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `status`, `ammount`) VALUES
(3, 'hanif', '12345', 'doctor', 0),
(4, 'browndragon', '1234', 'doctor', 0),
(5, 'rashed', '1234', 'doctor', 0),
(7, 'admin', 'admin', 'admin', 500000),
(8, 'rahel', '1234', 'patient', 0),
(9, 'hasan', '1234', 'staff', 0),
(10, 'rahul', '12345', 'doctor', 0),
(12, 'Jewel', '1234567A', 'patient', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `user_admin` (`u_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_p` (`p_id`),
  ADD KEY `app_d` (`d_id`);

--
-- Indexes for table `callrecord`
--
ALTER TABLE `callrecord`
  ADD PRIMARY KEY (`cl_id`),
  ADD KEY `call_p` (`p_id`),
  ADD KEY `call_d` (`d_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ch_id`),
  ADD KEY `sk` (`sender`),
  ADD KEY `rk` (`receiver`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `forum_k` (`f_id`),
  ADD KEY `c_user` (`u_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `user_doctor` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `user_fb` (`username`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `forum_user` (`u_id`);

--
-- Indexes for table `healthrecord`
--
ALTER TABLE `healthrecord`
  ADD PRIMARY KEY (`h_id`),
  ADD KEY `pet_hlt` (`p_id`),
  ADD KEY `ses_hlt` (`se_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `user_patient` (`user_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `pres_pet` (`p_id`),
  ADD KEY `pres_doc` (`d_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `se_review` (`se_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`se_id`),
  ADD KEY `ses_doc` (`d_id`),
  ADD KEY `ses_pet` (`p_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `user_staff` (`user_id`);

--
-- Indexes for table `subplan`
--
ALTER TABLE `subplan`
  ADD PRIMARY KEY (`sp_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `pet_sub` (`p_id`),
  ADD KEY `pet_plan` (`subplan_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `sen_k` (`sender`),
  ADD KEY `rec_k` (`receiver`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `callrecord`
--
ALTER TABLE `callrecord`
  MODIFY `cl_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `ch_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `c_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `d_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `f_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `healthrecord`
--
ALTER TABLE `healthrecord`
  MODIFY `h_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `p_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pr_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `r_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `se_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `s_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subplan`
--
ALTER TABLE `subplan`
  MODIFY `sp_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `sub_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `t_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `user_admin` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `app_d` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `app_p` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `callrecord`
--
ALTER TABLE `callrecord`
  ADD CONSTRAINT `call_d` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `call_p` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `rk` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sk` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `c_user` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `forum_k` FOREIGN KEY (`f_id`) REFERENCES `forum` (`f_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `user_doctor` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `user_fb` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_user` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `healthrecord`
--
ALTER TABLE `healthrecord`
  ADD CONSTRAINT `pet_hlt` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`),
  ADD CONSTRAINT `ses_hlt` FOREIGN KEY (`se_id`) REFERENCES `session` (`se_id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `user_patient` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `pres_doc` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `pres_pet` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `se_review` FOREIGN KEY (`se_id`) REFERENCES `session` (`se_id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `ses_doc` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `ses_pet` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `user_staff` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `pet_plan` FOREIGN KEY (`subplan_id`) REFERENCES `subplan` (`sp_id`),
  ADD CONSTRAINT `pet_sub` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `rec_k` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sen_k` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
