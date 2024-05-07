/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - emp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`emp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `emp`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add ta',7,'add_ta'),
(26,'Can change ta',7,'change_ta'),
(27,'Can delete ta',7,'delete_ta'),
(28,'Can view ta',7,'view_ta'),
(29,'Can add complaint',8,'add_complaint'),
(30,'Can change complaint',8,'change_complaint'),
(31,'Can delete complaint',8,'delete_complaint'),
(32,'Can view complaint',8,'view_complaint'),
(33,'Can add attendance',9,'add_attendance'),
(34,'Can change attendance',9,'change_attendance'),
(35,'Can delete attendance',9,'delete_attendance'),
(36,'Can view attendance',9,'view_attendance'),
(37,'Can add assign_work_table',10,'add_assign_work_table'),
(38,'Can change assign_work_table',10,'change_assign_work_table'),
(39,'Can delete assign_work_table',10,'delete_assign_work_table'),
(40,'Can view assign_work_table',10,'view_assign_work_table'),
(41,'Can add da_table',11,'add_da_table'),
(42,'Can change da_table',11,'change_da_table'),
(43,'Can delete da_table',11,'delete_da_table'),
(44,'Can view da_table',11,'view_da_table'),
(45,'Can add hr_table',12,'add_hr_table'),
(46,'Can change hr_table',12,'change_hr_table'),
(47,'Can delete hr_table',12,'delete_hr_table'),
(48,'Can view hr_table',12,'view_hr_table'),
(49,'Can add leave_table',13,'add_leave_table'),
(50,'Can change leave_table',13,'change_leave_table'),
(51,'Can delete leave_table',13,'delete_leave_table'),
(52,'Can view leave_table',13,'view_leave_table'),
(53,'Can add location_table',14,'add_location_table'),
(54,'Can change location_table',14,'change_location_table'),
(55,'Can delete location_table',14,'delete_location_table'),
(56,'Can view location_table',14,'view_location_table'),
(57,'Can add login_table',15,'add_login_table'),
(58,'Can change login_table',15,'change_login_table'),
(59,'Can delete login_table',15,'delete_login_table'),
(60,'Can view login_table',15,'view_login_table'),
(61,'Can add salary_table',16,'add_salary_table'),
(62,'Can change salary_table',16,'change_salary_table'),
(63,'Can delete salary_table',16,'delete_salary_table'),
(64,'Can view salary_table',16,'view_salary_table'),
(65,'Can add staff_table',17,'add_staff_table'),
(66,'Can change staff_table',17,'change_staff_table'),
(67,'Can delete staff_table',17,'delete_staff_table'),
(68,'Can view staff_table',17,'view_staff_table'),
(69,'Can add work_table',18,'add_work_table'),
(70,'Can change work_table',18,'change_work_table'),
(71,'Can delete work_table',18,'delete_work_table'),
(72,'Can view work_table',18,'view_work_table'),
(73,'Can add ta_location',19,'add_ta_location'),
(74,'Can change ta_location',19,'change_ta_location'),
(75,'Can delete ta_location',19,'delete_ta_location'),
(76,'Can view ta_location',19,'view_ta_location');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'emp_app','assign_work_table'),
(9,'emp_app','attendance'),
(8,'emp_app','complaint'),
(11,'emp_app','da_table'),
(12,'emp_app','hr_table'),
(13,'emp_app','leave_table'),
(14,'emp_app','location_table'),
(15,'emp_app','login_table'),
(16,'emp_app','salary_table'),
(17,'emp_app','staff_table'),
(7,'emp_app','ta'),
(19,'emp_app','ta_location'),
(18,'emp_app','work_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-02-04 07:23:29.604228'),
(2,'auth','0001_initial','2024-02-04 07:23:30.384224'),
(3,'admin','0001_initial','2024-02-04 07:23:30.553791'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-04 07:23:30.569901'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-04 07:23:30.585587'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-04 07:23:30.682671'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-04 07:23:30.732947'),
(8,'auth','0003_alter_user_email_max_length','2024-02-04 07:23:30.759596'),
(9,'auth','0004_alter_user_username_opts','2024-02-04 07:23:30.759596'),
(10,'auth','0005_alter_user_last_login_null','2024-02-04 07:23:30.812363'),
(11,'auth','0006_require_contenttypes_0002','2024-02-04 07:23:30.812363'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-04 07:23:30.823402'),
(13,'auth','0008_alter_user_username_max_length','2024-02-04 07:23:30.870593'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-04 07:23:30.933930'),
(15,'auth','0010_alter_group_name_max_length','2024-02-04 07:23:30.953389'),
(16,'auth','0011_update_proxy_permissions','2024-02-04 07:23:30.953389'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-04 07:23:31.032168'),
(18,'emp_app','0001_initial','2024-02-04 07:23:31.982496'),
(19,'emp_app','0002_auto_20240204_1243','2024-02-04 07:23:33.074883'),
(20,'emp_app','0003_auto_20240204_1253','2024-02-04 07:23:33.517904'),
(21,'sessions','0001_initial','2024-02-04 07:23:33.565075'),
(22,'emp_app','0004_auto_20240301_1533','2024-03-01 10:03:14.085946'),
(23,'emp_app','0005_auto_20240302_1638','2024-03-02 11:09:13.313421'),
(24,'emp_app','0006_auto_20240302_1645','2024-03-02 11:16:04.121218');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('1l7ep7n20ct304dr14pncj7aqbu2n0mn','eyJsaWQiOjIsImhpZCI6OCwid29pZCI6MTMsIndpZCI6MTR9:1rfBHs:FYPitJ9Rm5s66_nMolS0AK7AekfyE-UBSVQoFNN77CI','2024-03-13 04:11:20.378669'),
('2jkjczc7u9ou9vjisgpcmdexxcpta0aj','eyJoaWQiOjIsImxpZCI6Mn0:1rWeM4:9S3Mrm66NexL01iF08oryFxMv9JTawJPwRyT0cJ3FiA','2024-02-18 15:24:24.521295'),
('abqpqhygyqmbujqsp1v7gpi21mt4ag9n','eyJsaWQiOjIsImhpZCI6NH0:1rZkKJ:ew2xc6NEdP8si2IXGLINh7SOtYmR10AyUP7HVV2jeC4','2024-02-27 04:23:23.563738'),
('cgc5wi04fxpdks163jku390f74t98o2j','eyJsaWQiOjJ9:1raT8r:5BDsnEfBC_j4IcMp4BurCjIN48xJyeijxu5t4Z8KSo0','2024-02-29 04:14:33.789837'),
('l8fkuwv7z9gwb825npaklvuupfst4t77','eyJsaWQiOjIsIndpZCI6MTV9:1rgLnI:bYkenYm4w5_tNO5Gi0JJSvoDfAPg1M-6xoz3gUd-Q3A','2024-03-16 09:36:36.853776'),
('sbxmt3769sohm16p1gl2i3a1hkably6c','.eJyrVsrITFGyMtZRygHRRjpK5SDaHEjngxm1AKhDCa0:1rZOJf:c7z93tsgLZcqU9SWS2WLLecK-MCP7pZWg1NWMYle1lc','2024-02-26 04:53:15.571471');

/*Table structure for table `emp_app_assign_work_table` */

DROP TABLE IF EXISTS `emp_app_assign_work_table`;

CREATE TABLE `emp_app_assign_work_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `staff_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_assign_work__work_id_87e5e236_fk_emp_app_w` (`work_id`),
  KEY `emp_app_assign_work__staff_id_e7a72012_fk_emp_app_s` (`staff_id`),
  CONSTRAINT `emp_app_assign_work__staff_id_e7a72012_fk_emp_app_s` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`),
  CONSTRAINT `emp_app_assign_work__work_id_87e5e236_fk_emp_app_w` FOREIGN KEY (`work_id`) REFERENCES `emp_app_work_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_assign_work_table` */

insert  into `emp_app_assign_work_table`(`id`,`status`,`date`,`staff_id`,`work_id`) values 
(5,'khh','2024-02-22',4,9),
(8,'on progress','2024-02-26',8,12),
(9,'pending','2024-02-27',5,13),
(10,'pending','2024-02-27',4,14),
(11,'pending','2024-03-01',6,15);

/*Table structure for table `emp_app_attendance` */

DROP TABLE IF EXISTS `emp_app_attendance`;

CREATE TABLE `emp_app_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `staff_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_attendance_work_id_f6c64923_fk_emp_app_work_table_id` (`work_id`),
  KEY `emp_app_attendance_staff_id_d5c21c59_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_attendance_staff_id_d5c21c59_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`),
  CONSTRAINT `emp_app_attendance_work_id_f6c64923_fk_emp_app_work_table_id` FOREIGN KEY (`work_id`) REFERENCES `emp_app_work_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_attendance` */

