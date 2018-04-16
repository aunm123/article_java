/*
 Navicat MySQL Data Transfer

 Source Server         : php_docker_mysql
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : localhost
 Source Database       : spring

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : utf-8

 Date: 04/17/2018 00:12:56 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(100) NOT NULL,
  `header` varchar(100) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `content` text,
  `author` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_published` int(1) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(100) NOT NULL,
  `category_id` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_article`
-- ----------------------------
BEGIN;
INSERT INTO `t_article` VALUES ('1', '我的世界', '世界', '内容', '作者', '简介', '1', '0', '2018-04-16 21:18:59', '2018-04-16 21:19:01', '1', '1'), ('2', 'Java Web实用技术', 'JavaScript闭包详解', 'JavaScript闭包详解', 'Jack', 'JavaScript闭包详解', '1', '0', '2018-04-16 23:56:15', '2018-04-16 23:56:17', '1', '2'), ('3', 'Java Web实用技术', 'SpringMVC入门教程', 'SpringMVC入门教程', 'Jack', 'SpringMVC入门教程', '1', '0', '2018-04-16 23:57:04', '2018-04-16 16:59:49', '1', '2'), ('4', 'Java Web实用技术', 'Maven安装', 'Maven安装', 'Jack', 'Maven安装', '1', '0', '2018-04-16 23:57:46', '2018-04-16 17:00:28', '1', '2'), ('5', 'Java Web实用技术', 'Tomcat安装', 'Tomcat安装', 'Jack', 'Tomcat安装', '1', '0', '2018-04-16 23:58:23', '2018-04-16 17:01:04', '1', '2'), ('6', '治愈力', '男人来自火星', '男人来自火星', 'Jack', '男人来自火星', '1', '0', '2018-04-16 23:58:23', '2018-04-16 17:14:08', '1', '3'), ('7', '治愈力', '女人来自金星', '女人来自金星', 'Jack', '女人来自金星', '1', '0', '2018-04-17 00:11:52', '2018-04-16 17:14:36', '1', '3');
COMMIT;

-- ----------------------------
--  Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_category`
-- ----------------------------
BEGIN;
INSERT INTO `t_category` VALUES ('1', '连载小说'), ('2', '编程代码类'), ('3', '生活感悟');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(30) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `headerpic` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uodate_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '/icon.png', 'aunm123@yeah.net', '1', '2018-04-16 17:03:30', '2018-04-16 17:03:32', '0', '世界', '15521251749');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
