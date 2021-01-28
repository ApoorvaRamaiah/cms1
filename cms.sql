-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2020 at 07:51 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `showComments` (IN `a` INT(3))  select * from comments where comment_post_id=a and comment_status ='approved' order by comment_id desc$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `username` varchar(255) NOT NULL,
  `post_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`username`, `post_id`) VALUES
('abhishek', 25),
('abhishek', 26),
('harsh', 24),
('harsh1', 9),
('jvardh21', 6),
('jvardh21', 14),
('jvardh21', 18),
('jvardh21', 19);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(65, 'smartphones'),
(66, 'cars'),
(67, 'bike'),
(68, 'cricketer'),
(69, 'electronics'),
(70, 'clothes'),
(71, 'sportswear'),
(72, 'suv'),
(73, 'q'),
(74, 'jewellery');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(41, 24, 'harsh', 'harsh12@gmail.com', 'ghshsgedhjhd', 'approved', '2019-11-27'),
(42, 30, 'kmc', 'mndjqd@nvcsg.com', 'hgvhavgv jb chdsb', 'approved', '2019-11-27'),
(43, 25, 'abcd', 'abcd@gmffk.gknb', 'nfvjkerjenjkvk', 'approved', '2019-11-27'),
(44, 27, 'ujinjr', 'nbj@jnj.com', 'njdeed', 'approved', '2019-11-27'),
(45, 24, 'hbvhv', 'hgfhghg@ggjgj', 'ghghgchgc', 'unapproved', '2019-11-27'),
(46, 24, 'ram', 'rama@gmail.com', 'nice one', 'approved', '2019-12-10');

--
-- Triggers `comments`
--
DELIMITER $$
CREATE TRIGGER `cs` AFTER INSERT ON `comments` FOR EACH ROW begin update posts SET post_comment_count=post_comment_count+1 where post_id = new.comment_post_id;end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`) VALUES
(24, 65, 'note 8 pro', 'harsh', '2019-11-27', 'note8pro.jpeg', '<p>cons- game playing camera speed</p><p>pros - heating</p><p><strong>Redmi Note 8 Pro</strong> is powered by an octa-core MediaTek Helio G90T processor that features 2 cores clocked at 2.05GHz and 6 cores clocked at 2GHz. It comes with 6GB of RAM. The <strong>Redmi Note 8 Pro</strong> runs Android 9 Pie and is powered by a 4500mAh non-removable battery. The <strong>Redmi Note 8 Pro</strong> supports proprietary fast charging</p>', 'mobile', 4, 'published'),
(25, 66, 'lambo urus', 'abhishek', '2019-11-27', 'urus.webp', '<p>pros- space speed</p><p>cons -price</p><p>&nbsp;</p><p>A super sports car soul and the functionality typical for an SUV: this is Lamborghini Urus, the worldâ€™s first Super Sport Utility Vehicle. Identifiable as an authentic Lamborghini with its unmistakable DNA, Urus is at the same time a groundbreaking car: the extreme proportions, the pure Lamborghini design and the outstanding performance make it absolutely unique. Urusâ€™ distinctive silhouette with a dynamic flying coupÃ© line shows its super sports origins, while its outstanding proportions convey strength, solidity and safety. Without a doubt the factors at the heart of Urusâ€™ success are advanced design, extraordinary driving dynamics and thrilling performance. All these features allowed Lamborghini to launch a Super Sport Utility Vehicle remaining loyal to its DNA.<br>Urus conveys its utmost versatility also in its design, which meets the requirements of a wide variety of customers with Style packages, exterior details in carbon fiber or the Off-Road package.</p>', 'car lambo suv', 1, 'published'),
(26, 67, 'apache', 'abhishek', '2019-11-27', 'apa.jpg', '<p>TVS offers 5 <strong>Apache</strong> models in India. TVS <strong>Apache</strong> RTR 160 is the lowest priced model at Rs. 78,715 (Ex-Showroom, Delhi) and New TVS <strong>Apache</strong> RR 310 is the highest priced model at Rs. 2.17 lakh (Ex-Showroom, Delhi). ... The <strong>Apache</strong> RTR 180 is the first and the cheapest <strong>bike</strong> with ABS available in India</p>', 'bike tvs apache', 0, 'published'),
(27, 66, 'ferrari', 'abhishek', '2019-11-27', 'ferrari-812-superfast_gamma_mobile.jpg', '<p>ferrari cars</p>', 'ferrari car supercars', 1, 'published'),
(28, 65, 'iphone11', 'harsh', '2019-11-27', 'iphone11.jpg', '<p>Pros: For the price point, youâ€™re getting a very solid phone which has most of the bells and whistles that itâ€™s Pro siblings have. I donâ€™t watch a lot of movies or lengthy videos on my phone, so the fact that this has an LCD screen (as opposed to the better OLED screen) didnâ€™t bother me too much. Before buying this, I compared the screens of the XR and the XS (which have an LCD and OLED screen respectively) since there were no sample models available of these new models. While the colours did seem a little more natural on the OLED screen, it didnâ€™t seem worth the extra Â£300. Also, the Pro models have a Telephoto lens as well but, again, TBH, shelling out the extra 300 quid for essentially an OLED screen and a telephoto lens didnâ€™t seem worth it for me</p>', 'iphone apple mobile smartphone', 0, 'published'),
(29, 67, 'suzuki hayabusa', 'harsh', '2019-11-27', 'suzuki-hayabusa-metallic-oort-grey.png', '<p>&nbsp;</p><p>Suzuki has launched the 2019 Edition of the iconic Hayabusa in two new colours along with a pair of side reflectors to meet Indian safety standards. The bike, priced at Rs 13.74 lakh (ex-showroom), will be offered in two new colours - grey and black. Though the bike will be discontinued in the European markets, the â€˜Busa will continue to be sold in countries like the US and India. Reportedly, the current model will be replaced by an all-new Suzuki Hayabusa in 2020.</p>', 'bike suzuki hayabusa racing', 0, 'published'),
(30, 66, 'maruti swift', 'abhishek', '2019-11-27', 'swift.jpg', '<p>Maruti Suzuki has introduced a BS6-compliant petrol engine in the <strong>Swift</strong>. ... Maruti Suzuki <strong>Swift</strong> Prices &amp; Variants: The <strong>Swift</strong> is priced between Rs 5.14 lakh and Rs 8.84 lakh (ex-showroom Delhi). Maruti Suzuki offers the <strong>Swift</strong> in four variants: L, V, Z and Z+</p>', 'cars swift indian maruti', 1, 'published'),
(31, 65, 'iphone 10', 'harsh', '2019-11-27', 'swift.jpg', '<p>fgfhfhvm</p>', 'smartphone mobile apple iphone', 0, 'draft'),
(32, 65, '', '', '2019-11-27', '', '<p>&nbsp;</p>', '', 0, 'draft'),
(33, 70, 'nike', 'harsh', '2019-11-27', '', '<p>ghgj</p>', 'clothing sports', 0, 'published'),
(34, 73, 'fdjhj', 'abhishek ji', '2019-12-09', 'india-wallpaper-1.jpg', '<p>&nbsp;</p>', 'babty india', 0, 'published'),
(35, 65, '', '', '2019-12-09', '', '<p>&nbsp;</p>', '', 0, 'draft'),
(36, 74, 'hjg', '', '2019-12-11', 'btc.jpg', '<p>jkhjgfeg</p>', 'jewellery gold ', 0, 'published');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystring22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `role`, `randSalt`) VALUES
(8, 'harsh1', 'nanku', 'Harsh', 'Ashish', 'harshmailbox@gmail.com', '', 'admin', ''),
(15, 'harsh', 'qwerty12345', 'harsh', 'ashish', 'harsh@gmail.com', '', 'Admin', '$2y$10$iusesomecrazystring22'),
(16, 'abhishek', 'asdf1234', 'abhishek', 'raj', 'abhi@gmail.com', '', 'Admin', '$2y$10$iusesomecrazystring22'),
(17, 'abhi', '12345', 'abhi', 'raj', 'abhcg@hggv.com', '', 'subscriber', '$2y$10$iusesomecrazystring22'),
(18, 'abhishek', 'asdf1234', 'abhi', 'raj', 'abhi@gmail.com', '', 'Admin', '$2y$10$iusesomecrazystring22');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'etpe32q0cf6psgmdbr941acc2v', 1543362865),
(2, 'p976o0hivs7085f0o4l370pgld', 1543360321),
(3, 'okoddqbq07kn6pu35l2n8pm30g', 1543362330),
(4, '9itrcc7ju9k3p5ntvt7vdct81g', 1543362355),
(5, 'ccm23ff1bedi0ba4qcf4690qrr', 1543612293),
(6, '3lcee2se1dilaaf6ies8aen03h', 1543668898),
(7, 'lap768sjge3t9btodpg0di056n', 1544430941),
(8, 'tb5om5jfsi0embrik7jt5u4esu', 1544435107),
(9, 'e1ilj3ccpo13jeepvi39r0utno', 1544506595),
(10, 'mavjbc9ncohg9vt8f7mbfigeo8', 1544517149),
(11, 'krn8o4qd00ua5pue04ie6t6t0r', 1547957955),
(12, 'onq1ktn8bjnn395pu2mctp9l95', 1564088480),
(13, '4oe278rr2087cuknhahijde606', 1572244600),
(14, 'hqr9og2p62ed0k9j90ga7ju5qu', 1572496339),
(15, 'ja13hirhm734h9t1njbme0vf4m', 1572496532),
(16, 'coka8ahspvbuvcc6c1e09qpofp', 1572496596),
(17, 'rca7ua30hg1v7bp2qfaqt5h1ou', 1572497250),
(18, 'qih30tp95rls3tghbqgtmj59o6', 1572497946),
(19, 'rh3i1djjcs7jhfs3hgpc9n3jv6', 1574741124),
(20, 'shp1crti1uedbmnkm33h1c09t0', 1572707531),
(21, 'grm54rbcfkrl6rnvbutudpjj5i', 1574780447),
(22, '2mc5etjvll07ad2t9u863c9gf9', 1574798126),
(23, 'vrfc5lskfg4f25gdsaa591m973', 1574828881),
(24, 'obkpaufk95d1s1ulbtpu94av5n', 1574829125),
(25, '482fbbsnlvf68cir2mk5g03ar0', 1574832914),
(26, 'fc1uj7jmb6shlfpo3kssg5n1v4', 1574841684),
(27, 'k9r5ldhn0a5endhsp0ie63dsb0', 1575005347),
(28, 'l0hdtb3kj4i2sohjb37340pakl', 1575953027),
(29, 'bnsbj0m6l9qe8i469fog986trs', 1576003943),
(30, 'gadv3delmsl28l59pjtsn8cmrv', 1576039086);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`username`,`post_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
