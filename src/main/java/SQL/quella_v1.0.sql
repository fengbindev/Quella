/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : quella

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-08-20 09:21:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ssrs_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_menu`;
CREATE TABLE `ssrs_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence` int(4) NOT NULL COMMENT '排序序号',
  `icon` varchar(50) NOT NULL COMMENT '菜单图标',
  `title` varchar(50) NOT NULL COMMENT '路径地址',
  `url` varchar(100) NOT NULL,
  `parent_id` int(5) DEFAULT NULL COMMENT '上级id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `system_menu` int(2) NOT NULL COMMENT '是否允许编辑 |  1:允许，2：不允许',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `ssrs_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ssrs_menu` (`id`),
  CONSTRAINT `ssrs_menu_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `ssrs_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('3', '1', '&#xe62e;', '网站设置', '/webSet/index', '2', '2', '2');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('12', '2', '&#xe614;', '测试顶级菜单', '/', null, '20', '1');
INSERT INTO `ssrs_menu` VALUES ('13', '1', '&#xe62e;', '测试子菜单', '/test/test1', '12', '21', '1');
INSERT INTO `ssrs_menu` VALUES ('14', '5', '&#xe62e;', '管理员设置', '/user/list', '2', '26', '1');
INSERT INTO `ssrs_menu` VALUES ('15', '6', '&#xe62e;', '在线用户', '/member/index', '2', '30', '1');
INSERT INTO `ssrs_menu` VALUES ('16', '7', '&#xe62e;', '系统日志', '/systemLog/index', '2', '32', '1');

-- ----------------------------
-- Table structure for `ssrs_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_permission`;
CREATE TABLE `ssrs_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_permission
-- ----------------------------
INSERT INTO `ssrs_permission` VALUES ('1', '/', '系统设置', null);
INSERT INTO `ssrs_permission` VALUES ('2', '/webSet/index', '网站设置', '1');
INSERT INTO `ssrs_permission` VALUES ('3', '/menu/index', '菜单设置', '1');
INSERT INTO `ssrs_permission` VALUES ('8', '/menu/update', '菜单编辑', '3');
INSERT INTO `ssrs_permission` VALUES ('9', '/menu/del', '菜单删除', '3');
INSERT INTO `ssrs_permission` VALUES ('11', '/role/index', '角色管理', '1');
INSERT INTO `ssrs_permission` VALUES ('12', '/role/add', '角色添加', '11');
INSERT INTO `ssrs_permission` VALUES ('13', '/role/update', '角色编辑', '11');
INSERT INTO `ssrs_permission` VALUES ('14', '/role/del', '角色删除', '11');
INSERT INTO `ssrs_permission` VALUES ('15', '/menu/add', '菜单添加', '3');
INSERT INTO `ssrs_permission` VALUES ('17', '/permission/index', '权限设置', '1');
INSERT INTO `ssrs_permission` VALUES ('20', '/', '测试顶级菜单', null);
INSERT INTO `ssrs_permission` VALUES ('21', '/test/test1', '测试子菜单', '20');
INSERT INTO `ssrs_permission` VALUES ('22', '/permission/add', '权限添加', '17');
INSERT INTO `ssrs_permission` VALUES ('23', '/permission/del', '权限删除', '17');
INSERT INTO `ssrs_permission` VALUES ('24', '/permission/update', '权限修改', '17');
INSERT INTO `ssrs_permission` VALUES ('26', '/user/list', '管理员设置', '1');
INSERT INTO `ssrs_permission` VALUES ('27', '/user/add', '管理员添加', '26');
INSERT INTO `ssrs_permission` VALUES ('28', '/user/update', '管理员编辑', '26');
INSERT INTO `ssrs_permission` VALUES ('29', '/user/del', '管理员删除', '26');
INSERT INTO `ssrs_permission` VALUES ('30', '/member/index', '在线用户设置', '1');
INSERT INTO `ssrs_permission` VALUES ('31', '/member/changeSessionStatus', '用户状态改变', '30');
INSERT INTO `ssrs_permission` VALUES ('32', '/systemLog/index', '系统日志', '1');

-- ----------------------------
-- Table structure for `ssrs_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role`;
CREATE TABLE `ssrs_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role
-- ----------------------------
INSERT INTO `ssrs_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `ssrs_role` VALUES ('2', '测试角色', 'test');

