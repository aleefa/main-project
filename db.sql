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
(25,'Can add assign_work_table',7,'add_assign_work_table'),
(26,'Can change assign_work_table',7,'change_assign_work_table'),
(27,'Can delete assign_work_table',7,'delete_assign_work_table'),
(28,'Can view assign_work_table',7,'view_assign_work_table'),
(29,'Can add hr_table',8,'add_hr_table'),
(30,'Can change hr_table',8,'change_hr_table'),
(31,'Can delete hr_table',8,'delete_hr_table'),
(32,'Can view hr_table',8,'view_hr_table'),
(33,'Can add login_table',9,'add_login_table'),
(34,'Can change login_table',9,'change_login_table'),
(35,'Can delete login_table',9,'delete_login_table'),
(36,'Can view login_table',9,'view_login_table'),
(37,'Can add staff_table',10,'add_staff_table'),
(38,'Can change staff_table',10,'change_staff_table'),
(39,'Can delete staff_table',10,'delete_staff_table'),
(40,'Can view staff_table',10,'view_staff_table'),
(41,'Can add work_table',11,'add_work_table'),
(42,'Can change work_table',11,'change_work_table'),
(43,'Can delete work_table',11,'delete_work_table'),
(44,'Can view work_table',11,'view_work_table'),
(45,'Can add ta_location',12,'add_ta_location'),
(46,'Can change ta_location',12,'change_ta_location'),
(47,'Can delete ta_location',12,'delete_ta_location'),
(48,'Can view ta_location',12,'view_ta_location'),
(49,'Can add ta',13,'add_ta'),
(50,'Can change ta',13,'change_ta'),
(51,'Can delete ta',13,'delete_ta'),
(52,'Can view ta',13,'view_ta'),
(53,'Can add salary_table',14,'add_salary_table'),
(54,'Can change salary_table',14,'change_salary_table'),
(55,'Can delete salary_table',14,'delete_salary_table'),
(56,'Can view salary_table',14,'view_salary_table'),
(57,'Can add location_table',15,'add_location_table'),
(58,'Can change location_table',15,'change_location_table'),
(59,'Can delete location_table',15,'delete_location_table'),
(60,'Can view location_table',15,'view_location_table'),
(61,'Can add leave_table',16,'add_leave_table'),
(62,'Can change leave_table',16,'change_leave_table'),
(63,'Can delete leave_table',16,'delete_leave_table'),
(64,'Can view leave_table',16,'view_leave_table'),
(65,'Can add da_table',17,'add_da_table'),
(66,'Can change da_table',17,'change_da_table'),
(67,'Can delete da_table',17,'delete_da_table'),
(68,'Can view da_table',17,'view_da_table'),
(69,'Can add complaint',18,'add_complaint'),
(70,'Can change complaint',18,'change_complaint'),
(71,'Can delete complaint',18,'delete_complaint'),
(72,'Can view complaint',18,'view_complaint'),
(73,'Can add attendance',19,'add_attendance'),
(74,'Can change attendance',19,'change_attendance'),
(75,'Can delete attendance',19,'delete_attendance'),
(76,'Can view attendance',19,'view_attendance');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$6yBw5jpf4LhL88q2wO2u1M$7Qmu5yTtYH+ACd1b7tyesGsJPDkgjVfqtY9Vo+vE1qM=','2024-04-13 12:29:15.071811',1,'admin','','','admin@gmail.com',1,1,'2024-04-13 11:19:52.076198');

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
(7,'emp_app','assign_work_table'),
(19,'emp_app','attendance'),
(18,'emp_app','complaint'),
(17,'emp_app','da_table'),
(8,'emp_app','hr_table'),
(16,'emp_app','leave_table'),
(15,'emp_app','location_table'),
(9,'emp_app','login_table'),
(14,'emp_app','salary_table'),
(10,'emp_app','staff_table'),
(13,'emp_app','ta'),
(12,'emp_app','ta_location'),
(11,'emp_app','work_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-17 07:38:51.892186'),
(2,'auth','0001_initial','2024-03-17 07:38:52.383769'),
(3,'admin','0001_initial','2024-03-17 07:38:52.522062'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-17 07:38:52.533612'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-17 07:38:52.550500'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-17 07:38:52.633831'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-17 07:38:52.671144'),
(8,'auth','0003_alter_user_email_max_length','2024-03-17 07:38:52.700781'),
(9,'auth','0004_alter_user_username_opts','2024-03-17 07:38:52.700781'),
(10,'auth','0005_alter_user_last_login_null','2024-03-17 07:38:52.733678'),
(11,'auth','0006_require_contenttypes_0002','2024-03-17 07:38:52.747016'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-17 07:38:52.750242'),
(13,'auth','0008_alter_user_username_max_length','2024-03-17 07:38:52.800253'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-17 07:38:52.837377'),
(15,'auth','0010_alter_group_name_max_length','2024-03-17 07:38:52.858490'),
(16,'auth','0011_update_proxy_permissions','2024-03-17 07:38:52.867243'),
(17,'auth','0012_alter_user_first_name_max_length','2024-03-17 07:38:52.906068'),
(18,'emp_app','0001_initial','2024-03-17 07:38:53.563856'),
(19,'emp_app','0002_leave_table_reason','2024-03-17 07:38:53.602932'),
(20,'sessions','0001_initial','2024-03-17 07:38:53.633764'),
(21,'emp_app','0003_alter_attendance_work','2024-03-28 07:54:55.867782'),
(22,'emp_app','0004_attendance_attendance','2024-03-28 08:46:56.763568');

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
('5ngitr2p426z92l2gpop51jfzkbiib1i','eyJsaWQiOjQsIndpZCI6Mn0:1rnciE:GfltpWqiri8LEJp0w72igaYXFx7KaPRS13nU-oG_FxA','2024-04-05 11:05:26.547494'),
('6at51rhxinzkbfynjm8tpnf0s8pgstu1','eyJsaWQiOjQsImNvaWQiOjE2fQ:1rupHQ:-DqjljW2isTDqstXa7zh5q2xd-Q6dJQFiTFQ1Uv0Y1M','2024-04-25 07:55:32.916976'),
('i5x5pzdammqenmi69o88kpi5iorsub4f','eyJsaWQiOjQsImNvaWQiOjEwfQ:1rqQt5:LDBwyBdmhaiSw2mC0QfxkDDuWSO-eOq0zTOp7Bjb3qs','2024-04-13 05:04:15.445494'),
('iwjfvtq6wfl0imkou526x3kixpmv3lw4','.eJxVjr0OgzAMhN8lM4ry40LSsTvPgOw4FFpEJALqUPXdm0gM7XSnu88nv8WAxz4NR47bMLO4Ci2a34wwPONaC37gek8ypHXfZpIVkWebZZ84LreT_RuYME_l2l4ck-8UkiYCi45B6YhAtm2VAefN2DIEb8EEw9pCGAvFHTjrFHBXRpf6HzTilaoxxVT1ny-MAD4B:1rvcW2:kVDuq6B7Xjpn4lJsCA6p-ce_KAy3BJbQ2TVyoZ3qMds','2024-04-27 12:29:54.730263'),
('kp7xyv8ieade3vc654blhxzhr7sxukxg','eyJsaWQiOjQsImNvaWQiOjV9:1rpm7Z:DndyqXEma1J8AsPO3q4XgrcQSwr67EI0WmoiewwZtZ8','2024-04-11 09:32:29.398182'),
('mep977ergnomf4icim4pjrnz0twalo9e','eyJsaWQiOjQsImNvaWQiOjR9:1rloam:udn9dRj5mliwVCHUzOJHIBasgJI1xBHo_bRc_ML3AFc','2024-03-31 11:22:16.913803'),
('r5zizpshdb6vjlv0v4ogr9edhkeznnh4','eyJsaWQiOjQsIndvaWQiOjksIndpZCI6OX0:1ru5Hf:gezWpkE-qpYxA8XH-T9ceYFJvB3HdiKOWX45w1pyj8o','2024-04-23 06:48:43.667936'),
('wuwpyxofdyr21fnm05n839n1xwnmqcbt','eyJsaWQiOjQsIndvaWQiOjUsIndpZCI6NX0:1rrVvp:ef9a7ZQPDs8qPDcJevUCmj9aLLVBsJZJm_W8_8x81zM','2024-04-16 04:39:33.978019'),
('y2e7m27pzel6mash17s7bii36vnzlpr9','eyJsaWQiOjQsIndvaWQiOjksIndpZCI6OX0:1rvD0P:1onLvMR9uILLqV4MMJF4vV3r0eHjBYkaFGlP00KXnmM','2024-04-26 09:15:33.887535');

/*Table structure for table `emp_app_assign_work_table` */

DROP TABLE IF EXISTS `emp_app_assign_work_table`;

CREATE TABLE `emp_app_assign_work_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `staff_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_assign_work__staff_id_e7a72012_fk_emp_app_s` (`staff_id`),
  KEY `emp_app_assign_work__work_id_87e5e236_fk_emp_app_w` (`work_id`),
  CONSTRAINT `emp_app_assign_work__staff_id_e7a72012_fk_emp_app_s` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`),
  CONSTRAINT `emp_app_assign_work__work_id_87e5e236_fk_emp_app_w` FOREIGN KEY (`work_id`) REFERENCES `emp_app_work_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_assign_work_table` */

insert  into `emp_app_assign_work_table`(`id`,`status`,`date`,`staff_id`,`work_id`) values 
(1,'pending','2024-04-13',3,1),
(2,'pending','2024-04-13',1,2),
(3,'completed ','2024-04-06',3,3),
(4,'pending','2024-04-13',3,4),
(5,'completed ','2024-04-02',1,5),
(9,'pending','2024-04-13',3,9);

/*Table structure for table `emp_app_attendance` */

DROP TABLE IF EXISTS `emp_app_attendance`;

CREATE TABLE `emp_app_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `staff_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  `attendance` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_attendance_staff_id_d5c21c59_fk_emp_app_staff_table_id` (`staff_id`),
  KEY `emp_app_attendance_work_id_f6c64923_fk_emp_app_a` (`work_id`),
  CONSTRAINT `emp_app_attendance_staff_id_d5c21c59_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`),
  CONSTRAINT `emp_app_attendance_work_id_f6c64923_fk_emp_app_a` FOREIGN KEY (`work_id`) REFERENCES `emp_app_assign_work_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_attendance` */

insert  into `emp_app_attendance`(`id`,`date`,`time`,`image`,`staff_id`,`work_id`,`attendance`) values 
(1,'2024-03-28','00:00:02.000000','asdfgh',1,1,1),
(2,'2024-03-20','00:00:03.000000','qwe',1,1,1),
(3,'2024-03-26','00:00:04.000000','234r',1,1,0),
(9,'2024-03-31','12:41:41.991943','1711869080458.jpg',3,9,1),
(10,'2024-04-06','14:47:23.260774','1712395013091.jpg',3,4,1),
(11,'2024-04-09','14:35:37.238526','1712653459657.jpg',3,9,1),
(14,'2024-04-11','16:20:34.099618','1712832596767.jpg',3,9,1),
(21,'2024-04-13','17:31:21.143634','1713009667582.jpg',3,4,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_complaint` */

insert  into `emp_app_complaint`(`id`,`complaint`,`reply`,`date`,`staff_id`) values 
(2,'error','we\'ll check\r\n','2024-03-17',1),
(3,'wrong ','yyy','2024-03-17',1),
(9,'not working ','pending','2024-03-22',1),
(10,'error','okk','2024-03-30',1),
(11,'labour short in construction site','we\'ll arrange more labours','2024-03-30',3),
(12,'material shirtage','pending','2024-04-02',1),
(13,'sand mixing machine complaint ','pending','2024-04-02',1),
(16,'site issues','we\'ll check','2024-04-02',1);

/*Table structure for table `emp_app_da_table` */

DROP TABLE IF EXISTS `emp_app_da_table`;

CREATE TABLE `emp_app_da_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expense` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `bill` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `assign_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_app_da_table_assign_id_120cb06d_fk_emp_app_a` (`assign_id`),
  CONSTRAINT `emp_app_da_table_assign_id_120cb06d_fk_emp_app_a` FOREIGN KEY (`assign_id`) REFERENCES `emp_app_assign_work_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_da_table` */

insert  into `emp_app_da_table`(`id`,`expense`,`amount`,`bill`,`status`,`date`,`assign_id`) values 
(1,'food',250,'my resume_pDnP4aq.pdf','pending','2024-03-22',1),
(2,'3344',55,'my resume_mbzpmG4.pdf','pending','2024-03-22',1),
(3,'3344',55,'my resume_tWqysXg.pdf','pending','2024-03-22',1),
(4,'3344',55,'my resume_7PUR6P2.pdf','pending','2024-03-22',1),
(5,'petrol',66,'my resume_CBSgaOQ.pdf','pending','2024-03-22',1),
(6,'petrol',66,'my resume_6lOW9oq.pdf','pending','2024-03-22',1),
(7,'petrol',66,'my resume_xhOphRU.pdf','pending','2024-03-22',1),
(8,'food',46,'my resume_lCYeVcq.pdf','pending','2024-03-22',1),
(9,'food',150,'61e03aa97430a_A4CoyIS.pdf','accepted','2024-04-02',5);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_hr_table` */

insert  into `emp_app_hr_table`(`id`,`fname`,`lname`,`dob`,`gender`,`place`,`post`,`pin`,`phno`,`email`,`photo`,`LOGIN_id`) values 
(1,'Naja','cp','2005-12-13','female','mkm','mkm',786787,9876541098,'naja@gmail.com','Screenshot (3).png',4),
(2,'Noufa','cp','2005-12-19','female','mkm','mkm',765567,9876543210,'noufa@gmail.com','shop.jpeg',6);

/*Table structure for table `emp_app_leave_table` */

DROP TABLE IF EXISTS `emp_app_leave_table`;

CREATE TABLE `emp_app_leave_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `no_of_days` int NOT NULL,
  `from_date` date NOT NULL,
  `status` varchar(500) NOT NULL,
  `staff_id` bigint NOT NULL,
  `reason` longtext NOT NULL DEFAULT (_utf8mb3'1'),
  PRIMARY KEY (`id`),
  KEY `emp_app_leave_table_staff_id_8efc609b_fk_emp_app_staff_table_id` (`staff_id`),
  CONSTRAINT `emp_app_leave_table_staff_id_8efc609b_fk_emp_app_staff_table_id` FOREIGN KEY (`staff_id`) REFERENCES `emp_app_staff_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_leave_table` */

insert  into `emp_app_leave_table`(`id`,`date`,`no_of_days`,`from_date`,`status`,`staff_id`,`reason`) values 
(3,'2024-03-30',2,'2024-03-31','rejected',3,'marriage function '),
(4,'2024-03-30',1,'2024-03-30','accepted',3,'fever'),
(5,'2024-03-30',1,'2024-04-04','accepted',1,'house warming '),
(6,'2024-04-02',2,'2024-04-03','accepted',1,'hospital case');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_location_table` */

insert  into `emp_app_location_table`(`id`,`latitude`,`longitude`,`LOGIN_id`) values 
(1,11.257820333394237,75.78450841715559,8),
(2,11.3119947,75.9551245,5);

/*Table structure for table `emp_app_login_table` */

DROP TABLE IF EXISTS `emp_app_login_table`;

CREATE TABLE `emp_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_login_table` */

insert  into `emp_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','Admin','admin'),
(2,'hr','Hr','hr'),
(3,'staff','staff','staff'),
(4,'naja','Naja@123','hr'),
(5,'niha','Niha@123','staff'),
(6,'noufa','Noufa@123','Resigned'),
(7,'sana','Sana@123','staff'),
(8,'aleefa','Aleefa@123','staff'),
(9,'wwww','Aleefa@1233','staff'),
(10,'qqqqqqqqqqqq','Wter@123','staff');

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
  KEY `emp_app_staff_table_LOGIN_id_890e6ca7_fk_emp_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `emp_app_staff_table_LOGIN_id_890e6ca7_fk_emp_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `emp_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_staff_table` */

insert  into `emp_app_staff_table`(`id`,`fname`,`lname`,`dob`,`gender`,`place`,`post`,`pin`,`phno`,`email`,`photo`,`LOGIN_id`) values 
(1,'Niha','CP','2005-12-07','female','mkm','mkm',787656,9876543210,'niha@gmail.com','Screenshot (9).png',5),
(2,'sana','cp','2005-07-06','female','clt','clt',678765,9876543210,'sana@gmail.com','WhatsApp Image 2024-03-23 at 8.47.01 PM.jpeg',7),
(3,'Aleefa','mp','2003-03-19','female','cmr','cmr',675456,8787656765,'aleefa@gmail.com','20240330_131414.jpg',8),
(4,'Eeqeqw','as','2005-12-14','female','cmr','cmr',675456,8787656765,'aleefa@gmail.com','h1_eA7WeXT.jpg',9),
(5,'qqqq','qqq','2005-10-20','male','qww','qqq',111111,6111111111,'qq@gggg.com','h1_knstp8i.jpg',10);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_ta` */

insert  into `emp_app_ta`(`id`,`login_latitude`,`login_longitude`,`distance`,`amount`,`status`,`date`,`assignwork_id`) values 
(1,11.257482804770273,75.78436574032631,1.5099525538191567,22,'pending','2024-03-22',1),
(2,11.257654286333633,75.78439755106275,1.5097661434082998,22,'pending','2024-03-22',1),
(3,11.3119843,75.9551213,1.4714361170833306,22,'pending','2024-04-02',5);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_ta_location` */

insert  into `emp_app_ta_location`(`id`,`from_latitude`,`from_longitude`,`to_latitude`,`to_longitude`,`time`,`date`,`staff_id`) values 
(1,11.257626780023411,75.78441632284658,11.257654286333633,75.78439755106275,'17:01:11.983191','2024-03-22',1),
(2,11.3119843,75.9551213,11.3119843,75.9551213,'11:13:46.798808','2024-04-02',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp_app_work_table` */

insert  into `emp_app_work_table`(`id`,`work`,`description`,`status`,`date`,`latitude`,`longitude`,`plan`,`client`,`hr_id`) values 
(1,'house construction','A cozy and functional single-story bungalow with a contemporary design, featuring three bedrooms, two bathrooms, an open-concept living and dining area, a modern kitchen, a laundry room, and a covered outdoor patio. The house will have a total floor area of approximately 1,500 square feet.','pending','2024-04-13',11.353152965512527,75.92677116394043,'h1.jpg','Muhammed',1),
(2,'villa construction','A luxurious and spacious villa retreat with a modern Mediterranean-inspired design, featuring five bedrooms, five bathrooms, multiple living and entertainment areas, a gourmet kitchen, a home office, a fitness room, a swimming pool, a landscaped garden, and a detached guest house. The villa will offer panoramic views of the surrounding mountains and desert landscape.','pending','2024-04-13',11.352806178993585,75.91758481563622,'villa.webp','vasu',1),
(3,'House construction',' A luxurious single-family home with a modern design, featuring four bedrooms, three bathrooms, a spacious living area, gourmet kitchen, home office, outdoor patio, and a two-car garage. The house will incorporate eco-friendly materials and energy-efficient systems.','pending','2024-03-29',11.352839072420158,75.91589922276646,'Standard House Plan Collection.jpg','Mathai',1),
(4,'Road construction','The Greenway Avenue Expansion Project aims to enhance transportation infrastructure by widening and improving Greenway Avenue to accommodate increased traffic flow, improve safety, and enhance connectivity between residential, commercial, and industrial areas.','pending','2024-04-13',11.2577782,75.7845593,'Road embankment detail plan and elevation 2d view dwg file.jpg','Greenway Avenue',1),
(5,'Road construction','The Greenway Avenue Expansion Project aims to enhance transportation infrastructure by widening and improving Greenway Avenue to accommodate increased traffic flow, improve safety, and enhance connectivity between residential, commercial, and industrial areas.','pending','2024-04-02',11.352839072420158,75.91383928624302,'Road embankment detail plan and elevation 2d view dwg file_ol6tKoY.jpg','Greenway Avenue',1),
(9,'building construction','A luxurious single-family home with a modern design, featuring four bedrooms, three bathrooms, a spacious living area, gourmet kitchen, home office, outdoor patio, and a two-car garage. The house will incorporate eco-friendly materials and energy-efficient systems.','pending','2024-04-13',11.3119896,75.9548367,'Road embankment detail plan and elevation 2d view dwg file_IueQ09I.jpg','vasu',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
