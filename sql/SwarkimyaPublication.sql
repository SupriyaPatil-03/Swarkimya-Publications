-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: swarkimyadb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addbooks`
--

DROP TABLE IF EXISTS `addbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addbooks` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `productimg` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addbooks`
--

LOCK TABLES `addbooks` WRITE;
/*!40000 ALTER TABLE `addbooks` DISABLE KEYS */;
INSERT INTO `addbooks` VALUES (1,'Marathi Balbharti ',60,'First Standard','5.jpg'),(2,'Ganit Ka Jaadu',70,'First Standard','4.webp'),(4,'Majet Shikuya ',55,'First Standard','6.jpg'),(5,'Maridang',80,'First Standard','7.jpg'),(6,'Joyful Mathematics',72,'First Standard','8.jpg'),(7,'Marigold',65,'First Standard','9.jpg'),(8,'Raindrops',45,'First Standard','10.jpg'),(9,'Sarangi Hindi',75,'Second Standard','14-class2.jpg'),(10,'Math- Magic NCERT',65,'First Standard','12.jpg'),(11,'Maridating',45,'Second Standard','13-class2.jpg'),(12,'Raindrops',60,'Second Standard','16-Class2.jpg'),(13,'Joyful mathematics ',75,'Second Standard','7-class2.webp'),(14,'Rimjhim Hindi',50,'First Standard','11.jpg'),(15,'Marigold Book',65,'Second Standard','15-class2.jpg'),(16,'Math-Magic Book English',50,'Second Standard','17-class2.jpg'),(17,'Rimjhim Hindi',60,'Second Standard','18-class2.jpg'),(18,'Ganit Ka Jaadu',65,'First Standard','20.jpg'),(19,'Ganit ka Jaadu',50,'Second Standard','19-class2.jpg'),(20,'Looking Around',65,'Third Standard','22-class3.jpg'),(21,'Math-Magic',62,'Third Standard','25-class3.jpg'),(22,'Rimjhim',55,'Third Standard','21-class3.jpg'),(23,'Marigold',72,'Third Standard','26-class3.jpg'),(24,'Ganit Ka Jaadu',62,'Third Standard','24-class3.jpg'),(25,'Khelu Karu Shiku',60,'First Standard','3.webp'),(26,'Ganit Ka Jaadu',65,'Fourth Standard','27-class4.jpg'),(27,'Looking Around',60,'Fourth Standard','9-class4.webp'),(28,'Marigold',65,'Fourth Standard','30-class4.jpg'),(29,'Math-Magic',62,'Fourth Standard','28-class4.jpg'),(30,'Paryavaran Abhyas Aas-Pass',60,'Fourth Standard','29-class4.jpg'),(31,'English Grammer Worksheets',115,'Fourth Standard','31-class4.jpg'),(32,'One For All Olympiad',300,'Fourth Standard','32-class4.jpg'),(33,'Mental Mathematics',315,'Fourth Standard','33-class4.jpg'),(34,'One For All Workbook GK',250,'Fourth Standard','34-class4.jpg'),(35,'IEO English Workbook',99,'Fourth Standard','35-class4.jpg'),(36,'NSO Science Workbook',99,'Fourth Standard','36-class4.jpg'),(37,'ICSO workbook CS',99,'Fourth Standard','37-class4.jpg'),(38,'IMO Mathematics Workbook',99,'Fourth Standard','10-class4.webp'),(39,'English Grammer & Composition',179,'Fourth Standard','38-class4.jpg'),(40,'Olympiad Reasoning Workbook',128,'Fourth Standard','39-class4.jpg'),(41,'Mental Maths',120,'Fourth Standard','40-class4.jpg'),(42,'Mathematics Worksheets',220,'Third Standard','11-class3.webp'),(43,'English Grammer Worksheets',191,'Third Standard','12-class3.webp'),(44,'Mental Mathematics',243,'Third Standard','13-class3.webp'),(45,'ISSO Social Studies Workbook',99,'Third Standard','42-class3.jpg'),(46,'Reasoning Workbook',150,'Third Standard','43-class3.jpg'),(47,'IEO English Workbook',170,'Third Standard','44-class3.jpg'),(48,'IHO Hindi Workbook',99,'Third Standard','15-class3.webp'),(49,'One For All GK',294,'Third Standard','16-class3.webp'),(50,'santoor',61,'Third Standard','45-class3.jpg'),(51,'Veena ',35,'Third Standard','46-class3.jpg'),(52,'One For All Science Workbook',240,'Third Standard','47-class3.jpg'),(53,'English Grammer Worksheets',218,'Second Standard','17-class2.webp'),(54,'Mental Maths',110,'Second Standard','48-class2.jpg'),(55,'English Grammer',210,'Second Standard','19-class2.webp'),(56,'Composite Mathematics',124,'Second Standard','49-class2.jpg'),(57,'English',210,'Second Standard','20-class2.webp'),(58,'One for all GK',112,'Second Standard','22-class2.webp'),(59,'Science',220,'Second Standard','50-class2.jpg'),(60,'Enviromental Studies',125,'Second Standard','51-class2.jpg'),(61,'Mental Maths',109,'First Standard','23-class2.webp'),(62,'English',120,'First Standard','53-class2.jpg'),(63,'General Knowledge',99,'First Standard','54-class2.jpg'),(64,'Science',160,'First Standard','55-class2.jpg');
/*!40000 ALTER TABLE `addbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addcounseling`
--

DROP TABLE IF EXISTS `addcounseling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addcounseling` (
  `id` int NOT NULL,
  `counselingName` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `courseimg` varchar(1000) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `counselorName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addcounseling`
--

LOCK TABLES `addcounseling` WRITE;
/*!40000 ALTER TABLE `addcounseling` DISABLE KEYS */;
INSERT INTO `addcounseling` VALUES (1,'Anger Management Counseling',1000,'Counseling Sessions','74.jpg','Helps children understand and control their anger, teaching them healthy ways to express their emotions, build empathy, and foster emotional resilience.','45 minutes per session','Mr. Rajesh Mehta'),(2,'Social Skills Counseling',1000,'Counseling Sessions','28.webp','Enhances interpersonal skills by teaching communication, active listening, empathy, relationship-building, conflict resolution, and teamwork, fostering professional growth.','45 minutes per session','Dr. Anita Sharma'),(3,'Attention Deficit Counseling',1200,'Counseling Sessions','78.jpg','Helps children with attention issues to improve focus, organization, and impulse control, while enhancing overall behavior.','45 minutes per session','Dr. Priya Patil'),(4,'Behavioral Issues Counseling',1000,'Counseling Sessions','72.jpg','Addresses a range of behavioral problems, helps children understand consequences, develop better habits, and improve self-discipline.','45 minutes per session','Ms. Kavita Joshi'),(5,'Self-Esteem Counseling',900,'Counseling Sessions','1.jpeg','Self-Esteem Counseling boosts self-confidence and helps children develop a positive self-image. It supports overcoming self-doubt and encourages worth.','45 minutes per session','Ms. Neha Verma\n'),(6,'Stubbornness Counseling',900,'Counseling Sessions','79.jpg','Addresses persistent defiance and helps children develop flexibility and cooperative behavior, promoting better relationships, smoother daily interactions, and a more harmonious environment at home.','45 minutes per session','Mr. Sameer Kulkarni'),(7,'Anxiety Counseling',1100,'Counseling Sessions','80.jpg','Provides techniques to manage anxiety and handle stressors in a healthy manner, fostering emotional well-being and resilience.','45 minutes per session','Dr. Shruti Deshmukh'),(9,'Academic Stress Counseling',1100,'Counseling Sessions','71.jpg','Provides strategies to handle academic pressure and improve study habits.','45 minutes per session','Ms. Riya Shinde'),(10,'Coping with Divorce Counseling',1300,'Counseling Sessions','77.jpg','Supports children through parental separation, helping them process emotions and adjust to changes. It provides coping strategies and emotional guidance for a smoother transition.','45 minutes per session','Dr. Anita Kapoor');
/*!40000 ALTER TABLE `addcounseling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addcourses`
--

DROP TABLE IF EXISTS `addcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addcourses` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `courseimg` varchar(1000) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `startdate` varchar(45) NOT NULL,
  `enddate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addcourses`
--

LOCK TABLES `addcourses` WRITE;
/*!40000 ALTER TABLE `addcourses` DISABLE KEYS */;
INSERT INTO `addcourses` VALUES (1,'Beginner Handwriting',4000,'Handwriting Course','1.webp','This course introduces the basics of handwriting, focusing on letter formation, proper pen grip, and fundamental writing techniques. Children will learn how to write each letter of the alphabet correctly and practice forming simple words. It builds a strong foundation for future handwriting skills. ','4 Months','Mrs. Anjali Sharma','2024-09-01','2025-01-05'),(2,'Cursive Writing',2500,'Handwriting Course','54.jpg','This class teaches students the art of cursive writing, starting with basic strokes and letter connections. Students will practice writing both lowercase and uppercase cursive letters, gradually learning to write in flowing script. The course aims to improve fluidity and legibility in cursive writing.','2 months','Ms. Pooja Desai','2024-09-15','2024-11-26'),(3,'Print Handwriting Improvement',4500,'Handwriting Course','83.jpg','Focuses on refining print handwriting by addressing issues like neatness, consistency, and legibility. Students will work on spacing, letter size, and alignment to achieve a cleaner and more professional appearance in their print writing.This course enhances clarity in everyday writing.','3 Months','Mr. Rohit Gupta','2024-06-12','2024-08-25'),(4,'Creative Handwriting',2000,'Handwriting Course','58.jpg',' This class makes handwriting fun by incorporating artistic elements such as letter art, decorative writing, and personalized styles. Students will engage in creative activities that make learning handwriting enjoyable and visually appealing, helping to foster a love for writing.','2 months','Ms. Sanya Malik','2024-03-01','2024-05-30'),(5,'Advanced Handwriting',1500,'Handwriting Course','59.jpg',' Designed for students who already have a solid foundation in handwriting but want to refine their skills further. This course focuses on improving writing speed, fluidity, and advanced techniques to achieve a more polished and sophisticated handwriting style.','1.5 Month','Dr. Anupama Chavan','2024-05-01','2024-06-21'),(6,'Handwriting for Special Needs',5000,'Handwriting Course','62.jpg','Offers tailored techniques and tools for children with learning disabilities or motor skill challenges. The course includes customized exercises and adaptations to help these students develop effective handwriting skills at their own pace.','5 Months','Mr. Arjun Patel','2024-01-15','2024-05-25'),(7,'Speed Writing',1500,'Handwriting Course','64.jpg','Aims to enhance writing speed without compromising legibility. Students will learn efficient writing strategies and quick note-taking techniques, beneficial for school and exams. This course helps manage time while keeping handwriting clear, ensuring consistency under time constraints.','2.5 Months','Ms. Kavya Reddy','2024-02-01','2024-05-10'),(8,'Calligraphy ',6000,'Handwriting Course','70.jpg','Introduces students to calligraphy, covering various styles, tools, and techniques. The course teaches creating beautiful, decorative letters and explores the artistic side of elegant handwriting. Students will develop unique styles for personalized invitations and greeting cards.','5 Months',' Mr. Aditya Sawant','2024-08-01','2025-01-03'),(9,'Handwriting for Left-Handed Writers',4500,'Handwriting Course','81.jpg','Focuses on techniques and tips specifically designed for left-handed writers. The course addresses common challenges faced by left-handed children and provides solutions to improve comfort and efficiency in handwriting.','3 months','Ms. Meera Kadam','2024-06-01','2024-08-18');
/*!40000 ALTER TABLE `addcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `emailid` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('admin@gmail.com','12345');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `child_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `child_address` varchar(100) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `charges` varchar(45) DEFAULT NULL,
  `course_type` varchar(45) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `admission` VALUES ('Supriya patil','2025-03-14','Male','-1','csc','Handwriting Class','Print Handwriting Improvement','3 Months','4500','2025-03-17','scsc','cxz','4654879/','dvd@hmahc'),('Riddhesh Ganesh Ghadge','2014-01-01','Male','11','Satara','Handwriting Class','Speed Writing','2.5 Months','1500','2025-01-12','Ganesh Hanmant Ghadge','Father','9965874210','ganeshghadge12@gmail.com'),('Pranali Hanmant Patil','2013-10-10','Female','11','Satara','Advanced Handwriting','1.5 Month','Rs. 1500','Handwriting Class','2024-11-01','Malti Hanmant Patil','Mother','9965874210','Malti123@gmail.com'),('Aati Mohit Deshmukh','2015-10-20','Female','9','Sangali','Handwriting for Left-Handed Writers','3 months','Rs. 4500','Handwriting Class','2024-10-13','Mohit Rajendra Deshmukh','Father','7548213650','mohit1224@gmail.com'),('Pragati Bheemrao Suryawanshi','2015-10-13','Female','9','Satara','Speed Writing','2.5 Months','Rs.1500','Handwriting Class','2024-07-08','Piyush Bheemrao Suryawanshi','Brother','8875412698','piyush23@gmail.com'),('Aarav Sachin Patil','2016-08-07','Male','8','Patan','Creative Handwriting','2 months','Rs. 2000','Handwriting Class','2024-11-05','Sachin Shankar Patil','Father','7558416542','sachin1201@gmail.com'),('Aarti Prakash Shinde','2017-09-14','Female','7','Satara','Handwriting for Special Needs','6 Months','Rs. 7500','Handwriting Class','2024-09-06',' Prakash Aanand Shinde','Father','9888546520','shindeprakash1213@gmail.com'),('Vaishnavi Sanjay Vibhute','2016-01-15','Female','8','Satara','Cursive Writing','2 months','Rs. 2500','Handwriting Class','2024-08-07','Satish Ganesh Vibhute','Uncle ','8754123654','vibhutesatish@gmail.com'),('Sanjay Vijay Patil','2013-08-09','Female','11','Pune','Handwriting Class','Cursive Writing','2 months','2500','2025-07-10','Vijay Mahadev Patil','Uncle','7854236951','vijaypatil29@gmail.com'),('Supriya Vijay Patil','2016-03-03','Female','8','Pune','Speed Writing','2.5 Months','Rs. 1500','Handwriting Class','2024-11-02','Vijay Mahadev Patil','Father','9960214587','vijaypatil2912@gmail.com'),('Bhavana Yogesh Chavan','2012-10-22','Female','12','Satara','Handwriting for Special Needs','5 Months','Rs. 7500','Handwriting Class','2024-12-17','Yogesh Ramesh Chavan','Father','9987451203','yogesh@gmail.com');
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksession`
--

DROP TABLE IF EXISTS `booksession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksession` (
  `email` varchar(255) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `id` int NOT NULL,
  `price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `counselor_name` varchar(80) NOT NULL,
  `enrollment_date` varchar(45) NOT NULL,
  `session_time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksession`
--

LOCK TABLES `booksession` WRITE;
/*!40000 ALTER TABLE `booksession` DISABLE KEYS */;
INSERT INTO `booksession` VALUES ('supriyapatil332002@gmail.com','Social Skills Counseling',2,1000,'Counseling Sessions','45 minutes per session','Enhances interpersonal skills by teaching communication, active listening, empathy, relationship-building, conflict resolution, and teamwork, fostering professional growth.','Dr. Anita Sharma','2025-01-03','10:45 AM - 11:30 AM'),('yashchavan123@gmail.com','Attention Deficit Counseling',3,1200,'Counseling Sessions','45 minutes per session','Helps children with attention issues to improve focus, organization, and impulse control, while enhancing overall behavior.','Dr. Priya Patil','2024-09-09','1:00 PM - 1:45 PM'),('vijaypatil29@gmail.com','Behavioral Issues Counseling',4,1000,'Counseling Sessions','45 minutes per session','Addresses a range of behavioral problems, helps children understand consequences, develop better habits, and improve self-discipline.','Ms. Kavita Joshi','2024-12-06','3:15 PM - 4:00 PM'),('ameyghadge13@gmail.com','Self-Esteem Counseling',5,900,'Counseling Sessions','45 minutes per session','Self-Esteem Counseling boosts self-confidence and helps children develop a positive self-image. It supports overcoming self-doubt and encourages worth.','Ms. Neha Verma\n','2024-11-01','11:30 AM - 12:15 PM'),('sanjaypatil0606@gmail.com','Stubbornness Counseling',6,900,'Counseling Sessions','45 minutes per session','Addresses persistent defiance and helps children develop flexibility and cooperative behavior, promoting better relationships, smoother daily interactions, and a more harmonious environment at home.','Mr. Sameer Kulkarni','2024-11-04','3:15 PM - 4:00 PM'),('nikitagaiwad08@gmail.com','Anxiety Counseling',7,1100,'Counseling Sessions','45 minutes per session','Provides techniques to manage anxiety and handle stressors in a healthy manner, fostering emotional well-being and resilience.','Dr. Shruti Deshmukh','2024-10-15','4:00 PM - 4:45 PM'),('yashchavan123@gmail.com','Academic Stress Counseling',9,1100,'Counseling Sessions','45 minutes per session','Provides strategies to handle academic pressure and improve study habits.','Ms. Riya Shinde','2024-12-20','2:30 PM - 3:15 PM');
/*!40000 ALTER TABLE `booksession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'supriyapatil332002@gmail.com','Marathi Balbharti ','60','First Standard','1','60'),(4,'supriyapatil332002@gmail.com','Majet Shikuya ','55','First Standard','2','110'),(11,'mpradnya123@gmail.com','Maridating','45','Second Standard','1','45'),(20,'nikitagaiwad08@gmail.com','Looking Around','65','Third Standard','1','65'),(23,'nikitagaiwad08@gmail.com','Marigold','72','Third Standard','2','144'),(27,'ameyghadge13@gmail.com','Looking Around','60','Fourth Standard','4','240'),(28,'sanjaypatil0606@gmail.com','Marigold','65','Fourth Standard','1','65'),(38,'ankitapawar2240@123','IMO Mathematics Workbook','99','Fourth Standard','7','693'),(42,'priyankathorat2603@gmail.com','Mathematics Worksheets','220','Third Standard','1','220'),(51,'sanjaypatil0606@gmail.com','Veena ','35','Third Standard','3','105');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('Nikita Gaikwad','nikitagaiwad08@gmail.com','9875421630','Hi, can you send me the schedule for handwriting classes?'),('Pradnya More','mpradnya123@gmail.com','7854236951','Are there class 2 Books of olympiad book available'),('Priyanka Thorat','priyankathorat2603@gmail.com','9875642845','Want to Know About Counseling Sessions'),('Sanjay Patil','sanjaypatil0606@gmail.com','9545172006','Class 4 Books Needed'),('Supriya Vijay Patil','supriyapatil332002@gmail.com','7558413355','Hello, when should i visit institute for my Calligraphy classes.'),('Yash Chavan','yashchavan123@gmail.com','9785463210','Hello, Id like more info on counseling sessions for children.');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpayment`
--

DROP TABLE IF EXISTS `cpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpayment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `method` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpayment`
--

LOCK TABLES `cpayment` WRITE;
/*!40000 ALTER TABLE `cpayment` DISABLE KEYS */;
INSERT INTO `cpayment` VALUES (1,900,'Offline Payment','sanjaypatil0606@gmail.com','2024-11-29');
/*!40000 ALTER TABLE `cpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `orderno` int NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `emailid` varchar(50) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('priyankathorat2603@gmail.com','effective handwriting lessons'),('mpradnya123@gmail.com','Excellent educational resources and supportive counseling. Highly recommended!'),('shindeprakash1213@gmail.com','it is a very useful platform.My child loves the books and has greatly improved in handwriting.'),('maheshmore002@gmail.com','impactful counseling for kids.'),('yashchavan123@gmail.com','It is very usefull website for young learners'),('sanjaypatil0606@gmail.com','Books can be easily available'),('sachin1201@gmail.com','My childs handwriting has improved significantly, and the book selection is perfect for his level.'),('supriyapatil332002@gmail.com','Nice Website');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdet`
--

DROP TABLE IF EXISTS `orderdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdet` (
  `ordno` int NOT NULL,
  `id` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`ordno`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdet`
--

LOCK TABLES `orderdet` WRITE;
/*!40000 ALTER TABLE `orderdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermst`
--

DROP TABLE IF EXISTS `ordermst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordermst` (
  `odt` varchar(50) DEFAULT NULL,
  `ordno` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ordno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermst`
--

LOCK TABLES `ordermst` WRITE;
/*!40000 ALTER TABLE `ordermst` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordermst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `amount` int NOT NULL,
  `method` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ordno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (45,'Cash on Delivery','Satara','sachin1201@gmail.com','4'),(50,'Cash on Delivery','Satara','sachin1201@gmail.com','3'),(60,'Cash on Delivery','Satara','mpradnya123@gmail.com','9'),(62,'Cash on Delivery','Satara','nikitagaiwad08@gmail.com','1'),(65,'Cash on Delivery','Satara','supriyapatil332002@gmail.com','2'),(72,'Cash on Delivery','Satara','ankitapawar2240@123','5'),(100,'Cash on Delivery','Satara','supriyapatil332002@gmail.com','6'),(110,'Cash on Delivery','Satara','priyankathorat2603@gmail.com','8'),(112,'Cash on Delivery','Satara','akshatatp01@gmail.com','10'),(210,'Cash on Delivery','Satara','yashchavan123@gmail.com','7');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('Akshata Patil','Pune','Pune','Female','8754129797','akshatatp01@gmail.com','Akshata@123'),('Amey Ghadge','Chikhali','Pune','Male','8754269851','ameyghadge13@gmail.com','Amey@123'),('Ankita Pawar','Balawadi','Sangali','Female','9322042227','ankitapawar2240@123','Ankita@123'),('Pradnya More','morghar','Satara','Female','7854236951','mpradnya123@gmail.com','Pradnya@123'),('Nikita Gaikwad','Satara','Satara','Female','9875421630','nikitagaiwad08@gmail.com','Nikita@123'),('Priyanka Thorat','Divashi BK','Satara','Female','9875642845','priyankathorat2603@gmail.com','Priyanka@123'),('Sachin Patil','Patan','Satara','Male','9985647213','sachin1201@gmail.com','Sachin@123'),('Sanjay Patil','Katraj','Pune','Male','9545172006','sanjaypatil0606@gmail.com','Sanjay@123'),('Supriya Patil','Patan','Satara','Female','7558413355','supriyapatil332002@gmail.com','Supriya@123'),('Vijay Patil','Pune','Pune','Male','7854236951','vijaypatil29@gmail.com','Vijay@123'),('Yash Chavan','Thane','Mumbai','Male','9785463210','yashchavan123@gmail.com','Yash@123');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-16 15:10:10