-- ----------------------------
-- Table structure for `ssrs_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role_permission`;
CREATE TABLE `ssrs_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role_permission
-- ----------------------------
INSERT INTO `ssrs_role_permission` VALUES ('1', '1');
INSERT INTO `ssrs_role_permission` VALUES ('1', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '3');
INSERT INTO `ssrs_role_permission` VALUES ('1', '8');
INSERT INTO `ssrs_role_permission` VALUES ('1', '9');
INSERT INTO `ssrs_role_permission` VALUES ('1', '11');
INSERT INTO `ssrs_role_permission` VALUES ('1', '12');
INSERT INTO `ssrs_role_permission` VALUES ('1', '13');
INSERT INTO `ssrs_role_permission` VALUES ('1', '14');
INSERT INTO `ssrs_role_permission` VALUES ('1', '15');
INSERT INTO `ssrs_role_permission` VALUES ('4', '1');
INSERT INTO `ssrs_role_permission` VALUES ('4', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '17');
INSERT INTO `ssrs_role_permission` VALUES ('1', '20');
INSERT INTO `ssrs_role_permission` VALUES ('1', '21');
INSERT INTO `ssrs_role_permission` VALUES ('1', '22');
INSERT INTO `ssrs_role_permission` VALUES ('1', '23');
INSERT INTO `ssrs_role_permission` VALUES ('1', '24');
INSERT INTO `ssrs_role_permission` VALUES ('1', '25');
INSERT INTO `ssrs_role_permission` VALUES ('1', '26');
INSERT INTO `ssrs_role_permission` VALUES ('1', '27');
INSERT INTO `ssrs_role_permission` VALUES ('2', '1');
INSERT INTO `ssrs_role_permission` VALUES ('2', '2');
INSERT INTO `ssrs_role_permission` VALUES ('2', '3');
INSERT INTO `ssrs_role_permission` VALUES ('2', '8');
INSERT INTO `ssrs_role_permission` VALUES ('2', '9');
INSERT INTO `ssrs_role_permission` VALUES ('2', '15');
INSERT INTO `ssrs_role_permission` VALUES ('1', '28');
INSERT INTO `ssrs_role_permission` VALUES ('1', '29');
INSERT INTO `ssrs_role_permission` VALUES ('1', '30');
INSERT INTO `ssrs_role_permission` VALUES ('1', '31');
INSERT INTO `ssrs_role_permission` VALUES ('1', '32');

-- ----------------------------
-- Table structure for `ssrs_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_system_log`;
CREATE TABLE `ssrs_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(30) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `param_dara` longtext,
  `session_id` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_data` longtext,
  `http_status_code` varchar(10) DEFAULT NULL,
  `time_consuming` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssrs_user`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user`;
CREATE TABLE `ssrs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user
-- ----------------------------
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-08-17 11:15:25', '1');

-- ----------------------------
-- Table structure for `ssrs_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user_role`;
CREATE TABLE `ssrs_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user_role
-- ----------------------------
INSERT INTO `ssrs_user_role` VALUES ('15', '1');
INSERT INTO `ssrs_user_role` VALUES ('16', '1');

-- ----------------------------
-- Procedure structure for `init_quella_data`
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_quella_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `init_quella_data`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ssrs_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_menu`;
CREATE TABLE `ssrs_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence` int(4) NOT NULL COMMENT '排序序号',
  `icon` varchar(50) NOT NULL COMMENT '菜单图标',
  `title` varchar(50) NOT NULL COMMENT '路径地址',
  `url` varchar(100) NOT NULL,
  `parent_id` int(5) DEFAULT NULL COMMENT '上级id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `system_menu` int(2) NOT NULL COMMENT '是否允许编辑 |  1:允许，2：不允许',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `ssrs_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ssrs_menu` (`id`),
  CONSTRAINT `ssrs_menu_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `ssrs_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('3', '1', '&#xe62e;', '网站设置', '/webSet/index', '2', '2', '2');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('12', '2', '&#xe614;', '测试顶级菜单', '/', null, '20', '1');
INSERT INTO `ssrs_menu` VALUES ('13', '1', '&#xe62e;', '测试子菜单', '/test/test1', '12', '21', '1');
INSERT INTO `ssrs_menu` VALUES ('14', '5', '&#xe62e;', '管理员设置', '/user/list', '2', '26', '1');
INSERT INTO `ssrs_menu` VALUES ('15', '6', '&#xe62e;', '在线用户', '/member/index', '2', '30', '1');
INSERT INTO `ssrs_menu` VALUES ('16', '7', '&#xe62e;', '系统日志', '/systemLog/index', '2', '32', '1');

