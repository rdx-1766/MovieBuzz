-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:8001
-- Generation Time: Jan 29, 2023 at 06:31 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviebuzz`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `search` (IN `moviename` VARCHAR(50))   BEGIN
	
	SELECT movie_id FROM movies WHERE title REGEXP moviename ;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileno` bigint(11) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `mobileno`, `password`) VALUES
(9, 'pavan', 'pavan@gmail.com', 9945377719, 'pbkdf2:sha256:260000$mnLvwFAiG157vytt$1b8121d16d9600e9f3281e8911ff79bcafdd3a7b4c8864bf4cdbb7e84133b1e0'),
(10, 'pavan', 'pavan@gmail.com', 9945377719, 'pbkdf2:sha256:260000$mnLvwFAiG157vytt$1b8121d16d9600e9f3281e8911ff79bcafdd3a7b4c8864bf4cdbb7e84133b1e0');

-- --------------------------------------------------------

--
-- Table structure for table `cast`
--

CREATE TABLE `cast` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `awards` varchar(200) NOT NULL DEFAULT '--- Award Details Not Available ---',
  `debut_year` year(4) NOT NULL,
  `image` varchar(100) DEFAULT '../static/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cast`
--

INSERT INTO `cast` (`id`, `name`, `age`, `awards`, `debut_year`, `image`) VALUES
(1, 'Yash', 0, '--- Award Details Not Available ---', 0000, '../static/yash.jpeg'),
(2, 'Rishab Shetty', 0, '--- Award Details Not Available ---', 2012, '../static/default.png'),
(3, 'Puneeth Raj Kumar', 46, 'Karnataka Ratna , Honorary Doctorate from University of Mysore , Lifetime Achievement Award at the 67th Filmfare Awards , Filmfare Best Child Actor , Youth Icon of South Indian Cinema (male)', 2002, '../static/PuneethRajKumar.jpeg'),
(4, 'Rakshith Shetty', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(5, 'Shiva Rajkumar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(6, 'Ganesh', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(7, 'Sudeep', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(8, 'Dr Rajkumar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(9, 'Sri Murali', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(10, 'Salman Khan', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(11, 'Shah Rukh Khan', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(12, 'Rani Mukerji', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(13, 'Ranbir Kapoor', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(14, 'Akshay Kumar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(15, 'Rajneesh Duggal', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(16, 'Rajkumar Rao', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(17, ' Kangana Ranaut', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(18, 'Chiranjeevi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(19, 'Rajinikanth', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(20, ' Nikhil Siddhartha', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(21, 'Vishwak Sen', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(22, 'Adivi Sesh', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(23, 'Sunil', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(24, 'Bhavana', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(25, 'Dhananjay', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(26, 'Devaraj', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(27, 'Rockline Sudhakar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(28, 'Manvita Kamath', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(29, 'Vasishta N. Simha', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(30, 'Srinidhi Shetty', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(31, 'Sanjay Dutt', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(32, 'Raveena Tandon', 0, '--- Award Details Not Available ---', 0000, '../static/RaveenaTandon.jpeg'),
(33, 'Prakash Raj', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(34, 'Govinde Gowda', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(35, 'Sapthami Gowda', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(36, 'Kishore', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(37, 'Achyuth Kumar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(38, 'Pramod Shetty', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(39, 'Prakash Thuminad', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(40, 'Priya Anand', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(41, 'Srikanth Meka', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(42, 'Rangayana Raghu', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(43, 'Sadhu Kokila', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(44, 'R. Sarathkumar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(45, 'Rashmika Mandanna', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(46, 'Samyuktha Hegde', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(47, 'Manjunath Gowda', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(48, 'Sangeetha Sringeri', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(49, 'Raj B. Shetty', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(50, 'Gopal Deshpande', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(51, 'Danish Sait', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(52, 'H. G. Somashekar Rao', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(53, 'Pooja Gandhi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(54, 'Diganth', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(55, 'Ashwath Ninasam', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(56, 'Anant Nag', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(57, 'Sudha Belawadi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(58, 'Amoghavarsha J. S.', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(59, 'Jacqueline Fernandez', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(60, 'Nirup Bhandari', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(61, 'Milana Nagaraj', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(62, 'Manjula', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(63, 'T. N. Balakrishna', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(64, 'Vajramuni', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(65, 'Rajashankar', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(66, 'Parvathy Thiruvothu', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(67, 'Sihi Kahi Chandru', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(68, 'Riyaz Khan', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(69, 'Haripriya', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(70, 'Avinash', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(71, 'Jai Jagadish', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(72, 'Padmaja Rao', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(73, 'Ugramm Ravi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(74, 'Sonali Bendre', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(75, 'Aarthi Agarwal', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(76, 'Mukesh Rishi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(77, 'Brahmanandam', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(78, 'Anushka Sharma', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(79, 'Randeep Hooda', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(80, 'Deepika Padukone', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(81, 'Satyaraj', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(82, 'Tahir Raj Bhasin', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(83, 'Avneet Kaur', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(84, 'Katrina Kaif', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(85, 'Nawazuddin Siddiqui', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(86, 'Ritesh Deshmukh', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(87, 'Arjun Rampal', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(88, 'Adah Sharma', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(89, 'Amin Hajee', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(90, 'Shraddha Kapoor', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(91, 'Pankaj Tripathi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(92, 'Lisa Haydon', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(93, 'Nushratt Bharuccha', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(94, 'Kamal Haasan', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(95, 'Vijay Sethupathi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(96, 'Fahadh Faasil', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(97, 'Karthi', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(98, 'Suriya', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(99, 'Sayyesha Saigal', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(100, 'Sai Kumar', 0, '--- Award Details Not Available ---', 0000, '..\\static\\sng.jpg'),
(101, 'Mahesh Babu', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(102, 'Keerthy Suresh', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(103, 'Samuthirakani', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(104, 'Vennela Kishore', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(105, 'Pavitra Lokesh', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(106, ' Vishwak Sen', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(107, 'Hari Teja', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(108, 'Chaitanya Sagiraju', 0, '--- Award Details Not Available ---', 0000, '../static/default.png'),
(109, 'Murali Sharma', 0, '--- Award Details Not Available ---', 0000, '../static/default.png');

-- --------------------------------------------------------

--
-- Table structure for table `custcount`
--

CREATE TABLE `custcount` (
  `cid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custcount`
--

INSERT INTO `custcount` (`cid`, `movieid`, `rating`) VALUES
(4, 21, 3),
(4, 23, 4),
(4, 24, 5),
(4, 25, 3),
(4, 27, 4),
(4, 30, 5),
(4, 31, 5),
(4, 32, 5),
(4, 34, 4),
(4, 35, 2),
(4, 37, 4),
(4, 38, 5),
(4, 40, 4),
(4, 44, 4),
(4, 45, 4),
(4, 46, 3),
(5, 21, 5),
(5, 22, 5),
(5, 23, 5),
(5, 24, 5),
(5, 25, 5),
(5, 26, 5),
(5, 27, 5),
(5, 28, 5),
(5, 29, 5),
(5, 30, 5),
(5, 31, 5),
(5, 32, 5),
(5, 33, 5),
(5, 34, 5),
(5, 35, 5),
(5, 36, 5),
(5, 37, 5),
(5, 38, 5),
(5, 39, 5),
(5, 40, 5),
(5, 41, 5),
(5, 42, 5),
(5, 43, 5),
(5, 44, 5),
(5, 45, 5),
(5, 46, 5),
(5, 47, 5),
(5, 49, 5),
(5, 50, 5),
(5, 51, 5),
(5, 52, 5),
(5, 53, 5),
(5, 54, 3),
(6, 25, 4),
(6, 30, 2),
(6, 37, 5),
(9, 21, 3),
(9, 22, 3),
(9, 24, 3),
(9, 25, 3),
(9, 26, 3),
(9, 27, 4),
(9, 28, 3),
(9, 30, 3),
(9, 32, 2),
(9, 33, 2),
(9, 35, 3),
(9, 36, 1),
(9, 37, 3),
(9, 38, 2),
(9, 41, 2),
(9, 42, 3),
(9, 43, 3),
(9, 46, 3),
(9, 47, 2),
(9, 49, 4),
(9, 50, 2),
(9, 51, 3),
(9, 53, 3);

--
-- Triggers `custcount`
--
DELIMITER $$
CREATE TRIGGER `Average` BEFORE INSERT ON `custcount` FOR EACH ROW BEGIN
UPDATE rating set  rating=((NEW.rating+(rating*COUNT))/ (COUNT+1)), COUNT=COUNT+1  WHERE rating.movieid = NEW.movieid ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `debut_year` year(4) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT '../static/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `name`, `debut_year`, `image`) VALUES
(1, 'Prashanth Neel', 2023, '../static/default.png'),
(2, 'Rishab Shetty', 2023, '../static/default.png'),
(3, 'Chethan Kumar', 0000, '../static/default.png'),
(4, 'Kiranraj K', 2000, '../static/default.png'),
(5, 'Suri', 0000, '../static/default.png'),
(6, 'Yogaraj Bhat', 0000, '../static/default.png'),
(7, 'P Vasu', 0000, '../static/default.png'),
(8, 'Amoghavarsha J S', 0000, '../static/default.png'),
(9, ' Anup Bhandari', 0000, '../static/default.png'),
(10, 'A V Sheshgiri Rao', 0000, '../static/default.png'),
(11, 'Prakash', 0000, '../static/default.png'),
(12, 'Ali Abbas Zafar', 0000, '../static/default.png'),
(13, 'Karan Johar', 0000, '../static/default.png'),
(14, 'Rohit Shetty', 0000, '../static/default.png'),
(15, 'Pradeep Sarkar', 0000, '../static/default.png'),
(16, 'Anurag Basu', 0000, '../static/default.png'),
(17, 'Sajid Khan', 0000, '../static/default.png'),
(18, 'Vikram Bhatt', 0000, '../static/default.png'),
(19, 'Amar Kaushik', 0000, '../static/default.png'),
(20, 'Vikas Bahl', 0000, '../static/default.png'),
(21, ' Abhishek Sharma', 0000, '../static/default.png'),
(22, 'B Goapl', 0000, '../static/default.png'),
(23, ' Chandoo Mondeti', 0000, '../static/default.png'),
(24, 'Sailesh Kolanu', 0000, '../static/default.png'),
(25, ' S. S. Rajamouli', 0000, '../static/default.png'),
(26, 'Lokesh Kanagaraj', 0000, '../static/default.png'),
(27, 'Santhosh Ananddram', 0000, '../static/default.png'),
(28, 'Parasuram', 0000, '../static/default.png');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language` varchar(50) NOT NULL,
  `movieid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language`, `movieid`) VALUES
('English', 30),
('Hindi', 21),
('Hindi', 22),
('Hindi', 25),
('Hindi', 30),
('Hindi', 34),
('Hindi', 35),
('Hindi', 36),
('Hindi', 37),
('Hindi', 38),
('Hindi', 39),
('Hindi', 40),
('Hindi', 41),
('Hindi', 42),
('Hindi', 43),
('Hindi', 44),
('Hindi', 51),
('Hindi', 52),
('Kannada', 21),
('Kannada', 22),
('Kannada', 23),
('Kannada', 24),
('Kannada', 25),
('Kannada', 26),
('Kannada', 27),
('Kannada', 28),
('Kannada', 29),
('Kannada', 30),
('Kannada', 31),
('Kannada', 32),
('Kannada', 33),
('Kannada', 51),
('Kannada', 52),
('Malayalam', 21),
('Malayalam', 22),
('Malayalam', 25),
('Malayalam', 30),
('Tamil', 21),
('Tamil', 22),
('Tamil', 25),
('Tamil', 30),
('Tamil', 51),
('Telugu', 21),
('Telugu', 22),
('Telugu', 23),
('Telugu', 25),
('Telugu', 30),
('Telugu', 45),
('Telugu', 46),
('Telugu', 47),
('Telugu', 49),
('Telugu', 50),
('Telugu', 51),
('Telugu', 52),
('Telugu', 53),
('Telugu', 54);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `director_id` int(11) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `production` varchar(50) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `year`, `director_id`, `genre`, `production`, `link`, `poster`, `description`) VALUES
(21, 'K.G.F Chapter 2', 2022, 1, 'Action', 'Hombale Films', 'https://youtu.be/Qah9sSIXJqk', '../static/kgf.jpg', 'Rocky takes control of the Kolar Gold Fields and his newfound power makes the government as well as his enemies jittery. However, he still has to confront Ramika, Adheera and Inayat.'),
(22, 'Kantara ', 2022, 2, 'Action', 'Hombale Films', 'https://youtu.be/ppYoIoW73PI', '..\\static\\kantara.jpg', 'A fiery young man clashes with an unflinching forest officer in a south Indian village where spirituality, fate and folklore rule the lands.'),
(23, 'James', 2022, 3, 'Action', 'Kishore Productions', 'https://youtu.be/TPmBdjplUtY', '..\\static\\James.jpg', 'The life of Santosh changes after Vijay, owner of a criminal organisation called Gayakwad Syndicate, enlists his help in his business dealings.'),
(24, 'Kirik Party', 2016, 2, 'Comedy', 'Paramvah Studios', 'https://youtu.be/IfvnbER_6sQ', '..\\static\\Kirik Party.jpg', 'Karna, a first-year engineering student, falls in love with Saanvi, a final-year pupil from his college. However, a tragic event changes his perception towards life and he mends his ways.'),
(25, '777 Charlie', 2022, 4, 'Comedy', 'Paramvah Studios', 'https://youtu.be/REqFOV2A7sI', '..\\static\\777 Charlie.jpg', 'Hope emerges when Charlie, an abused dog, stumbles upon Dharma, a jaded man. As their connection grows, horrific news sends the two friends on a journey together.'),
(26, 'Tagaru', 2018, 5, 'Action', 'Venus Entertainers', 'https://youtu.be/oSy91wMZKVI', '..\\static\\Tagaru.jpg', 'Shiva, an encounter specialist, takes an oath to eradicate the wrongdoers from society. Meanwhile, Punarvasu, a young woman, falls in love with him.'),
(27, 'Mungaru Male', 2006, 6, 'Romantic', 'E K Entertainers', 'https://youtu.be/J_tzXAD193E', '..\\static\\Mungaru Male.jpg', 'Preetham loves Nandhini but gets heartbroken when he comes to know that her marriage is already fixed. Things change when she challenges him to win her heart.'),
(28, 'Shivalinga', 2016, 7, 'Horror', 'Jayanna Combines', 'https://youtu.be/mG-kUNI1Y-I', '..\\static\\Shivalinga.jpg', 'A CID officer reopens a murder case that was reported to be a suicide. As he delves deeper into its mystery, the case takes a personal turn with his wife getting dragged in it.'),
(29, 'Gandhadagudi', 2022, 8, 'Adventure', 'P R K Productions', 'https://youtu.be/UdPisHeGMQM', '..\\static\\Gndhada Gudi.jpg', 'Mega superstar Dr. Puneeth Rajkumar teams up with passionate wildlife filmmaker Amoghavarsha to explore the marvels of his homeland in a fascinating musical journey.'),
(30, 'Vikrant Rona', 2022, 9, 'Thriller', 'Shalini Arts', 'https://youtu.be/-0ldvhBlL-k', '..\\static\\vikrantrona.jpg', 'When Vikrant Rona sets off to investigate a gruesome murder, a series of tragic deaths leads him to discover a supernatural connection. With varying signals and clues, Vikrant must find the killer.'),
(31, 'Sampathige Savaal', 1974, 10, 'Thriller', 'Padmashree Enterprises', 'https://youtu.be/dAu8HWS_Ga4', '..\\static\\Sampathige Savaal.jpg', 'A poor man strives for the welfare of his village. However, the situation complicates as he has to overcome many obstacles put forth by an evil landlord.'),
(32, 'Milana', 2007, 11, 'Romantic', ' K S Dushyanth', 'https://youtu.be/yXRTTaqCey4', '..\\static\\Milana.jpg', 'Anjali\'s father forces her to marry Akash. Unable to forget her past, she demands a divorce from Akash, but soon begins to fall for him.'),
(33, 'Ugramm', 2014, 1, 'Action', 'Inkfinite Pictures', 'https://youtu.be/f7XQSsZLjmo', '..\\static\\Ugramm.jpg', 'When Agastya visits Mughor, he witnesses girls being raped in front of the villagers. He fights against the thugs to stop this but becomes a target of the local mafia.'),
(34, 'Sultan', 2016, 12, 'Action', 'Aditya Chopra', 'https://youtu.be/wPxqcq6Byq0', '..\\static\\Sultan.jpg', 'After the death of his son, Sultan Ali Khan, a middle-aged wrestler, gives up the sport. Years later, he sets out to revive his career as he needs the prize money and wants to regain his lost respect.'),
(35, 'Ek Tha Tiger', 2016, 12, 'Action', 'Yash Raj Films', 'https://youtu.be/SmUl0l8qBXw', '..\\static\\Ek Tha Tiger.jpg', 'It is the first installment in the Tiger franchise and the first film in the YRF Spy Universe.'),
(36, 'Kabhi Khushi Kabhie Gham', 2001, 13, 'Romantic', 'Dharma Productions', 'https://youtu.be/7uY1JbWZKPA', '..\\static\\Kabhi Khushi Khabhie Gham.jpg', 'Rahul, the adopted older son of a rich couple, is banished by his father when he chooses to marry a middle-class woman.'),
(37, 'Chennai Express', 2013, 14, 'Comedy', 'Red Chillies Entertainment', 'https://youtu.be/rARol7Dk2zo', '..\\static\\Chennai Express.jpg', 'Rahul, a young man, sets out to immerse his late grandfather\'s ashes at Rameshwaram. However, when he helps Meena, a runaway bride, board a train, he has to face the ire of her criminal family.'),
(38, 'Mardaani', 2014, 15, 'Thriller', 'Yash Raj Films', 'https://youtu.be/04E-jHtWrDA', '..\\static\\Mardaani.jpg', 'Senior Inspector Shivani Shivaji Roy is a strong dedicated officer of the Mumbai Police force. She works hard to uncover a Delhi-based child trafficking cartel.'),
(39, 'Jagga Jasoos', 2017, 16, 'Adventure', 'Walt Disney Pictures', 'https://youtu.be/YheC-4Qgoro', '..\\static\\Jagga Jasoos.jpg', 'Jagga\'s adoptive father, Bagchi, enrols him in a boarding school and mysteriously disappears. Upon growing up, Jagga goes in search of him and takes the help of Shruti, a journalist.'),
(40, 'Housefull', 2010, 17, 'Comedy', 'Nadiadwala Grandson Entertainment', 'https://youtu.be/0eRVTe98Lz4', '..\\static\\Housefull.jpg', 'Housefull is an Indian comedy film series. The series stars Akshay Kumar and Ritesh Deshmukh in all the films. The first two films Housefull and Housefull 2 were directed by Sajid Khan.'),
(41, '1920', 2008, 18, 'Horror', 'ASA Productions', 'https://youtu.be/yy1Fdp_h4mM', '..\\static\\1920.jpg', 'Arjun falls in love with Lisa and abandons his family and faith for her. They move to a manor in Palampur but when Lisa gets possessed by a demonic spirit, Arjun must save her.'),
(42, 'Stree', 2018, 19, 'Horror', 'Maddock Films', 'https://youtu.be/gzeaGcLLl_A', '..\\static\\Stree.jpg', 'The people of Chanderi live under constant fear of Stree, the spirit of a woman who attacks men at night during festivals. Vicky, along with his friends, decides to unravel the mystery.'),
(43, 'Queen', 2014, 20, 'Adventure', ' Viacom18 Motion Pictures', 'https://youtu.be/KGC6vl3lzf0', '..\\static\\Queen.jpg', 'Rani is devastated after her fiance leaves her just before the wedding. Undeterred, she decides to go on their honeymoon alone where she gets pulled out of her comfort zone and rediscovers herself.'),
(44, 'Ram Setu', 2022, 21, 'Adventure', ' Gaurav Mishra', 'https://youtu.be/VgGgYOzNWno', '..\\static\\Ram Setu.jpg', ' An atheist archaeologist turned believer races against time to prove the true existence of the legendary Ram Setu before evil forces destroy the pillar of India\'s heritage.'),
(45, 'Indra', 2002, 22, 'Action', ' Vyjayanthi Movies', 'https://youtu.be/6EzPCAIKmY4', '..\\static\\Indra.jpg', 'A man embarks on a quest to make peace between two families fighting over the water problem in their district. In a bid to solve this crisis, he agrees to marry a girl from the rival family.'),
(46, 'Chandramukhi', 2005, 7, 'Horror', 'Ramkumar Ganesan', 'https://youtu.be/bvzYVvGiJmI', '..\\static\\Chandramukhi.jpg', 'An NRI and his wife decide to stay in his ancestral home, paying no heed to the warnings about ghosts. Soon inexplicable occurrences cause him to call a psychiatrist to help solve the mystery.'),
(47, 'Karthikeya', 2014, 23, 'Adventure', 'Magnus Cine Prime', 'https://youtu.be/R5IUTalZaHA', '..\\static\\Karthikeya.jpg', 'A medical student, Karthikeya, visits Subramaniyapuram for a medical camp. However, when he learns about the mystery surrounding the temple of Kumara Swami, he decides to investigate it.'),
(49, 'HIT:The Second Case', 2022, 24, 'Thriller', 'Wall Poster Cinema', 'https://youtu.be/UehKhvRR-GQ', '..\\static\\HIT The Second Case.jpg', 'Laid back cop Krishna Dev investigates a gruesome murder case. As KD unravels the layers of the crime, the stakes rise unbelievably high.'),
(50, 'Maryada Ramanna', 2010, 25, 'Comedy', ' Arka Media Works', 'https://youtu.be/OhmOT3FiYag', '..\\static\\Maryada Ramanna.jpg', 'Ramu returns to his hometown to sell a piece of land he owns and falls in love with a young woman only to find out that her parents want him dead.'),
(51, 'Vikram', 2022, 26, 'Action', 'R Mahendran', 'https://youtu.be/L4LWIXngIG0', '..\\static\\vikram.jpg', 'A special agent investigates a murder committed by a masked group of serial killers. However, a tangled maze of clues soon leads him to the drug kingpin of Chennai.'),
(52, 'Yuvarathnaa', 2021, 27, 'Action', 'Hombale Films', 'https://youtu.be/a1L1EviALUg', '..\\static\\Yuvaratna.jpg', 'Due to the privatisation of the education sector, RK College is on the verge of closing. However, the principal and a student join hands to prevent it from happening.'),
(53, 'Sarkaru Vaari Paata', 2022, 28, 'Action', 'Mythri Movie Makers', 'https://youtu.be/tVr9v3o7iHY', '..\\static\\Sarkari Vari Pata.jpg', 'Upon loaning a huge sum to his fraudulent lover in Miami, Mahi is forced to retrieve the amount from her father, who is a politician in Vizag. However, Mahi\'s visit unravels a giant banking scandal.'),
(54, 'HIT: The First Case', 2020, 24, 'Thriller', 'Wall Poster Cinema', 'https://youtu.be/uYdsWe9iBAA', '..\\static\\HIT The First Case.jpg', 'Vikram, a police officer grappling with a personal tragedy, must put his feelings aside and focus on the investigation of a missing girl named Preethi.');

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`id`, `act_id`, `mov_id`, `role`) VALUES
(4, 1, 21, 'Hero'),
(5, 2, 22, 'Hero'),
(6, 4, 24, 'Hero'),
(7, 4, 25, 'Hero'),
(8, 5, 26, 'Hero'),
(9, 6, 27, 'Hero'),
(10, 5, 28, 'Hero'),
(11, 3, 29, 'Hero'),
(12, 7, 30, 'Hero'),
(13, 8, 31, 'Hero'),
(14, 3, 32, 'Hero'),
(15, 9, 33, 'Hero'),
(16, 10, 34, 'Hero'),
(17, 10, 35, 'Hero'),
(18, 11, 36, 'Hero'),
(19, 11, 37, 'Hero'),
(20, 12, 38, 'Heroine'),
(21, 13, 39, 'Hero'),
(22, 14, 40, 'Hero'),
(23, 15, 41, 'Hero'),
(24, 16, 42, 'Hero'),
(25, 17, 43, 'Heroine'),
(26, 14, 44, 'Hero'),
(27, 18, 45, 'Hero'),
(28, 19, 46, 'Hero'),
(29, 20, 47, 'Hero'),
(31, 22, 49, 'Hero'),
(32, 23, 50, 'Hero'),
(33, 24, 26, 'Heroine'),
(34, 25, 26, 'Villan'),
(35, 26, 26, 'Supporting'),
(36, 27, 26, 'Comedian'),
(37, 28, 26, 'Heroine'),
(38, 29, 26, 'Villan'),
(39, 28, 26, 'Heroine'),
(40, 29, 26, 'Villan'),
(41, 30, 21, 'Heroine'),
(42, 31, 21, 'Villan'),
(43, 32, 21, 'Villan'),
(44, 33, 21, 'Supporting'),
(45, 34, 21, 'Comedian'),
(46, 35, 22, 'Heroine'),
(47, 36, 22, 'Supporting'),
(48, 37, 22, 'Villan'),
(49, 38, 22, 'Villan'),
(50, 39, 22, 'Comedian'),
(51, 40, 23, 'Heroine'),
(52, 41, 23, 'Villan'),
(53, 42, 23, 'Supporting'),
(54, 43, 23, 'Comedian'),
(55, 44, 23, 'Villan'),
(56, 45, 24, 'Heroine'),
(57, 46, 24, 'Heroine'),
(58, 38, 24, 'Supporting'),
(59, 37, 24, 'Supporting'),
(60, 47, 24, 'Villan'),
(61, 48, 25, 'Heroine'),
(62, 49, 25, 'Comedian'),
(63, 50, 25, 'Villan'),
(64, 51, 25, 'Supporting'),
(65, 52, 25, 'Supporting'),
(66, 53, 27, 'Heroine'),
(67, 54, 27, 'Supporting'),
(68, 55, 27, 'Villan'),
(69, 56, 27, 'Supporting'),
(70, 57, 27, 'Supporting'),
(71, 58, 29, 'Supporting'),
(72, 59, 30, 'Supporting'),
(73, 60, 30, 'Villan'),
(74, 61, 30, 'Heroine'),
(75, 62, 31, 'Heroine'),
(76, 63, 31, 'Supporting'),
(77, 64, 31, 'Villan'),
(78, 65, 31, 'Supporting'),
(79, 66, 32, 'Heroine'),
(80, 53, 32, 'Heroine'),
(81, 67, 32, 'Comedian'),
(82, 68, 32, 'Villan'),
(83, 69, 33, 'Heroine'),
(84, 70, 33, 'Supporting'),
(85, 71, 33, 'Supporting'),
(86, 72, 33, 'Supporting'),
(87, 73, 33, 'Villan'),
(88, 74, 45, 'Heroine'),
(89, 75, 45, 'Heroine'),
(90, 33, 45, 'Supporting'),
(91, 76, 45, 'Villan'),
(92, 77, 45, 'Comedian'),
(93, 74, 45, 'Heroine'),
(94, 75, 45, 'Heroine'),
(95, 33, 45, 'Supporting'),
(96, 76, 45, 'Villan'),
(97, 77, 45, 'Comedian'),
(98, 59, 30, 'Supporting'),
(99, 60, 30, 'Villan'),
(100, 61, 30, 'Heroine'),
(101, 78, 34, 'Heroine'),
(102, 79, 34, 'Supporting'),
(103, 80, 37, 'Heroine'),
(104, 81, 37, 'Villan'),
(105, 82, 38, 'Villan'),
(106, 83, 38, 'Supporting'),
(107, 84, 39, 'Heroine'),
(108, 85, 39, 'Supporting'),
(109, 86, 40, 'Supporting'),
(110, 87, 40, 'Supporting'),
(111, 80, 40, 'Heroine'),
(112, 88, 41, 'Heroine'),
(113, 89, 41, 'Villan'),
(114, 90, 42, 'Heroine'),
(115, 91, 42, 'Supporting'),
(116, 16, 43, 'Supporting'),
(117, 92, 43, 'Supporting'),
(118, 59, 44, 'Heroine'),
(119, 93, 44, 'Supporting'),
(120, 94, 51, 'Hero'),
(121, 95, 51, 'Villan'),
(122, 96, 51, 'Hero'),
(123, 97, 51, 'Hero'),
(124, 98, 51, 'Villan'),
(125, 3, 52, 'Hero'),
(126, 99, 52, 'Heroine'),
(127, 33, 52, 'Supporting'),
(128, 100, 52, 'Villan'),
(129, 43, 52, 'Comedian'),
(130, 101, 53, 'Hero'),
(131, 102, 53, 'Heroine'),
(132, 103, 53, 'Villan'),
(133, 104, 53, 'Comedian'),
(134, 105, 53, 'Supporting'),
(135, 106, 54, 'Hero'),
(136, 107, 54, 'Heroine'),
(137, 108, 54, 'Villan'),
(138, 109, 54, 'Supporting'),
(139, 3, 23, 'Hero');

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT 'Owner Name',
  `image` varchar(50) NOT NULL DEFAULT '../static/defaultProduction.jpeg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`name`, `owner`, `image`) VALUES
(' Arka Media Works', 'Owner Name', '../static/defaultProduction.jpeg'),
(' Gaurav Mishra', 'Owner Name', '../static/defaultProduction.jpeg'),
(' K S Dushyanth', 'Owner Name', '../static/defaultProduction.jpeg'),
(' Viacom18 Motion Pictures', 'Owner Name', '../static/defaultProduction.jpeg'),
(' Vyjayanthi Movies', 'Owner Name', '../static/defaultProduction.jpeg'),
('Aditya Chopra', 'Owner Name', '../static/defaultProduction.jpeg'),
('ASA Productions', 'Owner Name', '../static/defaultProduction.jpeg'),
('Dharma Productions', 'Owner Name', '../static/defaultProduction.jpeg'),
('E K Entertainers', 'Owner Name', '../static/defaultProduction.jpeg'),
('Hombale Films', 'Owner Name', '../static/defaultProduction.jpeg'),
('Inkfinite Pictures', 'Owner Name', '../static/defaultProduction.jpeg'),
('Jayanna Combines', 'Owner Name', '../static/defaultProduction.jpeg'),
('Kishore Productions', 'Owner Name', '../static/defaultProduction.jpeg'),
('Maddock Films', 'Owner Name', '../static/defaultProduction.jpeg'),
('Magnus Cine Prime', 'Owner Name', '../static/defaultProduction.jpeg'),
('Mythri Movie Makers', 'Owner Name', '../static/defaultProduction.jpeg'),
('Nadiadwala Grandson Entertainment', 'Owner Name', '../static/defaultProduction.jpeg'),
('P R K Productions', 'Owner Name', '../static/defaultProduction.jpeg'),
('Padmashree Enterprises', 'Owner Name', '../static/defaultProduction.jpeg'),
('Paramvah Studios', 'Owner Name', '../static/defaultProduction.jpeg'),
('R Mahendran', 'Owner Name', '../static/defaultProduction.jpeg'),
('Ramkumar Ganesan', 'Owner Name', '../static/defaultProduction.jpeg'),
('Red Chillies Entertainment', 'Owner Name', '../static/defaultProduction.jpeg'),
('Shalini Arts', 'Owner Name', '../static/defaultProduction.jpeg'),
('Venus Entertainers', 'Owner Name', '../static/defaultProduction.jpeg'),
('Wall Poster Cinema', 'Owner Name', '../static/defaultProduction.jpeg'),
('Walt Disney Pictures', 'Owner Name', '../static/defaultProduction.jpeg'),
('Yash Raj Films', 'Owner Name', '../static/defaultProduction.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating` decimal(2,1) NOT NULL,
  `movieid` int(11) NOT NULL,
  `count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating`, `movieid`, `count`) VALUES
('3.0', 36, 2),
('3.0', 54, 1),
('3.3', 35, 3),
('3.5', 33, 2),
('3.5', 41, 2),
('3.5', 47, 2),
('3.5', 50, 2),
('3.7', 21, 3),
('3.7', 30, 4),
('3.7', 46, 3),
('3.8', 25, 4),
('4.0', 22, 2),
('4.0', 26, 2),
('4.0', 28, 2),
('4.0', 32, 3),
('4.0', 38, 3),
('4.0', 42, 2),
('4.0', 43, 2),
('4.0', 51, 2),
('4.0', 53, 2),
('4.2', 37, 4),
('4.3', 24, 3),
('4.3', 27, 3),
('4.5', 23, 2),
('4.5', 34, 2),
('4.5', 40, 2),
('4.5', 44, 2),
('4.5', 45, 2),
('4.5', 49, 2),
('5.0', 29, 1),
('5.0', 31, 2),
('5.0', 39, 1),
('5.0', 52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `genre`) VALUES
(4, 'rdx_1766', 'pavankumarmattad@gmail.com', 'pbkdf2:sha256:260000$0sBnZQEFWogw6Aak$80e9d1fb013796f2598c9bed74ad23289f1119af3bcce568774b3cbdc85ebba1', ''),
(5, 'pavan', 'pavankumar@gmail.com', 'pbkdf2:sha256:260000$W0uJGBFL8zKjDUDj$741f168ce37fbd41085d69e4d8e43b47797d99619edcc3f323cab6c1926344ba', ''),
(6, 'dheeraj', 'dheerajm02@gmail.com', 'pbkdf2:sha256:260000$tinnpOckGlI54S67$d805f0ee357127fb72aa9a350d9b4e930a976b33b2fa4dc97944e4358d6e6967', ''),
(7, 'abhishek009', 'abhishek@gmail.com', 'pbkdf2:sha256:260000$m2DlbX5hAnRWIiES$2f228f3d7cc7d2d6b7647cd932ea4ee5b9240e94e93cb81186e5a462781b2ae8', ''),
(8, 'prajwal_barlaya', 'prajwal@gmail.com', 'pbkdf2:sha256:260000$tcBBWkjEVSe4nm7j$33d5085cbee8e1e202dc8051187a0e8a801456d54d7dcdc14b3b62177177b7f0', ''),
(9, 'harshith', 'harshith@gmail.com', 'pbkdf2:sha256:260000$QIqBJvU0e78fagJB$21a20500a1aec53de6a1a37452eee63f59555e35a607d20f2aa30b47bb234c99', ''),
(10, 'kiran', 'kiran@gmail.com', 'pbkdf2:sha256:260000$kiDDxlRSrES557pk$3b0adef3644154e7a90ce7f08b7efad9c293d723bf82fa3bdf9569c2566fbcc0', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custcount`
--
ALTER TABLE `custcount`
  ADD PRIMARY KEY (`cid`,`movieid`),
  ADD KEY `cid` (`cid`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `production` (`production`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `act_id` (`act_id`,`mov_id`),
  ADD KEY `mov_id` (`mov_id`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `genre` (`genre`),
  ADD KEY `genre_2` (`genre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cast`
--
ALTER TABLE `cast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `movie_cast`
--
ALTER TABLE `movie_cast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custcount`
--
ALTER TABLE `custcount`
  ADD CONSTRAINT `custcount_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `custcount_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `language`
--
ALTER TABLE `language`
  ADD CONSTRAINT `language_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`production`) REFERENCES `production` (`name`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `cast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