/*Table structure for table `emp_app_complaint` */

DROP TABLE IF EXISTS `emp_app_complaint`;

CREATE TABLE `emp_app_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_complaint_staff_id_7271de50_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_complaint_staff_id_7271de50_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_complaint` */

/*Table structure for table `emp_app_da_table` */

DROP TABLE IF EXISTS `emp_app_da_table`;

CREATE TABLE `emp_app_da_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expense` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `bill` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_da_table_staff_id_7df4f00b_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_da_table_staff_id_7df4f00b_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_da_table` */

insert  into `emp_app_da_table`(`id`,`expense`,`amount`,`bill`,`status`,`date`,`staff_id`) values 
(1,'food',160,'my resume_voOajH2.pdf','pending','2024-03-01',4),
(13,'petrol',250,'0_1549799159304_KajalReport_I0I8Xy6.pdf','pending','2024-03-02',4),
(14,'petrol',250,'0_1549799159304_KajalReport_Z2GIhDD.pdf','pending','2024-03-02',4);

/*Table structure for table `emp_app_hr_table` */

DROP TABLE IF EXISTS `emp_app_hr_table`;

CREATE TABLE `emp_app_hr_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `pin` int NOT NULL,
  `phno` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_hr_table_LOGIN_id_aabb976b_fk_emp_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `emp_app_hr_table_LOGIN_id_aabb976b_fk_emp_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `emp_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_hr_table` */

insert  into `emp_app_hr_table`(`id`,`fname`,`lname`,`dob`,`gender`,`place`,`post`,`pin`,`phno`,`email`,`photo`,`LOGIN_id`) values 
(5,'Aleefa','MP','2001-06-12','female','mukkam','cmr',673602,9876545643,'aleefamp@gmail.com','abc2.png',2),
(6,'Jacob','O','1999-01-06','male','clt','clt',543234,9876543456,'jacob@gmail.com','abc1.png',8),
(12,'huda','hh','2005-12-01','female','cmr','gdg',345667,8765434567,'sdas@abc','career.jpg',23),
(13,'sdfghj','','2005-12-01','female','xdcgfhjbkn','sdfghj',765567,7876787678,'fhg@gmail.com','wall - Copy.jpg',24),
(14,'raju','','2005-12-23','male','cmr','cmr',876678,9876545678,'raju@gmail.com','404677.jpg',25);

/*Table structure for table `emp_app_leave_table` */

DROP TABLE IF EXISTS `emp_app_leave_table`;

CREATE TABLE `emp_app_leave_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `no_of_days` int NOT NULL,
  `from_date` date NOT NULL,
  `status` varchar(500) NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_leave_table_staff_id_8efc609b_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_leave_table_staff_id_8efc609b_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_leave_table` */

/*Table structure for table `emp_app_location_table` */

DROP TABLE IF EXISTS `emp_app_location_table`;

CREATE TABLE `emp_app_location_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_location_tab_LOGIN_id_0064f8f2_fk_emp_app_l` (`LOGIN_id`),
  CONSTRAINT `emp_app_location_tab_LOGIN_id_0064f8f2_fk_emp_app_l` FOREIGN KEY (`LOGIN_id`) REFERENCES `emp_app_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_location_table` */

/*Table structure for table `emp_app_login_table` */

DROP TABLE IF EXISTS `emp_app_login_table`;

CREATE TABLE `emp_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_login_table` */

insert  into `emp_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'hr','hr','hr'),
(7,'aleefa','Aleefa@123','hr'),
(8,'jacob','Jacob@123','Resigned'),
(9,'rose','Rose@123','Resigned'),
(13,'nedha','Nedha@123','staff'),
(15,'aysha','Aysha@123','staff'),
(19,'salha','Salha@123','staff'),
(20,'neenu','Neenu@123','staff'),
(21,'aali','Aaali@123','staff'),
(22,'fida','Fida@123','Resigned'),
(23,'huda','Huda@657','disabled'),
(24,'fdhgfchgio','Adgxgf@345','disabled'),
(25,'raju','Raju@123','hr');