-- ----------------------------
-- Table structure for `ssrs_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_permission`;
CREATE TABLE `ssrs_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_permission
-- ----------------------------
INSERT INTO `ssrs_permission` VALUES ('1', '/', '系统设置', null);
INSERT INTO `ssrs_permission` VALUES ('2', '/webSet/index', '网站设置', '1');
INSERT INTO `ssrs_permission` VALUES ('3', '/menu/index', '菜单设置', '1');
INSERT INTO `ssrs_permission` VALUES ('8', '/menu/update', '菜单编辑', '3');
INSERT INTO `ssrs_permission` VALUES ('9', '/menu/del', '菜单删除', '3');
INSERT INTO `ssrs_permission` VALUES ('11', '/role/index', '角色管理', '1');
INSERT INTO `ssrs_permission` VALUES ('12', '/role/add', '角色添加', '11');
INSERT INTO `ssrs_permission` VALUES ('13', '/role/update', '角色编辑', '11');
INSERT INTO `ssrs_permission` VALUES ('14', '/role/del', '角色删除', '11');
INSERT INTO `ssrs_permission` VALUES ('15', '/menu/add', '菜单添加', '3');
INSERT INTO `ssrs_permission` VALUES ('17', '/permission/index', '权限设置', '1');
INSERT INTO `ssrs_permission` VALUES ('20', '/', '测试顶级菜单', null);
INSERT INTO `ssrs_permission` VALUES ('21', '/test/test1', '测试子菜单', '20');
INSERT INTO `ssrs_permission` VALUES ('22', '/permission/add', '权限添加', '17');
INSERT INTO `ssrs_permission` VALUES ('23', '/permission/del', '权限删除', '17');
INSERT INTO `ssrs_permission` VALUES ('24', '/permission/update', '权限修改', '17');
INSERT INTO `ssrs_permission` VALUES ('26', '/user/list', '管理员设置', '1');
INSERT INTO `ssrs_permission` VALUES ('27', '/user/add', '管理员添加', '26');
INSERT INTO `ssrs_permission` VALUES ('28', '/user/update', '管理员编辑', '26');
INSERT INTO `ssrs_permission` VALUES ('29', '/user/del', '管理员删除', '26');
INSERT INTO `ssrs_permission` VALUES ('30', '/member/index', '在线用户设置', '1');
INSERT INTO `ssrs_permission` VALUES ('31', '/member/changeSessionStatus', '用户状态改变', '30');
INSERT INTO `ssrs_permission` VALUES ('32', '/systemLog/index', '系统日志', '1');

-- ----------------------------
-- Table structure for `ssrs_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role`;
CREATE TABLE `ssrs_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role
-- ----------------------------
INSERT INTO `ssrs_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `ssrs_role` VALUES ('2', '测试角色', 'test');

-- ----------------------------
-- Table structure for `ssrs_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role_permission`;
CREATE TABLE `ssrs_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role_permission
-- ----------------------------
INSERT INTO `ssrs_role_permission` VALUES ('1', '1');
INSERT INTO `ssrs_role_permission` VALUES ('1', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '3');
INSERT INTO `ssrs_role_permission` VALUES ('1', '8');
INSERT INTO `ssrs_role_permission` VALUES ('1', '9');
INSERT INTO `ssrs_role_permission` VALUES ('1', '11');
INSERT INTO `ssrs_role_permission` VALUES ('1', '12');
INSERT INTO `ssrs_role_permission` VALUES ('1', '13');
INSERT INTO `ssrs_role_permission` VALUES ('1', '14');
INSERT INTO `ssrs_role_permission` VALUES ('1', '15');
INSERT INTO `ssrs_role_permission` VALUES ('4', '1');
INSERT INTO `ssrs_role_permission` VALUES ('4', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '17');
INSERT INTO `ssrs_role_permission` VALUES ('1', '20');
INSERT INTO `ssrs_role_permission` VALUES ('1', '21');
INSERT INTO `ssrs_role_permission` VALUES ('1', '22');
INSERT INTO `ssrs_role_permission` VALUES ('1', '23');
INSERT INTO `ssrs_role_permission` VALUES ('1', '24');
INSERT INTO `ssrs_role_permission` VALUES ('1', '25');
INSERT INTO `ssrs_role_permission` VALUES ('1', '26');
INSERT INTO `ssrs_role_permission` VALUES ('1', '27');
INSERT INTO `ssrs_role_permission` VALUES ('2', '1');
INSERT INTO `ssrs_role_permission` VALUES ('2', '2');
INSERT INTO `ssrs_role_permission` VALUES ('2', '3');
INSERT INTO `ssrs_role_permission` VALUES ('2', '8');
INSERT INTO `ssrs_role_permission` VALUES ('2', '9');
INSERT INTO `ssrs_role_permission` VALUES ('2', '15');
INSERT INTO `ssrs_role_permission` VALUES ('1', '28');
INSERT INTO `ssrs_role_permission` VALUES ('1', '29');
INSERT INTO `ssrs_role_permission` VALUES ('1', '30');
INSERT INTO `ssrs_role_permission` VALUES ('1', '31');
INSERT INTO `ssrs_role_permission` VALUES ('1', '32');

-- ----------------------------
-- Table structure for `ssrs_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_system_log`;
CREATE TABLE `ssrs_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(30) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `param_dara` longtext,
  `session_id` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_data` longtext,
  `http_status_code` varchar(10) DEFAULT NULL,
  `time_consuming` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssrs_user`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user`;
CREATE TABLE `ssrs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user
-- ----------------------------
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-08-17 11:15:25', '1');

-- ----------------------------
-- Table structure for `ssrs_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user_role`;
CREATE TABLE `ssrs_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user_role
-- ----------------------------
INSERT INTO `ssrs_user_role` VALUES ('15', '1');
INSERT INTO `ssrs_user_role` VALUES ('16', '1');
END
;;
DELIMITER ;
