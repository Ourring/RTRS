/*
Navicat MySQL Data Transfer

Source Server         : LinkOne
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : db_rtrs

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-01-16 19:36:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `re_course`
-- ----------------------------
DROP TABLE IF EXISTS `re_course`;
CREATE TABLE `re_course` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_name` varchar(50) NOT NULL,
  `co_make` varchar(250) NOT NULL,
  `co_price` float(10,4) NOT NULL,
  `co_Regist_open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of re_course
-- ----------------------------

-- ----------------------------
-- Table structure for `re_course_stydent`
-- ----------------------------
DROP TABLE IF EXISTS `re_course_stydent`;
CREATE TABLE `re_course_stydent` (
  `co_id` int(11) NOT NULL,
  `st_id` varchar(50) NOT NULL,
  `moneyed` float(10,4) NOT NULL DEFAULT '0.0000',
  `confirm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`co_id`,`st_id`),
  KEY `st_id` (`st_id`),
  CONSTRAINT `re_course_stydent_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `re_course` (`co_id`),
  CONSTRAINT `re_course_stydent_ibfk_2` FOREIGN KEY (`st_id`) REFERENCES `student` (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of re_course_stydent
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `st_ticket` varchar(50) NOT NULL,
  `st_name` varchar(50) NOT NULL,
  `st_college` varchar(50) NOT NULL,
  `st_department` varchar(50) NOT NULL,
  `st_id` varchar(50) NOT NULL,
  `st_up_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