/*Table structure for table `emp_app_salary_table` */

DROP TABLE IF EXISTS `emp_app_salary_table`;

CREATE TABLE `emp_app_salary_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `salary` double NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_salary_table_staff_id_37f692e3_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_salary_table_staff_id_37f692e3_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_salary_table` */

/*Table structure for table `emp_app_staff_table` */

DROP TABLE IF EXISTS `emp_app_staff_table`;

CREATE TABLE `emp_app_staff_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `pin` int NOT NULL,
  `phno` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_hr_LOGIN_id_de64cb4f_fk_emp_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `emp_app_hr_LOGIN_id_de64cb4f_fk_emp_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `emp_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_staff_table` */

insert  into `emp_app_staff_table`(`id`,`fname`,`lname`,`dob`,`gender`,`place`,`post`,`pin`,`phno`,`email`,`photo`,`LOGIN_id`) values 
(4,'Nedha','KC','2001-12-18','female','clt','clt',876567,8765434567,'nedha@gmail.com','new_XUsyOpi.jpeg',13),
(5,'aysha','o','2002-12-11','female','kgm','kgm',675654,9876567876,'aysha@gmail.com','abc2_6ryfS94.png',15),
(6,'Fathima','s','2001-02-19','female','kgm','kgm',765434,8767654568,'salha@gmail.com','new_D9jYiO3.jpeg',19),
(7,'Neenu','AS','2002-02-14','female','cmr','cmr',765567,8767656576,'neenu@gmail.com','new_hMyQPYC.jpeg',20),
(8,'Aali','K','1997-06-18','female','erk','erk',876567,8765434567,'aali@gmail.com','new_MlgNNYQ.png',21),
(9,'Fida','MP','2005-12-01','female','cmr','cmr',673674,9876567876,'fida@gmail.com','abc2_fWPqH8p.png',22);

