/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : speedproject_weilai

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-08-03 16:07:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dt_archives
-- ----------------------------
DROP TABLE IF EXISTS `dt_archives`;
CREATE TABLE `dt_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `address` longtext,
  `organization_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `jiebie` longtext,
  `manager_id` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  `description` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `dt_archives_file_category` FOREIGN KEY (`category_id`) REFERENCES `dt_archives_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_archives
-- ----------------------------

-- ----------------------------
-- Table structure for dt_archives_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_archives_attach`;
CREATE TABLE `dt_archives_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archives_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_pdf_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `down_num` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `archives_id` (`archives_id`),
  CONSTRAINT `dt_archives_attachs` FOREIGN KEY (`archives_id`) REFERENCES `dt_archives` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_archives_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_archives_category
-- ----------------------------
DROP TABLE IF EXISTS `dt_archives_category`;
CREATE TABLE `dt_archives_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `call_index` varchar(50) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `class_list` varchar(500) DEFAULT NULL,
  `class_layer` int(11) NOT NULL,
  `content` longtext,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_archives_category
-- ----------------------------

-- ----------------------------
-- Table structure for dt_archives_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_archives_log`;
CREATE TABLE `dt_archives_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archives_id` int(11) NOT NULL,
  `type` longtext,
  `opterator` longtext,
  `title` longtext,
  `ip` longtext,
  `remark` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_archives_log
-- ----------------------------

-- ----------------------------
-- Table structure for dt_backup_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_backup_log`;
CREATE TABLE `dt_backup_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_backup_log
-- ----------------------------

-- ----------------------------
-- Table structure for dt_bidcost
-- ----------------------------
DROP TABLE IF EXISTS `dt_bidcost`;
CREATE TABLE `dt_bidcost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_name` longtext,
  `bid_open_time` longtext,
  `object_name` longtext,
  `s_one` longtext,
  `s_two` longtext,
  `s_three` longtext,
  `s_four` longtext,
  `certigier_one` longtext,
  `certigier_two` longtext,
  `certigier_three` longtext,
  `certigier_four` longtext,
  `apply_fee` decimal(18,2) NOT NULL,
  `bid_service_fee` decimal(18,2) NOT NULL,
  `travel_fee` decimal(18,2) NOT NULL,
  `specialist_fee` decimal(18,2) NOT NULL,
  `bidding_fee` decimal(18,2) NOT NULL,
  `total_cost` decimal(18,2) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_bidcost
-- ----------------------------

-- ----------------------------
-- Table structure for dt_customer
-- ----------------------------
DROP TABLE IF EXISTS `dt_customer`;
CREATE TABLE `dt_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_customer
-- ----------------------------

-- ----------------------------
-- Table structure for dt_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dt_dictionary`;
CREATE TABLE `dt_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `class_list` varchar(500) DEFAULT NULL,
  `class_layer` int(11) NOT NULL,
  `is_tree` tinyint(3) unsigned NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for dt_dictionary_detail
-- ----------------------------
DROP TABLE IF EXISTS `dt_dictionary_detail`;
CREATE TABLE `dt_dictionary_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictionary_id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_default` tinyint(3) unsigned NOT NULL,
  `is_lock` tinyint(3) unsigned NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_dictionary_detail
-- ----------------------------

-- ----------------------------
-- Table structure for dt_directsales_info
-- ----------------------------
DROP TABLE IF EXISTS `dt_directsales_info`;
CREATE TABLE `dt_directsales_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manageid` int(11) NOT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `project_money` decimal(18,3) NOT NULL,
  `royalty_money` decimal(18,3) NOT NULL,
  `canyushijian` datetime NOT NULL,
  `sheng` longtext,
  `shi` longtext,
  `quxian` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_directsales_info
-- ----------------------------

-- ----------------------------
-- Table structure for dt_directsales_manage
-- ----------------------------
DROP TABLE IF EXISTS `dt_directsales_manage`;
CREATE TABLE `dt_directsales_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `address` longtext,
  `telephone` varchar(100) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `responsible_domain` varchar(200) DEFAULT NULL,
  `corporate_name` longtext,
  `proportion_remarks` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_directsales_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dt_fellowshipcost
-- ----------------------------
DROP TABLE IF EXISTS `dt_fellowshipcost`;
CREATE TABLE `dt_fellowshipcost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_name` longtext,
  `work_time` longtext,
  `meetingroom_cost` decimal(18,2) NOT NULL,
  `repast_cost` decimal(18,2) NOT NULL,
  `accommodation_cost` decimal(18,2) NOT NULL,
  `tobacco_wine_cost` decimal(18,2) NOT NULL,
  `transportation_cost` decimal(18,2) NOT NULL,
  `travel_cost` decimal(18,2) NOT NULL,
  `gift_cost` decimal(18,2) NOT NULL,
  `others_cost` decimal(18,2) NOT NULL,
  `total_cost` decimal(18,2) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_fellowshipcost
-- ----------------------------

-- ----------------------------
-- Table structure for dt_manager
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager`;
CREATE TABLE `dt_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` longtext,
  `role_id` int(11) NOT NULL,
  `role_type` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_audit` tinyint(3) unsigned NOT NULL,
  `is_lock` int(11) NOT NULL,
  `subordinates` longtext,
  `projectstr` longtext,
  `nameForidcard` varchar(20) DEFAULT NULL,
  `gender` longtext,
  `post` longtext,
  `wx_open_id` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `dt_manager_manager_role` FOREIGN KEY (`role_id`) REFERENCES `dt_manager_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_manager
-- ----------------------------
INSERT INTO `dt_manager` VALUES ('1', null, '1', '1', 'admin', '89984480210841E283164FB454453FD0E1BEF69D1E483E44', '24V0XZ', null, '超级管理员', '13800138000', '794535565@qq.com', '0', '0', '99', '2017-01-01 00:00:00', null, null, null, null, '99', '2020-04-02 18:03:24');
INSERT INTO `dt_manager` VALUES ('2', 'KK00998', '1', '1', '测试', '9A13D3A97CBFF2E4', '24V0XZ', null, '测试', '', '', '0', '0', '99', '2020-01-08 16:18:43', null, '3213219', '请选择', '', '99', '2020-04-28 18:03:26');
INSERT INTO `dt_manager` VALUES ('3', '1', '15', '3', '白慧鹏', '755F8219D608E76C', '8V4P24', null, '白慧鹏', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:11:32');
INSERT INTO `dt_manager` VALUES ('4', '1', '6', '3', '温四林', 'EF44684C28B1C943', '0V26ZN', null, '温四林', '', '', '0', '0', ',3,', null, '1', '男', '', null, '99', '2020-04-03 16:12:35');
INSERT INTO `dt_manager` VALUES ('5', '1', '15', '3', '何海', '50EBC9FDB37B3ADA', 'XJJ0LX', null, '何海', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:14:14');
INSERT INTO `dt_manager` VALUES ('6', '1', '15', '3', '姚威', 'B4D2DC5D889B63F9', 'RFFP04', null, '姚威', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:15:15');
INSERT INTO `dt_manager` VALUES ('7', '1', '6', '3', '周艳', '38DFFCA7CE81DCE73B647C8347E382A6', 'LH80RX', null, '周艳', '', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-04-03 16:16:45');
INSERT INTO `dt_manager` VALUES ('8', '1', '6', '3', '陈淑琳', '16DFA65F82B8B1C6', '0R2DBJ', null, '陈淑琳', '18012341505', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-04-03 16:17:44');
INSERT INTO `dt_manager` VALUES ('9', '1', '6', '3', '孙茂荣', 'E9B19A7C847351BC', 'FF4XBT', null, '孙茂荣', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:18:53');
INSERT INTO `dt_manager` VALUES ('10', '1', '15', '3', '万子禹', '2714D3FEEF219F14', '028FL4', null, '万子禹', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:21:38');
INSERT INTO `dt_manager` VALUES ('11', '1', '15', '3', '刘锦武', '1637ABACF4A18058', 'VVBT64', null, '刘锦武', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:23:06');
INSERT INTO `dt_manager` VALUES ('12', '1', '15', '3', '高恒娟', '970F214B8D588967', 'VL2F6X', null, '高恒娟', '18751988175', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-04-03 16:25:03');
INSERT INTO `dt_manager` VALUES ('13', '1', '1', '1', '钱志奇', '385460901BAF578A', 'JRN86D', null, '钱志奇', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 16:28:29');
INSERT INTO `dt_manager` VALUES ('14', '1', '1', '1', '吴雷华', '312BFD280A019FF2', '2TRFPZ', null, '吴雷华', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 17:48:27');
INSERT INTO `dt_manager` VALUES ('15', '1', '1', '1', '耿禹', 'E9DE487EAAB10292', 'NP0N2D', null, '耿禹', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-03 17:51:29');
INSERT INTO `dt_manager` VALUES ('16', '1', '15', '3', '吴畏', '76C287B96982D1BB', '04V2XL', null, '吴畏', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-07 10:21:20');
INSERT INTO `dt_manager` VALUES ('17', '1', '15', '3', '郑曼', '0DD54D3209146F3B', 'Z2HJJP', null, '郑曼', '', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-04-07 10:23:32');
INSERT INTO `dt_manager` VALUES ('18', '1', '15', '3', '张秀娇', '32A9A07F0AB1705F528911C7E30D6938', '0XX4T6', null, '张秀娇', '13057672737', '157479551@qq.com', '0', '0', null, null, '1', '女', '', null, '99', '2020-04-15 19:01:26');
INSERT INTO `dt_manager` VALUES ('19', '1', '15', '3', '宁南鑫', 'AEF8871FD2D51A8EF25545CB865DD9D1', 'V2VFVR', null, '宁南鑫', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-20 09:54:22');
INSERT INTO `dt_manager` VALUES ('20', '1', '15', '3', '戚国华', 'EA2D7F2DDB07E1BA60E3EF29311A1B53', 'BZL446', null, '戚国华', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-22 13:57:02');
INSERT INTO `dt_manager` VALUES ('21', '1', '15', '3', '解顶林', 'C509F6195868C0A04C834F19FB1562FA', 'N0F06F', null, '解顶林', '', '', '0', '0', null, null, '1', '男', '方案总监', null, '99', '2020-04-22 14:01:07');
INSERT INTO `dt_manager` VALUES ('22', '1', '15', '3', '林书宇', 'D33D29D4A981C2186A10AF204B47C91A', 'LR2020', null, '林书宇', '13050181997', '2287989546@qq.com', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-29 11:31:34');
INSERT INTO `dt_manager` VALUES ('23', '1', '15', '3', '伍军豪', 'A688FF0EE093B7DC', '0XVP0X', null, '伍军豪', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-04-29 11:32:56');
INSERT INTO `dt_manager` VALUES ('24', '姚阳', '15', '3', '姚阳', '4EF10B58D0361F3243F8BE29DDBBC3C0', 'P4064X', null, '姚阳', '15380421879', '1658308385@qq.com', '0', '0', null, null, '1', '男', '', null, '99', '2020-06-01 18:11:18');
INSERT INTO `dt_manager` VALUES ('25', '1', '15', '3', '陆海芳', 'C64D81738D3193EB', '04ZFN2', null, '陆海芳', '', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-06-24 09:51:24');
INSERT INTO `dt_manager` VALUES ('26', '1', '15', '3', '王禧媛', '8618BB56E1E1FFC7', 'DRJB42', null, '王禧媛', '', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-06-24 09:52:38');
INSERT INTO `dt_manager` VALUES ('27', '1', '15', '3', '吴洋', '7FC9EA5FF79FCB44', 'RDZ8VL', null, '吴洋', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-06-28 10:33:12');
INSERT INTO `dt_manager` VALUES ('28', '1', '15', '3', '綦晓杰', 'AAC7F70D048E57D0B1884090B4860145', '0X2FP8', null, '綦晓杰', '15162183839', '762308407@qq.com', '0', '0', null, null, '1', '男', '', null, '99', '2020-07-02 11:05:56');
INSERT INTO `dt_manager` VALUES ('29', '1', '15', '3', '何婷', 'B964A1A05975DC33E9FBCA83D376B7A0', '26NT40', null, '何婷', '13110033717', '2279908604@qq.com', '0', '0', null, null, '1', '女', '', null, '99', '2020-07-13 09:35:25');
INSERT INTO `dt_manager` VALUES ('30', '1', '15', '3', '龙冰心', '08F40FCCDCC4583E', 'X48FD8', null, '龙冰心', '', '', '0', '0', null, null, '1', '女', '', null, '99', '2020-07-13 09:36:01');
INSERT INTO `dt_manager` VALUES ('31', '1', '15', '3', '夏伟', '2517552DC6772993', '4L04T6', null, '夏伟', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-07-15 09:00:31');
INSERT INTO `dt_manager` VALUES ('32', '1', '15', '3', '于福忠', '71B26123DF43DDAE', 'J88488', null, '于福忠', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-07-27 11:23:00');
INSERT INTO `dt_manager` VALUES ('33', '1', '15', '3', '苗国庆', 'AB1BD679289EB4F5', '0X868H', null, '苗国庆', '', '', '0', '0', null, null, '1', '男', '', null, '99', '2020-07-27 11:23:30');

-- ----------------------------
-- Table structure for dt_manager_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_log`;
CREATE TABLE `dt_manager_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `action_type` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_ip` varchar(30) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `dt_manager_log_manager` FOREIGN KEY (`user_id`) REFERENCES `dt_manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_manager_log
-- ----------------------------
INSERT INTO `dt_manager_log` VALUES ('1', '1', 'admin', 'Login', '用户登录', '180.111.144.93', '99', '2020-04-02 18:04:34');
INSERT INTO `dt_manager_log` VALUES ('2', '1', 'admin', 'Login', '用户登录', '180.111.144.93', '99', '2020-04-02 18:05:17');
INSERT INTO `dt_manager_log` VALUES ('3', '1', 'admin', 'Login', '用户登录', '192.168.6.48', '99', '2020-04-03 14:54:26');
INSERT INTO `dt_manager_log` VALUES ('4', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 16:04:15');
INSERT INTO `dt_manager_log` VALUES ('5', '1', 'admin', 'Add', '添加管理员:白慧鹏', '192.168.6.236', '99', '2020-04-03 16:11:32');
INSERT INTO `dt_manager_log` VALUES ('6', '1', 'admin', 'Add', '添加管理员:温四林', '192.168.6.236', '99', '2020-04-03 16:12:35');
INSERT INTO `dt_manager_log` VALUES ('7', '1', 'admin', 'Edit', '修改管理员:白慧鹏', '192.168.6.236', '99', '2020-04-03 16:12:58');
INSERT INTO `dt_manager_log` VALUES ('8', '1', 'admin', 'Add', '添加管理员:何海', '192.168.6.236', '99', '2020-04-03 16:14:14');
INSERT INTO `dt_manager_log` VALUES ('9', '1', 'admin', 'Add', '添加管理员:姚威', '192.168.6.236', '99', '2020-04-03 16:15:15');
INSERT INTO `dt_manager_log` VALUES ('10', '1', 'admin', 'Add', '添加管理员:周艳', '192.168.6.236', '99', '2020-04-03 16:16:45');
INSERT INTO `dt_manager_log` VALUES ('11', '1', 'admin', 'Add', '添加管理员:陈淑琳', '192.168.6.236', '99', '2020-04-03 16:17:44');
INSERT INTO `dt_manager_log` VALUES ('12', '1', 'admin', 'Add', '添加管理员:孙茂荣', '192.168.6.236', '99', '2020-04-03 16:18:53');
INSERT INTO `dt_manager_log` VALUES ('13', '1', 'admin', 'Add', '添加管理员:万子禹', '192.168.6.236', '99', '2020-04-03 16:21:38');
INSERT INTO `dt_manager_log` VALUES ('14', '1', 'admin', 'Add', '添加管理员:刘锦武', '192.168.6.236', '99', '2020-04-03 16:23:06');
INSERT INTO `dt_manager_log` VALUES ('15', '1', 'admin', 'Add', '添加管理员:高恒娟', '192.168.6.236', '99', '2020-04-03 16:25:03');
INSERT INTO `dt_manager_log` VALUES ('16', '1', 'admin', 'Edit', '修改管理员:周艳', '192.168.6.236', '99', '2020-04-03 16:25:15');
INSERT INTO `dt_manager_log` VALUES ('17', '1', 'admin', 'Add', '添加管理员:钱志奇', '192.168.6.236', '99', '2020-04-03 16:28:29');
INSERT INTO `dt_manager_log` VALUES ('18', '1', 'admin', 'Add', '添加管理员:吴雷华', '192.168.6.236', '99', '2020-04-03 17:48:27');
INSERT INTO `dt_manager_log` VALUES ('19', '1', 'admin', 'Add', '添加管理员:耿禹', '192.168.6.236', '99', '2020-04-03 17:51:29');
INSERT INTO `dt_manager_log` VALUES ('20', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 17:51:59');
INSERT INTO `dt_manager_log` VALUES ('21', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 17:53:50');
INSERT INTO `dt_manager_log` VALUES ('22', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 17:54:50');
INSERT INTO `dt_manager_log` VALUES ('23', '1', 'admin', 'Add', '添加项目内容:1', '192.168.6.236', '99', '2020-04-03 17:56:48');
INSERT INTO `dt_manager_log` VALUES ('24', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 17:57:16');
INSERT INTO `dt_manager_log` VALUES ('25', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:04:15');
INSERT INTO `dt_manager_log` VALUES ('26', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:05:10');
INSERT INTO `dt_manager_log` VALUES ('27', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:05:14');
INSERT INTO `dt_manager_log` VALUES ('28', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:06:17');
INSERT INTO `dt_manager_log` VALUES ('29', '1', 'admin', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:07:06');
INSERT INTO `dt_manager_log` VALUES ('30', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:09:10');
INSERT INTO `dt_manager_log` VALUES ('31', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:09:43');
INSERT INTO `dt_manager_log` VALUES ('32', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:11:34');
INSERT INTO `dt_manager_log` VALUES ('33', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:28:49');
INSERT INTO `dt_manager_log` VALUES ('34', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:30:15');
INSERT INTO `dt_manager_log` VALUES ('35', '1', 'admin', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:42:40');
INSERT INTO `dt_manager_log` VALUES ('36', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:45:45');
INSERT INTO `dt_manager_log` VALUES ('37', '1', 'admin', 'Add', '添加管理角色:普通用户', '192.168.6.236', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_log` VALUES ('38', '1', 'admin', 'Edit', '修改管理角色:项目经理', '192.168.6.236', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_log` VALUES ('39', '1', 'admin', 'Edit', '修改管理员:白慧鹏', '192.168.6.236', '99', '2020-04-03 18:51:31');
INSERT INTO `dt_manager_log` VALUES ('40', '1', 'admin', 'Edit', '修改管理员:温四林', '192.168.6.236', '99', '2020-04-03 18:51:39');
INSERT INTO `dt_manager_log` VALUES ('41', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-03 18:52:02');
INSERT INTO `dt_manager_log` VALUES ('42', '1', 'admin', 'Edit', '修改管理员:何海', '192.168.6.236', '99', '2020-04-03 18:52:23');
INSERT INTO `dt_manager_log` VALUES ('43', '1', 'admin', 'Edit', '修改管理员:何海', '192.168.6.236', '99', '2020-04-03 18:52:37');
INSERT INTO `dt_manager_log` VALUES ('44', '1', 'admin', 'Edit', '修改管理员:姚威', '192.168.6.236', '99', '2020-04-03 18:52:52');
INSERT INTO `dt_manager_log` VALUES ('45', '1', 'admin', 'Edit', '修改管理员:周艳', '192.168.6.236', '99', '2020-04-03 18:53:03');
INSERT INTO `dt_manager_log` VALUES ('46', '1', 'admin', 'Edit', '修改管理员:陈淑琳', '192.168.6.236', '99', '2020-04-03 18:53:12');
INSERT INTO `dt_manager_log` VALUES ('47', '1', 'admin', 'Edit', '修改管理员:孙茂荣', '192.168.6.236', '99', '2020-04-03 18:53:22');
INSERT INTO `dt_manager_log` VALUES ('48', '1', 'admin', 'Edit', '修改管理员:万子禹', '192.168.6.236', '99', '2020-04-03 18:53:31');
INSERT INTO `dt_manager_log` VALUES ('49', '1', 'admin', 'Edit', '修改管理员:高恒娟', '192.168.6.236', '99', '2020-04-03 18:53:41');
INSERT INTO `dt_manager_log` VALUES ('50', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:54:10');
INSERT INTO `dt_manager_log` VALUES ('51', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 18:55:40');
INSERT INTO `dt_manager_log` VALUES ('52', '1', 'admin', 'Edit', '修改组织架构内容:未来网络事业部', '192.168.6.236', '99', '2020-04-03 18:59:31');
INSERT INTO `dt_manager_log` VALUES ('53', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-03 19:16:47');
INSERT INTO `dt_manager_log` VALUES ('55', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 08:57:03');
INSERT INTO `dt_manager_log` VALUES ('56', '1', 'admin', 'Edit', '修改项目内容:1', '192.168.6.236', '99', '2020-04-07 09:00:46');
INSERT INTO `dt_manager_log` VALUES ('57', '1', 'admin', 'Add', '添加项目内容:2', '192.168.6.236', '99', '2020-04-07 09:02:42');
INSERT INTO `dt_manager_log` VALUES ('58', '5', '何海', 'Login', '用户登录', '192.168.6.151', '99', '2020-04-07 09:07:04');
INSERT INTO `dt_manager_log` VALUES ('59', '1', 'admin', 'Add', '添加项目内容:3', '192.168.6.236', '99', '2020-04-07 09:08:28');
INSERT INTO `dt_manager_log` VALUES ('60', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:09:19');
INSERT INTO `dt_manager_log` VALUES ('61', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:11:26');
INSERT INTO `dt_manager_log` VALUES ('62', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:12:26');
INSERT INTO `dt_manager_log` VALUES ('63', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:16:55');
INSERT INTO `dt_manager_log` VALUES ('64', '1', 'admin', 'Add', '添加项目内容:4', '192.168.6.236', '99', '2020-04-07 09:18:31');
INSERT INTO `dt_manager_log` VALUES ('65', '1', 'admin', 'Add', '添加项目内容:5', '192.168.6.236', '99', '2020-04-07 09:22:57');
INSERT INTO `dt_manager_log` VALUES ('66', '1', 'admin', 'Edit', '修改项目内容:5', '192.168.6.236', '99', '2020-04-07 09:28:37');
INSERT INTO `dt_manager_log` VALUES ('67', '1', 'admin', 'Edit', '修改项目内容:4', '192.168.6.236', '99', '2020-04-07 09:29:55');
INSERT INTO `dt_manager_log` VALUES ('68', '1', 'admin', 'Edit', '修改项目内容:3', '192.168.6.236', '99', '2020-04-07 09:32:28');
INSERT INTO `dt_manager_log` VALUES ('69', '1', 'admin', 'Edit', '修改项目内容:2', '192.168.6.236', '99', '2020-04-07 09:33:01');
INSERT INTO `dt_manager_log` VALUES ('70', '1', 'admin', 'Edit', '修改项目内容:1', '192.168.6.236', '99', '2020-04-07 09:34:11');
INSERT INTO `dt_manager_log` VALUES ('71', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-07 09:35:34');
INSERT INTO `dt_manager_log` VALUES ('72', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:35:49');
INSERT INTO `dt_manager_log` VALUES ('73', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 09:42:56');
INSERT INTO `dt_manager_log` VALUES ('74', '4', '温四林', 'Add', '添加项目内容:1', '192.168.6.174', '99', '2020-04-07 09:44:30');
INSERT INTO `dt_manager_log` VALUES ('75', '4', '温四林', 'Edit', '修改项目内容:1', '192.168.6.174', '99', '2020-04-07 09:44:46');
INSERT INTO `dt_manager_log` VALUES ('76', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-07 10:07:18');
INSERT INTO `dt_manager_log` VALUES ('77', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:07:36');
INSERT INTO `dt_manager_log` VALUES ('78', '1', 'admin', 'Delete', '删除标签成功1条，失败0条', '192.168.6.236', '99', '2020-04-07 10:13:17');
INSERT INTO `dt_manager_log` VALUES ('79', '1', 'admin', 'Delete', '删除标签成功1条，失败0条', '192.168.6.236', '99', '2020-04-07 10:13:19');
INSERT INTO `dt_manager_log` VALUES ('80', '1', 'admin', 'Delete', '删除标签成功1条，失败0条', '192.168.6.236', '99', '2020-04-07 10:13:21');
INSERT INTO `dt_manager_log` VALUES ('81', '1', 'admin', 'Delete', '删除标签成功1条，失败0条', '192.168.6.236', '99', '2020-04-07 10:13:24');
INSERT INTO `dt_manager_log` VALUES ('82', '1', 'admin', 'Add', '添加组织架构:未来网络事业部', '192.168.6.236', '99', '2020-04-07 10:15:41');
INSERT INTO `dt_manager_log` VALUES ('83', '1', 'admin', 'Edit', '修改组织架构内容:速度软件', '192.168.6.236', '99', '2020-04-07 10:16:19');
INSERT INTO `dt_manager_log` VALUES ('84', '1', 'admin', 'Edit', '修改管理员:耿禹', '192.168.6.236', '99', '2020-04-07 10:16:38');
INSERT INTO `dt_manager_log` VALUES ('85', '1', 'admin', 'Edit', '修改管理员:吴雷华', '192.168.6.236', '99', '2020-04-07 10:16:47');
INSERT INTO `dt_manager_log` VALUES ('86', '1', 'admin', 'Edit', '修改管理员:钱志奇', '192.168.6.236', '99', '2020-04-07 10:16:55');
INSERT INTO `dt_manager_log` VALUES ('87', '1', 'admin', 'Edit', '修改管理员:高恒娟', '192.168.6.236', '99', '2020-04-07 10:17:03');
INSERT INTO `dt_manager_log` VALUES ('88', '1', 'admin', 'Edit', '修改管理员:刘锦武', '192.168.6.236', '99', '2020-04-07 10:17:11');
INSERT INTO `dt_manager_log` VALUES ('89', '1', 'admin', 'Edit', '修改管理员:万子禹', '192.168.6.236', '99', '2020-04-07 10:17:23');
INSERT INTO `dt_manager_log` VALUES ('90', '1', 'admin', 'Edit', '修改管理员:孙茂荣', '192.168.6.236', '99', '2020-04-07 10:17:32');
INSERT INTO `dt_manager_log` VALUES ('91', '1', 'admin', 'Edit', '修改管理员:周艳', '192.168.6.236', '99', '2020-04-07 10:17:44');
INSERT INTO `dt_manager_log` VALUES ('92', '1', 'admin', 'Edit', '修改管理员:陈淑琳', '192.168.6.236', '99', '2020-04-07 10:18:01');
INSERT INTO `dt_manager_log` VALUES ('93', '1', 'admin', 'Edit', '修改管理员:姚威', '192.168.6.236', '99', '2020-04-07 10:18:10');
INSERT INTO `dt_manager_log` VALUES ('94', '1', 'admin', 'Edit', '修改管理员:何海', '192.168.6.236', '99', '2020-04-07 10:18:22');
INSERT INTO `dt_manager_log` VALUES ('95', '1', 'admin', 'Edit', '修改管理员:温四林', '192.168.6.236', '99', '2020-04-07 10:18:39');
INSERT INTO `dt_manager_log` VALUES ('96', '1', 'admin', 'Edit', '修改管理员:白慧鹏', '192.168.6.236', '99', '2020-04-07 10:18:52');
INSERT INTO `dt_manager_log` VALUES ('97', '1', 'admin', 'Add', '添加管理员:吴畏', '192.168.6.236', '99', '2020-04-07 10:21:20');
INSERT INTO `dt_manager_log` VALUES ('98', '1', 'admin', 'Add', '添加管理员:郑曼', '192.168.6.236', '99', '2020-04-07 10:23:33');
INSERT INTO `dt_manager_log` VALUES ('99', '1', 'admin', 'Edit', '修改管理员:吴畏', '192.168.6.236', '99', '2020-04-07 10:23:44');
INSERT INTO `dt_manager_log` VALUES ('100', '1', 'admin', 'Edit', '修改项目内容:1', '192.168.6.236', '99', '2020-04-07 10:25:54');
INSERT INTO `dt_manager_log` VALUES ('101', '1', 'admin', 'Add', '添加项目内容:6', '192.168.6.236', '99', '2020-04-07 10:27:48');
INSERT INTO `dt_manager_log` VALUES ('102', '1', 'admin', 'Add', '添加项目内容:7', '192.168.6.236', '99', '2020-04-07 10:31:37');
INSERT INTO `dt_manager_log` VALUES ('103', '1', 'admin', 'Edit', '修改项目内容:7', '192.168.6.236', '99', '2020-04-07 10:33:58');
INSERT INTO `dt_manager_log` VALUES ('104', '1', 'admin', 'Add', '添加项目内容:8', '192.168.6.236', '99', '2020-04-07 10:36:48');
INSERT INTO `dt_manager_log` VALUES ('105', '1', 'admin', 'Add', '添加项目内容:9', '192.168.6.236', '99', '2020-04-07 10:38:01');
INSERT INTO `dt_manager_log` VALUES ('106', '1', 'admin', 'Add', '添加项目内容:10', '192.168.6.236', '99', '2020-04-07 10:39:22');
INSERT INTO `dt_manager_log` VALUES ('107', '1', 'admin', 'Add', '添加项目内容:11', '192.168.6.236', '99', '2020-04-07 10:41:08');
INSERT INTO `dt_manager_log` VALUES ('108', '1', 'admin', 'Add', '添加项目内容:12', '192.168.6.236', '99', '2020-04-07 10:42:30');
INSERT INTO `dt_manager_log` VALUES ('109', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:46:10');
INSERT INTO `dt_manager_log` VALUES ('110', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:48:03');
INSERT INTO `dt_manager_log` VALUES ('111', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-07 10:49:11');
INSERT INTO `dt_manager_log` VALUES ('112', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-07 10:49:46');
INSERT INTO `dt_manager_log` VALUES ('113', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:53:04');
INSERT INTO `dt_manager_log` VALUES ('114', '1', 'admin', 'Edit', '修改管理员:陈淑琳', '192.168.6.236', '99', '2020-04-07 10:53:30');
INSERT INTO `dt_manager_log` VALUES ('115', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:53:52');
INSERT INTO `dt_manager_log` VALUES ('116', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:55:16');
INSERT INTO `dt_manager_log` VALUES ('117', '1', 'admin', 'Edit', '修改项目内容:6', '192.168.6.236', '99', '2020-04-07 10:56:53');
INSERT INTO `dt_manager_log` VALUES ('118', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 10:57:46');
INSERT INTO `dt_manager_log` VALUES ('119', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:13:38');
INSERT INTO `dt_manager_log` VALUES ('120', '4', '温四林', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:22:46');
INSERT INTO `dt_manager_log` VALUES ('121', '4', '温四林', 'Edit', '修改项目内容:1', '192.168.6.236', '99', '2020-04-07 11:24:33');
INSERT INTO `dt_manager_log` VALUES ('122', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:34:40');
INSERT INTO `dt_manager_log` VALUES ('123', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:39:09');
INSERT INTO `dt_manager_log` VALUES ('124', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:45:17');
INSERT INTO `dt_manager_log` VALUES ('125', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:46:36');
INSERT INTO `dt_manager_log` VALUES ('126', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 11:49:49');
INSERT INTO `dt_manager_log` VALUES ('127', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 12:32:05');
INSERT INTO `dt_manager_log` VALUES ('128', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 12:32:30');
INSERT INTO `dt_manager_log` VALUES ('129', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 14:11:03');
INSERT INTO `dt_manager_log` VALUES ('130', '13', '钱志奇', 'Edit', '修改项目内容:10', '192.168.6.236', '99', '2020-04-07 14:17:05');
INSERT INTO `dt_manager_log` VALUES ('131', '13', '钱志奇', 'Edit', '修改项目内容:7', '192.168.6.236', '99', '2020-04-07 14:17:19');
INSERT INTO `dt_manager_log` VALUES ('132', '13', '钱志奇', 'Edit', '修改项目内容:6', '192.168.6.236', '99', '2020-04-07 14:17:34');
INSERT INTO `dt_manager_log` VALUES ('133', '13', '钱志奇', 'Edit', '修改项目内容:1', '192.168.6.236', '99', '2020-04-07 14:17:45');
INSERT INTO `dt_manager_log` VALUES ('134', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-07 14:19:49');
INSERT INTO `dt_manager_log` VALUES ('135', '1', 'admin自动操作', 'Build', '公摊数据自动更新完成！开始时间：2020-04-08 00:00:01 494 结束时间：2020-04-08 00:00:01 545', 'localhost', '99', '2020-04-08 00:00:02');
INSERT INTO `dt_manager_log` VALUES ('136', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-08 09:02:13');
INSERT INTO `dt_manager_log` VALUES ('137', '4', '温四林', 'Add', '添加项目内容:2', '192.168.6.174', '99', '2020-04-08 09:03:15');
INSERT INTO `dt_manager_log` VALUES ('138', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-08 11:36:15');
INSERT INTO `dt_manager_log` VALUES ('139', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-08 14:04:25');
INSERT INTO `dt_manager_log` VALUES ('140', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-08 15:05:51');
INSERT INTO `dt_manager_log` VALUES ('141', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-10 08:34:17');
INSERT INTO `dt_manager_log` VALUES ('142', '10', '万子禹', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-10 08:35:53');
INSERT INTO `dt_manager_log` VALUES ('143', '5', '何海', 'Login', '用户登录', '192.168.6.151', '99', '2020-04-10 11:08:33');
INSERT INTO `dt_manager_log` VALUES ('144', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-10 11:13:41');
INSERT INTO `dt_manager_log` VALUES ('145', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-10 11:14:25');
INSERT INTO `dt_manager_log` VALUES ('146', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-10 11:26:26');
INSERT INTO `dt_manager_log` VALUES ('147', '7', '周艳', 'Login', '用户登录', '192.168.6.152', '99', '2020-04-10 11:31:53');
INSERT INTO `dt_manager_log` VALUES ('148', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-10 11:32:19');
INSERT INTO `dt_manager_log` VALUES ('149', '7', '周艳', 'Login', '用户登录', '192.168.6.152', '99', '2020-04-10 11:32:33');
INSERT INTO `dt_manager_log` VALUES ('150', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-10 11:34:23');
INSERT INTO `dt_manager_log` VALUES ('151', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-10 13:28:18');
INSERT INTO `dt_manager_log` VALUES ('152', '10', '万子禹', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-10 14:11:47');
INSERT INTO `dt_manager_log` VALUES ('154', '4', '温四林', 'Login', '用户登录', '192.168.6.174', '99', '2020-04-10 17:40:04');
INSERT INTO `dt_manager_log` VALUES ('155', '5', '何海', 'Login', '用户登录', '192.168.6.151', '99', '2020-04-10 17:54:10');
INSERT INTO `dt_manager_log` VALUES ('156', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-10 17:54:53');
INSERT INTO `dt_manager_log` VALUES ('157', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-15 18:54:22');
INSERT INTO `dt_manager_log` VALUES ('158', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-15 18:55:22');
INSERT INTO `dt_manager_log` VALUES ('159', '1', 'admin', 'Edit', '修改项目内容:11', '192.168.6.236', '99', '2020-04-15 18:56:03');
INSERT INTO `dt_manager_log` VALUES ('160', '1', 'admin', 'Edit', '修改项目内容:9', '192.168.6.236', '99', '2020-04-15 18:56:24');
INSERT INTO `dt_manager_log` VALUES ('161', '1', 'admin', 'Edit', '修改项目内容:8', '192.168.6.236', '99', '2020-04-15 18:56:39');
INSERT INTO `dt_manager_log` VALUES ('162', '1', 'admin', 'Add', '添加项目内容:13', '192.168.6.236', '99', '2020-04-15 18:59:42');
INSERT INTO `dt_manager_log` VALUES ('163', '1', 'admin', 'Add', '添加管理员:张秀娇', '192.168.6.236', '99', '2020-04-15 19:01:26');
INSERT INTO `dt_manager_log` VALUES ('164', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-16 08:53:01');
INSERT INTO `dt_manager_log` VALUES ('165', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-16 09:03:10');
INSERT INTO `dt_manager_log` VALUES ('166', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-16 09:03:59');
INSERT INTO `dt_manager_log` VALUES ('167', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-16 09:04:55');
INSERT INTO `dt_manager_log` VALUES ('168', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-16 09:05:34');
INSERT INTO `dt_manager_log` VALUES ('169', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-16 10:09:29');
INSERT INTO `dt_manager_log` VALUES ('170', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-16 10:14:42');
INSERT INTO `dt_manager_log` VALUES ('171', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-16 16:59:03');
INSERT INTO `dt_manager_log` VALUES ('172', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-04-16 18:11:53');
INSERT INTO `dt_manager_log` VALUES ('173', '7', '周艳', 'Login', '用户登录', '192.168.6.179', '99', '2020-04-17 16:15:19');
INSERT INTO `dt_manager_log` VALUES ('174', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-17 17:27:53');
INSERT INTO `dt_manager_log` VALUES ('175', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-20 09:52:55');
INSERT INTO `dt_manager_log` VALUES ('176', '1', 'admin', 'Add', '添加管理员:宁南鑫', '192.168.6.236', '99', '2020-04-20 09:54:22');
INSERT INTO `dt_manager_log` VALUES ('177', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-20 09:56:26');
INSERT INTO `dt_manager_log` VALUES ('178', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-20 09:58:25');
INSERT INTO `dt_manager_log` VALUES ('179', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-20 10:00:31');
INSERT INTO `dt_manager_log` VALUES ('180', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-04-21 13:39:11');
INSERT INTO `dt_manager_log` VALUES ('181', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-21 13:39:27');
INSERT INTO `dt_manager_log` VALUES ('182', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-21 13:40:02');
INSERT INTO `dt_manager_log` VALUES ('183', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-21 13:41:44');
INSERT INTO `dt_manager_log` VALUES ('184', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-21 15:01:49');
INSERT INTO `dt_manager_log` VALUES ('185', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-21 15:15:32');
INSERT INTO `dt_manager_log` VALUES ('186', '1', 'admin', 'Edit', '修改管理员:陈淑琳', '192.168.6.236', '99', '2020-04-21 15:15:58');
INSERT INTO `dt_manager_log` VALUES ('187', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-21 15:17:58');
INSERT INTO `dt_manager_log` VALUES ('188', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-21 15:18:55');
INSERT INTO `dt_manager_log` VALUES ('189', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-21 16:42:42');
INSERT INTO `dt_manager_log` VALUES ('190', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-21 18:15:36');
INSERT INTO `dt_manager_log` VALUES ('191', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-22 09:05:31');
INSERT INTO `dt_manager_log` VALUES ('192', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-22 13:44:37');
INSERT INTO `dt_manager_log` VALUES ('193', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-22 13:55:57');
INSERT INTO `dt_manager_log` VALUES ('194', '1', 'admin', 'Add', '添加管理员:戚国华', '192.168.6.236', '99', '2020-04-22 13:57:02');
INSERT INTO `dt_manager_log` VALUES ('195', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-22 14:00:06');
INSERT INTO `dt_manager_log` VALUES ('196', '1', 'admin', 'Add', '添加管理员:解顶林', '192.168.6.223', '99', '2020-04-22 14:01:07');
INSERT INTO `dt_manager_log` VALUES ('197', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-23 09:08:25');
INSERT INTO `dt_manager_log` VALUES ('198', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-23 09:41:46');
INSERT INTO `dt_manager_log` VALUES ('199', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-23 10:16:49');
INSERT INTO `dt_manager_log` VALUES ('200', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-23 11:08:44');
INSERT INTO `dt_manager_log` VALUES ('201', '20', '戚国华', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-23 11:17:53');
INSERT INTO `dt_manager_log` VALUES ('202', '20', '戚国华', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-23 11:18:57');
INSERT INTO `dt_manager_log` VALUES ('203', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-23 13:35:28');
INSERT INTO `dt_manager_log` VALUES ('204', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-24 11:08:18');
INSERT INTO `dt_manager_log` VALUES ('205', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-24 15:01:23');
INSERT INTO `dt_manager_log` VALUES ('206', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-24 15:28:17');
INSERT INTO `dt_manager_log` VALUES ('207', '10', '万子禹', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-24 15:43:01');
INSERT INTO `dt_manager_log` VALUES ('208', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-24 16:54:13');
INSERT INTO `dt_manager_log` VALUES ('209', '1', 'admin', 'Edit', '修改管理员:陈淑琳', '192.168.6.223', '99', '2020-04-24 16:58:09');
INSERT INTO `dt_manager_log` VALUES ('210', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-24 16:58:22');
INSERT INTO `dt_manager_log` VALUES ('211', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-26 09:51:24');
INSERT INTO `dt_manager_log` VALUES ('212', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-04-26 10:04:47');
INSERT INTO `dt_manager_log` VALUES ('213', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-26 10:54:01');
INSERT INTO `dt_manager_log` VALUES ('214', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-26 11:17:14');
INSERT INTO `dt_manager_log` VALUES ('215', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-26 13:39:00');
INSERT INTO `dt_manager_log` VALUES ('216', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-26 14:35:59');
INSERT INTO `dt_manager_log` VALUES ('217', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-26 16:06:48');
INSERT INTO `dt_manager_log` VALUES ('218', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-27 08:53:28');
INSERT INTO `dt_manager_log` VALUES ('219', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-27 09:02:51');
INSERT INTO `dt_manager_log` VALUES ('220', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-27 10:37:43');
INSERT INTO `dt_manager_log` VALUES ('221', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-27 16:05:19');
INSERT INTO `dt_manager_log` VALUES ('222', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-28 09:38:48');
INSERT INTO `dt_manager_log` VALUES ('223', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-04-28 10:32:44');
INSERT INTO `dt_manager_log` VALUES ('224', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-04-28 14:02:04');
INSERT INTO `dt_manager_log` VALUES ('225', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-29 09:22:00');
INSERT INTO `dt_manager_log` VALUES ('226', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-29 09:22:09');
INSERT INTO `dt_manager_log` VALUES ('227', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-29 10:30:10');
INSERT INTO `dt_manager_log` VALUES ('228', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-04-29 10:33:48');
INSERT INTO `dt_manager_log` VALUES ('229', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-04-29 10:35:31');
INSERT INTO `dt_manager_log` VALUES ('230', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-29 11:29:43');
INSERT INTO `dt_manager_log` VALUES ('231', '1', 'admin', 'Add', '添加管理员:林书宇', '192.168.6.236', '99', '2020-04-29 11:31:34');
INSERT INTO `dt_manager_log` VALUES ('232', '1', 'admin', 'Add', '添加管理员:伍军豪', '192.168.6.236', '99', '2020-04-29 11:32:56');
INSERT INTO `dt_manager_log` VALUES ('233', '22', '林书宇', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-29 11:33:47');
INSERT INTO `dt_manager_log` VALUES ('234', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-29 14:56:10');
INSERT INTO `dt_manager_log` VALUES ('235', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-29 15:58:10');
INSERT INTO `dt_manager_log` VALUES ('236', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-04-29 16:34:01');
INSERT INTO `dt_manager_log` VALUES ('237', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-04-29 16:35:05');
INSERT INTO `dt_manager_log` VALUES ('238', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-29 16:57:27');
INSERT INTO `dt_manager_log` VALUES ('239', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-29 17:00:51');
INSERT INTO `dt_manager_log` VALUES ('240', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-04-29 17:30:58');
INSERT INTO `dt_manager_log` VALUES ('241', '23', '伍军豪', 'Login', '用户登录', '192.168.6.117', '99', '2020-04-29 18:22:51');
INSERT INTO `dt_manager_log` VALUES ('244', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-30 09:34:12');
INSERT INTO `dt_manager_log` VALUES ('245', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-30 10:40:58');
INSERT INTO `dt_manager_log` VALUES ('246', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-04-30 11:17:53');
INSERT INTO `dt_manager_log` VALUES ('247', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-04-30 11:37:38');
INSERT INTO `dt_manager_log` VALUES ('248', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-04-30 12:00:00');
INSERT INTO `dt_manager_log` VALUES ('250', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-30 13:54:55');
INSERT INTO `dt_manager_log` VALUES ('251', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-04-30 14:14:21');
INSERT INTO `dt_manager_log` VALUES ('252', '21', '解顶林', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:22:05');
INSERT INTO `dt_manager_log` VALUES ('253', '21', '解顶林', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:22:48');
INSERT INTO `dt_manager_log` VALUES ('254', '21', '解顶林', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:27:04');
INSERT INTO `dt_manager_log` VALUES ('255', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:31:50');
INSERT INTO `dt_manager_log` VALUES ('256', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:32:30');
INSERT INTO `dt_manager_log` VALUES ('257', '12', '高恒娟', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-30 15:33:06');
INSERT INTO `dt_manager_log` VALUES ('258', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:33:33');
INSERT INTO `dt_manager_log` VALUES ('259', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:34:18');
INSERT INTO `dt_manager_log` VALUES ('260', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:35:15');
INSERT INTO `dt_manager_log` VALUES ('261', '11', '刘锦武', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-30 15:36:55');
INSERT INTO `dt_manager_log` VALUES ('262', '11', '刘锦武', 'Login', '用户登录', '192.168.6.223', '99', '2020-04-30 15:37:59');
INSERT INTO `dt_manager_log` VALUES ('263', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 15:38:32');
INSERT INTO `dt_manager_log` VALUES ('264', '11', '刘锦武', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 15:39:19');
INSERT INTO `dt_manager_log` VALUES ('265', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 15:39:50');
INSERT INTO `dt_manager_log` VALUES ('266', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:40:09');
INSERT INTO `dt_manager_log` VALUES ('267', '1', 'admin', 'Edit', '修改管理员:刘锦武', '192.168.6.236', '99', '2020-04-30 15:40:15');
INSERT INTO `dt_manager_log` VALUES ('268', '11', '刘锦武', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 15:40:58');
INSERT INTO `dt_manager_log` VALUES ('269', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 15:41:51');
INSERT INTO `dt_manager_log` VALUES ('270', '22', '林书宇', 'Login', '用户登录', '192.168.6.48', '99', '2020-04-30 15:43:33');
INSERT INTO `dt_manager_log` VALUES ('271', '7', '周艳', 'Login', '用户登录', '192.168.6.179', '99', '2020-04-30 15:57:36');
INSERT INTO `dt_manager_log` VALUES ('272', '10', '万子禹', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-30 16:06:01');
INSERT INTO `dt_manager_log` VALUES ('273', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 16:10:22');
INSERT INTO `dt_manager_log` VALUES ('274', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-04-30 16:11:34');
INSERT INTO `dt_manager_log` VALUES ('275', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 16:16:44');
INSERT INTO `dt_manager_log` VALUES ('276', '10', '万子禹', 'Login', '用户登录', '192.168.6.33', '99', '2020-04-30 16:16:44');
INSERT INTO `dt_manager_log` VALUES ('277', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-04-30 16:17:50');
INSERT INTO `dt_manager_log` VALUES ('278', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 16:21:38');
INSERT INTO `dt_manager_log` VALUES ('279', '21', '解顶林', 'Login', '用户登录', '192.168.6.181', '99', '2020-04-30 16:28:57');
INSERT INTO `dt_manager_log` VALUES ('280', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 16:37:53');
INSERT INTO `dt_manager_log` VALUES ('282', '22', '林书宇', 'Login', '用户登录', '192.168.6.48', '99', '2020-04-30 16:55:22');
INSERT INTO `dt_manager_log` VALUES ('283', '22', '林书宇', 'Login', '用户登录', '192.168.6.48', '99', '2020-04-30 16:56:39');
INSERT INTO `dt_manager_log` VALUES ('284', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 17:56:36');
INSERT INTO `dt_manager_log` VALUES ('285', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-04-30 18:11:14');
INSERT INTO `dt_manager_log` VALUES ('286', '1', 'admin', 'Edit', '修改管理员:伍军豪', '192.168.6.236', '99', '2020-04-30 18:11:34');
INSERT INTO `dt_manager_log` VALUES ('287', '23', '伍军豪', 'Login', '用户登录', '192.168.6.117', '99', '2020-04-30 18:12:30');
INSERT INTO `dt_manager_log` VALUES ('288', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-04-30 18:15:55');
INSERT INTO `dt_manager_log` VALUES ('289', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-05-06 09:46:51');
INSERT INTO `dt_manager_log` VALUES ('290', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-06 11:00:14');
INSERT INTO `dt_manager_log` VALUES ('291', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-06 16:01:24');
INSERT INTO `dt_manager_log` VALUES ('292', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-06 17:00:20');
INSERT INTO `dt_manager_log` VALUES ('293', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-07 09:44:02');
INSERT INTO `dt_manager_log` VALUES ('294', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-07 10:46:00');
INSERT INTO `dt_manager_log` VALUES ('295', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-08 10:12:04');
INSERT INTO `dt_manager_log` VALUES ('296', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-08 10:12:21');
INSERT INTO `dt_manager_log` VALUES ('297', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-08 10:42:37');
INSERT INTO `dt_manager_log` VALUES ('298', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-05-08 10:47:09');
INSERT INTO `dt_manager_log` VALUES ('299', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-08 10:48:15');
INSERT INTO `dt_manager_log` VALUES ('300', '1', 'admin', 'Edit', '修改管理员:伍军豪', '192.168.6.236', '99', '2020-05-08 11:00:53');
INSERT INTO `dt_manager_log` VALUES ('301', '1', 'admin', 'Edit', '修改项目内容:13', '192.168.6.236', '99', '2020-05-08 11:04:21');
INSERT INTO `dt_manager_log` VALUES ('302', '13', '钱志奇', 'Login', '用户登录', '192.168.6.236', '99', '2020-05-08 11:05:31');
INSERT INTO `dt_manager_log` VALUES ('303', '13', '钱志奇', 'Edit', '修改项目内容:13', '192.168.6.236', '99', '2020-05-08 11:07:01');
INSERT INTO `dt_manager_log` VALUES ('304', '13', '钱志奇', 'Edit', '修改管理员:伍军豪', '192.168.6.236', '99', '2020-05-08 11:12:22');
INSERT INTO `dt_manager_log` VALUES ('305', '13', '钱志奇', 'Edit', '修改管理员:张秀娇', '192.168.6.236', '99', '2020-05-08 11:12:52');
INSERT INTO `dt_manager_log` VALUES ('306', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.236', '99', '2020-05-08 11:15:34');
INSERT INTO `dt_manager_log` VALUES ('307', '1', 'admin', 'Login', '用户登录', '192.168.6.236', '99', '2020-05-08 11:19:00');
INSERT INTO `dt_manager_log` VALUES ('308', '1', 'admin', 'Edit', '修改组织架构内容:速度时空信息科技股份有限公司', '192.168.6.236', '99', '2020-05-08 11:22:45');
INSERT INTO `dt_manager_log` VALUES ('309', '1', 'admin', 'Edit', '修改组织架构内容:未来网络事业部', '192.168.6.236', '99', '2020-05-08 11:22:52');
INSERT INTO `dt_manager_log` VALUES ('310', '1', 'admin', 'Edit', '修改组织架构内容:未来网络事业部', '192.168.6.236', '99', '2020-05-08 11:23:24');
INSERT INTO `dt_manager_log` VALUES ('311', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-05-08 11:31:47');
INSERT INTO `dt_manager_log` VALUES ('312', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-08 14:04:41');
INSERT INTO `dt_manager_log` VALUES ('313', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-08 14:52:07');
INSERT INTO `dt_manager_log` VALUES ('314', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-08 15:15:42');
INSERT INTO `dt_manager_log` VALUES ('315', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-08 16:55:27');
INSERT INTO `dt_manager_log` VALUES ('316', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-05-08 17:27:18');
INSERT INTO `dt_manager_log` VALUES ('317', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-08 17:43:53');
INSERT INTO `dt_manager_log` VALUES ('318', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-09 14:22:58');
INSERT INTO `dt_manager_log` VALUES ('319', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-09 14:26:53');
INSERT INTO `dt_manager_log` VALUES ('320', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-05-09 15:12:45');
INSERT INTO `dt_manager_log` VALUES ('321', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-09 16:25:45');
INSERT INTO `dt_manager_log` VALUES ('322', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-09 17:36:14');
INSERT INTO `dt_manager_log` VALUES ('323', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-11 10:03:41');
INSERT INTO `dt_manager_log` VALUES ('324', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-11 14:54:02');
INSERT INTO `dt_manager_log` VALUES ('325', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-11 17:22:32');
INSERT INTO `dt_manager_log` VALUES ('326', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-12 09:05:49');
INSERT INTO `dt_manager_log` VALUES ('327', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-12 10:03:35');
INSERT INTO `dt_manager_log` VALUES ('328', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-12 15:48:00');
INSERT INTO `dt_manager_log` VALUES ('329', '1', 'admin', 'Login', '用户登录', '192.168.6.82', '99', '2020-05-12 19:46:46');
INSERT INTO `dt_manager_log` VALUES ('330', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-13 09:38:18');
INSERT INTO `dt_manager_log` VALUES ('331', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-13 16:38:16');
INSERT INTO `dt_manager_log` VALUES ('332', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-14 08:34:57');
INSERT INTO `dt_manager_log` VALUES ('333', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-14 08:50:47');
INSERT INTO `dt_manager_log` VALUES ('334', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-14 15:16:52');
INSERT INTO `dt_manager_log` VALUES ('335', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-14 17:54:13');
INSERT INTO `dt_manager_log` VALUES ('336', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-15 11:19:24');
INSERT INTO `dt_manager_log` VALUES ('337', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-15 15:32:03');
INSERT INTO `dt_manager_log` VALUES ('338', '12', '高恒娟', 'Login', '用户登录', '192.168.6.34', '99', '2020-05-15 15:40:04');
INSERT INTO `dt_manager_log` VALUES ('339', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-05-15 18:12:52');
INSERT INTO `dt_manager_log` VALUES ('340', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-05-15 18:20:02');
INSERT INTO `dt_manager_log` VALUES ('341', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-16 16:16:54');
INSERT INTO `dt_manager_log` VALUES ('342', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-18 11:01:34');
INSERT INTO `dt_manager_log` VALUES ('343', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-18 11:01:42');
INSERT INTO `dt_manager_log` VALUES ('344', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-18 16:04:35');
INSERT INTO `dt_manager_log` VALUES ('345', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-18 17:26:52');
INSERT INTO `dt_manager_log` VALUES ('346', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-19 11:36:26');
INSERT INTO `dt_manager_log` VALUES ('347', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-19 17:48:29');
INSERT INTO `dt_manager_log` VALUES ('348', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-20 11:16:44');
INSERT INTO `dt_manager_log` VALUES ('349', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-20 11:16:50');
INSERT INTO `dt_manager_log` VALUES ('350', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-20 15:47:52');
INSERT INTO `dt_manager_log` VALUES ('351', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-21 10:07:34');
INSERT INTO `dt_manager_log` VALUES ('352', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-21 10:41:16');
INSERT INTO `dt_manager_log` VALUES ('353', '11', '刘锦武', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-21 16:41:08');
INSERT INTO `dt_manager_log` VALUES ('354', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-21 20:04:01');
INSERT INTO `dt_manager_log` VALUES ('355', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-25 15:15:23');
INSERT INTO `dt_manager_log` VALUES ('356', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-25 15:20:52');
INSERT INTO `dt_manager_log` VALUES ('357', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-05-25 18:44:47');
INSERT INTO `dt_manager_log` VALUES ('358', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-05-25 19:36:09');
INSERT INTO `dt_manager_log` VALUES ('359', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-05-25 19:36:37');
INSERT INTO `dt_manager_log` VALUES ('360', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-26 14:42:11');
INSERT INTO `dt_manager_log` VALUES ('361', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-26 16:04:05');
INSERT INTO `dt_manager_log` VALUES ('362', '12', '高恒娟', 'Login', '用户登录', '192.168.6.64', '99', '2020-05-27 08:34:10');
INSERT INTO `dt_manager_log` VALUES ('363', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-27 08:43:14');
INSERT INTO `dt_manager_log` VALUES ('364', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-27 09:53:29');
INSERT INTO `dt_manager_log` VALUES ('365', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-27 15:20:55');
INSERT INTO `dt_manager_log` VALUES ('366', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-28 08:48:18');
INSERT INTO `dt_manager_log` VALUES ('367', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-28 14:22:10');
INSERT INTO `dt_manager_log` VALUES ('368', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-05-28 16:32:20');
INSERT INTO `dt_manager_log` VALUES ('369', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-29 15:19:30');
INSERT INTO `dt_manager_log` VALUES ('370', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-05-29 16:40:27');
INSERT INTO `dt_manager_log` VALUES ('371', '12', '高恒娟', 'Login', '用户登录', '192.168.6.34', '99', '2020-05-29 16:41:23');
INSERT INTO `dt_manager_log` VALUES ('372', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-05-29 16:45:17');
INSERT INTO `dt_manager_log` VALUES ('373', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-29 16:46:23');
INSERT INTO `dt_manager_log` VALUES ('374', '21', '解顶林', 'Login', '用户登录', '192.168.6.169', '99', '2020-05-29 16:49:38');
INSERT INTO `dt_manager_log` VALUES ('375', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-05-29 16:53:06');
INSERT INTO `dt_manager_log` VALUES ('376', '10', '万子禹', 'Login', '用户登录', '192.168.6.34', '99', '2020-05-29 16:57:11');
INSERT INTO `dt_manager_log` VALUES ('377', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-05-29 17:16:15');
INSERT INTO `dt_manager_log` VALUES ('378', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-05-29 17:33:18');
INSERT INTO `dt_manager_log` VALUES ('379', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-05-29 17:35:46');
INSERT INTO `dt_manager_log` VALUES ('380', '10', '万子禹', 'Login', '用户登录', '192.168.6.34', '99', '2020-05-29 17:36:21');
INSERT INTO `dt_manager_log` VALUES ('381', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-05-29 18:03:30');
INSERT INTO `dt_manager_log` VALUES ('382', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-05-29 18:11:55');
INSERT INTO `dt_manager_log` VALUES ('383', '23', '伍军豪', 'Login', '用户登录', '192.168.6.117', '99', '2020-05-29 18:16:06');
INSERT INTO `dt_manager_log` VALUES ('384', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-05-30 15:27:51');
INSERT INTO `dt_manager_log` VALUES ('385', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.82', '99', '2020-05-30 18:47:22');
INSERT INTO `dt_manager_log` VALUES ('386', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-05-30 18:56:24');
INSERT INTO `dt_manager_log` VALUES ('387', '15', '耿禹', 'Login', '用户登录', '192.168.6.224', '99', '2020-06-01 08:26:51');
INSERT INTO `dt_manager_log` VALUES ('388', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-01 08:37:45');
INSERT INTO `dt_manager_log` VALUES ('389', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-06-01 08:38:25');
INSERT INTO `dt_manager_log` VALUES ('390', '7', '周艳', 'Login', '用户登录', '192.168.6.180', '99', '2020-06-01 08:42:33');
INSERT INTO `dt_manager_log` VALUES ('391', '21', '解顶林', 'Login', '用户登录', '192.168.6.169', '99', '2020-06-01 09:35:40');
INSERT INTO `dt_manager_log` VALUES ('392', '21', '解顶林', 'Login', '用户登录', '192.168.6.169', '99', '2020-06-01 09:36:31');
INSERT INTO `dt_manager_log` VALUES ('393', '21', '解顶林', 'Login', '用户登录', '192.168.6.169', '99', '2020-06-01 10:34:44');
INSERT INTO `dt_manager_log` VALUES ('394', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-06-01 18:09:37');
INSERT INTO `dt_manager_log` VALUES ('395', '1', 'admin', 'Add', '添加管理员:姚阳', '192.168.6.223', '99', '2020-06-01 18:11:18');
INSERT INTO `dt_manager_log` VALUES ('396', '24', '姚阳', 'Login', '用户登录', '192.168.6.34', '99', '2020-06-01 18:13:13');
INSERT INTO `dt_manager_log` VALUES ('397', '24', '姚阳', 'Login', '用户登录', '192.168.6.34', '99', '2020-06-01 18:14:17');
INSERT INTO `dt_manager_log` VALUES ('398', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-06-01 18:16:00');
INSERT INTO `dt_manager_log` VALUES ('399', '1', 'admin', 'Login', '用户登录', '192.168.6.82', '99', '2020-06-02 11:06:14');
INSERT INTO `dt_manager_log` VALUES ('400', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-02 15:23:47');
INSERT INTO `dt_manager_log` VALUES ('401', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-06-03 17:38:17');
INSERT INTO `dt_manager_log` VALUES ('402', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-04 08:37:58');
INSERT INTO `dt_manager_log` VALUES ('403', '12', '高恒娟', 'Login', '用户登录', '192.168.6.64', '99', '2020-06-05 18:03:49');
INSERT INTO `dt_manager_log` VALUES ('404', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-06-10 08:49:10');
INSERT INTO `dt_manager_log` VALUES ('405', '18', '张秀娇', 'Login', '用户登录', '192.168.6.158', '99', '2020-06-12 09:06:29');
INSERT INTO `dt_manager_log` VALUES ('406', '18', '张秀娇', 'Login', '用户登录', '192.168.6.159', '99', '2020-06-16 16:47:16');
INSERT INTO `dt_manager_log` VALUES ('407', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-17 15:53:26');
INSERT INTO `dt_manager_log` VALUES ('408', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-06-19 16:33:47');
INSERT INTO `dt_manager_log` VALUES ('409', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-22 17:19:18');
INSERT INTO `dt_manager_log` VALUES ('410', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-23 17:23:24');
INSERT INTO `dt_manager_log` VALUES ('411', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-06-24 09:49:48');
INSERT INTO `dt_manager_log` VALUES ('412', '1', 'admin', 'Delete', '删除管理员失败：6', '192.168.6.223', '99', '2020-06-24 09:50:24');
INSERT INTO `dt_manager_log` VALUES ('413', '1', 'admin', 'Add', '添加管理员:陆海芳', '192.168.6.223', '99', '2020-06-24 09:51:24');
INSERT INTO `dt_manager_log` VALUES ('414', '1', 'admin', 'Add', '添加管理员:王禧媛', '192.168.6.223', '99', '2020-06-24 09:52:38');
INSERT INTO `dt_manager_log` VALUES ('415', '26', '王禧媛', 'Login', '用户登录', '192.168.6.196', '99', '2020-06-24 09:57:50');
INSERT INTO `dt_manager_log` VALUES ('416', '26', '王禧媛', 'Login', '用户登录', '192.168.6.196', '99', '2020-06-24 10:01:47');
INSERT INTO `dt_manager_log` VALUES ('417', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-06-24 10:27:26');
INSERT INTO `dt_manager_log` VALUES ('418', '26', '王禧媛', 'Login', '用户登录', '192.168.6.196', '99', '2020-06-28 08:38:52');
INSERT INTO `dt_manager_log` VALUES ('419', '26', '王禧媛', 'Login', '用户登录', '192.168.6.196', '99', '2020-06-28 08:39:59');
INSERT INTO `dt_manager_log` VALUES ('420', '18', '张秀娇', 'Login', '用户登录', '192.168.6.159', '99', '2020-06-28 08:46:20');
INSERT INTO `dt_manager_log` VALUES ('421', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-28 08:47:01');
INSERT INTO `dt_manager_log` VALUES ('422', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-28 10:01:27');
INSERT INTO `dt_manager_log` VALUES ('423', '26', '王禧媛', 'Login', '用户登录', '192.168.6.106', '99', '2020-06-28 10:01:27');
INSERT INTO `dt_manager_log` VALUES ('424', '18', '张秀娇', 'Login', '用户登录', '192.168.6.159', '99', '2020-06-28 10:14:47');
INSERT INTO `dt_manager_log` VALUES ('425', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-06-28 10:32:01');
INSERT INTO `dt_manager_log` VALUES ('426', '1', 'admin', 'Add', '添加管理员:吴洋', '192.168.6.223', '99', '2020-06-28 10:33:12');
INSERT INTO `dt_manager_log` VALUES ('427', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-06-28 16:45:16');
INSERT INTO `dt_manager_log` VALUES ('428', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.82', '99', '2020-06-28 16:55:09');
INSERT INTO `dt_manager_log` VALUES ('429', '24', '姚阳', 'Login', '用户登录', '192.168.6.34', '99', '2020-06-28 17:12:33');
INSERT INTO `dt_manager_log` VALUES ('430', '26', '王禧媛', 'Login', '用户登录', '192.168.6.106', '99', '2020-06-28 17:18:31');
INSERT INTO `dt_manager_log` VALUES ('431', '23', '伍军豪', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-28 18:14:09');
INSERT INTO `dt_manager_log` VALUES ('432', '23', '伍军豪', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-28 18:15:15');
INSERT INTO `dt_manager_log` VALUES ('433', '23', '伍军豪', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-28 18:26:07');
INSERT INTO `dt_manager_log` VALUES ('434', '23', '伍军豪', 'Login', '用户登录', '192.168.6.133', '99', '2020-06-28 18:26:55');
INSERT INTO `dt_manager_log` VALUES ('435', '27', '吴洋', 'Login', '用户登录', '192.168.6.196', '99', '2020-06-28 18:27:13');
INSERT INTO `dt_manager_log` VALUES ('436', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-06-28 20:01:05');
INSERT INTO `dt_manager_log` VALUES ('437', '12', '高恒娟', 'Login', '用户登录', '192.168.6.64', '99', '2020-06-29 08:39:43');
INSERT INTO `dt_manager_log` VALUES ('438', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.82', '99', '2020-06-29 09:26:32');
INSERT INTO `dt_manager_log` VALUES ('439', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-29 15:18:26');
INSERT INTO `dt_manager_log` VALUES ('440', '26', '王禧媛', 'Login', '用户登录', '192.168.6.106', '99', '2020-06-30 10:06:08');
INSERT INTO `dt_manager_log` VALUES ('441', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-06-30 14:43:49');
INSERT INTO `dt_manager_log` VALUES ('442', '15', '耿禹', 'Login', '用户登录', '192.168.6.73', '99', '2020-06-30 16:25:55');
INSERT INTO `dt_manager_log` VALUES ('443', '18', '张秀娇', 'Login', '用户登录', '192.168.6.239', '99', '2020-06-30 17:25:42');
INSERT INTO `dt_manager_log` VALUES ('444', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-06-30 18:37:30');
INSERT INTO `dt_manager_log` VALUES ('445', '26', '王禧媛', 'Login', '用户登录', '192.168.6.106', '99', '2020-07-01 10:28:07');
INSERT INTO `dt_manager_log` VALUES ('446', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-02 11:05:03');
INSERT INTO `dt_manager_log` VALUES ('447', '1', 'admin', 'Add', '添加管理员:綦晓杰', '192.168.6.223', '99', '2020-07-02 11:05:56');
INSERT INTO `dt_manager_log` VALUES ('448', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-02 11:32:29');
INSERT INTO `dt_manager_log` VALUES ('449', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-02 11:33:38');
INSERT INTO `dt_manager_log` VALUES ('450', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-02 14:00:22');
INSERT INTO `dt_manager_log` VALUES ('451', '18', '张秀娇', 'Login', '用户登录', '192.168.6.106', '99', '2020-07-02 14:57:17');
INSERT INTO `dt_manager_log` VALUES ('452', '24', '姚阳', 'Login', '用户登录', '192.168.6.34', '99', '2020-07-02 16:20:27');
INSERT INTO `dt_manager_log` VALUES ('453', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-07-02 16:20:40');
INSERT INTO `dt_manager_log` VALUES ('454', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-02 18:19:37');
INSERT INTO `dt_manager_log` VALUES ('455', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-03 11:14:17');
INSERT INTO `dt_manager_log` VALUES ('456', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-03 14:58:33');
INSERT INTO `dt_manager_log` VALUES ('457', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-03 15:16:13');
INSERT INTO `dt_manager_log` VALUES ('458', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-07-03 16:06:58');
INSERT INTO `dt_manager_log` VALUES ('459', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-03 16:12:55');
INSERT INTO `dt_manager_log` VALUES ('460', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-03 17:29:31');
INSERT INTO `dt_manager_log` VALUES ('461', '20', '戚国华', 'Login', '用户登录', '192.168.6.40', '99', '2020-07-03 18:11:59');
INSERT INTO `dt_manager_log` VALUES ('462', '18', '张秀娇', 'Login', '用户登录', '192.168.6.106', '99', '2020-07-06 15:33:48');
INSERT INTO `dt_manager_log` VALUES ('463', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-07 08:29:14');
INSERT INTO `dt_manager_log` VALUES ('464', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-07 11:42:57');
INSERT INTO `dt_manager_log` VALUES ('465', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-08 14:32:21');
INSERT INTO `dt_manager_log` VALUES ('466', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-08 15:59:59');
INSERT INTO `dt_manager_log` VALUES ('467', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-09 08:52:01');
INSERT INTO `dt_manager_log` VALUES ('468', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-07-09 17:23:06');
INSERT INTO `dt_manager_log` VALUES ('469', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-09 17:34:40');
INSERT INTO `dt_manager_log` VALUES ('470', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-07-09 17:52:50');
INSERT INTO `dt_manager_log` VALUES ('471', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-10 08:57:50');
INSERT INTO `dt_manager_log` VALUES ('472', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-10 16:15:55');
INSERT INTO `dt_manager_log` VALUES ('473', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-13 09:34:17');
INSERT INTO `dt_manager_log` VALUES ('474', '1', 'admin', 'Add', '添加管理员:何婷', '192.168.6.223', '99', '2020-07-13 09:35:25');
INSERT INTO `dt_manager_log` VALUES ('475', '1', 'admin', 'Add', '添加管理员:龙冰心', '192.168.6.223', '99', '2020-07-13 09:36:01');
INSERT INTO `dt_manager_log` VALUES ('476', '29', '何婷', 'Login', '用户登录', '192.168.6.73', '99', '2020-07-13 17:39:22');
INSERT INTO `dt_manager_log` VALUES ('477', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-07-13 18:12:35');
INSERT INTO `dt_manager_log` VALUES ('478', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-14 11:02:24');
INSERT INTO `dt_manager_log` VALUES ('479', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-15 08:59:45');
INSERT INTO `dt_manager_log` VALUES ('480', '1', 'admin', 'Add', '添加管理员:夏伟', '192.168.6.223', '99', '2020-07-15 09:00:31');
INSERT INTO `dt_manager_log` VALUES ('481', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-15 10:54:39');
INSERT INTO `dt_manager_log` VALUES ('482', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-15 10:57:39');
INSERT INTO `dt_manager_log` VALUES ('483', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-15 15:03:14');
INSERT INTO `dt_manager_log` VALUES ('484', '30', '龙冰心', 'Login', '用户登录', '192.168.6.252', '99', '2020-07-15 17:41:11');
INSERT INTO `dt_manager_log` VALUES ('485', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-16 09:01:53');
INSERT INTO `dt_manager_log` VALUES ('486', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-16 17:14:00');
INSERT INTO `dt_manager_log` VALUES ('487', '7', '周艳', 'Login', '用户登录', '192.168.6.180', '99', '2020-07-16 17:17:27');
INSERT INTO `dt_manager_log` VALUES ('488', '18', '张秀娇', 'Login', '用户登录', '192.168.6.106', '99', '2020-07-17 08:55:18');
INSERT INTO `dt_manager_log` VALUES ('489', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-17 09:39:38');
INSERT INTO `dt_manager_log` VALUES ('490', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-17 17:11:58');
INSERT INTO `dt_manager_log` VALUES ('491', '30', '龙冰心', 'Login', '用户登录', '192.168.6.252', '99', '2020-07-20 09:09:50');
INSERT INTO `dt_manager_log` VALUES ('492', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-24 09:50:35');
INSERT INTO `dt_manager_log` VALUES ('493', '19', '宁南鑫', 'Login', '用户登录', '192.168.6.2', '99', '2020-07-24 15:51:22');
INSERT INTO `dt_manager_log` VALUES ('494', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-27 11:21:59');
INSERT INTO `dt_manager_log` VALUES ('495', '1', 'admin', 'Add', '添加管理员:于福忠', '192.168.6.223', '99', '2020-07-27 11:23:00');
INSERT INTO `dt_manager_log` VALUES ('496', '1', 'admin', 'Add', '添加管理员:苗国庆', '192.168.6.223', '99', '2020-07-27 11:23:30');
INSERT INTO `dt_manager_log` VALUES ('497', '5', '何海', 'Login', '用户登录', '192.168.6.214', '99', '2020-07-27 17:40:47');
INSERT INTO `dt_manager_log` VALUES ('498', '24', '姚阳', 'Login', '用户登录', '192.168.6.34', '99', '2020-07-27 18:13:29');
INSERT INTO `dt_manager_log` VALUES ('499', '22', '林书宇', 'Login', '用户登录', '192.168.6.14', '99', '2020-07-27 18:14:27');
INSERT INTO `dt_manager_log` VALUES ('500', '9', '孙茂荣', 'Login', '用户登录', '192.168.6.181', '99', '2020-07-27 19:58:06');
INSERT INTO `dt_manager_log` VALUES ('501', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-28 08:32:13');
INSERT INTO `dt_manager_log` VALUES ('502', '20', '戚国华', 'Login', '用户登录', '192.168.6.83', '99', '2020-07-28 18:16:41');
INSERT INTO `dt_manager_log` VALUES ('503', '12', '高恒娟', 'Login', '用户登录', '192.168.6.64', '99', '2020-07-29 08:29:55');
INSERT INTO `dt_manager_log` VALUES ('504', '8', '陈淑琳', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-29 10:05:38');
INSERT INTO `dt_manager_log` VALUES ('505', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-29 10:31:51');
INSERT INTO `dt_manager_log` VALUES ('506', '18', '张秀娇', 'Login', '用户登录', '192.168.6.106', '99', '2020-07-29 14:29:11');
INSERT INTO `dt_manager_log` VALUES ('507', '1', 'admin', 'Login', '用户登录', '192.168.6.223', '99', '2020-07-30 09:07:19');
INSERT INTO `dt_manager_log` VALUES ('508', '1', 'admin', 'Delete', '删除管理员失败：6', '192.168.6.223', '99', '2020-07-30 09:13:16');
INSERT INTO `dt_manager_log` VALUES ('509', '4', '温四林', 'Login', '用户登录', '192.168.6.237', '99', '2020-07-30 09:15:20');
INSERT INTO `dt_manager_log` VALUES ('510', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.82', '99', '2020-07-30 09:15:21');
INSERT INTO `dt_manager_log` VALUES ('511', '1', 'admin', 'Login', '用户登录', '192.168.6.82', '99', '2020-07-30 09:19:05');
INSERT INTO `dt_manager_log` VALUES ('512', '3', '白慧鹏', 'Login', '用户登录', '192.168.6.82', '99', '2020-07-30 09:20:18');
INSERT INTO `dt_manager_log` VALUES ('513', '1', 'admin', 'Login', '用户登录', '192.168.6.82', '99', '2020-07-30 09:23:29');
INSERT INTO `dt_manager_log` VALUES ('514', '28', '綦晓杰', 'Login', '用户登录', '192.168.6.239', '99', '2020-07-31 11:19:29');
INSERT INTO `dt_manager_log` VALUES ('515', '26', '王禧媛', 'Login', '用户登录', '192.168.6.159', '99', '2020-07-31 14:01:21');
INSERT INTO `dt_manager_log` VALUES ('516', '29', '何婷', 'Login', '用户登录', '192.168.6.248', '99', '2020-07-31 16:54:26');
INSERT INTO `dt_manager_log` VALUES ('517', '29', '何婷', 'Login', '用户登录', '192.168.6.248', '99', '2020-07-31 16:58:54');
INSERT INTO `dt_manager_log` VALUES ('518', '18', '张秀娇', 'Login', '用户登录', '192.168.6.106', '99', '2020-08-03 08:56:21');

-- ----------------------------
-- Table structure for dt_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_role`;
CREATE TABLE `dt_manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_type` tinyint(3) unsigned NOT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_manager_role
-- ----------------------------
INSERT INTO `dt_manager_role` VALUES ('1', '超级管理员', '1', '1', '99', '2017-01-01 00:00:00');
INSERT INTO `dt_manager_role` VALUES ('4', '普通成员', '3', '0', '99', '2018-01-30 17:24:13');
INSERT INTO `dt_manager_role` VALUES ('5', '部门经理', '2', '0', '99', '2018-12-10 11:02:30');
INSERT INTO `dt_manager_role` VALUES ('6', '项目经理', '3', '0', '99', '2019-03-19 14:31:04');
INSERT INTO `dt_manager_role` VALUES ('7', '财务管理', '3', '0', '99', '2019-03-28 09:27:00');
INSERT INTO `dt_manager_role` VALUES ('8', '报价管理', '3', '0', '99', '2019-04-11 11:37:42');
INSERT INTO `dt_manager_role` VALUES ('9', '报价管理（经理）', '3', '0', '99', '2019-04-15 09:07:02');
INSERT INTO `dt_manager_role` VALUES ('10', '汤桂勇的角色', '3', '0', '99', '2019-04-29 11:34:58');
INSERT INTO `dt_manager_role` VALUES ('11', '招投标，报价管理', '3', '0', '99', '2019-06-04 11:55:52');
INSERT INTO `dt_manager_role` VALUES ('12', '内部项目对接人', '3', '0', '99', '2019-07-10 17:42:18');
INSERT INTO `dt_manager_role` VALUES ('13', '人事', '3', '0', '99', '2019-07-10 17:51:30');
INSERT INTO `dt_manager_role` VALUES ('14', '监察员', '3', '0', '99', '2019-08-19 10:41:30');
INSERT INTO `dt_manager_role` VALUES ('15', '普通用户', '3', '0', '99', '2020-04-03 18:49:53');

-- ----------------------------
-- Table structure for dt_manager_role_value
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_role_value`;
CREATE TABLE `dt_manager_role_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `nav_name` varchar(100) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `dt_manager_role_manager_role_value` FOREIGN KEY (`role_id`) REFERENCES `dt_manager_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_manager_role_value
-- ----------------------------
INSERT INTO `dt_manager_role_value` VALUES ('1', '15', 'project_wotkinghour', 'Show', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('2', '15', 'sys_working_hour', 'Show', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('3', '15', 'sys_working_hour', 'View', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('4', '15', 'sys_working_hour', 'Add', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('5', '15', 'sys_working_hour', 'Edit', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('6', '15', 'sys_working_hour', 'Delete', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('7', '15', 'sys_workinghour_index', 'Show', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('8', '15', 'sys_workinghour_index', 'View', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('9', '15', 'sys_workinghour_log', 'Show', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('10', '15', 'sys_workinghour_log', 'View', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('11', '15', 'sys_workinghour_log', 'Add', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('12', '15', 'sys_workinghour_log', 'Edit', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('13', '15', 'sys_workinghour_log', 'Delete', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('14', '15', 'sys_workinghour_inspect', 'Show', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('15', '15', 'sys_workinghour_inspect', 'View', '99', '2020-04-03 18:49:53');
INSERT INTO `dt_manager_role_value` VALUES ('16', '6', 'xiangmugailan', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('17', '6', 'sys_project', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('18', '6', 'sys_project', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('19', '6', 'huikuanTJ', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('20', '6', 'huikuanTJ', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('21', '6', 'huikuanTJ', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('22', '6', 'huikuanTJ', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('23', '6', 'huikuanTJ', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('24', '6', 'willhuikuanTJ', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('25', '6', 'willhuikuanTJ', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('26', '6', 'willhuikuanTJ', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('27', '6', 'willhuikuanTJ', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('28', '6', 'willhuikuanTJ', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('29', '6', 'huikuanstatistics', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('30', '6', 'huikuanstatistics', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('31', '6', 'huikuanstatistics', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('32', '6', 'huikuanstatistics', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('33', '6', 'huikuanstatistics', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('34', '6', 'baoxiaoTJ', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('35', '6', 'baoxiaoTJ', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('36', '6', 'baoxiaoTJ', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('37', '6', 'baoxiaoTJ', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('38', '6', 'baoxiaoTJ', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('39', '6', 'yiyanshouTJ', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('40', '6', 'yiyanshouTJ', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('41', '6', 'yiyanshouTJ', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('42', '6', 'yiyanshouTJ', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('43', '6', 'yiyanshouTJ', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('44', '6', 'weiyanshouTJ', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('45', '6', 'weiyanshouTJ', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('46', '6', 'weiyanshouTJ', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('47', '6', 'weiyanshouTJ', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('48', '6', 'weiyanshouTJ', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('49', '6', 'sys_contents', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('50', '6', 'ProjectIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('51', '6', 'ProjectIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('52', '6', 'ProjectIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('53', '6', 'ProjectIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('54', '6', 'ProjectIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('55', '6', 'projectmanager', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('56', '6', 'projectmanager', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('57', '6', 'projectmanager', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('58', '6', 'projectmanager', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('59', '6', 'projectmanager', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('60', '6', 'ProjectRYIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('61', '6', 'ProjectRYIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('62', '6', 'ProjectRYIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('63', '6', 'ProjectRYIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('64', '6', 'ProjectRYIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('65', '6', 'ProjectRYForm', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('66', '6', 'ProjectRYForm', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('67', '6', 'ProjectRYForm', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('68', '6', 'ProjectRYForm', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('69', '6', 'ProjectRYForm', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('70', '6', 'ZiXiangMuIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('71', '6', 'ZiXiangMuIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('72', '6', 'ZiXiangMuIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('73', '6', 'ZiXiangMuIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('74', '6', 'ZiXiangMuIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('75', '6', 'ProjectXMForm', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('76', '6', 'ProjectXMForm', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('77', '6', 'ProjectXMForm', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('78', '6', 'ProjectXMForm', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('79', '6', 'ProjectXMForm', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('80', '6', 'processIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('81', '6', 'processIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('82', '6', 'processIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('83', '6', 'processIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('84', '6', 'processIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('85', '6', 'landform', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('86', '6', 'landform', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('87', '6', 'landform', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('88', '6', 'landform', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('89', '6', 'landform', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('90', '6', 'ProjectTailRecord', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('91', '6', 'ProjectTailRecord', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('92', '6', 'ProjectTailRecord', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('93', '6', 'ProjectTailRecord', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('94', '6', 'ProjectTailRecord', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('95', '6', 'form_tail_record', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('96', '6', 'form_tail_record', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('97', '6', 'form_tail_record', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('98', '6', 'form_tail_record', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('99', '6', 'form_tail_record', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('100', '6', 'ProjectWeeklyReports', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('101', '6', 'ProjectWeeklyReports', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('102', '6', 'ProjectWeeklyReports', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('103', '6', 'ProjectWeeklyReports', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('104', '6', 'ProjectWeeklyReports', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('105', '6', 'project_weekly_reports_form', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('106', '6', 'project_weekly_reports_form', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('107', '6', 'project_weekly_reports_form', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('108', '6', 'project_weekly_reports_form', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('109', '6', 'project_weekly_reports_form', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('110', '6', 'ZiProject_list', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('111', '6', 'ZiProject_list', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('112', '6', 'ZiProject_list', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('113', '6', 'ZiProject_list', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('114', '6', 'ZiProject_list', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('115', '6', 'landmarkIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('116', '6', 'landmarkIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('117', '6', 'landmarkIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('118', '6', 'landmarkIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('119', '6', 'landmarkIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('120', '6', 'milestoneIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('121', '6', 'milestoneIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('122', '6', 'milestoneIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('123', '6', 'milestoneIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('124', '6', 'milestoneIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('125', '6', 'ProjectRY_list', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('126', '6', 'ProjectRY_list', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('127', '6', 'ProjectRY_list', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('128', '6', 'ProjectRY_list', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('129', '6', 'ProjectRY_list', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('130', '6', 'ProjectEstimateIndex', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('131', '6', 'ProjectEstimateIndex', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('132', '6', 'ProjectEstimateIndex', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('133', '6', 'ProjectEstimateIndex', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('134', '6', 'ProjectEstimateIndex', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('135', '6', 'siftproject', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('136', '6', 'siftproject', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('137', '6', 'siftproject', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('138', '6', 'siftproject', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('139', '6', 'siftproject', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('140', '6', 'project_wotkinghour', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('141', '6', 'sys_working_hour', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('142', '6', 'sys_working_hour', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('143', '6', 'sys_working_hour', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('144', '6', 'sys_working_hour', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('145', '6', 'sys_working_hour', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('146', '6', 'sys_working_hour', 'Audit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('147', '6', 'sys_workinghour_index', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('148', '6', 'sys_workinghour_index', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('149', '6', 'sys_workinghour_audit', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('150', '6', 'sys_workinghour_audit', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('151', '6', 'sys_workinghour_audit', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('152', '6', 'sys_workinghour_audit', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('153', '6', 'sys_workinghour_audit', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('154', '6', 'sys_workinghour_log', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('155', '6', 'sys_workinghour_log', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('156', '6', 'sys_workinghour_log', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('157', '6', 'sys_workinghour_log', 'Edit', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('158', '6', 'sys_workinghour_log', 'Delete', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('159', '6', 'sys_workinghour_quote', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('160', '6', 'sys_workinghour_quote', 'View', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('161', '6', 'sys_workinghour_quote', 'Add', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('162', '6', 'sys_workinghour_inspect', 'Show', '99', '2020-04-03 18:51:14');
INSERT INTO `dt_manager_role_value` VALUES ('163', '6', 'sys_workinghour_inspect', 'View', '99', '2020-04-03 18:51:14');

-- ----------------------------
-- Table structure for dt_navigation
-- ----------------------------
DROP TABLE IF EXISTS `dt_navigation`;
CREATE TABLE `dt_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `nav_type` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `is_lock` tinyint(3) unsigned NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `action_type` varchar(500) DEFAULT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_navigation
-- ----------------------------
INSERT INTO `dt_navigation` VALUES ('1', '0', 'System', 'sys_contents', '项目管理', '项目', '/admin/themes/skins/nav/home.png', '', '0', '系统默认导航，不可更改导航ID', 'Show', '0', '1', '2019-02-19 15:41:00');
INSERT INTO `dt_navigation` VALUES ('2', '0', 'System', 'sys_controller', '控制面板', '控制面板', '/admin/themes/skins/nav/sys.png', '', '0', '系统默认导航，不可更改导航ID', 'Show,View,Add,Edit', '0', '99', '2019-02-19 15:53:42');
INSERT INTO `dt_navigation` VALUES ('3', '2', 'System', 'sys_navigation', '后台导航管理', '', '', 'system/navigation/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-19 16:02:33');
INSERT INTO `dt_navigation` VALUES ('4', '2', 'System', 'sys_manager', '系统用户', '', '', '', '0', '', 'Show', '0', '99', '2019-02-19 16:03:30');
INSERT INTO `dt_navigation` VALUES ('5', '4', 'System', 'manager_list', '人员管理', '', '', 'system/manager/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-19 16:09:58');
INSERT INTO `dt_navigation` VALUES ('6', '4', 'System', 'manager_role', '角色管理', '', '', 'system/role/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-19 16:16:12');
INSERT INTO `dt_navigation` VALUES ('7', '4', 'System', 'manager_log', '管理日志', '', '', 'system/manager/log.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-19 16:22:16');
INSERT INTO `dt_navigation` VALUES ('8', '0', 'System', 'project_wotkinghour', '工时管理', '工时管理', '', '', '0', '', 'Show', '0', '2', '2019-02-19 17:46:28');
INSERT INTO `dt_navigation` VALUES ('9', '0', 'System', 'project_money', '财务管理', '财务管理', '', '', '0', '', 'Show', '0', '3', '2019-02-19 17:47:15');
INSERT INTO `dt_navigation` VALUES ('10', '2', 'System', 'sys_database', '数据管理', '', '', 'system/backup/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-20 10:26:35');
INSERT INTO `dt_navigation` VALUES ('11', '1', 'System', 'ProjectIndex', '项目管理', '', '', 'project/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '1', '2019-02-21 11:21:37');
INSERT INTO `dt_navigation` VALUES ('12', '1', 'System', 'landmarkIndex', '里程碑管理', '', '', 'landmark/index.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-21 11:22:29');
INSERT INTO `dt_navigation` VALUES ('13', '1', 'System', 'milestoneIndex', '里程碑进度', '', '', 'milestone/index.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-26 14:53:08');
INSERT INTO `dt_navigation` VALUES ('14', '8', 'System', 'sys_working_hour', '工时填报', '', '', 'workinghour/form.aspx', '0', '', 'Show,View,Add,Edit,Delete,Audit', '0', '99', '2019-02-26 14:55:03');
INSERT INTO `dt_navigation` VALUES ('15', '1', 'System', 'ZiProject_list', '子内容管理', '', '', '/XiangMuGuanLi/ZiXiangMu.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '3', '2019-02-26 14:56:32');
INSERT INTO `dt_navigation` VALUES ('16', '1', 'System', 'ProjectRY_list', '项目成员管理', '', '', '/XiangMuGuanLi/ProjectRY.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-26 14:57:35');
INSERT INTO `dt_navigation` VALUES ('17', '9', 'System', 'suishouji', '费用报销', '', '', 'suishouji/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-26 15:19:43');
INSERT INTO `dt_navigation` VALUES ('18', '9', 'System', 'xiangmuhuikuan', '项目回款', '', '', 'xiangmuhuikuan/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-26 15:20:17');
INSERT INTO `dt_navigation` VALUES ('19', '9', 'System', 'xiangmukaipiao', '项目开票', '', '', 'xiangmukaipiao/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-26 15:20:52');
INSERT INTO `dt_navigation` VALUES ('21', '0', 'System', 'xiangmugailan', '项目概览', '项目概览', '', 'project/project_details.aspx', '0', '', 'Show', '0', '0', '2019-02-26 20:55:36');
INSERT INTO `dt_navigation` VALUES ('23', '21', 'System', 'sys_project', '项目概览', '', '', 'project/project_details.aspx', '0', '', 'Show,View', '0', '11', '2019-02-26 20:58:39');
INSERT INTO `dt_navigation` VALUES ('24', '9', 'System', 'salarydetails', '人力成本', '', '', 'salaryDetails/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-27 14:52:44');
INSERT INTO `dt_navigation` VALUES ('25', '8', 'System', 'sys_workinghour_index', '工时查看', '', '', 'workinghour/index.aspx', '0', '', 'Show,View', '0', '99', '2019-02-27 15:26:02');
INSERT INTO `dt_navigation` VALUES ('26', '8', 'System', 'sys_workinghour_audit', '工时审核', '', '', 'workinghour/audit.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-02-27 16:13:50');
INSERT INTO `dt_navigation` VALUES ('27', '4', 'System', 'ImportIndex', '部门人员导入', '', '', 'organize/ImportIndex.aspx', '0', '', 'Show,View', '0', '99', '2019-03-05 15:17:51');
INSERT INTO `dt_navigation` VALUES ('28', '4', 'System', 'sys_organize', '部门管理', '', '', 'system/organize/index.aspx', '0', '', '', '0', '99', '2019-03-12 11:16:59');
INSERT INTO `dt_navigation` VALUES ('29', '21', 'System', 'project_baobiao', '组织概览', '', '', 'project\\Project_BaoBiao.aspx', '0', '', '', '0', '12', '2019-03-28 20:49:58');
INSERT INTO `dt_navigation` VALUES ('30', '0', 'System', 'quotemangetitle', '营销管理', '营销管理', '', '', '0', '', 'Show', '0', '4', '2019-04-02 09:10:14');
INSERT INTO `dt_navigation` VALUES ('31', '30', 'System', 'quotemanage', '报价管理', '报价管理', '', 'quoteManage/manage.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-02 09:11:28');
INSERT INTO `dt_navigation` VALUES ('32', '1', 'System', 'projectmanager', '项目内容管理', '', '', '/XiangMuGuanLi/projectmanage.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '2', '2019-04-10 19:30:58');
INSERT INTO `dt_navigation` VALUES ('34', '32', 'System', 'ProjectRYIndex', '新项目成员管理', '', '', '/XiangMuGuanLi/ProjectRYIndex.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:33:33');
INSERT INTO `dt_navigation` VALUES ('35', '34', 'System', 'ProjectRYForm', '项目成员新增/编辑', '', '', '/XiangMuGuanLi/ProjectRYForm.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:34:42');
INSERT INTO `dt_navigation` VALUES ('36', '32', 'System', 'ZiXiangMuIndex', '新子内容管理', '', '', '/XiangMuGuanLi/ZiXiangMuIndex.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:35:36');
INSERT INTO `dt_navigation` VALUES ('37', '36', 'System', 'ProjectXMForm', '子内容新增/编辑', '', '', '/XiangMuGuanLi/ProjectXMForm.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:36:05');
INSERT INTO `dt_navigation` VALUES ('38', '32', 'System', 'processIndex', '新里程碑进度', '', '', 'milestone/processIndex.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:36:39');
INSERT INTO `dt_navigation` VALUES ('39', '38', 'System', 'landform', '里程碑新增/编辑', '', '', 'landmark/landform.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-10 19:37:19');
INSERT INTO `dt_navigation` VALUES ('40', '4', 'System', 'CommmonImport', '公共导入', '', '', 'commonImport/CommonImprot.aspx', '0', '', 'Show,View', '0', '99', '2019-04-24 13:44:55');
INSERT INTO `dt_navigation` VALUES ('41', '32', 'System', 'ProjectTailRecord', '项目跟踪记录', '', '', 'project/project_tail_record.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-24 14:15:42');
INSERT INTO `dt_navigation` VALUES ('42', '41', 'System', 'form_tail_record', '跟踪记录新增/编辑', '', '', 'project/form_tail_record.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-04-24 14:16:09');
INSERT INTO `dt_navigation` VALUES ('43', '8', 'System', 'sys_workinghour_log', '日志查看', '', '', 'workinghour/working_log.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-07 18:19:01');
INSERT INTO `dt_navigation` VALUES ('44', '8', 'System', 'sys_workinghour_quote', '工时监察', '', '', 'workinghour/quote_workhour.aspx', '0', '', 'Show,View,Add', '0', '99', '2019-05-07 18:21:09');
INSERT INTO `dt_navigation` VALUES ('45', '21', 'System', 'huikuanTJ', '回款明细', '', '', 'xiangmugailan/huikuan_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '13', '2019-05-14 18:42:55');
INSERT INTO `dt_navigation` VALUES ('46', '21', 'System', 'baoxiaoTJ', '报销情况', '', '', 'xiangmugailan/baoxiao_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '16', '2019-05-14 18:43:26');
INSERT INTO `dt_navigation` VALUES ('47', '0', 'System', 'purchasetitle', '采购管理', '采购管理', '', '', '0', '', 'Show', '0', '5', '2019-05-14 18:44:10');
INSERT INTO `dt_navigation` VALUES ('48', '47', 'System', 'purchaseManage', '采购合同管理', '', '', 'purchaseManage/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-14 18:44:41');
INSERT INTO `dt_navigation` VALUES ('49', '0', 'System', 'marketplace', '市场活动费用管理', '市场活动费用管理', '', '', '1', '', 'Show', '0', '6', '2019-05-21 09:43:59');
INSERT INTO `dt_navigation` VALUES ('50', '30', 'System', 'FellowshipCostIndex', '联谊费用管理', '', '', 'fellowshipcostManage/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-21 09:46:21');
INSERT INTO `dt_navigation` VALUES ('51', '30', 'System', 'BidCostIndex', '招投标费用管理', '', '', 'bidcostManage/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-21 09:48:30');
INSERT INTO `dt_navigation` VALUES ('52', '4', 'System', 'ProjectUserSet', '工时配置', '', '', 'project/project_user_set.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-23 17:09:47');
INSERT INTO `dt_navigation` VALUES ('53', '30', 'System', 'serveManageIndex', '招待管理', '', '', 'serveManage/index.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-23 18:38:34');
INSERT INTO `dt_navigation` VALUES ('55', '0', 'System', 'archives', '公共文件柜', '公共文件柜', '', '', '0', '', 'Show', '0', '7', '2019-05-24 08:32:51');
INSERT INTO `dt_navigation` VALUES ('56', '55', 'System', 'archives_category_index', '文件类别设置', '', '', 'system/archives_category/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-24 08:33:25');
INSERT INTO `dt_navigation` VALUES ('57', '55', 'System', 'archives_index', '文件管理', '', '', 'system/archives/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-24 08:34:04');
INSERT INTO `dt_navigation` VALUES ('58', '55', 'System', 'my_archives', '我的文档', '', '', 'system/archives/myarchives.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-24 08:34:30');
INSERT INTO `dt_navigation` VALUES ('59', '30', 'System', 'productmanage', '产品管理', '', '', 'quotemanage/product_manage.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-28 18:15:13');
INSERT INTO `dt_navigation` VALUES ('60', '32', 'System', 'ProjectWeeklyReports', '业主对接记录', '', '', 'project/project_weekly_reports.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-31 16:22:31');
INSERT INTO `dt_navigation` VALUES ('61', '60', 'System', 'project_weekly_reports_form', '业主对接记录新增/编辑', '', '', 'project/project_weekly_reports_form.aspx', '1', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-05-31 16:25:04');
INSERT INTO `dt_navigation` VALUES ('62', '47', 'System', 'supplierManage', '供应商管理', '', '', 'purchaseManage/supplier_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-06-04 09:45:57');
INSERT INTO `dt_navigation` VALUES ('63', '30', 'System', 'signbill', '签单管理', '', '', 'quoteManage/signbill_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-06-05 19:46:46');
INSERT INTO `dt_navigation` VALUES ('64', '30', 'System', 'SuppliersManage', '供应商管理', '', '', 'quoteManage/Suppliers_Manage.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-06-05 19:47:24');
INSERT INTO `dt_navigation` VALUES ('65', '1', 'System', 'ProjectEstimateIndex', '项目估算', '', '', 'project_estimate/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-06-06 09:26:08');
INSERT INTO `dt_navigation` VALUES ('66', '8', 'System', 'sys_workinghour_inspect', '工时检查', '', '', 'workinghour/inspect.aspx', '0', '', 'Show,View', '0', '99', '2019-06-10 09:13:55');
INSERT INTO `dt_navigation` VALUES ('67', '30', 'System', 'DirectSalesManage', '直销人员管理', '', '', 'quoteManage/DirectSales_Manage.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-06-21 09:58:21');
INSERT INTO `dt_navigation` VALUES ('68', '21', 'System', 'willhuikuanTJ', '未回款明细', '', '', 'xiangmugailan/willhuikuan_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '14', '2019-07-08 09:13:14');
INSERT INTO `dt_navigation` VALUES ('69', '9', 'System', 'sharedExpenses', '公摊费用', '', '', 'sharedExpenses/index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-07-24 22:47:27');
INSERT INTO `dt_navigation` VALUES ('70', '21', 'System', 'yiyanshouTJ', '已验收情况', '', '', 'xiangmugailan/yiyanshou_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-07-30 22:18:12');
INSERT INTO `dt_navigation` VALUES ('71', '21', 'System', 'weiyanshouTJ', '未验收情况', '', '', 'xiangmugailan/weiyanshou_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-07-30 22:18:48');
INSERT INTO `dt_navigation` VALUES ('72', '21', 'System', 'huikuanstatistics', '回款统计', '', '', 'xiangmugailan/huikuanTongji/statistics_index.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '15', '2019-11-12 15:37:55');
INSERT INTO `dt_navigation` VALUES ('73', '1', 'System', 'siftproject', '项目筛查', '', '', '/XiangMuGuanLi/siftproject.aspx', '0', '', 'Show,View,Add,Edit,Delete', '0', '99', '2019-11-18 23:05:40');

-- ----------------------------
-- Table structure for dt_organize
-- ----------------------------
DROP TABLE IF EXISTS `dt_organize`;
CREATE TABLE `dt_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `class_list` varchar(500) DEFAULT NULL,
  `class_layer` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `has_edit` tinyint(3) unsigned NOT NULL,
  `has_delete` tinyint(3) unsigned NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_organize
-- ----------------------------
INSERT INTO `dt_organize` VALUES ('1', '16', '01', ',16,1,', '2', '产品研发中心', '产研中心', '', '冯建亮', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 09:47:43');
INSERT INTO `dt_organize` VALUES ('3', '1', '0102', ',1,3,', '2', '图书编制部', '图书编制部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 14:08:00');
INSERT INTO `dt_organize` VALUES ('4', '1', '0103', ',1,4,', '2', '项目运维部', '项目运维部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 14:09:18');
INSERT INTO `dt_organize` VALUES ('5', '1', '0104', ',1,5,', '2', '设计制作部', '设计制作部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 14:09:35');
INSERT INTO `dt_organize` VALUES ('6', '1', '0105', ',1,6,', '2', '数据地图部', '数据地图部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 14:10:07');
INSERT INTO `dt_organize` VALUES ('7', '1', '0106', ',1,7,', '2', '测试质检部', '测试质检部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-05 14:10:28');
INSERT INTO `dt_organize` VALUES ('9', '16', '04', ',16,9,', '2', '市场营销部', '市场营销部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:47:54');
INSERT INTO `dt_organize` VALUES ('10', '16', '05', ',16,10,', '2', '综合管理部', '综合管理部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:48:11');
INSERT INTO `dt_organize` VALUES ('11', '0', 'A02', ',11,', '1', '时空大数据事业部', '时空大数据事业部', '', '李俊', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:49:44');
INSERT INTO `dt_organize` VALUES ('12', '0', 'A03', ',12,', '1', '内部控制委员会', '内部控制委员会', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:50:05');
INSERT INTO `dt_organize` VALUES ('13', '0', 'A04', ',13,', '1', '自然资源事业部', '自然资源事业部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:50:25');
INSERT INTO `dt_organize` VALUES ('14', '0', 'A05', ',14,', '1', '战略新兴事业部', '战略新兴事业部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:50:43');
INSERT INTO `dt_organize` VALUES ('15', '0', 'A06', ',15,', '1', '经营决策委员会', '经营决策委员会', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 11:51:18');
INSERT INTO `dt_organize` VALUES ('16', '0', 'A01', ',16,', '1', '智慧民政事业部', '智慧民政事业部', '', '周雄', '', null, '', '', '', '1', '1', '', '1', '2019-03-13 14:10:36');
INSERT INTO `dt_organize` VALUES ('17', '1', '02', ',16,1,17,', '3', '总工办公室', '总工办公室', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 14:13:14');
INSERT INTO `dt_organize` VALUES ('18', '29', '03', ',29,18,', '2', '速度软件', '速度软件', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 14:23:14');
INSERT INTO `dt_organize` VALUES ('19', '1', '1024', ',16,1,19,', '3', '软件研发部', '软件研发部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-13 15:05:21');
INSERT INTO `dt_organize` VALUES ('21', '16', 'A-HD', ',16,21,', '2', '华东大区', '华东大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:14:21');
INSERT INTO `dt_organize` VALUES ('22', '16', 'A-DB', ',16,22,', '2', '东北大区', '东北大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:14:42');
INSERT INTO `dt_organize` VALUES ('23', '23', 'A-HZ', ',23,23,', '2', '华中大区', '华中大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:15:03');
INSERT INTO `dt_organize` VALUES ('24', '16', 'A-HB', ',16,24,', '2', '华北大区', '华北大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:15:31');
INSERT INTO `dt_organize` VALUES ('25', '25', 'A-HN', ',25,25,', '2', '华南大区', '华南大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:15:51');
INSERT INTO `dt_organize` VALUES ('26', '16', 'A-XB', ',16,26,', '2', '西北大区', '西北大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:16:15');
INSERT INTO `dt_organize` VALUES ('27', '16', 'A-XN', ',16,27,', '2', '西南大区', '西南大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-15 14:16:36');
INSERT INTO `dt_organize` VALUES ('28', '16', 'A-HZ', ',16,28,', '2', '华中大区', '华中大区', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-03-26 15:47:37');
INSERT INTO `dt_organize` VALUES ('29', '0', 'SDSK001', ',29,', '1', '未来网络事业部', '未来网络事业部', '', '', '', null, '', '', '', '1', '1', '', '99', '2019-05-21 11:12:40');
INSERT INTO `dt_organize` VALUES ('30', '0', 'A07', ',30,', '1', '应急管理事业部', '应急管理事业部', '', '郝本明', '', null, '', '', '', '1', '1', '', '99', '2019-09-19 15:28:00');
INSERT INTO `dt_organize` VALUES ('31', '0', 'test', ',31,', '1', '人力资源部', '人力资源部', '', '', '', null, '', '', '', '1', '1', '', '99', '2020-01-08 16:18:25');
INSERT INTO `dt_organize` VALUES ('32', '0', '1', ',32,', '1', '未来网络事业部', '未来网络事业部', '', '', '', null, '', '', '', '1', '1', '', '99', '2020-04-07 10:15:41');

-- ----------------------------
-- Table structure for dt_organize_member
-- ----------------------------
DROP TABLE IF EXISTS `dt_organize_member`;
CREATE TABLE `dt_organize_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `organize_id` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_organize_member
-- ----------------------------
INSERT INTO `dt_organize_member` VALUES ('1', '3', '32', '99', '2020-04-03 16:11:32');
INSERT INTO `dt_organize_member` VALUES ('2', '4', '32', '99', '2020-04-03 16:12:35');
INSERT INTO `dt_organize_member` VALUES ('3', '5', '32', '99', '2020-04-03 16:14:14');
INSERT INTO `dt_organize_member` VALUES ('4', '6', '32', '99', '2020-04-03 16:15:15');
INSERT INTO `dt_organize_member` VALUES ('5', '7', '32', '99', '2020-04-03 16:16:45');
INSERT INTO `dt_organize_member` VALUES ('6', '8', '32', '99', '2020-04-03 16:17:44');
INSERT INTO `dt_organize_member` VALUES ('7', '9', '32', '99', '2020-04-03 16:18:53');
INSERT INTO `dt_organize_member` VALUES ('8', '10', '32', '99', '2020-04-03 16:21:38');
INSERT INTO `dt_organize_member` VALUES ('9', '11', '32', '99', '2020-04-03 16:23:06');
INSERT INTO `dt_organize_member` VALUES ('10', '12', '32', '99', '2020-04-03 16:25:03');
INSERT INTO `dt_organize_member` VALUES ('11', '13', '32', '99', '2020-04-03 16:28:29');
INSERT INTO `dt_organize_member` VALUES ('12', '14', '32', '99', '2020-04-03 17:48:27');
INSERT INTO `dt_organize_member` VALUES ('13', '15', '32', '99', '2020-04-03 17:51:29');
INSERT INTO `dt_organize_member` VALUES ('14', '16', '32', '99', '2020-04-07 10:21:20');
INSERT INTO `dt_organize_member` VALUES ('15', '17', '32', '99', '2020-04-07 10:23:33');
INSERT INTO `dt_organize_member` VALUES ('16', '18', '32', '99', '2020-04-15 19:01:26');
INSERT INTO `dt_organize_member` VALUES ('17', '19', '32', '99', '2020-04-20 09:54:22');
INSERT INTO `dt_organize_member` VALUES ('18', '20', '32', '99', '2020-04-22 13:57:02');
INSERT INTO `dt_organize_member` VALUES ('19', '21', '32', '99', '2020-04-22 14:01:07');
INSERT INTO `dt_organize_member` VALUES ('20', '22', '32', '99', '2020-04-29 11:31:34');
INSERT INTO `dt_organize_member` VALUES ('21', '23', '32', '99', '2020-04-29 11:32:56');
INSERT INTO `dt_organize_member` VALUES ('22', '24', '32', '99', '2020-06-01 18:11:18');
INSERT INTO `dt_organize_member` VALUES ('23', '25', '32', '99', '2020-06-24 09:51:24');
INSERT INTO `dt_organize_member` VALUES ('24', '26', '32', '99', '2020-06-24 09:52:38');
INSERT INTO `dt_organize_member` VALUES ('25', '27', '29', '99', '2020-06-28 10:33:12');
INSERT INTO `dt_organize_member` VALUES ('26', '28', '29', '99', '2020-07-02 11:05:56');
INSERT INTO `dt_organize_member` VALUES ('27', '29', '32', '99', '2020-07-13 09:35:25');
INSERT INTO `dt_organize_member` VALUES ('28', '30', '32', '99', '2020-07-13 09:36:01');
INSERT INTO `dt_organize_member` VALUES ('29', '31', '32', '99', '2020-07-15 09:00:31');
INSERT INTO `dt_organize_member` VALUES ('30', '32', '32', '99', '2020-07-27 11:23:00');
INSERT INTO `dt_organize_member` VALUES ('31', '33', '32', '99', '2020-07-27 11:23:30');

-- ----------------------------
-- Table structure for dt_product_info
-- ----------------------------
DROP TABLE IF EXISTS `dt_product_info`;
CREATE TABLE `dt_product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_manage_id` int(11) NOT NULL,
  `infoname` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `danwei` longtext,
  `edition` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_product_info
-- ----------------------------

-- ----------------------------
-- Table structure for dt_product_manage
-- ----------------------------
DROP TABLE IF EXISTS `dt_product_manage`;
CREATE TABLE `dt_product_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `developtime` datetime NOT NULL,
  `personincharge` varchar(200) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_product_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project
-- ----------------------------
DROP TABLE IF EXISTS `dt_project`;
CREATE TABLE `dt_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `contract_number` longtext,
  `name` varchar(200) DEFAULT NULL,
  `address` longtext,
  `business_unit` longtext,
  `type` varchar(50) DEFAULT NULL,
  `contract_subject` longtext,
  `own_area` longtext,
  `customer_type` longtext,
  `contract_product_type` longtext,
  `contract_value_type` longtext,
  `contract_value` double NOT NULL,
  `value_desc` longtext,
  `customer_name` longtext,
  `customer_phone` longtext,
  `contact_person` longtext,
  `contact_tel` longtext,
  `customer_address` longtext,
  `project_aacquisition_method` longtext,
  `project_aacquisition_date` datetime NOT NULL,
  `contract_sign_date` datetime NOT NULL,
  `contract_period` longtext,
  `contract_deadline` datetime NOT NULL,
  `contract_content` longtext,
  `acceptance_method` longtext,
  `payment_term` longtext,
  `all_address` longtext,
  `plan_total_workinghours` double NOT NULL,
  `project_time` datetime NOT NULL,
  `fields` longtext,
  `contract_title` longtext,
  `project_budget` decimal(18,2) NOT NULL,
  `contract_deposit` double NOT NULL,
  `customer_company` longtext,
  `estimation_project_complete_date` longtext,
  `estimation_check_date` longtext,
  `time_into_factory` longtext,
  `implement_process` longtext,
  `implement_process_ratio` longtext,
  `is_satisfy_condition` longtext,
  `satisfy_pay_condition_code` longtext,
  `quality_test` longtext,
  `contract_achievement_backups_check` longtext,
  `is_have_epiboly` longtext,
  `pass_check_content` longtext,
  `last_chcek_time` longtext,
  `finally_chcek_time` longtext,
  `settle_lawsuit` longtext,
  `settle_time` longtext,
  `sale_after_end_date` longtext,
  `sale_after_date` longtext,
  `departmentId` longtext,
  `valid_contract_money` decimal(18,2) NOT NULL,
  `province` longtext,
  `city` longtext,
  `county` longtext,
  `is_in_out_project` longtext,
  `complete_settle_time` datetime NOT NULL,
  `contract_send_time` datetime NOT NULL,
  `contract_recycle_time` datetime NOT NULL,
  `contract_pigeonhole_time` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `project_out_manager_id` int(11) NOT NULL,
  `project_status` longtext,
  `project_process` longtext,
  `end_remark` longtext,
  `end_delivery_time` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_manager_id` (`project_manager_id`),
  CONSTRAINT `dt_project_project_manager` FOREIGN KEY (`project_manager_id`) REFERENCES `dt_manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project
-- ----------------------------
INSERT INTO `dt_project` VALUES ('1', '', '', 'FID未知技术研发费用 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '2020-04-07 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '29', '0.00', '', '', '', '签约', '2020-06-30 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '4', '实施中', null, '请选择', '', '99', '2020-04-03 17:56:48');
INSERT INTO `dt_project` VALUES ('6', '', '', 'FID日常工作 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '8', '实施中', null, '请选择', '', '99', '2020-04-07 10:27:48');
INSERT INTO `dt_project` VALUES ('7', '', '', 'FID未知市场开拓 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '9', '实施中', null, '请选择', '', '99', '2020-04-07 10:31:37');
INSERT INTO `dt_project` VALUES ('8', '', '', 'FID协助其他事业部研发 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '1', '实施中', null, '请选择', '', '99', '2020-04-07 10:36:48');
INSERT INTO `dt_project` VALUES ('9', '', '', 'FID中山合资公司日常研发工作 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '1', '实施中', null, '请选择', '', '99', '2020-04-07 10:38:01');
INSERT INTO `dt_project` VALUES ('10', '', '', 'FID常州10km高精地图项目 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '4', '实施中', null, '请选择', '', '99', '2020-04-07 10:39:22');
INSERT INTO `dt_project` VALUES ('11', '', '', 'FID海口公安指挥中心研发项目 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '1', '实施中', null, '请选择', '', '99', '2020-04-07 10:41:08');
INSERT INTO `dt_project` VALUES ('12', '', '', 'FID中山翠亨智慧城市二期-华为标 预立项（2020）', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '1', '实施中', null, '请选择', '', '99', '2020-04-07 10:42:30');
INSERT INTO `dt_project` VALUES ('13', '', '', 'FID日常研发工作 预立项', null, '', '请选择', '请选择', '请选择', '请选择', '请选择', '请选择', '0', '', '', '', '', '', '', '请选择', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', '1970-01-01 00:00:00', '', '请选择', '', '', '0', '1970-01-01 00:00:00', '请选择', '', '0.00', '0', '', '', '', '', '', '', '请选择', '', '', '', '请选择', null, '', '', '请选择', '', '', '', '32', '0.00', '', '', '', '签约', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00', '0', '2', '4', '实施中', null, '请选择', '', '99', '2020-04-15 18:59:42');

-- ----------------------------
-- Table structure for dt_project_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_attach`;
CREATE TABLE `dt_project_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `down_num` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_attachs` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_cost
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_cost`;
CREATE TABLE `dt_project_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `implement_cost` decimal(18,2) NOT NULL,
  `artificial_cost` decimal(18,2) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_cost_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_cost
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_estimate
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_estimate`;
CREATE TABLE `dt_project_estimate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `ht_value` decimal(18,2) NOT NULL,
  `estimated_purchase_cost` decimal(18,2) NOT NULL,
  `estimated_implementation_cost` decimal(18,2) NOT NULL,
  `outsource_cost` decimal(18,2) NOT NULL,
  `pre_sales_cost` decimal(18,2) NOT NULL,
  `tax_rate` longtext,
  `expected_gross_margin` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_estimate_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_estimate
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_estimate_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_estimate_attach`;
CREATE TABLE `dt_project_estimate_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_estimate_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_estimate_id` (`project_estimate_id`),
  CONSTRAINT `dt_project_estimate_attachs` FOREIGN KEY (`project_estimate_id`) REFERENCES `dt_project_estimate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_estimate_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_invoice
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_invoice`;
CREATE TABLE `dt_project_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `apply_date` datetime NOT NULL,
  `contract_title` longtext,
  `invoice_type` varchar(50) DEFAULT NULL,
  `contract_value` decimal(18,2) NOT NULL,
  `number` longtext,
  `apply_value` decimal(18,2) NOT NULL,
  `description` longtext,
  `customer_name` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_item
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_item`;
CREATE TABLE `dt_project_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `ratio` double NOT NULL,
  `deadline` datetime NOT NULL,
  `description` longtext,
  `item_manager_id` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_item_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_item
-- ----------------------------
INSERT INTO `dt_project_item` VALUES ('1', '1', '三维重建', '40', '2020-06-30 00:00:00', '开发一套地图编译工具，能够实现传统工程数据及空间数据到高精地图数据格式的转换', '3', '99', '2020-04-03 18:53:45');
INSERT INTO `dt_project_item` VALUES ('3', '1', '高精地图编译', '60', '2020-06-10 00:00:00', '按照国家规范生产一套全要素的高精地图数据', '5', '99', '2020-04-07 09:42:03');
INSERT INTO `dt_project_item` VALUES ('4', '6', '财务管理', '0', '2020-04-07 10:58:49', '', '8', '99', '2020-04-07 10:58:49');
INSERT INTO `dt_project_item` VALUES ('5', '6', '人员招聘', '0', '2020-04-07 10:59:42', '', '8', '99', '2020-04-07 10:59:42');
INSERT INTO `dt_project_item` VALUES ('6', '6', '人员培训', '0', '2020-04-07 11:00:17', '', '8', '99', '2020-04-07 11:00:17');
INSERT INTO `dt_project_item` VALUES ('7', '6', '考勤绩效薪资', '0', '2020-04-07 11:01:13', '', '8', '99', '2020-04-07 11:00:50');
INSERT INTO `dt_project_item` VALUES ('8', '6', '员工关系', '0', '2020-04-07 11:02:33', '', '8', '99', '2020-04-07 11:02:33');
INSERT INTO `dt_project_item` VALUES ('9', '6', '五险一金', '0', '2020-04-07 11:03:10', '', '8', '99', '2020-04-07 11:03:10');
INSERT INTO `dt_project_item` VALUES ('10', '6', '企业文化', '0', '2020-04-07 11:03:57', '', '8', '99', '2020-04-07 11:03:57');
INSERT INTO `dt_project_item` VALUES ('11', '6', '职称评审', '0', '2020-04-07 11:04:46', '', '8', '99', '2020-04-07 11:04:46');
INSERT INTO `dt_project_item` VALUES ('12', '6', '固定资产管理', '0', '2020-04-07 11:05:29', '', '8', '99', '2020-04-07 11:05:29');
INSERT INTO `dt_project_item` VALUES ('13', '6', '耗材管理', '0', '2020-04-07 11:05:56', '', '8', '99', '2020-04-07 11:05:56');
INSERT INTO `dt_project_item` VALUES ('14', '6', '报表管理', '0', '2020-04-07 11:06:31', '', '8', '99', '2020-04-07 11:06:31');
INSERT INTO `dt_project_item` VALUES ('15', '6', '外勤', '0', '2020-04-07 11:06:52', '', '8', '99', '2020-04-07 11:06:52');
INSERT INTO `dt_project_item` VALUES ('16', '6', '商务接待', '0', '2020-04-07 11:07:17', '', '8', '99', '2020-04-07 11:07:17');
INSERT INTO `dt_project_item` VALUES ('17', '6', '技术交流', '0', '2020-04-07 11:08:37', '', '8', '99', '2020-04-07 11:08:37');
INSERT INTO `dt_project_item` VALUES ('18', '6', '党务工作', '0', '2020-04-07 11:09:03', '', '8', '99', '2020-04-07 11:09:03');
INSERT INTO `dt_project_item` VALUES ('19', '6', '会议', '0', '2020-04-07 00:00:00', '', '8', '99', '2020-04-07 11:09:35');
INSERT INTO `dt_project_item` VALUES ('20', '6', '运营系统管理', '0', '2020-04-07 11:10:12', '', '8', '99', '2020-04-07 11:10:12');
INSERT INTO `dt_project_item` VALUES ('21', '6', '项目物资采购', '0', '2020-04-07 11:10:56', '', '8', '99', '2020-04-07 11:10:56');
INSERT INTO `dt_project_item` VALUES ('22', '6', '日常物资采购', '0', '2020-04-07 11:11:48', '', '8', '99', '2020-04-07 11:11:48');
INSERT INTO `dt_project_item` VALUES ('23', '6', '项目支持', '0', '2020-04-07 11:12:20', '', '8', '99', '2020-04-07 11:12:20');
INSERT INTO `dt_project_item` VALUES ('24', '6', '项目管理', '0', '2020-04-07 11:12:48', '', '8', '99', '2020-04-07 11:12:48');
INSERT INTO `dt_project_item` VALUES ('25', '7', '潜在项目', '0', '2020-04-07 11:16:30', '', '9', '99', '2020-04-07 11:16:30');
INSERT INTO `dt_project_item` VALUES ('26', '7', '宣传册制作', '0', '2020-04-07 11:16:57', '', '9', '99', '2020-04-07 11:16:57');
INSERT INTO `dt_project_item` VALUES ('27', '7', 'DEMO制作', '0', '2020-04-07 11:17:48', '', '9', '99', '2020-04-07 11:17:48');
INSERT INTO `dt_project_item` VALUES ('28', '7', '商务拜访', '0', '2020-04-07 11:18:43', '', '9', '99', '2020-04-07 11:18:43');
INSERT INTO `dt_project_item` VALUES ('29', '7', '市场拓展', '0', '2020-04-07 11:19:44', '', '9', '99', '2020-04-07 11:19:44');
INSERT INTO `dt_project_item` VALUES ('30', '7', '招、投标', '0', '2020-04-07 11:20:26', '', '9', '99', '2020-04-07 11:20:26');
INSERT INTO `dt_project_item` VALUES ('31', '7', '市场信息收集', '0', '2020-04-07 11:21:08', '', '9', '99', '2020-04-07 11:21:08');
INSERT INTO `dt_project_item` VALUES ('32', '1', '产品指导和规划', '0', '2020-04-07 11:28:30', '', '4', '99', '2020-04-07 11:28:30');
INSERT INTO `dt_project_item` VALUES ('33', '1', '产品概要设计', '0', '2020-04-07 11:28:57', '', '4', '99', '2020-04-07 11:28:57');
INSERT INTO `dt_project_item` VALUES ('34', '1', '参与解决方案制作', '0', '2020-04-07 11:29:34', '', '4', '99', '2020-04-07 11:29:34');
INSERT INTO `dt_project_item` VALUES ('35', '1', '竞争分析以及国内政策和标准的收集', '0', '2020-04-07 11:30:37', '', '4', '99', '2020-04-07 11:30:37');
INSERT INTO `dt_project_item` VALUES ('36', '1', '自动驾驶仿真模拟', '0', '2020-04-07 11:31:18', '', '4', '99', '2020-04-07 11:31:18');
INSERT INTO `dt_project_item` VALUES ('37', '1', '自动驾驶视觉', '0', '2020-04-07 11:32:24', '', '7', '99', '2020-04-07 11:32:24');
INSERT INTO `dt_project_item` VALUES ('38', '1', '协助高精地图生产', '0', '2020-04-07 11:33:14', '', '7', '99', '2020-04-07 11:33:14');
INSERT INTO `dt_project_item` VALUES ('39', '8', '民政民生事业部', '0', '2020-04-07 11:41:15', '', '1', '99', '2020-04-07 11:41:15');
INSERT INTO `dt_project_item` VALUES ('40', '8', '自然资源事业部', '0', '2020-04-07 11:41:41', '', '1', '99', '2020-04-07 11:41:41');
INSERT INTO `dt_project_item` VALUES ('41', '8', '应急管理事业部', '0', '2020-04-07 11:42:04', '', '1', '99', '2020-04-07 11:42:04');
INSERT INTO `dt_project_item` VALUES ('42', '8', '内部控制委员会', '0', '2020-04-07 11:42:31', '', '1', '99', '2020-04-07 11:42:31');
INSERT INTO `dt_project_item` VALUES ('43', '8', '军工防务事业部', '0', '2020-04-07 11:43:01', '', '1', '99', '2020-04-07 11:43:01');
INSERT INTO `dt_project_item` VALUES ('44', '8', '时空大数据事业部', '0', '2020-04-07 11:43:29', '', '1', '99', '2020-04-07 11:43:29');
INSERT INTO `dt_project_item` VALUES ('45', '9', '日常工作', '0', '2020-04-07 11:48:02', '', '1', '99', '2020-04-07 11:48:02');
INSERT INTO `dt_project_item` VALUES ('46', '10', '具体工作', '0', '2020-04-07 00:00:00', '', '5', '99', '2020-04-07 11:48:51');
INSERT INTO `dt_project_item` VALUES ('47', '11', '具体工作', '0', '2020-04-07 00:00:00', '', '1', '99', '2020-04-07 11:49:16');
INSERT INTO `dt_project_item` VALUES ('48', '12', '具体工作', '0', '2020-04-07 00:00:00', '', '1', '99', '2020-04-07 11:49:33');
INSERT INTO `dt_project_item` VALUES ('49', '13', '研发工作', '1', '2020-04-20 10:01:49', '1', '2', '99', '2020-04-20 10:01:49');
INSERT INTO `dt_project_item` VALUES ('50', '6', '行政工作', '0', '2020-04-21 15:25:44', '', '8', '99', '2020-04-21 15:25:44');
INSERT INTO `dt_project_item` VALUES ('51', '6', '人事工作', '0', '2020-04-21 15:26:03', '', '8', '99', '2020-04-21 15:26:03');

-- ----------------------------
-- Table structure for dt_project_landmark
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_landmark`;
CREATE TABLE `dt_project_landmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_item_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ratio` double NOT NULL,
  `iscompleted` tinyint(1) NOT NULL,
  `description` longtext,
  `complete_time` datetime DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  KEY `project_item_id` (`project_item_id`),
  CONSTRAINT `dt_project_landmark_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dt_project_landmark_project_item` FOREIGN KEY (`project_item_id`) REFERENCES `dt_project_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_landmark
-- ----------------------------
INSERT INTO `dt_project_landmark` VALUES ('1', '1', '3', '常州ITSC数据生产', '0', '1', '按照常州ITSC的数据标准，采用TopoDot生产了高精度的三维数据，提交了GeoJson和Shapefile数据', '2020-03-25 09:44:15', '99', '2020-04-07 09:44:30');
INSERT INTO `dt_project_landmark` VALUES ('2', '10', '46', '完成数据采集及技术支撑', '100', '1', '按照常州ITSC的数据标准，采用TopoDot生产了高精度的三维数据，提交了GeoJson和Shapefile数据', '2020-03-26 09:03:05', '99', '2020-04-08 09:03:15');

-- ----------------------------
-- Table structure for dt_project_landmark_album
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_landmark_album`;
CREATE TABLE `dt_project_landmark_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_landmark_id` int(11) NOT NULL,
  `thumb_path` varchar(255) DEFAULT NULL,
  `original_path` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_landmark_id` (`project_landmark_id`),
  CONSTRAINT `dt_project_landmark_albums` FOREIGN KEY (`project_landmark_id`) REFERENCES `dt_project_landmark` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_landmark_album
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_landmark_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_landmark_attach`;
CREATE TABLE `dt_project_landmark_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_landmark_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_landmark_id` (`project_landmark_id`),
  CONSTRAINT `dt_project_landmark_attachs` FOREIGN KEY (`project_landmark_id`) REFERENCES `dt_project_landmark` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_landmark_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_member
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_member`;
CREATE TABLE `dt_project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ismanager` tinyint(1) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_member
-- ----------------------------
INSERT INTO `dt_project_member` VALUES ('1', '3', '1', '0', '99', '2020-04-03 17:56:48');
INSERT INTO `dt_project_member` VALUES ('2', '4', '1', '1', '99', '2020-04-03 17:56:48');
INSERT INTO `dt_project_member` VALUES ('3', '5', '1', '0', '99', '2020-04-03 18:56:08');
INSERT INTO `dt_project_member` VALUES ('4', '6', '2', '1', '99', '2020-04-07 09:02:42');
INSERT INTO `dt_project_member` VALUES ('5', '4', '2', '1', '99', '2020-04-07 09:02:42');
INSERT INTO `dt_project_member` VALUES ('6', '10', '3', '1', '99', '2020-04-07 09:08:28');
INSERT INTO `dt_project_member` VALUES ('7', '9', '3', '1', '99', '2020-04-07 09:08:28');
INSERT INTO `dt_project_member` VALUES ('8', '11', '3', '0', '99', '2020-04-07 09:11:54');
INSERT INTO `dt_project_member` VALUES ('9', '12', '3', '0', '99', '2020-04-07 09:11:54');
INSERT INTO `dt_project_member` VALUES ('10', '4', '4', '1', '99', '2020-04-07 09:18:31');
INSERT INTO `dt_project_member` VALUES ('11', '7', '4', '1', '99', '2020-04-07 09:18:31');
INSERT INTO `dt_project_member` VALUES ('12', '1', '5', '1', '99', '2020-04-07 09:22:57');
INSERT INTO `dt_project_member` VALUES ('13', '8', '5', '1', '99', '2020-04-07 09:22:57');
INSERT INTO `dt_project_member` VALUES ('14', '17', '6', '0', '99', '2020-04-07 10:27:48');
INSERT INTO `dt_project_member` VALUES ('15', '8', '6', '1', '99', '2020-04-07 10:27:48');
INSERT INTO `dt_project_member` VALUES ('16', '11', '7', '0', '99', '2020-04-07 10:31:37');
INSERT INTO `dt_project_member` VALUES ('17', '9', '7', '1', '99', '2020-04-07 10:31:37');
INSERT INTO `dt_project_member` VALUES ('18', '2', '8', '1', '99', '2020-04-07 10:36:48');
INSERT INTO `dt_project_member` VALUES ('19', '1', '8', '1', '99', '2020-04-07 10:36:48');
INSERT INTO `dt_project_member` VALUES ('20', '2', '9', '1', '99', '2020-04-07 10:38:01');
INSERT INTO `dt_project_member` VALUES ('21', '1', '9', '1', '99', '2020-04-07 10:38:01');
INSERT INTO `dt_project_member` VALUES ('22', '5', '10', '0', '99', '2020-04-07 10:39:22');
INSERT INTO `dt_project_member` VALUES ('23', '4', '10', '1', '99', '2020-04-07 10:39:22');
INSERT INTO `dt_project_member` VALUES ('24', '2', '11', '1', '99', '2020-04-07 10:41:08');
INSERT INTO `dt_project_member` VALUES ('25', '1', '11', '1', '99', '2020-04-07 10:41:08');
INSERT INTO `dt_project_member` VALUES ('26', '2', '12', '1', '99', '2020-04-07 10:42:30');
INSERT INTO `dt_project_member` VALUES ('27', '1', '12', '1', '99', '2020-04-07 10:42:30');
INSERT INTO `dt_project_member` VALUES ('28', '10', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('29', '5', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('30', '11', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('31', '16', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('32', '14', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('33', '7', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('34', '6', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('35', '9', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('36', '4', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('37', '3', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('38', '15', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('39', '17', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('40', '13', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('41', '8', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('42', '12', '12', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('43', '10', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('44', '5', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('45', '11', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('46', '16', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('47', '14', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('48', '7', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('49', '6', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('50', '9', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('51', '4', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('52', '3', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('53', '15', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('54', '17', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('55', '13', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('56', '8', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('57', '12', '11', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('58', '10', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('59', '11', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('60', '16', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('61', '14', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('62', '7', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('63', '6', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('64', '9', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('65', '3', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('66', '15', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('67', '17', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('68', '13', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('69', '8', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('70', '12', '10', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('71', '10', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('72', '5', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('73', '11', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('74', '16', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('75', '14', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('76', '7', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('77', '6', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('78', '9', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('79', '4', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('80', '3', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('81', '15', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('82', '17', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('83', '13', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('84', '8', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('85', '12', '9', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('86', '10', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('87', '5', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('88', '11', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('89', '16', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('90', '14', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('91', '7', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('92', '6', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('93', '9', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('94', '4', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('95', '3', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('96', '15', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('97', '17', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('98', '13', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('99', '8', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('100', '12', '8', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('101', '10', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('102', '5', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('103', '16', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('104', '14', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('105', '7', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('106', '6', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('107', '4', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('108', '3', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('109', '15', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('110', '17', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('111', '13', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('112', '8', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('113', '12', '7', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('114', '10', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('115', '5', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('116', '11', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('117', '16', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('118', '14', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('119', '7', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('120', '6', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('121', '9', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('122', '4', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('123', '3', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('124', '15', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('125', '13', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('126', '12', '6', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('127', '10', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('128', '11', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('129', '16', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('130', '14', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('131', '7', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('132', '6', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('133', '9', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('134', '15', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('135', '17', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('136', '13', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('137', '8', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('138', '12', '1', '0', '99', '2020-04-07 10:45:37');
INSERT INTO `dt_project_member` VALUES ('139', '2', '10', '1', '99', '2020-04-07 14:17:05');
INSERT INTO `dt_project_member` VALUES ('140', '2', '7', '1', '99', '2020-04-07 14:17:19');
INSERT INTO `dt_project_member` VALUES ('141', '2', '6', '1', '99', '2020-04-07 14:17:34');
INSERT INTO `dt_project_member` VALUES ('142', '2', '1', '1', '99', '2020-04-07 14:17:45');
INSERT INTO `dt_project_member` VALUES ('143', '2', '13', '1', '99', '2020-04-15 18:59:42');
INSERT INTO `dt_project_member` VALUES ('144', '4', '13', '1', '99', '2020-04-15 18:59:42');
INSERT INTO `dt_project_member` VALUES ('145', '18', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('146', '10', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('147', '5', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('148', '11', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('149', '16', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('150', '14', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('151', '7', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('152', '6', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('153', '9', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('154', '3', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('155', '15', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('156', '17', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('157', '13', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('158', '8', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('159', '12', '13', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('160', '18', '12', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('161', '18', '11', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('162', '18', '10', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('163', '18', '9', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('164', '18', '8', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('165', '18', '7', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('166', '18', '6', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('167', '18', '1', '0', '99', '2020-04-15 19:02:28');
INSERT INTO `dt_project_member` VALUES ('168', '19', '13', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('169', '19', '12', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('170', '19', '11', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('171', '19', '10', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('172', '19', '9', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('173', '19', '8', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('174', '19', '7', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('175', '19', '6', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('176', '19', '1', '0', '99', '2020-04-20 09:55:43');
INSERT INTO `dt_project_member` VALUES ('177', '20', '13', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('178', '20', '12', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('179', '20', '11', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('180', '20', '10', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('181', '20', '9', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('182', '20', '8', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('183', '20', '7', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('184', '20', '6', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('185', '20', '1', '0', '99', '2020-04-22 13:57:31');
INSERT INTO `dt_project_member` VALUES ('186', '21', '13', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('187', '21', '12', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('188', '21', '11', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('189', '21', '10', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('190', '21', '9', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('191', '21', '8', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('192', '21', '7', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('193', '21', '6', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('194', '21', '1', '0', '99', '2020-04-22 14:01:22');
INSERT INTO `dt_project_member` VALUES ('195', '23', '13', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('196', '22', '13', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('197', '23', '12', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('198', '22', '12', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('199', '23', '11', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('200', '22', '11', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('201', '23', '10', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('202', '22', '10', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('203', '23', '9', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('204', '22', '9', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('205', '23', '8', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('206', '22', '8', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('207', '23', '7', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('208', '22', '7', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('209', '23', '6', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('210', '22', '6', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('211', '23', '1', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('212', '22', '1', '0', '99', '2020-04-29 11:33:20');
INSERT INTO `dt_project_member` VALUES ('213', '24', '13', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('214', '24', '12', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('215', '24', '11', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('216', '24', '10', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('217', '24', '9', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('218', '24', '8', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('219', '24', '7', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('220', '24', '6', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('221', '24', '1', '0', '99', '2020-06-02 11:06:42');
INSERT INTO `dt_project_member` VALUES ('222', '25', '13', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('223', '25', '12', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('224', '25', '11', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('225', '25', '10', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('226', '25', '9', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('227', '25', '8', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('228', '25', '7', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('229', '25', '1', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('230', '25', '6', '0', '99', '2020-06-24 09:51:59');
INSERT INTO `dt_project_member` VALUES ('231', '26', '13', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('232', '26', '12', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('233', '26', '11', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('234', '26', '10', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('235', '26', '9', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('236', '26', '8', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('237', '26', '7', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('238', '26', '6', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('239', '26', '1', '0', '99', '2020-06-24 09:52:54');
INSERT INTO `dt_project_member` VALUES ('240', '27', '13', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('241', '27', '12', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('242', '27', '11', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('243', '27', '10', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('244', '27', '9', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('245', '27', '8', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('246', '27', '7', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('247', '27', '6', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('248', '27', '1', '0', '99', '2020-06-28 10:33:33');
INSERT INTO `dt_project_member` VALUES ('249', '28', '13', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('250', '28', '12', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('251', '28', '11', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('252', '28', '10', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('253', '28', '9', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('254', '28', '8', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('255', '28', '7', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('256', '28', '6', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('257', '28', '1', '0', '99', '2020-07-02 11:06:20');
INSERT INTO `dt_project_member` VALUES ('258', '29', '13', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('259', '30', '13', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('260', '29', '12', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('261', '30', '12', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('262', '29', '11', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('263', '30', '11', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('264', '29', '10', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('265', '30', '10', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('266', '29', '9', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('267', '30', '9', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('268', '29', '8', '0', '99', '2020-07-13 09:36:47');
INSERT INTO `dt_project_member` VALUES ('269', '30', '8', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('270', '29', '7', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('271', '30', '7', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('272', '29', '6', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('273', '30', '6', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('274', '29', '1', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('275', '30', '1', '0', '99', '2020-07-13 09:36:48');
INSERT INTO `dt_project_member` VALUES ('276', '31', '13', '0', '99', '2020-07-15 09:00:56');
INSERT INTO `dt_project_member` VALUES ('277', '31', '12', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('278', '31', '11', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('279', '31', '10', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('280', '31', '9', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('281', '31', '8', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('282', '31', '7', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('283', '31', '6', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('284', '31', '1', '0', '99', '2020-07-15 09:00:57');
INSERT INTO `dt_project_member` VALUES ('285', '32', '13', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('286', '33', '13', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('287', '32', '12', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('288', '33', '12', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('289', '32', '11', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('290', '33', '11', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('291', '32', '10', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('292', '33', '10', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('293', '32', '9', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('294', '33', '9', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('295', '32', '8', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('296', '33', '8', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('297', '32', '7', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('298', '33', '7', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('299', '32', '6', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('300', '33', '6', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('301', '32', '1', '0', '99', '2020-07-27 11:23:52');
INSERT INTO `dt_project_member` VALUES ('302', '33', '1', '0', '99', '2020-07-27 11:23:52');

-- ----------------------------
-- Table structure for dt_project_note
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_note`;
CREATE TABLE `dt_project_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `trade_date` datetime NOT NULL,
  `trade_number` longtext,
  `type` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `real_money` decimal(18,3) NOT NULL,
  `expenditure_items` longtext,
  `dengjishijian` datetime NOT NULL,
  `shenpishijian` datetime NOT NULL,
  `shoujianriqi` datetime NOT NULL,
  `toudifangshi` longtext,
  `lingkuanren` longtext,
  `tianxieriqi` datetime NOT NULL,
  `feiyongkemu` varchar(50) DEFAULT NULL,
  `baoxiaoneirong` longtext,
  `ruzhangshiyou` longtext,
  `gongtanfeiyongguishu` longtext,
  `guishubumen` longtext,
  `yijiaocaiwushijian` datetime NOT NULL,
  `beizhu` longtext,
  `str1` longtext,
  `str2` longtext,
  `promoter` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_note_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_note
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_receipt
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_receipt`;
CREATE TABLE `dt_project_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `pay_period` longtext,
  `pay_requirement` longtext,
  `ht_value` decimal(18,3) NOT NULL,
  `return_date` datetime NOT NULL,
  `pay_value` decimal(18,3) NOT NULL,
  `notpay_value` decimal(18,3) NOT NULL,
  `fuzeren` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dt_project_receipt_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_serve
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_serve`;
CREATE TABLE `dt_project_serve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` longtext,
  `city` longtext,
  `county` longtext,
  `manager_name` longtext,
  `serve_time` longtext,
  `serve_description` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_serve
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_serve_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_serve_attach`;
CREATE TABLE `dt_project_serve_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_serve_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `project_serve_id` (`project_serve_id`),
  CONSTRAINT `dt_project_serve_attachs` FOREIGN KEY (`project_serve_id`) REFERENCES `dt_project_serve` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_serve_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_store
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_store`;
CREATE TABLE `dt_project_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `projectstr` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_store
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_tail_remark
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_tail_remark`;
CREATE TABLE `dt_project_tail_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `content` longtext,
  `extend_field` longtext,
  `update_time` datetime NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_tail_remark
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_weekly_reports
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_weekly_reports`;
CREATE TABLE `dt_project_weekly_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `content` longtext,
  `extend_field` longtext,
  `update_time` datetime NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_weekly_reports
-- ----------------------------

-- ----------------------------
-- Table structure for dt_project_workinghour
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_workinghour`;
CREATE TABLE `dt_project_workinghour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_item_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `category` longtext,
  `content` longtext,
  `working_hour` double NOT NULL,
  `isaudit` tinyint(1) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `manager_id` (`manager_id`),
  KEY `project_id` (`project_id`),
  KEY `project_item_id` (`project_item_id`),
  CONSTRAINT `dt_project_workinghour_manager` FOREIGN KEY (`manager_id`) REFERENCES `dt_manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dt_project_workinghour_project` FOREIGN KEY (`project_id`) REFERENCES `dt_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dt_project_workinghour_project_item` FOREIGN KEY (`project_item_id`) REFERENCES `dt_project_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_workinghour
-- ----------------------------
INSERT INTO `dt_project_workinghour` VALUES ('1', '1', '3', '4', '1', '基于SpeedMap初步搭建地图编译平台', '4.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('2', '1', '38', '4', '1', '基于cloudcompare搭建点云及全景影像量测的软件，完成shapefile与全景影像的关联', '3', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('3', '1', '37', '7', '3', '专利保护中心改稿，修改专利', '7.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('4', '1', '37', '7', '4', '季度总结会，讨论研发方向', '3', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('5', '1', '37', '7', '1', '研究tt100k交通标志数据内部结构', '4.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('6', '1', '37', '7', '1', '研究tt100k转换成yolo数据集形式；研究CCTSDB种类太少放弃使用', '7.5', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('7', '1', '37', '7', '1', '新建模型定义的config文件，提取制作classes.names文件 ，训练yolov3', '7.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('8', '1', '37', '7', '1', '尝试解决内存溢出问题，换yolo代码测试', '7.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('9', '1', '37', '7', '1', '训练yolov3，调试Gaussian Yolov3', '7.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('10', '7', '31', '9', '3', '数据服务平台和测绘商场平台竞品分析报告框架拟定', '7.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('11', '7', '31', '9', '3', '数据服务平台和测绘商场平台竞品分析报告信息收集', '8.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('12', '7', '31', '9', '3', '数据服务平台和测绘商场平台竞品分析报告编写工作', '8.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('13', '7', '31', '9', '3', '数据服务平台和测绘商场平台竞品分析报告内部评审工作', '8', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('14', '7', '25', '9', '3', '中山翠亨新区智慧交通设计方案-进一步完善编写工作', '9', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('15', '7', '25', '9', '3', '中山翠亨新区智慧交通设计方案-内部评审工作', '7.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('16', '7', '25', '9', '3', '中山翠亨新区智慧交通设计方案-根据评审进一步完善并形成V1.0版本', '9', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('17', '7', '25', '9', '3', '中山翠亨新区智慧交通设计方案-根据评审进一步完善', '7.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('18', '6', '19', '8', '4', '参与总部行政周例会；事业部季度总结会的文档编写', '2', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('19', '6', '8', '8', '4', '新员工耿禹的入职手续办理；3月考勤表的制作与2月考勤情况的签字核实；社保减免后的2月工资表及成本分摊表的重新制作', '2.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('20', '6', '5', '8', '4', '事业部招聘海报的制作；招聘工作的开展及网站信息的更新', '2', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('21', '6', '22', '8', '4', '新员工耿禹显示器的采购；耿禹、温四琳和高恒娟的名片印制', '0.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('22', '6', '7', '8', '4', '绩效流程的填写；事业部绩效数据的汇总', '0.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('23', '6', '17', '8', '4', '对接中山郑曼，就近期招聘等工作进行沟通与交流', '0.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('24', '6', '19', '8', '4', '事业部季度总结会的组织', '3', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('25', '6', '8', '8', '4', '3月考勤表的制作与2月考勤情况的签字核实', '1', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('26', '6', '5', '8', '4', '招聘工作的开展', '1.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('27', '6', '12', '8', '4', '事业部固定资产盘点表的核实', '0.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('28', '6', '8', '8', '4', '五险一金账单的制作；社保费用的付款申请', '1', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('29', '6', '22', '8', '4', '事业部招待物资的采购', '0.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('30', '6', '19', '8', '4', '参与总部人事周例会并编写会议纪要', '1.5', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('31', '6', '14', '8', '4', '事业部周报、KPI跟进表、项目管理表、花名册、疫情期间复工情况表及下周会议纪要的编制', '3', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('32', '6', '5', '8', '4', '招聘工作的开展', '2', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('33', '6', '7', '8', '4', '事业部绩效的汇总及3月绩效表的填写', '1', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('38', '7', '31', '10', '1', '中山新区金融科技城智慧楼宇方案编写', '7.5', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('39', '7', '31', '10', '1', '中山新区金融科技城智慧楼宇方案编写', '9', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('40', '7', '31', '10', '1', '中山新区金融科技城智慧楼宇方案编写', '8', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('41', '7', '31', '10', '1', '产品概要设计脑图整理', '8', '0', '99', '2020-04-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('42', '7', '31', '10', '1', '产品概要设计文档编写', '8', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('43', '7', '31', '10', '1', '产品概要设计原型设计', '8', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('44', '7', '31', '10', '1', '产品概要设计原型设计', '8', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('45', '7', '31', '10', '1', '产品概要设计文档审核', '2', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('46', '7', '31', '10', '1', '产品概要设计脑图重新整理', '6', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('47', '6', '19', '8', '4', '事业部周例会的组织', '1', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('48', '6', '7', '8', '4', '3月薪资表的初稿制作', '1.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('49', '6', '14', '8', '4', '第一季度事业部培训情况的汇总', '0.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('50', '6', '8', '8', '4', '中山入职材料的审核，问题材料邮寄重新填写；吴畏调转的入离职材料的准备与填写指导', '1', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('51', '6', '5', '8', '4', '招聘工作的开展：候选人陆海芳、吴珩、张秀娇、何晨翔的约面沟通；张秀娇的初试安排', '3.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('52', '6', '17', '8', '4', '对接内控委张胜原就事业部调转等工作进行沟通；对接吕岑就意外险进行沟通', '1.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('53', '6', '5', '8', '4', '招聘工作的开展；候选人张秀娇的复试安排', '3', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('54', '6', '8', '8', '4', '耿禹、吴畏及郑曼入职材料的整理、扫描', '1.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('55', '6', '14', '8', '4', '事业部固定资产表的制作', '0.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('56', '6', '8', '8', '4', '员工公积金的转移', '0.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('57', '6', '12', '8', '4', '总部固定资产流转表的学习及台式机的流转申请', '0.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('58', '6', '5', '8', '4', '候选人何晨翔、吴珩、宁南鑫的面试安排；招聘工作的开展：候选人解顶林的约面沟通；报名参与广州大学线上招聘会并与就业办公司老师进行电话沟通', '6', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('59', '6', '7', '8', '4', '事业部3月工资表二稿的编制', '0.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('60', '6', '5', '8', '4', '张秀娇的录用前沟通及录用流程的提交；offer的发放', '1', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('61', '6', '19', '8', '4', '总部人事会议的参与', '1', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('62', '6', '14', '8', '4', '事业部花名册、周报、KPI跟进表、项目管理表及疫情期间复工人员情况表及下周会议纪要的编制', '2.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('63', '6', '7', '8', '4', '3月事业部成本分摊表的编制', '1', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('64', '6', '20', '8', '4', '工时系统的学习与编写，并对事业部人员进行指导', '2', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('65', '6', '5', '8', '4', '招聘工作的开展', '1', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('66', '1', '3', '4', '2', '根据国家高精地图试行规范，完成道路网图层规范说明调研，配合何海生产车道网测试数据', '6', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('67', '1', '3', '4', '1', '研发点云及全景影像量测软件，全景加载功能', '1.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('68', '1', '3', '4', '1', '基于speedMap搭建高精地图数据编译平台', '3', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('69', '1', '38', '4', '2', '完成数据库属性录入及数据更新', '4.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('70', '1', '38', '4', '1', '研发读取数据库及数据可视化功能', '7.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('71', '1', '38', '6', '1', '熟悉cloudcompare鼠标点选的代码', '7.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('72', '1', '3', '3', '1', '高精地图编译平台研发', '7.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('73', '1', '3', '3', '1', '高精地图编译平台研发，speedMap代码熟悉', '7.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('74', '1', '3', '3', '1', '基于SpeedMap高精地图编译平台研发，抽取类库及简化原有界面，实现代码重构', '7.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('75', '1', '3', '3', '1', '高精地图编译平台研发，数据库连接', '7.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('76', '1', '3', '5', '4', '1、参加部门周例会；2、学习使用Microstation等数据采集软件', '7.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('77', '1', '3', '5', '4', '学习高精度地图生产及如何与研发对接，录入数据库模板', '7.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('78', '1', '3', '5', '3', '学习高精度地图数据格式，录入数据库模板', '7.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('79', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、前期政策及相关类似企业方案收集。', '8', '0', '99', '2020-04-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('80', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、相关类似企业方案学习，88号文功能整理。2、季度例会3h.', '8.5', '0', '99', '2020-04-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('81', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的编写。', '8.5', '0', '99', '2020-04-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('82', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的编写与完善；2、周例会', '8.5', '0', '99', '2020-04-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('83', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的修改完善', '7.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('84', '7', '25', '12', '4', '泰兴恒润制药厂区 调研交流、会议纪要整理。', '7.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('85', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：投标方案编写', '11', '0', '99', '2020-04-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('86', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：投标方案编写与汇总', '12', '0', '99', '2020-04-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('87', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的修改', '9.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('88', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：投标方案汇总、修改、完善。', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('89', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT', '9.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('90', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT，学习相关知识点', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('91', '1', '37', '18', '4', '办理入职手续', '3', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('92', '1', '37', '18', '4', '阅读技术文档，熟悉相关业务', '4.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('93', '1', '37', '18', '4', '浏览相关技术网页，了解自动驾驶的有关知识', '3', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('94', '1', '37', '18', '4', '搜集下载有关智慧城市，自动驾驶等方面的论文', '2.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('95', '1', '37', '18', '4', '阅读论文', '2', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('96', '1', '3', '5', '3', '学习高精度地图数据格式，录入数据库模板', '7.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('97', '1', '37', '18', '4', '阅读论文', '2', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('98', '1', '37', '18', '4', '对基于视觉的自动驾驶中的感兴趣关方向进行搜索和调研', '5.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('99', '1', '3', '5', '3', '学习高精度地图数据格式，录入数据库模板及数据库字典，采集道路图层组测试数据', '4.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('100', '1', '3', '5', '3', '学习高精度地图生产要求，录入数据库模板及字典数据库', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('101', '1', '3', '5', '4', '常州ITSC10公里高精度地图项目数据补充采集', '3', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('102', '1', '37', '18', '4', '学习matlab软件平台的自动驾驶工具箱介绍', '4', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('104', '1', '37', '18', '4', 'matlab软件下载及安装和环境配置', '3.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('105', '1', '37', '18', '4', '使用matlab软件平台下的自动驾驶工具箱进行场景设计及仿真', '4.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('106', '1', '3', '5', '4', '常州ITSC10公里高精度地图项目数据补充采集', '7.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('107', '1', '3', '5', '4', '常州ITSC10公里高精度地图项目数据修改', '4.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('108', '1', '3', '5', '3', '学习高精度地图生产要求，录入数据库模板及字典数据库', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('109', '1', '3', '5', '3', '学习高精度地图生产要求，录入数据库模板及字典数据库', '3', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('110', '1', '3', '5', '3', '学习高精度地图生产要求，录入数据库模板及字典数据库', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('111', '1', '3', '5', '3', '学习高精度地图生产要求，录入数据库模板及字典数据库', '4.5', '0', '99', '2020-04-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('112', '1', '3', '5', '3', '根据数据库模板制作高精度地图测试数据', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('113', '1', '3', '5', '3', '根据数据库模板制作高精度地图测试数据', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('114', '6', '50', '8', '4', '采购事业部打印机碳粉；并研究京东，关联发票信息，以便后期采购物资。', '1', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('115', '6', '5', '8', '4', '1.候选人陈涛约面；2.解顶林下午15：00面试安排；3.上周面试情况的汇总与汇报；4.淮阴师范学院的招聘信息的发布，招聘宣讲材料的研究。', '3.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('116', '6', '8', '8', '4', '1.张秀娇入职材料的准备；2.子公司资质建设的咨询；3.3位员工失业登记的提醒与材料打印；4.是否有集体户口等问题的咨询。', '3', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('117', '6', '7', '8', '4', '3月薪资个税版的制作', '1', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('118', '6', '50', '8', '4', '固定资产流转单的学习与填写；事业部人员信息登记表的汇总与填写', '1.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('119', '6', '5', '8', '4', '招聘工作的开展；候选人宁南鑫、吴珩、解顶林的对接', '3', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('120', '6', '17', '8', '4', '与郑曼沟通事业部招聘工作', '0.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('121', '6', '10', '8', '4', '事业部素质拓展活动的规划及策划书的编写', '1.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('122', '6', '8', '8', '4', '张秀娇入职手续的办理、信息的录入、入职材料的整理', '2.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('123', '6', '10', '8', '4', '江苏省工信系统大数据支撑服务平台的注册', '0.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('124', '6', '50', '8', '4', '固定资产编号的盘点与汇总、日常行政事务的对接', '1.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('125', '6', '5', '8', '4', '招聘工作的开展；候选人陆海芳、宁南鑫、陈涛的面试沟通', '3', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('126', '6', '5', '8', '4', '宁南鑫的面试安排、招聘工作的开展', '3', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('127', '6', '50', '8', '4', '周报的编制，4月新入职员工及生日员工的信息汇总', '1.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('128', '6', '7', '8', '4', '薪资表中银行数据的填充', '0.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('129', '6', '17', '8', '4', '咨询张胜原有关公司针对年薪制等的规定', '1', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('130', '6', '8', '8', '4', '宁南鑫入职前的沟通、录用审批流程的提交、offer的发放、办公物资的需求汇总与采购', '1.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('131', '6', '5', '8', '4', '候选人陆海芳的面试及陈涛的面试安排、招聘工作的开展', '3', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('132', '6', '50', '8', '4', '名片夹、U盘等物资的采购，固定资产表、花名册、疫情期间复工表、周报、季报、KPI跟进表、项目管理表、会议纪要等表单的制作；日常行政事务的处理', '4', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('133', '6', '8', '8', '4', '解顶林入职前的沟通、录用审批流程的提交、offer的发放、办公用品的准备', '0.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('134', '6', '8', '8', '4', '宁南鑫的入职办理、信息录入、入职材料的整理，戚国华、解顶林入职材料的准备', '2.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('135', '6', '50', '8', '4', '周例会的开展、两台显示器的领用申请、宁南鑫台式机的组装、合同的打印与整理', '4', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('136', '6', '8', '8', '4', '社保的缴纳、与候选人陆海芳沟通三方签署事宜', '1', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('137', '6', '8', '8', '4', '戚国华的入职办理、信息录入、入职材料的整理，引导戚国华及宁南鑫熟悉OA等软件', '3', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('138', '6', '24', '19', '3', '周一入职,阅读资料,给电脑配置一下环境', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('139', '6', '24', '19', '1', '将tt100k数据集中的pad部分完善,记录归档出现的问题', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('140', '1', '37', '18', '4', '学习激光雷达与视觉传感器融合的相关知识', '3', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('141', '1', '37', '18', '4', '学习激光雷达、雷达的知识', '3', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('142', '1', '37', '18', '4', '学习激光雷达及视觉的融合', '4.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('143', '6', '24', '19', '1', '配置CorNet环境,阅读相关论文', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('144', '6', '24', '19', '1', '上午开始cooc数据集的转换工作,编写完coco的转换代码', '3', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('145', '1', '37', '18', '4', 'anaconda安装及tensorflow环境配置，pycharm安装', '3.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('146', '1', '37', '18', '4', '短期计划及技术调研报告书写', '4', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('147', '6', '24', '19', '1', '更改代码中出现的bug,根据数据要求修改相关代码', '4.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('148', '6', '24', '19', '1', '开始训练CornerNet', '3', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('149', '6', '24', '19', '3', '研读YOLO V4论文,源码', '4.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('150', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT;部门讨论；宣传册素材收集', '8.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('151', '7', '25', '12', '3', '泰兴恒润制药化工企业安全生产信息化管理平台：找投标文件，参考其他投标文件格式，细化技术功能', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('152', '7', '25', '12', '3', '泰兴恒润制药智慧化工安全生产信息平台：细化重大危险源、可燃有毒气体章节内容；周例会', '8.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('153', '7', '25', '12', '3', '泰兴恒润制药智慧化工安全生产信息平台：细化安全生产风险管控章节；宣传册素材收集；翠亨建设用地面积统计', '9.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('154', '7', '25', '12', '3', '中丹企业设备资产管理：设备资产管理相关资料收集、主要功能整理', '10.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('155', '7', '25', '12', '3', '中丹企业设备资产管理：主要功能整理；高精地图宣传册素材收集', '9.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('156', '7', '25', '12', '3', '中丹企业设备资产管理： ppt功能完善成型', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('157', '1', '33', '10', '2', '产品概要文档编写', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('158', '1', '33', '10', '2', '产品概要文档编写', '8', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('159', '1', '33', '10', '2', '产品概要文档编写', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('160', '1', '33', '10', '2', '产品概要文档编写', '7.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('161', '1', '33', '10', '2', '竞品分析（国家政策与行业标准）', '8', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('162', '1', '35', '10', '2', '竞品分析（智能驾驶与高精地图行业分析）', '8', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('163', '1', '35', '10', '2', '竞品分析（Apollo,Here,谷歌）', '8', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('164', '1', '35', '10', '2', '竞品分析（星月测绘，贵阳大数据平台，平行世界）', '8', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('165', '1', '35', '10', '2', '竞品分析（Airlook）', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('166', '1', '35', '10', '2', '竞品分析（商业模式分析）', '8', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('167', '6', '50', '8', '4', '新入职员工笔记本电脑的采购、付款流程的提交及费用报销单的制作', '1', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('168', '6', '7', '8', '4', '3月薪资表的定稿及打印签字', '1', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('169', '6', '6', '8', '4', '招聘工作的开展及日常人事工作的处理', '2.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('170', '6', '8', '8', '4', '解顶林的入职办理、信息录入、入职材料的整理，引导熟悉OA等办公软件', '3', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('171', '6', '5', '8', '4', '招聘工作的开展、新职位的发布；李晔的面试安排', '2.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('172', '6', '8', '8', '4', '3月公积金的汇缴、跨事业部工时的统计与核实；事业部员工OA系统数据的核实与更新；陆海芳的三方的签署', '1', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('173', '6', '50', '8', '4', '日常行政工作的对接', '1', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('174', '6', '50', '8', '4', '项目管理表单的更新；项目合同的盖章及邮寄；事业部部门工作的汇总、周报的填写；更新固定资产盘点表；', '4', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('175', '6', '51', '8', '4', '事业部岗级数据的录入与核实；伍军豪录用流程的提交、入职材料的准备及offer的发放', '1.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('176', '6', '6', '8', '4', '招聘工作的开展，根据新的用人需求海选候选人', '2', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('177', '6', '14', '8', '4', '事业部花名册、疫情期间复工情况表、周报、KPI跟进表、项目管理表及会议纪要的编制', '3', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('178', '6', '8', '8', '4', '戚国华、解顶林失业登记，戚国华来宁面试补贴、人才安居的申请；公积金的新开户、启封及转移。', '1.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('179', '6', '10', '8', '4', '公司公众号推文的编写', '1', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('180', '6', '9', '8', '4', '2020年度社保网站书面审查的申报', '1', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('181', '6', '5', '8', '4', '招聘工作的开展，陈慧玲、郭璐锌、吕林瑞简历的推荐', '1', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('183', '6', '24', '19', '1', '实现视频检测代码, 开展视频实时检测研究', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('184', '6', '24', '19', '1', '视频检测代码的编写,CorNerNetsqueeze模式训练,阅读efficientNet', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('185', '1', '37', '18', '4', '激光雷达与摄像机的标定调研', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('186', '1', '37', '18', '4', 'ROS1、ROS2操作系统技术调研', '5.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('187', '1', '37', '18', '4', 'autoware软件调研', '2', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('188', '6', '24', '19', '1', '检查CornerNet的模型,出现垃圾输出,需要重新调整', '3', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('189', '6', '24', '19', '1', '编写CornerNet的评估代码', '4.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('190', '1', '3', '5', '3', '测试数据制作，数据库模板补充及修改', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('191', '1', '3', '5', '3', '高精度地图样例数据符号配置及数据补充采集', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('192', '1', '3', '5', '3', '高精度地图样例数据符号配置及数据补充采集', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('193', '1', '3', '5', '3', '高精度地图样例数据符号配置及数据补充采集', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('194', '1', '3', '5', '3', '测试使用TopoDOT软件的功能，利用软件对样例数据中的标识标牌的进行采集', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('195', '1', '3', '5', '3', '将标志标牌添加至样例数据，并配置符号；梳理各个图层间的关联关系', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('196', '6', '24', '19', '1', '定期评估CorNerNet模型,复现efficientDet,开展数据增强统一代码的编写', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('197', '7', '31', '9', '3', '数据服务平台调研报告-宏观环境和风险进行分析', '9.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('198', '7', '31', '9', '3', '数据服务平台调研报告-对自动驾驶生态平台进行调研，并进行分析', '8.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('199', '7', '31', '9', '3', '数据服务平台调研报告-对数据服务交易平台进行调研，并进行分析', '8.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('200', '7', '31', '9', '3', '数据服务平台调研报告-对API开放平台进行调研，并进行分析', '8.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('201', '7', '31', '9', '3', '数据服务平台调研报告-SWOT分析以及发展规划，并给出建议', '9.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('202', '7', '31', '9', '3', '数据服务平台调研报告-对调研报告的框架、内容、图片进行修改', '8.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('203', '7', '31', '9', '3', '数据服务平台调研报告-对调研报告的文案内容进行修改', '8.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('204', '7', '31', '9', '3', '数据服务平台调研报告-对调研对象的优势、劣势、商业模式进行深度剖析', '8.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('205', '7', '31', '9', '3', '第一季度季报的-整理框架，收集相关资料', '8.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('206', '7', '31', '9', '3', '第一季度季报-对内容进行编制，对排版进行优化', '8.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('207', '7', '31', '9', '3', '据服务平台调研报告工作，对上周的工作成果进一步深度分析，完成90%；', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('208', '7', '31', '9', '3', '数据服务平台调研报告-部门内部进行评审，根据修改意见进行整理', '8.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('209', '7', '31', '20', '4', '入职手续(上午)，学习公司文化，规章制度', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('210', '7', '31', '20', '4', '学习完成《速度中国制度汇编》(共391页)，及新员工训练营第三节全部内容', '8', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('211', '7', '31', '20', '4', '完成入职考试，个人基本规划，询问各部门工作，了解智慧城市与高精地图相关知识', '8', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('212', '7', '31', '20', '4', '学习孙经理传的学习材料，重点学习了高精地图v6.3(PPT)及刘先林院士“新测绘”(PPT),通读部分pdf内容(6份)，整理了关于AVP的了解与思考，以及Waymo与tesla关于自动驾驶汽车方向的思考', '8.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('213', '7', '31', '20', '4', '了解YOLO软件以及R-CNN神经网络算法相关知识，搜索了自动驾驶相关论文共67篇(已读10篇)，学习了如何做好产品方案的有关知识。', '8', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('214', '7', '31', '20', '4', '学习本部门方案PPT(化工厂)，以及其中不懂的知识概念(如五位一体等)，理解地图拓扑原理以及Autoware软件概要，搜索学习目前室内导航技术方向，搜索了解海外自动驾驶相关企业信息。', '8', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('215', '7', '31', '20', '3', '制作《海外自动驾驶调查》PPT(20%)，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。', '8', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('216', '1', '37', '18', '4', 'ubuntu操作系统安装', '3.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('217', '1', '37', '18', '4', 'ROS操作系统安装及环境配置', '4', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('218', '1', '37', '18', '4', '耿禹的笔记本电脑ubuntu操作系统安装', '3.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('219', '1', '37', '18', '4', 'ROS操作系统安装及环境配置', '4', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('220', '1', '37', '18', '4', 'ROS操作系统安装及环境配置', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('221', '1', '36', '4', '1', '地图与全景图像的交互', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('222', '1', '3', '4', '1', '基于道路网数据，研发道路及其附属属性录入功能', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('223', '1', '3', '4', '1', '基于道路网数据，研发道路节点属性录入及更新功能', '7.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('224', '1', '36', '4', '1', '基于道路网数据，测试道路参考线及节点属性的录入功能', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('225', '1', '38', '4', '1', '研究秀山软件中关于双全景相机的量测功能', '6', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('226', '1', '3', '4', '1', '基于道路网数据，研发道路拓扑连接关系功能', '1.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('227', '1', '36', '4', '1', '基于道路网数据，研发道路拓扑连接关系功能', '10.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('228', '1', '3', '4', '1', '研发道路参考线领接关系组件及功能', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('229', '1', '3', '4', '1', '重构代码，提取代码中重复部分，实现驱动编程', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('230', '1', '3', '4', '1', '测试功能，并完成数据保存的功能', '4', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('231', '1', '38', '4', '1', '点云与全景量测功能研发', '3.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('232', '1', '3', '4', '1', '车道网图层数据采集规范研究，采集测试数据', '3.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('233', '1', '36', '4', '1', '软件bug修复，测试', '4', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('234', '6', '17', '4', '1', '前往华东院技术交流', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('235', '1', '3', '4', '1', '研发全景图像加载功能', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('236', '1', '3', '4', '1', '全景图像加载bug修复', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('237', '1', '3', '4', '1', '重构软件代码，调试数据库数据加载及保存的bug', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('238', '1', '1', '15', '1', 'cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('239', '1', '1', '15', '1', 'cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('240', '1', '1', '15', '1', 'cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。', '7.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('241', '1', '37', '15', '1', 'pytorch-yolov3算法环境搭建、训练、测试', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('242', '1', '37', '15', '1', 'pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('243', '1', '37', '15', '1', 'pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('245', '1', '1', '15', '1', 'three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('247', '1', '1', '15', '1', 'three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('248', '1', '1', '15', '1', 'three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('249', '1', '37', '23', '1', '办理入职，接收所分配的任务，了解threejs大致内容和用途。与耿院长进行交流，查看并学习threejs教程第一章', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('250', '1', '37', '23', '1', '与耿院长交流，查看并且学习threejs第二章，进行demo的编写和测试，将代码进行粗略的封装', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('251', '1', '37', '23', '1', '接受吴总的入职培训。对threejs的demo代码进行细化和封装，学习第三四两章。', '8', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('252', '1', '38', '6', '1', '编写图像坐标转WGS84的程序', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('253', '1', '38', '6', '1', '全景图点击点三维位置计算的算法研发', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('254', '1', '38', '6', '1', '全景图点击点三维位置计算的算法研发', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('255', '1', '38', '6', '1', '学习opengl鼠标点选功能', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('257', '1', '38', '6', '1', '编写获取所点选轨迹点信息的程序', '7.5', '0', '99', '2020-04-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('258', '1', '38', '6', '1', '编写通过轨迹点ID获取对应全景图路径的程序', '7.5', '0', '99', '2020-04-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('259', '1', '38', '6', '1', '调试出全景图显示的功能', '4.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('260', '1', '38', '6', '1', '编写通过opengl深度缓冲区获取点选位置的深度，将点选点反投影到三维空间的代码', '7.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('261', '1', '38', '6', '1', '将鼠标点选点在opengl中渲染，完成点选的可视化', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('262', '1', '38', '6', '1', '编写球坐标和图像坐标相互转换的程序,优化之前的代码并修改bug', '4.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('263', '1', '38', '6', '1', '全景量测界面的搭建', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('264', '1', '38', '6', '1', '学习全景量测相关专利的原理', '6', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('265', '1', '38', '6', '1', '双全景量测同名点匹配算法测试程序的编写', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('266', '1', '38', '6', '1', '双全景量测的同名点匹配算法研发', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('267', '1', '38', '6', '1', '双全景量测的同名点匹配算法研发', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('268', '6', '24', '19', '1', '编写Mosaic, padding_image图像增强方法', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('269', '1', '37', '18', '4', '成功配置ROS操作系统的环境', '3', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('270', '7', '31', '20', '3', '制作《海外自动驾驶调查》PPT(50%)； 学习如何写调研报告及要点；学习使用甘特图；辨析机器学习，人工智能与深度学习概念', '8', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('271', '7', '31', '20', '3', '制作《海外自动驾驶调查》PPT(85%)；', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('272', '1', '38', '6', '1', '双全景量测的同名点匹配算法研发', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('273', '1', '3', '5', '3', '梳理并整合高精度地图采集要素的采集方式及注意要点，汇总标准中存在疑问的要点信息', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('274', '1', '3', '5', '3', '1、与开发人员针对疑问及相关要点进行讨论分析；2、对标准中针对采集的内容进行分析汇总成文档，方便后期采集。', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('275', '6', '19', '8', '4', '总部人事会议的参与、事业部周例会的组织与参与', '2.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('276', '6', '5', '8', '4', '招聘工作的开展，候选人陈慧玲的约面', '2', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('277', '6', '50', '8', '4', '笔记本电脑的领用流程、公众号推文的发布、项目管理表的填写', '1.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('278', '6', '17', '8', '4', '向徐银萍请教项目管理表单的填写规范、咨询王辰洋与吕岑关于年度社保年审及人员档案归属等问题', '1.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('279', '6', '8', '8', '4', '伍军豪的入职办理、信息录入、入职材料的整理，林书宇入职材料的准备', '3', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('280', '6', '19', '8', '4', '参与总部人事组织的有关职称评审的会议', '1', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('281', '6', '17', '8', '4', '和徐雪嵩总针对事业部目前招聘情况进行沟通，研究外地来宁面试人员面试补贴的申请条件及流程', '1.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('282', '6', '7', '8', '4', '批导4月的考勤数据，统计并汇总问题数据，与相关人员进行沟通', '1', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('283', '6', '50', '8', '4', '日常行政及人事工作的处理', '1', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('284', '6', '19', '8', '4', '配合总部参与消防及防疫知识的培训会议', '1', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('285', '6', '8', '8', '4', '待入职人员林书宇，由于初到南京，到达南京后，先前往公司对后期的工作及租房等问题进行了咨询及进一步沟通', '2', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('286', '6', '5', '8', '4', '招聘工作的开展，候选人郭冬妍的面试安排', '2', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('287', '6', '50', '8', '4', '日常行政工作的处理', '1', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('288', '6', '51', '8', '4', '日常人事工作的对接，五四评优数据的汇总、申报表的填写与打印提交', '1.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('289', '6', '8', '8', '4', '林书宇的入职办理、信息录入、入职材料的整理', '2', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('290', '6', '5', '8', '4', '招聘的开展，郭冬妍的面试安排，事业部至今招聘需求及招聘进展表的填写', '2', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('291', '6', '19', '8', '4', '新员工入职培训的参与', '1.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('292', '6', '50', '8', '4', '日常行政工作的对接，林书宇台式机的采购申请', '1', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('293', '6', '51', '8', '4', '陆海芳、宁南鑫三方的签署，企业信息登记表的填写，学习通过学信网查询人员学历的真伪', '1', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('294', '6', '9', '8', '4', '根据社保减免政策及财务的费用表，进行2-3月社保费用的付款流程的重新提交', '1', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('295', '6', '14', '8', '4', '事业部花名册、项目管理表、周报及KPI跟进表的填写，根据工时系统制作中山公司工时填报数据的模板', '3', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('296', '6', '50', '8', '4', '企业邮箱的申请，由于认证环节较多，目前处于未申请成功阶段', '1', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('297', '6', '7', '8', '4', '4月绩效成绩的汇总，五险一金账单的初步制作，配合总部填写人事表单', '1.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('298', '6', '50', '8', '4', '日常行政及人事工作的对接', '1', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('299', '7', '25', '12', '3', '泰兴恒润制药智慧化工安全生产信息平台：恒润制药硬件建设方案完善; 例会1h;工业互联网2.0体系学习', '8.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('300', '7', '25', '12', '3', '智慧路内停车：路内停车资料学习及收集、功能梳理、报价沟通；宣传册素材及问题沟通1h', '9.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('301', '7', '25', '12', '3', '中丹设备资产管理：中丹设备ppt汇报会，部门内部会加培训，高精度地图调研会；中丹设备资产功能梳理', '9.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('302', '7', '25', '12', '3', '中丹设备资产管理：中丹设备资产功能资料学习、参加ppt演示会；路内停车功能架构；', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('303', '7', '25', '12', '3', '泰兴恒润制药智慧化工厂方案：设备资产流程梳理，部分功能存疑待完善，', '4', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('304', '7', '25', '12', '3', '智慧路内停车：参考的资料进行功能梳理', '3.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('306', '7', '26', '11', '3', '企业宣传册素材收集', '8', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('307', '7', '26', '11', '3', '企业宣传册框架制作', '8', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('311', '7', '25', '11', '3', '恒润制药招标方案修改与完善', '8', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('312', '7', '27', '11', '3', '3DChina原型图完善商品详情页、登录、注册等页面', '8', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('313', '1', '37', '7', '1', '更换新版yolov3训练，修改CornerNet数据解析代码，解析tt100k数据', '7.5', '0', '99', '2020-04-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('314', '7', '27', '11', '3', '3DCHINA商城版素材收集与原型制作', '8', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('315', '7', '26', '11', '3', '企业宣传册PS制作与美化', '8', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('316', '7', '30', '11', '3', '恒润制药方案第二稿修改', '8', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('317', '7', '31', '10', '2', '竞品分析（各公司产品优劣势分析）', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('318', '1', '37', '7', '1', 'yolov3重新训练300epoch,flask写网页调用的框架,安装c++接口的OpenCV', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('319', '1', '37', '7', '1', '测试视频，效果差，重新使用yolov3-spp.cfg文件训练，增加多尺度训练。新入职员工工作规划。', '7.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('320', '1', '37', '7', '2', '省资金申报文件讨论； 保密检查', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('321', '1', '37', '7', '1', '解决恢复训练时缺乏initial_lr的问题，继续训练；设计数据增强方案', '7.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('322', '1', '37', '7', '1', '开展数据增强代码编译', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('323', '7', '31', '10', '2', '智慧城市全球宏观分析，经济、人口、交通、环境等', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('324', '7', '31', '10', '2', '智慧城市全球地区分析，伦敦、首尔、里约热内卢等', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('325', '7', '31', '10', '2', '智慧城市发展趋势，我国智慧城市相关政策，法规，试验城市等', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('326', '7', '31', '10', '2', '智慧城市主要应用场景，主要涉及技术分析，人工智能、大数据、5G等', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('327', '7', '25', '11', '3', '中丹二期建设方案框架制作（4版）', '8', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('328', '7', '31', '11', '3', '阿波罗平台相关调研、五位一体系统竞争对手方案收集、EAM系统竞争对手方案收集、中丹二期建设方案图片资源收集与修改', '8', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('329', '7', '30', '11', '3', '中丹二期PPT汇报方案整理修改和内部汇报演示（完成）', '8', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('330', '7', '31', '11', '3', '1、	百度阿波罗平台、Autoware平台、百度地图以相关行业网站调研，收集与车企可对接的无人驾驶和高精地图展示平台的功能点以及对接方法（完成）', '8', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('331', '7', '25', '11', '3', '五位一体整体行业方案word版初步编写', '8', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('332', '7', '27', '11', '3', '3DChina对接车企服务版原型图制作', '8', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('333', '7', '25', '11', '3', '中丹二期PPT汇报方案整理修改和内部汇报演示', '8', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('334', '7', '25', '11', '3', '五位一体整体行业解决方案工作推进', '8', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('335', '1', '37', '7', '1', '编译pad随机变形处理 ；宁南鑫任务交接', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('336', '1', '37', '7', '1', '编译随机粘贴pad到image，以及其他数据增强代码', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('337', '1', '37', '7', '1', '解决img.paste不成功的问题；转换结果模型为backbone，开始在上一个backbone网络继续训练', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('338', '1', '37', '7', '1', '继续在增强后数据上进行训练；调研街景图像变化检测，搜集训练数据集', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('339', '1', '37', '7', '2', '讨论630之前展示的内容；研究基于ROS的多目标跟踪方案可行性，借助autoware实现数据融合再进行跟踪算法研发', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('340', '1', '37', '15', '1', 'yolov4 c++ python版本的编译、测试', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('341', '1', '37', '15', '1', 'yolov4 c++ python版本的编译、测试', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('342', '7', '31', '9', '3', '自动驾驶行业研究报告-对智能汽车和V2X梳理思路，整理框架', '4', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('343', '7', '31', '9', '3', '速度学院大讲堂培训材料--收集素材', '3.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('344', '7', '31', '9', '3', '自动驾驶行业研究报告-收集材料', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('345', '7', '31', '9', '3', '自动驾驶行业研究报告-收集材料，调整框架', '4', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('346', '7', '31', '9', '3', '速度学院大讲堂培训材料-梳理思路，整理框架', '4', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('347', '1', '32', '15', '1', 'autoware平台整理', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('348', '1', '32', '15', '1', 'autoware平台整理', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('349', '7', '31', '21', '4', '办理入职，熟悉公司环境，同事等', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('350', '7', '31', '21', '4', '熟悉事业部项目信息，过往文案信息', '8', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('351', '7', '31', '21', '4', '编写员工培训文档（方案书编制方法及招投标内容）', '4', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('352', '7', '31', '21', '4', '拜访京东云和京东数科总监', '4', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('353', '1', '37', '7', '1', '在本地ubuntu安装环境，调试训练基于孪生度量网络的变化检测模型', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('354', '1', '37', '7', '1', '变化检测模型训练，尝试解决loss不下降的问题', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('355', '1', '37', '7', '1', '变化检测模型的问题未能解决，待服务器训练；研究地图更新中基于单目视频的目标定位问题，下载模型准备测试(struct2depth)', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('356', '1', '37', '7', '1', 'yolov3跑完300轮，平均精度达到0.7以上；讨论autoware用户手册，熟悉功能模块流程和主要算法', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('357', '1', '37', '7', '1', '继续训练yolov3; 研究LGSVL自动驾驶仿真，测试算法需结合autoware', '7.5', '0', '99', '2020-04-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('358', '7', '31', '21', '4', '梳理智慧城市资料库', '8', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('359', '7', '31', '21', '3', '协助讨论中丹方案编写', '4', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('360', '7', '31', '21', '3', '中丹方案一稿评审', '3.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('361', '7', '31', '21', '3', '中丹二稿方案协助编写，同行业资料收集', '4', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('362', '7', '31', '21', '4', '公司员工制度培训学习，中丹二稿评审', '4', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('363', '7', '31', '21', '4', '部门周计划总结汇总编写，中丹三稿汇报方案编写', '8', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('364', '1', '36', '22', '1', '上午 1.办理入职手续，在同事的指引下，填写相关文件。 2.下载E-Moile、绚星、企业 微信，并且熟悉相关使用流程。 重点：学习使用OA系统。 待解决：银行卡办理、体检报告办理。 解决方法：五一假期办理。 下午 参加，新员工培训会。学习公司发展历程、工作守则等等。 3.对接工作任务：目前工作为为制作自动驾驶仿真场景。学习Roadrunner仿真软件，为了参照其制作。 4.下载并安装UE4软件，为后期制作仿真场景做准备。 查阅并学习相关资料，深入学习目前行业动态。 重点：参加，新员工培训会。 待解决：UE4对电脑配置要求极高，尤显卡性能。 解决方法：申请电脑。', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('365', '1', '36', '22', '1', '上午 1.安装并调试UE4软件，下载相关引擎。正式使用UE4软件开发仿真场景。调用UE4自带的无人驾驶案例，进行了一次仿真。 待解决：UE4对电脑配置要求极高，尤显卡性能。 解决方法：申请电脑 下午 2.对接上级分配工作任务：建模交通指示牌。决定利用SketchUp 2019，安装并调试。 3.SketchUp 2019建模交通指示牌。利用ps改善图片分辨率。配合建模。 重点：ketchUp 2019建模交通指示牌。 待解决：对接图片资料，分辨率过低。 解决方法：查找资料。', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('366', '1', '3', '3', '1', '高精地图道路空间数据入库代码熟悉', '7.5', '0', '99', '2020-04-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('367', '1', '38', '6', '1', '全景图点击点三维位置计算的算法研发', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('368', '1', '3', '3', '1', '高精地图道路空间数据入库代码熟悉', '7.5', '0', '99', '2020-04-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('369', '1', '3', '3', '1', '高精地图车道线空间数据入库功能开发', '7.5', '0', '99', '2020-04-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('370', '1', '3', '3', '1', '高精地图车道线空间数据入库功能开发', '7.5', '0', '99', '2020-04-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('371', '1', '3', '3', '1', '高精地图车道线空间数据入库功能开发', '7.5', '0', '99', '2020-04-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('372', '1', '37', '23', '1', '阅读threejs的教程第五章，完成对代码的运行，正在对代码进行下一步封装。', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('373', '1', '3', '3', '1', '高精地图车道线拓扑关系构建功能界面开发', '7.5', '0', '99', '2020-04-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('374', '1', '3', '3', '1', '高精地图车道线拓扑关系构建功能事件开发', '7.5', '0', '99', '2020-04-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('375', '1', '3', '4', '1', '团队讨论生产工艺流程，确定软件功能的交互方式，研发路口绑定组件', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('376', '1', '3', '3', '1', '高精地图车道线拓扑关系构建功能事件开发', '7.5', '0', '99', '2020-04-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('377', '1', '3', '3', '1', '高精地图车道线拓扑关系构建功能事件开发', '7.5', '0', '99', '2020-04-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('378', '1', '3', '3', '1', '高精地图车道线邻接关系功能开发', '7.5', '0', '99', '2020-04-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('379', '1', '3', '3', '1', '高精地图车道线邻接关系功能开发', '7.5', '0', '99', '2020-04-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('380', '1', '3', '3', '1', '高精地图邻近关系功能开发', '7.5', '0', '99', '2020-04-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('381', '1', '3', '3', '1', '高精地图邻近关系功能开发', '7.5', '0', '99', '2020-04-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('382', '1', '3', '3', '1', '高精地图拓扑，邻接，邻近关系功能bug调试', '7.5', '0', '99', '2020-04-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('383', '1', '3', '3', '1', '高精地图车道组关系构建功能开发', '7.5', '0', '99', '2020-04-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('384', '6', '24', '19', '3', '调研车道线检测, 红绿灯检测, 车道指示线检测', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('385', '6', '24', '19', '3', '阅读相关单目3d检测论文,', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('386', '6', '24', '19', '3', '继续阅读相关论文, 寻找合适的网络', '3.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('387', '1', '37', '18', '1', 'autoware环境搭建', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('388', '1', '37', '18', '1', '完成autoware环境搭建及demo测试', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('389', '7', '30', '11', '1', '恒润制药五位一体平台投标文件技术部分制作', '8', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('390', '7', '30', '11', '1', '恒润制药五位一体平台投标文件技术部分制作', '8', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('391', '7', '25', '11', '1', '五位一体行业通用方案编写', '8', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('392', '6', '24', '19', '1', '开展struct2depth的训练工作, KITII数据集的准备, 配置新的环境', '4', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('393', '1', '37', '18', '2', '关于ROS及autoware的系统安装及环境操作的资料总结和安装注意事项等材料整理', '3', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('395', '1', '37', '18', '4', 'LGSVL仿真环境学习，以及与autoware连接相关知识调研', '4.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('396', '7', '30', '11', '1', '恒润制药五位一体平台投标文件技术部分互审', '8', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('397', '6', '24', '19', '1', '调整MASK RCNN', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('398', '1', '3', '5', '3', '测试高精地图编译软件的功能，根据软件对数据进行完善', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('399', '1', '3', '5', '3', '测试高精地图编译软件的功能，根据软件对数据进行完善', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('400', '1', '3', '5', '3', '测试高精地图编译软件的功能', '6.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('401', '1', '3', '5', '3', '配合华为调研人员进行调研，进行汇报', '3.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('402', '1', '3', '5', '3', '测试高精地图编译软件的功能', '4', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('403', '1', '3', '5', '3', '修改公司展示所用的PPT，协调人员参与华为高精地图调研', '4.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('404', '6', '17', '8', '3', '对接王辰洋沟通何海职称事宜、对接黄恩庆沟通江苏省科技副总相关事宜', '1.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('405', '6', '19', '8', '4', '周例会的组织', '1.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('406', '6', '5', '8', '4', '报名参与南京信息工程大学3S行业招聘会，筛选招聘网站的简历', '1.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('407', '6', '9', '8', '4', '4月五险一金的账单的制作', '1', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('408', '6', '7', '8', '4', '4月考勤表。绩效汇总表的制作', '2', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('409', '6', '7', '8', '4', '4月考勤表、五险一金账单、绩效表的定稿与提交，4月考勤数据的签字确认；市场人员绩效激励制度的编制', '3.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('410', '6', '51', '8', '3', '中国智能网联汽车产业创新联盟会员的注册', '1.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('411', '6', '5', '8', '4', '招聘宣讲PPT的制作', '1.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('412', '6', '50', '8', '4', '日常行政事务的对接', '1', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('413', '6', '7', '8', '4', '4月工资初稿', '2', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('414', '6', '9', '8', '4', '4月五险一金费用付款流程的提交', '1', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('415', '6', '5', '8', '4', '招聘工作的开展，推荐候选人1人', '1.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('416', '6', '51', '8', '4', '员工档案扫描、整理并转总部；转正评审会的对接', '1.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('417', '6', '50', '8', '4', '企业邮箱的申请、名片的印制', '1.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('418', '6', '50', '8', '4', '办公区新装办公室的布置及物资采购浏览，接待工作', '4.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('419', '6', '14', '8', '4', '花名册、项目管理表、周报、KPI跟进表及会议纪要的编写；总部人事会议的参与', '3', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('420', '6', '24', '19', '1', '调整完毕MASK RCNN的输出, 使用MASK RCNN开始处理KITTI数据集', '3.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('421', '7', '30', '11', '1', '恒润制药五位一体平台投标文件合规审查', '9', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('422', '6', '24', '19', '1', '对输出的mask, 原图进行处理工作, 编写相关代码, 生成txt文件', '4', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('423', '1', '37', '18', '1', 'autoware软件的demo错误调试', '4', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('424', '1', '37', '18', '1', 'LGSVL与autoware连接的硬件调研，确认需配置笔记本一台', '3.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('425', '1', '37', '18', '1', 'autoware中的快速启动demo测试', '2', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('426', '1', '37', '18', '1', 'autoware中的地图建立demo测试', '1', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('427', '1', '37', '18', '1', 'autoware中的使用gnss定位、不使用gnss定位的demo测试', '1.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('428', '1', '37', '18', '1', 'autoware中的任务规划部分的demo测试及错误调试', '3', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('429', '6', '24', '19', '1', '修改struct2depth代码, 调试NAN', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('430', '6', '24', '19', '1', '开始训练struct2depth, 开始调研如何应用深度信息. 显卡显存不够, 停止训练, 等待设备到齐再开始训练.', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('431', '6', '24', '19', '1', '继续调研学习深度信息与2D图像的融合使用, 记录基于单目云台摄像机的深度估计', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('432', '1', '37', '18', '1', 'autoware中使用rosbag包进行建图', '2', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('433', '1', '37', '18', '1', '进行autoware的视频、激光雷达等多传感器融合数据包的demo调试', '5.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('434', '1', '37', '18', '2', 'autoware各功能操作流程整理', '3', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('435', '1', '37', '18', '1', 'autoware/ROS连接USB相机启动调试', '4.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('436', '6', '19', '8', '4', '周例会的开展', '1', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('437', '6', '5', '8', '4', '招聘需求的梳理，新增需求：研发经理，筛选简历', '2.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('438', '6', '50', '8', '4', '相关行政事宜，采购事业部零食、专业键盘、办公桌及文件柜', '2.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('439', '6', '51', '8', '4', '工资表等表单的制作，3位员工转正流程的发起', '1.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('440', '6', '51', '8', '4', '配合总部收集2017-2019年公积金汇缴数据截图', '2', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('441', '6', '19', '8', '4', '参与总部人事会议', '1', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('442', '6', '17', '8', '4', '对接黄恩庆有关科技副总等事宜', '1', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('443', '6', '5', '8', '4', '简历筛选，联系4位候选人', '1.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('444', '6', '50', '8', '4', '相关行政事宜，研究中国移动的项目：DICT全国集成库合作伙伴（第二批）集中采购框架-自动驾驶采购', '2', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('445', '6', '51', '8', '4', '配合总部提供南京速度软件技术有限公司近四年的社保和公积金月度明细表', '4', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('446', '6', '51', '8', '4', '配合总部提供南京速度软件技术有限公司近四年的社保和公积金月度明细表', '2', '0', '99', '2020-05-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('447', '6', '50', '8', '4', '外出提交软件员工持股平台的纸质审核材料、外出拜访南京邮电大学 陈老师', '5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('448', '6', '19', '8', '4', '参与总部行政会议等行政事宜，配合整理华为公司的审查材料', '6', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('449', '6', '51', '8', '4', '外出提交软件员工持股平台的纸质审核材料', '3', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('450', '6', '50', '8', '4', '烟酒的采购等行政事宜', '1', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('451', '6', '51', '8', '4', '林书宇三方协议及来宁面试材料的盖章申请、配合总部提供五险一金数据、拓展活动的讨论', '1.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('452', '6', '50', '8', '4', '对接南京市信息中心，对接后期拜访事宜，主任不在；研究并修改中国移动电子采购与招标投标系统的公司信息', '2', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('453', '6', '24', '19', '1', '开始研究单目相机测距,着手代码编写', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('454', '7', '25', '12', '3', '克拉玛依智慧停车：路内停车投标技术方案资料收集、框架图完善、综合管理平台功能梳理完善', '11', '0', '99', '2020-05-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('455', '7', '25', '12', '3', '克拉玛依智慧停车：路内停车投标技术方案框架图完善、数据库建设、集成、收费APP等功能完善', '12.5', '0', '99', '2020-05-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('456', '7', '25', '12', '3', '克拉玛依智慧停车：路内停车投标技术方案文档排版', '3', '0', '99', '2020-05-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('457', '7', '25', '12', '3', '通版智慧停车：智慧停车资料收集、脑图构建，周例会', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('458', '7', '25', '12', '4', '恒润制药投标技术文件：设备报价咨询沟通', '9', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('459', '7', '25', '12', '3', '通版智慧停车：智慧停车资料收集、脑图构建', '3.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('460', '7', '25', '12', '4', '恒润制药投标技术文件：设备报价、功能浏览', '6', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('461', '7', '25', '12', '4', '恒润制药投标技术文件：设备清单报价整理梳理，主要技术内容讨论修改', '12.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('462', '7', '25', '12', '4', '恒润制药投标技术文件：设备清单报价及调整 ，周例会', '10', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('463', '7', '25', '12', '4', '恒润制药投标技术文件：设备清单最终报价、表格，清单制作，配合商务等工作', '10', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('464', '7', '25', '12', '4', '恒润制药投标技术文件： 需求梳理，送标书', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('465', '7', '25', '12', '3', '通版智慧停车：智慧停车脑图构建，停车概况、数据库、智慧停车集成编写', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('466', '7', '25', '12', '3', '通版智慧停车：、数字孪生，一体化平台编写、综合管理平台功能编写晚上', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('467', '7', '31', '20', '3', '海外自动驾驶调查PPT完成；学习88号文件、96号文件，输出思维导图3份（40%）。', '8', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('468', '7', '30', '20', '3', '完成88号与96号文件思维导图框架梳理；对88号文件中重点参数、技术要求整理，输出技术要求要点细则1份；制作投标书功能清单对照表（初版1份）', '9', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('469', '7', '30', '20', '3', '为投标书技术部分，提出4项有效建议（3项内容相关，1项格式）；输出招标书功能清单对照表（交付版1份）', '9', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('470', '7', '30', '20', '3', '为投标书技术部分，提出内容行有效建议9项；输出word版亨润项目功能清单一份；修改投标书的“移动APP”模块内容及排版', '12', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('471', '7', '30', '20', '3', '检查投标书错误；制作供应商管理一览表Excel；学习江苏高科技氟化学工业园招标方案，生成思维导图（80%），了解园区级规划要求', '8', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('472', '7', '30', '20', '3', '学习老山森林公园规划书，输出思维导图（10%）；恒润投标书会议；对投标书进行内容完善、整理', '10', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('473', '7', '30', '20', '3', '学习老山森林公园规划书，输出思维导图（50%）；学习数据库规范29号文件，安全风险分区指南105号文件（100%）', '8', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('474', '7', '30', '20', '3', '老山森林公园规划书，输出思维导图（100%）；梳理PPT智慧园区框架构造', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('475', '7', '30', '20', '3', '制作智慧园区PPT（10%）；梳理智慧园区业务逻辑、业务分类。', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('476', '1', '3', '5', '3', 'speedHDmap软件功能测试', '3', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('477', '1', '3', '5', '4', '供应商隐私保护认证标准及checklist的相关资料的准备工作，与保密办对接相关资料', '4.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('478', '1', '3', '5', '4', '供应商隐私保护认证标准及checklist的相关资料的准备工作', '8', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('479', '1', '3', '5', '3', 'speedHDmap软件功能测试', '2', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('480', '1', '3', '5', '1', 'speedHDmap软件功能测试，利用软件功能建立拓扑关系', '3', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('481', '1', '3', '5', '4', '供应商隐私保护认证标准及checklist的相关资料的准备工作，参加华为的审查会议', '4.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('482', '1', '3', '5', '1', 'speedHDmap软件功能测试，利用软件功能建立拓扑关系', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('483', '1', '3', '5', '1', 'speedHDmap软件功能测试，利用软件功能建立拓扑关系', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('484', '6', '24', '19', '1', '编写了C++版本的YOLOV3 推理代码', '4', '0', '99', '2020-05-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('485', '6', '24', '19', '3', '研究对极几何约束,研究单目相机位姿', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('486', '1', '37', '18', '1', '尝试使用本公司的徐庄软件园的地图数据测试，出现错误并调试', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('487', '1', '37', '18', '1', '激光雷达融合视觉的数据包的错误分析调研', '4', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('488', '1', '37', '18', '1', '激光雷达节点转换方法学习', '3.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('489', '1', '37', '18', '1', '激光雷达与视觉的数据包转换学习', '4', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('490', '1', '37', '18', '1', '使用matlab进行相机标定，读取相机参数', '3.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('491', '6', '24', '19', '1', '编写2d_2d相机位姿估计代码', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('492', '6', '24', '19', '1', '完成相机位姿估计代码编写', '3.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('493', '6', '24', '19', '1', '开展车牌定位工作', '4', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('494', '1', '37', '18', '1', '完成bag数据包中的相机部分以及雷达扫描数据的消息类型转换', '3', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('495', '1', '37', '18', '1', '完成bag数据包中的相机部分数据以及雷达扫描数据的话题修改', '4.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('496', '1', '37', '18', '1', '完成bag数据包中的其他部分数据的消息类型转换', '2', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('497', '1', '37', '18', '1', '完成bag数据包中的其他部分数据的话题内容转换', '2', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('498', '1', '37', '18', '1', '使用转换格式之后的数据包，进行建图', '2.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('499', '1', '37', '18', '2', '对数据包的转换方法和有关资料进行整理', '1', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('500', '6', '24', '19', '1', 'faster rcnn版本问题无法使用,更换网络', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('501', '1', '37', '18', '1', 'ROS系统下的相机标定', '2', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('502', '1', '37', '18', '1', '数据包的pcd文件生成，及错误查找', '3.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('503', '7', '30', '11', '1', '恒润制药五位一体平台投标文件封装', '9', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('504', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('505', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('506', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('507', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('508', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('509', '7', '25', '11', '1', '智慧城管相关资料收集', '9', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('510', '7', '25', '11', '1', '五位一体化工行业方案编写', '9', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('511', '1', '37', '18', '1', '针对自采集的徐庄软件园的高精地图数据使用autoware建图，进行错误查找，目前未成功解决错误', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('512', '6', '24', '19', '1', '完成车牌检测代码,研读TRI-ML数据集,源码', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('513', '7', '31', '20', '3', '1. 搜索阅读论文15份；2. 输出完善《概念解析及辨析》文档，（主要：新型网络架构-SDN(软件定义网络)与ESB概念原理，SOA与微服务架构，ESB与API网关区别)', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('514', '7', '31', '20', '3', '1. PPT 内容、素材及模板整理（50%）；2. 阅读论文8篇，收集照片素材33张；3. 完善《概念解析及辨析》，数字化、智能化、智慧化、城市大脑', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('515', '7', '31', '20', '4', '1. 概览50份智慧景区方案，有用的精度；2.  丰富智慧景区子系统功能，划分整体架构；', '8', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('516', '7', '31', '20', '3', '1. 制作智慧景区PPT（109页），将之前所有的素材整理；', '8', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('517', '7', '31', '20', '3', '1. 搜集PPT模板 2. 丰富智慧景区PPT中缺失的图片 3. 重构智慧景区系统的构架，因为部分子系统功能具有重叠、交叉，所以较难梳理', '8', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('518', '7', '31', '20', '3', '1.  精修制作PPT （33页）；', '8', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('519', '6', '24', '19', '1', '车牌检测完成,继续研读论文,向作者提出问题等待解答,尝试构建车牌识别', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('520', '7', '25', '12', '4', '停车通版智慧:综合管理平台功能梳理，周例会', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('521', '7', '25', '12', '4', '智慧康养方案：相关资料收集', '4', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('522', '7', '28', '12', '4', '丽水公安局拜访智慧公安事宜，宿迁高速姜总', '3.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('523', '7', '25', '12', '4', '智慧康养方案：资料收集、ppt 制作', '11', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('524', '7', '25', '12', '4', '智慧康养方案：ppt 制作完善', '3.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('525', '7', '25', '12', '4', '停车通版智慧:子系统功能补充完善', '4', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('526', '7', '25', '12', '4', '停车通版智慧:子系统功能补充完善', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('527', '1', '37', '18', '1', 'autoware矢量地图标注环境搭建', '2', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('528', '1', '37', '18', '4', 'ROS坐标系转换知识学习', '3.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('529', '1', '37', '18', '4', 'autoware内部结构学习', '2', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('530', '1', '37', '18', '1', 'autoware矢量地图标注环境搭建', '3.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('531', '1', '37', '18', '4', 'ndt建图及原理学习', '4', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('532', '6', '24', '19', '1', '开始车牌ocr识别的训练', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('533', '6', '50', '8', '4', '学习中国移动招投标网站，采购比选文件；制作拜访函；制作花名册、项目管理表、周报、KPI跟进表、会议纪要；办公物资的盘点；日常行政工作；速度软件公司的合规证明', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('534', '6', '50', '8', '4', '举行周例会；固定资产表的核实；制作打印行程单、席卡；中国移动招投标网报名；提交新开公司流程；汇总事业部子女信息', '5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('535', '6', '51', '8', '4', '姚威离职手续的办理；工资定稿；日常人事工作；招聘', '3', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('536', '6', '50', '8', '4', '采购接待使用的烟酒、准备接待物资', '2.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('537', '6', '51', '8', '4', '整理招聘需求，发布新岗位；公积金汇缴；6位候选人的沟通；社保缴纳材料的准备', '5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('538', '6', '51', '8', '4', '候选人张瑞铭的面试安排；离职材料的整理、扫描与转交；招聘', '3', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('539', '6', '50', '8', '4', '协助接待翠亨公司领导；合同的盖章、扫描、邮寄', '5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('540', '6', '51', '8', '4', '配合总部准备公积金凭证；待转正人员转正流程的发起；', '3', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('541', '6', '50', '8', '4', '趣味篮球赛的策划、耿院长物资采购的申请', '5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('542', '6', '50', '8', '4', '花名册、项目管理表、周报、KPI根基表、会议纪要的编写；组织趣味篮球赛', '5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('543', '6', '51', '8', '4', '2020年度基数申报工作的开展；招聘工作', '2.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('544', '6', '51', '8', '4', '郑曼、吴畏、陈淑琳转正评审会的准备与开展；上传工资数据；安排候选人姚阳面试；招聘', '4', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('545', '6', '50', '8', '4', '周例会的开展；编写事业部推文；华为材料的打印、审核', '3.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('546', '6', '50', '8', '4', '事业部推文的发布；华为合同也的盖章、邮寄；项目全流程汇总表的制作；配合总部行政工作', '4', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('547', '6', '51', '8', '4', '候选人姚阳offer的发放；招聘，两位候选人的沟通；基数申报工作', '4', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('548', '6', '51', '8', '4', '事业部岗位说明书的编写；汇总考勤数据、审批流程；修改招聘信息', '5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('549', '6', '50', '8', '4', '事业部办公用品的采购，日常行政工作', '2.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('550', '6', '24', '19', '1', '编写完整的车牌检测与识别代码, 等待标注数据集进行重新迁移学习', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('551', '13', '49', '15', '4', '政府推荐采购创新产品征集表', '1', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('552', '13', '49', '15', '4', '南京市产业地标重点培育企业目录', '1', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('553', '13', '49', '15', '4', '征集2019年度十大创新产品通知', '1', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('554', '13', '49', '15', '4', '“四新”应用场景和新技术新产品新业态发布征集通知', '1', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('555', '13', '49', '15', '4', '中移5G自动驾驶联盟成员申请表', '0.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('556', '13', '49', '15', '4', '中国智能交通协会成员申请表', '0.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('557', '13', '49', '15', '4', '江苏省智能网联汽车产业创新联盟成员申请表', '0.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('558', '13', '49', '15', '4', '2020年新产业重点项目调研表-项目更新', '0.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('559', '13', '49', '15', '4', '自研项目完成情况跟进表', '1', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('560', '1', '37', '15', '1', '多目标跟踪算法FairMot复现', '6', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('561', '1', '37', '15', '1', '多目标跟踪算法FairMot复现', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('563', '1', '37', '15', '1', '多目标跟踪算法FairMot复现', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('564', '13', '49', '15', '4', '车联网PPT编写', '6', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('565', '7', '28', '15', '4', '南京交院测试场', '4', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('566', '13', '49', '15', '4', '南京交院项目项目规划', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('567', '13', '49', '15', '4', '车联相关政策法规资料阅读', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('568', '13', '49', '15', '4', '车联相关政策法规资料阅读', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('569', '13', '49', '15', '2', '硬件采购计划表编写', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('570', '13', '49', '15', '2', '硬件采购计划表编写', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('571', '1', '37', '15', '1', '单目相机深度估计算法monodepth2复现', '6.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('572', '1', '37', '15', '1', '单目相机深度估计算法monodepth2复现', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('573', '1', '37', '15', '1', '单目相机深度估计算法monodepth2复现', '5.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('574', '1', '37', '15', '1', '单目相机深度估计算法monodepth2复现', '3.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('575', '1', '32', '15', '1', '宿迁高速公路单目测距技术可行性分析', '6.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('576', '1', '32', '15', '1', '宿迁高速公路单目测距技术测试', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('577', '13', '49', '15', '4', '研发项目立项报告编写', '7.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('578', '13', '49', '15', '4', '惯导测试', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('579', '13', '49', '15', '2', '研发项目立项PPT编写', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('580', '6', '24', '19', '1', '研读monodepth2源码,测试发现场景不拟合', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('581', '6', '50', '8', '4', '华为、测绘及武汉大学协议的打印与用印。配合总部进行文化活动', '5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('582', '6', '51', '8', '4', '孙茂荣、刘锦武及万子禹转正评审会的开展；绩效分数的统计；招聘的开展；总部人事会议的参与', '2.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('583', '7', '25', '12', '4', '停车通版智慧:功能完善，同事沟通讨论，事业部部门例会1h，梯控资料收集', '8.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('584', '6', '50', '8', '4', '花名册、项目管理表、周报、KPI跟进表的制作；相关协议的用印', '4', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('585', '6', '51', '8', '4', '李学文面试的安排；与徐总商量相关人事事宜', '4', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('586', '7', '25', '12', '4', '智慧梯控解决方案：收料收集整理，编制PPT', '10.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('587', '7', '25', '12', '4', '智慧梯控解决方案：PPT编制及完善', '8', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('588', '7', '25', '12', '4', '智慧梯控解决方案：资料收集汇集成word', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('589', '7', '25', '12', '4', '智慧康养解决方案：烽火祥云养老资料学习，前言报告等收集学习', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('590', '1', '37', '18', '1', '笔记本版本的矢量地图标注环境搭建', '3.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('591', '1', '37', '18', '4', '查找有关矢量地图标注的教学视频', '4', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('592', '1', '37', '18', '1', '学习在线形式Tier.iv的矢量地图标注方法', '2.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('593', '1', '37', '18', '1', '学习离线形式的Unity + MapToolBox的矢量地图标注方法', '5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('594', '1', '37', '18', '1', 'autoware关键模块功能解读', '4.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('595', '1', '37', '18', '1', 'tf 坐标转换代码读解', '3', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('596', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('597', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('598', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('599', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('600', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('601', '1', '37', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('602', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('603', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('604', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('605', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('606', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '4', '0', '99', '2020-05-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('607', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('608', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('609', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('610', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('611', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('612', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7', '0', '99', '2020-05-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('615', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('616', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('617', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('618', '1', '36', '22', '1', '基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('619', '7', '31', '10', '2', '数字城市资料整理', '8', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('620', '7', '31', '10', '1', '智慧停车资料整理', '8', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('621', '7', '31', '10', '2', '智慧城市PPT编写', '8', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('622', '7', '31', '10', '2', '智慧城市PPT编写', '8', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('623', '7', '31', '10', '2', '智慧停车通版PPT编写第一版', '8', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('624', '7', '31', '10', '2', '智慧停车通版PPT编写第一版', '8', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('625', '7', '31', '10', '2', '智慧停车通版PPT编写第一版', '8', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('626', '7', '31', '10', '2', '智慧停车通版PPT编写第二版', '8', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('627', '7', '31', '10', '2', '智慧停车通版PPT编写第二版', '8', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('628', '1', '3', '5', '1', 'speedHDmap软件功能测试，高精地图拓扑数据构建', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('629', '1', '3', '5', '1', '配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('630', '1', '3', '5', '1', '配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。', '4.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('631', '1', '3', '5', '1', '研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准', '3', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('632', '1', '3', '5', '1', 'speedHDmap软件功能测试，高精地图拓扑数据构建', '4', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('633', '1', '3', '5', '1', '配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。', '3.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('634', '1', '3', '5', '1', '研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准', '3', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('635', '1', '3', '5', '1', '配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。', '4.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('636', '7', '31', '10', '2', '智慧楼宇资料整理', '8', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('637', '7', '31', '10', '2', '智慧楼宇资料整理', '8', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('638', '7', '31', '10', '2', '智慧楼宇PPT第二版编写', '8', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('639', '7', '31', '10', '2', '智慧楼宇PPT第二版编写', '8', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('640', '7', '31', '10', '2', '智慧楼宇PPT第二版编写', '8', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('641', '7', '31', '10', '2', '智慧停车客户端流程逻辑设计', '8', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('642', '7', '31', '10', '2', '智慧停车客户端信息架构设计', '8', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('643', '7', '31', '10', '2', '智慧停车客户端页面原型设计', '8', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('644', '7', '31', '10', '2', '智慧停车客户端页面原型设计', '8', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('645', '7', '31', '10', '2', '智慧停车客户端页面原型设计', '8', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('646', '1', '36', '5', '4', '学习使用autoware maptools 采集高精度地图数据', '5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('647', '1', '3', '5', '1', '	 学习使用autoware maptools 采集高精度地图数据', '4.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('648', '1', '3', '5', '1', '学习autoware相关数据采集软件', '4.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('649', '1', '3', '5', '1', '测试speedHDmap导入dxf数据后的相关功能，录入拓扑信息', '3', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('650', '1', '3', '5', '1', '测试speedHDmap导入dxf数据后的相关功能，录入拓扑信息', '2.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('651', '1', '3', '5', '1', '测试speedHDmap导入dxf数据后的相关功能，配合开发人员完善DXF数据', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('652', '1', '3', '5', '1', '研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准。', '3', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('653', '1', '3', '5', '1', '测试speedHDmap导入dxf数据后的相关功能，配合开发人员完善DXF数据', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('654', '1', '36', '23', '1', '绘制停车场的围墙，大门', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('655', '1', '36', '23', '1', '绘制停车场的电子牌，起落杆', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('656', '1', '36', '23', '1', '绘制停车位标号，解决文字加载卡慢的问题', '8', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('657', '1', '36', '23', '1', '完成停车场的绘制，规划学校的绘制', '8', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('658', '1', '36', '23', '1', '完成部分教学楼和地皮的绘制', '8', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('659', '7', '31', '20', '3', '1.精修制作PPT（至60页）；2.输出思维导图1份（高精地图制图规范-高速路部分）', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('660', '7', '31', '20', '3', '1.精修制作PPT （至77页）；2. 补充个人词典（全息投影、虚拟现实、视觉深度）', '8', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('661', '7', '31', '20', '3', '精修完成 第一版PPT -初始版 （共93页）', '8', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('662', '7', '31', '20', '3', '完成智慧景区PPT-精简版 62页 （之前的初始版，内容太混乱），但是还是恨不完善，下一步需要把业务逻辑可视化，丰富或精简功能。', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('663', '1', '36', '23', '1', '请假', '0', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('664', '1', '36', '23', '1', '封装了城市场景的道路线代码', '8', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('665', '1', '36', '23', '1', '对城市道路线进行铺设', '8', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('666', '1', '36', '23', '1', '完善道路线条细节，绘制道路护栏和红绿灯模型', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('667', '1', '36', '23', '1', '完成停车场地皮', '8', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('668', '1', '36', '23', '1', ' 编写并且封装了建筑的函数，在模型上添加了建筑。', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('669', '1', '36', '23', '1', '编写对厂区的一些建筑，纹理。添加小车模型', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('670', '1', '36', '23', '1', '查渲染卡顿的问题，发现卡顿处在于加载物体过多，解决js异步函数的取值问题', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('671', '1', '36', '23', '1', '了解弯道模型，不规则模型的创建和贴图，贴图功能未解决', '8', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('672', '1', '36', '23', '1', '对模拟区域大致结构进行构建，创建道路和道路转接。', '8', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('673', '1', '36', '23', '1', ' 分析了threejs搭建智慧园区所需要的技术，查找教程，观看，并且创建了简单的建筑。    ', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('674', '1', '36', '23', '1', '发现建筑加载卡慢的问题，与耿院长沟通并且找出bug,在地图加载了道路，模拟车辆沿轨道运行。', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('675', '1', '36', '23', '1', '解决了镜头视角变换的问题，添加镜头移动的功能，但是交互操作遇到问题', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('676', '1', '36', '23', '1', '把场景细节修改完善', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('677', '7', '29', '9', '3', '转正汇报材料：编制转正报告并进行优化', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('678', '7', '29', '9', '3', '优化中山翠亨新区智慧交通岛设计方案', '8', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('679', '7', '29', '9', '3', '收集无锡车联网调研的材料，联系以往的同事，了解相关信息', '8', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('680', '7', '29', '9', '3', '智慧交通岛规划文档：收集各地方的相关管理办法', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('681', '7', '29', '9', '3', '无锡车路网调研，赶往示范区，了解设施设备，拍摄照片', '6', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('682', '7', '29', '9', '4', '编写针对翠亨新区编写翠亨新区智慧交通管理办法', '2', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('683', '7', '29', '9', '3', '中山翠亨智慧交通岛设计方案：增加原方案的内容，包括效益提升、商业模式等', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('684', '7', '29', '9', '3', '自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案', '7', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('685', '7', '29', '9', '3', '培训材料：收集培训材料相关资料', '2', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('686', '7', '29', '9', '3', '培训材料：整理培训材料的框架，对培训材料的内容进行核对以及优化', '6', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('688', '7', '29', '9', '4', '配合添加江苏恒润信息化管理平台系统分项报价表', '2', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('689', '7', '29', '9', '3', '自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案', '4', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('690', '7', '29', '9', '3', '南京交院智慧交通规划设计方案：收集相关标准，以及国内外的现状', '4', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('691', '7', '29', '9', '3', '南京交院智慧交通规划设计方案：对收集的材料进行理解', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('692', '7', '29', '9', '3', '南京交院智慧交通规划设计方案：现场调研，根据实际情况，规划测试场景', '8', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('693', '7', '29', '9', '3', '编写高精地图服务平台介绍材料，为让券商理解产品，', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('694', '7', '29', '9', '3', '收集智慧高速的相关政策以及解决方案', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('695', '7', '29', '9', '3', '跟进南京交院测试场，催促甲方签署战略合作协议', '1', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('696', '7', '29', '9', '3', '智慧高速解决方案：政策理解', '6.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('697', '7', '29', '9', '3', '智慧高速解决方案：分析痛点，进行归纳', '8', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('698', '7', '29', '9', '3', '智慧高速解决方案：根据第一代控制网的六个发展方向进行功能分解', '8', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('699', '7', '29', '9', '3', '交通智慧岛解决方案完善方案内容', '2', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('700', '7', '29', '9', '3', '智慧高速解决方案：针对宿迁智慧高速，优化智慧高速公路方案', '6', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('701', '7', '29', '9', '3', '交通智慧岛解决方案完善方案内容', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('702', '1', '3', '3', '1', '车道组关系构建功能开发', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('703', '1', '3', '3', '1', '车道组关系构建功能开发', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('704', '1', '3', '3', '1', '车道组关系构建功能开发，及一些bug调试修复', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('705', '1', '3', '3', '1', '车道组关系构建功能开发', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('707', '1', '3', '3', '1', '研究opendriver格式与本地数据对应关系，修改车道线拓扑功能bug', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('708', '1', '3', '3', '1', '研究opendriver格式与本地数据对应关系', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('709', '1', '3', '3', '1', '研究opendriver格式与本地数据对应关系 ', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('710', '1', '3', '3', '1', '研究opendriver格式与本地数据对应关系，修改车道线拓扑功能bug', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('711', '1', '3', '3', '1', '修改车道线拓扑功能bug，及车道组关系构建', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('712', '1', '36', '22', '1', '完成基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。制作流程已经掌握90%，但待处理数据量过大，目前完成总工作量的40%。 完成基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。制作流程已经掌握40%，为进一步提高产品质量，需要学习的内容较多。目前完成总工作量的40% 学习使用SpeedHDMap全景查看等功能。已经掌握基本功能，配合其他软件的生产。', '6', '0', '99', '2020-05-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('713', '1', '3', '3', '1', 'opendiver格式整体框架搭建', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('714', '1', '3', '3', '1', 'opendiver格式整体框架搭建', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('715', '1', '3', '3', '1', 'opendiver格式整体框架搭建', '7.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('716', '1', '3', '3', '1', 'opendiver格式整体框架搭建', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('717', '1', '3', '3', '1', 'opendiver格式整体框架搭建', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('718', '1', '3', '3', '1', 'opendrive格式数据与本地数据的解析及录入', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('719', '1', '3', '3', '1', 'opendrive格式数据与本地数据的解析及录入', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('720', '1', '3', '3', '1', 'opendrive格式数据与本地数据的解析及录入', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('721', '1', '3', '3', '1', 'opendrive格式数据与本地数据的解析及录入', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('722', '1', '3', '3', '1', 'opendrive格式数据与本地数据的解析及录入', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('723', '13', '49', '15', '4', '无锡常州车联网先导区查看', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('724', '1', '37', '7', '1', '单目的三维目标检测和深度估计调研', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('725', '1', '37', '7', '1', '制作展示视频；调研学习深度计算struct2depth', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('726', '1', '37', '7', '1', '在pytorch0.4.0环境训练变化检测模型；学习P3P位姿确定', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('727', '1', '37', '7', '1', '编译python 版P3P求解位姿，得出未知点世界坐标', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('728', '1', '3', '4', '1', '完成地图编译中图层属性录入代码的bug', '7.5', '0', '99', '2020-05-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('729', '1', '3', '4', '1', '完成地图编译中图层属性录入代码的bug', '7.5', '0', '99', '2020-05-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('730', '1', '3', '4', '1', '完成地图编译中拓扑核查功能', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('731', '1', '3', '4', '1', '完成地图编译中拓扑核查功能', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('732', '1', '3', '4', '1', '完成地图编译中拓扑核查功能及bug修复，移交数据生产人员测试', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('733', '1', '3', '4', '1', '完成其他bug修复', '5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('734', '1', '3', '4', '1', '完成dxf中数据导入功能，点要素的导入', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('735', '1', '3', '4', '1', '完成dxf中数据导入功能，线要素的导入', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('736', '1', '3', '4', '1', '完成dxf中数据导入功能，面要素的导入', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('737', '1', '3', '4', '1', '完成dxf中数据导入功能，移交测试', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('738', '1', '3', '4', '1', '修改dxf中数据导入功能bug，重构代码', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('739', '1', '3', '4', '1', '专利反馈修改', '5', '0', '99', '2020-05-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('740', '1', '37', '7', '1', '继续编译P3p求解位姿', '7.5', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('741', '1', '37', '7', '1', '完成P3P编译；学习SALM基础，和光束法平差方法', '7.5', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('742', '1', '37', '7', '1', '结合软件研发的研发立项申请书；继续学习光束法平差方法', '7.5', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('743', '1', '37', '7', '1', '立项申请书拟写框架；继续调研学习单目的深度计算', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('744', '1', '37', '7', '1', '完成立项申请书撰写；测试固定大小物体单目测距的算法效果，使用范围较小', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('745', '1', '36', '4', '1', '学习UE4蓝图功能', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('746', '1', '36', '4', '1', '学习UE4蓝图功能', '5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('747', '1', '3', '4', '1', '制作基于常州真实场景搭建模型的技术路线', '2.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('748', '1', '3', '4', '1', '开展OpenDriver格式转换规范研究', '7.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('749', '1', '3', '4', '1', '修复路口节点绑定的bug，开展要素节点方向反转的工具研发', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('750', '1', '3', '4', '1', '修复软件中比例尺和测量工具的bug', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('751', '1', '3', '4', '1', '完成代码移交供测试人员测试', '4.5', '0', '99', '2020-05-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('752', '1', '37', '7', '1', '变化检测模型不收敛；Struct2depth内存依然不够用；使用Matlab完成手机摄像头的标定', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('753', '1', '37', '7', '1', '编译固定摄像头参考相机高度估算距离的算法', '7.5', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('754', '1', '37', '7', '1', '完成编译固定摄像头测距；调研学习监控摄像头的定位的论文和发明', '7.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('755', '1', '37', '7', '1', '完成固定高度摄像头测距的测试，精度达到0.3%左右；修改专利', '7.5', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('756', '1', '37', '7', '1', '重新使用激光测距仪在较远的场景下测试测距算法，误差在1%左右。', '7.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('757', '1', '3', '4', '1', '完成openDriver格式规范的研究', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('758', '1', '3', '4', '1', '完成road节点下link、type和speed节点的解析', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('759', '1', '3', '4', '1', '修复生产人员遇到的bug', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('760', '1', '3', '4', '1', '修复生产人员遇到的bug', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('761', '1', '3', '4', '1', '完成road节点下planview节点的多类型要素的几何形状的拟合技术路线确定', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('762', '1', '3', '4', '1', '完成road节点lane节点下要素的拟合', '4.5', '0', '99', '2020-05-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('763', '1', '37', '7', '3', '制作大讲堂（浅谈深度学习和行业应用）ppt', '9', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('764', '1', '37', '7', '3', '完成大讲堂（浅谈深度学习和行业应用）ppt准备和完善', '9', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('765', '1', '37', '7', '1', '开展单目三维检测的方法整理和研发', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('766', '1', '37', '7', '1', '确定深度图转换伪点云再进行三维检测的方案，学习原理', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('767', '1', '37', '7', '1', '学习KITTI数据集内容和结构；学习和编译伪点云方案', '7.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('768', '7', '25', '21', '4', '克拉玛依路内停车标书制作', '7.5', '0', '99', '2020-05-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('769', '7', '25', '21', '4', '克拉玛依路内停车标书制作', '7.5', '0', '99', '2020-05-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('770', '7', '25', '21', '4', '智慧景区项目总体架构图规划', '7.5', '0', '99', '2020-05-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('771', '7', '25', '21', '4', '恒润项目标书方案制作协调', '7.5', '0', '99', '2020-05-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('772', '7', '25', '21', '4', '恒润项目标书方案制作协调', '7.5', '0', '99', '2020-05-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('773', '7', '25', '21', '4', '恒润项目标书方案制作协调', '7.5', '0', '99', '2020-05-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('774', '7', '25', '21', '4', '拜访江宁国旅集团徐总就矿坑公园智慧停车项目交流', '4', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('775', '7', '25', '21', '4', '参与老山景区项目研讨会', '4', '0', '99', '2020-05-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('776', '7', '25', '21', '4', '与商务合并恒润标书并封装', '8', '0', '99', '2020-05-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('777', '7', '25', '21', '4', '去泰兴恒润投标', '8', '0', '99', '2020-05-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('778', '7', '25', '21', '4', '编辑PPT通用模板', '7.5', '0', '99', '2020-05-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('779', '7', '25', '21', '4', '编辑PPT通用模板', '7.5', '0', '99', '2020-05-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('780', '7', '25', '21', '4', '审核部门内部提交的方案资料', '7.5', '0', '99', '2020-05-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('781', '7', '25', '21', '4', '和商务一起就智慧公安项目拜访溧水公安局长', '6', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('782', '7', '25', '21', '4', '宿迁智慧高速项目沟通', '2', '0', '99', '2020-05-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('783', '7', '25', '21', '4', '拜访江北新区沿江街道主任商谈智慧城市项目', '5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('784', '7', '25', '21', '4', '指导部门员工对智慧景区项目编写', '2.5', '0', '99', '2020-05-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('785', '7', '25', '21', '4', '拜访江宁谷里街道主任和国旅徐总沟通智慧停车项目', '4', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('786', '7', '25', '21', '4', '指导智慧停车整体方案编辑', '4', '0', '99', '2020-05-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('787', '7', '25', '21', '4', '指导部署智慧康养方案书编辑', '3.5', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('788', '7', '25', '21', '4', '拜访珍珠泉管委会主任，就景区项目进行沟通', '4', '0', '99', '2020-05-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('789', '7', '25', '21', '4', '智慧康养方案审核，讨论，参与修改', '7.5', '0', '99', '2020-05-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('790', '7', '25', '21', '4', '指导智能梯控项目方案书编写', '7.5', '0', '99', '2020-05-26 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('791', '7', '25', '21', '4', '出差滨海就具体康养项目调研', '7.5', '0', '99', '2020-05-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('792', '7', '25', '21', '4', '对智慧城管项目收到的资料进行选择性筛选', '7.5', '0', '99', '2020-05-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('793', '7', '25', '21', '4', '沟通事业部内部宣传折页', '3', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('794', '7', '25', '21', '4', '与滨海江总沟通图纸事宜，与宿迁告诉刘总沟通安防项目', '4.5', '0', '99', '2020-05-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('795', '6', '24', '19', '1', '阅读monodepth源码,准备训练数据集', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('796', '6', '24', '19', '1', '开始调试代码,进行monodepth2的训练', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('797', '6', '24', '19', '1', '训练完monodepth2,完成测试工作,效果较差', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('798', '6', '24', '19', '1', '继续研究一些深度估计的模型,寻找可迁移方法', '7.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('799', '1', '37', '18', '1', '查找在线标注格式与autoware默认格式的差异', '6', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('800', '1', '37', '18', '1', '查找离线标注格式与autoware默认格式的差异', '1.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('801', '1', '37', '18', '1', '查找离线标注格式与autoware默认格式的差异', '3.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('802', '1', '37', '18', '4', '整理近阶段工作的有关技术文档和操作流程', '4', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('803', '1', '37', '18', '4', 'autoware关键模块解读', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('804', '1', '37', '18', '4', 'autoware路径规划模块的学习', '3.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('805', '1', '37', '18', '1', '新电脑的linux系统安装和ROS操作系统的安装', '4', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('806', '1', '37', '18', '1', '新电脑的ROS安装', '3', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('807', '1', '37', '18', '1', '新电脑的GPU配置', '4.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('808', '1', '37', '18', '1', '个人电脑的GPU配置及autoware的GPU版本安装', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('809', '1', '37', '18', '1', '个人电脑的autoware的GPU版本配置', '2.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('810', '1', '37', '18', '1', '新电脑的GPU驱动安装（驱动安装后不能显示，系统查找后提示没有安装）', '5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('811', '1', '37', '18', '1', '新电脑的nvidia显卡驱动安装', '7.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('812', '1', '37', '18', '1', '新电脑的nvidia显卡驱动安装', '7.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('813', '1', '37', '18', '1', 'LGSVL环境安装', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('814', '1', '37', '18', '1', 'LGSVL模拟环境配置', '4', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('815', '1', '37', '18', '1', 'LGSVL模拟环境配置', '2.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('816', '6', '24', '19', '1', '继续调研深度估计,开始转向测距', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('817', '6', '24', '19', '1', '安装环境', '7.5', '0', '99', '2020-06-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('818', '6', '24', '19', '1', '安装环境', '7.5', '0', '99', '2020-06-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('819', '6', '24', '19', '1', '安装环境', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('820', '6', '24', '19', '1', '调研yolov5', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('821', '6', '24', '19', '1', '着手编写v5检测代码', '7.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('822', '6', '24', '19', '1', '整合测距的代码', '7.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('823', '6', '51', '8', '4', '姚阳入职手续的办理、相关权限的开通、档案的扫描整理并转总部，招聘工作的跟进，事业部人员结构的填写，转正人员基本信息的修改', '3.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('824', '6', '50', '8', '4', '事业部周例会的组织，报销流程的提交，企业邮箱的认证，常州合同的用印及邮寄', '4', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('825', '6', '51', '8', '4', '招聘工作的梳理，考勤表签字确认，绩效的汇总，招聘工作：推荐3份简历', '4', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('826', '6', '50', '8', '4', '配合总部进行固定资产的管理、烟酒的管理，日常行政事务的对接', '3.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('827', '6', '51', '8', '4', '五险一金账单的制作及付款流程的提交，刘信言、王璐的面试安排，招聘平台的数据更新', '5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('828', '6', '50', '8', '4', '耿院长材料的盖章，对接日常行政事务', '2.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('829', '6', '51', '8', '4', '曾关键、石晓铭、陈宝剑面试的安排，招聘', '3.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('830', '6', '50', '8', '4', '学习新开公司税务报到等事宜，领导发票的整理，对接日常行政事务', '4', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('831', '6', '51', '8', '4', '工资表初稿的制作，招聘工作，李帆面试的安排，社保减免费用的统计', '4', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('832', '6', '50', '8', '4', '花名册、项目管理、周报、KPI跟进表、会议纪要及事业部快递清单等文档的编制，新开公司公章的对接刻制', '3.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('833', '6', '50', '8', '4', '事业部周例会的组织，接待南理工老师', '4', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('834', '6', '51', '8', '4', '工资表的制作，考勤数据的汇总，招聘工作', '3.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('835', '6', '50', '8', '4', '常州补充协议的用印存档，新开公司公章、营业执照转交总部，修改新开公司的章程、为银行开户做准备', '4', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('836', '6', '51', '8', '4', '工资表、成本分摊表定稿，招聘', '3.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('837', '6', '51', '8', '4', '姚阳三方协议的签署、反馈事业部实习生招聘情况，招聘工作', '2.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('838', '6', '50', '8', '4', '接待华为公司审核人员，公司章程的修改，贴发票，为银行开户上门核实做准备', '5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('839', '6', '50', '8', '4', '前往银行办理开户事宜，提交速度软件股改申请流程', '5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('840', '6', '51', '8', '4', '招聘工作，日常人事工作的对接', '2.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('841', '6', '51', '8', '4', '吴洋面试的安排，任虎成录用流程的提交、offer的发放，招聘工作', '3.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('842', '6', '50', '8', '4', '花名册、项目管理、快递汇总表、周报、KPI跟进表、会议纪要及重点项目跟进表等表单的制作，固定资产的采购：两台台式机', '4', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('843', '6', '51', '8', '4', '陆海芳入职的办理、相关权限的开通、档案的整理与转交，成本分摊表的制作', '3.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('844', '6', '50', '8', '4', '事业部周例会的组织，验收单的用印，事业部固定资产流转单的填写，整理中山同事的发票并转交总部财务', '4', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('845', '6', '50', '8', '4', '外出办理速度软件股改事宜，日常行政事务的对接', '4', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('846', '6', '51', '8', '4', '吴洋录用审批流程的提交、offer的发放，待入职人员龙冰心的对接，培训费用付款流程的提交与追踪', '3.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('847', '6', '51', '8', '4', '工资表的定稿，吴洋三方协议的签署，招聘工作', '3.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('848', '6', '50', '8', '4', '参与总部行政会议，外出半天办理速度软件股改事宜', '4', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('849', '6', '50', '8', '4', '外出3小时办理银行开户事宜,、相关材料已转交总部财务，固定资产的采购：两台台式机、一台笔记本，总部行政会议的参与，华为6份材料的扫描并转交总部管理', '5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('850', '6', '51', '8', '4', '龙冰心三方协议的签署，王禧媛录用审批流程的提交、offer的发放', '2.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('851', '6', '50', '8', '4', '指导陆海芳周报等工作，花名册、项目管理及事业部快递汇总表的制作，日常行政工作的对接', '4', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('852', '6', '51', '8', '4', '公积金的汇缴，招聘工作', '3.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('853', '6', '24', '19', '1', '测试测距代码', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('854', '6', '24', '19', '1', '配置新电脑环境,在gpu上运行代码', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('855', '6', '24', '19', '3', '确立之后的开发目标,封装代码', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('856', '6', '24', '19', '1', '整理630算法', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('857', '13', '49', '26', '1', '办理入职手续、学习数据标注目的、方式及常用软件安装', '3.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('859', '13', '49', '26', '1', '安装数据标注软件及练习，查找汽车数据集', '3.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('860', '13', '49', '26', '1', '查找汽车数据集，并制定汽车分类标准', '2.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('862', '13', '49', '26', '1', '下载汽车数据集、了解深度学习及数据集质量要求', '2.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('863', '6', '51', '8', '4', '王禧媛入职的办理、权限的开通及档案的整理，龙冰心三方协议的签署及邮寄，招聘，招聘网站套餐的采购', '3.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('864', '6', '50', '8', '4', '事业部周例会的组织，华为材料及新开公司材料的转交，VPN的采购', '4', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('865', '6', '51', '8', '4', '考勤数据的初步整理，外出3小时前往银行更换公积金CA证书，招聘网站的对接', '5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('866', '6', '50', '8', '4', '总部行政会议的参与，外出接待', '2.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('867', '6', '24', '19', '1', '完成新电脑的环境搭建', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('868', '1', '37', '18', '4', '多目标跟踪算法调研', '1.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('869', '1', '37', '18', '1', '完成autoware与LGSVL的连接，及demo的初始测试', '4', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('870', '1', '37', '18', '1', 'autoware与LGSVL的demo调试，主要解决自动驾驶过程中的无法避障问题', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('871', '1', '37', '18', '1', '查找解决车辆无法自动避障的原因及解决方法', '6.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('872', '1', '37', '18', '1', '查找解决LGSVL与autoware连接驾驶，如何录制路径点问题', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('873', '1', '37', '18', '1', '解决LGSVL如何录制路径点', '6.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('874', '1', '37', '18', '1', '查找LGSVL矢量地图不能识别的问题', '1', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('875', '1', '37', '18', '1', '查找LGSVL矢量地图不能识别的原因及解决方法', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('876', '13', '49', '26', '1', '参与例会', '1', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('877', '13', '49', '26', '1', '查找并学习使用3d框数据标注软件', '2.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('878', '13', '49', '26', '1', '寻找符合标准的标注软件', '2.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('879', '13', '49', '26', '1', '下载汽车数据集', '2.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('880', '13', '49', '26', '1', '尝试下载3d-bat-master标注软件', '2.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('881', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('882', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('883', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('884', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('885', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图 3、制作基于常州道路数据宣传图片', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('886', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('887', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('888', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('889', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('890', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('891', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('892', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('893', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('894', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('895', '1', '36', '22', '1', '基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图', '4', '0', '99', '2020-06-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('896', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('897', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('898', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('899', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '7.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('900', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('901', '1', '36', '22', '1', '完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）', '4', '0', '99', '2020-06-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('923', '1', '36', '24', '1', '基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('924', '1', '36', '24', '1', '基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('925', '1', '36', '24', '1', '基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('926', '1', '36', '24', '1', '基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '7.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('927', '1', '36', '24', '1', '基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('928', '1', '36', '24', '1', '基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型', '4', '0', '99', '2020-06-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('929', '1', '36', '24', '1', '使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('930', '1', '36', '24', '1', '使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。', '7.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('931', '1', '36', '24', '1', '实现SVN同步工作，使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。', '7.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('932', '1', '36', '24', '1', '使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。', '7.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('933', '1', '36', '24', '1', '使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('934', '1', '36', '24', '1', '使用程序化植物生成器生成道路附近树木。使用UE4依照常州虚拟道路完成马路两侧人行道的放置，以及周围环境的美化。', '4', '0', '99', '2020-06-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('935', '1', '36', '24', '1', '完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型，', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('936', '1', '36', '24', '1', '完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型，', '8.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('937', '1', '36', '24', '1', '更新道路与建筑物模型,给道路加上绿化带，检查并修复道路绿化带边缘材质问题.', '7.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('938', '1', '36', '24', '1', '更新道路与建筑物模型,给道路加上绿化带，检查并修复道路绿化带边缘材质问题.', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('939', '1', '36', '24', '1', '修复人行道模型和道路连接处的缝隙。给场景中加上天空白云蓝图。', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('940', '1', '36', '24', '1', ' 	 设置了UE4的常州道路虚拟光照环境，场景昼夜交替，实现场景中太阳，天空云朵蓝图实时变换。检查虚拟道路场景中的模型，并更换闪烁的贴图。', '7.5', '0', '99', '2020-06-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('941', '1', '36', '24', '1', '修复常州道路虚拟场景中心园区贴图丢失问题。', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('942', '1', '36', '24', '1', '将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('943', '1', '36', '24', '1', '根据常州道路全景地图放置道路标牌，路灯蓝图。', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('944', '1', '36', '23', '1', '完成学校的绘制', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('945', '1', '36', '23', '1', '规划弯道线', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('946', '1', '36', '23', '1', '绘制弯道线', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('947', '1', '36', '23', '1', '绘制小车模型', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('948', '1', '36', '23', '1', '对小车模型动态处理', '7.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('949', '1', '36', '23', '1', '修改道路边线', '9', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('950', '1', '36', '23', '1', '完善场景', '7.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('951', '1', '36', '23', '1', '了解智慧城市系统', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('952', '1', '36', '23', '1', '了解智慧城市,查看所需功能', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('953', '1', '36', '23', '1', '探究threejs光照和阴影的功能', '7.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('954', '1', '36', '23', '1', '查看场景切换功能', '7.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('955', '1', '36', '23', '1', '实现第二种场景功能', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('956', '1', '36', '23', '1', '初步探索碰撞,编写相关代码', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('957', '1', '36', '23', '1', '编写碰撞代码', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('958', '1', '36', '23', '1', '了解红绿灯代码,并且完善碰撞代码', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('959', '1', '36', '23', '1', '解决了碰撞代码的bug', '3', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('960', '1', '36', '23', '1', '编写了红绿灯函数,但存在问题', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('961', '1', '36', '27', '1', '1.入职培训；2.开发中国地图飞行线项目', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('962', '7', '31', '20', '3', '由于之前智慧景区框架不清晰；所以重新组织智慧景区-系统总构架及云平台构架', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('963', '7', '31', '20', '4', '输出Word11页；阅读SOA框架论文19份；搞清B/S架构、面向服务思想、NB-IoT等概念及GIS在SOA框架中的思考；', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('964', '7', '31', '20', '4', '将方案设计定为Web端与App端公用一个服务器；按SOA思想-将全部子系统分解为服务组件；', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('965', '7', '31', '20', '3', '对重点的18篇SOA论文及相关框架图进行分析，输出自己的系统框架图。', '7.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('966', '7', '31', '20', '3', '制作智慧景区-系统分层框架图', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('967', '7', '31', '20', '4', '1. TDOM、游戏引擎Unity3D与UE4, 网络与实体电话联通原理 2. 智慧产业园硬件软件标准 3.学习大数据平台Hadoop相关知识 3. 下载安装了解虚幻四引擎', '4', '0', '99', '2020-06-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('968', '7', '31', '20', '4', '1.学习使用了UE4, 2.学习智慧旅游研究报告，输出思维导图1份 3.了解敏捷开发、用户体验地图、用户故事。', '5', '0', '99', '2020-06-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('969', '7', '31', '20', '4', '出差从南京到中山', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('970', '7', '31', '20', '3', '1.制作智慧阜新word。2.阜新新政策规划收资一份', '8', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('971', '7', '31', '20', '1', '1.完成智慧阜新 生态平安、矿山、投资建设模式、运营、效益分析', '9', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('972', '7', '31', '20', '1', '1.完成智慧阜新初稿1.0，优化运营模式，盈利模式，融资手段', '8', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('973', '7', '31', '20', '1', '去翠投帮忙整理财务报表', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('974', '7', '31', '20', '1', '去翠投帮忙整理财务报表', '7.5', '0', '99', '2020-06-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('975', '7', '31', '20', '4', '1. 大数据中心、运营中心，收资-阅读-二期技术方案', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('976', '7', '31', '20', '3', '1.阅读资料论文 2.编写数据中心安全管理制度', '7.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('977', '7', '31', '20', '3', '1.两份数据中心管理制度文档，一份日常运营，一份运维规范', '8.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('978', '7', '31', '20', '3', '1份Word-智慧城市运营中心管理制度。', '8.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('979', '7', '31', '20', '3', '1.工程车辆管理详细设计刷格式 2. 学习二期的材料', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('980', '7', '31', '20', '4', '1.学习二期数据中心投标文档 ', '7.5', '0', '99', '2020-06-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('981', '7', '31', '20', '3', '辅助智慧交通岛PPT制作', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('982', '7', '31', '20', '4', '对智慧景区相关资料学习，并思考相关建设思路', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('983', '7', '31', '20', '3', '从中山市回南京', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('984', '7', '31', '20', '3', '完善智慧景区v1.2(10%); D-InSAR、SBAS-InSAR、PS-InSAR相关知识补充回顾; 继续学习二期相关材料', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('985', '7', '25', '12', '3', '智慧康养方案：资料学习、编制PPT；例会', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('986', '7', '25', '12', '3', '智慧康养方案：资料学习、编制PPT', '8', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('987', '7', '25', '12', '3', '智慧康养方案：资料学习、编制PPT', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('988', '7', '25', '12', '3', '智慧康养方案：编制、优化PPT', '8', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('989', '7', '25', '12', '3', '智慧康养方案：优化PPT', '4.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('990', '6', '6', '12', '4', '无人机培训', '3.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('991', '7', '25', '12', '3', '南京到中山出差， 阜新智慧城市会议及资料收集', '10', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('992', '7', '25', '12', '3', '阜新政策收集、背景整理，建设内容编写整理', '11.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('993', '7', '25', '12', '3', '阜新建设内容编写整理、实施路径、建设思路', '9.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('994', '7', '25', '12', '3', '阜新智慧城市 内容修改完善；合资公司 功能梳理', '9.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('995', '7', '25', '12', '3', '阜新智慧城市架构图绘制；学习翠亨知识', '9.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('996', '12', '48', '12', '3', '运营内容编写', '7.5', '0', '99', '2020-06-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('997', '7', '25', '12', '3', '阜新智慧城市：融入数字及地方产业 农业 医疗 交通等方面的特色点，编写', '3', '0', '99', '2020-06-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('998', '12', '48', '12', '3', '阜新方案优化，融入数字及地方产业 农业 医疗 交通等方面的特色点，编写', '9.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('999', '12', '48', '12', '3', '编制关于翠亨新区基础数据更新管理办法;', '9', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1000', '12', '48', '12', '3', '编制、完善关于翠亨新区基础数据更新管理办法;', '9', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1001', '12', '48', '12', '3', '运营内容编写，增加流程图等内容', '9.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1002', '12', '48', '12', '4', '物业智能安全巡检详细设计方案 内容修改 排版', '8.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1003', '12', '48', '12', '4', '物业排版；数据标内容整理 脑图', '6.5', '0', '99', '2020-06-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1004', '12', '48', '12', '4', '无人驾驶试点分布PPT图制作、参观规划馆、例会', '8.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1005', '12', '48', '12', '3', '编制关于翠亨新区城市网格化管理办法', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1006', '12', '48', '12', '4', '中山回南京', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1007', '12', '48', '12', '4', '华为标内容梳理、交通配合、例会', '8.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1008', '6', '24', '19', '1', '研究图像转换', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1009', '6', '24', '19', '1', '继续研究鸟瞰图的转换', '7.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1010', '13', '49', '26', '1', '查找下载apollpscape汽车数据集', '3.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1011', '13', '49', '26', '1', '尝试下载3d-bat标注集及相关安装软件、了解已标注数据集编码', '4.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1012', '6', '24', '19', '1', '阅读射影变换相关内容', '7.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1013', '1', '37', '15', '1', 'SOMKE3D识别模型复现', '7.5', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1014', '1', '37', '15', '1', 'SOMKE3D识别模型复现', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1015', '1', '37', '15', '1', 'SOMKE3D识别模型复现', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1016', '13', '49', '15', '3', '项目立项PPT1.0版编写 World 1.0版本编写，及内部评审', '7.5', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1017', '13', '49', '15', '3', '南航交流高精度地图项目，达成共建实验室意项', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1018', '1', '34', '15', '3', '宿迁高速项目技术可研报告编写', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1019', '1', '34', '15', '3', '宿迁高速项目技术可研报告编写', '7.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1020', '13', '49', '15', '3', '立项World更改V1.1', '7.5', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1021', '13', '49', '15', '3', '立项World更改V1.1', '4.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1022', '13', '49', '15', '3', '宣传手册图片修改', '3', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1023', '13', '49', '15', '3', '项目立项PTTV1.1修改', '7.5', '0', '99', '2020-06-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1024', '13', '49', '15', '3', '项目立项PTTV1.1修改', '7.5', '0', '99', '2020-06-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1025', '13', '49', '15', '3', '项目立项PTTV2.1完善', '7.5', '0', '99', '2020-06-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1026', '13', '49', '15', '3', '项目立项PTTV2.1完善，World2.1版本编写', '7.5', '0', '99', '2020-06-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1027', '13', '49', '15', '3', '项目立项PTTV2.1完善，项目立项答辩', '7.5', '0', '99', '2020-06-19 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1028', '13', '49', '15', '3', '根据指导意见修改项目立项报告', '7.5', '0', '99', '2020-06-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1029', '6', '17', '15', '4', '参加华为云计算城市峰会', '7.5', '0', '99', '2020-06-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1030', '13', '49', '15', '1', '完成项目立项报告V1.0版本，南京交院交流。', '7.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1031', '13', '49', '15', '1', '完成南京交院PPTV1.0版，完成立项报告V1.1版本', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1032', '13', '49', '15', '4', '确认本地网站发布的多种方式，提交立项world', '7.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1033', '6', '16', '15', '4', '中交信科接待', '4.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1034', '13', '49', '15', '3', '跟踪南航实验室，跟踪南交院，总结中交信科需求', '3', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1035', '1', '37', '18', '1', '使用Shalun、BorregasAve、SanFranciso等不同地图与autoware官网demo地图对比，尝试找出矢量地图不能显示的原因', '7.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1036', '1', '37', '18', '1', '尝试通过重新下载数据包、重新录制路径点等方法解决autoware车辆不受控制的问题', '6.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1037', '1', '37', '18', '4', '阶段性资料整理、备份', '1', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1038', '1', '37', '18', '4', '阶段性资料整理、备份，组装新电脑', '4.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1039', '1', '37', '18', '4', '纯跟踪轨迹算法学习', '3', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1040', '7', '31', '20', '3', '《翠亨二期建设可行性研究报告》-思维导图(20%))', '7.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1041', '7', '31', '20', '3', '《翠亨二期建设可行性研究报告》-思维导图(45%)', '8.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1042', '13', '49', '26', '1', '熟悉3d-bat标注软件并讨论用途', '3.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1043', '13', '49', '26', '1', '调整软件中已有标注数据并记录', '4.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1044', '13', '49', '26', '1', '下载相关汽车数据集', '2.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1045', '13', '49', '26', '1', '熟悉标注流程，对3d-bat数据集中的汽车进行分类', '2.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1046', '13', '49', '26', '1', '标注并整理数据集第0-4帧', '2.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1047', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '8.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1048', '1', '36', '24', '1', '基于常州道路全景地图放置市政护栏模型，删除和修改项目合并出错模型，制作并放置各种类型红绿灯蓝图和交通标志牌（完成80%）。', '7.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1049', '1', '36', '24', '1', '检查并修复道路材质问题，完成放置标牌模型，解决场景阴影过重问题。', '8.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1050', '1', '36', '24', '1', '将Carla中的红绿灯蓝图迁移到常州道路场景中，并更亮灯逻辑。测试UE4中Multi-User Editing插件实现多人实时协同工作。', '7.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1051', '1', '36', '24', '1', '更改并添加Carla中的道路材质蓝图，实现下雨天气在道路上在道路上显示雨滴和积水效果。', '7.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1052', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1053', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1054', '1', '36', '22', '1', '基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '7.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1055', '13', '49', '26', '1', '标注并整理数据集第5-16帧', '4.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1056', '13', '49', '26', '1', '查找并下载相关汽车数据集', '1', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1057', '13', '49', '26', '1', '讨论学习3d-bat代码实现过程', '2', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1058', '13', '49', '26', '1', '标注并整理数据集第17-25帧', '3.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1059', '13', '49', '26', '1', '标注并整理数据集第26-35帧', '4', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1060', '7', '31', '20', '3', '《智慧景区》PPTv1.2 （15%）；《翠亨二期建设可行性研究报告》-思维导图（55%）', '7.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1061', '7', '31', '20', '3', '《智慧景区》PPTv1.2 （30%）；《翠亨二期建设可行性研究报告》-思维导图（70%）', '8.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1062', '7', '31', '20', '3', '《智慧景区》PPTv1.2 （50%）；《翠亨二期建设可行性研究报告》-思维导图（80%）', '8', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1063', '1', '37', '18', '4', 'autoware有关工作的阶段性整理、备份以及工作交接', '6', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1064', '1', '37', '18', '4', '新电脑的常用软件安装', '1.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1065', '1', '37', '18', '4', '新电脑的cuda安装，基于anaconda环境的tensorflow、pytorch环境配置', '4.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1066', '1', '37', '18', '4', '基于点云三维检测技术调研', '3', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1067', '1', '37', '18', '4', '基于点云三维检测技术调研', '7.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1068', '1', '37', '18', '4', '电脑系统重装，软件及环境重新安装', '4.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1069', '1', '37', '18', '4', '基于点云三维检测技术调研', '3', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1070', '13', '49', '26', '1', '查找汽车数据集', '2', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1071', '13', '49', '26', '1', '标注并整理3d-bat数据集35-45帧', '4.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1072', '13', '49', '26', '1', '参与例会', '1', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1073', '13', '49', '19', '1', '开始研究点云向二维场景的转换', '7.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1074', '13', '49', '19', '1', '开始学习pcl库', '7.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1075', '13', '49', '19', '1', '继续学习', '7.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1076', '13', '49', '19', '1', '配置好vcpkg等包,安装相关环境', '7.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1077', '13', '49', '19', '1', '解决pcl无法可视化的问题', '7.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1078', '13', '49', '26', '1', '标注并整理3d-bat数据集45-50帧', '2.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1079', '13', '49', '26', '1', '查找汽车数据集并下载', '2.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1080', '13', '49', '26', '1', '尝试下载其他标注工具', '2.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1081', '13', '49', '19', '1', '重新编译pcl', '7.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1082', '13', '49', '26', '1', '浏览kitti网站尝试下载汽车数据集', '3.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1083', '13', '49', '26', '1', '了解并尝试安装其他三维数据标注软件', '4', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1084', '13', '49', '19', '1', '转正ppt不合格,修改', '7.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1085', '13', '49', '26', '1', '在kitti和apolloscape上下载汽车数据集', '3.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1086', '13', '49', '26', '1', '探索标注工具下载与使用', '4', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1087', '13', '49', '28', '3', '编写专利', '4', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1088', '13', '49', '28', '1', '3D点云目标检测算法调查', '3.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1089', '13', '49', '28', '1', '3D点云目标检测算法调查', '5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1090', '13', '49', '28', '3', '根据反馈意见修改专利', '2.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1091', '13', '49', '28', '1', '软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '4', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1092', '13', '49', '28', '1', '编写专利', '7.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1093', '13', '49', '28', '1', '3D点云目标检测算法调查', '3.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1094', '13', '49', '28', '1', '编写专利', '7.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1095', '13', '49', '28', '1', '软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '6', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1096', '13', '49', '28', '1', '软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '6', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1097', '13', '49', '28', '1', '3D点云目标检测算法调查', '1.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1098', '13', '49', '28', '1', '3D点云目标检测算法调查', '1.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1099', '13', '49', '26', '1', '查找下载可用汽车数据集', '3.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1100', '13', '49', '26', '1', '安装并熟悉labelimg标注软件', '4', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1101', '7', '29', '9', '3', '编写智慧交通管理办法建议', '8', '0', '99', '2020-06-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1102', '7', '29', '9', '3', '编写网联汽车道路测试规范', '7.5', '0', '99', '2020-06-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1103', '7', '29', '9', '3', '编写交通资源管理办法', '7.5', '0', '99', '2020-06-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1104', '7', '29', '9', '3', '现场实地勘探翠亨新区，了解目前的交通建设情况', '8', '0', '99', '2020-06-04 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1105', '7', '29', '9', '3', '收集翠亨新区的建设规划、智慧交通、智慧城市的资料', '7.5', '0', '99', '2020-06-05 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1106', '7', '29', '9', '3', '配合人工智能研究院完成高精地图数字服务平台评审汇报材料', '7.5', '0', '99', '2020-06-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1107', '7', '29', '9', '3', '配合人工智能研究院完成高精地图数字服务平台立项材料', '7.5', '0', '99', '2020-06-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1108', '7', '29', '9', '3', '整理城市级智能网联示范区汇总材料', '8', '0', '99', '2020-06-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1109', '7', '29', '9', '3', '优化翠亨新区智慧交通岛设计建设方案，完成50%', '7.5', '0', '99', '2020-06-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1110', '7', '29', '9', '3', '优化翠亨新区智慧交通岛设计建设方案，完成70%', '7.5', '0', '99', '2020-06-12 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1111', '13', '49', '26', '1', '熟悉labelimg标注软件并使用', '1', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1112', '13', '49', '26', '1', '参与例会', '1', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1113', '13', '49', '26', '1', '对猪的数据集标注565张', '5.5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1114', '13', '49', '26', '1', '对猪的数据集标注260张', '3', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1115', '13', '49', '26', '1', '查找收集车道线标注数据集', '4.5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1116', '13', '49', '19', '1', '解决猪的数据集问题', '7.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1117', '13', '49', '19', '1', '开始编译yolov4', '7.5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1118', '13', '49', '19', '1', '安装相关环境', '7.5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1119', '13', '49', '19', '1', '开始训练', '7.5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1120', '13', '49', '26', '1', '下载kitti、apollo车道线标注数据集', '5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1121', '13', '49', '26', '1', '查找数据集标注规范', '2.5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1122', '13', '49', '19', '1', '编写点云离群点滤波代码', '7.5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1123', '1', '37', '18', '4', '视觉与激光雷达的数据融合算法调研', '7.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1124', '1', '37', '18', '4', '视觉与激光雷达的数据融合算法调研', '4.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1125', '1', '37', '18', '4', '基于多传感器融合算法的3D目标检测学习', '3', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1126', '1', '37', '18', '4', '基于多传感器融合算法的3D目标检学习', '3.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1127', '1', '37', '18', '4', '述职报告编写', '4', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1128', '1', '37', '18', '4', '技术方案研讨及确定', '3.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1129', '1', '37', '18', '4', '转正评审会', '1.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1130', '1', '37', '18', '4', '调研报告总结，资料整理', '2.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1131', '1', '37', '18', '4', '方案修改及技术路线重新制定研讨会', '5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1132', '1', '37', '18', '4', 'MLOD算法学习', '2.5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1133', '1', '37', '18', '4', '图像与点云数据融合综述论文阅读及总结', '5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1134', '1', '37', '18', '4', '3维点云语义分割学习', '2.5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1135', '1', '37', '18', '4', '3维点云分割算法调研，包括语义分割、实例分割、全景分割', '4', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1136', '1', '37', '18', '4', '3维点云分割算法调研', '2', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1137', '1', '37', '18', '4', 'SPLATNet分割算法的论文阅读及原理理解', '5.5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1138', '13', '49', '26', '1', '下载kitti、apollo车道线标注数据集', '5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1139', '13', '49', '26', '1', '查找学习数据集标注规范', '2.5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1140', '13', '49', '26', '1', '下载kitti、apollo车道线标注数据集', '5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1141', '13', '49', '26', '1', '查找学习数据集标注规范', '2.5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1142', '6', '51', '8', '4', '考勤数据汇总，招聘，安排面试：郑鹏飞，上传工资数据', '5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1143', '6', '50', '8', '4', '配合领导完成行政相关事宜', '2.5', '0', '99', '2020-06-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1144', '6', '51', '8', '4', '吴洋入职手续的办理、相关权限的开通，绩效流程的审批与汇总，参与总部人事会议，招聘', '4', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1145', '6', '50', '8', '4', '事业部周例会的组织，配合总部财务进展新开两家公司税务报到的事宜', '3.5', '0', '99', '2020-06-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1146', '6', '50', '8', '4', '重新刻制速度软件法人章，上半年事业部固定资产的清单核实，预约次日接待饭店', '3', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1147', '6', '51', '8', '4', '制作五险一金账单，更新事业部花名册，编制事业部培训文档，招聘', '4.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1148', '6', '50', '8', '4', '事业部固定资产汇总表反馈总部行政，对接日常的行政事务', '2', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1149', '6', '51', '8', '4', '完成考勤表、绩效汇总表、工资表初稿的制作，招聘', '5.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1150', '6', '51', '8', '4', '招聘，反馈五险一金账单', '4', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1151', '6', '50', '8', '4', '配合总部进行事业部微信群的转移，对接日常行政事务', '3.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1152', '6', '51', '8', '4', '綦晓杰入职的办理、相关权限的开通、OA等软件的指导，约面：陈萌，招聘：推荐5份简历', '5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1153', '6', '50', '8', '4', '采购流程的提交，事业部现金流预测表的核实，事业部项目自行保管台账的提交，对接日常行政事务', '2.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1154', '6', '50', '8', '4', '周报、会议纪要、花名册、项目管理表单、事业部快递统计表等表单的制作，外出前往银行办理新开公司相关事宜', '5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1155', '6', '51', '8', '4', '匹配五险一金账单，制作工资及成本分摊表，约面：张雪，招聘：推荐2份简历', '2.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1156', '6', '51', '8', '4', '发起4位实习生的转正流程，安排面试：张雪、夏伟、尹凤飞，转正评审会的前期准备，实习生转正签署劳动合同，招聘：推荐3份简历', '5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1157', '6', '50', '8', '4', '周例会的组织，推文计划的提交', '2.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1158', '6', '51', '8', '4', '安排面试：李信融、何婷，提交五险一金的付款流程', '4', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1159', '6', '50', '8', '4', '对接日常的行政事宜，配合进行保密检查，安排一楼办公区位置', '3.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1160', '6', '50', '8', '4', '年中汇报材料的制作，对接日常的行政事宜', '3.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1161', '6', '51', '8', '4', '招聘，面试：丁辉鹏', '4', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1162', '6', '51', '8', '4', '面试：夏伟、李信融复试，整理考勤数据', '3.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1163', '6', '50', '8', '4', '配合总部财务前往银行办理相关事宜，对接日常的行政事宜', '4', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1164', '6', '51', '8', '4', '整理智联招聘平台数据，考勤汇总表签字确认，招聘：推荐4份简历，发offer：何婷、龙冰心、夏伟，进行转正评审会', '5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1165', '6', '50', '8', '4', '花名册、项目管理表单、周报等表单的更新，日强文印发票的审核及付款流程的提交', '2.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1166', '6', '50', '8', '4', '周例会的组织，日常行政事务的对接', '3', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1167', '6', '51', '8', '4', '何婷入职的办理、相关权限的开通、OA等软件的指导，招聘：推荐3份简历，企业微信微盘（人事数据）的更新）', '4.5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1168', '6', '51', '8', '4', '招聘：筛选30份简历、推荐6份，面试：沈嘉成，核实考勤打卡地点', '3.5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1169', '6', '50', '8', '4', '陪同总部财务前往税务局将速度时空在速度软件的股份转移给新开的两家公司', '4', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1170', '6', '51', '8', '4', '龙冰心、夏伟的入职办理：开通相关权限、相关软件的指导等，社保缴纳材料的准备，招聘：筛选20份简历、推荐5份简历、约面于福忠、殷瑞', '5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1171', '6', '50', '8', '4', '对接日常的行政事宜，转交智联招聘合同', '2.5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1172', '6', '51', '8', '4', '用印、整理实习生转正及新入职同事签署的相关材料，更新花名册及OA系统中的人员信息，招聘：筛选30份简历、推荐5份简历', '5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1173', '6', '50', '8', '4', '对接日常的行政事务', '2.5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1174', '6', '50', '8', '4', '花名册、项目管理表单、周报等表单的编写', '2.5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1175', '6', '51', '8', '4', '解顶林离职手续的办理，面试：安排梁富、陈东亮，约面：王伟，招聘：筛选70份简历、推荐9份简历，工资表个税版的制作，于福忠录用审批流程的提交及offer的发放，', '5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1176', '13', '49', '26', '1', '查找下载与车道线有关的数据集', '3.5', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1177', '13', '49', '26', '1', '研究车道线标注工具使用方法及练习', '3', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1178', '13', '49', '26', '1', '查找并学习数据集标注规范', '3.5', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1179', '13', '49', '26', '1', '查找下载与车道线有关的数据集', '4', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1180', '13', '49', '26', '1', '研究车道线标注工具使用方法及练习', '3.5', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1181', '13', '49', '26', '1', '查找并学习数据集标注规范', '4', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1182', '13', '49', '26', '1', '参加例会', '1', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1183', '13', '49', '26', '1', '查找下载与车道线有关的数据集', '3.5', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1184', '13', '49', '26', '1', '研究车道线标注工具使用方法及练习', '4', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1185', '13', '49', '26', '1', '查找并学习数据集标注规范', '3.5', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1186', '13', '49', '26', '1', '更新本周小结及规划下周工作安排', '2', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1187', '13', '49', '26', '1', '查找下载与车道线有关的数据集', '2', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1188', '13', '49', '19', '1', '继续编写代码', '7.5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1189', '13', '49', '19', '1', '完成csf的学习', '7.5', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1190', '13', '49', '19', '1', '编译csf代码', '7.5', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1191', '13', '49', '19', '1', '整合所有的滤波代码', '7.5', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1192', '13', '49', '19', '1', '解决算法无法编译的问题', '7.5', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1193', '13', '49', '19', '1', '重构算法', '7.5', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1194', '7', '29', '9', '3', '整理地理信息行业公司融资情况', '8.5', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1195', '7', '29', '9', '3', '整理地理信息行业公司发展现状', '7.5', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1196', '7', '29', '9', '3', '编写地图商业模式文档', '8.5', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1197', '7', '29', '9', '4', '编写高精地图市场预期', '7.5', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1198', '7', '29', '9', '3', '速度软件的宣传材料制作', '9', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1199', '13', '49', '26', '1', '查找适合的语义分割标注工具', '3.5', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1200', '13', '49', '26', '1', '参与例会', '1', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1201', '13', '49', '26', '1', '尝试下载语义分割标注工具', '3', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1202', '7', '31', '20', '4', '开会分配任务--明确了本次出差的整体目标', '3.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1203', '7', '31', '20', '4', '会议纪要；时空事业部已有平台系统展示介绍，吴经理介绍新区控规内容。', '7.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1204', '7', '31', '20', '4', '参观东凤镇指挥中心-与项目人员交流经验；听鹏总讲解二期概况及项目管理内容，输出笔记；阅读城市事件中心任务及资料', '9.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1205', '7', '31', '20', '4', '1.应急场景收集；2. 城市事件管理中心-灾害推演模型收资', '9.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1206', '7', '31', '20', '3', '1. 调查应急管理相关部门（从国家部级、广东省厅、中山市局），输出脑图一份；2.收集了国家应急标准', '7.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1207', '7', '31', '20', '3', '1. 学习应急管理材料，输出脑图一份；2. 学习二期项目整体框架图、数据流程图', '6', '0', '99', '2020-07-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1208', '7', '31', '20', '4', '应急管理相关材料收资，阅读 ；', '9', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1209', '7', '31', '20', '3', '设计应急管理系统调研方向，脑图一份（50%）', '9', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1210', '7', '31', '20', '3', '应急管理法律体系收集整理，输出word一份（100%），截图8张', '9', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1211', '7', '31', '20', '3', '项目全流程学习，输出4份流程图（100%）', '9', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1212', '7', '31', '20', '3', '《全国灾害综合风险普查实施方案》输出思维导图一份（10%）', '8', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1213', '7', '31', '20', '3', '《全国灾害综合风险普查实施方案》输出思维导图一份（15%）', '4', '0', '99', '2020-07-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1214', '7', '31', '20', '3', '全国灾害综合风险普查实施方案--地震灾害 整理归纳。（35%）', '7.5', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1215', '7', '31', '20', '3', '整理3份应急管理架构设计，输出脑图；参加华为架构师会议，输出会议纪要', '9', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1216', '7', '31', '20', '3', '消化第四份应急管理架构设计；参加华为周例会；承载体调查与评估，导图推进（40%）', '8', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1217', '7', '31', '20', '4', '学习《应急指挥辅助决策系统》招标文档，补充应急系统架构脑图的功能点；', '8', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1218', '7', '31', '20', '4', '学习企业级业务架构，构思业务架构图', '3.5', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1219', '7', '31', '20', '3', '制作业务架构图框架，确定业务数理逻辑，划分阶段与对象', '9', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1220', '7', '31', '20', '3', '丰富完善业务流程内容，包含四个阶段的初步业务内容规划', '8', '0', '99', '2020-07-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1221', '12', '48', '12', '4', '二期内容梳理', '7.5', '0', '99', '2020-06-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1222', '12', '48', '12', '4', '二期内容梳理', '7.5', '0', '99', '2020-06-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1223', '12', '48', '12', '4', '二期内容梳理', '7.5', '0', '99', '2020-07-01 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1224', '12', '48', '12', '4', '二期内容梳理', '8.5', '0', '99', '2020-07-02 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1225', '7', '25', '12', '4', '江苏无线电厂调研，交通知识学习', '8.5', '0', '99', '2020-07-03 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1226', '12', '48', '12', '4', '南京到中山、例会', '7.5', '0', '99', '2020-07-06 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1227', '12', '48', '12', '4', '二期项目进展会议、控规学习会议', '7.5', '0', '99', '2020-07-07 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1228', '12', '48', '12', '4', '东凤镇智慧城镇调研学习，事件中心资料收集', '7.5', '0', '99', '2020-07-08 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1229', '12', '48', '12', '4', '中山联通--车联网政策等交流；事件中心资料收集', '9.5', '0', '99', '2020-07-09 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1230', '12', '48', '12', '4', '搜集整理城市运行事件资料、团建', '7.5', '0', '99', '2020-07-10 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1231', '12', '48', '12', '4', '二期项目期间会议调研纪要整理、组织架构细化', '6.5', '0', '99', '2020-07-11 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1232', '12', '48', '12', '4', '平台和应用对应管理、无人机知识合并，平台深入了解', '7.5', '0', '99', '2020-07-13 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1233', '12', '48', '12', '4', '城市运行事件资料在搜集、海口市各局行政监管清单内容信息表收集整理', '7.5', '0', '99', '2020-07-14 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1234', '12', '48', '12', '4', '海口市各局行政监管清单内容信息表收集整理、华为周例会', '8.5', '0', '99', '2020-07-15 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1235', '12', '48', '12', '4', '海口市各局行政监管清单内容信息表收集整理、生态环保局相关责任及环保网格化巡查学习 梳理', '7.5', '0', '99', '2020-07-16 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1236', '12', '48', '12', '4', '食药监资料收集梳理', '7.5', '0', '99', '2020-07-17 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1237', '12', '48', '12', '4', '食药监资料收集梳理', '4', '0', '99', '2020-07-18 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1238', '12', '48', '12', '4', '文化出版等事件归集、事业部例会', '7.5', '0', '99', '2020-07-20 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1239', '12', '48', '12', '4', '食药监资料归集', '9', '0', '99', '2020-07-21 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1240', '12', '48', '12', '4', '食药监资料归集', '7.5', '0', '99', '2020-07-22 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1241', '12', '48', '12', '4', '食药监资料归集完善、广东智慧食药监系统梳理学习、部门例会2h', '7.5', '0', '99', '2020-07-23 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1242', '12', '48', '12', '4', '回南京', '7.5', '0', '99', '2020-07-24 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1243', '12', '48', '12', '4', '智慧工地梳理', '5', '0', '99', '2020-07-25 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1244', '12', '48', '12', '4', '食药监相关论文学习、例会 部门例会', '9', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1245', '12', '48', '12', '4', '智慧工地资料收集整理', '7.5', '0', '99', '2020-07-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1246', '12', '48', '12', '4', '智慧工地资料收集整理', '7.5', '0', '99', '2020-07-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1247', '13', '49', '26', '1', '安装语义分割标注工具环境', '4.5', '0', '99', '2020-07-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1248', '13', '49', '26', '1', '尝试安装point-cloud-annotation-tool-master', '3', '0', '99', '2020-07-28 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1249', '13', '49', '26', '1', '配置semantic segmentation editor的安装环境', '4.5', '0', '99', '2020-07-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1250', '13', '49', '26', '1', '安装semantic segmentation editor并熟悉使用', '3', '0', '99', '2020-07-29 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1251', '1', '3', '3', '1', '111111', '7.5', '0', '99', '2020-07-27 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1252', '13', '49', '26', '1', '解析semantic segmentation editor程序代码', '4.5', '0', '99', '2020-07-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1253', '13', '49', '26', '1', '参与新员工欢迎会&生日会', '1', '0', '99', '2020-07-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1254', '13', '49', '26', '1', '查找下载语义分割数据集', '2', '0', '99', '2020-07-30 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1255', '13', '49', '26', '1', '下载安装cloud compare点云软件', '2.5', '0', '99', '2020-07-31 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1256', '13', '49', '26', '1', '查找学习ply点云转换为pcd点云的方法', '3', '0', '99', '2020-07-31 00:00:00');
INSERT INTO `dt_project_workinghour` VALUES ('1257', '13', '49', '26', '1', '练习使用semantic segmentation editor标注软件', '2', '0', '99', '2020-07-31 00:00:00');

-- ----------------------------
-- Table structure for dt_project_workinghour_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_project_workinghour_log`;
CREATE TABLE `dt_project_workinghour_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` longtext,
  `workinghour_id` int(11) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `description` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1485 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_project_workinghour_log
-- ----------------------------
INSERT INTO `dt_project_workinghour_log` VALUES ('1', '温四林', '1', '3', '温四林添加了任务内容为[基于SpeedMap初步搭建地图编译平台]的工时信息', '99', '2020-04-08 09:06:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('2', '温四林', '2', '3', '温四林添加了任务内容为[基于cloudcompare搭建点云及全景影像量测的软件，完成shapefile与全景影像的关联]的工时信息', '99', '2020-04-08 09:06:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('3', '周艳', '3', '3', '周艳添加了任务内容为[专利保护中心改稿，修改专利]的工时信息', '99', '2020-04-10 11:47:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('4', '周艳', '4', '3', '周艳添加了任务内容为[季度总结会，讨论研发方向]的工时信息', '99', '2020-04-10 11:47:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('5', '周艳', '5', '3', '周艳添加了任务内容为[研究tt100k交通标志数据内部结构]的工时信息', '99', '2020-04-10 11:47:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('6', '周艳', '6', '3', '周艳添加了任务内容为[研究tt100k转换成yolo数据集形式；研究CCTSDB种类太少放弃使用]的工时信息', '99', '2020-04-10 11:47:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('7', '周艳', '7', '3', '周艳添加了任务内容为[新建模型定义的config文件，提取制作classes.names文件 ，训练yolov3]的工时信息', '99', '2020-04-10 11:52:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('8', '周艳', '8', '3', '周艳添加了任务内容为[尝试解决内存溢出问题，换yolo代码测试]的工时信息', '99', '2020-04-10 11:52:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('9', '周艳', '9', '3', '周艳添加了任务内容为[训练yolov3，调试Gaussian Yolov3]的工时信息', '99', '2020-04-10 11:52:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('10', '周艳', '7', '4', '周艳将填报时间由2020-04-06修改为2020-04-07', '99', '2020-04-10 11:53:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('11', '周艳', '8', '4', '周艳将填报时间由2020-04-07修改为2020-04-08', '99', '2020-04-10 11:53:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('12', '周艳', '9', '4', '周艳将填报时间由2020-04-08修改为2020-04-09', '99', '2020-04-10 11:53:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('13', '孙茂荣', '10', '3', '孙茂荣添加了任务内容为[数据服务平台和测绘商场平台竞品分析报告框架拟定]的工时信息', '99', '2020-04-10 13:38:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('14', '孙茂荣', '11', '3', '孙茂荣添加了任务内容为[数据服务平台和测绘商场平台竞品分析报告信息收集]的工时信息', '99', '2020-04-10 13:38:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('15', '孙茂荣', '12', '3', '孙茂荣添加了任务内容为[数据服务平台和测绘商场平台竞品分析报告编写工作]的工时信息', '99', '2020-04-10 13:38:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('16', '孙茂荣', '13', '3', '孙茂荣添加了任务内容为[数据服务平台和测绘商场平台竞品分析报告内部评审工作]的工时信息', '99', '2020-04-10 13:38:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('17', '孙茂荣', '10', '4', '孙茂荣将工作时长由0修改为8将项目子内容由潜在项目修改为市场信息收集', '99', '2020-04-10 13:41:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('18', '孙茂荣', '11', '4', '孙茂荣将工作时长由0修改为10将项目子内容由潜在项目修改为市场信息收集', '99', '2020-04-10 13:41:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('19', '孙茂荣', '12', '4', '孙茂荣将工作时长由0修改为9将项目子内容由潜在项目修改为市场信息收集', '99', '2020-04-10 13:41:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('20', '孙茂荣', '13', '4', '孙茂荣将工作时长由0修改为8将项目子内容由潜在项目修改为市场信息收集', '99', '2020-04-10 13:41:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('21', '孙茂荣', '14', '3', '孙茂荣添加了任务内容为[中山翠亨新区智慧交通设计方案-进一步完善编写工作]的工时信息', '99', '2020-04-10 13:46:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('22', '孙茂荣', '15', '3', '孙茂荣添加了任务内容为[中山翠亨新区智慧交通设计方案-内部评审工作]的工时信息', '99', '2020-04-10 13:46:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('23', '孙茂荣', '16', '3', '孙茂荣添加了任务内容为[中山翠亨新区智慧交通设计方案-根据评审进一步完善并形成V1.0版本]的工时信息', '99', '2020-04-10 13:46:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('24', '孙茂荣', '17', '3', '孙茂荣添加了任务内容为[中山翠亨新区智慧交通设计方案-根据评审进一步完善]的工时信息', '99', '2020-04-10 13:46:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('25', '陈淑琳', '18', '3', '陈淑琳添加了任务内容为[参与总部行政周例会；事业部季度总结会的文档编写]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('26', '陈淑琳', '19', '3', '陈淑琳添加了任务内容为[新员工耿禹的入职手续办理；3月考勤表的制作与2月考勤情况的签字核实；社保减免后的2月工资表及成本分摊表的重新制作]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('27', '陈淑琳', '20', '3', '陈淑琳添加了任务内容为[事业部招聘海报的制作；招聘工作的开展及网站信息的更新]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('28', '陈淑琳', '21', '3', '陈淑琳添加了任务内容为[新员工耿禹显示器的采购；耿禹、温四琳和高恒娟的名片印制]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('29', '陈淑琳', '22', '3', '陈淑琳添加了任务内容为[绩效流程的填写；事业部绩效数据的汇总]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('30', '陈淑琳', '23', '3', '陈淑琳添加了任务内容为[对接中山郑曼，就近期招聘等工作进行沟通与交流]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('31', '陈淑琳', '24', '3', '陈淑琳添加了任务内容为[事业部季度总结会的组织]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('32', '陈淑琳', '25', '3', '陈淑琳添加了任务内容为[3月考勤表的制作与2月考勤情况的签字核实]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('33', '陈淑琳', '26', '3', '陈淑琳添加了任务内容为[招聘工作的开展]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('34', '陈淑琳', '27', '3', '陈淑琳添加了任务内容为[事业部固定资产盘点表的核实]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('35', '陈淑琳', '28', '3', '陈淑琳添加了任务内容为[五险一金账单的制作；社保费用的付款申请]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('36', '陈淑琳', '29', '3', '陈淑琳添加了任务内容为[事业部招待物资的采购]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('37', '陈淑琳', '30', '3', '陈淑琳添加了任务内容为[参与总部人事周例会并编写会议纪要]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('38', '陈淑琳', '31', '3', '陈淑琳添加了任务内容为[事业部周报、KPI跟进表、项目管理表、花名册、疫情期间复工情况表及下周会议纪要的编制]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('39', '陈淑琳', '32', '3', '陈淑琳添加了任务内容为[招聘工作的开展]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('40', '陈淑琳', '33', '3', '陈淑琳添加了任务内容为[事业部绩效的汇总及3月绩效表的填写]的工时信息', '99', '2020-04-10 14:15:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('41', '万子禹', '34', '3', '万子禹添加了任务内容为[中山新区金融科技城智慧楼宇方案编写]的工时信息', '99', '2020-04-10 14:18:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('42', '万子禹', '35', '3', '万子禹添加了任务内容为[产品概要设计脑图]的工时信息', '99', '2020-04-10 14:19:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('43', '万子禹', '36', '3', '万子禹添加了任务内容为[产品概要设计文档]的工时信息', '99', '2020-04-10 14:20:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('44', '万子禹', '37', '3', '万子禹添加了任务内容为[产品原型设计]的工时信息', '99', '2020-04-10 14:21:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('45', '万子禹', '34', '5', '万子禹删除了任务内容为[中山新区金融科技城智慧楼宇方案编写]的工时', '99', '2020-04-10 14:24:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('46', '万子禹', '38', '3', '万子禹添加了任务内容为[中山新区金融科技城智慧楼宇方案编写]的工时信息', '99', '2020-04-10 14:25:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('47', '万子禹', '39', '3', '万子禹添加了任务内容为[中山新区金融科技城智慧楼宇方案编写]的工时信息', '99', '2020-04-10 14:25:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('48', '万子禹', '39', '4', '万子禹将工作时长由8修改为9', '99', '2020-04-10 14:25:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('49', '万子禹', '40', '3', '万子禹添加了任务内容为[中山新区金融科技城智慧楼宇方案编写]的工时信息', '99', '2020-04-10 14:25:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('50', '万子禹', '35', '5', '万子禹删除了任务内容为[产品概要设计脑图]的工时', '99', '2020-04-10 14:25:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('51', '万子禹', '36', '5', '万子禹删除了任务内容为[产品概要设计文档]的工时', '99', '2020-04-10 14:25:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('52', '万子禹', '37', '5', '万子禹删除了任务内容为[产品原型设计]的工时', '99', '2020-04-10 14:25:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('53', '万子禹', '41', '3', '万子禹添加了任务内容为[产品概要设计脑图整理]的工时信息', '99', '2020-04-10 14:26:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('54', '万子禹', '42', '3', '万子禹添加了任务内容为[产品概要设计文档编写]的工时信息', '99', '2020-04-10 14:26:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('55', '万子禹', '43', '3', '万子禹添加了任务内容为[产品概要设计原型设计]的工时信息', '99', '2020-04-10 14:26:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('56', '万子禹', '44', '3', '万子禹添加了任务内容为[产品概要设计原型设计]的工时信息', '99', '2020-04-10 14:27:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('57', '万子禹', '45', '3', '万子禹添加了任务内容为[产品概要设计文档审核]的工时信息', '99', '2020-04-10 14:27:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('58', '万子禹', '46', '3', '万子禹添加了任务内容为[产品概要设计脑图重新整理]的工时信息', '99', '2020-04-10 14:27:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('59', '陈淑琳', '47', '3', '陈淑琳添加了任务内容为[事业部周例会的组织]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('60', '陈淑琳', '48', '3', '陈淑琳添加了任务内容为[3月薪资表的初稿制作]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('61', '陈淑琳', '49', '3', '陈淑琳添加了任务内容为[第一季度事业部培训情况的汇总]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('62', '陈淑琳', '50', '3', '陈淑琳添加了任务内容为[中山入职材料的审核，问题材料邮寄重新填写；吴畏调转的入离职材料的准备与填写指导]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('63', '陈淑琳', '51', '3', '陈淑琳添加了任务内容为[招聘工作的开展：候选人陆海芳、吴珩、张秀娇、何晨翔的约面沟通；张秀娇的初试安排]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('64', '陈淑琳', '52', '3', '陈淑琳添加了任务内容为[对接内控委张胜原就事业部调转等工作进行沟通；对接吕岑就意外险进行沟通]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('65', '陈淑琳', '53', '3', '陈淑琳添加了任务内容为[招聘工作的开展；候选人张秀娇的复试安排]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('66', '陈淑琳', '54', '3', '陈淑琳添加了任务内容为[耿禹、吴畏及郑曼入职材料的整理、扫描]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('67', '陈淑琳', '55', '3', '陈淑琳添加了任务内容为[事业部固定资产表的制作]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('68', '陈淑琳', '56', '3', '陈淑琳添加了任务内容为[员工公积金的转移]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('69', '陈淑琳', '57', '3', '陈淑琳添加了任务内容为[总部固定资产流转表的学习及台式机的流转申请]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('70', '陈淑琳', '58', '3', '陈淑琳添加了任务内容为[候选人何晨翔、吴珩、宁南鑫的面试安排；招聘工作的开展：候选人解顶林的约面沟通；报名参与广州大学线上招聘会并与就业办公司老师进行电话沟通]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('71', '陈淑琳', '59', '3', '陈淑琳添加了任务内容为[事业部3月工资表二稿的编制]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('72', '陈淑琳', '60', '3', '陈淑琳添加了任务内容为[张秀娇的录用前沟通及录用流程的提交；offer的发放]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('73', '陈淑琳', '61', '3', '陈淑琳添加了任务内容为[总部人事会议的参与]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('74', '陈淑琳', '62', '3', '陈淑琳添加了任务内容为[事业部花名册、周报、KPI跟进表、项目管理表及疫情期间复工人员情况表及下周会议纪要的编制]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('75', '陈淑琳', '63', '3', '陈淑琳添加了任务内容为[3月事业部成本分摊表的编制]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('76', '陈淑琳', '64', '3', '陈淑琳添加了任务内容为[工时系统的学习与编写，并对事业部人员进行指导]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('77', '陈淑琳', '65', '3', '陈淑琳添加了任务内容为[招聘工作的开展]的工时信息', '99', '2020-04-10 14:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('78', '陈淑琳', '31', '4', '陈淑琳将工作时长由4修改为3', '99', '2020-04-10 14:41:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('79', '陈淑琳', '32', '4', '陈淑琳将工作时长由1修改为2', '99', '2020-04-10 14:41:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('80', '温四林', '66', '3', '温四林添加了任务内容为[根据国家高精地图试行规范，完成道路网图层规范说明调研，配合何海生产车道网测试数据]的工时信息', '99', '2020-04-10 17:45:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('81', '温四林', '67', '3', '温四林添加了任务内容为[研发点云及全景影像量测软件，全景加载功能]的工时信息', '99', '2020-04-10 17:45:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('82', '温四林', '68', '3', '温四林添加了任务内容为[基于speedMap搭建高精地图数据编译平台]的工时信息', '99', '2020-04-10 17:45:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('83', '温四林', '69', '3', '温四林添加了任务内容为[完成数据库属性录入及数据更新]的工时信息', '99', '2020-04-10 17:45:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('84', '温四林', '70', '3', '温四林添加了任务内容为[研发读取数据库及数据可视化功能]的工时信息', '99', '2020-04-10 17:45:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('85', '姚威', '71', '3', '姚威添加了任务内容为[编写轨迹点选取程序，调试出显示全景图的功能]的工时信息', '99', '2020-04-10 17:57:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('86', '姚威', '71', '4', '姚威将工作时长由0修改为7.5', '99', '2020-04-10 17:58:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('87', '白慧鹏', '72', '3', '白慧鹏添加了任务内容为[高精地图编译平台研发]的工时信息', '99', '2020-04-10 18:00:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('88', '白慧鹏', '73', '3', '白慧鹏添加了任务内容为[高精地图编译平台研发，speedMap代码熟悉]的工时信息', '99', '2020-04-10 18:00:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('89', '白慧鹏', '74', '3', '白慧鹏添加了任务内容为[基于SpeedMap高精地图编译平台研发，抽取类库及简化原有界面，实现代码重构]的工时信息', '99', '2020-04-10 18:00:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('90', '白慧鹏', '75', '3', '白慧鹏添加了任务内容为[高精地图编译平台研发，数据库连接]的工时信息', '99', '2020-04-10 18:00:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('91', '何海', '76', '3', '何海添加了任务内容为[1、参加部门周例会；2、学习使用Microstation等数据采集软件]的工时信息', '99', '2020-04-10 18:04:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('92', '何海', '77', '3', '何海添加了任务内容为[学习高精度地图生产及如何与研发对接，录入数据库模板]的工时信息', '99', '2020-04-10 18:04:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('93', '何海', '78', '3', '何海添加了任务内容为[录入数据库模板]的工时信息', '99', '2020-04-10 18:04:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('94', '高恒娟', '79', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、前期政策及相关类似企业方案收集；2、方案编写。]的工时信息', '99', '2020-04-16 09:05:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('95', '高恒娟', '79', '4', '高恒娟将填报时间由2020-04-03修改为2020-04-01将工作时长由8.5修改为8将填报内容由泰兴恒润制药化工企业安全生产信息化管理平台：1、前期政策及相关类似企业方案收集；2、方案编写。修改为泰兴恒润制药化工企业安全生产信息化管理平台：1、前期政策及相关类似企业方案收集。将填报时间由1修改为3', '99', '2020-04-16 09:08:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('96', '高恒娟', '80', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、相关类似企业方案学习，88号文功能整理。]的工时信息', '99', '2020-04-16 09:08:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('97', '高恒娟', '81', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的编写。]的工时信息', '99', '2020-04-16 09:08:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('98', '高恒娟', '82', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的编写与完善；2、周例会]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('99', '高恒娟', '83', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的修改完善]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('100', '高恒娟', '84', '3', '高恒娟添加了任务内容为[泰兴恒润制药厂区 调研交流、会议纪要整理。]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('101', '高恒娟', '85', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：投标方案编写]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('102', '高恒娟', '86', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：投标方案编写与汇总]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('103', '高恒娟', '87', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：1、技术方案的修改]的工时信息', '99', '2020-04-16 09:16:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('104', '高恒娟', '88', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：投标方案汇总、修改、完善。]的工时信息', '99', '2020-04-16 09:22:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('105', '高恒娟', '89', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT]的工时信息', '99', '2020-04-16 09:22:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('106', '高恒娟', '90', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT，学习相关知识点]的工时信息', '99', '2020-04-16 09:22:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('107', '高恒娟', '80', '4', '高恒娟将填报内容由泰兴恒润制药化工企业安全生产信息化管理平台：1、相关类似企业方案学习，88号文功能整理。修改为泰兴恒润制药化工企业安全生产信息化管理平台：1、相关类似企业方案学习，88号文功能整理。2、季度例会3h.', '99', '2020-04-16 09:22:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('108', '张秀娇', '91', '3', '张秀娇添加了任务内容为[办理入职手续]的工时信息', '99', '2020-04-16 17:06:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('109', '张秀娇', '92', '3', '张秀娇添加了任务内容为[部门业务熟悉]的工时信息', '99', '2020-04-16 17:06:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('110', '张秀娇', '91', '4', '张秀娇将填报时间由2020-04-13修改为2020-04-15', '99', '2020-04-16 17:08:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('111', '张秀娇', '92', '4', '张秀娇将填报时间由2020-04-13修改为2020-04-15', '99', '2020-04-16 17:08:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('112', '张秀娇', '92', '4', '张秀娇将填报内容由部门业务熟悉修改为阅读技术文档，熟悉相关业务', '99', '2020-04-16 17:51:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('113', '张秀娇', '93', '3', '张秀娇添加了任务内容为[浏览相关技术网页，了解自动驾驶的有关知识]的工时信息', '99', '2020-04-16 17:51:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('114', '张秀娇', '94', '3', '张秀娇添加了任务内容为[搜集下载有关智慧城市，自动驾驶等方面的论文]的工时信息', '99', '2020-04-16 17:51:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('115', '张秀娇', '95', '3', '张秀娇添加了任务内容为[阅读论文]的工时信息', '99', '2020-04-16 17:51:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('116', '何海', '96', '3', '何海添加了任务内容为[录入数据库模板]的工时信息', '99', '2020-04-17 13:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('117', '何海', '78', '4', '何海将填报内容由录入数据库模板修改为学习高精度地图数据格式，录入数据库模板将填报时间由1修改为3', '99', '2020-04-17 13:56:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('118', '何海', '96', '4', '何海将填报内容由录入数据库模板修改为学习高精度地图数据格式，录入数据库模板', '99', '2020-04-17 13:56:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('119', '张秀娇', '97', '3', '张秀娇添加了任务内容为[阅读论文]的工时信息', '99', '2020-04-17 17:33:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('120', '张秀娇', '98', '3', '张秀娇添加了任务内容为[对基于视觉的自动驾驶中的感兴趣关方向进行搜索和调研]的工时信息', '99', '2020-04-17 17:33:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('121', '何海', '99', '3', '何海添加了任务内容为[学习高精度地图数据格式，录入数据库模板及数据库字典，采集道路图层组测试数据]的工时信息', '99', '2020-04-21 13:43:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('122', '何海', '100', '3', '何海添加了任务内容为[录入数据库模板及字典数据库]的工时信息', '99', '2020-04-21 13:43:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('123', '何海', '101', '3', '何海添加了任务内容为[常州十公里项目数据补充采集]的工时信息', '99', '2020-04-21 13:43:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('124', '张秀娇', '102', '3', '张秀娇添加了任务内容为[学习matlab软件平台的自动驾驶工具箱介绍]的工时信息', '99', '2020-04-21 13:47:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('125', '张秀娇', '103', '3', '张秀娇添加了任务内容为[例会]的工时信息', '99', '2020-04-21 13:47:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('126', '张秀娇', '104', '3', '张秀娇添加了任务内容为[matlab软件下载及安装和环境配置]的工时信息', '99', '2020-04-21 13:47:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('127', '张秀娇', '105', '3', '张秀娇添加了任务内容为[使用matlab软件平台下的自动驾驶工具箱进行场景设计及仿真]的工时信息', '99', '2020-04-21 13:47:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('128', '何海', '99', '4', '何海将工作时长由7.5修改为4.5', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('129', '何海', '100', '4', '何海将填报时间由2020-04-14修改为2020-04-15将工作时长由4.5修改为7.5', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('130', '何海', '101', '4', '何海将填报时间由2020-04-14修改为2020-04-13将填报内容由常州十公里项目数据补充采集修改为常州ITSC10公里高精度地图项目数据补充采集', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('131', '何海', '106', '3', '何海添加了任务内容为[常州ITSC10公里高精度地图项目数据补充采集]的工时信息', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('132', '何海', '107', '3', '何海添加了任务内容为[常州ITSC10公里高精度地图项目数据修改]的工时信息', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('133', '何海', '108', '3', '何海添加了任务内容为[录入数据库模板及字典数据库]的工时信息', '99', '2020-04-21 13:48:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('134', '何海', '109', '3', '何海添加了任务内容为[录入数据库模板及字典数据库]的工时信息', '99', '2020-04-21 13:48:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('135', '何海', '100', '4', '何海将填报内容由录入数据库模板及字典数据库修改为学习高精度地图生产要求，录入数据库模板及字典数据库', '99', '2020-04-21 13:49:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('136', '何海', '109', '4', '何海将填报内容由录入数据库模板及字典数据库修改为学习高精度地图生产要求，录入数据库模板及字典数据库', '99', '2020-04-21 13:49:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('137', '何海', '108', '4', '何海将填报内容由录入数据库模板及字典数据库修改为学习高精度地图生产要求，录入数据库模板及字典数据库', '99', '2020-04-21 13:49:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('138', '何海', '110', '3', '何海添加了任务内容为[学习高精度地图生产要求，录入数据库模板及字典数据库]的工时信息', '99', '2020-04-21 13:49:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('139', '何海', '110', '4', '何海将填报时间由1修改为3', '99', '2020-04-21 13:49:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('140', '何海', '111', '3', '何海添加了任务内容为[学习高精度地图生产要求，录入数据库模板及字典数据库]的工时信息', '99', '2020-04-21 13:49:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('141', '何海', '112', '3', '何海添加了任务内容为[根据数据库模板制作高精度地图测试数据]的工时信息', '99', '2020-04-21 13:50:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('142', '何海', '113', '3', '何海添加了任务内容为[根据数据库模板制作高精度地图测试数据]的工时信息', '99', '2020-04-21 13:50:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('143', '陈淑琳', '114', '3', '陈淑琳添加了任务内容为[采购事业部打印机碳粉；并研究京东，关联发票信息，以便后期采购物资。]的工时信息', '99', '2020-04-21 16:44:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('144', '陈淑琳', '115', '3', '陈淑琳添加了任务内容为[1.候选人陈涛约面；2.解顶林下午15：00面试安排；3.上周面试情况的汇总与汇报；4.淮阴师范学院的招聘信息的发布，招聘宣讲材料的研究。]的工时信息', '99', '2020-04-21 16:44:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('145', '陈淑琳', '116', '3', '陈淑琳添加了任务内容为[1.张秀娇入职材料的准备；2.子公司资质建设的咨询；3.3位员工失业登记的提醒与材料打印；4.是否有集体户口等问题的咨询。]的工时信息', '99', '2020-04-21 16:44:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('146', '陈淑琳', '117', '3', '陈淑琳添加了任务内容为[3月薪资个税版的制作]的工时信息', '99', '2020-04-21 16:47:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('147', '陈淑琳', '118', '3', '陈淑琳添加了任务内容为[固定资产流转单的学习与填写；事业部人员信息登记表的汇总与填写]的工时信息', '99', '2020-04-21 16:47:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('148', '陈淑琳', '119', '3', '陈淑琳添加了任务内容为[招聘工作的开展；候选人宁南鑫、吴珩、解顶林的对接]的工时信息', '99', '2020-04-21 16:47:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('149', '陈淑琳', '120', '3', '陈淑琳添加了任务内容为[与郑曼沟通事业部招聘工作]的工时信息', '99', '2020-04-21 16:47:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('150', '陈淑琳', '121', '3', '陈淑琳添加了任务内容为[事业部素质拓展活动的规划及策划书的编写]的工时信息', '99', '2020-04-21 16:47:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('151', '陈淑琳', '122', '3', '陈淑琳添加了任务内容为[张秀娇入职手续的办理、信息的录入、入职材料的整理]的工时信息', '99', '2020-04-21 16:49:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('152', '陈淑琳', '123', '3', '陈淑琳添加了任务内容为[江苏省工信系统大数据支撑服务平台的注册]的工时信息', '99', '2020-04-21 16:49:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('153', '陈淑琳', '124', '3', '陈淑琳添加了任务内容为[固定资产编号的盘点与汇总、日常行政事务的对接]的工时信息', '99', '2020-04-21 16:49:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('154', '陈淑琳', '125', '3', '陈淑琳添加了任务内容为[招聘工作的开展；候选人陆海芳、宁南鑫、陈涛的面试沟通]的工时信息', '99', '2020-04-21 16:49:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('155', '陈淑琳', '126', '3', '陈淑琳添加了任务内容为[宁南鑫的面试安排、招聘工作的开展]的工时信息', '99', '2020-04-21 16:53:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('156', '陈淑琳', '127', '3', '陈淑琳添加了任务内容为[周报的编制，4月新入职员工及生日员工的信息汇总]的工时信息', '99', '2020-04-21 16:53:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('157', '陈淑琳', '128', '3', '陈淑琳添加了任务内容为[薪资表中银行数据的填充]的工时信息', '99', '2020-04-21 16:53:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('158', '陈淑琳', '129', '3', '陈淑琳添加了任务内容为[咨询张胜原有关公司针对年薪制等的规定]的工时信息', '99', '2020-04-21 16:53:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('159', '陈淑琳', '130', '3', '陈淑琳添加了任务内容为[宁南鑫入职前的沟通、录用审批流程的提交、offer的发放、办公物资的需求汇总与采购]的工时信息', '99', '2020-04-21 16:53:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('160', '陈淑琳', '131', '3', '陈淑琳添加了任务内容为[候选人陆海芳的面试及陈涛的面试安排、招聘工作的开展]的工时信息', '99', '2020-04-21 17:05:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('161', '陈淑琳', '132', '3', '陈淑琳添加了任务内容为[名片夹、U盘等物资的采购，固定资产表、花名册、疫情期间复工表、周报、季报、KPI跟进表、项目管理表、会议纪要等表单的制作；日常行政事务的处理]的工时信息', '99', '2020-04-21 17:05:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('162', '陈淑琳', '133', '3', '陈淑琳添加了任务内容为[解顶林入职前的沟通、录用审批流程的提交、offer的发放、办公用品的准备]的工时信息', '99', '2020-04-21 17:05:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('163', '陈淑琳', '134', '3', '陈淑琳添加了任务内容为[宁南鑫的入职办理、信息录入、入职材料的整理，戚国华、解顶林入职材料的准备]的工时信息', '99', '2020-04-21 17:09:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('164', '陈淑琳', '135', '3', '陈淑琳添加了任务内容为[周例会的开展、两台显示器的领用申请、宁南鑫台式机的组装、合同的打印与整理]的工时信息', '99', '2020-04-21 17:09:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('165', '陈淑琳', '136', '3', '陈淑琳添加了任务内容为[社保的缴纳、与候选人陆海芳沟通三方签署事宜]的工时信息', '99', '2020-04-21 17:09:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('166', '陈淑琳', '137', '3', '陈淑琳添加了任务内容为[戚国华的入职办理、信息录入、入职材料的整理，引导戚国华及宁南鑫熟悉OA等软件]的工时信息', '99', '2020-04-21 17:11:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('167', '宁南鑫', '138', '3', '宁南鑫添加了任务内容为[周一入职,阅读资料,给电脑配置一下环境]的工时信息', '99', '2020-04-21 18:19:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('168', '宁南鑫', '139', '3', '宁南鑫添加了任务内容为[将tt100k数据集中的pad部分完善,记录归档出现的问题]的工时信息', '99', '2020-04-21 18:19:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('169', '张秀娇', '140', '3', '张秀娇添加了任务内容为[学习激光雷达与视觉传感器融合的相关知识]的工时信息', '99', '2020-04-22 09:07:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('170', '张秀娇', '141', '3', '张秀娇添加了任务内容为[学习激光雷达、雷达的知识]的工时信息', '99', '2020-04-23 09:10:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('171', '张秀娇', '142', '3', '张秀娇添加了任务内容为[学习激光雷达及视觉的融合]的工时信息', '99', '2020-04-23 09:10:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('172', '宁南鑫', '143', '3', '宁南鑫添加了任务内容为[配置CorNet环境,阅读相关论文]的工时信息', '99', '2020-04-23 10:18:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('173', '宁南鑫', '144', '3', '宁南鑫添加了任务内容为[上午开始cooc数据集的转换工作,编写完coco的转换代码]的工时信息', '99', '2020-04-23 10:18:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('174', '张秀娇', '145', '3', '张秀娇添加了任务内容为[anaconda安装及tensorflow环境配置，pycharm安装]的工时信息', '99', '2020-04-23 13:36:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('175', '张秀娇', '146', '3', '张秀娇添加了任务内容为[短期计划及技术调研报告书写]的工时信息', '99', '2020-04-24 11:10:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('176', '宁南鑫', '147', '3', '宁南鑫添加了任务内容为[更改代码中出现的bug,根据数据要求修改相关代码]的工时信息', '99', '2020-04-24 15:03:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('177', '宁南鑫', '148', '3', '宁南鑫添加了任务内容为[开始训练CornerNet]的工时信息', '99', '2020-04-24 15:03:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('178', '宁南鑫', '149', '3', '宁南鑫添加了任务内容为[研读YOLO V4论文,源码]的工时信息', '99', '2020-04-24 15:03:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('179', '高恒娟', '150', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：根据投标方案完善PPT;部门讨论；宣传册素材收集]的工时信息', '99', '2020-04-24 15:34:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('180', '高恒娟', '151', '3', '高恒娟添加了任务内容为[泰兴恒润制药化工企业安全生产信息化管理平台：找投标文件，参考其他投标文件格式，细化技术功能]的工时信息', '99', '2020-04-24 15:34:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('181', '高恒娟', '152', '3', '高恒娟添加了任务内容为[泰兴恒润制药智慧化工安全生产信息平台：细化重大危险源、可燃有毒气体章节内容；周例会]的工时信息', '99', '2020-04-24 15:42:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('182', '高恒娟', '153', '3', '高恒娟添加了任务内容为[泰兴恒润制药智慧化工安全生产信息平台：细化安全生产风险管控章节；宣传册素材收集；翠亨建设用地面积统计]的工时信息', '99', '2020-04-24 15:42:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('183', '高恒娟', '154', '3', '高恒娟添加了任务内容为[中丹企业设备资产管理：设备资产管理相关资料收集、主要功能整理]的工时信息', '99', '2020-04-24 15:42:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('184', '高恒娟', '155', '3', '高恒娟添加了任务内容为[中丹企业设备资产管理：主要功能整理；高精地图宣传册素材收集]的工时信息', '99', '2020-04-24 15:42:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('185', '高恒娟', '156', '3', '高恒娟添加了任务内容为[中丹企业设备资产管理： ppt功能完善成型]的工时信息', '99', '2020-04-24 15:42:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('186', '万子禹', '157', '3', '万子禹添加了任务内容为[产品概要文档编写]的工时信息', '99', '2020-04-24 15:46:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('187', '万子禹', '158', '3', '万子禹添加了任务内容为[产品概要文档编写]的工时信息', '99', '2020-04-24 15:46:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('188', '万子禹', '159', '3', '万子禹添加了任务内容为[产品概要文档编写]的工时信息', '99', '2020-04-24 15:46:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('189', '万子禹', '160', '3', '万子禹添加了任务内容为[产品概要文档编写]的工时信息', '99', '2020-04-24 15:46:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('190', '万子禹', '161', '3', '万子禹添加了任务内容为[竞品分析（国家政策与行业标准）]的工时信息', '99', '2020-04-24 15:46:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('191', '万子禹', '162', '3', '万子禹添加了任务内容为[竞品分析（智能驾驶与高精地图行业分析）]的工时信息', '99', '2020-04-24 15:49:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('192', '万子禹', '163', '3', '万子禹添加了任务内容为[竞品分析（Apollo,Here,谷歌）]的工时信息', '99', '2020-04-24 15:49:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('193', '万子禹', '164', '3', '万子禹添加了任务内容为[竞品分析（星月测绘，贵阳大数据平台，平行世界）]的工时信息', '99', '2020-04-24 15:49:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('194', '万子禹', '165', '3', '万子禹添加了任务内容为[竞品分析（Airlook）]的工时信息', '99', '2020-04-24 15:49:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('195', '万子禹', '166', '3', '万子禹添加了任务内容为[竞品分析（商业模式分析）]的工时信息', '99', '2020-04-24 15:49:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('196', '陈淑琳', '167', '3', '陈淑琳添加了任务内容为[新入职员工笔记本电脑的采购、付款流程的提交及费用报销单的制作]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('197', '陈淑琳', '168', '3', '陈淑琳添加了任务内容为[3月薪资表的定稿及打印签字]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('198', '陈淑琳', '169', '3', '陈淑琳添加了任务内容为[招聘工作的开展及日常人事工作的处理]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('199', '陈淑琳', '170', '3', '陈淑琳添加了任务内容为[解顶林的入职办理、信息录入、入职材料的整理，引导熟悉OA等办公软件]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('200', '陈淑琳', '171', '3', '陈淑琳添加了任务内容为[招聘工作的开展、新职位的发布；李晔的面试安排]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('201', '陈淑琳', '172', '3', '陈淑琳添加了任务内容为[3月公积金的汇缴、跨事业部工时的统计与核实；事业部员工OA系统数据的核实与更新；陆海芳的三方的签署]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('202', '陈淑琳', '173', '3', '陈淑琳添加了任务内容为[日常行政工作的对接]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('203', '陈淑琳', '174', '3', '陈淑琳添加了任务内容为[项目管理表单的更新；项目合同的盖章及邮寄；事业部部门工作的汇总、周报的填写；更新固定资产盘点表；]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('204', '陈淑琳', '175', '3', '陈淑琳添加了任务内容为[事业部岗级数据的录入与核实；伍军豪录用流程的提交、入职材料的准备及offer的发放]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('205', '陈淑琳', '176', '3', '陈淑琳添加了任务内容为[招聘工作的开展，根据新的用人需求海选候选人]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('206', '陈淑琳', '177', '3', '陈淑琳添加了任务内容为[事业部花名册、疫情期间复工情况表、周报、KPI跟进表、项目管理表及会议纪要的编制]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('207', '陈淑琳', '178', '3', '陈淑琳添加了任务内容为[戚国华、解顶林失业登记，戚国华来宁面试补贴、人才安居的申请；公积金的新开户、启封及转移。]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('208', '陈淑琳', '179', '3', '陈淑琳添加了任务内容为[公司公众号推文的编写]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('209', '陈淑琳', '180', '3', '陈淑琳添加了任务内容为[2020年度社保网站书面审查的申报]的工时信息', '99', '2020-04-24 17:19:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('210', '陈淑琳', '181', '3', '陈淑琳添加了任务内容为[招聘工作的开展，陈慧玲、郭璐锌、吕林瑞简历的推荐]的工时信息', '99', '2020-04-24 17:20:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('211', '宁南鑫', '182', '3', '宁南鑫添加了任务内容为[实现CorNet的视频检测实现]的工时信息', '99', '2020-04-26 09:52:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('212', '宁南鑫', '182', '4', '宁南鑫将填报内容由实现CorNet的视频检测实现修改为寻找解决OpenCV4.2.0读取视频报错的解决方案error: (-5:Bad argument) CAP_IMAGES: can\'t find starting number (in the name of file): video.avi in function \'cv::icvExtractPattern\'', '99', '2020-04-26 10:55:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('213', '宁南鑫', '182', '5', '宁南鑫删除了任务内容为[寻找解决OpenCV4.2.0读取视频报错的解决方案error: (-5:Bad argument) CAP_IMAGES: can\'t find starting number (in the name of file): video.avi in function \'cv::icvExtractPattern\']的工时', '99', '2020-04-26 11:17:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('214', '宁南鑫', '183', '3', '宁南鑫添加了任务内容为[实现视频检测代码]的工时信息', '99', '2020-04-26 11:18:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('215', '宁南鑫', '183', '4', '宁南鑫将填报内容由实现视频检测代码修改为实现视频检测代码, 开展视频实时检测研究', '99', '2020-04-26 14:36:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('216', '宁南鑫', '184', '3', '宁南鑫添加了任务内容为[视频检测代码的编写]的工时信息', '99', '2020-04-27 08:54:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('217', '张秀娇', '185', '3', '张秀娇添加了任务内容为[激光雷达与摄像机的标定调研]的工时信息', '99', '2020-04-27 09:09:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('218', '张秀娇', '186', '3', '张秀娇添加了任务内容为[ROS1、ROS2操作系统技术调研]的工时信息', '99', '2020-04-27 09:09:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('219', '张秀娇', '187', '3', '张秀娇添加了任务内容为[autoware软件调研]的工时信息', '99', '2020-04-27 09:09:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('220', '张秀娇', '103', '5', '张秀娇删除了任务内容为[例会]的工时', '99', '2020-04-27 09:09:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('221', '张秀娇', '104', '4', '张秀娇将工作时长由3修改为3.5', '99', '2020-04-27 09:09:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('222', '宁南鑫', '184', '4', '宁南鑫将填报内容由视频检测代码的编写修改为视频检测代码的编写,CorNerNetsqueeze模式训练,阅读efficientNet', '99', '2020-04-27 16:06:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('223', '宁南鑫', '188', '3', '宁南鑫添加了任务内容为[检查CornerNet的模型,发现无法检测的问题,重新修改]的工时信息', '99', '2020-04-28 09:39:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('224', '宁南鑫', '188', '4', '宁南鑫将填报内容由检查CornerNet的模型,发现无法检测的问题,重新修改修改为检查CornerNet的模型,出现垃圾输出,需要重新调整', '99', '2020-04-28 09:42:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('225', '宁南鑫', '188', '4', '宁南鑫将工作时长由7.5修改为3', '99', '2020-04-28 13:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('226', '宁南鑫', '189', '3', '宁南鑫添加了任务内容为[编写CornerNet的评估代码]的工时信息', '99', '2020-04-28 13:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('227', '何海', '190', '3', '何海添加了任务内容为[测试数据制作，数据库模板补充及修改]的工时信息', '99', '2020-04-28 14:05:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('228', '何海', '191', '3', '何海添加了任务内容为[高精度地图样例数据符号配置及数据补充采集]的工时信息', '99', '2020-04-28 14:05:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('229', '何海', '192', '3', '何海添加了任务内容为[高精度地图样例数据符号配置及数据补充采集]的工时信息', '99', '2020-04-28 14:05:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('230', '何海', '193', '3', '何海添加了任务内容为[高精度地图样例数据符号配置及数据补充采集]的工时信息', '99', '2020-04-28 14:05:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('231', '何海', '194', '3', '何海添加了任务内容为[测试使用TopoDOT软件的功能，利用软件对样例数据中的标识标牌的进行采集]的工时信息', '99', '2020-04-28 14:07:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('232', '何海', '195', '3', '何海添加了任务内容为[将标志标牌添加至样例数据，并配置符号]的工时信息', '99', '2020-04-28 14:08:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('233', '何海', '195', '4', '何海将填报内容由将标志标牌添加至样例数据，并配置符号修改为将标志标牌添加至样例数据，并配置符号；梳理各个图层间的关联关系', '99', '2020-04-28 18:04:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('234', '宁南鑫', '196', '3', '宁南鑫添加了任务内容为[定期评估CorNerNet代码,复现efficientDet]的工时信息', '99', '2020-04-29 09:22:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('235', '宁南鑫', '196', '4', '宁南鑫将填报内容由定期评估CorNerNet代码,复现efficientDet修改为定期评估CorNerNet模型,复现efficientDet', '99', '2020-04-29 09:23:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('236', '宁南鑫', '196', '4', '宁南鑫将填报内容由定期评估CorNerNet模型,复现efficientDet修改为定期评估CorNerNet模型,复现efficientDet,完成数据增强代码修改', '99', '2020-04-29 09:36:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('237', '孙茂荣', '197', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-宏观环境和风险进行分析]的工时信息', '99', '2020-04-29 09:44:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('238', '孙茂荣', '198', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对自动驾驶生态平台进行调研，并进行分析]的工时信息', '99', '2020-04-29 09:44:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('239', '孙茂荣', '199', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对数据服务交易平台进行调研，并进行分析]的工时信息', '99', '2020-04-29 09:44:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('240', '孙茂荣', '200', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对API开放平台进行调研，并进行分析]的工时信息', '99', '2020-04-29 09:44:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('241', '孙茂荣', '201', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-SWOT分析以及发展规划，并给出建议]的工时信息', '99', '2020-04-29 09:44:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('242', '孙茂荣', '197', '4', '孙茂荣将工作时长由9修改为9.5', '99', '2020-04-29 09:45:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('243', '孙茂荣', '198', '4', '孙茂荣将工作时长由10修改为10.5', '99', '2020-04-29 09:45:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('244', '孙茂荣', '199', '4', '孙茂荣将工作时长由10修改为10.5', '99', '2020-04-29 09:45:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('245', '孙茂荣', '200', '4', '孙茂荣将工作时长由8修改为8.5', '99', '2020-04-29 09:45:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('246', '孙茂荣', '201', '4', '孙茂荣将工作时长由11修改为11.5', '99', '2020-04-29 09:45:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('247', '孙茂荣', '202', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对调研报告的框架、内容、图片进行修改]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('248', '孙茂荣', '203', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对调研报告的文案内容进行修改]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('249', '孙茂荣', '204', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-对调研对象的优势、劣势、商业模式进行深度剖析]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('250', '孙茂荣', '205', '3', '孙茂荣添加了任务内容为[第一季度季报的-整理框架，收集相关资料]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('251', '孙茂荣', '206', '3', '孙茂荣添加了任务内容为[第一季度季报-对内容进行编制，对排版进行优化]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('252', '孙茂荣', '207', '3', '孙茂荣添加了任务内容为[据服务平台调研报告工作，对上周的工作成果进一步深度分析，完成90%；]的工时信息', '99', '2020-04-29 09:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('253', '孙茂荣', '207', '4', '孙茂荣将工作时长由8.5修改为9.5', '99', '2020-04-29 09:57:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('254', '孙茂荣', '208', '3', '孙茂荣添加了任务内容为[数据服务平台调研报告-部门内部进行评审，根据修改意见进行整理]的工时信息', '99', '2020-04-29 10:00:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('255', '戚国华', '209', '3', '戚国华添加了任务内容为[入职手续(上午)，学习公司文化，规章制度]的工时信息', '99', '2020-04-29 11:07:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('256', '戚国华', '210', '3', '戚国华添加了任务内容为[学习完成《速度中国制度汇编》(共391页)，及新员工训练营第三节全部内容]的工时信息', '99', '2020-04-29 11:07:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('257', '戚国华', '211', '3', '戚国华添加了任务内容为[完成入职考试，个人基本规划，询问各部门工作，补充项目相关知识]的工时信息', '99', '2020-04-29 11:07:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('258', '戚国华', '212', '3', '戚国华添加了任务内容为[学习孙经理传的学习材料，重点学习了高精地图v6.3(PPT)及刘先林院士“新测绘”(PPT),通读部分pdf内容(6份)，整理了关于AVP的了解与思考，以及Waymo与tesla关于自动驾驶汽车方向的思考]的工时信息', '99', '2020-04-29 11:07:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('259', '戚国华', '213', '3', '戚国华添加了任务内容为[了解YOLO软件以及R-CNN神经网络算法相关知识，搜索了自动驾驶相关论文共67篇(已读10篇)，学习了如何做好产品方案的有关知识。]的工时信息', '99', '2020-04-29 11:07:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('260', '戚国华', '214', '3', '戚国华添加了任务内容为[学习本部门方案PPT(化工厂)，以及其中不懂的知识概念(如五位一体等)，理解地图拓扑原理以及Autoware软件概要，搜索学习目前室内导航技术方向，搜索了解海外自动驾驶相关企业信息。]的工时信息', '99', '2020-04-29 11:18:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('261', '戚国华', '215', '3', '戚国华添加了任务内容为[制作海外自动驾驶调研PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。]的工时信息', '99', '2020-04-29 11:18:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('262', '戚国华', '210', '4', '戚国华将工作时长由8.5修改为8', '99', '2020-04-29 11:18:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('263', '戚国华', '215', '4', '戚国华将填报内容由制作海外自动驾驶调研PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。修改为制作海外自动驾驶调查PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。', '99', '2020-04-29 11:29:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('264', '戚国华', '215', '4', '戚国华将填报内容由制作海外自动驾驶调查PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。修改为制作《海外自动驾驶调查》PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。', '99', '2020-04-29 11:30:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('265', '孙茂荣', '204', '4', '孙茂荣将工作时长由9.5修改为8.5', '99', '2020-04-29 14:56:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('266', '孙茂荣', '206', '4', '孙茂荣将工作时长由9.5修改为8.5', '99', '2020-04-29 14:56:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('267', '孙茂荣', '207', '4', '孙茂荣将工作时长由9.5修改为7.5', '99', '2020-04-29 14:56:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('268', '孙茂荣', '198', '4', '孙茂荣将工作时长由10.5修改为8.5', '99', '2020-04-29 14:56:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('269', '孙茂荣', '199', '4', '孙茂荣将工作时长由10.5修改为8.5', '99', '2020-04-29 14:56:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('270', '孙茂荣', '201', '4', '孙茂荣将工作时长由11.5修改为9.5', '99', '2020-04-29 14:56:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('271', '孙茂荣', '10', '4', '孙茂荣将工作时长由8修改为7.5', '99', '2020-04-29 14:57:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('272', '孙茂荣', '11', '4', '孙茂荣将工作时长由10修改为8.5', '99', '2020-04-29 14:57:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('273', '孙茂荣', '12', '4', '孙茂荣将工作时长由9修改为8.5', '99', '2020-04-29 14:57:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('274', '孙茂荣', '15', '4', '孙茂荣将工作时长由4修改为7.5', '99', '2020-04-29 14:57:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('275', '孙茂荣', '17', '4', '孙茂荣将工作时长由5修改为7.5', '99', '2020-04-29 14:57:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('276', '张秀娇', '216', '3', '张秀娇添加了任务内容为[ubuntu操作系统安装]的工时信息', '99', '2020-04-29 16:02:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('277', '张秀娇', '217', '3', '张秀娇添加了任务内容为[ROS操作系统安装及环境配置]的工时信息', '99', '2020-04-29 16:02:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('278', '张秀娇', '218', '3', '张秀娇添加了任务内容为[耿禹的笔记本电脑ubuntu操作系统安装]的工时信息', '99', '2020-04-29 16:02:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('279', '张秀娇', '219', '3', '张秀娇添加了任务内容为[ROS操作系统安装及环境配置]的工时信息', '99', '2020-04-29 16:02:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('280', '张秀娇', '220', '3', '张秀娇添加了任务内容为[ROS操作系统安装及环境配置]的工时信息', '99', '2020-04-29 16:02:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('281', '戚国华', '214', '4', '戚国华将工作时长由8.5修改为8', '99', '2020-04-29 16:18:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('282', '戚国华', '215', '4', '戚国华将工作时长由8.5修改为8', '99', '2020-04-29 16:18:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('283', '戚国华', '209', '4', '戚国华将工作时长由8修改为7.5', '99', '2020-04-29 16:19:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('284', '戚国华', '211', '4', '戚国华将填报内容由完成入职考试，个人基本规划，询问各部门工作，补充项目相关知识修改为完成入职考试，个人基本规划，询问各部门工作，了解智慧城市与高精地图相关知识', '99', '2020-04-29 16:19:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('285', '戚国华', '213', '4', '戚国华将工作时长由8.5修改为8', '99', '2020-04-29 16:19:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('286', '温四林', '221', '3', '温四林添加了任务内容为[高精地图编译软件研发]的工时信息', '99', '2020-04-29 16:36:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('287', '温四林', '222', '3', '温四林添加了任务内容为[基于道路网数据，研发道路及其附属属性录入功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('288', '温四林', '223', '3', '温四林添加了任务内容为[基于道路网数据，研发道路节点属性录入及更新功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('289', '温四林', '224', '3', '温四林添加了任务内容为[基于道路网数据，测试道路参考线及节点属性的录入功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('290', '温四林', '225', '3', '温四林添加了任务内容为[研究秀山软件中关于双全景相机的量测功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('291', '温四林', '226', '3', '温四林添加了任务内容为[基于道路网数据，研发道路拓扑连接关系功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('292', '温四林', '227', '3', '温四林添加了任务内容为[基于道路网数据，研发道路拓扑连接关系功能]的工时信息', '99', '2020-04-29 16:50:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('293', '温四林', '228', '3', '温四林添加了任务内容为[研发道路参考线领接关系组件及功能]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('294', '温四林', '229', '3', '温四林添加了任务内容为[重构代码，提取代码中重复部分，实现驱动编程]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('295', '温四林', '230', '3', '温四林添加了任务内容为[测试功能，并完成数据保存的功能]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('296', '温四林', '231', '3', '温四林添加了任务内容为[点云与全景量测功能研发]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('297', '温四林', '232', '3', '温四林添加了任务内容为[车道网图层数据采集规范研究，采集测试数据]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('298', '温四林', '233', '3', '温四林添加了任务内容为[软件bug修复，测试]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('299', '温四林', '234', '3', '温四林添加了任务内容为[前往华东院技术交流]的工时信息', '99', '2020-04-29 16:55:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('300', '温四林', '235', '3', '温四林添加了任务内容为[研发全景图像加载功能]的工时信息', '99', '2020-04-29 16:58:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('301', '温四林', '221', '4', '温四林将填报内容由高精地图编译软件研发修改为地图与全景图像的交互', '99', '2020-04-29 17:00:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('302', '温四林', '236', '3', '温四林添加了任务内容为[全景图像加载bug修复]的工时信息', '99', '2020-04-29 17:00:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('303', '温四林', '237', '3', '温四林添加了任务内容为[重构软件代码，调试数据库数据加载及保存的bug]的工时信息', '99', '2020-04-29 17:00:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('304', '耿禹', '238', '3', '耿禹添加了任务内容为[cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。]的工时信息', '99', '2020-04-29 17:43:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('305', '耿禹', '239', '3', '耿禹添加了任务内容为[cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。]的工时信息', '99', '2020-04-29 17:45:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('306', '耿禹', '240', '3', '耿禹添加了任务内容为[cesiumjs环境搭建及数据展示，展示类型包括三维地球，瓦片地图、3dmax、glb、点云数据，以及漫游效果的制作。]的工时信息', '99', '2020-04-29 17:45:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('307', '耿禹', '239', '4', '耿禹将工作时长由6修改为7.5', '99', '2020-04-29 17:46:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('308', '耿禹', '240', '4', '耿禹将工作时长由6修改为7.5', '99', '2020-04-29 17:46:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('309', '耿禹', '238', '4', '耿禹将工作时长由6修改为7.5', '99', '2020-04-29 17:46:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('310', '耿禹', '241', '3', '耿禹添加了任务内容为[pytorch-yolov3算法环境搭建、训练、测试]的工时信息', '99', '2020-04-29 17:48:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('311', '耿禹', '242', '3', '耿禹添加了任务内容为[pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。]的工时信息', '99', '2020-04-29 17:51:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('312', '耿禹', '243', '3', '耿禹添加了任务内容为[pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。]的工时信息', '99', '2020-04-29 17:51:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('313', '耿禹', '244', '3', '耿禹添加了任务内容为[pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。]的工时信息', '99', '2020-04-29 17:53:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('314', '耿禹', '245', '3', '耿禹添加了任务内容为[three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能]的工时信息', '99', '2020-04-29 17:57:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('315', '耿禹', '246', '3', '耿禹添加了任务内容为[three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能]的工时信息', '99', '2020-04-29 17:58:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('316', '耿禹', '246', '5', '耿禹删除了任务内容为[three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能]的工时', '99', '2020-04-29 17:59:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('317', '耿禹', '244', '5', '耿禹删除了任务内容为[pytorch-facenet算法环境搭建、调试，完成多目标的人脸跟踪、人脸对比。]的工时', '99', '2020-04-29 17:59:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('318', '耿禹', '247', '3', '耿禹添加了任务内容为[three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能]的工时信息', '99', '2020-04-29 18:00:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('319', '耿禹', '247', '4', '耿禹将项目子内容由产品指导和规划修改为三维重建', '99', '2020-04-29 18:00:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('320', '耿禹', '245', '4', '耿禹将项目子内容由参与解决方案制作修改为三维重建', '99', '2020-04-29 18:00:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('321', '耿禹', '248', '3', '耿禹添加了任务内容为[three.js环境搭建场景开发，完成仓库场景的搭建，包括地板纹理、墙体、门、窗户及开门动画和点击显示所选物体等功能]的工时信息', '99', '2020-04-29 18:04:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('322', '耿禹', '248', '4', '耿禹将项目子内容由产品指导和规划修改为三维重建', '99', '2020-04-29 18:05:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('323', '伍军豪', '249', '3', '伍军豪添加了任务内容为[办理入职，接收所分配的任务，了解threejs大致内容和用途。与耿院长进行交流，查看并学习threejs教程第一章]的工时信息', '99', '2020-04-29 18:32:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('324', '伍军豪', '250', '3', '伍军豪添加了任务内容为[与耿院长交流，查看并且学习threejs第二章，进行demo的编写和测试，将代码进行粗略的封装]的工时信息', '99', '2020-04-29 18:32:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('325', '伍军豪', '251', '3', '伍军豪添加了任务内容为[接受吴总的入职培训。对threejs的demo代码进行细化和封装，学习第三四两章。]的工时信息', '99', '2020-04-29 18:32:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('326', '姚威', '252', '3', '姚威添加了任务内容为[全景图点击点三维位置计算的算法研发]的工时信息', '99', '2020-04-30 08:44:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('327', '姚威', '253', '3', '姚威添加了任务内容为[全景图点击点三维位置计算的算法研发]的工时信息', '99', '2020-04-30 08:44:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('328', '姚威', '254', '3', '姚威添加了任务内容为[全景图点击点三维位置计算的算法研发]的工时信息', '99', '2020-04-30 08:44:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('329', '姚威', '255', '3', '姚威添加了任务内容为[全景量测界面的搭建]的工时信息', '99', '2020-04-30 08:45:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('330', '姚威', '256', '3', '姚威添加了任务内容为[双全景量测的同名点匹配算法研发]的工时信息', '99', '2020-04-30 08:47:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('331', '姚威', '71', '4', '姚威将填报时间由2020-04-10修改为2020-04-07将填报内容由编写轨迹点选取程序，调试出显示全景图的功能修改为熟悉鼠标点选的代码', '99', '2020-04-30 08:56:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('332', '姚威', '257', '3', '姚威添加了任务内容为[编写获取所点选轨迹点信息的程序]的工时信息', '99', '2020-04-30 08:56:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('333', '姚威', '258', '3', '姚威添加了任务内容为[编写通过轨迹点ID获取对应全景图路径的程序]的工时信息', '99', '2020-04-30 08:56:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('334', '姚威', '259', '3', '姚威添加了任务内容为[调试出全景图显示的功能]的工时信息', '99', '2020-04-30 08:56:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('335', '姚威', '255', '4', '姚威将填报内容由全景量测界面的搭建修改为学习opengl鼠标点选功能', '99', '2020-04-30 09:06:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('336', '姚威', '260', '3', '姚威添加了任务内容为[编写通过opengl深度缓冲区获取点选位置的深度，将点选点反投影到三维空间的代码]的工时信息', '99', '2020-04-30 09:06:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('337', '姚威', '261', '3', '姚威添加了任务内容为[将鼠标点选点在opengl中渲染，完成点选的可视化]的工时信息', '99', '2020-04-30 09:06:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('338', '姚威', '262', '3', '姚威添加了任务内容为[优化鼠标点选点渲染的代码和修改bug]的工时信息', '99', '2020-04-30 09:06:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('339', '姚威', '263', '3', '姚威添加了任务内容为[编写球坐标和图像坐标相互转换的程序]的工时信息', '99', '2020-04-30 09:06:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('340', '姚威', '71', '4', '姚威将填报内容由熟悉鼠标点选的代码修改为熟悉cloudcompare鼠标点选的代码', '99', '2020-04-30 09:06:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('341', '姚威', '259', '4', '姚威将工作时长由7.5修改为4.5', '99', '2020-04-30 09:08:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('342', '姚威', '262', '4', '姚威将填报内容由优化鼠标点选点渲染的代码和修改bug修改为编写球坐标和图像坐标相互转换的程序,优化之前的代码并修改bug', '99', '2020-04-30 09:10:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('343', '姚威', '263', '4', '姚威将填报内容由编写球坐标和图像坐标相互转换的程序修改为全景量测界面的搭建', '99', '2020-04-30 09:10:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('344', '姚威', '256', '5', '姚威删除了任务内容为[双全景量测的同名点匹配算法研发]的工时', '99', '2020-04-30 09:11:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('345', '姚威', '264', '3', '姚威添加了任务内容为[学习全景量测相关专利的原理]的工时信息', '99', '2020-04-30 09:14:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('346', '姚威', '265', '3', '姚威添加了任务内容为[双全景量测同名点匹配算法测试程序的编写]的工时信息', '99', '2020-04-30 09:14:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('347', '姚威', '266', '3', '姚威添加了任务内容为[双全景量测的同名点匹配算法研发]的工时信息', '99', '2020-04-30 09:14:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('348', '姚威', '267', '3', '姚威添加了任务内容为[双全景量测的同名点匹配算法研发]的工时信息', '99', '2020-04-30 09:14:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('349', '姚威', '252', '4', '姚威将填报内容由全景图点击点三维位置计算的算法研发修改为编写图像坐标转WGS84的程序', '99', '2020-04-30 09:15:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('350', '宁南鑫', '196', '4', '宁南鑫将填报内容由定期评估CorNerNet模型,复现efficientDet,完成数据增强代码修改修改为定期评估CorNerNet模型,复现efficientDet,开展数据增强统一代码的编写', '99', '2020-04-30 09:35:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('351', '宁南鑫', '268', '3', '宁南鑫添加了任务内容为[编写Mosaic图像增强方法]的工时信息', '99', '2020-04-30 09:35:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('352', '宁南鑫', '268', '4', '宁南鑫将填报内容由编写Mosaic图像增强方法修改为编写Mosaic, padding_image图像增强方法', '99', '2020-04-30 10:41:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('353', '张秀娇', '269', '3', '张秀娇添加了任务内容为[成功配置ROS操作系统的环境]的工时信息', '99', '2020-04-30 12:01:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('354', '戚国华', '215', '4', '戚国华将填报内容由制作《海外自动驾驶调查》PPT，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。修改为制作《海外自动驾驶调查》PPT(20%)，参加解总监的项目文案编辑培训会，听取学习刘经理的产品方案汇报，整理工作中应该注意的要点，弄清不懂得相关知识与概念。', '99', '2020-04-30 13:40:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('355', '戚国华', '270', '3', '戚国华添加了任务内容为[制作《海外自动驾驶调查》PPT(60%)； 学习如何写调研报告及要点；学习使用甘特图；辨析机器学习，人工智能与深度学习概念]的工时信息', '99', '2020-04-30 13:40:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('356', '戚国华', '271', '3', '戚国华添加了任务内容为[制作《海外自动驾驶调查》PPT(90%)；]的工时信息', '99', '2020-04-30 13:41:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('357', '戚国华', '271', '4', '戚国华将工作时长由4修改为7.5', '99', '2020-04-30 13:42:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('358', '姚威', '262', '4', '姚威将工作时长由7.5修改为4.5', '99', '2020-04-30 13:58:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('359', '姚威', '264', '4', '姚威将填报时间由2020-04-21修改为2020-04-20将工作时长由7.5修改为6', '99', '2020-04-30 14:04:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('360', '姚威', '265', '4', '姚威将填报时间由2020-04-22修改为2020-04-21', '99', '2020-04-30 14:04:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('361', '姚威', '266', '4', '姚威将填报时间由2020-04-23修改为2020-04-22', '99', '2020-04-30 14:04:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('362', '姚威', '267', '4', '姚威将填报时间由2020-04-24修改为2020-04-23', '99', '2020-04-30 14:04:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('363', '姚威', '272', '3', '姚威添加了任务内容为[双全景量测的同名点匹配算法研发]的工时信息', '99', '2020-04-30 14:04:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('364', '何海', '273', '3', '何海添加了任务内容为[梳理并整合高精度地图采集要素的采集方式及注意要点，汇总标准中存在疑问的要点信息]的工时信息', '99', '2020-04-30 14:22:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('365', '何海', '274', '3', '何海添加了任务内容为[1、与开发人员针对疑问及相关要点进行讨论分析；2、对标准中针对采集的内容进行分析汇总成文档，方便后期采集。]的工时信息', '99', '2020-04-30 14:22:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('366', '陈淑琳', '275', '3', '陈淑琳添加了任务内容为[总部人事会议的参与、事业部周例会的组织与参与]的工时信息', '99', '2020-04-30 14:28:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('367', '陈淑琳', '276', '3', '陈淑琳添加了任务内容为[招聘工作的开展，候选人陈慧玲的约面]的工时信息', '99', '2020-04-30 14:28:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('368', '陈淑琳', '277', '3', '陈淑琳添加了任务内容为[笔记本电脑的领用流程、公众号推文的发布、项目管理表的填写]的工时信息', '99', '2020-04-30 14:28:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('369', '陈淑琳', '278', '3', '陈淑琳添加了任务内容为[向徐银萍请教项目管理表单的填写规范、咨询王辰洋与吕岑关于年度社保年审及人员档案归属等问题]的工时信息', '99', '2020-04-30 14:28:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('370', '陈淑琳', '279', '3', '陈淑琳添加了任务内容为[伍军豪的入职办理、信息录入、入职材料的整理，林书宇入职材料的准备]的工时信息', '99', '2020-04-30 14:48:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('371', '陈淑琳', '280', '3', '陈淑琳添加了任务内容为[参与总部人事组织的有关职称评审的会议]的工时信息', '99', '2020-04-30 14:48:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('372', '陈淑琳', '281', '3', '陈淑琳添加了任务内容为[和徐雪嵩总针对事业部目前招聘情况进行沟通，研究外地来宁面试人员面试补贴的申请条件及流程]的工时信息', '99', '2020-04-30 14:48:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('373', '陈淑琳', '282', '3', '陈淑琳添加了任务内容为[批导4月的考勤数据，统计并汇总问题数据，与相关人员进行沟通]的工时信息', '99', '2020-04-30 14:48:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('374', '陈淑琳', '283', '3', '陈淑琳添加了任务内容为[日常行政及人事工作的处理]的工时信息', '99', '2020-04-30 14:48:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('375', '陈淑琳', '284', '3', '陈淑琳添加了任务内容为[配合总部参与消防及防疫知识的培训会议]的工时信息', '99', '2020-04-30 14:51:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('376', '陈淑琳', '285', '3', '陈淑琳添加了任务内容为[林书宇的入职办理、信息录入、入职材料的整理]的工时信息', '99', '2020-04-30 14:51:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('377', '陈淑琳', '286', '3', '陈淑琳添加了任务内容为[招聘工作的开展，候选人郭冬妍的面试安排]的工时信息', '99', '2020-04-30 14:51:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('378', '陈淑琳', '287', '3', '陈淑琳添加了任务内容为[日常行政工作的处理]的工时信息', '99', '2020-04-30 14:51:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('379', '陈淑琳', '288', '3', '陈淑琳添加了任务内容为[日常人事工作的对接，五四评优数据的汇总、申报表的填写与打印提交]的工时信息', '99', '2020-04-30 14:51:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('380', '陈淑琳', '285', '4', '陈淑琳将填报内容由林书宇的入职办理、信息录入、入职材料的整理修改为待入职人员林书宇，由于初到南京，到达南京后，先前往公司对后期的工作及租房等问题进行了咨询及进一步沟通', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('381', '陈淑琳', '289', '3', '陈淑琳添加了任务内容为[林书宇的入职办理、信息录入、入职材料的整理]的工时信息', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('382', '陈淑琳', '290', '3', '陈淑琳添加了任务内容为[招聘的开展，郭冬妍的面试安排，事业部至今招聘需求及招聘进展表的填写]的工时信息', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('383', '陈淑琳', '291', '3', '陈淑琳添加了任务内容为[新员工入职培训的参与]的工时信息', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('384', '陈淑琳', '292', '3', '陈淑琳添加了任务内容为[日常行政工作的对接，林书宇台式机的采购申请]的工时信息', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('385', '陈淑琳', '293', '3', '陈淑琳添加了任务内容为[陆海芳、宁南鑫三方的签署，企业信息登记表的填写，学习通过学信网查询人员学历的真伪]的工时信息', '99', '2020-04-30 14:56:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('386', '陈淑琳', '294', '3', '陈淑琳添加了任务内容为[根据社保减免政策及财务的费用表，进行2-3月社保费用的付款流程的重新提交]的工时信息', '99', '2020-04-30 15:01:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('387', '陈淑琳', '295', '3', '陈淑琳添加了任务内容为[事业部花名册、项目管理表、周报及KPI跟进表的填写，根据工时系统制作中山公司工时填报数据的模板]的工时信息', '99', '2020-04-30 15:01:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('388', '陈淑琳', '296', '3', '陈淑琳添加了任务内容为[企业邮箱的申请，由于认证环节较多，目前处于未申请成功阶段]的工时信息', '99', '2020-04-30 15:01:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('389', '陈淑琳', '297', '3', '陈淑琳添加了任务内容为[4月绩效成绩的汇总，五险一金账单的初步制作，配合总部填写人事表单]的工时信息', '99', '2020-04-30 15:01:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('390', '陈淑琳', '298', '3', '陈淑琳添加了任务内容为[日常行政及人事工作的对接]的工时信息', '99', '2020-04-30 15:01:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('391', '戚国华', '270', '4', '戚国华将填报内容由制作《海外自动驾驶调查》PPT(60%)； 学习如何写调研报告及要点；学习使用甘特图；辨析机器学习，人工智能与深度学习概念修改为制作《海外自动驾驶调查》PPT(50%)； 学习如何写调研报告及要点；学习使用甘特图；辨析机器学习，人工智能与深度学习概念', '99', '2020-04-30 15:25:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('392', '戚国华', '271', '4', '戚国华将填报内容由制作《海外自动驾驶调查》PPT(90%)；修改为制作《海外自动驾驶调查》PPT(80%)；', '99', '2020-04-30 15:25:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('393', '戚国华', '271', '4', '戚国华将工作时长由7.5修改为8', '99', '2020-04-30 15:25:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('394', '高恒娟', '299', '3', '高恒娟添加了任务内容为[泰兴恒润制药智慧化工安全生产信息平台：恒润制药硬件建设方案完善; 例会1h;工业互联网2.0体系学习]的工时信息', '99', '2020-04-30 15:37:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('395', '高恒娟', '300', '3', '高恒娟添加了任务内容为[智慧路内停车：路内停车资料学习及收集、功能梳理、报价沟通；宣传册素材及问题沟通1h]的工时信息', '99', '2020-04-30 15:46:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('396', '高恒娟', '301', '3', '高恒娟添加了任务内容为[中丹设备资产管理：中丹设备ppt汇报会，部门内部会加培训，高精度地图调研会；中丹设备资产功能梳理]的工时信息', '99', '2020-04-30 15:46:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('397', '高恒娟', '302', '3', '高恒娟添加了任务内容为[中丹设备资产管理：中丹设备资产功能资料学习、参加ppt演示会；路内停车功能架构；]的工时信息', '99', '2020-04-30 15:46:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('398', '高恒娟', '303', '3', '高恒娟添加了任务内容为[泰兴恒润制药智慧化工厂方案：设备资产流程梳理，部分功能存疑待完善，]的工时信息', '99', '2020-04-30 15:46:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('399', '高恒娟', '304', '3', '高恒娟添加了任务内容为[智慧路内停车：参考的资料进行功能梳理]的工时信息', '99', '2020-04-30 15:46:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('400', '刘锦武', '305', '3', '刘锦武添加了任务内容为[事业部宣传册排版制作以及素材收集]的工时信息', '99', '2020-04-30 15:47:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('401', '刘锦武', '305', '5', '刘锦武删除了任务内容为[事业部宣传册排版制作以及素材收集]的工时', '99', '2020-04-30 15:48:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('402', '刘锦武', '306', '3', '刘锦武添加了任务内容为[企业宣传册素材收集]的工时信息', '99', '2020-04-30 15:48:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('403', '刘锦武', '307', '3', '刘锦武添加了任务内容为[企业宣传册框架制作]的工时信息', '99', '2020-04-30 15:49:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('404', '刘锦武', '308', '3', '刘锦武添加了任务内容为[3DCHINA商城版素材收集与原型制作]的工时信息', '99', '2020-04-30 15:51:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('405', '刘锦武', '309', '3', '刘锦武添加了任务内容为[企业宣传册PS制作与美化]的工时信息', '99', '2020-04-30 15:51:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('406', '刘锦武', '310', '3', '刘锦武添加了任务内容为[恒润制药方案第二稿修改]的工时信息', '99', '2020-04-30 15:52:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('407', '刘锦武', '311', '3', '刘锦武添加了任务内容为[恒润制药招标方案修改与完善]的工时信息', '99', '2020-04-30 15:55:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('408', '刘锦武', '312', '3', '刘锦武添加了任务内容为[2、	3DChina原型图完善商品详情页、登录、注册等页面]的工时信息', '99', '2020-04-30 15:56:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('409', '刘锦武', '310', '5', '刘锦武删除了任务内容为[恒润制药方案第二稿修改]的工时', '99', '2020-04-30 16:02:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('410', '刘锦武', '309', '5', '刘锦武删除了任务内容为[企业宣传册PS制作与美化]的工时', '99', '2020-04-30 16:02:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('411', '刘锦武', '308', '5', '刘锦武删除了任务内容为[3DCHINA商城版素材收集与原型制作]的工时', '99', '2020-04-30 16:02:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('412', '周艳', '313', '3', '周艳添加了任务内容为[更换新版yolov3训练，修改CornerNet数据解析代码，解析tt100k数据]的工时信息', '99', '2020-04-30 16:04:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('413', '刘锦武', '314', '3', '刘锦武添加了任务内容为[3DCHINA商城版素材收集与原型制作]的工时信息', '99', '2020-04-30 16:07:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('414', '刘锦武', '315', '3', '刘锦武添加了任务内容为[企业宣传册PS制作与美化]的工时信息', '99', '2020-04-30 16:07:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('415', '刘锦武', '316', '3', '刘锦武添加了任务内容为[恒润制药方案第二稿修改]的工时信息', '99', '2020-04-30 16:07:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('416', '万子禹', '157', '4', '万子禹将工作时长由6修改为7.5', '99', '2020-04-30 16:07:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('417', '万子禹', '159', '4', '万子禹将工作时长由7修改为7.5', '99', '2020-04-30 16:07:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('418', '万子禹', '160', '4', '万子禹将工作时长由7修改为7.5', '99', '2020-04-30 16:07:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('419', '万子禹', '38', '4', '万子禹将工作时长由3修改为7.5', '99', '2020-04-30 16:08:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('420', '万子禹', '165', '4', '万子禹将工作时长由6修改为7.5', '99', '2020-04-30 16:08:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('421', '万子禹', '317', '3', '万子禹添加了任务内容为[竞品分析（各公司产品优劣势分析）]的工时信息', '99', '2020-04-30 16:09:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('422', '周艳', '318', '3', '周艳添加了任务内容为[yolov3重新训练300epoch,flask写网页调用的框架,安装c++接口的OpenCV]的工时信息', '99', '2020-04-30 16:11:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('423', '周艳', '319', '3', '周艳添加了任务内容为[测试视频，效果差，重新使用yolov3-spp.cfg文件训练，增加多尺度训练。新入职员工工作规划。]的工时信息', '99', '2020-04-30 16:11:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('424', '周艳', '320', '3', '周艳添加了任务内容为[省资金申报文件讨论； 保密检查]的工时信息', '99', '2020-04-30 16:11:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('425', '周艳', '321', '3', '周艳添加了任务内容为[解决恢复训练时缺乏initial_lr的问题，继续训练；设计数据增强方案]的工时信息', '99', '2020-04-30 16:11:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('426', '周艳', '322', '3', '周艳添加了任务内容为[开展数据增强代码编译]的工时信息', '99', '2020-04-30 16:11:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('427', '万子禹', '323', '3', '万子禹添加了任务内容为[智慧城市全球宏观分析，经济、人口、交通、环境等]的工时信息', '99', '2020-04-30 16:13:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('428', '万子禹', '324', '3', '万子禹添加了任务内容为[智慧城市全球地区分析，伦敦、首尔、里约热内卢等]的工时信息', '99', '2020-04-30 16:13:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('429', '万子禹', '325', '3', '万子禹添加了任务内容为[智慧城市发展趋势，我国智慧城市相关政策，法规，试验城市等]的工时信息', '99', '2020-04-30 16:13:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('430', '万子禹', '326', '3', '万子禹添加了任务内容为[智慧城市主要应用场景，主要涉及技术分析，人工智能、大数据、5G等]的工时信息', '99', '2020-04-30 16:13:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('431', '刘锦武', '312', '4', '刘锦武将填报内容由2、	3DChina原型图完善商品详情页、登录、注册等页面修改为3DChina原型图完善商品详情页、登录、注册等页面', '99', '2020-04-30 16:16:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('432', '刘锦武', '327', '3', '刘锦武添加了任务内容为[中丹二期建设方案框架制作（4版）]的工时信息', '99', '2020-04-30 16:16:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('433', '刘锦武', '328', '3', '刘锦武添加了任务内容为[阿波罗平台相关调研、五位一体系统竞争对手方案收集、EAM系统竞争对手方案收集、中丹二期建设方案图片资源收集与修改]的工时信息', '99', '2020-04-30 16:16:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('434', '刘锦武', '329', '3', '刘锦武添加了任务内容为[中丹二期PPT汇报方案整理修改和内部汇报演示（完成）]的工时信息', '99', '2020-04-30 16:16:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('435', '刘锦武', '330', '3', '刘锦武添加了任务内容为[1、	百度阿波罗平台、Autoware平台、百度地图以相关行业网站调研，收集与车企可对接的无人驾驶和高精地图展示平台的功能点以及对接方法（完成）]的工时信息', '99', '2020-04-30 16:16:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('436', '戚国华', '271', '4', '戚国华将工作时长由8修改为7.5', '99', '2020-04-30 16:18:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('437', '刘锦武', '331', '3', '刘锦武添加了任务内容为[五位一体整体行业方案word版初步编写]的工时信息', '99', '2020-04-30 16:18:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('438', '刘锦武', '332', '3', '刘锦武添加了任务内容为[3DChina对接车企服务版原型图制作]的工时信息', '99', '2020-04-30 16:18:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('439', '刘锦武', '333', '3', '刘锦武添加了任务内容为[中丹二期PPT汇报方案整理修改和内部汇报演示]的工时信息', '99', '2020-04-30 16:18:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('440', '刘锦武', '334', '3', '刘锦武添加了任务内容为[五位一体整体行业解决方案工作推进]的工时信息', '99', '2020-04-30 16:18:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('441', '戚国华', '271', '4', '戚国华将填报内容由制作《海外自动驾驶调查》PPT(80%)；修改为制作《海外自动驾驶调查》PPT(85%)；', '99', '2020-04-30 16:18:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('442', '周艳', '335', '3', '周艳添加了任务内容为[编译pad随机变形处理 ；宁南鑫任务交接]的工时信息', '99', '2020-04-30 16:20:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('443', '周艳', '336', '3', '周艳添加了任务内容为[编译随机粘贴pad到image，以及其他数据增强代码]的工时信息', '99', '2020-04-30 16:20:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('444', '周艳', '337', '3', '周艳添加了任务内容为[解决img.paste不成功的问题；转换结果模型为backbone，开始在上一个backbone网络继续训练]的工时信息', '99', '2020-04-30 16:20:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('445', '周艳', '338', '3', '周艳添加了任务内容为[继续在增强后数据上进行训练；调研街景图像变化检测，搜集训练数据集]的工时信息', '99', '2020-04-30 16:20:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('446', '周艳', '339', '3', '周艳添加了任务内容为[讨论630之前展示的内容；研究基于ROS的多目标跟踪方案可行性，借助autoware实现数据融合再进行跟踪算法研发]的工时信息', '99', '2020-04-30 16:20:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('447', '耿禹', '340', '3', '耿禹添加了任务内容为[yolov4 c++ python版本的编译、测试]的工时信息', '99', '2020-04-30 16:24:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('448', '耿禹', '341', '3', '耿禹添加了任务内容为[yolov4 c++ python版本的编译、测试]的工时信息', '99', '2020-04-30 16:27:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('449', '孙茂荣', '342', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告-对智能汽车和V2X梳理思路，整理框架]的工时信息', '99', '2020-04-30 16:27:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('450', '孙茂荣', '343', '3', '孙茂荣添加了任务内容为[速度学院大讲堂培训材料--收集素材]的工时信息', '99', '2020-04-30 16:27:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('451', '孙茂荣', '344', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告-收集材料]的工时信息', '99', '2020-04-30 16:27:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('452', '孙茂荣', '345', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告-收集材料，调整框架]的工时信息', '99', '2020-04-30 16:27:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('453', '孙茂荣', '346', '3', '孙茂荣添加了任务内容为[速度学院大讲堂培训材料-梳理思路，整理框架]的工时信息', '99', '2020-04-30 16:27:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('454', '耿禹', '347', '3', '耿禹添加了任务内容为[autoware平台整理]的工时信息', '99', '2020-04-30 16:29:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('455', '耿禹', '348', '3', '耿禹添加了任务内容为[autoware平台整理]的工时信息', '99', '2020-04-30 16:29:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('456', '解顶林', '349', '3', '解顶林添加了任务内容为[办理入职，熟悉公司环境，同事等]的工时信息', '99', '2020-04-30 16:37:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('457', '解顶林', '350', '3', '解顶林添加了任务内容为[熟悉事业部项目信息，过往文案信息]的工时信息', '99', '2020-04-30 16:37:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('458', '解顶林', '351', '3', '解顶林添加了任务内容为[编写员工培训文档（方案书编制方法及招投标内容）]的工时信息', '99', '2020-04-30 16:37:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('459', '解顶林', '352', '3', '解顶林添加了任务内容为[拜访京东云和京东数科总监]的工时信息', '99', '2020-04-30 16:37:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('460', '周艳', '353', '3', '周艳添加了任务内容为[1]的工时信息', '99', '2020-04-30 16:39:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('461', '周艳', '354', '3', '周艳添加了任务内容为[在本地ubuntu安装环境，调试训练基于孪生度量网络的变化检测模型]的工时信息', '99', '2020-04-30 16:39:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('462', '周艳', '355', '3', '周艳添加了任务内容为[变化检测模型训练，尝试解决loss不下降的问题]的工时信息', '99', '2020-04-30 16:39:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('463', '周艳', '356', '3', '周艳添加了任务内容为[变化检测模型的问题未能解决，待服务器训练；研究地图更新中基于单目视频的目标定位问题，下载模型准备测试(struct2depth)]的工时信息', '99', '2020-04-30 16:39:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('464', '周艳', '357', '3', '周艳添加了任务内容为[继续训练yolov3; 研究LGSVL自动驾驶仿真，测试算法需结合autoware]的工时信息', '99', '2020-04-30 16:40:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('465', '周艳', '353', '4', '周艳将填报内容由1修改为在本地ubuntu安装环境，调试训练基于孪生度量网络的变化检测模型', '99', '2020-04-30 16:40:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('466', '周艳', '354', '4', '周艳将填报内容由在本地ubuntu安装环境，调试训练基于孪生度量网络的变化检测模型修改为变化检测模型训练，尝试解决loss不下降的问题', '99', '2020-04-30 16:40:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('467', '周艳', '355', '4', '周艳将填报内容由变化检测模型训练，尝试解决loss不下降的问题修改为变化检测模型的问题未能解决，待服务器训练；研究地图更新中基于单目视频的目标定位问题，下载模型准备测试(struct2depth)', '99', '2020-04-30 16:40:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('468', '周艳', '356', '4', '周艳将填报内容由变化检测模型的问题未能解决，待服务器训练；研究地图更新中基于单目视频的目标定位问题，下载模型准备测试(struct2depth)修改为yolov3跑完300轮，平均精度达到0.7以上；讨论autoware用户手册，熟悉功能模块流程和主要算法', '99', '2020-04-30 16:40:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('469', '解顶林', '358', '3', '解顶林添加了任务内容为[梳理智慧城市资料库]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('470', '解顶林', '359', '3', '解顶林添加了任务内容为[协助讨论中丹方案编写]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('471', '解顶林', '360', '3', '解顶林添加了任务内容为[中丹方案一稿评审]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('472', '解顶林', '361', '3', '解顶林添加了任务内容为[中丹二稿方案协助编写，同行业资料收集]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('473', '解顶林', '362', '3', '解顶林添加了任务内容为[公司员工制度培训学习，中丹二稿评审]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('474', '解顶林', '363', '3', '解顶林添加了任务内容为[部门周计划总结汇总编写，中丹三稿汇报方案编写]的工时信息', '99', '2020-04-30 16:41:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('475', '林书宇', '364', '3', '林书宇添加了任务内容为[上午 1.办理入职手续，在同事的指引下，填写相关文件。 2.下载E-Moile、绚星、企业 微信，并且熟悉相关使用流程。 重点：学习使用OA系统。 待解决：银行卡办理、体检报告办理。 解决方法：五一假期办理。 下午 参加，新员工培训会。学习公司发展历程、工作守则等等。 3.对接工作任务：目前工作为为制作自动驾驶仿真场景。学习Roadrunner仿真软件，为了参照其制作。 4.下载并安装UE4软件，为后期制作仿真场景做准备。 查阅并学习相关资料，深入学习目前行业动态。 重点：参加，新员工培训会。 待解决：UE4对电脑配置要求极高，尤显卡性能。 解决方法：申请电脑。]的工时信息', '99', '2020-04-30 17:01:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('476', '林书宇', '365', '3', '林书宇添加了任务内容为[上午 1.安装并调试UE4软件，下载相关引擎。正式使用UE4软件开发仿真场景。调用UE4自带的无人驾驶案例，进行了一次仿真。 待解决：UE4对电脑配置要求极高，尤显卡性能。 解决方法：申请电脑 下午 2.对接上级分配工作任务：建模交通指示牌。决定利用SketchUp 2019，安装并调试。 3.SketchUp 2019建模交通指示牌。利用ps改善图片分辨率。配合建模。 重点：ketchUp 2019建模交通指示牌。 待解决：对接图片资料，分辨率过低。 解决方法：查找资料。]的工时信息', '99', '2020-04-30 17:01:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('477', '白慧鹏', '366', '3', '白慧鹏添加了任务内容为[高精地图空间数据入库功能开发]的工时信息', '99', '2020-04-30 18:06:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('478', '姚威', '367', '3', '姚威添加了任务内容为[全景图点击点三维位置计算的算法研发]的工时信息', '99', '2020-04-30 18:08:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('479', '白慧鹏', '368', '3', '白慧鹏添加了任务内容为[高精地图空间数据入库功能开发]的工时信息', '99', '2020-04-30 18:08:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('480', '白慧鹏', '366', '4', '白慧鹏将填报内容由高精地图空间数据入库功能开发修改为高精地图道路空间数据入库代码熟悉', '99', '2020-04-30 18:10:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('481', '白慧鹏', '368', '4', '白慧鹏将填报内容由高精地图空间数据入库功能开发修改为高精地图道路空间数据入库代码熟悉', '99', '2020-04-30 18:10:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('482', '白慧鹏', '369', '3', '白慧鹏添加了任务内容为[高精地图车道线空间数据入库功能开发]的工时信息', '99', '2020-04-30 18:10:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('483', '白慧鹏', '370', '3', '白慧鹏添加了任务内容为[高精地图车道线空间数据入库功能开发]的工时信息', '99', '2020-04-30 18:12:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('484', '白慧鹏', '371', '3', '白慧鹏添加了任务内容为[高精地图车道线空间数据入库功能开发]的工时信息', '99', '2020-04-30 18:12:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('485', '伍军豪', '372', '3', '伍军豪添加了任务内容为[阅读threejs的教程第五章，完成对代码的运行，正在对代码进行下一步封装。]的工时信息', '99', '2020-04-30 18:13:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('486', '白慧鹏', '373', '3', '白慧鹏添加了任务内容为[高精地图车道线拓扑关系构建功能开发]的工时信息', '99', '2020-04-30 18:14:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('487', '白慧鹏', '374', '3', '白慧鹏添加了任务内容为[高精地图车道线拓扑关系构建功能开发]的工时信息', '99', '2020-04-30 18:15:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('488', '温四林', '375', '3', '温四林添加了任务内容为[团队讨论生产工艺流程，确定软件功能的交互方式，研发路口绑定组件]的工时信息', '99', '2020-04-30 18:17:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('489', '白慧鹏', '373', '4', '白慧鹏将填报内容由高精地图车道线拓扑关系构建功能开发修改为高精地图车道线拓扑关系构建功能界面开发', '99', '2020-04-30 18:19:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('490', '白慧鹏', '374', '4', '白慧鹏将填报内容由高精地图车道线拓扑关系构建功能开发修改为高精地图车道线拓扑关系构建功能事件开发', '99', '2020-04-30 18:19:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('491', '白慧鹏', '376', '3', '白慧鹏添加了任务内容为[高精地图车道线拓扑关系构建功能事件开发]的工时信息', '99', '2020-04-30 18:19:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('492', '白慧鹏', '377', '3', '白慧鹏添加了任务内容为[高精地图车道线拓扑关系构建功能事件开发]的工时信息', '99', '2020-04-30 18:19:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('493', '白慧鹏', '378', '3', '白慧鹏添加了任务内容为[高精地图车道线邻接关系功能开发]的工时信息', '99', '2020-04-30 18:19:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('494', '白慧鹏', '379', '3', '白慧鹏添加了任务内容为[高精地图车道线邻接关系功能开发]的工时信息', '99', '2020-04-30 18:20:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('495', '白慧鹏', '380', '3', '白慧鹏添加了任务内容为[高精地图邻近关系功能开发]的工时信息', '99', '2020-04-30 18:21:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('496', '白慧鹏', '381', '3', '白慧鹏添加了任务内容为[高精地图邻近关系功能开发]的工时信息', '99', '2020-04-30 18:23:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('497', '白慧鹏', '382', '3', '白慧鹏添加了任务内容为[高精地图拓扑，邻接，邻近关系功能bug调试]的工时信息', '99', '2020-04-30 18:23:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('498', '白慧鹏', '383', '3', '白慧鹏添加了任务内容为[高精地图车道组关系构建功能开发]的工时信息', '99', '2020-04-30 18:24:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('499', '宁南鑫', '384', '3', '宁南鑫添加了任务内容为[调研车道线检测]的工时信息', '99', '2020-05-06 11:01:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('500', '宁南鑫', '384', '4', '宁南鑫将工作时长由7.5修改为4', '99', '2020-05-06 16:01:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('501', '宁南鑫', '384', '4', '宁南鑫将工作时长由4修改为7.5将填报内容由调研车道线检测修改为调研车道线检测, 红绿灯检测, 车道指示线检测', '99', '2020-05-06 17:01:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('502', '宁南鑫', '385', '3', '宁南鑫添加了任务内容为[阅读相关单目3d检测论文,]的工时信息', '99', '2020-05-08 10:14:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('503', '宁南鑫', '386', '3', '宁南鑫添加了任务内容为[继续阅读相关论文, 寻找合适的网络]的工时信息', '99', '2020-05-08 10:14:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('504', '张秀娇', '387', '3', '张秀娇添加了任务内容为[autoware环境搭建]的工时信息', '99', '2020-05-08 10:52:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('505', '张秀娇', '388', '3', '张秀娇添加了任务内容为[完成autoware环境搭建及demo测试]的工时信息', '99', '2020-05-08 10:52:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('506', '刘锦武', '389', '3', '刘锦武添加了任务内容为[恒润制药五位一体平台投标文件技术部分制作]的工时信息', '99', '2020-05-08 14:07:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('507', '刘锦武', '390', '3', '刘锦武添加了任务内容为[恒润制药五位一体平台投标文件技术部分制作]的工时信息', '99', '2020-05-08 14:07:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('508', '刘锦武', '391', '3', '刘锦武添加了任务内容为[五位一体行业通用方案编写]的工时信息', '99', '2020-05-08 14:07:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('509', '宁南鑫', '386', '4', '宁南鑫将工作时长由7.5修改为4', '99', '2020-05-08 14:53:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('510', '宁南鑫', '392', '3', '宁南鑫添加了任务内容为[开展struct2depth的训练工作, KITII数据集的准备]的工时信息', '99', '2020-05-08 14:53:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('511', '宁南鑫', '386', '4', '宁南鑫将工作时长由4修改为3.5', '99', '2020-05-08 14:54:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('512', '张秀娇', '393', '3', '张秀娇添加了任务内容为[关于ROS及autoware的系统安装及环境操作的资料总结和安装注意事项等材料整理]的工时信息', '99', '2020-05-08 15:18:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('513', '张秀娇', '394', '3', '张秀娇添加了任务内容为[关于ROS和autoware的系统安装和运行环境搭建的总结和整理]的工时信息', '99', '2020-05-08 15:19:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('514', '宁南鑫', '392', '4', '宁南鑫将填报内容由开展struct2depth的训练工作, KITII数据集的准备修改为开展struct2depth的训练工作, KITII数据集的准备, 配置新的环境', '99', '2020-05-08 16:55:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('515', '张秀娇', '394', '5', '张秀娇删除了任务内容为[关于ROS和autoware的系统安装和运行环境搭建的总结和整理]的工时', '99', '2020-05-08 17:44:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('516', '张秀娇', '395', '3', '张秀娇添加了任务内容为[LGSVL仿真环境学习，以及与autoware连接相关知识调研]的工时信息', '99', '2020-05-08 17:47:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('517', '刘锦武', '396', '3', '刘锦武添加了任务内容为[恒润制药五位一体平台投标文件技术部分互审]的工时信息', '99', '2020-05-09 14:23:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('518', '宁南鑫', '397', '3', '宁南鑫添加了任务内容为[调整MASK RCNN]的工时信息', '99', '2020-05-09 14:27:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('519', '何海', '398', '3', '何海添加了任务内容为[测试高精地图编译软件的功能，根据软件对数据进行完善]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('520', '何海', '399', '3', '何海添加了任务内容为[测试高精地图编译软件的功能，根据软件对数据进行完善]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('521', '何海', '400', '3', '何海添加了任务内容为[测试高精地图编译软件的功能]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('522', '何海', '401', '3', '何海添加了任务内容为[配合华为调研人员进行调研，进行汇报]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('523', '何海', '402', '3', '何海添加了任务内容为[测试高精地图编译软件的功能]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('524', '何海', '403', '3', '何海添加了任务内容为[修改公司展示所用的PPT，协调人员参与华为高精地图调研]的工时信息', '99', '2020-05-09 15:20:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('525', '陈淑琳', '404', '3', '陈淑琳添加了任务内容为[对接王辰洋沟通何海职称事宜、对接黄恩庆沟通江苏省科技副总相关事宜]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('526', '陈淑琳', '405', '3', '陈淑琳添加了任务内容为[周例会的组织]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('527', '陈淑琳', '406', '3', '陈淑琳添加了任务内容为[报名参与南京信息工程大学3S行业招聘会，筛选招聘网站的简历]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('528', '陈淑琳', '407', '3', '陈淑琳添加了任务内容为[4月五险一金的账单的制作]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('529', '陈淑琳', '408', '3', '陈淑琳添加了任务内容为[4月考勤表。绩效汇总表的制作]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('530', '陈淑琳', '409', '3', '陈淑琳添加了任务内容为[4月考勤表、五险一金账单、绩效表的定稿与提交，4月考勤数据的签字确认；市场人员绩效激励制度的编制]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('531', '陈淑琳', '410', '3', '陈淑琳添加了任务内容为[中国智能网联汽车产业创新联盟会员的注册]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('532', '陈淑琳', '411', '3', '陈淑琳添加了任务内容为[招聘宣讲PPT的制作]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('533', '陈淑琳', '412', '3', '陈淑琳添加了任务内容为[日常行政事务的对接]的工时信息', '99', '2020-05-09 16:37:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('534', '陈淑琳', '413', '3', '陈淑琳添加了任务内容为[4月工资初稿]的工时信息', '99', '2020-05-09 16:43:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('535', '陈淑琳', '414', '3', '陈淑琳添加了任务内容为[4月五险一金费用付款流程的提交]的工时信息', '99', '2020-05-09 16:43:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('536', '陈淑琳', '415', '3', '陈淑琳添加了任务内容为[招聘工作的开展，推荐候选人1人]的工时信息', '99', '2020-05-09 16:43:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('537', '陈淑琳', '416', '3', '陈淑琳添加了任务内容为[员工档案扫描、整理并转总部；转正评审会的对接]的工时信息', '99', '2020-05-09 16:43:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('538', '陈淑琳', '417', '3', '陈淑琳添加了任务内容为[企业邮箱的申请、名片的印制]的工时信息', '99', '2020-05-09 16:43:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('539', '陈淑琳', '418', '3', '陈淑琳添加了任务内容为[办公区新装办公室的布置及物资采购浏览，接待工作]的工时信息', '99', '2020-05-09 16:47:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('540', '陈淑琳', '419', '3', '陈淑琳添加了任务内容为[花名册、项目管理表、周报、KPI跟进表及会议纪要的编写]的工时信息', '99', '2020-05-09 16:47:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('541', '陈淑琳', '418', '4', '陈淑琳将工作时长由4修改为4.5', '99', '2020-05-09 16:50:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('542', '陈淑琳', '419', '4', '陈淑琳将工作时长由2修改为3将填报内容由花名册、项目管理表、周报、KPI跟进表及会议纪要的编写修改为花名册、项目管理表、周报、KPI跟进表及会议纪要的编写；总部人事会议的参与', '99', '2020-05-09 16:50:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('543', '宁南鑫', '397', '4', '宁南鑫将填报内容由调整MASK RCNN修改为调整MASK RCNN的输出', '99', '2020-05-09 17:36:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('544', '宁南鑫', '397', '4', '宁南鑫将填报内容由调整MASK RCNN的输出修改为调整MASK RCNN', '99', '2020-05-09 17:36:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('545', '宁南鑫', '420', '3', '宁南鑫添加了任务内容为[调整完毕RCNN的输出, 开始处理KITTI数据集]的工时信息', '99', '2020-05-11 10:04:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('546', '刘锦武', '421', '3', '刘锦武添加了任务内容为[恒润制药五位一体平台投标文件合规审查]的工时信息', '99', '2020-05-11 14:55:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('547', '宁南鑫', '420', '4', '宁南鑫将工作时长由7.5修改为3.5将填报内容由调整完毕RCNN的输出, 开始处理KITTI数据集修改为调整完毕MASK RCNN的输出, 使用MASK RCNN开始处理KITTI数据集', '99', '2020-05-11 17:26:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('548', '宁南鑫', '422', '3', '宁南鑫添加了任务内容为[对输出的mask, 原图进行处理工作, 编写相关代码, 生成txt文件]的工时信息', '99', '2020-05-11 17:26:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('549', '张秀娇', '387', '4', '张秀娇将填报时间由4修改为1', '99', '2020-05-12 09:08:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('550', '张秀娇', '388', '4', '张秀娇将填报时间由4修改为1', '99', '2020-05-12 09:08:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('551', '张秀娇', '393', '4', '张秀娇将填报时间由4修改为2', '99', '2020-05-12 09:08:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('552', '张秀娇', '423', '3', '张秀娇添加了任务内容为[autoware软件的demo错误调试]的工时信息', '99', '2020-05-12 09:08:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('553', '张秀娇', '424', '3', '张秀娇添加了任务内容为[LGSVL与autoware连接的硬件调研，确认需配置笔记本一台]的工时信息', '99', '2020-05-12 09:08:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('554', '张秀娇', '425', '3', '张秀娇添加了任务内容为[autoware中的快速启动demo测试]的工时信息', '99', '2020-05-12 09:13:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('555', '张秀娇', '426', '3', '张秀娇添加了任务内容为[autoware中的地图建立demo测试]的工时信息', '99', '2020-05-12 09:13:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('556', '张秀娇', '427', '3', '张秀娇添加了任务内容为[autoware中的使用gnss定位、不使用gnss定位的demo测试]的工时信息', '99', '2020-05-12 09:13:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('557', '张秀娇', '428', '3', '张秀娇添加了任务内容为[autoware中的任务规划部分的demo测试及错误调试]的工时信息', '99', '2020-05-12 09:13:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('558', '宁南鑫', '429', '3', '宁南鑫添加了任务内容为[修改struct2depth代码]的工时信息', '99', '2020-05-12 10:04:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('559', '宁南鑫', '429', '4', '宁南鑫将填报内容由修改struct2depth代码修改为修改struct2depth代码, 调试NAN', '99', '2020-05-12 15:48:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('560', '宁南鑫', '430', '3', '宁南鑫添加了任务内容为[开始训练struct2depth, 开始研究深度信息与目标定位计算位姿]的工时信息', '99', '2020-05-13 09:39:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('561', '宁南鑫', '430', '4', '宁南鑫将填报内容由开始训练struct2depth, 开始研究深度信息与目标定位计算位姿修改为开始训练struct2depth, 开始调研如何应用深度信息. 显卡显存不够, 停止训练, 等待设备到齐再开始训练.', '99', '2020-05-13 16:42:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('562', '宁南鑫', '431', '3', '宁南鑫添加了任务内容为[继续调研学习深度信息与2D图像的融合使用]的工时信息', '99', '2020-05-14 08:36:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('563', '张秀娇', '432', '3', '张秀娇添加了任务内容为[autoware中使用rosbag包进行建图]的工时信息', '99', '2020-05-14 09:10:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('564', '张秀娇', '433', '3', '张秀娇添加了任务内容为[进行autoware的视频、激光雷达等多传感器融合数据包的demo调试]的工时信息', '99', '2020-05-14 09:10:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('565', '张秀娇', '434', '3', '张秀娇添加了任务内容为[autoware各功能操作流程整理]的工时信息', '99', '2020-05-14 09:10:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('566', '张秀娇', '435', '3', '张秀娇添加了任务内容为[autoware/ROS连接USB相机启动调试]的工时信息', '99', '2020-05-14 09:10:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('567', '宁南鑫', '431', '4', '宁南鑫将填报内容由继续调研学习深度信息与2D图像的融合使用修改为继续调研学习深度信息与2D图像的融合使用, 记录基于单目云台摄像机的深度估计', '99', '2020-05-14 15:17:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('568', '陈淑琳', '436', '3', '陈淑琳添加了任务内容为[周例会的开展]的工时信息', '99', '2020-05-15 11:24:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('569', '陈淑琳', '437', '3', '陈淑琳添加了任务内容为[招聘需求的梳理，新增需求：研发经理，筛选简历]的工时信息', '99', '2020-05-15 11:24:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('570', '陈淑琳', '438', '3', '陈淑琳添加了任务内容为[相关行政事宜，采购事业部零食、专业键盘、办公桌及文件柜]的工时信息', '99', '2020-05-15 11:24:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('571', '陈淑琳', '439', '3', '陈淑琳添加了任务内容为[工资表等表单的制作，3位员工转正流程的发起]的工时信息', '99', '2020-05-15 11:24:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('572', '陈淑琳', '440', '3', '陈淑琳添加了任务内容为[配合总部收集2017-2019年公积金汇缴数据截图]的工时信息', '99', '2020-05-15 13:59:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('573', '陈淑琳', '441', '3', '陈淑琳添加了任务内容为[参与总部人事会议]的工时信息', '99', '2020-05-15 13:59:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('574', '陈淑琳', '442', '3', '陈淑琳添加了任务内容为[对接黄恩庆有关科技副总等事宜]的工时信息', '99', '2020-05-15 13:59:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('575', '陈淑琳', '443', '3', '陈淑琳添加了任务内容为[简历筛选，联系4位候选人]的工时信息', '99', '2020-05-15 13:59:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('576', '陈淑琳', '444', '3', '陈淑琳添加了任务内容为[相关行政事宜，研究中国移动的项目：DICT全国集成库合作伙伴（第二批）集中采购框架-自动驾驶采购]的工时信息', '99', '2020-05-15 13:59:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('577', '陈淑琳', '445', '3', '陈淑琳添加了任务内容为[配合总部提供南京速度软件技术有限公司近四年的社保和公积金月度明细表]的工时信息', '99', '2020-05-15 14:01:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('578', '陈淑琳', '446', '3', '陈淑琳添加了任务内容为[配合总部提供南京速度软件技术有限公司近四年的社保和公积金月度明细表]的工时信息', '99', '2020-05-15 14:01:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('579', '陈淑琳', '447', '3', '陈淑琳添加了任务内容为[外出提交软件员工持股平台的纸质审核材料、外出拜访南京邮电大学 陈老师]的工时信息', '99', '2020-05-15 14:03:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('580', '陈淑琳', '448', '3', '陈淑琳添加了任务内容为[参与总部行政会议等行政事宜，配合整理华为公司的审查材料]的工时信息', '99', '2020-05-15 14:03:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('581', '陈淑琳', '449', '3', '陈淑琳添加了任务内容为[外出提交软件员工持股平台的纸质审核材料]的工时信息', '99', '2020-05-15 14:09:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('582', '陈淑琳', '450', '3', '陈淑琳添加了任务内容为[烟酒的采购等行政事宜]的工时信息', '99', '2020-05-15 14:09:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('583', '陈淑琳', '451', '3', '陈淑琳添加了任务内容为[林书宇三方协议及来宁面试材料的盖章申请、配合总部提供五险一金数据、拓展活动的讨论]的工时信息', '99', '2020-05-15 14:09:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('584', '陈淑琳', '452', '3', '陈淑琳添加了任务内容为[对接南京市信息中心，对接后期拜访事宜，主任不在；研究并修改中国移动电子采购与招标投标系统的公司信息]的工时信息', '99', '2020-05-15 14:09:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('585', '宁南鑫', '453', '3', '宁南鑫添加了任务内容为[开始研究单目相机测距,着手代码编写]的工时信息', '99', '2020-05-15 15:32:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('586', '高恒娟', '454', '3', '高恒娟添加了任务内容为[克拉玛依智慧停车：路内停车投标技术方案资料收集、框架图完善、综合管理平台功能梳理完善]的工时信息', '99', '2020-05-15 15:45:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('587', '高恒娟', '455', '3', '高恒娟添加了任务内容为[克拉玛依智慧停车：路内停车投标技术方案框架图完善、数据库建设、集成、收费APP等功能完善]的工时信息', '99', '2020-05-15 15:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('588', '高恒娟', '456', '3', '高恒娟添加了任务内容为[克拉玛依智慧停车：路内停车投标技术方案文档排版]的工时信息', '99', '2020-05-15 15:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('589', '高恒娟', '457', '3', '高恒娟添加了任务内容为[通版智慧停车：智慧停车资料收集、脑图构建，周例会]的工时信息', '99', '2020-05-15 15:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('590', '高恒娟', '458', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件：设备报价咨询沟通]的工时信息', '99', '2020-05-15 15:53:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('591', '高恒娟', '459', '3', '高恒娟添加了任务内容为[通版智慧停车：智慧停车资料收集、脑图构建]的工时信息', '99', '2020-05-15 15:55:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('592', '高恒娟', '460', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件：设备报价、功能浏览]的工时信息', '99', '2020-05-15 15:55:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('593', '高恒娟', '461', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件：设备清单报价整理梳理，主要技术内容讨论修改]的工时信息', '99', '2020-05-15 15:57:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('594', '高恒娟', '462', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件：设备清单报价及调整 ，周例会]的工时信息', '99', '2020-05-15 15:58:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('595', '高恒娟', '463', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件：设备清单最终报价、表格，清单制作，配合商务等工作]的工时信息', '99', '2020-05-15 16:00:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('596', '高恒娟', '464', '3', '高恒娟添加了任务内容为[恒润制药投标技术文件： 需求梳理，送标书]的工时信息', '99', '2020-05-15 16:00:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('597', '高恒娟', '465', '3', '高恒娟添加了任务内容为[通版智慧停车：智慧停车脑图构建，停车概况、数据库、智慧停车集成编写]的工时信息', '99', '2020-05-15 16:03:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('598', '高恒娟', '466', '3', '高恒娟添加了任务内容为[通版智慧停车：、数字孪生，一体化平台编写、综合管理平台功能编写晚上]的工时信息', '99', '2020-05-15 16:03:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('599', '戚国华', '467', '3', '戚国华添加了任务内容为[海外自动驾驶调查PPT完成；学习88号文件、96号文件，输出思维导图3份（40%）。]的工时信息', '99', '2020-05-15 18:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('600', '戚国华', '468', '3', '戚国华添加了任务内容为[完成88号与96号文件思维导图框架梳理；对88号文件中重点参数、技术要求整理，输出技术要求要点细则1份；制作投标书功能清单对照表（初版1份）]的工时信息', '99', '2020-05-15 18:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('601', '戚国华', '469', '3', '戚国华添加了任务内容为[为投标书技术部分，提出4项有效建议（3项内容相关，1项格式）；输出招标书功能清单对照表（交付版1份）]的工时信息', '99', '2020-05-15 18:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('602', '戚国华', '470', '3', '戚国华添加了任务内容为[为投标书技术部分，提出内容行有效建议9项；输出word版亨润项目功能清单一份；修改投标书的“移动APP”模块内容及排版]的工时信息', '99', '2020-05-15 18:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('603', '戚国华', '471', '3', '戚国华添加了任务内容为[检查投标书错误；制作供应商管理一览表Excel；学习江苏高科技氟化学工业园招标方案，生成思维导图（80%），了解园区级规划要求]的工时信息', '99', '2020-05-15 18:28:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('604', '戚国华', '472', '3', '戚国华添加了任务内容为[学习老山森林公园规划书，输出思维导图（10%）；恒润投标书会议；对投标书进行内容完善、整理]的工时信息', '99', '2020-05-15 18:28:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('605', '戚国华', '473', '3', '戚国华添加了任务内容为[学习老山森林公园规划书，输出思维导图（50%）；学习数据库规范29号文件，安全风险分区指南105号文件（100%）]的工时信息', '99', '2020-05-15 18:28:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('606', '戚国华', '474', '3', '戚国华添加了任务内容为[老山森林公园规划书，输出思维导图（100%）；梳理PPT智慧园区框架构造]的工时信息', '99', '2020-05-15 18:28:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('607', '戚国华', '475', '3', '戚国华添加了任务内容为[制作智慧园区PPT（10%）；梳理智慧园区业务逻辑、业务分类。]的工时信息', '99', '2020-05-15 18:28:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('608', '何海', '476', '3', '何海添加了任务内容为[speedHDmap软件功能测试]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('609', '何海', '477', '3', '何海添加了任务内容为[供应商隐私保护认证标准及checklist的相关资料的准备工作，与保密办对接相关资料]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('610', '何海', '478', '3', '何海添加了任务内容为[供应商隐私保护认证标准及checklist的相关资料的准备工作]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('611', '何海', '479', '3', '何海添加了任务内容为[speedHDmap软件功能测试]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('612', '何海', '480', '3', '何海添加了任务内容为[speedHDmap软件功能测试，利用软件功能建立拓扑关系]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('613', '何海', '481', '3', '何海添加了任务内容为[供应商隐私保护认证标准及checklist的相关资料的准备工作，参加华为的审查会议]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('614', '何海', '482', '3', '何海添加了任务内容为[speedHDmap软件功能测试，利用软件功能建立拓扑关系]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('615', '何海', '483', '3', '何海添加了任务内容为[speedHDmap软件功能测试，利用软件功能建立拓扑关系]的工时信息', '99', '2020-05-15 18:31:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('616', '宁南鑫', '484', '3', '宁南鑫添加了任务内容为[编写了C++版本的YOLOV3 推理代码]的工时信息', '99', '2020-05-16 16:17:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('617', '宁南鑫', '485', '3', '宁南鑫添加了任务内容为[研究对极几何约束,研究单目相机位姿]的工时信息', '99', '2020-05-18 11:03:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('618', '张秀娇', '486', '3', '张秀娇添加了任务内容为[尝试使用本公司的徐庄软件园的地图数据测试，出现错误并调试]的工时信息', '99', '2020-05-18 17:09:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('619', '张秀娇', '487', '3', '张秀娇添加了任务内容为[激光雷达融合视觉的数据包的错误分析调研]的工时信息', '99', '2020-05-18 17:09:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('620', '张秀娇', '488', '3', '张秀娇添加了任务内容为[激光雷达节点转换方法学习]的工时信息', '99', '2020-05-18 17:09:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('621', '张秀娇', '489', '3', '张秀娇添加了任务内容为[激光雷达与视觉的数据包转换学习]的工时信息', '99', '2020-05-18 17:28:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('622', '张秀娇', '490', '3', '张秀娇添加了任务内容为[相机的matlab标定]的工时信息', '99', '2020-05-18 17:28:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('623', '宁南鑫', '491', '3', '宁南鑫添加了任务内容为[编写特征点匹配C++代码,相机运动矩阵代码]的工时信息', '99', '2020-05-19 11:37:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('624', '宁南鑫', '491', '4', '宁南鑫将填报内容由编写特征点匹配C++代码,相机运动矩阵代码修改为编写2d_2d相机位姿估计代码', '99', '2020-05-19 17:48:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('625', '宁南鑫', '492', '3', '宁南鑫添加了任务内容为[完成相机位姿估计代码编写]的工时信息', '99', '2020-05-20 11:17:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('626', '宁南鑫', '493', '3', '宁南鑫添加了任务内容为[开展车牌定位工作]的工时信息', '99', '2020-05-20 11:17:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('627', '张秀娇', '490', '4', '张秀娇将填报内容由相机的matlab标定修改为使用matlab进行相机标定，读取相机参数', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('628', '张秀娇', '494', '3', '张秀娇添加了任务内容为[完成bag数据包中的相机部分以及雷达扫描数据的消息类型转换]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('629', '张秀娇', '495', '3', '张秀娇添加了任务内容为[完成bag数据包中的相机部分数据以及雷达扫描数据的话题修改]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('630', '张秀娇', '496', '3', '张秀娇添加了任务内容为[完成bag数据包中的其他部分数据的消息类型转换]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('631', '张秀娇', '497', '3', '张秀娇添加了任务内容为[完成bag数据包中的其他部分数据的话题内容转换]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('632', '张秀娇', '498', '3', '张秀娇添加了任务内容为[使用转换格式之后的数据包，进行建图]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('633', '张秀娇', '499', '3', '张秀娇添加了任务内容为[对数据包的转换方法和有关资料进行整理]的工时信息', '99', '2020-05-20 15:56:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('634', '宁南鑫', '500', '3', '宁南鑫添加了任务内容为[faster rcnn版本问题无法使用,更换网络]的工时信息', '99', '2020-05-21 10:08:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('635', '张秀娇', '499', '4', '张秀娇将填报时间由1修改为2', '99', '2020-05-21 10:44:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('636', '张秀娇', '501', '3', '张秀娇添加了任务内容为[ROS系统下的相机标定]的工时信息', '99', '2020-05-21 10:44:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('637', '张秀娇', '502', '3', '张秀娇添加了任务内容为[数据包的pcd文件生成，及错误查找]的工时信息', '99', '2020-05-21 10:44:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('638', '刘锦武', '503', '3', '刘锦武添加了任务内容为[恒润制药五位一体平台投标文件封装]的工时信息', '99', '2020-05-21 16:43:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('639', '刘锦武', '504', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:43:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('640', '刘锦武', '505', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:43:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('641', '刘锦武', '506', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:43:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('642', '刘锦武', '507', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:46:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('643', '刘锦武', '508', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:46:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('644', '刘锦武', '509', '3', '刘锦武添加了任务内容为[智慧城管相关资料收集]的工时信息', '99', '2020-05-21 16:46:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('645', '刘锦武', '510', '3', '刘锦武添加了任务内容为[五位一体化工行业方案编写]的工时信息', '99', '2020-05-21 16:46:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('646', '张秀娇', '511', '3', '张秀娇添加了任务内容为[针对自采集的徐庄软件园的高精地图数据使用autoware建图，进行错误查找，目前未成功解决错误]的工时信息', '99', '2020-05-25 15:19:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('647', '宁南鑫', '512', '3', '宁南鑫添加了任务内容为[完成车牌检测代码,研读TRI-ML数据集,源码]的工时信息', '99', '2020-05-25 15:21:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('648', '戚国华', '513', '3', '戚国华添加了任务内容为[1. 搜索阅读论文15份；2. 输出完善《概念解析及辨析》文档，（主要：新型网络架构-SDN(软件定义网络)与ESB概念原理，SOA与微服务架构，ESB与API网关区别)]的工时信息', '99', '2020-05-25 20:01:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('649', '戚国华', '514', '3', '戚国华添加了任务内容为[1. PPT 内容、素材及模板整理（50%）；2. 阅读论文8篇，收集照片素材33张；3. 完善《概念解析及辨析》，数字化、智能化、智慧化、城市大脑]的工时信息', '99', '2020-05-25 20:01:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('650', '戚国华', '515', '3', '戚国华添加了任务内容为[1. 概览50份智慧景区方案，有用的精度；2.  丰富智慧景区子系统功能，划分整体架构；]的工时信息', '99', '2020-05-25 20:01:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('651', '戚国华', '516', '3', '戚国华添加了任务内容为[1. 制作智慧景区PPT（109页），将之前所有的素材整理；]的工时信息', '99', '2020-05-25 20:01:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('652', '戚国华', '517', '3', '戚国华添加了任务内容为[1. 搜集PPT模板 2. 丰富智慧景区PPT中缺失的图片 3. 重构智慧景区系统的构架，因为部分子系统功能具有重叠、交叉，所以较难梳理]的工时信息', '99', '2020-05-25 20:01:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('653', '戚国华', '518', '3', '戚国华添加了任务内容为[1.  精修制作PPT （33页）；]的工时信息', '99', '2020-05-25 20:04:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('654', '宁南鑫', '519', '3', '宁南鑫添加了任务内容为[车牌检测完成,继续研读论文,向作者提出问题邓艾解答,尝试构建车牌识别]的工时信息', '99', '2020-05-26 14:43:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('655', '高恒娟', '520', '3', '高恒娟添加了任务内容为[停车通版智慧:综合管理平台功能梳理，周例会]的工时信息', '99', '2020-05-27 08:36:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('656', '高恒娟', '521', '3', '高恒娟添加了任务内容为[智慧康养方案：相关资料收集]的工时信息', '99', '2020-05-27 08:38:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('657', '高恒娟', '522', '3', '高恒娟添加了任务内容为[丽水公安局拜访智慧公安事宜，宿迁高速姜总]的工时信息', '99', '2020-05-27 08:38:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('658', '高恒娟', '523', '3', '高恒娟添加了任务内容为[智慧康养方案：资料收集、ppt 制作]的工时信息', '99', '2020-05-27 08:40:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('659', '高恒娟', '520', '4', '高恒娟将填报时间由3修改为4', '99', '2020-05-27 08:43:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('660', '高恒娟', '524', '3', '高恒娟添加了任务内容为[智慧康养方案：ppt 制作完善]的工时信息', '99', '2020-05-27 08:43:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('661', '高恒娟', '525', '3', '高恒娟添加了任务内容为[停车通版智慧:子系统功能补充完善]的工时信息', '99', '2020-05-27 08:43:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('662', '高恒娟', '526', '3', '高恒娟添加了任务内容为[停车通版智慧:子系统功能补充完善]的工时信息', '99', '2020-05-27 08:44:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('663', '张秀娇', '527', '3', '张秀娇添加了任务内容为[autoware矢量地图标注环境搭建]的工时信息', '99', '2020-05-27 08:49:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('664', '张秀娇', '528', '3', '张秀娇添加了任务内容为[ROS坐标系转换知识学习]的工时信息', '99', '2020-05-27 08:49:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('665', '张秀娇', '529', '3', '张秀娇添加了任务内容为[autoware内部结构学习]的工时信息', '99', '2020-05-27 08:49:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('666', '张秀娇', '530', '3', '张秀娇添加了任务内容为[autoware矢量地图标注环境搭建]的工时信息', '99', '2020-05-27 08:49:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('667', '张秀娇', '531', '3', '张秀娇添加了任务内容为[ndt建图及原理学习]的工时信息', '99', '2020-05-27 08:49:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('668', '张秀娇', '531', '4', '张秀娇将填报时间由1修改为4', '99', '2020-05-27 08:49:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('669', '宁南鑫', '519', '4', '宁南鑫将填报内容由车牌检测完成,继续研读论文,向作者提出问题邓艾解答,尝试构建车牌识别修改为车牌检测完成,继续研读论文,向作者提出问题等待解答,尝试构建车牌识别', '99', '2020-05-27 09:54:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('670', '宁南鑫', '532', '3', '宁南鑫添加了任务内容为[开始车牌ocr识别的训练]的工时信息', '99', '2020-05-27 09:54:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('671', '陈淑琳', '533', '3', '陈淑琳添加了任务内容为[学习中国移动招投标网站，采购比选文件；制作拜访函；制作花名册、项目管理表、周报、KPI跟进表、会议纪要；办公物资的盘点；日常行政工作；速度软件公司的合规证明]的工时信息', '99', '2020-05-27 15:25:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('672', '陈淑琳', '534', '3', '陈淑琳添加了任务内容为[举行周例会；固定资产表的核实；制作打印行程单、席卡；中国移动招投标网报名；提交新开公司流程；汇总事业部子女信息]的工时信息', '99', '2020-05-27 15:27:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('673', '陈淑琳', '535', '3', '陈淑琳添加了任务内容为[姚威离职手续的办理；工资定稿；日常人事工作；招聘]的工时信息', '99', '2020-05-27 15:27:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('674', '陈淑琳', '536', '3', '陈淑琳添加了任务内容为[采购接待使用的烟酒、准备接待物资]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('675', '陈淑琳', '537', '3', '陈淑琳添加了任务内容为[整理招聘需求，发布新岗位；公积金汇缴；6位候选人的沟通；社保缴纳材料的准备]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('676', '陈淑琳', '538', '3', '陈淑琳添加了任务内容为[候选人张瑞铭的面试安排；离职材料的整理、扫描与转交；招聘]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('677', '陈淑琳', '539', '3', '陈淑琳添加了任务内容为[协助接待翠亨公司领导；合同的盖章、扫描、邮寄]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('678', '陈淑琳', '540', '3', '陈淑琳添加了任务内容为[配合总部准备公积金凭证；待转正人员转正流程的发起；]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('679', '陈淑琳', '541', '3', '陈淑琳添加了任务内容为[趣味篮球赛的策划、耿院长物资采购的申请]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('680', '陈淑琳', '542', '3', '陈淑琳添加了任务内容为[花名册、项目管理表、周报、KPI根基表、会议纪要的编写；组织趣味篮球赛]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('681', '陈淑琳', '543', '3', '陈淑琳添加了任务内容为[2020年度基数申报工作的开展；招聘工作]的工时信息', '99', '2020-05-27 15:36:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('682', '陈淑琳', '544', '3', '陈淑琳添加了任务内容为[郑曼、吴畏、陈淑琳转正评审会的准备与开展；上传工资数据；安排候选人姚阳面试；招聘]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('683', '陈淑琳', '545', '3', '陈淑琳添加了任务内容为[周例会的开展；编写事业部推文；华为材料的打印、审核]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('684', '陈淑琳', '546', '3', '陈淑琳添加了任务内容为[事业部推文的发布；华为合同也的盖章、邮寄；项目全流程汇总表的制作；配合总部行政工作]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('685', '陈淑琳', '547', '3', '陈淑琳添加了任务内容为[候选人姚阳offer的发放；招聘，两位候选人的沟通；基数申报工作]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('686', '陈淑琳', '548', '3', '陈淑琳添加了任务内容为[事业部岗位说明书的编写；汇总考勤数据、审批流程；修改招聘信息]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('687', '陈淑琳', '549', '3', '陈淑琳添加了任务内容为[事业部办公用品的采购，日常行政工作]的工时信息', '99', '2020-05-27 15:41:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('688', '宁南鑫', '550', '3', '宁南鑫添加了任务内容为[开始编写完整的车牌检测与识别代码]的工时信息', '99', '2020-05-28 08:49:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('689', '宁南鑫', '550', '4', '宁南鑫将填报内容由开始编写完整的车牌检测与识别代码修改为编写完整的车牌检测与识别代码, 等待标注数据集进行重新迁移学习', '99', '2020-05-28 14:22:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('690', '耿禹', '551', '3', '耿禹添加了任务内容为[政府推荐采购创新产品征集表]的工时信息', '99', '2020-05-28 16:52:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('691', '耿禹', '552', '3', '耿禹添加了任务内容为[南京市产业地标重点培育企业目录]的工时信息', '99', '2020-05-28 16:52:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('692', '耿禹', '553', '3', '耿禹添加了任务内容为[征集2019年度十大创新产品通知]的工时信息', '99', '2020-05-28 16:52:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('693', '耿禹', '554', '3', '耿禹添加了任务内容为[“四新”应用场景和新技术新产品新业态发布征集通知]的工时信息', '99', '2020-05-28 16:55:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('694', '耿禹', '555', '3', '耿禹添加了任务内容为[中移5G自动驾驶联盟成员申请表]的工时信息', '99', '2020-05-28 17:00:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('695', '耿禹', '556', '3', '耿禹添加了任务内容为[中国智能交通协会成员申请表]的工时信息', '99', '2020-05-28 17:00:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('696', '耿禹', '557', '3', '耿禹添加了任务内容为[江苏省智能网联汽车产业创新联盟成员申请表]的工时信息', '99', '2020-05-28 17:00:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('697', '耿禹', '558', '3', '耿禹添加了任务内容为[2020年新产业重点项目调研表-项目更新]的工时信息', '99', '2020-05-28 17:04:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('698', '耿禹', '559', '3', '耿禹添加了任务内容为[自研项目完成情况跟进表]的工时信息', '99', '2020-05-28 17:08:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('699', '耿禹', '560', '3', '耿禹添加了任务内容为[多目标跟踪算法FairMot复现]的工时信息', '99', '2020-05-28 17:10:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('700', '耿禹', '561', '3', '耿禹添加了任务内容为[多目标跟踪算法FairMot复现]的工时信息', '99', '2020-05-28 17:11:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('701', '耿禹', '562', '3', '耿禹添加了任务内容为[多目标跟踪算法FairMot复现]的工时信息', '99', '2020-05-28 17:11:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('702', '耿禹', '562', '5', '耿禹删除了任务内容为[多目标跟踪算法FairMot复现]的工时', '99', '2020-05-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('703', '耿禹', '563', '3', '耿禹添加了任务内容为[多目标跟踪算法FairMot复现]的工时信息', '99', '2020-05-28 17:15:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('704', '耿禹', '564', '3', '耿禹添加了任务内容为[车联网PPT编写]的工时信息', '99', '2020-05-28 17:15:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('705', '耿禹', '565', '3', '耿禹添加了任务内容为[南京交院测试场]的工时信息', '99', '2020-05-28 17:17:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('706', '耿禹', '566', '3', '耿禹添加了任务内容为[南京交院项目项目规划]的工时信息', '99', '2020-05-28 17:24:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('707', '耿禹', '567', '3', '耿禹添加了任务内容为[南京交院项目项目规划]的工时信息', '99', '2020-05-28 17:24:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('708', '耿禹', '568', '3', '耿禹添加了任务内容为[南京交院项目项目规划]的工时信息', '99', '2020-05-28 17:24:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('709', '耿禹', '569', '3', '耿禹添加了任务内容为[硬件采购计划表编写]的工时信息', '99', '2020-05-28 17:24:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('710', '耿禹', '570', '3', '耿禹添加了任务内容为[硬件采购计划表编写]的工时信息', '99', '2020-05-28 17:24:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('711', '耿禹', '571', '3', '耿禹添加了任务内容为[单目相机深度估计算法monodepth2复现]的工时信息', '99', '2020-05-28 17:26:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('712', '耿禹', '572', '3', '耿禹添加了任务内容为[单目相机深度估计算法monodepth2复现]的工时信息', '99', '2020-05-28 17:26:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('713', '耿禹', '573', '3', '耿禹添加了任务内容为[单目相机深度估计算法monodepth2复现]的工时信息', '99', '2020-05-28 17:26:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('714', '耿禹', '574', '3', '耿禹添加了任务内容为[单目相机深度估计算法monodepth2复现]的工时信息', '99', '2020-05-28 17:26:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('715', '耿禹', '567', '4', '耿禹将填报内容由南京交院项目项目规划修改为车联相关政策法规资料阅读', '99', '2020-05-28 17:28:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('716', '耿禹', '568', '4', '耿禹将填报内容由南京交院项目项目规划修改为车联相关政策法规资料阅读', '99', '2020-05-28 17:28:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('717', '耿禹', '575', '3', '耿禹添加了任务内容为[宿迁高速公路单目测距技术可行性分析]的工时信息', '99', '2020-05-28 17:29:12');
INSERT INTO `dt_project_workinghour_log` VALUES ('718', '耿禹', '576', '3', '耿禹添加了任务内容为[宿迁高速公路单目测距技术测试]的工时信息', '99', '2020-05-28 17:29:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('719', '耿禹', '577', '3', '耿禹添加了任务内容为[研发项目立项报告编写]的工时信息', '99', '2020-05-28 17:31:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('720', '耿禹', '578', '3', '耿禹添加了任务内容为[惯导测试]的工时信息', '99', '2020-05-28 17:31:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('721', '耿禹', '578', '4', '耿禹将填报时间由1修改为4', '99', '2020-05-28 17:32:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('722', '耿禹', '579', '3', '耿禹添加了任务内容为[研发项目立项PPT编写]的工时信息', '99', '2020-05-28 17:34:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('723', '宁南鑫', '580', '3', '宁南鑫添加了任务内容为[研读monodepth2源码,测试发现场景不拟合]的工时信息', '99', '2020-05-29 15:21:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('724', '陈淑琳', '581', '3', '陈淑琳添加了任务内容为[华为、测绘及武汉大学协议的打印与用印。配合总部进行文化活动]的工时信息', '99', '2020-05-29 16:47:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('725', '陈淑琳', '582', '3', '陈淑琳添加了任务内容为[孙茂荣、刘锦武及万子禹转正评审会的开展；绩效分数的统计；招聘]的工时信息', '99', '2020-05-29 16:47:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('726', '高恒娟', '583', '3', '高恒娟添加了任务内容为[停车通版智慧:功能完善，同事沟通讨论，事业部部门例会1h]的工时信息', '99', '2020-05-29 16:48:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('727', '陈淑琳', '582', '4', '陈淑琳将填报内容由孙茂荣、刘锦武及万子禹转正评审会的开展；绩效分数的统计；招聘修改为孙茂荣、刘锦武及万子禹转正评审会的开展；绩效分数的统计；招聘的开展；总部人事会议的参与', '99', '2020-05-29 16:48:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('728', '陈淑琳', '584', '3', '陈淑琳添加了任务内容为[花名册、项目管理表、周报、KPI跟进表的制作；相关协议的用印]的工时信息', '99', '2020-05-29 16:48:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('729', '陈淑琳', '585', '3', '陈淑琳添加了任务内容为[李学文面试的安排；与徐总商量相关人事事宜]的工时信息', '99', '2020-05-29 16:48:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('730', '高恒娟', '583', '4', '高恒娟将填报内容由停车通版智慧:功能完善，同事沟通讨论，事业部部门例会1h修改为停车通版智慧:功能完善，同事沟通讨论，事业部部门例会1h，梯控资料收集', '99', '2020-05-29 16:52:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('731', '高恒娟', '586', '3', '高恒娟添加了任务内容为[智慧梯控解决方案：收料收集整理，编制PPT]的工时信息', '99', '2020-05-29 16:52:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('732', '高恒娟', '587', '3', '高恒娟添加了任务内容为[智慧梯控解决方案：PPT编制及完善]的工时信息', '99', '2020-05-29 16:52:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('733', '高恒娟', '588', '3', '高恒娟添加了任务内容为[智慧梯控解决方案：资料收集汇集成word]的工时信息', '99', '2020-05-29 16:52:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('734', '高恒娟', '589', '3', '高恒娟添加了任务内容为[智慧康养解决方案：烽火祥云养老资料学习，前言报告等收集学习]的工时信息', '99', '2020-05-29 16:52:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('735', '高恒娟', '587', '4', '高恒娟将工作时长由7.5修改为8', '99', '2020-05-29 16:52:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('736', '张秀娇', '590', '3', '张秀娇添加了任务内容为[笔记本版本的矢量地图标注环境搭建]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('737', '张秀娇', '591', '3', '张秀娇添加了任务内容为[查找有关矢量地图标注的教学视频]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('738', '张秀娇', '592', '3', '张秀娇添加了任务内容为[学习在线形式Tier.iv的矢量地图标注方法]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('739', '张秀娇', '593', '3', '张秀娇添加了任务内容为[学习离线形式的Unity + MapToolBox的矢量地图标注方法]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('740', '张秀娇', '594', '3', '张秀娇添加了任务内容为[autoware关键模块功能解读]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('741', '张秀娇', '595', '3', '张秀娇添加了任务内容为[tf 坐标转换代码读解]的工时信息', '99', '2020-05-29 16:54:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('742', '林书宇', '596', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:18:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('743', '林书宇', '597', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:18:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('744', '林书宇', '598', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:18:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('745', '林书宇', '599', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:18:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('746', '林书宇', '600', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:18:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('747', '林书宇', '601', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:21:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('748', '林书宇', '602', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:21:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('749', '林书宇', '603', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:22:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('750', '林书宇', '604', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:22:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('751', '林书宇', '605', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:22:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('752', '林书宇', '606', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:22:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('753', '林书宇', '606', '4', '林书宇将工作时长由7.5修改为4', '99', '2020-05-29 17:24:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('754', '林书宇', '607', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('755', '林书宇', '608', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('756', '林书宇', '609', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('757', '林书宇', '610', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('758', '林书宇', '611', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('759', '林书宇', '612', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:27:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('760', '林书宇', '613', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:29:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('761', '林书宇', '614', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:29:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('762', '林书宇', '615', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:29:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('763', '林书宇', '616', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:29:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('764', '林书宇', '617', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:29:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('765', '林书宇', '613', '5', '林书宇删除了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时', '99', '2020-05-29 17:29:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('766', '林书宇', '614', '5', '林书宇删除了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时', '99', '2020-05-29 17:29:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('767', '林书宇', '618', '3', '林书宇添加了任务内容为[基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。 基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。 学习使用SpeedHDMap全景查看等功能。]的工时信息', '99', '2020-05-29 17:30:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('768', '万子禹', '619', '3', '万子禹添加了任务内容为[数字城市资料整理]的工时信息', '99', '2020-05-29 17:40:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('769', '万子禹', '620', '3', '万子禹添加了任务内容为[智慧停车资料整理]的工时信息', '99', '2020-05-29 17:40:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('770', '万子禹', '621', '3', '万子禹添加了任务内容为[智慧城市PPT编写]的工时信息', '99', '2020-05-29 17:40:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('771', '万子禹', '622', '3', '万子禹添加了任务内容为[智慧城市PPT编写]的工时信息', '99', '2020-05-29 17:40:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('772', '万子禹', '623', '3', '万子禹添加了任务内容为[智慧停车通版PPT编写第一版]的工时信息', '99', '2020-05-29 17:42:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('773', '万子禹', '624', '3', '万子禹添加了任务内容为[智慧停车通版PPT编写第一版]的工时信息', '99', '2020-05-29 17:42:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('774', '万子禹', '625', '3', '万子禹添加了任务内容为[智慧停车通版PPT编写第一版]的工时信息', '99', '2020-05-29 17:42:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('775', '万子禹', '626', '3', '万子禹添加了任务内容为[智慧停车通版PPT编写第二版]的工时信息', '99', '2020-05-29 17:42:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('776', '万子禹', '627', '3', '万子禹添加了任务内容为[智慧停车通版PPT编写第二版]的工时信息', '99', '2020-05-29 17:42:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('777', '何海', '628', '3', '何海添加了任务内容为[speedHDmap软件功能测试，高精地图拓扑数据构建]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('778', '何海', '629', '3', '何海添加了任务内容为[配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('779', '何海', '630', '3', '何海添加了任务内容为[配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('780', '何海', '631', '3', '何海添加了任务内容为[研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('781', '何海', '632', '3', '何海添加了任务内容为[speedHDmap软件功能测试，高精地图拓扑数据构建]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('782', '何海', '633', '3', '何海添加了任务内容为[配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('783', '何海', '634', '3', '何海添加了任务内容为[研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('784', '何海', '635', '3', '何海添加了任务内容为[配合开发人员针对DXF格式的数据进行采集，采集符合转换要求的矢量数据。]的工时信息', '99', '2020-05-29 17:43:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('785', '万子禹', '636', '3', '万子禹添加了任务内容为[智慧楼宇资料整理]的工时信息', '99', '2020-05-29 17:43:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('786', '万子禹', '637', '3', '万子禹添加了任务内容为[智慧楼宇资料整理]的工时信息', '99', '2020-05-29 17:43:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('787', '万子禹', '638', '3', '万子禹添加了任务内容为[智慧楼宇PPT第二版编写]的工时信息', '99', '2020-05-29 17:43:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('788', '万子禹', '639', '3', '万子禹添加了任务内容为[智慧楼宇PPT第二版编写]的工时信息', '99', '2020-05-29 17:43:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('789', '万子禹', '640', '3', '万子禹添加了任务内容为[智慧楼宇PPT第二版编写]的工时信息', '99', '2020-05-29 17:43:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('790', '万子禹', '641', '3', '万子禹添加了任务内容为[智慧停车客户端流程逻辑设计]的工时信息', '99', '2020-05-29 17:44:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('791', '万子禹', '642', '3', '万子禹添加了任务内容为[智慧停车客户端信息架构设计]的工时信息', '99', '2020-05-29 17:44:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('792', '万子禹', '643', '3', '万子禹添加了任务内容为[智慧停车客户端页面原型设计]的工时信息', '99', '2020-05-29 17:44:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('793', '万子禹', '644', '3', '万子禹添加了任务内容为[智慧停车客户端页面原型设计]的工时信息', '99', '2020-05-29 17:44:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('794', '万子禹', '645', '3', '万子禹添加了任务内容为[智慧停车客户端页面原型设计]的工时信息', '99', '2020-05-29 17:44:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('795', '何海', '646', '3', '何海添加了任务内容为[学习使用autoware maptools 采集高精度地图数据]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('796', '何海', '647', '3', '何海添加了任务内容为[	 学习使用autoware maptools 采集高精度地图数据]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('797', '何海', '648', '3', '何海添加了任务内容为[学习autoware相关数据采集软件]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('798', '何海', '649', '3', '何海添加了任务内容为[测试speedHDmap导入dxf数据后的相关功能，录入拓扑信息]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('799', '何海', '650', '3', '何海添加了任务内容为[测试speedHDmap导入dxf数据后的相关功能，录入拓扑信息]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('800', '何海', '651', '3', '何海添加了任务内容为[测试speedHDmap导入dxf数据后的相关功能，配合开发人员完善DXF数据]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('801', '何海', '652', '3', '何海添加了任务内容为[研究《道路高精度导航电子地图生产规范》，标记出与现有数据中存在差异的要点以及规范中存在的问题，方便后期制作地方标准。]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('802', '何海', '653', '3', '何海添加了任务内容为[测试speedHDmap导入dxf数据后的相关功能，配合开发人员完善DXF数据]的工时信息', '99', '2020-05-29 18:15:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('803', '伍军豪', '654', '3', '伍军豪添加了任务内容为[绘制停车场的围墙，大门]的工时信息', '99', '2020-05-29 18:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('804', '伍军豪', '655', '3', '伍军豪添加了任务内容为[绘制停车场的电子牌，起落杆]的工时信息', '99', '2020-05-29 18:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('805', '伍军豪', '656', '3', '伍军豪添加了任务内容为[绘制停车位标号，解决文字加载卡慢的问题]的工时信息', '99', '2020-05-29 18:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('806', '伍军豪', '657', '3', '伍军豪添加了任务内容为[完成停车场的绘制，规划学校的绘制]的工时信息', '99', '2020-05-29 18:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('807', '伍军豪', '658', '3', '伍军豪添加了任务内容为[完成部分教学楼和地皮的绘制]的工时信息', '99', '2020-05-29 18:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('808', '戚国华', '659', '3', '戚国华添加了任务内容为[1.精修制作PPT（至60页）；2.输出思维导图1份（高精地图制图规范-高速路部分）]的工时信息', '99', '2020-05-29 18:23:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('809', '戚国华', '660', '3', '戚国华添加了任务内容为[1.精修制作PPT （至77页）；2. 补充个人词典（全息投影、虚拟现实、视觉深度）]的工时信息', '99', '2020-05-29 18:23:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('810', '戚国华', '661', '3', '戚国华添加了任务内容为[精修完成 第一版PPT -初始版 （共93页）]的工时信息', '99', '2020-05-29 18:23:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('811', '戚国华', '662', '3', '戚国华添加了任务内容为[完成智慧景区PPT-精简版 62页 （之前的初始版，内容太混乱），但是还是恨不完善，下一步需要把业务逻辑可视化，丰富或精简功能。]的工时信息', '99', '2020-05-29 18:23:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('812', '戚国华', '659', '4', '戚国华将工作时长由7.5修改为8', '99', '2020-05-29 18:24:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('813', '戚国华', '659', '4', '戚国华将工作时长由8修改为7.5', '99', '2020-05-29 18:24:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('814', '伍军豪', '663', '3', '伍军豪添加了任务内容为[请假]的工时信息', '99', '2020-05-29 18:26:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('815', '伍军豪', '664', '3', '伍军豪添加了任务内容为[封装了城市场景的道路线代码]的工时信息', '99', '2020-05-29 18:26:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('816', '伍军豪', '665', '3', '伍军豪添加了任务内容为[对城市道路线进行铺设]的工时信息', '99', '2020-05-29 18:26:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('817', '伍军豪', '666', '3', '伍军豪添加了任务内容为[完善道路线条细节，绘制道路护栏和红绿灯模型]的工时信息', '99', '2020-05-29 18:26:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('818', '伍军豪', '667', '3', '伍军豪添加了任务内容为[完成停车场地皮]的工时信息', '99', '2020-05-29 18:26:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('819', '伍军豪', '668', '3', '伍军豪添加了任务内容为[ 编写并且封装了建筑的函数，在模型上添加了建筑。]的工时信息', '99', '2020-05-29 18:27:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('820', '伍军豪', '669', '3', '伍军豪添加了任务内容为[编写对厂区的一些建筑，纹理。添加小车模型]的工时信息', '99', '2020-05-29 18:27:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('821', '伍军豪', '670', '3', '伍军豪添加了任务内容为[查渲染卡顿的问题，发现卡顿处在于加载物体过多，解决js异步函数的取值问题]的工时信息', '99', '2020-05-29 18:27:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('822', '伍军豪', '671', '3', '伍军豪添加了任务内容为[了解弯道模型，不规则模型的创建和贴图，贴图功能未解决]的工时信息', '99', '2020-05-29 18:27:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('823', '伍军豪', '672', '3', '伍军豪添加了任务内容为[对模拟区域大致结构进行构建，创建道路和道路转接。]的工时信息', '99', '2020-05-29 18:27:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('824', '伍军豪', '673', '3', '伍军豪添加了任务内容为[ 分析了threejs搭建智慧园区所需要的技术，查找教程，观看，并且创建了简单的建筑。    ]的工时信息', '99', '2020-05-29 18:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('825', '伍军豪', '674', '3', '伍军豪添加了任务内容为[发现建筑加载卡慢的问题，与耿院长沟通并且找出bug,在地图加载了道路，模拟车辆沿轨道运行。]的工时信息', '99', '2020-05-29 18:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('826', '伍军豪', '675', '3', '伍军豪添加了任务内容为[解决了镜头视角变换的问题，添加镜头移动的功能，但是交互操作遇到问题]的工时信息', '99', '2020-05-29 18:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('827', '伍军豪', '676', '3', '伍军豪添加了任务内容为[把场景细节修改完善]的工时信息', '99', '2020-05-29 18:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('828', '孙茂荣', '677', '3', '孙茂荣添加了任务内容为[中山翠亨智慧交通岛设计方案：增加原方案的内容，包括效益提升、商业模式等]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('829', '孙茂荣', '678', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('830', '孙茂荣', '679', '3', '孙茂荣添加了任务内容为[培训材料：收集培训材料的相关资料]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('831', '孙茂荣', '680', '3', '孙茂荣添加了任务内容为[培训材料：按照高精地图是什么，怎么做、做成什么样，编制培训材料]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('832', '孙茂荣', '681', '3', '孙茂荣添加了任务内容为[培训材料：对培训材料的内容的内容进行核对以及优化]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('833', '孙茂荣', '682', '3', '孙茂荣添加了任务内容为[配合添加江苏恒润信息化管理平台系统分项报价表]的工时信息', '99', '2020-05-30 15:58:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('834', '孙茂荣', '683', '3', '孙茂荣添加了任务内容为[中山翠亨智慧交通岛设计方案：增加原方案的内容，包括效益提升、商业模式等]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('835', '孙茂荣', '684', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('836', '孙茂荣', '685', '3', '孙茂荣添加了任务内容为[培训材料：收集培训材料相关资料]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('837', '孙茂荣', '686', '3', '孙茂荣添加了任务内容为[培训材料：整理培训材料的框架，对培训材料的内容进行核对以及优化]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('838', '孙茂荣', '687', '3', '孙茂荣添加了任务内容为[调度]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('839', '孙茂荣', '688', '3', '孙茂荣添加了任务内容为[配合添加江苏恒润信息化管理平台系统分项报价表]的工时信息', '99', '2020-05-30 16:04:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('840', '孙茂荣', '687', '5', '孙茂荣删除了任务内容为[调度]的工时', '99', '2020-05-30 16:04:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('841', '孙茂荣', '689', '3', '孙茂荣添加了任务内容为[自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('842', '孙茂荣', '690', '3', '孙茂荣添加了任务内容为[南京交院智慧交通规划设计方案：收集相关标准，以及国内外的现状]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('843', '孙茂荣', '691', '3', '孙茂荣添加了任务内容为[南京交院智慧交通规划设计方案：对收集的材料进行理解]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('844', '孙茂荣', '692', '3', '孙茂荣添加了任务内容为[南京交院智慧交通规划设计方案：现场调研，根据实际情况，规划测试场景]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('845', '孙茂荣', '693', '3', '孙茂荣添加了任务内容为[编写高精地图服务平台介绍材料，为让券商理解产品，]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('846', '孙茂荣', '694', '3', '孙茂荣添加了任务内容为[收集智慧高速的相关政策以及解决方案]的工时信息', '99', '2020-05-30 16:08:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('847', '孙茂荣', '695', '3', '孙茂荣添加了任务内容为[跟进南京交院测试场，催促甲方签署战略合作协议]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('848', '孙茂荣', '696', '3', '孙茂荣添加了任务内容为[智慧高速解决方案：政策理解]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('849', '孙茂荣', '697', '3', '孙茂荣添加了任务内容为[智慧高速解决方案：分析痛点，进行归纳]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('850', '孙茂荣', '698', '3', '孙茂荣添加了任务内容为[智慧高速解决方案：根据第一代控制网的六个发展方向进行功能分解]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('851', '孙茂荣', '699', '3', '孙茂荣添加了任务内容为[交通智慧岛解决方案完善方案内容]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('852', '孙茂荣', '700', '3', '孙茂荣添加了任务内容为[智慧高速解决方案：针对宿迁智慧高速，优化智慧高速公路方案]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('853', '孙茂荣', '701', '3', '孙茂荣添加了任务内容为[交通智慧岛解决方案完善方案内容]的工时信息', '99', '2020-05-30 16:14:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('854', '孙茂荣', '677', '4', '孙茂荣将填报内容由中山翠亨智慧交通岛设计方案：增加原方案的内容，包括效益提升、商业模式等修改为转正汇报材料：编制转正报告并进行优化', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('855', '孙茂荣', '678', '4', '孙茂荣将填报内容由自动驾驶行业研究报告：收集材料（车联网、自动驾驶），修改框架，整理材料，编写文案修改为优化中山翠亨新区智慧交通岛设计方案', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('856', '孙茂荣', '679', '4', '孙茂荣将填报内容由培训材料：收集培训材料的相关资料修改为收集无锡车联网调研的材料，联系以往的同事，了解相关信息', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('857', '孙茂荣', '680', '4', '孙茂荣将填报内容由培训材料：按照高精地图是什么，怎么做、做成什么样，编制培训材料修改为智慧交通岛规划文档：收集各地方的相关管理办法', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('858', '孙茂荣', '681', '4', '孙茂荣将填报内容由培训材料：对培训材料的内容的内容进行核对以及优化修改为无锡车路网调研，赶往示范区，了解设施设备，拍摄照片', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('859', '孙茂荣', '682', '4', '孙茂荣将填报内容由配合添加江苏恒润信息化管理平台系统分项报价表修改为编写针对翠亨新区编写翠亨新区智慧交通管理办法', '99', '2020-05-30 16:19:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('860', '白慧鹏', '702', '3', '白慧鹏添加了任务内容为[车道组关系构建功能开发]的工时信息', '99', '2020-05-30 18:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('861', '白慧鹏', '703', '3', '白慧鹏添加了任务内容为[车道组关系构建功能开发]的工时信息', '99', '2020-05-30 18:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('862', '白慧鹏', '704', '3', '白慧鹏添加了任务内容为[车道组关系构建功能开发，及一些bug调试修复]的工时信息', '99', '2020-05-30 18:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('863', '白慧鹏', '705', '3', '白慧鹏添加了任务内容为[车道组关系构建功能开发]的工时信息', '99', '2020-05-30 18:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('864', '白慧鹏', '706', '3', '白慧鹏添加了任务内容为[休息]的工时信息', '99', '2020-05-30 18:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('865', '白慧鹏', '706', '5', '白慧鹏删除了任务内容为[休息]的工时', '99', '2020-05-30 18:54:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('866', '白慧鹏', '707', '3', '白慧鹏添加了任务内容为[研究opendriver格式与本地数据对应关系，修改车道线拓扑功能bug]的工时信息', '99', '2020-05-30 18:55:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('867', '白慧鹏', '708', '3', '白慧鹏添加了任务内容为[研究opendriver格式与本地数据对应关系]的工时信息', '99', '2020-05-30 18:55:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('868', '白慧鹏', '709', '3', '白慧鹏添加了任务内容为[研究opendriver格式与本地数据对应关系 ]的工时信息', '99', '2020-05-30 18:55:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('869', '白慧鹏', '710', '3', '白慧鹏添加了任务内容为[研究opendriver格式与本地数据对应关系，修改车道线拓扑功能bug]的工时信息', '99', '2020-05-30 18:55:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('870', '白慧鹏', '711', '3', '白慧鹏添加了任务内容为[修改车道线拓扑功能bug，及车道组关系构建]的工时信息', '99', '2020-05-30 18:55:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('871', '林书宇', '712', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，生产三维模型，对模型进行材质处理，添加纹理，贴图。制作流程已经掌握90%，但待处理数据量过大，目前完成总工作量的40%。 完成基于常州道路数据的UE蓝图场景制作，导入三维模型，渲染模型，搭建真实场景，调整光照，天气，大雾环境。制作流程已经掌握40%，为进一步提高产品质量，需要学习的内容较多。目前完成总工作量的40% 学习使用SpeedHDMap全景查看等功能。已经掌握基本功能，配合其他软件的生产。]的工时信息', '99', '2020-05-30 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('872', '白慧鹏', '713', '3', '白慧鹏添加了任务内容为[opendiver格式整体框架搭建]的工时信息', '99', '2020-05-30 18:57:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('873', '白慧鹏', '714', '3', '白慧鹏添加了任务内容为[opendiver格式整体框架搭建]的工时信息', '99', '2020-05-30 18:57:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('874', '白慧鹏', '715', '3', '白慧鹏添加了任务内容为[opendiver格式整体框架搭建]的工时信息', '99', '2020-05-30 18:57:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('875', '白慧鹏', '716', '3', '白慧鹏添加了任务内容为[opendiver格式整体框架搭建]的工时信息', '99', '2020-05-30 18:57:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('876', '白慧鹏', '717', '3', '白慧鹏添加了任务内容为[opendiver格式整体框架搭建]的工时信息', '99', '2020-05-30 18:57:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('877', '白慧鹏', '718', '3', '白慧鹏添加了任务内容为[opendrive格式数据与本地数据的解析及录入]的工时信息', '99', '2020-05-30 18:59:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('878', '白慧鹏', '719', '3', '白慧鹏添加了任务内容为[opendrive格式数据与本地数据的解析及录入]的工时信息', '99', '2020-05-30 18:59:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('879', '白慧鹏', '720', '3', '白慧鹏添加了任务内容为[opendrive格式数据与本地数据的解析及录入]的工时信息', '99', '2020-05-30 18:59:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('880', '白慧鹏', '721', '3', '白慧鹏添加了任务内容为[opendrive格式数据与本地数据的解析及录入]的工时信息', '99', '2020-05-30 18:59:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('881', '白慧鹏', '722', '3', '白慧鹏添加了任务内容为[opendrive格式数据与本地数据的解析及录入]的工时信息', '99', '2020-05-30 18:59:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('882', '耿禹', '723', '3', '耿禹添加了任务内容为[无锡常州车联网先导区查看]的工时信息', '99', '2020-06-01 08:28:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('883', '周艳', '724', '3', '周艳添加了任务内容为[单目的三维目标检测和深度估计调研]的工时信息', '99', '2020-06-01 08:48:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('884', '周艳', '725', '3', '周艳添加了任务内容为[制作展示视频；调研学习深度计算struct2depth]的工时信息', '99', '2020-06-01 08:48:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('885', '周艳', '726', '3', '周艳添加了任务内容为[在pytorch0.4.0环境训练变化检测模型；学习P3P位姿确定]的工时信息', '99', '2020-06-01 08:48:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('886', '周艳', '727', '3', '周艳添加了任务内容为[编译python 版P3P求解位姿，得出未知点世界坐标]的工时信息', '99', '2020-06-01 08:48:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('887', '温四林', '728', '3', '温四林添加了任务内容为[完成地图编译中图层属性录入代码的bug]的工时信息', '99', '2020-06-01 08:48:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('888', '温四林', '729', '3', '温四林添加了任务内容为[完成地图编译中图层属性录入代码的bug]的工时信息', '99', '2020-06-01 08:48:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('889', '温四林', '730', '3', '温四林添加了任务内容为[完成地图编译中拓扑核查功能]的工时信息', '99', '2020-06-01 08:48:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('890', '温四林', '731', '3', '温四林添加了任务内容为[完成地图编译中拓扑核查功能]的工时信息', '99', '2020-06-01 08:48:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('891', '温四林', '732', '3', '温四林添加了任务内容为[完成地图编译中拓扑核查功能及bug修复，移交数据生产人员测试]的工时信息', '99', '2020-06-01 08:48:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('892', '温四林', '733', '3', '温四林添加了任务内容为[完成其他bug修复]的工时信息', '99', '2020-06-01 08:49:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('893', '温四林', '734', '3', '温四林添加了任务内容为[完成dxf中数据导入功能，点要素的导入]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('894', '温四林', '735', '3', '温四林添加了任务内容为[完成dxf中数据导入功能，线要素的导入]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('895', '温四林', '736', '3', '温四林添加了任务内容为[完成dxf中数据导入功能，面要素的导入]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('896', '温四林', '737', '3', '温四林添加了任务内容为[完成dxf中数据导入功能，移交测试]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('897', '温四林', '738', '3', '温四林添加了任务内容为[修改dxf中数据导入功能bug，重构代码]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('898', '温四林', '739', '3', '温四林添加了任务内容为[专利反馈修改]的工时信息', '99', '2020-06-01 08:51:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('899', '温四林', '739', '4', '温四林将工作时长由7.5修改为5', '99', '2020-06-01 08:51:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('900', '周艳', '740', '3', '周艳添加了任务内容为[继续编译P3p求解位姿]的工时信息', '99', '2020-06-01 08:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('901', '周艳', '741', '3', '周艳添加了任务内容为[完成P3P编译；学习SALM基础，和光束法平差方法]的工时信息', '99', '2020-06-01 08:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('902', '周艳', '742', '3', '周艳添加了任务内容为[结合软件研发的研发立项申请书；继续学习光束法平差方法]的工时信息', '99', '2020-06-01 08:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('903', '周艳', '743', '3', '周艳添加了任务内容为[立项申请书拟写框架；继续调研学习单目的深度计算]的工时信息', '99', '2020-06-01 08:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('904', '周艳', '744', '3', '周艳添加了任务内容为[完成立项申请书撰写；测试固定大小物体单目测距的算法效果，使用范围较小]的工时信息', '99', '2020-06-01 08:54:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('905', '温四林', '745', '3', '温四林添加了任务内容为[学习UE4蓝图功能]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('906', '温四林', '746', '3', '温四林添加了任务内容为[学习UE4蓝图功能]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('907', '温四林', '747', '3', '温四林添加了任务内容为[制作基于常州真实场景搭建模型的技术路线]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('908', '温四林', '748', '3', '温四林添加了任务内容为[开展OpenDriver格式转换规范研究]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('909', '温四林', '749', '3', '温四林添加了任务内容为[修复路口节点绑定的bug，开展要素节点方向反转的工具研发]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('910', '温四林', '750', '3', '温四林添加了任务内容为[修复软件中比例尺和测量工具的bug]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('911', '温四林', '751', '3', '温四林添加了任务内容为[完成代码移交供测试人员测试]的工时信息', '99', '2020-06-01 08:55:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('912', '周艳', '752', '3', '周艳添加了任务内容为[变化检测模型不收敛；Struct2depth内存依然不够用；使用Matlab完成手机摄像头的标定]的工时信息', '99', '2020-06-01 08:58:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('913', '周艳', '753', '3', '周艳添加了任务内容为[编译固定摄像头参考相机高度估算距离的算法]的工时信息', '99', '2020-06-01 08:58:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('914', '周艳', '754', '3', '周艳添加了任务内容为[完成编译固定摄像头测距；调研学习监控摄像头的定位论文和发明]的工时信息', '99', '2020-06-01 08:58:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('915', '周艳', '755', '3', '周艳添加了任务内容为[完成固定高度摄像头测距的测试，精度达到0.3%左右；修改专利]的工时信息', '99', '2020-06-01 08:58:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('916', '周艳', '756', '3', '周艳添加了任务内容为[重新使用激光测距仪在较远的场景下测试测距算法，误差在1%左右。]的工时信息', '99', '2020-06-01 08:58:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('917', '周艳', '754', '4', '周艳将填报内容由完成编译固定摄像头测距；调研学习监控摄像头的定位论文和发明修改为完成编译固定摄像头测距；调研学习监控摄像头的定位的论文和发明', '99', '2020-06-01 08:59:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('918', '温四林', '757', '3', '温四林添加了任务内容为[完成openDriver格式规范的研究]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('919', '温四林', '758', '3', '温四林添加了任务内容为[完成road节点下link、type和speed节点的解析]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('920', '温四林', '759', '3', '温四林添加了任务内容为[修复生产人员遇到的bug]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('921', '温四林', '760', '3', '温四林添加了任务内容为[修复生产人员遇到的bug]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('922', '温四林', '761', '3', '温四林添加了任务内容为[完成road节点下planview节点的多类型要素的几何形状的拟合技术路线确定]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('923', '温四林', '762', '3', '温四林添加了任务内容为[完成road节点lane节点下要素的拟合]的工时信息', '99', '2020-06-01 09:03:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('924', '周艳', '763', '3', '周艳添加了任务内容为[制作大讲堂（浅谈深度学习和行业应用）ppt]的工时信息', '99', '2020-06-01 09:06:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('925', '周艳', '764', '3', '周艳添加了任务内容为[完成大讲堂（浅谈深度学习和行业应用）ppt准备和完善]的工时信息', '99', '2020-06-01 09:06:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('926', '周艳', '765', '3', '周艳添加了任务内容为[开展单目三维检测的方法整理和研发]的工时信息', '99', '2020-06-01 09:06:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('927', '周艳', '766', '3', '周艳添加了任务内容为[确定深度图转换伪点云再进行三维检测的方案，学习原理]的工时信息', '99', '2020-06-01 09:06:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('928', '周艳', '767', '3', '周艳添加了任务内容为[学习KITTI数据集内容和结构；学习和编译伪点云方案]的工时信息', '99', '2020-06-01 09:06:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('929', '解顶林', '768', '3', '解顶林添加了任务内容为[克拉玛依路内停车标书制作]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('930', '解顶林', '769', '3', '解顶林添加了任务内容为[克拉玛依路内停车标书制作]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('931', '解顶林', '770', '3', '解顶林添加了任务内容为[智慧景区项目总体架构图规划]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('932', '解顶林', '771', '3', '解顶林添加了任务内容为[恒润项目标书方案制作协调]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('933', '解顶林', '772', '3', '解顶林添加了任务内容为[恒润项目标书方案制作协调]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('934', '解顶林', '773', '3', '解顶林添加了任务内容为[恒润项目标书方案制作协调]的工时信息', '99', '2020-06-01 10:26:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('935', '解顶林', '774', '3', '解顶林添加了任务内容为[拜访江宁国旅集团徐总就矿坑公园智慧停车项目交流]的工时信息', '99', '2020-06-01 10:35:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('936', '解顶林', '775', '3', '解顶林添加了任务内容为[参与老山景区项目研讨会]的工时信息', '99', '2020-06-01 10:35:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('937', '解顶林', '776', '3', '解顶林添加了任务内容为[与商务合并恒润标书并封装]的工时信息', '99', '2020-06-01 10:36:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('938', '解顶林', '777', '3', '解顶林添加了任务内容为[去泰兴恒润投标]的工时信息', '99', '2020-06-01 10:36:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('939', '解顶林', '778', '3', '解顶林添加了任务内容为[编辑PPT通用模板]的工时信息', '99', '2020-06-01 10:37:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('940', '解顶林', '779', '3', '解顶林添加了任务内容为[编辑PPT通用模板]的工时信息', '99', '2020-06-01 10:37:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('941', '解顶林', '780', '3', '解顶林添加了任务内容为[审核部门内部提交的方案资料]的工时信息', '99', '2020-06-01 10:39:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('942', '解顶林', '781', '3', '解顶林添加了任务内容为[和商务一起就智慧公安项目拜访溧水公安局长]的工时信息', '99', '2020-06-01 10:39:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('943', '解顶林', '782', '3', '解顶林添加了任务内容为[宿迁智慧高速项目沟通]的工时信息', '99', '2020-06-01 10:39:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('944', '解顶林', '783', '3', '解顶林添加了任务内容为[拜访江北新区沿江街道主任商谈智慧城市项目]的工时信息', '99', '2020-06-01 10:39:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('945', '解顶林', '784', '3', '解顶林添加了任务内容为[指导部门员工对智慧景区项目编写]的工时信息', '99', '2020-06-01 10:40:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('946', '解顶林', '785', '3', '解顶林添加了任务内容为[拜访江宁谷里街道主任和国旅徐总沟通智慧停车项目]的工时信息', '99', '2020-06-01 10:41:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('947', '解顶林', '786', '3', '解顶林添加了任务内容为[指导智慧停车整体方案编辑]的工时信息', '99', '2020-06-01 10:41:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('948', '解顶林', '787', '3', '解顶林添加了任务内容为[指导部署智慧康养方案书编辑]的工时信息', '99', '2020-06-01 10:42:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('949', '解顶林', '788', '3', '解顶林添加了任务内容为[拜访珍珠泉管委会主任，就景区项目进行沟通]的工时信息', '99', '2020-06-01 10:43:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('950', '解顶林', '789', '3', '解顶林添加了任务内容为[智慧康养方案审核，讨论，参与修改]的工时信息', '99', '2020-06-01 10:45:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('951', '解顶林', '790', '3', '解顶林添加了任务内容为[指导智能梯控项目方案书编写]的工时信息', '99', '2020-06-01 10:45:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('952', '解顶林', '791', '3', '解顶林添加了任务内容为[出差滨海就具体康养项目调研]的工时信息', '99', '2020-06-01 10:45:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('953', '解顶林', '792', '3', '解顶林添加了任务内容为[对智慧城管项目收到的资料进行选择性筛选]的工时信息', '99', '2020-06-01 10:48:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('954', '解顶林', '793', '3', '解顶林添加了任务内容为[沟通事业部内部宣传折页]的工时信息', '99', '2020-06-01 10:48:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('955', '解顶林', '794', '3', '解顶林添加了任务内容为[与滨海江总沟通图纸事宜，与宿迁告诉刘总沟通安防项目]的工时信息', '99', '2020-06-01 10:48:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('956', '宁南鑫', '795', '3', '宁南鑫添加了任务内容为[阅读monodepth源码,准备训练数据集]的工时信息', '99', '2020-06-02 15:24:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('957', '宁南鑫', '796', '3', '宁南鑫添加了任务内容为[开始调试代码,进行monodepth2的训练]的工时信息', '99', '2020-06-02 15:24:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('958', '宁南鑫', '797', '3', '宁南鑫添加了任务内容为[训练完monodepth2,完成测试工作,效果较差]的工时信息', '99', '2020-06-04 08:39:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('959', '宁南鑫', '798', '3', '宁南鑫添加了任务内容为[继续研究一些深度估计的模型,寻找可迁移方法]的工时信息', '99', '2020-06-04 08:39:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('960', '张秀娇', '799', '3', '张秀娇添加了任务内容为[查找在线标注格式与autoware默认格式的差异]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('961', '张秀娇', '800', '3', '张秀娇添加了任务内容为[查找离线标注格式与autoware默认格式的差异]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('962', '张秀娇', '801', '3', '张秀娇添加了任务内容为[查找离线标注格式与autoware默认格式的差异]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('963', '张秀娇', '802', '3', '张秀娇添加了任务内容为[整理近阶段工作的有关技术文档和操作流程]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('964', '张秀娇', '803', '3', '张秀娇添加了任务内容为[autoware关键模块解读]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('965', '张秀娇', '804', '3', '张秀娇添加了任务内容为[autoware路径规划模块的学习]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('966', '张秀娇', '805', '3', '张秀娇添加了任务内容为[新电脑的linux系统安装和ROS操作系统的安装]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('967', '张秀娇', '806', '3', '张秀娇添加了任务内容为[新电脑的ROS安装]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('968', '张秀娇', '807', '3', '张秀娇添加了任务内容为[新电脑的GPU配置]的工时信息', '99', '2020-06-10 09:05:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('969', '张秀娇', '808', '3', '张秀娇添加了任务内容为[个人电脑的GPU配置及autoware的GPU版本安装]的工时信息', '99', '2020-06-10 09:06:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('970', '张秀娇', '809', '3', '张秀娇添加了任务内容为[个人电脑的autoware的GPU版本配置]的工时信息', '99', '2020-06-10 09:06:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('971', '张秀娇', '810', '3', '张秀娇添加了任务内容为[新电脑的GPU驱动安装（驱动安装后不能显示，系统查找后提示没有安装）]的工时信息', '99', '2020-06-10 09:11:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('972', '张秀娇', '811', '3', '张秀娇添加了任务内容为[新电脑的GPU驱动安装]的工时信息', '99', '2020-06-10 09:11:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('973', '张秀娇', '811', '4', '张秀娇将填报内容由新电脑的GPU驱动安装修改为新电脑的nvidia显卡驱动安装', '99', '2020-06-12 09:09:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('974', '张秀娇', '812', '3', '张秀娇添加了任务内容为[新电脑的nvidia显卡驱动安装]的工时信息', '99', '2020-06-12 09:09:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('975', '张秀娇', '813', '3', '张秀娇添加了任务内容为[LGSVL环境安装]的工时信息', '99', '2020-06-12 09:11:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('976', '张秀娇', '814', '3', '张秀娇添加了任务内容为[LGSVL模拟环境配置]的工时信息', '99', '2020-06-16 16:53:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('977', '张秀娇', '815', '3', '张秀娇添加了任务内容为[LGSVL模拟环境配置]的工时信息', '99', '2020-06-16 16:53:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('978', '宁南鑫', '816', '3', '宁南鑫添加了任务内容为[继续调研深度估计,开始转向测距]的工时信息', '99', '2020-06-17 15:54:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('979', '宁南鑫', '817', '3', '宁南鑫添加了任务内容为[安装环境]的工时信息', '99', '2020-06-17 15:54:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('980', '宁南鑫', '818', '3', '宁南鑫添加了任务内容为[安装环境]的工时信息', '99', '2020-06-17 15:54:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('981', '宁南鑫', '819', '3', '宁南鑫添加了任务内容为[安装环境]的工时信息', '99', '2020-06-17 15:55:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('982', '宁南鑫', '820', '3', '宁南鑫添加了任务内容为[调研yolov5]的工时信息', '99', '2020-06-17 15:56:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('983', '宁南鑫', '821', '3', '宁南鑫添加了任务内容为[着手编写v5检测代码]的工时信息', '99', '2020-06-17 15:56:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('984', '宁南鑫', '822', '3', '宁南鑫添加了任务内容为[整合测距的代码]的工时信息', '99', '2020-06-17 15:56:02');
INSERT INTO `dt_project_workinghour_log` VALUES ('985', '陈淑琳', '823', '3', '陈淑琳添加了任务内容为[姚阳入职手续的办理、相关权限的开通、档案的扫描整理并转总部，招聘工作的跟进，事业部人员结构的填写，转正人员基本信息的修改]的工时信息', '99', '2020-06-19 16:43:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('986', '陈淑琳', '824', '3', '陈淑琳添加了任务内容为[事业部周例会的组织，报销流程的提交，企业邮箱的认证，常州合同的用印及邮寄]的工时信息', '99', '2020-06-19 16:43:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('987', '陈淑琳', '825', '3', '陈淑琳添加了任务内容为[招聘工作的梳理，考勤表签字确认，绩效的汇总，招聘工作：推荐3份简历]的工时信息', '99', '2020-06-19 16:49:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('988', '陈淑琳', '826', '3', '陈淑琳添加了任务内容为[配合总部进行固定资产的管理、烟酒的管理，日常行政事务的对接]的工时信息', '99', '2020-06-19 16:49:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('989', '陈淑琳', '827', '3', '陈淑琳添加了任务内容为[五险一金账单的制作及付款流程的提交，刘信言、王璐的面试安排，招聘平台的数据更新]的工时信息', '99', '2020-06-19 16:49:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('990', '陈淑琳', '828', '3', '陈淑琳添加了任务内容为[耿院长材料的盖章，对接日常行政事务]的工时信息', '99', '2020-06-19 16:49:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('991', '陈淑琳', '829', '3', '陈淑琳添加了任务内容为[曾关键、石晓铭、陈宝剑面试的安排，招聘]的工时信息', '99', '2020-06-19 16:52:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('992', '陈淑琳', '830', '3', '陈淑琳添加了任务内容为[学习新开公司税务报到等事宜，领导发票的整理，对接日常行政事务]的工时信息', '99', '2020-06-19 16:52:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('993', '陈淑琳', '831', '3', '陈淑琳添加了任务内容为[工资表初稿的制作，招聘工作，李帆面试的安排，社保减免费用的统计]的工时信息', '99', '2020-06-19 17:05:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('994', '陈淑琳', '832', '3', '陈淑琳添加了任务内容为[花名册、项目管理、周报、KPI跟进表、会议纪要及事业部快递清单等文档的编制，新开公司公章的对接刻制]的工时信息', '99', '2020-06-19 17:05:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('995', '陈淑琳', '833', '3', '陈淑琳添加了任务内容为[事业部周例会的组织，接待南理工老师]的工时信息', '99', '2020-06-19 17:12:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('996', '陈淑琳', '834', '3', '陈淑琳添加了任务内容为[工资表的制作，考勤数据的汇总，招聘工作]的工时信息', '99', '2020-06-19 17:12:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('997', '陈淑琳', '835', '3', '陈淑琳添加了任务内容为[常州补充协议的用印存档，新开公司公章、营业执照转交总部，修改新开公司的章程、为银行开户做准备]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('998', '陈淑琳', '836', '3', '陈淑琳添加了任务内容为[工资表、成本分摊表定稿，招聘]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('999', '陈淑琳', '837', '3', '陈淑琳添加了任务内容为[姚阳三方协议的签署、反馈事业部实习生招聘情况，招聘工作]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1000', '陈淑琳', '838', '3', '陈淑琳添加了任务内容为[接待华为公司审核人员，公司章程的修改，贴发票，为银行开户上门核实做准备]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1001', '陈淑琳', '839', '3', '陈淑琳添加了任务内容为[前往银行办理开户事宜，提交速度软件股改申请流程]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1002', '陈淑琳', '840', '3', '陈淑琳添加了任务内容为[招聘工作，日常人事工作的对接]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1003', '陈淑琳', '841', '3', '陈淑琳添加了任务内容为[吴洋面试的安排，任虎成录用流程的提交、offer的发放，招聘工作]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1004', '陈淑琳', '842', '3', '陈淑琳添加了任务内容为[花名册、项目管理、快递汇总表、周报、KPI跟进表、会议纪要及重点项目跟进表等表单的制作，固定资产的采购：两台台式机]的工时信息', '99', '2020-06-19 17:21:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1005', '陈淑琳', '843', '3', '陈淑琳添加了任务内容为[陆海芳入职的办理、相关权限的开通、档案的整理与转交，成本分摊表的制作]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1006', '陈淑琳', '844', '3', '陈淑琳添加了任务内容为[事业部周例会的组织，验收单的用印，事业部固定资产流转单的填写，整理中山同事的发票并转交总部财务]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1007', '陈淑琳', '845', '3', '陈淑琳添加了任务内容为[外出办理速度软件股改事宜，日常行政事务的对接]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1008', '陈淑琳', '846', '3', '陈淑琳添加了任务内容为[吴洋录用审批流程的提交、offer的发放，待入职人员龙冰心的对接，培训费用付款流程的提交与追踪]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1009', '陈淑琳', '847', '3', '陈淑琳添加了任务内容为[工资表的定稿，吴洋三方协议的签署，招聘工作]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1010', '陈淑琳', '848', '3', '陈淑琳添加了任务内容为[参与总部行政会议，外出半天办理速度软件股改事宜]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1011', '陈淑琳', '849', '3', '陈淑琳添加了任务内容为[外出3小时办理银行开户事宜,、相关材料已转交总部财务，固定资产的采购：两台台式机、一台笔记本，总部行政会议的参与，华为6份材料的扫描并转交总部管理]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1012', '陈淑琳', '850', '3', '陈淑琳添加了任务内容为[龙冰心三方协议的签署，王禧媛录用审批流程的提交、offer的发放]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1013', '陈淑琳', '851', '3', '陈淑琳添加了任务内容为[指导陆海芳周报等工作，花名册、项目管理及事业部快递汇总表的制作，日常行政工作的对接]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1014', '陈淑琳', '852', '3', '陈淑琳添加了任务内容为[公积金的汇缴，招聘工作]的工时信息', '99', '2020-06-19 17:33:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1015', '宁南鑫', '853', '3', '宁南鑫添加了任务内容为[测试测距代码]的工时信息', '99', '2020-06-22 17:20:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1016', '宁南鑫', '854', '3', '宁南鑫添加了任务内容为[配置新电脑环境,在gpu上运行代码]的工时信息', '99', '2020-06-22 17:20:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1017', '宁南鑫', '855', '3', '宁南鑫添加了任务内容为[确立之后的开发目标,封装代码]的工时信息', '99', '2020-06-22 17:20:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1018', '宁南鑫', '856', '3', '宁南鑫添加了任务内容为[整理630算法]的工时信息', '99', '2020-06-23 17:23:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1019', '王禧媛', '857', '3', '王禧媛添加了任务内容为[办理入职手续、学习数据标注目的、方式及常用软件安装]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1020', '王禧媛', '858', '3', '王禧媛添加了任务内容为[参与例会]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1021', '王禧媛', '859', '3', '王禧媛添加了任务内容为[安装数据标注软件及练习，查找汽车数据集]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1022', '王禧媛', '860', '3', '王禧媛添加了任务内容为[查找汽车数据集，并制定汽车分类标准]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1023', '王禧媛', '861', '3', '王禧媛添加了任务内容为[查找并使用3d框标注工具]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1024', '王禧媛', '862', '3', '王禧媛添加了任务内容为[下载汽车数据集、了解深度学习及数据集质量要求]的工时信息', '99', '2020-06-24 10:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1025', '陈淑琳', '863', '3', '陈淑琳添加了任务内容为[王禧媛入职的办理、权限的开通及档案的整理，龙冰心三方协议的签署及邮寄，招聘，招聘网站套餐的采购]的工时信息', '99', '2020-06-24 10:31:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1026', '陈淑琳', '864', '3', '陈淑琳添加了任务内容为[事业部周例会的组织，华为材料及新开公司材料的转交，VPN的采购]的工时信息', '99', '2020-06-24 10:31:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1027', '陈淑琳', '865', '3', '陈淑琳添加了任务内容为[考勤数据的初步整理，外出3小时前往银行更换公积金CA证书，招聘网站的对接]的工时信息', '99', '2020-06-24 10:31:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1028', '陈淑琳', '866', '3', '陈淑琳添加了任务内容为[总部行政会议的参与，外出接待]的工时信息', '99', '2020-06-24 10:31:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1029', '王禧媛', '858', '5', '王禧媛删除了任务内容为[参与例会]的工时', '99', '2020-06-28 08:39:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1030', '王禧媛', '861', '5', '王禧媛删除了任务内容为[查找并使用3d框标注工具]的工时', '99', '2020-06-28 08:44:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1031', '宁南鑫', '867', '3', '宁南鑫添加了任务内容为[完成新电脑的环境搭建]的工时信息', '99', '2020-06-28 08:47:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('1032', '张秀娇', '815', '4', '张秀娇将工作时长由2修改为2.5', '99', '2020-06-28 09:13:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1033', '张秀娇', '868', '3', '张秀娇添加了任务内容为[多目标跟踪算法调研]的工时信息', '99', '2020-06-28 09:13:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1034', '张秀娇', '869', '3', '张秀娇添加了任务内容为[完成autoware与LGSVL的连接，及demo的初始测试]的工时信息', '99', '2020-06-28 09:13:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1035', '张秀娇', '870', '3', '张秀娇添加了任务内容为[autoware与LGSVL的demo调试，主要解决自动驾驶过程中的无法避障问题]的工时信息', '99', '2020-06-28 09:13:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1036', '张秀娇', '871', '3', '张秀娇添加了任务内容为[查找解决车辆无法自动避障的原因及解决方法]的工时信息', '99', '2020-06-28 09:13:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1037', '张秀娇', '872', '3', '张秀娇添加了任务内容为[查找解决LGSVL与autoware连接驾驶，如何录制路径点问题]的工时信息', '99', '2020-06-28 09:21:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1038', '张秀娇', '873', '3', '张秀娇添加了任务内容为[解决LGSVL如何录制路径点]的工时信息', '99', '2020-06-28 09:21:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1039', '张秀娇', '874', '3', '张秀娇添加了任务内容为[查找LGSVL矢量地图不能识别的问题]的工时信息', '99', '2020-06-28 09:21:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1040', '张秀娇', '875', '3', '张秀娇添加了任务内容为[查找LGSVL矢量地图不能识别的原因及解决方法]的工时信息', '99', '2020-06-28 09:24:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('1041', '王禧媛', '876', '3', '王禧媛添加了任务内容为[参与例会]的工时信息', '99', '2020-06-28 10:04:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1042', '王禧媛', '877', '3', '王禧媛添加了任务内容为[查找并学习使用3d框数据标注软件]的工时信息', '99', '2020-06-28 10:04:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1043', '王禧媛', '878', '3', '王禧媛添加了任务内容为[寻找符合标准的标注软件]的工时信息', '99', '2020-06-28 10:04:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1044', '王禧媛', '879', '3', '王禧媛添加了任务内容为[下载汽车数据集]的工时信息', '99', '2020-06-28 10:04:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1045', '王禧媛', '880', '3', '王禧媛添加了任务内容为[尝试下载3d-bat-master标注软件]的工时信息', '99', '2020-06-28 10:04:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1046', '林书宇', '881', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-06-28 16:59:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1047', '林书宇', '882', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-06-28 16:59:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1048', '林书宇', '883', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-06-28 16:59:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1049', '林书宇', '884', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-06-28 16:59:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1050', '林书宇', '885', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图 3、制作基于常州道路数据宣传图片]的工时信息', '99', '2020-06-28 17:11:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1051', '林书宇', '886', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:11:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1052', '林书宇', '887', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:11:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1053', '林书宇', '888', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:11:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1054', '林书宇', '889', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:11:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1055', '林书宇', '890', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1056', '林书宇', '891', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1057', '林书宇', '892', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1058', '林书宇', '893', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1059', '林书宇', '894', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1060', '林书宇', '895', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、路障、红绿灯、交通指示牌建模 2、完善道路建模出现的问题 基于常州道路数据UE仿真 1、制作红绿灯、交通指示牌材质蓝图 2、学习红绿灯闪烁蓝图]的工时信息', '99', '2020-06-28 17:14:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1061', '林书宇', '896', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1062', '林书宇', '897', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1063', '林书宇', '898', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1064', '林书宇', '899', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1065', '林书宇', '900', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1066', '林书宇', '901', '3', '林书宇添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。（对接CADdxf文件，对路面、绿化带、红绿灯、路灯、交通指示牌等进行建模，添加材质、纹理、贴图） 完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。（导入三维模型，渲染模型，对道路模型进行材质处理，调整光照，天气，大雾环境，仿真真实环境。）]的工时信息', '99', '2020-06-28 17:17:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1067', '姚阳', '902', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1068', '姚阳', '903', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1069', '姚阳', '904', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1070', '姚阳', '905', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1071', '姚阳', '906', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1072', '姚阳', '907', '3', '姚阳添加了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1073', '姚阳', '908', '3', '姚阳添加了任务内容为[使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1074', '姚阳', '909', '3', '姚阳添加了任务内容为[实现SVN同步工作，使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1075', '姚阳', '910', '3', '姚阳添加了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1076', '姚阳', '911', '3', '姚阳添加了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1077', '姚阳', '912', '3', '姚阳添加了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1078', '姚阳', '913', '3', '姚阳添加了任务内容为[在UE4中使用程序化植物生成器生成道路附近树木。使用UE4依照常州虚拟道路完成马路两侧人行道的放置，以及周围环境的美化。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1079', '姚阳', '914', '3', '姚阳添加了任务内容为[完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1080', '姚阳', '915', '3', '姚阳添加了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1081', '姚阳', '916', '3', '姚阳添加了任务内容为[修复人行道模型和道路连接处的缝隙。给场景中加上天空白云蓝图。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1082', '姚阳', '917', '3', '姚阳添加了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1083', '姚阳', '918', '3', '姚阳添加了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1084', '姚阳', '919', '3', '姚阳添加了任务内容为[ 	 设置了UE4的常州道路虚拟光照环境，场景昼夜交替，实现场景中太阳，天空云朵蓝图实时变换。检查虚拟道路场景中的模型，并更换闪烁的贴图。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1085', '姚阳', '920', '3', '姚阳添加了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1086', '姚阳', '921', '3', '姚阳添加了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1087', '姚阳', '922', '3', '姚阳添加了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时信息', '99', '2020-06-28 17:26:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1088', '姚阳', '914', '5', '姚阳删除了任务内容为[完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型]的工时', '99', '2020-06-28 17:28:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('1089', '姚阳', '908', '5', '姚阳删除了任务内容为[使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。]的工时', '99', '2020-06-28 17:28:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('1090', '姚阳', '913', '5', '姚阳删除了任务内容为[在UE4中使用程序化植物生成器生成道路附近树木。使用UE4依照常州虚拟道路完成马路两侧人行道的放置，以及周围环境的美化。]的工时', '99', '2020-06-28 17:28:14');
INSERT INTO `dt_project_workinghour_log` VALUES ('1091', '姚阳', '903', '5', '姚阳删除了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时', '99', '2020-06-28 17:28:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1092', '姚阳', '902', '5', '姚阳删除了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时', '99', '2020-06-28 17:28:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1093', '姚阳', '909', '5', '姚阳删除了任务内容为[实现SVN同步工作，使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。]的工时', '99', '2020-06-28 17:28:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1094', '姚阳', '915', '5', '姚阳删除了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时', '99', '2020-06-28 17:28:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1095', '姚阳', '920', '5', '姚阳删除了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时', '99', '2020-06-28 17:28:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1096', '姚阳', '904', '5', '姚阳删除了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时', '99', '2020-06-28 17:28:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('1097', '姚阳', '910', '5', '姚阳删除了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时', '99', '2020-06-28 17:28:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('1098', '姚阳', '916', '5', '姚阳删除了任务内容为[修复人行道模型和道路连接处的缝隙。给场景中加上天空白云蓝图。]的工时', '99', '2020-06-28 17:28:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('1099', '姚阳', '921', '5', '姚阳删除了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时', '99', '2020-06-28 17:28:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1100', '姚阳', '905', '5', '姚阳删除了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时', '99', '2020-06-28 17:28:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1101', '姚阳', '911', '5', '姚阳删除了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时', '99', '2020-06-28 17:28:36');
INSERT INTO `dt_project_workinghour_log` VALUES ('1102', '姚阳', '917', '5', '姚阳删除了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时', '99', '2020-06-28 17:28:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1103', '姚阳', '906', '5', '姚阳删除了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时', '99', '2020-06-28 17:28:40');
INSERT INTO `dt_project_workinghour_log` VALUES ('1104', '姚阳', '912', '5', '姚阳删除了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时', '99', '2020-06-28 17:28:41');
INSERT INTO `dt_project_workinghour_log` VALUES ('1105', '姚阳', '918', '5', '姚阳删除了任务内容为[更新道路与建筑物,给道路加上绿化带，检查并修复道路绿化带边缘材质问题。]的工时', '99', '2020-06-28 17:28:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1106', '姚阳', '907', '5', '姚阳删除了任务内容为[完成基于常州道路数据的SU道路场景建模，完成总工作量的100%。完成基于常州道路数据的UE场景仿真搭建，完成总工作量的50%。]的工时', '99', '2020-06-28 17:28:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1107', '姚阳', '919', '5', '姚阳删除了任务内容为[ 	 设置了UE4的常州道路虚拟光照环境，场景昼夜交替，实现场景中太阳，天空云朵蓝图实时变换。检查虚拟道路场景中的模型，并更换闪烁的贴图。]的工时', '99', '2020-06-28 17:28:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1108', '姚阳', '922', '5', '姚阳删除了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时', '99', '2020-06-28 17:28:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1109', '姚阳', '923', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1110', '姚阳', '924', '3', '姚阳添加了任务内容为[基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1111', '姚阳', '925', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1112', '姚阳', '926', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1113', '姚阳', '927', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1114', '姚阳', '928', '3', '姚阳添加了任务内容为[基于常州道路数据的SU场景建模、基于常州道路数据的UE蓝图场景制作 基于常州道路数据的SU场景建模，对接CADdxf文件，处理线图，进一步封面，制作道路模型]的工时信息', '99', '2020-06-28 17:30:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1115', '姚阳', '929', '3', '姚阳添加了任务内容为[使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1116', '姚阳', '930', '3', '姚阳添加了任务内容为[使用sketchup完成常州道路周遭建筑模型的搭建和修改，然后将道路和房屋模型放置到UE4环境中。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1117', '姚阳', '931', '3', '姚阳添加了任务内容为[实现SVN同步工作，使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1118', '姚阳', '932', '3', '姚阳添加了任务内容为[使用UE4对常州虚拟仿真道路进行细节优化（放置树木，路灯，绿化带）。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1119', '姚阳', '933', '3', '姚阳添加了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1120', '姚阳', '934', '3', '姚阳添加了任务内容为[使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。]的工时信息', '99', '2020-06-28 17:32:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1121', '姚阳', '934', '4', '姚阳将填报内容由使用UE4笔刷工具绘制常州道路绿化带植物等。将道路与建筑物放置在常州高度图地形上，并完善高精道路及周围环境整体效果。修改为使用程序化植物生成器生成道路附近树木。使用UE4依照常州虚拟道路完成马路两侧人行道的放置，以及周围环境的美化。', '99', '2020-06-28 17:32:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1122', '姚阳', '935', '3', '姚阳添加了任务内容为[完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型，]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1123', '姚阳', '936', '3', '姚阳添加了任务内容为[完成常州道路两侧人行道的放置和建筑物与道路连接处的场景优化，在场景中央添加了软件园区场景模型，]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1124', '姚阳', '937', '3', '姚阳添加了任务内容为[更新道路与建筑物模型,给道路加上绿化带，检查并修复道路绿化带边缘材质问题.]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1125', '姚阳', '938', '3', '姚阳添加了任务内容为[更新道路与建筑物模型,给道路加上绿化带，检查并修复道路绿化带边缘材质问题.]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1126', '姚阳', '939', '3', '姚阳添加了任务内容为[修复人行道模型和道路连接处的缝隙。给场景中加上天空白云蓝图。]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1127', '姚阳', '940', '3', '姚阳添加了任务内容为[ 	 设置了UE4的常州道路虚拟光照环境，场景昼夜交替，实现场景中太阳，天空云朵蓝图实时变换。检查虚拟道路场景中的模型，并更换闪烁的贴图。]的工时信息', '99', '2020-06-28 17:35:37');
INSERT INTO `dt_project_workinghour_log` VALUES ('1128', '姚阳', '941', '3', '姚阳添加了任务内容为[修复常州道路虚拟场景中心园区贴图丢失问题。]的工时信息', '99', '2020-06-28 17:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1129', '姚阳', '942', '3', '姚阳添加了任务内容为[将常州道路迁移到Carla项目中，修复迁移出错的模型，根据常州道路全景地图放置道路标牌，路灯。]的工时信息', '99', '2020-06-28 17:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1130', '姚阳', '943', '3', '姚阳添加了任务内容为[根据常州道路全景地图放置道路标牌，路灯蓝图。]的工时信息', '99', '2020-06-28 17:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1131', '伍军豪', '944', '3', '伍军豪添加了任务内容为[完成学校的绘制]的工时信息', '99', '2020-06-28 18:18:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1132', '伍军豪', '945', '3', '伍军豪添加了任务内容为[规划弯道线]的工时信息', '99', '2020-06-28 18:18:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1133', '伍军豪', '946', '3', '伍军豪添加了任务内容为[绘制弯道线]的工时信息', '99', '2020-06-28 18:18:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1134', '伍军豪', '947', '3', '伍军豪添加了任务内容为[绘制小车模型]的工时信息', '99', '2020-06-28 18:21:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1135', '伍军豪', '948', '3', '伍军豪添加了任务内容为[对小车模型动态处理]的工时信息', '99', '2020-06-28 18:21:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1136', '伍军豪', '949', '3', '伍军豪添加了任务内容为[修改道路边线]的工时信息', '99', '2020-06-28 18:21:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1137', '伍军豪', '950', '3', '伍军豪添加了任务内容为[完善场景]的工时信息', '99', '2020-06-28 18:21:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1138', '伍军豪', '951', '3', '伍军豪添加了任务内容为[了解智慧城市系统]的工时信息', '99', '2020-06-28 18:21:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1139', '伍军豪', '952', '3', '伍军豪添加了任务内容为[了解智慧城市,查看所需功能]的工时信息', '99', '2020-06-28 18:24:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1140', '伍军豪', '953', '3', '伍军豪添加了任务内容为[探究threejs光照和阴影的功能]的工时信息', '99', '2020-06-28 18:24:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1141', '伍军豪', '954', '3', '伍军豪添加了任务内容为[查看场景切换功能]的工时信息', '99', '2020-06-28 18:24:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1142', '伍军豪', '955', '3', '伍军豪添加了任务内容为[实现第二种场景功能]的工时信息', '99', '2020-06-28 18:24:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1143', '伍军豪', '956', '3', '伍军豪添加了任务内容为[初步探索碰撞]的工时信息', '99', '2020-06-28 18:24:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1144', '伍军豪', '956', '4', '伍军豪将填报内容由初步探索碰撞修改为初步探索碰撞,编写相关代码', '99', '2020-06-28 18:27:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1145', '伍军豪', '949', '4', '伍军豪将工作时长由7.5修改为9', '99', '2020-06-28 18:28:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('1146', '伍军豪', '957', '3', '伍军豪添加了任务内容为[编写碰撞代码]的工时信息', '99', '2020-06-28 18:30:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('1147', '伍军豪', '958', '3', '伍军豪添加了任务内容为[了解红绿灯代码,并且完善碰撞代码]的工时信息', '99', '2020-06-28 18:30:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('1148', '伍军豪', '959', '3', '伍军豪添加了任务内容为[解决了碰撞代码的bug]的工时信息', '99', '2020-06-28 18:30:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('1149', '伍军豪', '960', '3', '伍军豪添加了任务内容为[编写了红绿灯函数,但存在问题]的工时信息', '99', '2020-06-28 18:30:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('1150', '吴洋', '961', '3', '吴洋添加了任务内容为[1.入职培训；2.开发中国地图飞行线项目]的工时信息', '99', '2020-06-28 18:32:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('1151', '戚国华', '962', '3', '戚国华添加了任务内容为[由于之前智慧景区框架不清晰；所以重新组织智慧景区-系统总构架及云平台构架]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1152', '戚国华', '963', '3', '戚国华添加了任务内容为[输出Word11页；阅读SOA框架论文19份；搞清B/S架构、面向服务思想、NB-IoT等概念及GIS在SOA框架中的思考；]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1153', '戚国华', '964', '3', '戚国华添加了任务内容为[将方案设计定为Web端与App端公用一个服务器；按SOA思想-将全部子系统分解为服务组件；]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1154', '戚国华', '965', '3', '戚国华添加了任务内容为[对重点的18篇SOA论文及相关框架图进行分析，输出自己的系统框架图。]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1155', '戚国华', '966', '3', '戚国华添加了任务内容为[制作智慧景区-系统分层框架图]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1156', '戚国华', '967', '3', '戚国华添加了任务内容为[1. TDOM、游戏引擎Unity3D与UE4, 网络与实体电话联通原理 2. 智慧产业园硬件软件标准 3.学习大数据平台Hadoop相关知识 3. 下载安装了解虚幻四引擎]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1157', '戚国华', '968', '3', '戚国华添加了任务内容为[1.学习使用了UE4, 2.学习智慧旅游研究报告，输出思维导图1份 3.了解敏捷开发、用户体验地图、用户故事。]的工时信息', '99', '2020-06-28 20:14:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1158', '戚国华', '968', '4', '戚国华将工作时长由4修改为5', '99', '2020-06-28 20:14:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1159', '戚国华', '969', '3', '戚国华添加了任务内容为[出差从南京到中山]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1160', '戚国华', '970', '3', '戚国华添加了任务内容为[1.制作智慧阜新word。2.阜新新政策规划收资一份]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1161', '戚国华', '971', '3', '戚国华添加了任务内容为[1.完成智慧阜新 生态平安、矿山、投资建设模式、运营、效益分析]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1162', '戚国华', '972', '3', '戚国华添加了任务内容为[1.完成智慧阜新初稿1.0，优化运营模式，盈利模式，融资手段]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1163', '戚国华', '973', '3', '戚国华添加了任务内容为[去翠投帮忙整理财务报表]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1164', '戚国华', '974', '3', '戚国华添加了任务内容为[去翠投帮忙整理财务报表]的工时信息', '99', '2020-06-28 20:17:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1165', '戚国华', '975', '3', '戚国华添加了任务内容为[1. 大数据中心、运营中心，收资-阅读-二期技术方案]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1166', '戚国华', '976', '3', '戚国华添加了任务内容为[1.阅读资料论文 2.编写数据中心安全管理制度]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1167', '戚国华', '977', '3', '戚国华添加了任务内容为[1.两份数据中心管理制度文档，一份日常运营，一份运维规范]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1168', '戚国华', '978', '3', '戚国华添加了任务内容为[1份Word-智慧城市运营中心管理制度。]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1169', '戚国华', '979', '3', '戚国华添加了任务内容为[1.工程车辆管理详细设计刷格式 2. 学习二期的材料]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1170', '戚国华', '980', '3', '戚国华添加了任务内容为[1.学习二期数据中心投标文档 ]的工时信息', '99', '2020-06-28 20:22:34');
INSERT INTO `dt_project_workinghour_log` VALUES ('1171', '戚国华', '981', '3', '戚国华添加了任务内容为[辅助智慧交通岛PPT制作]的工时信息', '99', '2020-06-28 20:27:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1172', '戚国华', '982', '3', '戚国华添加了任务内容为[对智慧景区相关资料学习，并思考相关建设思路]的工时信息', '99', '2020-06-28 20:27:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1173', '戚国华', '983', '3', '戚国华添加了任务内容为[从中山市回南京]的工时信息', '99', '2020-06-28 20:27:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1174', '戚国华', '984', '3', '戚国华添加了任务内容为[完善智慧景区v1.2(10%); D-InSAR、SBAS-InSAR、PS-InSAR相关知识补充回顾; 继续学习二期相关材料]的工时信息', '99', '2020-06-28 20:27:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1175', '高恒娟', '985', '3', '高恒娟添加了任务内容为[智慧康养方案：资料学习、编制PPT；例会]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1176', '高恒娟', '986', '3', '高恒娟添加了任务内容为[智慧康养方案：资料学习、编制PPT]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1177', '高恒娟', '987', '3', '高恒娟添加了任务内容为[智慧康养方案：资料学习、编制PPT]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1178', '高恒娟', '988', '3', '高恒娟添加了任务内容为[智慧康养方案：编制、优化PPT]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1179', '高恒娟', '989', '3', '高恒娟添加了任务内容为[智慧康养方案：优化PPT]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1180', '高恒娟', '990', '3', '高恒娟添加了任务内容为[无人机培训]的工时信息', '99', '2020-06-29 08:46:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1181', '高恒娟', '991', '3', '高恒娟添加了任务内容为[南京到中山出差， 阜新智慧城市会议及资料收集]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1182', '高恒娟', '992', '3', '高恒娟添加了任务内容为[阜新政策收集、背景整理，建设内容编写整理]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1183', '高恒娟', '993', '3', '高恒娟添加了任务内容为[阜新建设内容编写整理、实施路径、建设思路]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1184', '高恒娟', '994', '3', '高恒娟添加了任务内容为[阜新智慧城市 内容修改完善；合资公司 功能梳理]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1185', '高恒娟', '995', '3', '高恒娟添加了任务内容为[阜新智慧城市架构图绘制；学习翠亨知识]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1186', '高恒娟', '996', '3', '高恒娟添加了任务内容为[运营内容编写]的工时信息', '99', '2020-06-29 08:52:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1187', '高恒娟', '997', '3', '高恒娟添加了任务内容为[阜新智慧城市：融入数字及地方产业 农业 医疗 交通等方面的特色点，编写]的工时信息', '99', '2020-06-29 08:53:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1188', '高恒娟', '998', '3', '高恒娟添加了任务内容为[阜新方案优化，融入数字及地方产业 农业 医疗 交通等方面的特色点，编写]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1189', '高恒娟', '999', '3', '高恒娟添加了任务内容为[编制关于翠亨新区基础数据更新管理办法;]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1190', '高恒娟', '1000', '3', '高恒娟添加了任务内容为[编制、完善关于翠亨新区基础数据更新管理办法;]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1191', '高恒娟', '1001', '3', '高恒娟添加了任务内容为[运营内容编写，增加流程图等内容]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1192', '高恒娟', '1002', '3', '高恒娟添加了任务内容为[物业智能安全巡检详细设计方案 内容修改 排版]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1193', '高恒娟', '1003', '3', '高恒娟添加了任务内容为[物业排版；数据标内容整理 脑图]的工时信息', '99', '2020-06-29 08:57:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1194', '高恒娟', '1004', '3', '高恒娟添加了任务内容为[无人驾驶试点分布PPT图制作、参观规划馆、例会]的工时信息', '99', '2020-06-29 08:59:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1195', '高恒娟', '1005', '3', '高恒娟添加了任务内容为[编制关于翠亨新区城市网格化管理办法]的工时信息', '99', '2020-06-29 08:59:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1196', '高恒娟', '1006', '3', '高恒娟添加了任务内容为[中山回南京]的工时信息', '99', '2020-06-29 08:59:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1197', '高恒娟', '1007', '3', '高恒娟添加了任务内容为[华为标内容梳理、交通配合、例会]的工时信息', '99', '2020-06-29 08:59:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1198', '宁南鑫', '1008', '3', '宁南鑫添加了任务内容为[研究图像转换]的工时信息', '99', '2020-06-29 15:19:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1199', '宁南鑫', '1009', '3', '宁南鑫添加了任务内容为[继续研究鸟瞰图的转换]的工时信息', '99', '2020-06-29 15:19:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1200', '王禧媛', '1010', '3', '王禧媛添加了任务内容为[查找下载apollpscape汽车数据集]的工时信息', '99', '2020-06-30 10:09:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('1201', '王禧媛', '1011', '3', '王禧媛添加了任务内容为[尝试下载3d-bat标注集及相关安装软件、了解已标注数据集编码]的工时信息', '99', '2020-06-30 10:09:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('1202', '宁南鑫', '1012', '3', '宁南鑫添加了任务内容为[阅读射影变换相关内容]的工时信息', '99', '2020-06-30 14:44:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1203', '耿禹', '1013', '3', '耿禹添加了任务内容为[SOMKE3D识别模型复现]的工时信息', '99', '2020-06-30 16:28:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1204', '耿禹', '1014', '3', '耿禹添加了任务内容为[SOMKE3D识别模型复现]的工时信息', '99', '2020-06-30 16:28:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('1205', '耿禹', '1013', '4', '耿禹将项目名称由FID日常研发工作 预立项修改为FID未知技术研发费用 预立项（2020）将项目子内容由研发工作修改为自动驾驶视觉', '99', '2020-06-30 16:28:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1206', '耿禹', '1014', '4', '耿禹将项目名称由FID日常研发工作 预立项修改为FID未知技术研发费用 预立项（2020）将项目子内容由研发工作修改为自动驾驶视觉', '99', '2020-06-30 16:28:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1207', '耿禹', '1015', '3', '耿禹添加了任务内容为[SOMKE3D识别模型复现]的工时信息', '99', '2020-06-30 16:29:29');
INSERT INTO `dt_project_workinghour_log` VALUES ('1208', '耿禹', '1016', '3', '耿禹添加了任务内容为[项目立项PPT1.0版编写 World 1.0版本编写]的工时信息', '99', '2020-06-30 16:33:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('1209', '耿禹', '1016', '4', '耿禹将填报内容由项目立项PPT1.0版编写 World 1.0版本编写修改为项目立项PPT1.0版编写 World 1.0版本编写，及内部评审', '99', '2020-06-30 16:35:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1210', '耿禹', '1017', '3', '耿禹添加了任务内容为[南航交流高精度地图项目，达成共建实验室意项]的工时信息', '99', '2020-06-30 16:35:25');
INSERT INTO `dt_project_workinghour_log` VALUES ('1211', '耿禹', '1017', '4', '耿禹将填报时间由4修改为3', '99', '2020-06-30 16:36:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1212', '耿禹', '1018', '3', '耿禹添加了任务内容为[宿迁高速项目技术可研报告编写]的工时信息', '99', '2020-06-30 16:37:15');
INSERT INTO `dt_project_workinghour_log` VALUES ('1213', '耿禹', '1019', '3', '耿禹添加了任务内容为[宿迁高速项目技术可研报告编写]的工时信息', '99', '2020-06-30 16:38:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1214', '耿禹', '1020', '3', '耿禹添加了任务内容为[立项World更改V1.1]的工时信息', '99', '2020-06-30 16:39:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('1215', '耿禹', '1021', '3', '耿禹添加了任务内容为[立项World更改V1.1]的工时信息', '99', '2020-06-30 16:39:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1216', '耿禹', '1022', '3', '耿禹添加了任务内容为[宣传手册图片修改]的工时信息', '99', '2020-06-30 16:40:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1217', '耿禹', '1023', '3', '耿禹添加了任务内容为[项目立项PTTV1.1修改]的工时信息', '99', '2020-06-30 16:41:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1218', '耿禹', '1024', '3', '耿禹添加了任务内容为[项目立项PTTV1.1修改]的工时信息', '99', '2020-06-30 16:41:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1219', '耿禹', '1025', '3', '耿禹添加了任务内容为[项目立项PTTV2.1完善]的工时信息', '99', '2020-06-30 16:42:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1220', '耿禹', '1026', '3', '耿禹添加了任务内容为[项目立项PTTV2.1完善]的工时信息', '99', '2020-06-30 16:42:54');
INSERT INTO `dt_project_workinghour_log` VALUES ('1221', '耿禹', '1026', '4', '耿禹将填报时间由1修改为3', '99', '2020-06-30 16:43:01');
INSERT INTO `dt_project_workinghour_log` VALUES ('1222', '耿禹', '1027', '3', '耿禹添加了任务内容为[项目立项PTTV2.1完善]的工时信息', '99', '2020-06-30 16:43:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1223', '耿禹', '1026', '4', '耿禹将填报内容由项目立项PTTV2.1完善修改为项目立项PTTV2.1完善，World2.1版本编写', '99', '2020-06-30 16:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1224', '耿禹', '1027', '4', '耿禹将填报内容由项目立项PTTV2.1完善修改为项目立项PTTV2.1完善，项目立项答辩', '99', '2020-06-30 16:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1225', '耿禹', '1028', '3', '耿禹添加了任务内容为[根据指导意见修改项目立项报告]的工时信息', '99', '2020-06-30 16:46:53');
INSERT INTO `dt_project_workinghour_log` VALUES ('1226', '耿禹', '1028', '4', '耿禹将填报时间由4修改为3将项目名称由FID日常工作 预立项（2020）修改为FID日常研发工作 预立项将项目子内容由技术交流修改为研发工作', '99', '2020-06-30 16:47:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1227', '耿禹', '1029', '3', '耿禹添加了任务内容为[参加华为云计算城市峰会]的工时信息', '99', '2020-06-30 16:47:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1228', '耿禹', '1030', '3', '耿禹添加了任务内容为[完成项目立项报告V1.0版本]的工时信息', '99', '2020-06-30 16:48:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1229', '耿禹', '1030', '4', '耿禹将填报内容由完成项目立项报告V1.0版本修改为完成项目立项报告V1.0版本，南京交院交流。', '99', '2020-06-30 16:50:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1230', '耿禹', '1031', '3', '耿禹添加了任务内容为[完成南京交院PPTV1.0版]的工时信息', '99', '2020-06-30 16:50:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1231', '耿禹', '1031', '4', '耿禹将填报内容由完成南京交院PPTV1.0版修改为完成南京交院PPTV1.0版，完成立项报告V1.1版本', '99', '2020-06-30 16:50:50');
INSERT INTO `dt_project_workinghour_log` VALUES ('1232', '耿禹', '1032', '3', '耿禹添加了任务内容为[确认本地网站发布的多种方式，提交立项world]的工时信息', '99', '2020-06-30 16:52:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1233', '耿禹', '1033', '3', '耿禹添加了任务内容为[中交信科接待]的工时信息', '99', '2020-06-30 16:53:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1234', '耿禹', '1034', '3', '耿禹添加了任务内容为[跟踪南航实验室，跟踪南交院，总结中交信科需求]的工时信息', '99', '2020-06-30 16:54:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1235', '张秀娇', '1035', '3', '张秀娇添加了任务内容为[使用Shalun、BorregasAve、SanFranciso等不同地图与autoware官网demo地图对比，尝试找出矢量地图不能显示的原因]的工时信息', '99', '2020-06-30 17:34:42');
INSERT INTO `dt_project_workinghour_log` VALUES ('1236', '张秀娇', '873', '4', '张秀娇将工作时长由4.5修改为6.5', '99', '2020-06-30 17:35:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1237', '张秀娇', '874', '4', '张秀娇将工作时长由3修改为1', '99', '2020-06-30 17:35:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1238', '张秀娇', '1036', '3', '张秀娇添加了任务内容为[尝试通过重新下载数据包、重新录制路径点等方法解决autoware车辆不受控制的问题]的工时信息', '99', '2020-06-30 17:44:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('1239', '张秀娇', '1037', '3', '张秀娇添加了任务内容为[阶段性资料整理、备份]的工时信息', '99', '2020-06-30 17:44:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('1240', '张秀娇', '1038', '3', '张秀娇添加了任务内容为[阶段性资料整理、备份，组装新电脑]的工时信息', '99', '2020-06-30 17:44:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('1241', '张秀娇', '1039', '3', '张秀娇添加了任务内容为[纯跟踪轨迹算法学习]的工时信息', '99', '2020-06-30 17:44:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('1242', '戚国华', '1040', '3', '戚国华添加了任务内容为[《翠亨二期建设可行性研究报告》-思维导图(20%))]的工时信息', '99', '2020-06-30 18:40:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1243', '戚国华', '1041', '3', '戚国华添加了任务内容为[《翠亨二期建设可行性研究报告》-思维导图(45%)]的工时信息', '99', '2020-06-30 18:40:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1244', '戚国华', '1040', '4', '戚国华将填报时间由4修改为3', '99', '2020-06-30 18:40:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1245', '戚国华', '1041', '4', '戚国华将填报时间由4修改为3', '99', '2020-06-30 18:40:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1246', '王禧媛', '1042', '3', '王禧媛添加了任务内容为[熟悉3d-bat标注软件并讨论用途]的工时信息', '99', '2020-07-01 10:30:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1247', '王禧媛', '1043', '3', '王禧媛添加了任务内容为[调整软件中已有标注数据并记录]的工时信息', '99', '2020-07-01 10:30:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1248', '王禧媛', '1044', '3', '王禧媛添加了任务内容为[下载相关汽车数据集]的工时信息', '99', '2020-07-02 14:04:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1249', '王禧媛', '1045', '3', '王禧媛添加了任务内容为[熟悉标注流程，对3d-bat数据集中的汽车进行分类]的工时信息', '99', '2020-07-02 14:04:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1250', '王禧媛', '1046', '3', '王禧媛添加了任务内容为[标注并整理数据集第0-4帧]的工时信息', '99', '2020-07-02 14:04:20');
INSERT INTO `dt_project_workinghour_log` VALUES ('1251', '林书宇', '1047', '3', '林书宇添加了任务内容为[常州]的工时信息', '99', '2020-07-02 16:22:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1252', '姚阳', '1048', '3', '姚阳添加了任务内容为[基于常州道路全景地图放置市政护栏模型，删除和修改项目合并出错模型，制作并放置各种类型红绿灯蓝图和交通标志牌（完成80%）。]的工时信息', '99', '2020-07-02 16:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1253', '姚阳', '1049', '3', '姚阳添加了任务内容为[检查并修复道路材质问题，完成放置标牌模型，解决场景阴影过重问题。]的工时信息', '99', '2020-07-02 16:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1254', '姚阳', '1050', '3', '姚阳添加了任务内容为[将Carla中的红绿灯蓝图迁移到常州道路场景中，并更亮灯逻辑。测试UE4中Multi-User Editing插件实现多人实时协同工作。]的工时信息', '99', '2020-07-02 16:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1255', '姚阳', '1051', '3', '姚阳添加了任务内容为[更改并添加Carla中的道路材质蓝图，实现下雨天气在道路上在道路上显示雨滴和积水效果。]的工时信息', '99', '2020-07-02 16:24:43');
INSERT INTO `dt_project_workinghour_log` VALUES ('1256', '林书宇', '1047', '4', '林书宇将工作时长由7.5修改为8.5', '99', '2020-07-02 16:25:26');
INSERT INTO `dt_project_workinghour_log` VALUES ('1257', '林书宇', '1047', '4', '林书宇将填报内容由常州修改为基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件', '99', '2020-07-02 16:25:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('1258', '林书宇', '1052', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-07-02 16:26:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1259', '林书宇', '1053', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-07-02 16:26:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1260', '林书宇', '1054', '3', '林书宇添加了任务内容为[基于常州道路数据SU建模 1、红绿灯、交通指示牌建模 2、完善道路建模出现的问题3、建立模型库和模型模板。基于常州道路数据UE仿真 1、参照全景图放置路障、红绿灯、交通指示牌等 2、制作关卡地图，协同管理UE4工程文件]的工时信息', '99', '2020-07-02 16:26:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1261', '王禧媛', '1055', '3', '王禧媛添加了任务内容为[标注并整理数据集第5-16帧]的工时信息', '99', '2020-07-03 08:41:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('1262', '王禧媛', '1056', '3', '王禧媛添加了任务内容为[查找并下载相关汽车数据集]的工时信息', '99', '2020-07-03 08:41:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('1263', '王禧媛', '1057', '3', '王禧媛添加了任务内容为[讨论学习3d-bat代码实现过程]的工时信息', '99', '2020-07-03 08:41:58');
INSERT INTO `dt_project_workinghour_log` VALUES ('1264', '王禧媛', '1058', '3', '王禧媛添加了任务内容为[标注并整理数据集第17-25帧]的工时信息', '99', '2020-07-03 15:01:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1265', '王禧媛', '1059', '3', '王禧媛添加了任务内容为[标注并整理数据集第26-40帧]的工时信息', '99', '2020-07-03 15:01:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1266', '王禧媛', '1059', '4', '王禧媛将填报内容由标注并整理数据集第26-40帧修改为标注并整理数据集第26-35帧', '99', '2020-07-03 15:46:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1267', '戚国华', '1060', '3', '戚国华添加了任务内容为[《智慧景区》PPTv1.2 （15%）；《翠亨二期建设可行性研究报告》-思维导图（55%）]的工时信息', '99', '2020-07-03 18:33:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('1268', '戚国华', '1061', '3', '戚国华添加了任务内容为[《智慧景区》PPTv1.2 （30%）；《翠亨二期建设可行性研究报告》-思维导图（70%）]的工时信息', '99', '2020-07-03 18:33:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('1269', '戚国华', '1062', '3', '戚国华添加了任务内容为[《智慧景区》PPTv1.2 （50%）；《翠亨二期建设可行性研究报告》-思维导图（80%）]的工时信息', '99', '2020-07-03 18:33:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('1270', '戚国华', '1061', '4', '戚国华将工作时长由8修改为8.5', '99', '2020-07-03 18:34:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('1271', '张秀娇', '1063', '3', '张秀娇添加了任务内容为[autoware有关工作的阶段性整理、备份以及工作交接]的工时信息', '99', '2020-07-06 15:40:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1272', '张秀娇', '1064', '3', '张秀娇添加了任务内容为[新电脑的常用软件安装]的工时信息', '99', '2020-07-06 15:40:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1273', '张秀娇', '1065', '3', '张秀娇添加了任务内容为[新电脑的cuda安装，基于anaconda环境的tensorflow、pytorch环境配置]的工时信息', '99', '2020-07-06 15:40:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1274', '张秀娇', '1066', '3', '张秀娇添加了任务内容为[基于点云三维检测技术调研]的工时信息', '99', '2020-07-06 15:40:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1275', '张秀娇', '1067', '3', '张秀娇添加了任务内容为[基于点云三维检测技术调研]的工时信息', '99', '2020-07-06 15:40:55');
INSERT INTO `dt_project_workinghour_log` VALUES ('1276', '张秀娇', '1068', '3', '张秀娇添加了任务内容为[电脑系统重装，软件及环境重新安装]的工时信息', '99', '2020-07-06 15:42:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1277', '张秀娇', '1069', '3', '张秀娇添加了任务内容为[基于点云三维检测技术调研]的工时信息', '99', '2020-07-06 15:42:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1278', '王禧媛', '1070', '3', '王禧媛添加了任务内容为[查找汽车数据集]的工时信息', '99', '2020-07-07 08:30:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1279', '王禧媛', '1071', '3', '王禧媛添加了任务内容为[标注并整理3d-bat数据集35-45帧]的工时信息', '99', '2020-07-07 08:30:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1280', '王禧媛', '1072', '3', '王禧媛添加了任务内容为[参与例会]的工时信息', '99', '2020-07-07 08:30:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1281', '宁南鑫', '1073', '3', '宁南鑫添加了任务内容为[开始研究点云向二维场景的转换]的工时信息', '99', '2020-07-07 11:45:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1282', '宁南鑫', '1074', '3', '宁南鑫添加了任务内容为[开始学习pcl库]的工时信息', '99', '2020-07-07 11:45:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1283', '宁南鑫', '1075', '3', '宁南鑫添加了任务内容为[继续学习]的工时信息', '99', '2020-07-07 11:45:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1284', '宁南鑫', '1076', '3', '宁南鑫添加了任务内容为[配置好vcpkg等包,安装相关环境]的工时信息', '99', '2020-07-07 11:45:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1285', '宁南鑫', '1077', '3', '宁南鑫添加了任务内容为[解决pcl无法可视化的问题]的工时信息', '99', '2020-07-07 11:45:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1286', '王禧媛', '1078', '3', '王禧媛添加了任务内容为[标注并整理3d-bat数据集45-50帧]的工时信息', '99', '2020-07-08 09:54:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1287', '王禧媛', '1079', '3', '王禧媛添加了任务内容为[查找汽车数据集并下载]的工时信息', '99', '2020-07-08 09:54:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1288', '王禧媛', '1080', '3', '王禧媛添加了任务内容为[尝试下载其他标注工具]的工时信息', '99', '2020-07-08 09:54:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1289', '宁南鑫', '1081', '3', '宁南鑫添加了任务内容为[重新编译pcl]的工时信息', '99', '2020-07-08 16:00:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1290', '王禧媛', '1082', '3', '王禧媛添加了任务内容为[浏览kitti网站尝试下载汽车数据集]的工时信息', '99', '2020-07-09 09:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('1291', '王禧媛', '1083', '3', '王禧媛添加了任务内容为[了解并尝试安装其他三维数据标注软件]的工时信息', '99', '2020-07-09 09:22:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('1292', '宁南鑫', '1084', '3', '宁南鑫添加了任务内容为[转正ppt不合格,修改]的工时信息', '99', '2020-07-09 17:35:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1293', '王禧媛', '1085', '3', '王禧媛添加了任务内容为[在kitti和apolloscape上下载汽车数据集]的工时信息', '99', '2020-07-10 09:05:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1294', '王禧媛', '1086', '3', '王禧媛添加了任务内容为[探索标注工具下载与使用]的工时信息', '99', '2020-07-10 09:05:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1295', '綦晓杰', '1087', '3', '綦晓杰添加了任务内容为[编写专利]的工时信息', '99', '2020-07-10 16:29:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1296', '綦晓杰', '1088', '3', '綦晓杰添加了任务内容为[3D点云目标检测算法调查]的工时信息', '99', '2020-07-10 16:29:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1297', '綦晓杰', '1089', '3', '綦晓杰添加了任务内容为[3D点云目标检测算法]的工时信息', '99', '2020-07-10 16:34:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1298', '綦晓杰', '1090', '3', '綦晓杰添加了任务内容为[编写专利并根据反馈意见修改]的工时信息', '99', '2020-07-10 16:34:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1299', '綦晓杰', '1091', '3', '綦晓杰添加了任务内容为[点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件]的工时信息', '99', '2020-07-10 16:34:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1300', '綦晓杰', '1092', '3', '綦晓杰添加了任务内容为[编写专利]的工时信息', '99', '2020-07-10 16:35:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1301', '綦晓杰', '1089', '4', '綦晓杰将填报内容由3D点云目标检测算法修改为3D点云目标检测算法调查', '99', '2020-07-10 16:36:07');
INSERT INTO `dt_project_workinghour_log` VALUES ('1302', '綦晓杰', '1090', '4', '綦晓杰将填报内容由编写专利并根据反馈意见修改修改为根据反馈意见修改专利', '99', '2020-07-10 16:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1303', '綦晓杰', '1093', '3', '綦晓杰添加了任务内容为[3D点云目标检测算法调查]的工时信息', '99', '2020-07-10 16:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1304', '綦晓杰', '1094', '3', '綦晓杰添加了任务内容为[编写专利]的工时信息', '99', '2020-07-10 16:37:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1305', '綦晓杰', '1095', '3', '綦晓杰添加了任务内容为[点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件]的工时信息', '99', '2020-07-10 16:38:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1306', '綦晓杰', '1096', '3', '綦晓杰添加了任务内容为[点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件]的工时信息', '99', '2020-07-10 16:38:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1307', '綦晓杰', '1097', '3', '綦晓杰添加了任务内容为[3D点云目标检测算法调查]的工时信息', '99', '2020-07-10 16:38:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1308', '綦晓杰', '1098', '3', '綦晓杰添加了任务内容为[3D点云目标检测算法调查]的工时信息', '99', '2020-07-10 16:38:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1309', '綦晓杰', '1091', '4', '綦晓杰将填报时间由2020-07-10修改为2020-07-09将工作时长由0修改为4', '99', '2020-07-10 16:39:00');
INSERT INTO `dt_project_workinghour_log` VALUES ('1310', '綦晓杰', '1095', '4', '綦晓杰将填报内容由点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件修改为软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '99', '2020-07-10 16:39:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('1311', '綦晓杰', '1096', '4', '綦晓杰将填报内容由点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件修改为软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '99', '2020-07-10 16:39:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('1312', '綦晓杰', '1091', '4', '綦晓杰将填报内容由点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件修改为软件展示点云三角网建模，画等高线，提取点坐标，使用pgAdmin读取备份文件', '99', '2020-07-10 16:39:47');
INSERT INTO `dt_project_workinghour_log` VALUES ('1313', '綦晓杰', '1089', '4', '綦晓杰将工作时长由6修改为5', '99', '2020-07-10 16:40:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1314', '綦晓杰', '1090', '4', '綦晓杰将工作时长由1.5修改为2.5', '99', '2020-07-10 16:40:17');
INSERT INTO `dt_project_workinghour_log` VALUES ('1315', '王禧媛', '1099', '3', '王禧媛添加了任务内容为[查找下载可用汽车数据集]的工时信息', '99', '2020-07-10 16:52:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('1316', '王禧媛', '1100', '3', '王禧媛添加了任务内容为[安装并熟悉labelimg标注软件]的工时信息', '99', '2020-07-10 16:52:28');
INSERT INTO `dt_project_workinghour_log` VALUES ('1317', '孙茂荣', '1101', '3', '孙茂荣添加了任务内容为[编写智慧交通管理办法建议]的工时信息', '99', '2020-07-13 18:20:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1318', '孙茂荣', '1102', '3', '孙茂荣添加了任务内容为[编写网联汽车道路测试规范]的工时信息', '99', '2020-07-13 18:20:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1319', '孙茂荣', '1103', '3', '孙茂荣添加了任务内容为[编写交通资源管理办法和方法]的工时信息', '99', '2020-07-13 18:20:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1320', '孙茂荣', '1104', '3', '孙茂荣添加了任务内容为[现场实地勘探翠亨新区，了解目前的交通建设情况]的工时信息', '99', '2020-07-13 18:20:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1321', '孙茂荣', '1105', '3', '孙茂荣添加了任务内容为[收集翠亨新区的建设规划、智慧交通、智慧城市的资料]的工时信息', '99', '2020-07-13 18:20:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1322', '孙茂荣', '1103', '4', '孙茂荣将填报内容由编写交通资源管理办法和方法修改为编写交通资源管理办法', '99', '2020-07-13 18:21:09');
INSERT INTO `dt_project_workinghour_log` VALUES ('1323', '孙茂荣', '1106', '3', '孙茂荣添加了任务内容为[配合人工智能研究院完成高精地图数字服务平台评审汇报材料]的工时信息', '99', '2020-07-13 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1324', '孙茂荣', '1107', '3', '孙茂荣添加了任务内容为[配合人工智能研究院完成高精地图数字服务平台立项材料]的工时信息', '99', '2020-07-13 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1325', '孙茂荣', '1108', '3', '孙茂荣添加了任务内容为[整理城市级智能网联示范区汇总材料]的工时信息', '99', '2020-07-13 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1326', '孙茂荣', '1109', '3', '孙茂荣添加了任务内容为[优化翠亨新区智慧交通岛设计建设方案，完成50%]的工时信息', '99', '2020-07-13 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1327', '孙茂荣', '1110', '3', '孙茂荣添加了任务内容为[优化翠亨新区智慧交通岛设计建设方案，完成70%]的工时信息', '99', '2020-07-13 18:57:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1328', '王禧媛', '1111', '3', '王禧媛添加了任务内容为[熟悉labelimg标注软件并使用]的工时信息', '99', '2020-07-14 11:12:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1329', '王禧媛', '1112', '3', '王禧媛添加了任务内容为[参与例会]的工时信息', '99', '2020-07-14 11:12:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1330', '王禧媛', '1113', '3', '王禧媛添加了任务内容为[对猪的数据集标注565张]的工时信息', '99', '2020-07-14 11:12:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1331', '王禧媛', '1114', '3', '王禧媛添加了任务内容为[对猪的数据集标注260张]的工时信息', '99', '2020-07-14 11:12:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1332', '王禧媛', '1115', '3', '王禧媛添加了任务内容为[查找收集车道线标注数据集]的工时信息', '99', '2020-07-15 09:12:30');
INSERT INTO `dt_project_workinghour_log` VALUES ('1333', '宁南鑫', '1116', '3', '宁南鑫添加了任务内容为[解决猪的数据集问题]的工时信息', '99', '2020-07-15 15:03:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('1334', '宁南鑫', '1117', '3', '宁南鑫添加了任务内容为[开始编译yolov4]的工时信息', '99', '2020-07-15 15:04:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('1335', '宁南鑫', '1118', '3', '宁南鑫添加了任务内容为[安装相关环境]的工时信息', '99', '2020-07-15 15:04:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('1336', '宁南鑫', '1119', '3', '宁南鑫添加了任务内容为[开始训练]的工时信息', '99', '2020-07-15 15:04:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('1337', '王禧媛', '1120', '3', '王禧媛添加了任务内容为[下载kitti、apollo车道线标注数据集]的工时信息', '99', '2020-07-16 09:02:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('1338', '王禧媛', '1121', '3', '王禧媛添加了任务内容为[查找数据集标注规范]的工时信息', '99', '2020-07-16 09:02:59');
INSERT INTO `dt_project_workinghour_log` VALUES ('1339', '宁南鑫', '1122', '3', '宁南鑫添加了任务内容为[编写点云离群点滤波代码]的工时信息', '99', '2020-07-16 17:14:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1340', '张秀娇', '1123', '3', '张秀娇添加了任务内容为[视觉与激光雷达的数据融合算法调研]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1341', '张秀娇', '1124', '3', '张秀娇添加了任务内容为[视觉与激光雷达的数据融合算法调研]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1342', '张秀娇', '1125', '3', '张秀娇添加了任务内容为[基于多传感器融合算法的3D目标检测学习]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1343', '张秀娇', '1126', '3', '张秀娇添加了任务内容为[基于多传感器融合算法的3D目标检学习]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1344', '张秀娇', '1127', '3', '张秀娇添加了任务内容为[述职报告编写]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1345', '张秀娇', '1128', '3', '张秀娇添加了任务内容为[技术方案研讨及确定]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1346', '张秀娇', '1129', '3', '张秀娇添加了任务内容为[转正评审会]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1347', '张秀娇', '1130', '3', '张秀娇添加了任务内容为[调研报告总结，资料整理]的工时信息', '99', '2020-07-17 09:04:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1348', '张秀娇', '1131', '3', '张秀娇添加了任务内容为[方案修改及技术路线重新制定研讨会]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1349', '张秀娇', '1132', '3', '张秀娇添加了任务内容为[MLOD算法学习]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1350', '张秀娇', '1133', '3', '张秀娇添加了任务内容为[图像与点云数据融合综述论文阅读及总结]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1351', '张秀娇', '1134', '3', '张秀娇添加了任务内容为[3维点云语义分割学习]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1352', '张秀娇', '1135', '3', '张秀娇添加了任务内容为[3维点云分割算法调研，包括语义分割、实例分割、全景分割]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1353', '张秀娇', '1136', '3', '张秀娇添加了任务内容为[3维点云分割算法调研]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1354', '张秀娇', '1137', '3', '张秀娇添加了任务内容为[SPLATNet分割算法的论文阅读及原理理解]的工时信息', '99', '2020-07-17 09:17:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1355', '王禧媛', '1138', '3', '王禧媛添加了任务内容为[下载kitti、apollo车道线标注数据集]的工时信息', '99', '2020-07-17 09:41:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1356', '王禧媛', '1139', '3', '王禧媛添加了任务内容为[查找学习数据集标注规范]的工时信息', '99', '2020-07-17 09:41:31');
INSERT INTO `dt_project_workinghour_log` VALUES ('1357', '王禧媛', '1140', '3', '王禧媛添加了任务内容为[下载kitti、apollo车道线标注数据集]的工时信息', '99', '2020-07-17 14:30:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1358', '王禧媛', '1141', '3', '王禧媛添加了任务内容为[查找学习数据集标注规范]的工时信息', '99', '2020-07-17 14:30:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1359', '陈淑琳', '1142', '3', '陈淑琳添加了任务内容为[考勤数据汇总，招聘，安排面试：郑鹏飞，上传工资数据]的工时信息', '99', '2020-07-17 17:23:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1360', '陈淑琳', '1143', '3', '陈淑琳添加了任务内容为[配合领导完成行政相关事宜]的工时信息', '99', '2020-07-17 17:23:04');
INSERT INTO `dt_project_workinghour_log` VALUES ('1361', '陈淑琳', '1144', '3', '陈淑琳添加了任务内容为[吴洋入职手续的办理、相关权限的开通，绩效流程的审批与汇总，参与总部人事会议，招聘]的工时信息', '99', '2020-07-17 17:24:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1362', '陈淑琳', '1145', '3', '陈淑琳添加了任务内容为[事业部周例会的组织，配合总部财务进展新开两家公司税务报到的事宜]的工时信息', '99', '2020-07-17 17:24:56');
INSERT INTO `dt_project_workinghour_log` VALUES ('1363', '陈淑琳', '1146', '3', '陈淑琳添加了任务内容为[重新刻制速度软件法人章，上半年事业部固定资产的清单核实，预约次日接待饭店]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1364', '陈淑琳', '1147', '3', '陈淑琳添加了任务内容为[制作五险一金账单，更新事业部花名册，编制事业部培训文档，招聘]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1365', '陈淑琳', '1148', '3', '陈淑琳添加了任务内容为[事业部固定资产汇总表反馈总部行政，对接日常的行政事务]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1366', '陈淑琳', '1149', '3', '陈淑琳添加了任务内容为[完成考勤表、绩效汇总表、工资表初稿的制作，招聘]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1367', '陈淑琳', '1150', '3', '陈淑琳添加了任务内容为[招聘，反馈五险一金账单]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1368', '陈淑琳', '1151', '3', '陈淑琳添加了任务内容为[配合总部进行事业部微信群的转移，对接日常行政事务]的工时信息', '99', '2020-07-17 17:29:44');
INSERT INTO `dt_project_workinghour_log` VALUES ('1369', '陈淑琳', '1152', '3', '陈淑琳添加了任务内容为[綦晓杰入职的办理、相关权限的开通、OA等软件的指导，约面：陈萌，招聘：推荐5份简历]的工时信息', '99', '2020-07-17 17:32:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('1370', '陈淑琳', '1153', '3', '陈淑琳添加了任务内容为[采购流程的提交，事业部现金流预测表的核实，事业部项目自行保管台账的提交，对接日常行政事务]的工时信息', '99', '2020-07-17 17:32:10');
INSERT INTO `dt_project_workinghour_log` VALUES ('1371', '陈淑琳', '1154', '3', '陈淑琳添加了任务内容为[周报、会议纪要、花名册、项目管理表单、事业部快递统计表等表单的制作，外出前往银行办理新开公司相关事宜]的工时信息', '99', '2020-07-17 17:34:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1372', '陈淑琳', '1155', '3', '陈淑琳添加了任务内容为[匹配五险一金账单，制作工资及成本分摊表，约面：张雪，招聘：推荐2份简历]的工时信息', '99', '2020-07-17 17:34:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1373', '陈淑琳', '1156', '3', '陈淑琳添加了任务内容为[发起4位实习生的转正流程，安排面试：张雪、夏伟、尹凤飞，转正评审会的前期准备，实习生转正签署劳动合同，招聘：推荐3份简历]的工时信息', '99', '2020-07-17 17:38:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('1374', '陈淑琳', '1157', '3', '陈淑琳添加了任务内容为[周例会的组织，推文计划的提交]的工时信息', '99', '2020-07-17 17:38:08');
INSERT INTO `dt_project_workinghour_log` VALUES ('1375', '陈淑琳', '1158', '3', '陈淑琳添加了任务内容为[安排面试：李信融、何婷，夏伟、李信融复试。提交五险一金的付款流程]的工时信息', '99', '2020-07-17 17:40:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1376', '陈淑琳', '1159', '3', '陈淑琳添加了任务内容为[对接日常的行政事宜，配合进行保密检查，安排一楼办公区位置]的工时信息', '99', '2020-07-17 17:40:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1377', '陈淑琳', '1160', '3', '陈淑琳添加了任务内容为[年中汇报材料的制作，对接日常的行政事宜]的工时信息', '99', '2020-07-17 17:41:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1378', '陈淑琳', '1161', '3', '陈淑琳添加了任务内容为[招聘，面试：丁辉鹏]的工时信息', '99', '2020-07-17 17:41:32');
INSERT INTO `dt_project_workinghour_log` VALUES ('1379', '陈淑琳', '1158', '4', '陈淑琳将填报内容由安排面试：李信融、何婷，夏伟、李信融复试。提交五险一金的付款流程修改为安排面试：李信融、何婷，。提交五险一金的付款流程', '99', '2020-07-17 17:45:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1380', '陈淑琳', '1162', '3', '陈淑琳添加了任务内容为[面试：夏伟、李信融复试，整理考勤数据]的工时信息', '99', '2020-07-17 17:45:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1381', '陈淑琳', '1163', '3', '陈淑琳添加了任务内容为[配合总部财务前往银行办理相关事宜，对接日常的行政事宜]的工时信息', '99', '2020-07-17 17:45:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1382', '陈淑琳', '1164', '3', '陈淑琳添加了任务内容为[整理智联招聘平台数据，考勤汇总表签字确认，招聘：推荐4份简历，发offer：何婷、龙冰心、夏伟，进行转正评审会]的工时信息', '99', '2020-07-17 17:48:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('1383', '陈淑琳', '1165', '3', '陈淑琳添加了任务内容为[花名册、项目管理表单、周报等表单的更新，日强文印发票的审核及付款流程的提交]的工时信息', '99', '2020-07-17 17:48:27');
INSERT INTO `dt_project_workinghour_log` VALUES ('1384', '陈淑琳', '1158', '4', '陈淑琳将填报内容由安排面试：李信融、何婷，。提交五险一金的付款流程修改为安排面试：李信融、何婷，提交五险一金的付款流程', '99', '2020-07-17 17:48:33');
INSERT INTO `dt_project_workinghour_log` VALUES ('1385', '陈淑琳', '1166', '3', '陈淑琳添加了任务内容为[周例会的组织，日常行政事务的对接]的工时信息', '99', '2020-07-17 17:50:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1386', '陈淑琳', '1167', '3', '陈淑琳添加了任务内容为[何婷入职的办理、相关权限的开通、OA等软件的指导，招聘：推荐3份简历，企业微信微盘（人事数据）的更新）]的工时信息', '99', '2020-07-17 17:50:03');
INSERT INTO `dt_project_workinghour_log` VALUES ('1387', '陈淑琳', '1168', '3', '陈淑琳添加了任务内容为[招聘：筛选30份简历、推荐6份，面试：沈嘉成，核实考勤打卡地点]的工时信息', '99', '2020-07-17 17:51:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1388', '陈淑琳', '1169', '3', '陈淑琳添加了任务内容为[陪同总部财务前往税务局将速度时空在速度软件的股份转移给新开的两家公司]的工时信息', '99', '2020-07-17 17:51:57');
INSERT INTO `dt_project_workinghour_log` VALUES ('1389', '陈淑琳', '1170', '3', '陈淑琳添加了任务内容为[龙冰心、夏伟的入职办理：开通相关权限、相关软件的指导等，社保缴纳材料的准备，招聘：筛选20份简历、推荐5份简历、约面于福忠、殷瑞]的工时信息', '99', '2020-07-17 17:54:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1390', '陈淑琳', '1171', '3', '陈淑琳添加了任务内容为[对接日常的行政事宜，转交智联招聘合同]的工时信息', '99', '2020-07-17 17:54:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1391', '陈淑琳', '1172', '3', '陈淑琳添加了任务内容为[用印、整理实习生转正及新入职同事签署的相关材料，更新花名册及OA系统中的人员信息，招聘：筛选30份简历、推荐5份简历]的工时信息', '99', '2020-07-17 17:59:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1392', '陈淑琳', '1173', '3', '陈淑琳添加了任务内容为[对接日常的行政事务]的工时信息', '99', '2020-07-17 17:59:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1393', '陈淑琳', '1174', '3', '陈淑琳添加了任务内容为[花名册、项目管理表单、周报等表单的编写]的工时信息', '99', '2020-07-17 17:59:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1394', '陈淑琳', '1175', '3', '陈淑琳添加了任务内容为[解顶林离职手续的办理，面试：安排梁富、陈东亮，约面：王伟，招聘：筛选70份简历、推荐9份简历，工资表个税版的制作，于福忠录用审批流程的提交及offer的发放，]的工时信息', '99', '2020-07-17 17:59:06');
INSERT INTO `dt_project_workinghour_log` VALUES ('1395', '王禧媛', '1176', '3', '王禧媛添加了任务内容为[查找下载与车道线有关的数据集]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1396', '王禧媛', '1177', '3', '王禧媛添加了任务内容为[研究车道线标注工具使用方法及练习]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1397', '王禧媛', '1178', '3', '王禧媛添加了任务内容为[查找并学习数据集标注规范]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1398', '王禧媛', '1179', '3', '王禧媛添加了任务内容为[查找下载与车道线有关的数据集]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1399', '王禧媛', '1180', '3', '王禧媛添加了任务内容为[研究车道线标注工具使用方法及练习]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1400', '王禧媛', '1181', '3', '王禧媛添加了任务内容为[查找并学习数据集标注规范]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1401', '王禧媛', '1182', '3', '王禧媛添加了任务内容为[参加例会]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1402', '王禧媛', '1183', '3', '王禧媛添加了任务内容为[查找下载与车道线有关的数据集]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1403', '王禧媛', '1184', '3', '王禧媛添加了任务内容为[研究车道线标注工具使用方法及练习]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1404', '王禧媛', '1185', '3', '王禧媛添加了任务内容为[查找并学习数据集标注规范]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1405', '王禧媛', '1186', '3', '王禧媛添加了任务内容为[更新本周小结及规划下周工作安排]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1406', '王禧媛', '1187', '3', '王禧媛添加了任务内容为[查找下载与车道线有关的数据集]的工时信息', '99', '2020-07-24 10:01:48');
INSERT INTO `dt_project_workinghour_log` VALUES ('1407', '宁南鑫', '1188', '3', '宁南鑫添加了任务内容为[继续编写代码]的工时信息', '99', '2020-07-24 15:51:51');
INSERT INTO `dt_project_workinghour_log` VALUES ('1408', '宁南鑫', '1189', '3', '宁南鑫添加了任务内容为[完成csf的学习]的工时信息', '99', '2020-07-24 15:53:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1409', '宁南鑫', '1190', '3', '宁南鑫添加了任务内容为[编译csf代码]的工时信息', '99', '2020-07-24 15:53:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1410', '宁南鑫', '1191', '3', '宁南鑫添加了任务内容为[整合所有的滤波代码]的工时信息', '99', '2020-07-24 15:53:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1411', '宁南鑫', '1192', '3', '宁南鑫添加了任务内容为[解决算法无法编译的问题]的工时信息', '99', '2020-07-24 15:53:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1412', '宁南鑫', '1193', '3', '宁南鑫添加了任务内容为[重构算法]的工时信息', '99', '2020-07-24 15:53:21');
INSERT INTO `dt_project_workinghour_log` VALUES ('1413', '孙茂荣', '1194', '3', '孙茂荣添加了任务内容为[整理地理信息行业公司融资情况]的工时信息', '99', '2020-07-27 20:03:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1414', '孙茂荣', '1195', '3', '孙茂荣添加了任务内容为[整理地理信息行业公司发展现状]的工时信息', '99', '2020-07-27 20:03:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1415', '孙茂荣', '1196', '3', '孙茂荣添加了任务内容为[编写地图商业模式文档]的工时信息', '99', '2020-07-27 20:03:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1416', '孙茂荣', '1197', '3', '孙茂荣添加了任务内容为[编写高精地图市场预期]的工时信息', '99', '2020-07-27 20:03:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1417', '孙茂荣', '1198', '3', '孙茂荣添加了任务内容为[速度软件的宣传材料制作]的工时信息', '99', '2020-07-27 20:03:22');
INSERT INTO `dt_project_workinghour_log` VALUES ('1418', '王禧媛', '1199', '3', '王禧媛添加了任务内容为[查找适合的语义分割标注工具]的工时信息', '99', '2020-07-28 08:33:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1419', '王禧媛', '1200', '3', '王禧媛添加了任务内容为[参与例会]的工时信息', '99', '2020-07-28 08:33:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1420', '王禧媛', '1201', '3', '王禧媛添加了任务内容为[尝试下载语义分割标注工具]的工时信息', '99', '2020-07-28 08:33:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1421', '戚国华', '1202', '3', '戚国华添加了任务内容为[开会分配任务--明确了本次出差的整体目标]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1422', '戚国华', '1203', '3', '戚国华添加了任务内容为[会议纪要；时空事业部已有平台系统展示介绍，吴经理介绍新区控规内容。]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1423', '戚国华', '1204', '3', '戚国华添加了任务内容为[参观东凤镇指挥中心-学习优秀经验；听鹏总讲解二期概况及项目管理内容，输出笔记；阅读城市事件中心任务及资料]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1424', '戚国华', '1205', '3', '戚国华添加了任务内容为[1.应急场景收集；2. 城市事件管理中心-灾害推演模型收资]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1425', '戚国华', '1206', '3', '戚国华添加了任务内容为[1. 调查应急管理相关部门（从国家部级、广东省厅、中山市局），输出脑图一份；2.收集了国家应急标准]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1426', '戚国华', '1207', '3', '戚国华添加了任务内容为[1. 学习应急管理材料，输出脑图一份；2. 学习二期项目整体框架图、数据流程图]的工时信息', '99', '2020-07-28 20:33:05');
INSERT INTO `dt_project_workinghour_log` VALUES ('1427', '戚国华', '1208', '3', '戚国华添加了任务内容为[应急管理相关材料收资，阅读 ；]的工时信息', '99', '2020-07-28 20:45:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1428', '戚国华', '1209', '3', '戚国华添加了任务内容为[设计应急管理系统调研方向，脑图一份（50%）]的工时信息', '99', '2020-07-28 20:45:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1429', '戚国华', '1210', '3', '戚国华添加了任务内容为[应急管理法律体系收集整理，输出word一份（100%），截图8张]的工时信息', '99', '2020-07-28 20:45:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1430', '戚国华', '1211', '3', '戚国华添加了任务内容为[项目全流程学习，输出4份流程图（100%）]的工时信息', '99', '2020-07-28 20:45:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1431', '戚国华', '1212', '3', '戚国华添加了任务内容为[《全国灾害综合风险普查实施方案》输出思维导图一份（10%）]的工时信息', '99', '2020-07-28 20:45:18');
INSERT INTO `dt_project_workinghour_log` VALUES ('1432', '戚国华', '1204', '4', '戚国华将填报内容由参观东凤镇指挥中心-学习优秀经验；听鹏总讲解二期概况及项目管理内容，输出笔记；阅读城市事件中心任务及资料修改为参观东凤镇指挥中心-与项目人员交流经验；听鹏总讲解二期概况及项目管理内容，输出笔记；阅读城市事件中心任务及资料', '99', '2020-07-28 20:46:24');
INSERT INTO `dt_project_workinghour_log` VALUES ('1433', '戚国华', '1209', '4', '戚国华将填报时间由1修改为3', '99', '2020-07-28 20:47:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1434', '戚国华', '1210', '4', '戚国华将填报时间由1修改为3', '99', '2020-07-28 20:47:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1435', '戚国华', '1211', '4', '戚国华将填报时间由1修改为3', '99', '2020-07-28 20:47:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1436', '戚国华', '1212', '4', '戚国华将填报时间由1修改为3', '99', '2020-07-28 20:47:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1437', '戚国华', '1213', '3', '戚国华添加了任务内容为[《全国灾害综合风险普查实施方案》输出思维导图一份（15%）]的工时信息', '99', '2020-07-28 20:47:38');
INSERT INTO `dt_project_workinghour_log` VALUES ('1438', '戚国华', '1214', '3', '戚国华添加了任务内容为[全国灾害综合风险普查实施方案--地震灾害 整理归纳。（35%）]的工时信息', '99', '2020-07-28 20:58:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1439', '戚国华', '1215', '3', '戚国华添加了任务内容为[整理3份应急管理架构设计，输出脑图；参加华为架构师会议，输出会议纪要]的工时信息', '99', '2020-07-28 20:58:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1440', '戚国华', '1216', '3', '戚国华添加了任务内容为[消化第四份应急管理架构设计；参加华为周例会；承载体调查与评估，导图推进（40%）]的工时信息', '99', '2020-07-28 20:58:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1441', '戚国华', '1217', '3', '戚国华添加了任务内容为[学习《应急指挥辅助决策系统》招标文档，补充应急系统架构脑图的功能点；]的工时信息', '99', '2020-07-28 20:58:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1442', '戚国华', '1218', '3', '戚国华添加了任务内容为[学习企业级业务架构，构思业务架构图]的工时信息', '99', '2020-07-28 20:58:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1443', '戚国华', '1219', '3', '戚国华添加了任务内容为[制作业务架构图框架，确定业务数理逻辑，划分阶段与对象]的工时信息', '99', '2020-07-28 21:01:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1444', '戚国华', '1220', '3', '戚国华添加了任务内容为[丰富完善业务流程内容，包含四个阶段的初步业务内容规划]的工时信息', '99', '2020-07-28 21:01:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1445', '高恒娟', '1221', '3', '高恒娟添加了任务内容为[二期内容梳理]的工时信息', '99', '2020-07-29 08:36:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1446', '高恒娟', '1222', '3', '高恒娟添加了任务内容为[二期内容梳理]的工时信息', '99', '2020-07-29 08:36:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1447', '高恒娟', '1223', '3', '高恒娟添加了任务内容为[二期内容梳理]的工时信息', '99', '2020-07-29 08:36:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1448', '高恒娟', '1224', '3', '高恒娟添加了任务内容为[二期内容梳理]的工时信息', '99', '2020-07-29 08:36:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1449', '高恒娟', '1225', '3', '高恒娟添加了任务内容为[江苏无线电厂调研，交通知识学习]的工时信息', '99', '2020-07-29 08:36:13');
INSERT INTO `dt_project_workinghour_log` VALUES ('1450', '高恒娟', '1226', '3', '高恒娟添加了任务内容为[南京到中山、例会]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1451', '高恒娟', '1227', '3', '高恒娟添加了任务内容为[二期项目进展会议、控规学习会议]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1452', '高恒娟', '1228', '3', '高恒娟添加了任务内容为[东凤镇智慧城镇调研学习，事件中心资料收集]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1453', '高恒娟', '1229', '3', '高恒娟添加了任务内容为[中山联通--车联网政策等交流；事件中心资料收集]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1454', '高恒娟', '1230', '3', '高恒娟添加了任务内容为[搜集整理城市运行事件资料、团建]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1455', '高恒娟', '1231', '3', '高恒娟添加了任务内容为[二期项目期间会议调研纪要整理、组织架构细化]的工时信息', '99', '2020-07-29 08:40:16');
INSERT INTO `dt_project_workinghour_log` VALUES ('1456', '高恒娟', '1232', '3', '高恒娟添加了任务内容为[平台和应用对应管理、无人机知识合并，平台深入了解]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1457', '高恒娟', '1233', '3', '高恒娟添加了任务内容为[城市运行事件资料在搜集、海口市各局行政监管清单内容信息表收集整理]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1458', '高恒娟', '1234', '3', '高恒娟添加了任务内容为[海口市各局行政监管清单内容信息表收集整理、华为周例会]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1459', '高恒娟', '1235', '3', '高恒娟添加了任务内容为[海口市各局行政监管清单内容信息表收集整理、生态环保局相关责任及环保网格化巡查学习 梳理]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1460', '高恒娟', '1236', '3', '高恒娟添加了任务内容为[食药监资料收集梳理]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1461', '高恒娟', '1237', '3', '高恒娟添加了任务内容为[食药监资料收集梳理]的工时信息', '99', '2020-07-29 08:42:23');
INSERT INTO `dt_project_workinghour_log` VALUES ('1462', '高恒娟', '1238', '3', '高恒娟添加了任务内容为[文化出版等事件归集、事业部例会]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1463', '高恒娟', '1239', '3', '高恒娟添加了任务内容为[食药监资料归集]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1464', '高恒娟', '1240', '3', '高恒娟添加了任务内容为[食药监资料归集]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1465', '高恒娟', '1241', '3', '高恒娟添加了任务内容为[食药监资料归集完善、广东智慧食药监系统梳理学习、部门例会2h]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1466', '高恒娟', '1242', '3', '高恒娟添加了任务内容为[回南京]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1467', '高恒娟', '1243', '3', '高恒娟添加了任务内容为[智慧工地梳理]的工时信息', '99', '2020-07-29 08:44:52');
INSERT INTO `dt_project_workinghour_log` VALUES ('1468', '高恒娟', '1239', '4', '高恒娟将工作时长由7.5修改为9', '99', '2020-07-29 08:45:19');
INSERT INTO `dt_project_workinghour_log` VALUES ('1469', '高恒娟', '1244', '3', '高恒娟添加了任务内容为[食药监相关论文学习、例会 部门例会]的工时信息', '99', '2020-07-29 08:46:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1470', '高恒娟', '1245', '3', '高恒娟添加了任务内容为[智慧工地资料收集整理]的工时信息', '99', '2020-07-29 08:46:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1471', '高恒娟', '1246', '3', '高恒娟添加了任务内容为[智慧工地资料收集整理]的工时信息', '99', '2020-07-29 08:46:35');
INSERT INTO `dt_project_workinghour_log` VALUES ('1472', '王禧媛', '1247', '3', '王禧媛添加了任务内容为[安装语义分割标注工具环境]的工时信息', '99', '2020-07-29 10:34:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1473', '王禧媛', '1248', '3', '王禧媛添加了任务内容为[尝试安装point-cloud-annotation-tool-master]的工时信息', '99', '2020-07-29 10:34:49');
INSERT INTO `dt_project_workinghour_log` VALUES ('1474', '王禧媛', '1249', '3', '王禧媛添加了任务内容为[配置semantic segmentation editor的安装环境]的工时信息', '99', '2020-07-30 08:38:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1475', '王禧媛', '1250', '3', '王禧媛添加了任务内容为[安装semantic segmentation editor并熟悉使用]的工时信息', '99', '2020-07-30 08:38:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1476', '白慧鹏', '1251', '3', '白慧鹏添加了任务内容为[111111]的工时信息', '99', '2020-07-30 09:20:46');
INSERT INTO `dt_project_workinghour_log` VALUES ('1477', '温四林', '1251', '6', '温四林将审核状态修改为审核。', '99', '2020-07-30 09:21:11');
INSERT INTO `dt_project_workinghour_log` VALUES ('1478', '温四林', '1251', '9', '温四林将审核状态修改为取消审核。', '99', '2020-07-30 09:22:39');
INSERT INTO `dt_project_workinghour_log` VALUES ('1479', '王禧媛', '1252', '3', '王禧媛添加了任务内容为[解析semantic segmentation editor程序代码]的工时信息', '99', '2020-07-31 14:05:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1480', '王禧媛', '1253', '3', '王禧媛添加了任务内容为[参与新员工欢迎会&生日会]的工时信息', '99', '2020-07-31 14:05:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1481', '王禧媛', '1254', '3', '王禧媛添加了任务内容为[查找下载语义分割数据集]的工时信息', '99', '2020-07-31 14:05:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1482', '王禧媛', '1255', '3', '王禧媛添加了任务内容为[下载安装cloud compare点云软件]的工时信息', '99', '2020-07-31 14:05:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1483', '王禧媛', '1256', '3', '王禧媛添加了任务内容为[查找学习ply点云转换为pcd点云的方法]的工时信息', '99', '2020-07-31 14:05:45');
INSERT INTO `dt_project_workinghour_log` VALUES ('1484', '王禧媛', '1257', '3', '王禧媛添加了任务内容为[练习使用semantic segmentation editor标注软件]的工时信息', '99', '2020-07-31 14:05:45');

-- ----------------------------
-- Table structure for dt_purchase_childht
-- ----------------------------
DROP TABLE IF EXISTS `dt_purchase_childht`;
CREATE TABLE `dt_purchase_childht` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterht_id` int(11) NOT NULL,
  `ht_mingcheng` varchar(200) DEFAULT NULL,
  `ht_number` varchar(50) DEFAULT NULL,
  `shenqingren` varchar(100) DEFAULT NULL,
  `liuchenghao` varchar(100) DEFAULT NULL,
  `shenqingbeizhu` longtext,
  `is_guidang` tinyint(3) unsigned NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `qiandingriqi` datetime NOT NULL,
  `caigouneirong` longtext,
  `ht_value` decimal(18,2) NOT NULL,
  `fukuantiaojian` longtext,
  `is_jiaojie` tinyint(3) unsigned NOT NULL,
  `jiaojie_shijian` datetime NOT NULL,
  `is_yanshou` tinyint(3) unsigned NOT NULL,
  `yanshou_shijian` datetime NOT NULL,
  `is_wendang` tinyint(3) unsigned NOT NULL,
  `jiaojiefangshi` longtext,
  `fenshu` longtext,
  `beizhu` longtext,
  `flag_master` tinyint(1) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_purchase_childht
-- ----------------------------

-- ----------------------------
-- Table structure for dt_purchase_childht_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_purchase_childht_attach`;
CREATE TABLE `dt_purchase_childht_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_ht_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `purchase_ht_id` (`purchase_ht_id`),
  CONSTRAINT `dt_purchase_childht_attachs` FOREIGN KEY (`purchase_ht_id`) REFERENCES `dt_purchase_childht` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_purchase_childht_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_purchase_ht
-- ----------------------------
DROP TABLE IF EXISTS `dt_purchase_ht`;
CREATE TABLE `dt_purchase_ht` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_mingcheng` varchar(200) DEFAULT NULL,
  `ht_number` varchar(50) DEFAULT NULL,
  `shenqingren` varchar(100) DEFAULT NULL,
  `liuchenghao` varchar(100) DEFAULT NULL,
  `shenqingbeizhu` longtext,
  `is_guidang` tinyint(3) unsigned NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `qiandingriqi` datetime NOT NULL,
  `caigouneirong` longtext,
  `ht_value` decimal(18,2) NOT NULL,
  `fukuantiaojian` longtext,
  `is_jiaojie` tinyint(3) unsigned NOT NULL,
  `jiaojie_shijian` datetime NOT NULL,
  `is_yanshou` tinyint(3) unsigned NOT NULL,
  `yanshou_shijian` datetime NOT NULL,
  `is_wendang` tinyint(3) unsigned NOT NULL,
  `jiaojiefangshi` longtext,
  `fenshu` longtext,
  `beizhu` longtext,
  `special` tinyint(1) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_purchase_ht
-- ----------------------------

-- ----------------------------
-- Table structure for dt_purchase_ht_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_purchase_ht_attach`;
CREATE TABLE `dt_purchase_ht_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_ht_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `purchase_ht_id` (`purchase_ht_id`),
  CONSTRAINT `dt_purchase_ht_attachs` FOREIGN KEY (`purchase_ht_id`) REFERENCES `dt_purchase_ht` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_purchase_ht_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_purchase_payment
-- ----------------------------
DROP TABLE IF EXISTS `dt_purchase_payment`;
CREATE TABLE `dt_purchase_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_requirement` longtext,
  `shenqingfukuanren` longtext,
  `liushuihao` longtext,
  `yifu_value` decimal(18,2) NOT NULL,
  `weifu_value` decimal(18,2) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ht_id` int(11) NOT NULL,
  `mark` tinyint(1) NOT NULL,
  `pay_period` longtext,
  `pay_detail` longtext,
  `pay_time` datetime NOT NULL,
  `is_record` tinyint(3) unsigned NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_purchase_payment
-- ----------------------------

-- ----------------------------
-- Table structure for dt_quoteinfo_product
-- ----------------------------
DROP TABLE IF EXISTS `dt_quoteinfo_product`;
CREATE TABLE `dt_quoteinfo_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoteinfo_id` int(11) NOT NULL,
  `product_manage_id` int(11) NOT NULL,
  `projectinfo_name` longtext,
  `price` decimal(18,2) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_quoteinfo_product
-- ----------------------------

-- ----------------------------
-- Table structure for dt_quote_info
-- ----------------------------
DROP TABLE IF EXISTS `dt_quote_info`;
CREATE TABLE `dt_quote_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_manage_id` int(11) NOT NULL,
  `project_desc` longtext,
  `price` double NOT NULL,
  `quote_date` datetime NOT NULL,
  `foreign_people` longtext,
  `zerenren` longtext,
  `gongyingshangtiaojia` double NOT NULL,
  `iswancheng` tinyint(1) NOT NULL,
  `chailvfei` double NOT NULL,
  `zhuanjiafei` double NOT NULL,
  `beizhu` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_quote_info
-- ----------------------------

-- ----------------------------
-- Table structure for dt_quote_info_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_quote_info_attach`;
CREATE TABLE `dt_quote_info_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_info_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `quote_info_id` (`quote_info_id`),
  CONSTRAINT `dt_quote_info_attachs` FOREIGN KEY (`quote_info_id`) REFERENCES `dt_quote_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_quote_info_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_quote_manage
-- ----------------------------
DROP TABLE IF EXISTS `dt_quote_manage`;
CREATE TABLE `dt_quote_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `add_people` varchar(100) DEFAULT NULL,
  `a_backupfield` varchar(200) DEFAULT NULL,
  `b_backupfield` varchar(200) DEFAULT NULL,
  `c_backupfield` varchar(200) DEFAULT NULL,
  `sheng` longtext,
  `shi` longtext,
  `quxian` longtext,
  `xm_status` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_quote_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dt_salary_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_salary_log`;
CREATE TABLE `dt_salary_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_item_id` int(11) NOT NULL,
  `salary` decimal(18,2) NOT NULL,
  `shebao` decimal(18,2) NOT NULL,
  `gongjijin` decimal(18,2) NOT NULL,
  `date` datetime NOT NULL,
  `description` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_salary_log
-- ----------------------------

-- ----------------------------
-- Table structure for dt_sharedexpenses
-- ----------------------------
DROP TABLE IF EXISTS `dt_sharedexpenses`;
CREATE TABLE `dt_sharedexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `inmonth` longtext,
  `cost` decimal(18,2) NOT NULL,
  `belongto` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_sharedexpenses
-- ----------------------------

-- ----------------------------
-- Table structure for dt_signbill_manage
-- ----------------------------
DROP TABLE IF EXISTS `dt_signbill_manage`;
CREATE TABLE `dt_signbill_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `quote_id` int(11) NOT NULL,
  `quote_name` varchar(200) DEFAULT NULL,
  `money` decimal(18,3) NOT NULL,
  `service_content` longtext,
  `beizhu` longtext,
  `sheng` longtext,
  `shi` longtext,
  `quxian` longtext,
  `zhongbiaoriqi` datetime NOT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_signbill_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dt_supplier
-- ----------------------------
DROP TABLE IF EXISTS `dt_supplier`;
CREATE TABLE `dt_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yifang` varchar(200) DEFAULT NULL,
  `yifang_lianluoren` varchar(100) DEFAULT NULL,
  `yifang_lianluofangshi` varchar(100) DEFAULT NULL,
  `zizhiqingkuang` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for dt_supplier_attach
-- ----------------------------
DROP TABLE IF EXISTS `dt_supplier_attach`;
CREATE TABLE `dt_supplier_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_ext` varchar(20) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `dt_supplier_attachs` FOREIGN KEY (`supplier_id`) REFERENCES `dt_supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_supplier_attach
-- ----------------------------

-- ----------------------------
-- Table structure for dt_supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `dt_supplier_info`;
CREATE TABLE `dt_supplier_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manageid` int(11) NOT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `project_money` decimal(18,3) NOT NULL,
  `royalty_money` decimal(18,3) NOT NULL,
  `canyushijian` datetime NOT NULL,
  `sheng` longtext,
  `shi` longtext,
  `quxian` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_supplier_info
-- ----------------------------

-- ----------------------------
-- Table structure for dt_supplier_manage
-- ----------------------------
DROP TABLE IF EXISTS `dt_supplier_manage`;
CREATE TABLE `dt_supplier_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `address` longtext,
  `telephone` varchar(100) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `responsible_domain` varchar(200) DEFAULT NULL,
  `corporate_name` longtext,
  `proportion_remarks` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_supplier_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dt_update_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_update_log`;
CREATE TABLE `dt_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` longtext,
  `userIds` longtext,
  `content` longtext,
  `sort_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_update_log
-- ----------------------------

-- ----------------------------
-- Table structure for __migrationhistory
-- ----------------------------
DROP TABLE IF EXISTS `__migrationhistory`;
CREATE TABLE `__migrationhistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ContextKey` varchar(300) NOT NULL,
  `Model` longblob NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`,`ContextKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __migrationhistory
-- ----------------------------
INSERT INTO `__migrationhistory` VALUES ('202004020957448_InitialCreate', 'SpeedProject.Framework.Core.DbContext.Initializer.MigrateConfiguration', 0x1F8B0800000000000400ED7D5D8FE43692E0FB01F71F0AF5B898ED72DB306EC6E8DEC58C3D5E34763C63B83D8B7B13981233935D4A51254A55957DB85F760FF793EE2F1CA96FF14BA4442A5359821FDC453223C850443022180CFEBFFFF37F3FFCFBEB29BE7B86194138F978FFFEDD37F7773009718492C3C7FB22DFFFEB1FEFFFFDDFFEFB7FFBF0D7E8F47AF75FCDB8EFD838FACB847CBC3FE679FAC3C303098FF004C8BB130A334CF03E7F17E2D30388F0C3B7DF7CF3A787F7EF1F2005714F61DDDD7DF8AD48727482E51FF4CF1F7112C2342F40FC0B8E604CEA76DAF3B9847AF7777082240521FC78FF398530FA35C35F6098BFFB39A31D2F387B7CF723CEE0BB9F7614520E5FF3FBBB3FC708D0C97D86F1FEFE0E2409CE414EA7FEC33F09FC9C6738397C4E6903887F3FA7908EDB8398C07A493F74C34D57F7CDB76C750FDD0F1B506141727CB204F8FEBB9A5C0FFCCF2711FDBE252725E85F29E1F3335B7549D48FF7511EA41535830C8610A594783CDA1F7E8C33F6133DF54BD008927722C83FDC697EF88796AF28FBB1FFFE70F76311E745063F26B0C83310FFE1EED76217A3F03FE1F977FC08938F4911C7FD65D185D1BE41036DA2E85298E5E7DFE0BE5E2C8AEEEF1E86BF7BE07FD8FEACF79B6AF19F92FCBB6FEFEFFE4E91835D0C5BAEE911EA734E17F41F308119C8E97A419EC38C7EF44F112CE92E60E77035641BC73902079C03FA37C22D1CCAF454A4EFEF7E01AF7F83C9213F7EBCA7FFBCBFFB19BDC2A869A961FF33415403D01FE55961842A834F05CAE0892ED23BBE631E3C83988DAB10FD04437402F1FDDDAF94D750ADC6FE787FF739048C5CDF59D32E8394F59220A21FB0C541FFFD3BD55793BE83DFD952CEF38F645F7C85194CBC7F5B82B3F9BC0FA228C8CB8F65FBF1FE0E9ED1A19463B958DEDFFD06E3B29F1C515A6D2E126517B4C37FCEF0E9371C4BB56CFBF7675C64219B2D1E1DFA3BC80E301FCEFBC343A7D20D15BD4305BF297633C59E14A71DCC3402F4FD370EE427A4D64F0628A38CA27323AF09E8C44C8284DA200E905079CE2021DE17B32B084A28A2A04890FF6D2CA7E017630752EC2AB9F7BC28FC92042083C03BA24A7FC12C1821A3236C0D1DA9D28B0AFAFF65B1967BFB2570B63B28A64ADADEF8A9E61D41122EC70F231AC931B6F48893653E4AC97D7433C5FE8DB0065D0EE3E528B994926F2C290042EAB210C4F6F6E004F3E3129E920CB71337A353F4E8E01AE4426E648B2F82208A51E27005EC1F4B78A62064412C908470318E0267E6735351CD4EFE9717C7CB89690C9220A7B6771C306F822239522F89CCDC901A019CE61DF23E318271E49F122D17532F23F6BFD73424DA1551E9691A0514EC7DF49EB4A79874E6F6C40FDB6E23213EA520397B27132494874AC7B0F5CD19EA18E670A07E9798407884E1E3325899E00428C971B0A71F0F67FE098D18514B1D47E91C2EA17A048C41C6E8EC1F2F09084544F667B66145A80AF7FB0EB8D5185908B1C51AB0DF7B47FD548018E567BA7711FF5B73AB6F407844F0B9FABE3B103E1629A9046889EF7B04CF308029DAE1D8BFE4A480D44B5BCC008A01A17AF018C2C7C116EB0DDF1E25D428392F8992C09C6EC3410C5E48B14094A846B7CCD2E85E1E803DB525039844CB6C283D9C8BE0A3E606C87226FD9FFC5BE7CF54C14541AB7A4E3881676F1615DDAC9E51122E108D28A3DDDEF575912C8086EA649404B8E89D8C785F586D254A24DB81FBCF04D72D48CA9EE7D0F94453748038396267801B0760F6C1796DCD9F40020E0EE1311E730D93E4202F960B992D6580331ECEE00964FE6DB2729F83317A86D979A14DF64A4FB8419E53D3988C9D70B7C3A427DB75AFEE44BB19223BC93638816F64686C9EC270E97C7961D7CC9B1FEAE824BEA687CB8CAB0AE2762EBF6CC2D51ED1AD6CEC38FCFBEF9D383D14530AF2E32C4CE68B22E82B74409B3229539329E062BE113B7F4E8AD3CCED15A3CE579EB1E29103DBD1255FFB7662A3EE5A3D3C5FCFD5A0360567A6E00A5286C51708E865CC9A9FCB8B2590BEE44C0353AE7A441DBF1FCD4E324CF12484329E2E9CE0081301B17F1D0A9E410E7499636E76B10C8278EC0339C981CA610CC7D234BE734239EAB2205DC6841B2C8804A088BAD0E35FCEB9BDBB4C81C4B88B794F933152EC28DBA384AAA5C59C50922F93D4F833CE501402AD543BD9C00FD4055D205133C50B1CB2BCBC06F4EFA4B707BC3937BA710FD936A6F2519B31C3B10307553644E69D4AC7CD754D87F37266B095F036ABCDCC6A2B3FE432F68B60714DDD51C899CC02B106996EF262F5925D8E94FD4C2AE48AD13A7957FDC4A5E8377376AB002AA89B1AB0500373452201CF0BA9121096E92373AF365CBDB69812E845C93346A11379E2406EC2B46CA8D7D5311E48D3F8EC38597B9924D19AF1660BFA8C1B29AED32716BA30577D73BF4B61176E32942E923FB8ECBD9BB5E9FC1824113BC70E40BC63A712EE54FF10F2B603D8ED002DF5E6F2527EA46A63A1C3389CA103CB775C08DD6806C6F74E2EF7AE57A49D1FDC73A037A1BE90506F47F923609638CA5FAB5EF0A110364DB070F1A4064E0E4FF34D84118FCC899334B8A134F10E1D224D6E72BBE2BF601C43905CB707D22454CB05FD7AB58C361B9359F5A3C9984327409594C98DD22539F2436D93340D93483943677CE2E369A5C2D889F9A5C6536FC7EBA7DE34984CBD69989A1ACBD495EDFCEB1F992DA2D487362B297FE02A53B69AA9C3E82985B7EDACCBEEAC639BA19B82512E764367552896DC0B4B7973159EBED6BDD1505397B4D06BE9FE109D5E1B8C73A5CE4EB00A38BB536815C44DA599A934D797B1E6C241A4CD919E677CAFCD730ECBD4347762C0E06D42B0ECBEDED5CC087B8986CE4FB64096A33D0A1188FDE259F9D6C76833B2F5F587E8B6BEC138575B1FE55EA779100CDE26F1EB4C82A0C48FA09B24880AD44207F98BA43E504A1CF44596DC440FD95D0C9BEA14F605C4E16B0A5975212A72A539EDFFC2009587C3174415E4170492D9BC458E30491D42C3050394A127349FED7111A13D480E7476DEA94A5DE2C3634167BE4031F89C52E815412744DA4374C674EAF054F896A61DC0AF08506942EC9511FFB7EE8AAFC7EAE39FB16E6D6EB01DE8927290D4E43C14542416405AA2D915A70598EECC241C8700BD14AEA47D07D1D705A844F2ECFD1248BE5DE2AED7899A74FE37F195DBF9CCEE1DB1F3FB437476FE609C2B3B9F3053D5A5A15F02DC2CFD8B04B896B879B996D01539820C46A54D4BD8DDD7F91C3E84B8B1F8C2E1AB847A3FDA2C2C57B90A1E83563B1833E3CC7FA1DAB548694A77BB232030088F288E8E6E82CC1CCC4D524D3723427F709CCF3714C489B27548FD719D6FE5E620F968F09092139F9185179E2864BD5B3D7E4BCFCC852F4AEA1D814E55B8C1D5AC6B2117089180FA8A11E85863DA45E4224D63744567834FD40D650FB23A098550DFF6808BA5C21396AF354EC8482E583C2AA74E7BDF59F7C9625F4A5C70168BD530025731063AAD3348585C71D6B46A182EA7F50293D90259536BA920E79E1AE10B68AB8594E23E0687A0DA7FD79C5A3027EF9433DA5479A78A61D2B8896AECECD8891CB00FDB75BB6764E76C36E47360C56E578C46C02C71C5682BD229C66DCBD72D51B2C78EC2B62DBC4DCB1887B44A9A55D15B0791AD3D1ED3334E3CBD3443DAB727DC60A196E40BF46F00C2A55E5F5A89628850C64E00A887469C29071EE6A6206C8E755C452616D20D7582BAD714A30C9F419C9F3D630941727696194046A2988EB4CC022EF353F1BA44F4652D0AB38B203AD29603809BAADC54E5A62A37557913AAB26F075602EBDABAACA06E4AD34C692EA2E6087CF51D7459EAA57293F705DC1CA696A2E197689462294E08A2AC15445402914E4FB9618510672966ACBA4C0941BAC152746599DAAAC2997F0E598B266E6D4C776A9803B9E9E04D076F3A78D3C19B0E56EA60744876288E5DEAE021C84D075F910E769520B6688CE2A960974566E7B495501699B0DF300781D9332B86CE0A95C3C4FF2B4B4B5D27DB022E7668BE5203E4B043003BC9D25CCB86353CAF769935B06D5713F20616D1A76625CD5CE17A86314EA7250CF234A2CC821394844796A4E7DFC15A8908973B313B576A44CF85140B4037413613E48E700E8C4297A944B58D594E6D2137B197527453359E262504A7E07C2AED4B8799C035CC4D360D3759700E32F854A00C9E9630F59BEB53D51D97256AAEC4A820C702E9EF86B9AAB4B12F3CDF0D7A81FE71B872E11D6495F71F6C997AC583B138FD1B61FF6FF8325411CCF58F66BB43E5C48444842A80B0F7DAFBEA5E3A9D7222E4F22868DB6BCCF69A7359D3CBBB9352A109620492B8C04BDC3F1E621CBFD3E706EB57F4F5889EEAEA650BC4B5D67953AE3DAF95DF90E3BB6537E38431736FC471009D1E4B6F37E06C5492B37BF1DBF5B71130DB0B5B1207D8CF65D8ED1EEC760F7653042B53048E35C026FA66A2BF155FDA8A2FA919712BBE647227662BBE348BC5B6E24B5BF1A5356551A5903D5733372ABFD27092E864296B2E19965B725969A9DE1F98A1473F3E95BC2C88F1C165BD6A0EF46666DA55AE5E24CBA0FF8D663F66734EE7ED4C4B3E16B916B7AF4E37767491BE83B649A3454292E324A28031FAC20944D3DE81AD56EFE47DAA3DFD0CE8900429C4A9F6155C47F9C8903AB44BE48CB03761CE885987D444AC7D81995447E405248330C354CB899A0D287EDE7745A326CE881A8B20A10B9B0F6929CB739D2663A79F1516A3384066304A46CDB51705906EB7A3ED1462C2AEE4244F763B841801B31D42F05AC0DD6D973EBC4DF6AFE86AE6E8D983A30BE59465470D4247A8821D081F8B748F60ACCBEE7443BFDDA2D8C245B16D77232DD1BC9E024265BFD82EFA37FB08C8C2237A76F37858036BDB3F9CEC1F6E1871A9DA27383B80047D2D092332FED86964F5C0F46C81F982E00EF9A7A9AB270D2308A21825B6F2FD76E3B5331CFA463929DC79BE5BE6CC0B6364AEBC6E8AA517D3BDA63E32516EB47CBA8341DA490F47CE8D4270B470B97D6C1108AB5DA425DB167F50A28AF6F3D1192F6C45D18E08BF242CBB6DDE74D766EBF694AA43ADD500DDF49699DEA26316083684208E039444DA22834ED2375390D185CF96833006840431223AE9FFDE0D6D2A54E0DCC59726CE79A1925304E2608C6DDC287286E9119EA9DC463AD7C91D32C35A366EF0AD4D5F3B4A87EAC3DBB4F4C2D6653F2769928230C282D39C2D14EB02E68E6ABD8EE821470B42A9F79554B54F6F3A6E60A375EA40969353B506D6A66D4C0BDBB8B1A12853CE31F79634D46C70CDB7D4C6B4969B8B4CC56E2133AD73E4FCAEA80EF87A7721466A87BB71FA4F7887F4DFC6CDB3A660565D77231C74E7D256ED7123E9E347286EFCB12320017BF27156EA360312C1187689A21E33C0DDAC7B6D96417082554E863B03A106B9D909763733E6324D4BFEB980D6C2C215C7BAE1DD06D6C6B44E8EFB4DE39DB6C5F866EFF6462F15CFDD880D9F5719B3909CE019DFEFDD58AF4F4FBE3FCB5AD4522A5E54F474FF715356C675DC9DBE08827278725058D4CDB66FE036BA89792D753052337850094E2DA653AF3C81A2EF83DCD84DF1D69357DC1497DC986E7F32BC31AE1E29BD39AE196E9B4654C3B25943FB93D135346D866B68DA26AEA1D40B131652FFCE7835A5FAB15C52F99BB97952553AB8AB13AC0EDAB68F99ED632E2284660193DD58EE941B3C26595A4EAC6097B94C23C9576EC2485BC84AF6AA75C8E801DCE43A75D036F5734D075A6E82E98B9C0D2D29A4AB3CA14324C833382F78BF3EEDD43EC0E05249D540375D65A6AB7A84F3ADAFDCE4762F940A68709ABD3E0306B153C23DA0AC3E4BD320964C173EBE096DD5B8EB8E7CB91EB84D439969A8823808FE9540669FC5983165A9508391D44747C846D3F8DCA8C3EA1BE8B212BF5B7D218E1901C49E542B02879211B2C8946CD8DC6054D22ECA8502EBA06DFA6B516F90127E4CA7B889352D12D05AE61E908915E706131D9A0445A63B0D7764FFC628795C06930B336F747F7263D89AEDB98EBC7E4A1772266FC2FA2520669EA10BE397922C87A77703A0DB16B2E273F9EA33B6CCE7FC89E423DC75EF543807CFEA867E415F50E20D8393B2AD6FA5C6C794BC21EA933CC3F97A8941F9A5B4B5DFF1C037FD64AC9F9E5112EAF65E47A935E564BCE7EF14C90268162D345FB2F340303DA37A2B8A4B1735187BA0A2AF6A544F54C8C6E8725A86035D3D53D187EA55E36E658026198615EDB65A402A542BAACEB3162B6C87A21093F98F21D62CFCAE03B909BF99F053722D633C3044B42159C67EC0BB52A52D631605FA9B25AEB0E42FBA17179D6139F672483CE2D9F712CEFD59E1F4DFE8C0DE625CE21375D896F8543D6C8B7CB20EDF229F0EA4697C0EF6DDC29CC756984662360F0AA1573C743F7986B15714F5237D88E4BE29C6DE11F54B2DBAB1C5416515F8A2D64AACA33D8C63FCC2FC3DD746D210F2662B99D94A8C26CB3DE9B78CA1748230A790338C4F7E852E8329A0EAC92B0E1086F874C251554ADC2BAA1CEF18B6E00525D033A60C2424A52A6B8955555B95571C07B4F7CC06383F5295E5FBFB6FDB1417DF8384222ACFABDC6D543CEC6DAB5AF6B0D7FBFBEBCD878DBA1792BD0A55870F9DD2189E283917D0ABB8C849196EF78B26CD204B8C80BE751F780DB2DEC1B437E304BE52BF867D2B6A9F10129C407640DB49D0C84950C3E1238741FC30DD799030D6D3BDF3164F3B5E3FF5A6C164EA4D83ABD32C8E263E37BDED3C6BD2DED7926F3BD252A1DA8EB4FC152482F0313E07D4EDA5139FFF489A443D0C316CDA6159CB98DD66F934FBB2E332457EA87CC2240AC69E967483AC4859D2E244E367A5425FAFD9458A734FD03BA89B701B164A1C7BF2D6118B97B2EFFF65C4C55E4759899835BA9BDDCD0F9A5B21EE37D61EF84DF0B65D558567DB551D8AFB9F09C1212A795194F72692319CD05F93E84EF0F7856846F559868106FA7DA89CA2944A269DCAC7FBF7C262B5B09B108214761B0F18A2F8170105156EC82E752210FF881342D5054A725113A0244429884757CAFDD2508BB00FD2E2E07B7E822965703AC551529820EFAB0871122D2E4EC98D51E9C3438F734619AA4997CFE87A867F54516E0D138CFC54C170FD81965C378650CE85924579E34443922CC39986E432994CF9AB6B60D301F718B0CA60D95A861C678A7104E30C38CEF173594F36A165F94D46F3553059A38F9BFF379C61B011723FB1DB6C47584D8543CB6DFE186D643ACBEEBA0ABADBECBEFD42D897E6BC0C8610A51DA3187005F7133DE735A32772208F4B6BF6F9E740C57496E54005FDD762FF357388411231F73E00F1AE38193916DC4F4638AF193DD1D3E091E93D8EE168FF9E878214CB72A28244369CD882B82E96347776F9DF2CC594467E30377C49B6BCA467ACA2D2FA19D3629BE67F3391310D376A01DB85776AD57C2EC4882BDFABCB3A3316BCD71F3FC277D5531093786E80E5C2FC269BCBB2BC26A3F9DAF84C9097923BA6A89FE193218B68BCC18B23E6CCBE80EEEBCFECC20AB0FF5DACB8B3A9747569166559BD36AAB03F7E8421AB84E149CC38C0726155289BCBB25C27A3F9DA5461827B39B8061CD01F3FC2676CE8443E1B60B9309FC9E6B22C9FC968BE1A3E6BAF7A1C511C1DCD0E7815BF51F11B37DCD6E7556153F09D7CB8479F77841A0BF1E208958CF8B18171BC2C4F9222A5DF096626BCC88F55F06033CC92F704E8729EE386F9E335D56A97E13115354CB0B7BFBD0A6567A9E7CC55DC74ED66AED896D469175767EBD6644F05330D50B2C726FC268E56B05B37D092DB2418E4CC260CF4C76BEA552FC36A6A9A98E0EFFDFA928C0628BFA367484CD88C1FAB60B26698258B09D0E50CC60DF3C75EAAD52EC35C2A6A98606F7F7B158C55DE2E6B1F62356180C12F2C996CC40F55E01861B5EE19595F3EA97E5E0BB39C94FE2673687F730D0110D923DE06110AED8BDED27048EF1713A322BA67C12F942BA599D2B23112CDF73099C835E54AC99E64B7E40EB3009D5B8EBC92709D664A97E3C8B506EF344B313D3253FDF622BC793567676393BB3CABAEF6044DF6B89E865DB42FED49D3DDCBABBF9372EA65CFF42DBC716BA6B20CCF69E86D3281F675CF4BEBC4E12B0C06FA48F124835409D54FD54CCADD93BFE8A0C1B358D69E9402CB6A3A29716CD45BF772C2A5195028FE64C01BEA4A5052F6E8CAFC4DE244652D293DB6C5F851458D65595245251BAE1CD43FBA1AC6B4705ED475BEAC18D3D03454560ABB90CFA29ACF8518F1FABD95EA6239FD4D4E7F01B37A125D6B59A54AA816F14F02EB8211A4BE89CFF30AFBFD67982BEF2FDDDF7557DA357790041E54C1D5C2B380D3AA4CDDF49A31E3505B2B5406AEED3486535F10D500AB47D8416CEE3C8FC16DC699531325CF18850AD0C22073B8FCED1D1D787EEC142C064C210CB6C76386C08AFEA50FAE257E39C21CE20956D58274309B31E650AB4C4A1DCC6A8439C42A674E07B11A610E91B06A2F7A90F5907198E4083218B152AD0961672A32A0FC1883990AF95BD2C90AA3EC21EB254235D888D65151AA047662AE20756FC438C408D1CD24AF0AFCAAA18AA30CBE619B28A304CB0DB19B6DA579C7E7DB8CB398B10EB430C8002E3A243B14C77AB8FC20736ED081E5C78C432D1301CA3C80FAB772C0926116729282332B933D2220ED28F36FA7FF68565CA093616190C5DA4DD5839D66E8276E8D80B5D1EAFD886D198FD4E97761B021B7695444BFDF069A96C49261A6B075B2361C310EB1CB199041EB7ACD2169572D0CB280DB651C682177C32C602BD96A38621C22CE0E2029AB0FCBA075BDE690B4E69C30681C6EE529AA0076BD93E4D358364DE0EF40F858A4EA6FD3EF37D9B743E618031503F5FB6DA00511648515C780B6C3CCFD3EE5C20703C6E1256DF97A39B87EBFC1DE0462B61CE5E4FAFD16967B7508A0B5DCAB2196308D1CC3E14803CE6CDE7795B265D3390E877F094D068E1F63BEFE2E70A85B7B37CA1EB2117185C1169A852B36AE552EDCD8712CFDEAC632C8FD7EF3390F8AB8EA263C18C8C1EF8502352130BACADE4055108CF0414DB30A93ED1287313C21E0695452520A4CC5100FC3D59B5166AC04A29C525685135527DD63A513878BD745016D31C8C96B100F9C45E2E10AB4745557FA532D555AEB4FBA3E53E2498BFB997F9369B46A58BC8DB73573D60A2C3FDA48D6B81FB911601EA8966E6E49C6974FD3934C5B6C4DB53A55B935B99A521C759802D7EA40B7A4E3EB7FE949A7AD16A65A9DAA5E989C74AA80B82974FDFE31726CE08894465BADBECCD5F8724D36DF19D434DA8EC78E47DCD0D34CACF5D59946176C26D893E97901D11E940BD2D34E5D5948B530696D2139CD64875146602FA1068793B6623849CEAF315B0C527E3DB1DE20BBD7FC53CD23ECA0508B9E9EEA9A2EAA254AABBAC85726F3848DC02EC8848362237A5AA9EB92A81625AD4C22A795EC0CD508EC12B45215CC50D0CBA8BE86B0B8B10A1BDC0247CE5E8DC12BE86778F23A899E42B107391DF53521F8052AAB420C17A63ADF1A0527A7D3D8E9D63C7E3367356B2E3367300BDE32672BC71C25B9742F27D8D8ED7C7E699AFBF9C395A94FDF0C40CA89357EF6368956C2BD7139A5F4D7CBF945292F980F97A43AA91B0527A7D0D839DD3CFA0CAF3F8F504973575AB938F96DE99914935F8F56D04D790A39CBA690DDDFD59B16A3377E55A680EECEAFDCD0D09CEED9205930D224BB7C6A4E4E2B834D7761D50B392F60F12A6F4E5AD3D4C2F91ABD72E995BA8B7A61B2CB7EFAF0BBF25AA02A562EBB18280F954B4EC54C802E28DDC34B6B7A1ED45C7053B183FC8A9B9C07A447D76680F5CCA53DB89E453DE1C6959E80FA0B5AAAA52AAF68C957AB3AAA3606AF27E6D841B51B7A9A6D34FA7B45A30B36DB6226D3D3F5E6D2BC9ED85E7269FB3E3C7C0E8FF004EA860F0F744808D3BC00F12F388231693A7E01694AB533E97E59B7DC7D4E4148D7F1E3BF7EBEBF7B3DC509F9787FCCF3F4878707528226EF4E28CC30C1FBFC5D884F0F20C20FDF7EF3CD9F1EDEBF7F3855301EC20143F357725A4C39CEA81EE37A296A3AD39F5146F29F400E7680BD1DF963741286750DEC4A8F22E1A0C1A5BCB5237EC92605A1F929FB77F573DD4BB23FEDEA99C86EFD70483A6A532007962F5BD202EACFD3042014CCE790A50FFD2ABEF8FA238E8B53A2BE06A6FE75BB117350FAED16D0C039A07F23CC43EBB5DB41CBE0538132586519F320079DE6708F7973F0DF07D8B59A43CA605E644910956AA20F6CD061B762C9D47ACDE6B0129C2BC00D7BCC21EE8BAFEC92DE1058DB680EA77D8AB60FA76D3487D3BD46DB07D4B58A903E3C7092C8EB83074121705A9A5735968AC8AB029AA578965238CD6BED03862C64F9B93A28ECB9E70CB0A0BC049CD069313BC0B353D562C594192444E0C9AAD11CCEAE2074E323242812C4A93EAECB1C664E596B08AA6A99407752EC2A33464AF8B6D71C327E490290413084D8B55ACCB1CED20EC4E5725D13D69DD6D77524B0E54326E0A8D2D73418FA03A6C2D781B6815ACD2582241C42ECB74FF876A220725D1360A6479CA880D67D76D42CBF36CC084E446AF6FBECA1E63096832C3B26AC5DAA96C45E7BC31180901A610431BF2538C1FC28D87EBA8133F189869766D8142D870E3224B2FE29BA4462290B9D13E04610443112585DEC9E009BFD43B0C5C55E8BFD32641E2BA07EAB947B24DD56E634B37AA8D06427C1A2EEF558CC368EE5A234E8B098610C9220C73988FB11540EB67290BDF488E6F2B0C7C21940308EB889366D13F88A5AA4B18A61EB3EFBD5EE8AA88CC0C8D6DBF44D92AF1413DE28137B2768E9109F52909C155ABAED35875C07A59812EC527E4E690C7328D16BE3A327610E8F307CD4A3EB0FB1B06729CF0628C971B0A7942F0F1407C6ADD86D0E1BB175973A82922214E45DD23D03769031328C60680659E02101A1BF21FB33D3CC11AA6EB10D90484758B8F2F58F593CA10540FF15719F5A37CE1CDB530162EAB952AD4D38E91BF64C9069101E117CAEE85D5D9D2415532AA45C33DEEAFB1CC1330C608A76383E0B9F66D869B3EF917A36F2FD5AD66F0E3D0684EA8563081F25DB89D069B3A32474173D2B41CBFA2D3815E674170962F0420A5E77F37DD650C5C90E3A6CE489FE08ECA95912C02492E84CE98049F0B5B06DE1D24D0F643993864F9C0137ECB1F22B5114B4F276A2EE192720F2115656C2334A42D11EAA5B2DB408553D9C9E285B6CF450910830EA362B7D82920017BD53264EA3F0DD3633AC0D0125CBCB474CF1BA1867CBE08BFD13A067303C878A0548874CF1ECD001E2E488F5688451132C463E183BE8B0B798FBD5EF6556B3AE3AFE3874C67A6318F831F658480EF28277A1B83E7BA8522B50E8B4B08F290F37F79B074671AFDD0E5A0463F40CB3B384E524DDDB718DC9B9719DECE0F5D8588EC3EED45805630D87C665EAA818EFED355BC24A417E94C0AA9A2D6191B2208D008B48EAD48CC22A6B910AA0CA560B4B8B1D89240517CFEA5A2DBE22468263503559AE4B3CA9E8356F7A46A767D4F9870E148C02B8996651FED88F4A29ABF98B71835EB3455606B3A8F8E9B48D967044E6EE355BAE4F5472BD663BF79E7E7221C7A669B572077957B86CB110B6679003EEFCBD69B3C9A301B1843ABD668BA0208CA1E4A4AFD76C61569DCAAA540353EA242954A58341BD2E50447CC8A16BB58214633E22D5365A7CF56247F90425D4C7E7ECD9618FB54140F24C6A1094ED7649183FE30C4521E0999CEB3287796065C7B9D9356D365B261F784CA5976DD5105E5E03FA7722A8A77EFBB6651A6C99AAAA39EEF64D2906ABCD5301C1CF0E5A6E4B121D8A2798D12E773E76C470E64F4FEAB68DD34D395D5972CB31BFCBF1D873BD0A8E47DE7760F125E05922425DAB4D5A4379C225CAD0A063E37F93204CF3BE82D7288C02895D184609640D71185564765A3496122D3E4B0E99FAED97CE13A93F97444A873D97CEB17493335D515E32B14187CD991F0933948A4905838ECBE67EBE65B5C91580F3AA3DF5B8EC94E8182CBFBAB4C5AE52AA83011661892315584968BADF6E912D9FA1034B879000E4BA6C8230E26994FD49D426715D8DC08544CEC1F9D128B0750ADD76B4B489EE9D95E82E23B36E84759D6E46FBABE679702948D5DBE16AB812CFC0DA2190A4E14E48BA6D12A178A2F73B2E686637695A9A0CAE2D45A4E936884EC8ABF1B80C4D483058C625A410D6A02DAE45AAE577AAA65CA5722DCFA5AA54C56E84CE4DA64D64BA7E30CAAB54CB71D8C9B50A861FC9761B2074AB271069CB640DF75CE57B186A586F99F3CBE2D15EF95E86C18EEBE510D6B09B7577BA42219380EFB3E0B32C477B1422104BC00A9D9B1C98C8415918DCAB1CC830D8C9811CC21AE4C0ED4E926720925D67EDB7DB42931DB90C7B2C20CE2FBBD216CC1DB86B8A32BA3A48654ADD49BC4CD56FB7C88F638F7B47282F3258FA185C9A87A4DBC64E4E0E5F1039A22F080896F2A0CB42A31D6192CA61725D363071C17E93A127C483ECF758F00B2E22B407C981CE86E39B418F3944EAA31C1E0B3A13BE7AD7A0C3C62B03C92B82E292071D16314C88CE98CE049E0A2E8CD9EF3087B703F81501CACD28A3BF1E82E4FB2C64A7F87AAC687FC6DC3CB92E8BBC443A871C24F53A0F05E5400EB47C840586F217BBE2C47FFB418739BC3393101C02F452480549D66FF1E520FACA53A069B390C93C7BCFC962D96205E15B01C2B7963BE6896ED062466CDDBAD96126761861E68F5F434C8AC2CE12538058911BEE2875FB2DB22A39820C46A5AD43A0ACB6B3035ED5E33063D631186B701C50426D54FE08B66DB43904E1FD645BE7780763B631637EAB6A5A3799D1AA77FE1D293F1A7E048BA1921F85E24BCF136A281C45DE187498C3A33F38D1A586D4D1E14CE2618F1544999F7C9C527995F95F4F7412828B32E8B071798A723D47807997A7D7613F3F9981CAF7595D8EA0667804F82FD26FB7B9D8553F0B2668937EC7A574F713750522F62105AF71D863131641075C48BD3CAECB8AA71D1507DF17CCB3A61E31169D24BECF8A63BE943FE333967BEDE6D0EA9F04524F4EE8B49AE519242C0022CCB26DB77039AB9FC86729745ACDF2052652E96BDBAD69290DDCF07D36A191440809346D4BBBD5FB18B0C76A88E0D50E3A36CBC7C6F2F19B2B6A866C9A1DB474AE68EF11476143E2FAB60C513F19A25BB98F7EFFA4A856591ABE7CB0D357504B89C138A6A581E02D4850E2AC4258327B93EFB60919ECB128E05DABCD2C91582D10D9950AA446C50BE48C83A6CDE2DC4D56CB154E28DFFA06653042198B6B8218128F723886C54C16C7A1F80C31CB03CCD35C485102873DF6102587D85C97C5C91E3E83383F4B0FC6875D36CE6972969F900D7BEC42109CA7426C4336826762E98E3C15AFC27A9AB64DEF688F09DA188C37A5A345617848A007B1A99B4DDD6CEA660DEAA66F3A5492E4DFD091E3B137755470FC681F5157D8EA08025F39DE620D567CE5E4CD3897A5EFD80718CEE76077E90692142704ED621844F8041027C5B27E9BF3DB2CC5197B6D57FC7A7C9F95AEA7BF2CEBF35417DFC572CF42FFA6858C8C1E9F2A680489A5E1B3299F4DF9E8A16FCA6725CA071D921D8A63BFCA478FC450F98C01B956E5E33643C0BDF7F654E05C8C2777ADB690C499F5DB2D3C5ED1F3B3F6F808CC9E598D32E9134F42E7E229D837E33D7EA5BBD7618700161357B8AE4D1D9B1C7EF9D4C67A1C760760CBEAE21AAB54F5751D16074D8ECB0C44F019C63815996DD061B1DEF26D6494844790F1D61EDFB7C9954EAECA1D88856B1BCEF5235AA368CCA4CB008C1F01EB104BCD81B6E73A4EAD6B83A79C95D21CEAF52E7B8AFD16C5ACCD31AADF8EF69CB1A5C062B8858D42F1B4898133754E9F0A9495950C382EE33BED93AFABB459658A78AFDB2A519C1C0B24CB136FDB2D5255D1BE902510F7DBCDA1BD4005B841C7A5DC3549229E75FE9D5872D4B6E028632BFA37E25F8EEFB7DB418B602E3CFBD26FB7832679721DD83FC287087B955278F4A7D7BC696F9340B4DF08F4BCD0F3525AFA5C961010F49365BA7BF58B20A6DE745C6041274BBAA7C29666D42B8658B8F5E8EB113DD5F50F386AF07D9B6C191DF2F84C651F416279C8B36CEABAEB7B595BD2FA26927766CECA52174C5CDD2DD9AE956C12FAD624D4BB68CE96C9A58471BBA22E76D8CF6FBBA2BE5D513783B45D51DFAEA873A45CF91575924256EB96D32D4DE3669298D45C630605EDA01C9B05313EF8ADBE3682CCF8C8DE0C981FB3A5A9BC261AFCC31E8BC07F6F21FCDCF83E8B14CDD985685D6715BC4531ABB3CFBCDD0253C3B738A15FF4FE578551718C2E74DA1B878C39E5E661D5B3ECE179B520B15C75BFDD62F3A5DF0F1D92208538E55F4AE1FB2C82E390FA32829FD3B59A4362E56BCF88D914D4B0A8ADC92154F9081B13E905241297B1DF6E61B01F018A9FF7FC1DFD5EB34DE620B5A0E96A0468838EC54DA437AD73BD864347D1D86AE08583A13DC48A9C69FB2CA92D14BA09E79D8170FA4C0BD661B011C9B55DCF70F47038E51A9979D16FB78016EC40F858A47B04638E3C5C97C5C6A886B99B0A3354C30CA7C2BC9D4B11AFA780E4202FB84B6ABDE64DE7E9741EC8C2237AF6552E5C05DD4CD7A97F7DAD7ACED51D569C1D4082BE82F29625BF28A1D3E614A07AA9478039E8B089E3C21D1F5D6FDAECC356F2C22BB6C1A5EB7D21F32DEB17AFEECE08123B6DB3B0ABD3A2E5C10C3A6EC4CD49A3BD125EDBB576D729C22F093BD5E77446DBBA290C2385D1BE2AE75765A8D0582A0D35183F6A2377F01E356D8B0394447CE18E7EBBCD1D838C12494C80E89A2D661603428218098FA3F4DAADA18133EF820E3A2CE0C92EBA4FB8E04E200E24DFB1D76C07EB119E29B7474404D7F5D841545A4042E7A6D48C949AB7636C1D064B55B6E081B56BE367FEC1324E7398014A1DCEE7EA9A97D5D128E5E89BDAFCBA2AD03384D0B46D12AB93D8DAC9F614075641379354F5AFFD48A9D39D1D4742A5AAC8CE6AB96ADBC085CC936227B50BBA66FB888F3CDC33214A230DD1587193589BCDBA2EDB09EF104F9EA6CDC2E5039CE15B3698FF9E2A52FE7A6EDDB47CC4F00848C00AEF73B9B86DAB1DA408C6904F0BE9B76F31B44BEC45C1099647665EB7240512BB9D4909C4CF06E53680DC2E421178B7CDFE7A8B2C1B1624C7275FBCAA826EC6A4EA5F5FEBB1929BEDCEC57695C3585E5BD5BEB4AAA38DEFE9893B427EDA64F34E2B9BA998A4BE586ABDB3B4FA753E1BDDFE2A872735C8A6F3521BA03B9FC155A4B4FEF041F9E5659710EA1E9B645D5008E672DBB829109D02A9928EFCC532D5F0CDD485EEF77EB4843B89897692C3DBB6F182C7C02E8F591D1D296FBE25DF3FE57996909109F83A6755C3379365DDEFDF42B4D3453CD1B59C5C7704169120CFA078E5BB6ADCB4819936688A0C7A560A0A34B6BA4109C68F8AE821E601715D6B53152E8F1E5CAB1DC4E2CF7B50C482D5DEB55B418B71F82880AA1A3735A153138D5BE9CD03D02030530D5A007E944241240E78DB680947B4DC7BCD164C552A23C94BE9838EA5F3092AA2A4324A596537BC45D14BC0333A94A9FF7E244F0DDF4CF074BFBF7E7B9DCE5E222C5DEB9241FF6BDBCE51481546917127085DAB39A418258F22A4AE75F94DDC8D5E73AD6DE942C899088B2BDB362DA9AD04CCE67FF6679FA8E19B6949DDEFDFF2394645178E55EB360B2847B8E34B19366DE6505839902FE80BFF6463AFD9C215128AACD89657D9629D7CFFF4834FF6269DBF77BFD428EC0E3B1520BCA98767948825859A568B38065D0A17C7285B6C22214522C0A8DBEC8F4445436C6A2DB4F2834898BDDF6E0B4D73C142E8DE84DB58B8FDD61A37C03441D497AE373EC0ADDAC3BBDE0B1E3D6E85760CE0AC495677280A31F1546F5C01DC307540F5633F4248D14924A56BB583441B12090F705D1689B03BC52BC8830E0B560F84CCC1BAC90646FEC29BF65593158CA37042D836DAC0D90BF9484D9B85B943FF8D0EACE2B8401DAE6B0A4C815A5CD7249822F584CE2970456AF27D16EA304DE373B0E7E7D96BB693ADE61D6B01A2D06911E1CBC0338C4590FD760B6EAC8A4B23928B10F93EABB5B372F3D275771D166BC639888352C70ED7DC6BDF364FDDE6B987718C5FC811A5FEF6503D0EB3AD740C869F1D952D48B263F59A2D61896CD16BB6704721CC29C1328C4F12EE177B6D62D729A0722D021D74D844B1437C3AE1A8AA2F258295F5DBC8FF8E01085E5002A56A40E8B6D2A70949A9F4ABA62E1D60ADAFA570BB0E8B0823DACBBE5BAFD9C256CB8F30231268838E4D4F2F1F908084CE8D457BBD06235458EC02116A286B389570F71E4D4387A87B7C4A1405E5A02978D0298DCBE7A855BA6B64A885A62872428DE950B624BECFE64B4276AA05652A88EFB3D042E035C884B393AED582D2AFD40466D4A39B2C21C1096407FE64473164D372365A6E91C8EB08B2693AEF42F1D716BD4A070E066C51D82D0AEBFC1E28848FF139A0EE025DAFA742C066B8EC04770CD61A4C1696F5F8499233FAC93277DCCD354BFAB1601205924AE3C31E8BF5A52CD1412212838E4D4E75725A93CA5B32931ABE993CEA7EEF4706DD3C2750C91991099F55829DB372906F90B71BADC96EEF0475C6A5D70D4883C86EF7D102DAB69E6DEB598978369D4C56004A60C60F69B1D72DEDDFA4696052020EF0171CC19874BFFB1C1EA97894AB262908E9227FA4237E4619C97F0239D80102AB21F777BFB244B308661FEF7F397F7E8ADFB1FE77E53F7F8C51C949CD885F4082F6D425FA1D3FC2E4E3FDF7EFFEC7FDDD9F630408D50530DEDFDFBD9EE284FC50D5F8014982AB28090B03E5E90F0F0FA4C448DE9D5048BD7CBCCFDF85F8F40022FCF0ED37EFBF7B78FFFE0146A707FEE735582328DFFCA981424834B892D8D364A206CC600851CA9D937CF84F78E63F76C34EBFC1FD9D4A8B7C78E07FF841A289D844E8BF18794B45F71F3061454EA942A5AE30CC28D13E45B09CF2FDDDDF8B3806BB98B9572026029BF2E0FB2AA98786A7EB0F9F5895E98FF7FFABFCD90F779FFE67D0FDF20F77FFC8E817FFE1EE9BBBFF6D3F01700EE8DF08B713887172C84BB7B0039567625C500629834F05CACAA0DB5C705D38B28213C190BAF731E370FA2F52F2EAFB3FD22F427507EDFECE7AE519CC8B2CA9DF6FAC71D07F57CAA587E49B4934F53B77CA17FE91EC8BF2FDC8B91FB255FD3DFEB69C49A7F4677CA7BEF637543637A2641A93BF42913CB3A2D180FEFD0B78FD1BA41FF548F7876F6C3F2BB35D32C0B29B06D0A77249156AD3CC906E18B630DB2A69F3A6B62B08DDEF09098A04CD566BD5DD263F5F821465BED9DC29B207384006C15C384DFDC0A0BFE6C9C09A4552D18C0AE657B8045A2A520F205B85858B1DBB456829B8D5B4AA378F1D7D8BBE9CCD065617339C4FB1F2C3C28CE0D9BB4D032D87B1B3653AD2238DC5064048AD2482CA53C913CC8F0E6C2F19680F964DA76AD833D53E11B8B1495B70DDB3667EA6DB7AF2F3E60BC210A6394842E88A31C09919E3541CB2D3ECC9C5B13351884112542932BD5A9564A6BA6C434E734D45892DCCA22AB397DDB24B7DA9DC8DD0EF8AE8005BD61B7103BE9DCEE3114C31E92CA0891FA9D5AA213EA52039CFA5427DECCB145E43100699D55F1F282807F0C3230C1F9D00651C19505B1F077B4AD9B2F4E13C806DAE0B2342E8404205802C9304E1D9604940281CB23F339519A12A6834D3C1AC01328FB8051A5455A1E6417E2A404C1D2EAA3DC96CD5DE8A11088F083E57B4AD2A70928AB31CD0F6089E610053B4C3F16C964A5955B98AE51DED6E7199667B0CE1E340454F05B74709DD92CE0E21129853BD1CC4E08514F35DBD1A9A938951DD1D803DDDC50316E377A1827A205D80A39B03C872C6D49F661B2DD4ED4151D00ACC893A19676FDB5BDADEDD9E29DF656466AE8EA86E6FCFD603280970D185B1664FABDE4F251CEDDCB160FCED130105720E3D2F224507889323F684A6B1A0E605551B6BA95FFB7CDA11440761DE51440D8E71AE62521321364FDCBBB1B71D59588CD19BDA49F321453046CF303BBBD96ED61BB29766A7AE36727FF1E3C15E1AAC2E36FFFDF7F6C65B9B135B017609B7CA8F9DCEBC5D66AC666ED671FAEE65EB191A0DA3CE0E9FBCB4D14308FBC5AD5165348FF2DD86AE280B83BAF07A3366B7D86B9CFA67B3D44D09A3CF9D53F8A85701562DBEEFED8F139943CC5E87760C963A628E150D780639D09FF74ED0AC1904F1F856607F7C99C3180E0E926460BFB3065B3FD9E5122475ACEA776F2AA8458E92F3140E6D2B6F4E677252EC282BA284EA0E57862DC99D9CE2FF8C331485A09313473BCC819AB9F3F30C523C3F94F7F25AD58941B3231D2BDE354B7D7F235B67B9ED78D83184ED6C8EC628CBD9CE04B3767EABB32A6E88EB2E6367B14ADD1EF87D50BF590DD9DE465823DFB61E78F28C51782B4CAB884858427113DEAB8A54F9CC4271724E5F33C0B8D73D23F5CF2613D8FE8CC44D8A67F5B9FCCE745008F68A52E6D6ACC06290442C4C1D8078579C6E4C8FB58B9B1E62ED8198B529E7472A663E62A2D4213BB0B3721FB08727180AB5F6A6F6FB4E5C6EF124E28AE4653B9B701732BC0581BB3149BBDC9540FE5D9289B3A87E3E6F4BECDBDF8E6CE6411EE3C42456449A9C98963C3B8CE38B9AAB4D928E9D0CDEBA72605CB82906378A615C1A275CD273218E9E6E773894CE5219BA897AAC591A4FB00C24DC863CBACD519B070591269961CE76B466D6128B67AF96B12EAEE8BBCB1F61EFB8D479B00E6439DA235670DF2F9E35B335FDD8377E74B01C5BBB51D8790622E8E3D4A102EC26D6EEE3AC81AEF2D0BBAAE6CA1D63694536573CEC0B99B082C5EC5A5891C1D21F989D304325E0F0059123FA8240E2980BC81126A937D8B8606033F4845C332F2E22B407C981CE7C2E79A9297F782CE834E7179FC9E96A5F11F4B0E03D44673AA947782A1C4BC40EE05704A844A08C22989DCD597C3D569FE58C8BB9C0D8A3AE3948EAB51F0ACAA7F361965076C569FED73E33A1C121402F851F01DA41F475FE8A499EBD7700E35B07797F276A5ECCDE6CD66C5F1166E4DC8881E5D42175900DBA46BE20547FC3A8B418082437C2188E620C0935D3BA43B1E9816A8FAEDE0E96D39A5DA7608DACDBBDAE72447174BC9568C809100AE138F7735000276A5786D4BC3E680DB60931EC235F05CF9125C87C8127F6DE59671A49214F48D58C515192E208B06BD0CDACDD184B8804D4428C40F7D5A6673F17691AA32B89D83E51EB943D0CE9C135A106F001178EFC07CB3AACF62A7B5F305F8F3A6AB86FB0CF60972F2528389B5D6A38811F57824EF40C12E691CF9E680DC7DF445F60E244006B8A3A0A13ECA989365FBFB8D152FB181C826AA77A7B27309CDD7163896FCDEA440BC424723DF8F596EE7625E96EDB2DF84124A42CA88B923DBE1599AD9754054466BBBD7B3C2E7613AE936728740E946ED32F70F6CE0A1D15E65BA134442863C1AFF215CE1B92884A12DCF83D7E84A14E10F27A1098E13388F3B3672C2148CE9ECE1F483F7A31592CE79BDE4FC5AB035F6D8DFAA18B216CCA61530E9B72D89483C278A884EA4634840FA926F0D5B1F7E5A838BD5090C855609CF183DB15D3E5A6382188FE2088F00920FD39C184AF14E22CC58C8B9C5C83A69A9C3D42CC8A44541747677FAC35AA89D686D874C4A623361DB1E908998E40876487E278D311CB1CC7FAF45F9E0A9CCF8D4256307CCCCEAFBF4360F6CC8ADF387A42C25102E64D794A5FE93E74D821803DA412AC51750EA3FF37A239EB45F95000926BAEEE403FC318A71E1E4148CBD70251C266396A32BD8973BC72876051C946006E84F3BB75CDDEE1DD1D0AD6E642392D37466FEF3070BB00D9CF2AA99F30BC116E76FC4A7A936B5925D139B83015A3821C0BD44B0B9D7E19675F784E1D7C81FE71B8712F66A72FF7ABAC4DCA2C638C973A795495418A60DE2BAF3E079207DB0011F6CA53AF52FF9BAA97DC44176F44619ECB5BA5AE0DBC0A6A1053F72B2EB087FCFA21022EE3D51592AFD419464FF56DD9F90EED8A99FDB6724E5517150C124E7B3FDDB24DAF24DB748D82D54F5CBE29D9DAF2B93709BB3609BB11D1DAAE58F2AEF476C572BB62B95DB15483DAAE583613DDAE588EAA9614B25281B38260ABB4136A5DF882B347AACC281766418C0F37623334356B5C1CA2F42934B3C6DFD9C19B6D0ECB07AF916FEBAC97DBB926512DC8E5F161C058C4EDD1E1B402DAD5D23CD4B4DCD34F800E4990429CCE7F49EB2BA466BA83432E56C68E8A34DD21E936599B45332988C80B48069ECFA40D8A3A07287EDE775738274E87EEB720A1AB9A0FC9D1E6BD6A05765B11B0DEBAEC0360831F6FF1AF2DFE3553BC6E2A496F9C9BED433D0651AF29D70CE8D71EEEC9CE20073B103E16E91EC138724D8C9D4FE0A14FE0B79572FC7A0A08DD228A3779358331047ABE99E2A02E3C6F47B7AA70760009FA5ADA1E6AAEB029563FC1C2E9FD74967DF305C11D9A4D5937357DAFFF81A4352B82DB720FDA55D98B4EEFA76FD03548A3FD00B6D3495FA7DF11E197849DCBCE99D9AA25BF7D14E536647FFC85BF091E4108E238404C59383EBB4F41C6DEA89AC73B610C080962D4152577F588750D199C3BF76DD204DDDC9C241007060F38DAAB2706F8119E5F7016111FB08DAFA74D00BF66D5733B67802A8B63C6A1DD640F24CDD9AAF0FC07B8FAA23639D3229D0BA1AAA0F0168DF3DA97BC95D0A29BBD0E475067004E78144ED83DAF6BF3F4F1803829767E76524F2FEC712FC3BA32BEFAD56FDC781327BC43B163987BF0EA162055A8DDC53737A4E4A267AEECCF232001ABE43B3B9185018A207B5CDE474E8CABE5AE7993DA1EC6560683E7A6DAAC912DAA50DBCDF0C368248F0B2A9831D960B370542B6DA0DC1D6D94398CC72BC5F9D93426D8204F4F8E49BA46F94BC594DB1B11C5F4D26F70B76072789A338BEAE73E9E03379845F7CB5913E0EDFDE92F2A3A8910D6DC1E94EC3E371B12143DCBF3CDE4EA57092437149AE359D4CDDE15ED06A77B6E809A1D1A4E84EBE4F86DF4707082D7B33954E76105F6909102DCCC89DC22713F7BABCE475CCD232B5F7B98129120CFE0FCF0CABA45B6A92A751B92DB5B9767E9B5F7F2FC1C041BC5C5AF6B8F432CB2B907453C3F4A8AD8916CF8F82665B871886EC7F02DC824CFB0FED92CB7B08431661F4FC9CC2FF5D1E0D94B479087A7CCAEF44945CB5437D7EFDE84519B8067742839EE4684CB89514BA932CACBF646A87BBFD44B4E9DD95E3B01300AA98A2832ED09E704598E51F2E801ACAB3DD740814D302E0C15EE34B3859CC99B3435088899497D3B96862224EF30AE6ECB152585DB0FEABC18F911EEBA8A58CEC1B3BBFD5FD097EE9523E7183C944978E317691AE6658FC5DC4CC25E869F51D255E6987CB853229F7B405424F3A1B82CD5537EE90193CD83B409502740B7751D6DB8B4E927C6CDEFDFE0C5B4EBBC3BB64639DBA128C4E456EAB5D2D53851E60C0E6D489CE873BC13DEE19BACC9835EDAD57420F9CBECB750289063EF7C673A987D2F3763B23540FF8D0EAC48AB03F274C01C90A907CC05B93A702EC806D2343E07FB6E5ACE1D0B2647CD7B893EF1E4197886B1571475B14E4472DF1463057EFD528BDA167150AA7D6FD45AE156B887718C5FC811A537B423B2143867A5489D6C8727483F6372C8303EF9E5C10CA6804AAB571C200CF1E984A3AAC08B575439DE316CC10B4AA0674C1948087BB17A8955559ADB2B8E03DA7B66039C1F61467C7FFF4D6B6B02059050342C8E791B7A5B11435F2EADDD7B09FFE68345DDBB215E99BBC3874E695CBE55B9807EC3454EA8A91E7A5E5C9A41768E047DEB20F01A64BDC382A936007CA5D634FB14D40C20243881EC80DE7498B361CEDB8C74B6AB9BAECD7A20B678E716EF9C2D702F103EC6ECE16266E7DE4AE14B3707EF2C4BEDD3CCFC5E27D7B7E84F60120583EAB553611529632D1F6FF3AE510A6A6ADC4ECAC9B0A6F4642629397F76D15757F5CD56C8588D0662B71E823A07ED36386CD3ADEA45BD59DDFA674270884ADB559481CA94E76D8BBF26D1DD6F381E0C6DE6F619C6FB77FDE65F8A3847698C58CA0C75DD84B5CA80352E841C66DB3B04FD2F02682A8CEC6D9A1C81F8479C903C0394FAA2E4A224442988C52571430DC59C91BA05CAF7FC0453CAB3744ECA359B20ED0BB288BCC5C1699F31727C78E8F1C2288B348947195DC7F08F2AE6A2F9CAFDD1FC371EF659318F64121AE0CD085F4C3458C8329C34F6151488CBE1D7C04A6A922DC93F0A88B7C829EB608F46DB35FF974E7ECEA734DB940C7738E77CB1EC3664B5FFF48BB55C9A3BA8250451AA58C702264B8D5F65B3B4DDB765B434CB5A8BD5D2CC210649C43CBB00C4BBE26462E0B63F517DE1AE7F12FF0C673486A419E5999BBA452DCB56DC326DB8ABFDE975B199B123B51C9F697D2C61D8CD739ABDFB759DAC76A90D702ADFAE7D0BB462DC6BDA03CB5B8997E216865CC52955DF6D7149B9A6B57108AF5324AB70F375D7A662CC3FE7A5F54C73F3F8D2ACC4727A2EA66CFA09453CCF547DB7A56CC4E4EF3136B9020E49D8CBC397E210865CC52155DF6D7148B9A6D570489B5C79447174343B96E27E237C5CA1DF8E6FE4531AC3E2DF9BE297B5105B29D669C461CD6F8F97E53252A4F483C0CC84BB9AB1FCF7EEDAADB88943AD82EA9D7BDAE92FC335FCBA4CB0B6BFB90A8564A98B346A68BA061A573E4BEA9DE555CE3AB5CD53C1CC1D94ECB1090775A3F98FDCEFB1E21F61026AC8DEB9A7B7886598475C9B09DEDEAF2EC93ADC0BD75AC669C6F21FB76BB7621AFE716D0554EF0CD34E7F1976D1BE29AEC03A783FF3E2AC5266CF2BDE45967F61FE9101E11B770326B1902947BA671A051DBC738F11BA666E57E192F79EDAB954D6C5E0B91F85833E187253D918EAC78E1498AF2923A3CF3D978AEB5C0BF75C26CA63CB3D5711EC5173CFA58F1FAE8C992E71083199A32E7D0ED12B86BFF856D62FC4AF48572DBB6E63EB523E3BA0C0D816F5BFB4C6E9D76934CAD4A92AA32A3441DD3949D10C2A46EAE02F969D232902EB8D81A42BB451365D55CA4BB3147727DE88ABDA2A208A0FDFF54FE22DFE9AFE0896C5384C5EFCC43B9369AB168CF0D9A026C0D5B0DAA54CEDA97CBB7623DB8A7117B6B0AB2B7FF43739FD05CCEA49FC8823F833CA48FE13C8C10E10F1B20DFBD567982BB3ECEFEFBACB849A5CF7CFE1119E0005B06371EBEA6AA26C9CC05E2AFC5ABC63F82CF0B45A4FB7CC66CCC82A9B61E3C85BEB5286B5ED54A06BFB8DF1D477A434C8EA117A8CF5203BB4CDEDBB31E4CD3883293443CD3F324A9E310A15B310068D7CE6769C397E3E995F370D7EECC86CF8E15326652002C260E369190B8598DB673221E39958F14B193AD0324B39628C53CA41E6684FB02A0CA143DC8C1941DD0C33475EA5C7E950572346105783CCD15639573AB4D58811B4D52073B484555CD0E3AD878C20AE478D63264790C18815134B083BFC90A1E6C72870F3C30C962D244149572E8C522D5E18683F05BDDA510D369C909DDA898A52ADB393750543F446A8F9A137681C6D84A851945765F0D4A8C5510AF4E240038E6C336C94F8B9212A7E1C8EB25B7CB5B38F2FBF1967408066A8050974B310068D91C1023F3A243B14C77AFCFC20157E7E9C39F3EBD0F3634604C01C799965512659D4BF95E3970C534C4132D2422FA5E0CCEA6C8E28A476D498266A079A73A19EFD46F9CE8AE175DA571834C6F016DA5692AAA6A5B785EEB753FBFD7CBC911998A0B6313EFA275EE57980CE0C11068F1824C2784341D4EC02FD7E9DE819EB7F49C6991EEF180F48469ACE42A7FA8623B4B8CDD55E97FF2243D9F52AD07503CC5169A92C0C1A416C4161490A917606DDB0B13974232D66A194B5E18831DC865285B30348CA5AA832945DAF025D37C01C95D68314068D20B6F021ABDAB82AC45DAF02633760920E35D69F36BAD3642E3B103E16A99AADFAFD0ACCFD21267673F9A62D500952BF5F692777436C100611647512C7F0B6C346D1B723CDE3894A420F068C44100D49DD7BF55B8AB2DFAFC0D81F626099752FEBCA8DB25EBFCA1EEB0DB1088554E7D7DA504835642C14528DB2C46C147E1C8E349987C52ED53C2B2797E1A65325C04DFF381EEECD1E293A7E8C022B3FCC9CE6DDE19C8EDEDDA8115A7703EDA760F4E585C186139A1078E6CA6CEB77156EECD8C6C20D1F9F54AFEAB17422FD7E05F2FE10732AF4ABE16A49301838B2FEC1586E2EBD134DCD091D255A6FA0EA8C4E48BD561C87B7EB1F360B07B5DA9AA552202ABE7B182ED38C0463A537E524B12AD8A94A61EB1F19364BD49D03EAE00CCF0065D014477AB388369CAD9652BAC28C5EC9A300E186100D47B667420D70AD20F1A31D2E639E38CE23025F35504F046D8D413F5A854BB8E0D58A2A85621651F8E2787AA2684BE9A996C59FE6F2EB521DCF8EC11B1EA5ABA02A4EC51D11CD6863D257865B9E6CDACD6BECD8DE0DE1CC64505FE7CC8F104E25FB3CC20CEA73E989A22EE5E58720FD4C089E18D2F406A71C52A3B06213E96509378BBB2EAE19145AD2D3485D93C90FD7F4FD5B9E18528775162106F584F48450971EF243887E760B4F0869CACA3442A8CAE628886154654758922285A45DD6484EC8183CD5CE6498D931897042251839C1F40563F885F1A7B9CD4A54C7B4AADF2B083276E83A8F83CC99C79A6F342C63C12DE38CE2984724F53BE494192BF4C12F493C756D96A23E4C55C3505065FC6074125184CA147292E80B58F08BE10F469B35A84E3C55BF579062ECFC721E2186751746C8A129D2A05C147F842A2C4B75243A97CCF33667596501FD1E3D5A8BC04B104276A0C8EFD8BAE341674432336446AFDCFBB167AE8C4826FE81D9F572DF2EC2250827BB09AD8F832AEF4CBB1539C9792E1F43951D5ACCE29EE19D5F3DCB68EE07ABBEEFE01095FFB2D283512DA491308DF684731699847BAC7A4AE9AFBDAA96C89F41F2CB531D2A8EC11BA1DAD8D1A01BC299E96FFD254E3FCA7B2AD9358469DE1A6C2F1EB67D1F1EAA23C1BA81FE99E38C8AF62F388231295B3F3CFC5624EC79C3EAAF9F204B606E417CA03013180E2E3AB6633E5183F6D7FACE2537A36648D35D7FAA5F600E2290833F6739DA8330A7DD2124842ADCFBBBFF62874F1FEFFF7ADAC1E853F28F224F8B9C2E199E76F1C09A62F73675F83F3C0873FEF08F94FD455C2C814E13B113DD7F247F29107B09B39EF7CF9237201520D885D0FA9D51F62D73F6DEE8E1DC42FA3B4E0C01D5E46BEFB1FE0E4F694C81917F249F015376F673FB27817F8307109E69FB338AD836A20232FE218664FFF01302870C9C480DA3FB3DFD93F270747AFDB7FF0FADD21EC4274D0400, '6.2.0-61023');
