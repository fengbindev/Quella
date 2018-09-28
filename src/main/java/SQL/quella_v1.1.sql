/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : quella

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-28 16:23:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ssrs_alidayu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_alidayu`;
CREATE TABLE `ssrs_alidayu` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `key_id` varchar(111) DEFAULT NULL COMMENT '阿里大鱼AccessKeyId',
  `key_secret` varchar(255) DEFAULT NULL COMMENT '阿里大鱼AccessKeySecret',
  `sign_name` varchar(111) DEFAULT NULL COMMENT '阿里大鱼短信签名',
  `template` varchar(50) DEFAULT NULL COMMENT '阿里大鱼短信模板',
  `sign_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_alidayu
-- ----------------------------
INSERT INTO `ssrs_alidayu` VALUES ('1', 'LTAIh3zv5e82VE8O', 'ecB3c8naMHwSJUYXmxlbU1uFvEbcfL', '上善若水', 'SMS_126355465', '6');

-- ----------------------------
-- Table structure for `ssrs_file_qiniu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_file_qiniu`;
CREATE TABLE `ssrs_file_qiniu` (
  `fq_id` int(1) NOT NULL,
  `fq_accessKey` varchar(100) DEFAULT NULL,
  `fq_secretKey` varchar(150) DEFAULT NULL,
  `fq_bucket` varchar(60) DEFAULT NULL COMMENT '创建的空间名字',
  `fq_url` varchar(100) DEFAULT NULL COMMENT '这个表示七牛给你的调用地址',
  `fq_zone` varchar(30) DEFAULT NULL COMMENT '机房信息',
  PRIMARY KEY (`fq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='七牛云配置';

-- ----------------------------
-- Records of ssrs_file_qiniu
-- ----------------------------
INSERT INTO `ssrs_file_qiniu` VALUES ('1', 'IlBRNaLvTMqkK2PDsNC4f88lvVqbvSOqq090wmoD', 'inSvt0XaIe1d_4zVcL4IjRg6V91SbO1-hkGRQJgz', 'quella', 'http://pe3wjva1n.bkt.clouddn.com', 'zone2');

-- ----------------------------
-- Table structure for `ssrs_mail`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_mail`;
CREATE TABLE `ssrs_mail` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) DEFAULT NULL COMMENT '邮件服务器的SMTP地址',
  `port` int(11) DEFAULT NULL COMMENT '邮件服务器的SMTP端口',
  `from` varchar(100) DEFAULT NULL COMMENT '发件人（必须正确，否则发送失败）',
  `user` varchar(50) DEFAULT NULL COMMENT '用户名',
  `pass` varchar(100) DEFAULT NULL COMMENT '密码（注意，某些邮箱需要为SMTP服务单独设置密码）',
  `startttls_enable` tinyint(1) DEFAULT NULL,
  `vaildate_day` int(11) DEFAULT NULL COMMENT '邮件有效期(天)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_mail
-- ----------------------------
INSERT INTO `ssrs_mail` VALUES ('1', 'smtp.qq.com', '465', 'ssrs<947164239@qq.com>', '947164239@qq.com', 'jxxcpptnazslbejd', '1', '5');

-- ----------------------------
-- Table structure for `ssrs_mail_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_mail_verify`;
CREATE TABLE `ssrs_mail_verify` (
  `id` varchar(111) NOT NULL,
  `email` varchar(111) DEFAULT NULL,
  `send_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_mail_verify
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `ssrs_menu` VALUES ('17', '3', '&#xe614;', '第三方集成', '/', null, '33', '1');
INSERT INTO `ssrs_menu` VALUES ('18', '2', '&#xe62e;', '阿里大鱼', '/alidayu/index', '17', '34', '1');
INSERT INTO `ssrs_menu` VALUES ('19', '4', '&#xe62e;', '邮件发送', '/mail/index', '17', '35', '1');
INSERT INTO `ssrs_menu` VALUES ('20', '6', '&#xe62e;', '富文本', '/editor/index', '17', '36', '1');
INSERT INTO `ssrs_menu` VALUES ('21', '8', '&#xe62e;', '七牛云存储', '/fileQiniu/index', null, '37', '1');
INSERT INTO `ssrs_menu` VALUES ('22', '8', '&#xe62e;', '七牛云存储', '/fileQiniu/index', '17', '38', '1');
INSERT INTO `ssrs_menu` VALUES ('23', '10', '&#xe62e;', '支付宝配置', '/aliPaySetting/index', '17', '39', '1');

-- ----------------------------
-- Table structure for `ssrs_pay_setting_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_pay_setting_alipay`;
CREATE TABLE `ssrs_pay_setting_alipay` (
  `psa_id` int(1) NOT NULL,
  `psa_app_id` varchar(255) DEFAULT NULL COMMENT 'appId',
  `psa_private_key` text COMMENT '密钥',
  `psa_public_key` text COMMENT '支付宝公钥',
  `psa_server_url` varchar(255) DEFAULT NULL COMMENT '支付宝开放安全地址(一半不需要修改)',
  `psa_do_main` varchar(100) DEFAULT NULL COMMENT '支付宝返回回调地址前缀',
  `psa_notify_url` varchar(100) DEFAULT NULL COMMENT '支付宝异步通知地址',
  `psa_charset` varchar(30) DEFAULT 'utf-8' COMMENT '设置字符集编码',
  `psa_format` varchar(30) DEFAULT 'JSON' COMMENT '仅支持JSON',
  `psa_sign_type` varchar(30) DEFAULT 'RSA2' COMMENT '设置符号类型',
  PRIMARY KEY (`psa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_pay_setting_alipay
-- ----------------------------
INSERT INTO `ssrs_pay_setting_alipay` VALUES ('1', '2016091700532697', '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', 'https://openapi.rfhxkewq7tgdev.com/gateway.do', 'http://localhost:8080/aliPay/return', 'http://127.0.0.1:8080/aliPay/notify', 'utf-8', 'JSON', 'RSA2');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

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
INSERT INTO `ssrs_permission` VALUES ('33', '/', '第三方集成', null);
INSERT INTO `ssrs_permission` VALUES ('34', '/alidayu/index', '阿里大鱼', '33');
INSERT INTO `ssrs_permission` VALUES ('35', '/mail/index', '邮件发送', '33');
INSERT INTO `ssrs_permission` VALUES ('36', '/editor/index', '富文本', '33');
INSERT INTO `ssrs_permission` VALUES ('37', '/fileQiniu/index', '七牛云存储', null);
INSERT INTO `ssrs_permission` VALUES ('38', '/fileQiniu/index', '七牛云存储', '33');
INSERT INTO `ssrs_permission` VALUES ('39', '/aliPaySetting/index', '支付宝配置', '33');

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
INSERT INTO `ssrs_role_permission` VALUES ('1', '33');
INSERT INTO `ssrs_role_permission` VALUES ('1', '34');
INSERT INTO `ssrs_role_permission` VALUES ('1', '35');
INSERT INTO `ssrs_role_permission` VALUES ('1', '36');
INSERT INTO `ssrs_role_permission` VALUES ('1', '37');
INSERT INTO `ssrs_role_permission` VALUES ('1', '38');
INSERT INTO `ssrs_role_permission` VALUES ('1', '39');

-- ----------------------------
-- Table structure for `ssrs_sign`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_sign`;
CREATE TABLE `ssrs_sign` (
  `sign_id` varchar(64) NOT NULL COMMENT '唯一标识',
  `sign_phone` varchar(11) NOT NULL COMMENT '手机号码',
  `sign_code` varchar(64) NOT NULL COMMENT 'MD5( 验证码+盐）',
  `sign_time` datetime NOT NULL COMMENT '发送时间',
  `sign_type` int(1) NOT NULL COMMENT '状态（1：未使用，2：已经使用）',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_sign
-- ----------------------------
INSERT INTO `ssrs_sign` VALUES ('25049055a75f4fbabcc4525f98f88269', '18932493059', '21102cba7823b692b271afcec6ab3ce4', '2018-08-21 14:54:23', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------
INSERT INTO `ssrs_system_log` VALUES ('935', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:21:46', '2018-09-28 16:21:46', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '109');
INSERT INTO `ssrs_system_log` VALUES ('936', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:21:46', '2018-09-28 16:21:46', 'null', '200', '5');
INSERT INTO `ssrs_system_log` VALUES ('937', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:21:46', '2018-09-28 16:21:46', '{}', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('938', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:21:46', '2018-09-28 16:21:46', '{}', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('939', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '4934f529-2908-44c3-b74a-099138d18f6d', '2018-09-28 16:21:49', '2018-09-28 16:21:49', '{}', '404', '3');
INSERT INTO `ssrs_system_log` VALUES ('940', '127.0.0.1', '/editor/index', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:21:50', '2018-09-28 16:21:50', '{}', '200', '35');
INSERT INTO `ssrs_system_log` VALUES ('941', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'f80d9d5e-c105-4bb0-932e-4b982d8e4b69', '2018-09-28 16:21:52', '2018-09-28 16:21:52', '{}', '404', '3');
INSERT INTO `ssrs_system_log` VALUES ('942', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'c6033267-d24c-4e8a-a212-ab888ede18ac', '2018-09-28 16:21:52', '2018-09-28 16:21:52', '{}', '404', '3');
INSERT INTO `ssrs_system_log` VALUES ('943', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '4934f529-2908-44c3-b74a-099138d18f6d', '2018-09-28 16:21:59', '2018-09-28 16:21:59', '{}', '404', '2');
INSERT INTO `ssrs_system_log` VALUES ('944', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '549c2b9b-6a9f-4a5e-bf26-a5193dc5fdfa', '2018-09-28 16:22:05', '2018-09-28 16:22:05', '{}', '404', '6');
INSERT INTO `ssrs_system_log` VALUES ('945', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:22:10', '2018-09-28 16:22:10', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '112');
INSERT INTO `ssrs_system_log` VALUES ('946', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:22:10', '2018-09-28 16:22:10', 'null', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('947', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '7cc83667-0025-4777-b54e-036de680a175', '2018-09-28 16:22:11', '2018-09-28 16:22:11', '{}', '404', '2');
INSERT INTO `ssrs_system_log` VALUES ('948', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '549c2b9b-6a9f-4a5e-bf26-a5193dc5fdfa', '2018-09-28 16:22:11', '2018-09-28 16:22:11', '{}', '404', '3');
INSERT INTO `ssrs_system_log` VALUES ('949', '127.0.0.1', '/editor/index', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:22:22', '2018-09-28 16:22:22', '{}', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('950', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'f80d9d5e-c105-4bb0-932e-4b982d8e4b69', '2018-09-28 16:22:23', '2018-09-28 16:22:23', '{}', '404', '2');
INSERT INTO `ssrs_system_log` VALUES ('951', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '08501008-c593-460c-b448-eeef9aa00c28', '2018-09-28 16:22:24', '2018-09-28 16:22:24', '{}', '200', '5');
INSERT INTO `ssrs_system_log` VALUES ('952', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '050272c5-e4c7-4c45-8225-7c58a410d560', '2018-09-28 16:22:24', '2018-09-28 16:22:24', '{}', '404', '5');
INSERT INTO `ssrs_system_log` VALUES ('953', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '549c2b9b-6a9f-4a5e-bf26-a5193dc5fdfa', '2018-09-28 16:22:35', '2018-09-28 16:22:35', '{}', '404', '2');
INSERT INTO `ssrs_system_log` VALUES ('954', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '55cf2779-bb19-4592-89a8-2d8241e5b488', '2018-09-28 16:22:46', '2018-09-28 16:22:46', '{}', '404', '4');
INSERT INTO `ssrs_system_log` VALUES ('955', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '549c2b9b-6a9f-4a5e-bf26-a5193dc5fdfa', '2018-09-28 16:23:01', '2018-09-28 16:23:01', '{}', '404', '3');

-- ----------------------------
-- Table structure for `ssrs_trade`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_trade`;
CREATE TABLE `ssrs_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式 如果是微信，请传“WEIXINPAY”，如果是支付宝“ALIPAY”',
  `body` varchar(1000) NOT NULL COMMENT '（必填）商品描述',
  `subject` varchar(1000) NOT NULL COMMENT '（必填）商品名称',
  `outTrade_no` varchar(255) DEFAULT NULL COMMENT '（必填）商户订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '（必填）第三方订单号，微信，支付宝',
  `total_amount` varchar(255) NOT NULL COMMENT '（必填）价格',
  `pay_url` varchar(2000) DEFAULT NULL COMMENT '付款的url',
  `state` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_trade
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

DROP TABLE IF EXISTS `ssrs_alidayu`;
CREATE TABLE `ssrs_alidayu` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `key_id` varchar(111) DEFAULT NULL COMMENT '阿里大鱼AccessKeyId',
  `key_secret` varchar(255) DEFAULT NULL COMMENT '阿里大鱼AccessKeySecret',
  `sign_name` varchar(111) DEFAULT NULL COMMENT '阿里大鱼短信签名',
  `template` varchar(50) DEFAULT NULL COMMENT '阿里大鱼短信模板',
  `sign_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_alidayu
-- ----------------------------
INSERT INTO `ssrs_alidayu` VALUES ('1', 'LTAIh3zv5e82VE8O', 'ecB3c8naMHwSJUYXmxlbU1uFvEbcfL', '上善若水', 'SMS_126355465', '6');

-- ----------------------------
-- Table structure for `ssrs_file_qiniu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_file_qiniu`;
CREATE TABLE `ssrs_file_qiniu` (
  `fq_id` int(1) NOT NULL,
  `fq_accessKey` varchar(100) DEFAULT NULL,
  `fq_secretKey` varchar(150) DEFAULT NULL,
  `fq_bucket` varchar(60) DEFAULT NULL COMMENT '创建的空间名字',
  `fq_url` varchar(100) DEFAULT NULL COMMENT '这个表示七牛给你的调用地址',
  `fq_zone` varchar(30) DEFAULT NULL COMMENT '机房信息',
  PRIMARY KEY (`fq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='七牛云配置';

-- ----------------------------
-- Records of ssrs_file_qiniu
-- ----------------------------
INSERT INTO `ssrs_file_qiniu` VALUES ('1', 'IlBRNaLvTMqkK2PDsNC4f88lvVqbvSOqq090wmoD', 'inSvt0XaIe1d_4zVcL4IjRg6V91SbO1-hkGRQJgz', 'quella', 'http://pe3wjva1n.bkt.clouddn.com', 'zone2');

-- ----------------------------
-- Table structure for `ssrs_mail`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_mail`;
CREATE TABLE `ssrs_mail` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) DEFAULT NULL COMMENT '邮件服务器的SMTP地址',
  `port` int(11) DEFAULT NULL COMMENT '邮件服务器的SMTP端口',
  `from` varchar(100) DEFAULT NULL COMMENT '发件人（必须正确，否则发送失败）',
  `user` varchar(50) DEFAULT NULL COMMENT '用户名',
  `pass` varchar(100) DEFAULT NULL COMMENT '密码（注意，某些邮箱需要为SMTP服务单独设置密码）',
  `startttls_enable` tinyint(1) DEFAULT NULL,
  `vaildate_day` int(11) DEFAULT NULL COMMENT '邮件有效期(天)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_mail
-- ----------------------------
INSERT INTO `ssrs_mail` VALUES ('1', 'smtp.qq.com', '465', 'ssrs<947164239@qq.com>', '947164239@qq.com', 'jxxcpptnazslbejd', '1', '5');

-- ----------------------------
-- Table structure for `ssrs_mail_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_mail_verify`;
CREATE TABLE `ssrs_mail_verify` (
  `id` varchar(111) NOT NULL,
  `email` varchar(111) DEFAULT NULL,
  `send_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
INSERT INTO `ssrs_menu` VALUES ('17', '3', '&#xe614;', '第三方集成', '/', null, '33', '1');
INSERT INTO `ssrs_menu` VALUES ('18', '2', '&#xe62e;', '阿里大鱼', '/alidayu/index', '17', '34', '1');
INSERT INTO `ssrs_menu` VALUES ('19', '4', '&#xe62e;', '邮件发送', '/mail/index', '17', '35', '1');
INSERT INTO `ssrs_menu` VALUES ('20', '6', '&#xe62e;', '富文本', '/editor/index', '17', '36', '1');
INSERT INTO `ssrs_menu` VALUES ('21', '8', '&#xe62e;', '七牛云存储', '/fileQiniu/index', null, '37', '1');
INSERT INTO `ssrs_menu` VALUES ('22', '8', '&#xe62e;', '七牛云存储', '/fileQiniu/index', '17', '38', '1');
INSERT INTO `ssrs_menu` VALUES ('23', '10', '&#xe62e;', '支付宝配置', '/aliPaySetting/index', '17', '39', '1');

-- ----------------------------
-- Table structure for `ssrs_pay_setting_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_pay_setting_alipay`;
CREATE TABLE `ssrs_pay_setting_alipay` (
  `psa_id` int(1) NOT NULL,
  `psa_app_id` varchar(255) DEFAULT NULL COMMENT 'appId',
  `psa_private_key` text COMMENT '密钥',
  `psa_public_key` text COMMENT '支付宝公钥',
  `psa_server_url` varchar(255) DEFAULT NULL COMMENT '支付宝开放安全地址(一半不需要修改)',
  `psa_do_main` varchar(100) DEFAULT NULL COMMENT '支付宝返回回调地址前缀',
  `psa_notify_url` varchar(100) DEFAULT NULL COMMENT '支付宝异步通知地址',
  `psa_charset` varchar(30) DEFAULT 'utf-8' COMMENT '设置字符集编码',
  `psa_format` varchar(30) DEFAULT 'JSON' COMMENT '仅支持JSON',
  `psa_sign_type` varchar(30) DEFAULT 'RSA2' COMMENT '设置符号类型',
  PRIMARY KEY (`psa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_pay_setting_alipay
-- ----------------------------
INSERT INTO `ssrs_pay_setting_alipay` VALUES ('1', '2016091700532697', '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', 'https://openapi.rfhxkewq7tgdev.com/gateway.do', 'http://localhost:8080/aliPay/return', 'http://127.0.0.1:8080/aliPay/notify', 'utf-8', 'JSON', 'RSA2');

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
INSERT INTO `ssrs_permission` VALUES ('33', '/', '第三方集成', null);
INSERT INTO `ssrs_permission` VALUES ('34', '/alidayu/index', '阿里大鱼', '33');
INSERT INTO `ssrs_permission` VALUES ('35', '/mail/index', '邮件发送', '33');
INSERT INTO `ssrs_permission` VALUES ('36', '/editor/index', '富文本', '33');
INSERT INTO `ssrs_permission` VALUES ('37', '/fileQiniu/index', '七牛云存储', null);
INSERT INTO `ssrs_permission` VALUES ('38', '/fileQiniu/index', '七牛云存储', '33');
INSERT INTO `ssrs_permission` VALUES ('39', '/aliPaySetting/index', '支付宝配置', '33');

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
INSERT INTO `ssrs_role_permission` VALUES ('1', '33');
INSERT INTO `ssrs_role_permission` VALUES ('1', '34');
INSERT INTO `ssrs_role_permission` VALUES ('1', '35');
INSERT INTO `ssrs_role_permission` VALUES ('1', '36');
INSERT INTO `ssrs_role_permission` VALUES ('1', '37');
INSERT INTO `ssrs_role_permission` VALUES ('1', '38');
INSERT INTO `ssrs_role_permission` VALUES ('1', '39');


-- ----------------------------
-- Table structure for `ssrs_sign`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_sign`;
CREATE TABLE `ssrs_sign` (
  `sign_id` varchar(64) NOT NULL COMMENT '唯一标识',
  `sign_phone` varchar(11) NOT NULL COMMENT '手机号码',
  `sign_code` varchar(64) NOT NULL COMMENT 'MD5( 验证码+盐）',
  `sign_time` datetime NOT NULL COMMENT '发送时间',
  `sign_type` int(1) NOT NULL COMMENT '状态（1：未使用，2：已经使用）',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_sign
-- ----------------------------
INSERT INTO `ssrs_sign` VALUES ('25049055a75f4fbabcc4525f98f88269', '18932493059', '21102cba7823b692b271afcec6ab3ce4', '2018-08-21 14:54:23', '2');

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
-- Table structure for `ssrs_trade`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_trade`;
CREATE TABLE `ssrs_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式 如果是微信，请传“WEIXINPAY”，如果是支付宝“ALIPAY”',
  `body` varchar(1000) NOT NULL COMMENT '（必填）商品描述',
  `subject` varchar(1000) NOT NULL COMMENT '（必填）商品名称',
  `outTrade_no` varchar(255) DEFAULT NULL COMMENT '（必填）商户订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '（必填）第三方订单号，微信，支付宝',
  `total_amount` varchar(255) NOT NULL COMMENT '（必填）价格',
  `pay_url` varchar(2000) DEFAULT NULL COMMENT '付款的url',
  `state` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_trade
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
-- Table structure for `ssrs_pay_setting_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_pay_setting_alipay`;
CREATE TABLE `ssrs_pay_setting_alipay` (
  `psa_id` int(1) NOT NULL,
  `psa_app_id` varchar(255) DEFAULT NULL COMMENT 'appId',
  `psa_private_key` text COMMENT '密钥',
  `psa_public_key` text COMMENT '支付宝公钥',
  `psa_server_url` varchar(255) DEFAULT NULL COMMENT '支付宝开放安全地址(一半不需要修改)',
  `psa_do_main` varchar(100) DEFAULT NULL COMMENT '支付宝返回回调地址前缀',
  `psa_notify_url` varchar(100) DEFAULT NULL COMMENT '支付宝异步通知地址',
  `psa_charset` varchar(30) DEFAULT 'utf-8' COMMENT '设置字符集编码',
  `psa_format` varchar(30) DEFAULT 'JSON' COMMENT '仅支持JSON',
  `psa_sign_type` varchar(30) DEFAULT 'RSA2' COMMENT '设置符号类型',
  PRIMARY KEY (`psa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_pay_setting_alipay
-- ----------------------------
INSERT INTO `ssrs_pay_setting_alipay` VALUES ('1', '2016091700532697', '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', 'https://openapi.rfhxkewq7tgdev.com/gateway.do', 'http://localhost:8080/aliPay/return', 'http://127.0.0.1:8080/aliPay/notify', 'utf-8', 'JSON', 'RSA2');
END
;;
DELIMITER ;