/*Table structure for table `emp_app_ta` */

DROP TABLE IF EXISTS `emp_app_ta`;

CREATE TABLE `emp_app_ta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login_latitude` double NOT NULL,
  `login_longitude` double NOT NULL,
  `distance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `assignwork_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_ta_assignwork_id_fe1ec7ba_fk_emp_app_a` (`assignwork_id`),
  CONSTRAINT `emp_app_ta_assignwork_id_fe1ec7ba_fk_emp_app_a` FOREIGN KEY (`assignwork_id`) REFERENCES `emp_app_assign_work_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_ta` */

/*Table structure for table `emp_app_ta_location` */

DROP TABLE IF EXISTS `emp_app_ta_location`;

CREATE TABLE `emp_app_ta_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_latitude` double DEFAULT NULL,
  `from_longitude` double DEFAULT NULL,
  `to_latitude` double DEFAULT NULL,
  `to_longitude` double DEFAULT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_ta_location_staff_id_9ecdbe35_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_ta_location_staff_id_9ecdbe35_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_ta_location` */

insert  into `emp_app_ta_location`(`id`,`from_latitude`,`from_longitude`,`to_latitude`,`to_longitude`,`time`,`date`,`staff_id`) values 
(1,13,13,NULL,NULL,'17:25:19.637271','2024-03-02',4),
(2,13,13,NULL,NULL,'17:26:01.716576','2024-03-02',4),
(3,13,13,13,13,'17:33:07.091066','2024-03-02',4),
(4,11.2577852,75.7845337,11.2577852,75.7845337,'17:34:44.877064','2024-03-02',4),
(5,11.2577901,75.784538,11.2577901,75.784538,'17:35:04.529429','2024-03-02',4);

/*Table structure for table `emp_app_work_table` */

DROP TABLE IF EXISTS `emp_app_work_table`;

CREATE TABLE `emp_app_work_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `plan` varchar(100) NOT NULL,
  `client` varchar(50) NOT NULL,
  `hr_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_work_table_hr_id_1bc80c1d_fk_emp_app_hr_table_id` (`hr_id`),
  CONSTRAINT `emp_app_work_table_hr_id_1bc80c1d_fk_emp_app_hr_table_id` FOREIGN KEY (`hr_id`) REFERENCES `emp_app_hr_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_work_table` */

insert  into `emp_app_work_table`(`id`,`work`,`description`,`status`,`date`,`latitude`,`longitude`,`plan`,`client`,`hr_id`) values 
(9,'house construction','This begins with site planning, where we develop layouts and assess essential details like lot size and utility access. Subsequently, we collaborate closely with clients, discussing budget, timelines, and preferences, which we document alongside their contact information for transparent communication','pending','2024-02-07',11.35275492112228,75.91813082066685,'RCC SR ZIV(1).pdf','house construction',5),
(12,'villa construction','2 bedroom,with vast courtyad','pending','2024-02-07',11.60136708336991,92.72878498038226,'artem-labunsky-c9p30E94OUU-unsplash.jpg','villa construction',5),
(13,'ds','gyvbuhb','pending','2024-02-08',11.329505501206599,75.98831176757812,'RCC SR ZIV(1) (1).pdf','sfs',5),
(14,'wrqwr','wrtewt','pending','2024-02-08',11.36267389803075,75.92868799534946,'RCC SR ZIV(1)_H1ZugWl.pdf','wd',5),
(15,'jehrnijthre','dtrfguhijokpl','pending','2024-03-08',11.353310317175284,75.91152185765415,'register1.png','asdfgh',5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
