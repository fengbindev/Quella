/*
Navicat MySQL Data Transfer

Source Server         : quella
Source Server Version : 50719
Source Host           : 120.79.36.168:3306
Source Database       : quella

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-12-11 11:10:32
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
INSERT INTO `ssrs_alidayu` VALUES ('1', 'LTAIh3zv5e82VE8O', 'ecB3c8naMHwSJUYXmxlbU1uFvEbcfL', '上善若水', 'SMS_126355465', '4');

-- ----------------------------
-- Table structure for `ssrs_dictionary_item`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_dictionary_item`;
CREATE TABLE `ssrs_dictionary_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(4) NOT NULL COMMENT '序号',
  `summary` varchar(200) DEFAULT NULL COMMENT '描述',
  `text` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL COMMENT '值',
  `type_id` int(11) NOT NULL COMMENT '所属字典类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_dictionary_item
-- ----------------------------
INSERT INTO `ssrs_dictionary_item` VALUES ('1', '1', '', '普通切换', '1', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('2', '2', '', '普通切换带按钮', '2', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('3', '3', '', '圆点分页器', '3', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('4', '4', '', '数字分页器', '4', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('5', '5', '', '渐变切换', '5', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('6', '6', '', '垂直切换', '6', '1');

-- ----------------------------
-- Table structure for `ssrs_dictionary_type`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_dictionary_type`;
CREATE TABLE `ssrs_dictionary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `name` varchar(100) NOT NULL COMMENT '字典类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of ssrs_dictionary_type
-- ----------------------------
INSERT INTO `ssrs_dictionary_type` VALUES ('1', 'imagePlayerType', '图片播放器类型');

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
INSERT INTO `ssrs_file_qiniu` VALUES ('1', 'IlBRNaLvTMqkK2PDsNC4f88lvVqbvSOqq090wmoD', 'inSvt0XaIe1d_4zVcL4IjRg6V91SbO1-hkGRQJgz', 'quella', 'http://qiniu.ssrsdev.top', 'zone2');

-- ----------------------------
-- Table structure for `ssrs_image_player`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_image_player`;
CREATE TABLE `ssrs_image_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '播放器名称',
  `width` int(11) NOT NULL COMMENT '播放器宽度',
  `height` int(11) NOT NULL COMMENT '播放器高度',
  `swiper_type` int(11) NOT NULL COMMENT '播放器类型',
  `display_count` int(11) NOT NULL COMMENT '播放器显示最大条数',
  `display_desc` varchar(2) NOT NULL COMMENT '是否反序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_image_player
-- ----------------------------
INSERT INTO `ssrs_image_player` VALUES ('1', '图片播放器1', '700', '380', '5', '5', 'N');

-- ----------------------------
-- Table structure for `ssrs_image_player_resources`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_image_player_resources`;
CREATE TABLE `ssrs_image_player_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `sequence` int(4) NOT NULL COMMENT '序号（数字越大越靠前，1-9999之间，默认是50）',
  `img` varchar(200) NOT NULL COMMENT '图片地址',
  `url` varchar(200) DEFAULT NULL COMMENT '图片需要跳转的地址',
  `time` datetime NOT NULL COMMENT '发布时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `type` int(1) NOT NULL COMMENT '是否关闭（关闭将不显示，1：显示，2：关闭）',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `summary` varchar(200) DEFAULT NULL COMMENT '概述（1-100之间）',
  `image_player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='图片播放器图片列表';

-- ----------------------------
-- Records of ssrs_image_player_resources
-- ----------------------------
INSERT INTO `ssrs_image_player_resources` VALUES ('4', '1', 'http://qiniu.ssrsdev.top/FvadGPXhFrPmu3ciAVhC5Uc5lu0_', '/', '2018-10-23 14:19:47', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片1', '图片1', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('5', '2', 'http://qiniu.ssrsdev.top/FnGYiGca3CrAc28tMWrNHAwC0LLi', '/', '2018-10-23 14:20:25', '2018-10-01 00:00:00', '2019-12-01 00:00:00', '1', '图片2', '图片2', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('6', '3', 'http://qiniu.ssrsdev.top/FgKIV1-HzUKv9weVX4mo2ZJrucvz', '/', '2018-10-23 14:20:55', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片3', '图片3', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('7', '4', 'http://qiniu.ssrsdev.top/FgwiU2SSPQ6RIYdYpcpD32lBy3ct', '/', '2018-10-23 14:21:22', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片4', '图片4', '1');

-- ----------------------------
-- Table structure for `ssrs_link`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_link`;
CREATE TABLE `ssrs_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_link
-- ----------------------------
INSERT INTO `ssrs_link` VALUES ('2', '1', '友情链接2', '/', 'http://qiniu.ssrsdev.top/FgJgXDK_6NJZ8Glz9NWUJJvfK4iv');

-- ----------------------------
-- Table structure for `ssrs_link_group`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_link_group`;
CREATE TABLE `ssrs_link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_link_group
-- ----------------------------
INSERT INTO `ssrs_link_group` VALUES ('1', '友情链接');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('3', '1', '&#xe62e;', '网站设置', '/websetting/index', '2', '2', '2');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('12', '2', '&#xe614;', '定时任务', '/', null, '20', '1');
INSERT INTO `ssrs_menu` VALUES ('13', '1', '&#xe62e;', '定时任务管理', '/timetask/index', '12', '21', '1');
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
INSERT INTO `ssrs_menu` VALUES ('24', '4', '&#xe614;', '功能组件', '/', null, '40', '1');
INSERT INTO `ssrs_menu` VALUES ('25', '1', '&#xe62e;', '图片播放器', '/swiper/index', '24', '41', '1');
INSERT INTO `ssrs_menu` VALUES ('26', '2', '&#xe62e;', '友情链接', '/link/index', '24', '45', '1');
INSERT INTO `ssrs_menu` VALUES ('27', '3', '&#xe62e;', '数据字典', '/dictionary/index', '24', '49', '1');
INSERT INTO `ssrs_menu` VALUES ('28', '8', '&#xe62e;', '实时控制台日志', '/catlinaLog/out', '2', '53', '1');

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
INSERT INTO `ssrs_pay_setting_alipay` VALUES ('1', '2016091700532697', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'https://openapi.rfhxkewq7tgdev.com/gateway.do', 'http://localhost:8080/aliPay/return', 'http://127.0.0.1:8080/aliPay/notify', 'utf-8', 'JSON', 'RSA2');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

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
INSERT INTO `ssrs_permission` VALUES ('20', '/', '定时任务', null);
INSERT INTO `ssrs_permission` VALUES ('21', '/test/test1', '定时任务管理', '20');
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
INSERT INTO `ssrs_permission` VALUES ('40', '/', '功能组件', null);
INSERT INTO `ssrs_permission` VALUES ('41', '/swiper/index', '图片播放器', '40');
INSERT INTO `ssrs_permission` VALUES ('42', '/swiper/update', '图片播放器编辑', '41');
INSERT INTO `ssrs_permission` VALUES ('43', '/swiper/del', '图片播放器删除', '41');
INSERT INTO `ssrs_permission` VALUES ('44', '/swiper/add', '图片播放器添加', '41');
INSERT INTO `ssrs_permission` VALUES ('45', '/link/index', '友情链接', '40');
INSERT INTO `ssrs_permission` VALUES ('46', '/link/add', '友情链接添加', '45');
INSERT INTO `ssrs_permission` VALUES ('47', '/link/update', '友情链接编辑', '45');
INSERT INTO `ssrs_permission` VALUES ('48', '/link/del', '友情链接删除', '45');
INSERT INTO `ssrs_permission` VALUES ('49', '/dictionary/index', '数据字典', '40');
INSERT INTO `ssrs_permission` VALUES ('50', '/dictionary/add', '数据字典添加', '49');
INSERT INTO `ssrs_permission` VALUES ('51', '/dictionary/update', '数据字典编辑', '49');
INSERT INTO `ssrs_permission` VALUES ('52', '/dictionary/del', '数据字典删除', '49');
INSERT INTO `ssrs_permission` VALUES ('53', '/catlinaLog/out', '实时控制台日志', '1');
INSERT INTO `ssrs_permission` VALUES ('54', '/timetask/add', '定时任务添加', '21');

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
INSERT INTO `ssrs_role_permission` VALUES ('1', '40');
INSERT INTO `ssrs_role_permission` VALUES ('1', '41');
INSERT INTO `ssrs_role_permission` VALUES ('1', '42');
INSERT INTO `ssrs_role_permission` VALUES ('1', '43');
INSERT INTO `ssrs_role_permission` VALUES ('1', '44');
INSERT INTO `ssrs_role_permission` VALUES ('1', '45');
INSERT INTO `ssrs_role_permission` VALUES ('1', '46');
INSERT INTO `ssrs_role_permission` VALUES ('1', '47');
INSERT INTO `ssrs_role_permission` VALUES ('1', '48');
INSERT INTO `ssrs_role_permission` VALUES ('1', '49');
INSERT INTO `ssrs_role_permission` VALUES ('1', '50');
INSERT INTO `ssrs_role_permission` VALUES ('1', '51');
INSERT INTO `ssrs_role_permission` VALUES ('1', '52');
INSERT INTO `ssrs_role_permission` VALUES ('1', '53');
INSERT INTO `ssrs_role_permission` VALUES ('1', '54');

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
) ENGINE=InnoDB AUTO_INCREMENT=4878 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------
INSERT INTO `ssrs_system_log` VALUES ('4788', '127.0.0.1', '/timetask/update', 'Ajax', 'POST', '{\"id\":[\"1\"],\"groupName\":[\"g1\"],\"name\":[\"清除系统日志\"],\"description\":[\"清除系统日志\"],\"cron\":[\"0 0 2 * * ?\"],\"beanName\":[\"com.ssrs.core.timer.job.CleanSystemLogTask\"],\"methodName\":[\"run\"],\"startTime\":[\"2018-12-05 16:45:43\"],\"endTime\":[\"2018-12-31 00:00:00\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:18', '2018-12-07 16:21:18', 'null', '200', '45');
INSERT INTO `ssrs_system_log` VALUES ('4789', '127.0.0.1', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:19', '2018-12-07 16:21:19', 'null', '200', '106');
INSERT INTO `ssrs_system_log` VALUES ('4790', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:51', '2018-12-07 16:21:51', '{}', '200', '105');
INSERT INTO `ssrs_system_log` VALUES ('4791', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:51', '2018-12-07 16:21:51', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4792', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:53', '2018-12-07 16:21:53', 'null', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('4793', '127.0.0.1', '/dictionary/goAddChild', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:22:03', '2018-12-07 16:22:03', '{}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4794', '127.0.0.1', '/dictionary/addChild', 'Ajax', 'POST', '{\"sequence\":[\"7\"],\"text\":[\"<script>alert(1)</script>\"],\"value\":[\"7\"],\"summary\":[\"<script>alert(1)</script>\"],\"typeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:25:03', '2018-12-07 16:25:03', 'null', '200', '160');
INSERT INTO `ssrs_system_log` VALUES ('4795', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:25:09', '2018-12-07 16:25:09', 'null', '200', '127');
INSERT INTO `ssrs_system_log` VALUES ('4796', '127.0.0.1', '/editor/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:27:16', '2018-12-07 16:27:17', '{}', '200', '43');
INSERT INTO `ssrs_system_log` VALUES ('4797', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '94568194-aadd-44f1-a8fc-730c9d281cf2', '2018-12-07 16:27:25', '2018-12-07 16:27:25', '{}', '404', '33');
INSERT INTO `ssrs_system_log` VALUES ('4798', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:00', '2018-12-07 16:37:01', '{}', '200', '76');
INSERT INTO `ssrs_system_log` VALUES ('4799', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'd85577cc-6f87-4bc1-8137-c2c4759978e0', '2018-12-07 16:37:01', '2018-12-07 16:37:01', '{}', '404', '13');
INSERT INTO `ssrs_system_log` VALUES ('4800', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:16', '2018-12-07 16:37:16', '{}', '200', '187');
INSERT INTO `ssrs_system_log` VALUES ('4801', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544171839117\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:19', '2018-12-07 16:37:19', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4802', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:19', '2018-12-07 16:37:20', 'null', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('4803', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', '{}', '200', '107');
INSERT INTO `ssrs_system_log` VALUES ('4804', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', '{}', '200', '104');
INSERT INTO `ssrs_system_log` VALUES ('4805', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', 'null', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4806', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4807', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:25', '2018-12-07 16:37:25', 'null', '200', '9');
INSERT INTO `ssrs_system_log` VALUES ('4808', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:37', '2018-12-07 16:37:38', 'null', '200', '277');
INSERT INTO `ssrs_system_log` VALUES ('4809', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"]}', 'aadec3d3-fb0c-4d32-ac75-6673fba6f5da', '2018-12-07 16:37:38', '2018-12-07 16:37:38', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\n; SQL []; Data truncation: Data too long for column \'summary\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '19');
INSERT INTO `ssrs_system_log` VALUES ('4810', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:44', '2018-12-07 16:37:44', 'null', '200', '38');
INSERT INTO `ssrs_system_log` VALUES ('4811', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"]}', 'd85577cc-6f87-4bc1-8137-c2c4759978e0', '2018-12-07 16:37:44', '2018-12-07 16:37:44', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\n; SQL []; Data truncation: Data too long for column \'summary\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '29');
INSERT INTO `ssrs_system_log` VALUES ('4812', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:39:18', '2018-12-07 16:39:18', 'null', '200', '38');
INSERT INTO `ssrs_system_log` VALUES ('4813', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"11\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"]}', '19f9fdf6-1610-4386-aafc-deb481f119ce', '2018-12-07 16:39:18', '2018-12-07 16:39:18', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\n; SQL []; Data truncation: Data too long for column \'text\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '13');
INSERT INTO `ssrs_system_log` VALUES ('4814', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\"></p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:39:41', '2018-12-07 16:39:41', 'null', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('4815', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"11\"],\"text\":[\"<p style=\\\"text-align: center;\\\"></p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"]}', '4d36a4d0-01c4-4c8a-ae5f-66b56e158b4c', '2018-12-07 16:39:41', '2018-12-07 16:39:41', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\n; SQL []; Data truncation: Data too long for column \'text\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '11');
INSERT INTO `ssrs_system_log` VALUES ('4816', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1></h1><h4><a></a></h4><p></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:14', '2018-12-07 16:40:14', 'null', '200', '37');
INSERT INTO `ssrs_system_log` VALUES ('4817', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:15', '2018-12-07 16:40:15', 'null', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('4818', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:44', '2018-12-07 16:40:44', '{}', '200', '83');
INSERT INTO `ssrs_system_log` VALUES ('4819', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:44', '2018-12-07 16:40:44', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4820', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:45', '2018-12-07 16:40:45', 'null', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('4821', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:47', '2018-12-07 16:40:47', '{}', '200', '77');
INSERT INTO `ssrs_system_log` VALUES ('4822', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:48', '2018-12-07 16:40:48', 'null', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('4823', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:49', '2018-12-07 16:40:49', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4824', '127.0.0.1', '/dictionary/delChild', 'Ajax', 'POST', '{\"id\":[\"7\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:51', '2018-12-07 16:40:51', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4825', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:51', '2018-12-07 16:40:51', 'null', '200', '43');
INSERT INTO `ssrs_system_log` VALUES ('4826', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:53', '2018-12-07 16:40:53', '{}', '200', '88');
INSERT INTO `ssrs_system_log` VALUES ('4827', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:53', '2018-12-07 16:40:53', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4828', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:55', '2018-12-07 16:40:55', 'null', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('4829', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:57', '2018-12-07 16:40:57', '{}', '200', '116');
INSERT INTO `ssrs_system_log` VALUES ('4830', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:58', '2018-12-07 16:40:58', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4831', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:04', '2018-12-07 16:41:04', 'null', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4832', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:16', '2018-12-07 16:41:16', '{}', '200', '126');
INSERT INTO `ssrs_system_log` VALUES ('4833', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:17', '2018-12-07 16:41:17', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4834', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:17', '2018-12-07 16:41:18', '{}', '200', '174');
INSERT INTO `ssrs_system_log` VALUES ('4835', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:18', '2018-12-07 16:41:18', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4836', '106.19.136.17', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:17', '2018-12-11 11:06:17', 'null', '200', '289');
INSERT INTO `ssrs_system_log` VALUES ('4837', '106.19.136.17', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497579999\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:19', '2018-12-11 11:06:19', 'null', '200', '2');
INSERT INTO `ssrs_system_log` VALUES ('4838', '106.19.136.17', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:20', '2018-12-11 11:06:20', 'null', '200', '34');
INSERT INTO `ssrs_system_log` VALUES ('4839', '106.19.136.17', '/timetask/index', 'Json', 'GET', '{}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:21', '2018-12-11 11:06:21', '{}', '200', '106');
INSERT INTO `ssrs_system_log` VALUES ('4840', '106.19.136.17', '/timetask/index', 'Json', 'GET', '{}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:21', '2018-12-11 11:06:21', '{}', '200', '105');
INSERT INTO `ssrs_system_log` VALUES ('4841', '106.19.136.17', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:21', '2018-12-11 11:06:21', 'null', '200', '29');
INSERT INTO `ssrs_system_log` VALUES ('4842', '106.19.136.17', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:21', '2018-12-11 11:06:21', 'null', '200', '40');
INSERT INTO `ssrs_system_log` VALUES ('4843', '106.19.136.17', '/timetask/publishJob', 'Ajax', 'POST', '{\"id\":[\"3\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:40', '2018-12-11 11:06:40', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4844', '106.19.136.17', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:40', '2018-12-11 11:06:41', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4845', '106.19.136.17', '/timetask/publishJob', 'Ajax', 'POST', '{\"id\":[\"2\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:42', '2018-12-11 11:06:42', 'null', '200', '23');
INSERT INTO `ssrs_system_log` VALUES ('4846', '106.19.136.17', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:42', '2018-12-11 11:06:42', 'null', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4847', '106.19.136.17', '/timetask/publishJob', 'Ajax', 'POST', '{\"id\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:43', '2018-12-11 11:06:43', 'null', '200', '32');
INSERT INTO `ssrs_system_log` VALUES ('4848', '106.19.136.17', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:43', '2018-12-11 11:06:43', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4849', '106.19.136.17', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497610940\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:50', '2018-12-11 11:06:50', 'null', '200', '1');
INSERT INTO `ssrs_system_log` VALUES ('4850', '106.19.136.17', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:50', '2018-12-11 11:06:50', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4851', '106.19.136.17', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497614469\"]}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:53', '2018-12-11 11:06:53', 'null', '200', '1');
INSERT INTO `ssrs_system_log` VALUES ('4852', '106.19.136.17', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '7b573dff-ba4b-49cc-a696-371a5f8002da', '2018-12-11 11:06:54', '2018-12-11 11:06:54', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4853', '36.5.157.247', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:07:34', '2018-12-11 11:07:34', 'null', '200', '128');
INSERT INTO `ssrs_system_log` VALUES ('4854', '36.5.157.247', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497657700\"]}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:07:36', '2018-12-11 11:07:36', 'null', '200', '1');
INSERT INTO `ssrs_system_log` VALUES ('4855', '36.5.157.247', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:07:38', '2018-12-11 11:07:38', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4856', '36.5.157.247', '/permission/index', 'Json', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:07:54', '2018-12-11 11:07:54', '{}', '200', '35');
INSERT INTO `ssrs_system_log` VALUES ('4857', '36.5.157.247', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:07:54', '2018-12-11 11:07:54', 'null', '200', '23');
INSERT INTO `ssrs_system_log` VALUES ('4858', '36.5.157.247', '/role/index', 'Json', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:00', '2018-12-11 11:08:00', '{}', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('4859', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:00', '2018-12-11 11:08:00', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4860', '36.5.157.247', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:03', '2018-12-11 11:08:04', 'null', '200', '510');
INSERT INTO `ssrs_system_log` VALUES ('4861', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:06', '2018-12-11 11:08:06', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4862', '36.5.157.247', '/role/goAdd', 'Json', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:09', '2018-12-11 11:08:09', '{}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4863', '36.5.157.247', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:09', '2018-12-11 11:08:10', 'null', '200', '491');
INSERT INTO `ssrs_system_log` VALUES ('4864', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:11', '2018-12-11 11:08:11', 'null', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4865', '36.5.157.247', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', 'a6aa169b-b84f-4e93-8d6b-de56b4362698', '2018-12-11 11:08:24', '2018-12-11 11:08:25', 'null', '200', '746');
INSERT INTO `ssrs_system_log` VALUES ('4866', '61.151.178.163', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497657700\"]}', '5fe2aa7b-566e-4348-9a0c-70c8a23dad6c', '2018-12-11 11:08:35', '2018-12-11 11:08:35', 'null', '200', '2');
INSERT INTO `ssrs_system_log` VALUES ('4867', '36.5.157.247', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:08:57', '2018-12-11 11:08:57', 'null', '200', '248');
INSERT INTO `ssrs_system_log` VALUES ('4868', '36.5.157.247', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497740877\"]}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:08:59', '2018-12-11 11:08:59', 'null', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4869', '36.5.157.247', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:01', '2018-12-11 11:09:01', 'null', '200', '29');
INSERT INTO `ssrs_system_log` VALUES ('4870', '36.5.157.247', '/role/index', 'Json', 'GET', '{}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:06', '2018-12-11 11:09:06', '{}', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('4871', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:07', '2018-12-11 11:09:07', 'null', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4872', '36.5.157.247', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:09', '2018-12-11 11:09:09', 'null', '200', '565');
INSERT INTO `ssrs_system_log` VALUES ('4873', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:15', '2018-12-11 11:09:15', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4874', '36.5.157.247', '/role/goAdd', 'Json', 'GET', '{}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:16', '2018-12-11 11:09:16', '{}', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('4875', '36.5.157.247', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:16', '2018-12-11 11:09:17', 'null', '200', '782');
INSERT INTO `ssrs_system_log` VALUES ('4876', '36.5.157.247', '/role/getRolePage', 'Ajax', 'POST', '{\"limit\":[\"10\"],\"page\":[\"1\"]}', '509b31e6-fde4-4b45-8241-4af57380195f', '2018-12-11 11:09:26', '2018-12-11 11:09:26', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4877', '101.91.62.65', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544497740877\"]}', 'abd8f1a3-703e-4893-ae60-1fa3b74a5dab', '2018-12-11 11:09:59', '2018-12-11 11:09:59', 'null', '200', '1');

-- ----------------------------
-- Table structure for `ssrs_timetask`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_timetask`;
CREATE TABLE `ssrs_timetask` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增主键',
  `name` varchar(50) NOT NULL COMMENT '任务名',
  `group_name` varchar(50) NOT NULL COMMENT '任务组',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `cron` varchar(30) NOT NULL COMMENT 'cron表达式',
  `job_status` varchar(20) NOT NULL COMMENT '发布状态',
  `plan_status` varchar(255) NOT NULL COMMENT '计划状态',
  `is_concurrent` tinyint(4) NOT NULL COMMENT '运行状态',
  `job_data` varchar(50) DEFAULT NULL COMMENT '参数',
  `method_name` varchar(50) NOT NULL COMMENT '方法',
  `bean_name` varchar(100) NOT NULL COMMENT '实例bean',
  `description` varchar(255) NOT NULL COMMENT '任务描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改者id',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_timetask
-- ----------------------------
INSERT INTO `ssrs_timetask` VALUES ('1', '清除系统日志', 'g1', '2018-12-05 16:45:43', '2018-12-31 00:00:00', '0 0 2 * * ?', '0', 'NONE', '0', null, 'run', 'com.ssrs.core.timer.job.CleanSystemLogTask', '清除系统日志', '15', '2018-12-05 16:46:06', '15', '2018-12-07 16:21:18');
INSERT INTO `ssrs_timetask` VALUES ('2', '初始化数据库', 'g1', '2018-12-07 10:43:54', '2019-12-07 00:00:00', '0 0 0/1 * * ?', '0', 'NONE', '0', null, 'run', 'com.ssrs.core.timer.job.InitQuellaDataTask', '初始化数据库', '15', '2018-12-07 10:44:14', '15', '2018-12-07 10:49:53');
INSERT INTO `ssrs_timetask` VALUES ('3', '站点统计数据到数据库', 'g1', '2018-12-07 10:46:35', '2020-12-07 00:00:00', '0 59 23 * * ? *', '0', 'NONE', '0', null, 'run', 'com.ssrs.core.timer.job.SaveWebStatisticsTask', '定时保存每日站点统计数据到数据库', '15', '2018-12-07 10:46:43', '15', '2018-12-07 10:46:43');

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
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-12-11 11:08:57', '1');

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
-- Table structure for `ssrs_web_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_web_setting`;
CREATE TABLE `ssrs_web_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(50) NOT NULL COMMENT '网站名称',
  `sige_size` int(1) DEFAULT NULL COMMENT '验证码位数',
  `sign_active_time` int(2) DEFAULT NULL COMMENT '验证码有效时间（单位分钟）',
  `fotter_info` varchar(100) NOT NULL COMMENT '网站底部信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目配置表，有且仅有一条数据，不要删除';

-- ----------------------------
-- Records of ssrs_web_setting
-- ----------------------------
INSERT INTO `ssrs_web_setting` VALUES ('1', 'Quella 1.4', '4', '5', '2018 © 上善若水 Apache License 2.0');

-- ----------------------------
-- Table structure for `ssrs_web_visit_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_web_visit_count`;
CREATE TABLE `ssrs_web_visit_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_count` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '每日ip数',
  `pv_count` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '每日pv数',
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='站点统计表';

-- ----------------------------
-- Records of ssrs_web_visit_count
-- ----------------------------
INSERT INTO `ssrs_web_visit_count` VALUES ('1', '00000000084', '00000000174', '2018-10-26');
INSERT INTO `ssrs_web_visit_count` VALUES ('2', '00000000052', '00000000095', '2018-10-27');
INSERT INTO `ssrs_web_visit_count` VALUES ('3', '00000000027', '00000000046', '2018-10-28');
INSERT INTO `ssrs_web_visit_count` VALUES ('4', '00000000020', '00000000035', '2018-10-29');
INSERT INTO `ssrs_web_visit_count` VALUES ('5', '00000000027', '00000000077', '2018-10-30');
INSERT INTO `ssrs_web_visit_count` VALUES ('6', '00000000018', '00000000049', '2018-10-31');
INSERT INTO `ssrs_web_visit_count` VALUES ('7', '00000000017', '00000000026', '2018-11-01');
INSERT INTO `ssrs_web_visit_count` VALUES ('8', '00000000014', '00000000031', '2018-11-02');
INSERT INTO `ssrs_web_visit_count` VALUES ('9', '00000000006', '00000000006', '2018-11-03');
INSERT INTO `ssrs_web_visit_count` VALUES ('10', '00000000009', '00000000014', '2018-11-04');
INSERT INTO `ssrs_web_visit_count` VALUES ('11', '00000000008', '00000000041', '2018-11-05');
INSERT INTO `ssrs_web_visit_count` VALUES ('12', '00000000011', '00000000021', '2018-11-06');
INSERT INTO `ssrs_web_visit_count` VALUES ('13', '00000000010', '00000000027', '2018-11-07');
INSERT INTO `ssrs_web_visit_count` VALUES ('14', '00000000014', '00000000022', '2018-11-08');
INSERT INTO `ssrs_web_visit_count` VALUES ('15', '00000000005', '00000000011', '2018-11-09');
INSERT INTO `ssrs_web_visit_count` VALUES ('16', '00000000009', '00000000022', '2018-11-10');
INSERT INTO `ssrs_web_visit_count` VALUES ('17', '00000000002', '00000000003', '2018-11-11');
INSERT INTO `ssrs_web_visit_count` VALUES ('18', '00000000007', '00000000017', '2018-11-12');
INSERT INTO `ssrs_web_visit_count` VALUES ('19', '00000000012', '00000000024', '2018-11-13');
INSERT INTO `ssrs_web_visit_count` VALUES ('20', '00000000010', '00000000012', '2018-11-14');
INSERT INTO `ssrs_web_visit_count` VALUES ('21', '00000000005', '00000000009', '2018-11-15');
INSERT INTO `ssrs_web_visit_count` VALUES ('22', '00000000018', '00000000035', '2018-11-16');
INSERT INTO `ssrs_web_visit_count` VALUES ('23', '00000000007', '00000000012', '2018-11-17');
INSERT INTO `ssrs_web_visit_count` VALUES ('24', '00000000006', '00000000012', '2018-11-18');
INSERT INTO `ssrs_web_visit_count` VALUES ('25', '00000000014', '00000000022', '2018-11-19');
INSERT INTO `ssrs_web_visit_count` VALUES ('26', '00000000010', '00000000017', '2018-11-20');
INSERT INTO `ssrs_web_visit_count` VALUES ('27', '00000000019', '00000000029', '2018-11-21');
INSERT INTO `ssrs_web_visit_count` VALUES ('28', '00000000006', '00000000018', '2018-11-22');
INSERT INTO `ssrs_web_visit_count` VALUES ('29', '00000000009', '00000000013', '2018-11-23');
INSERT INTO `ssrs_web_visit_count` VALUES ('30', '00000000003', '00000000008', '2018-11-24');
INSERT INTO `ssrs_web_visit_count` VALUES ('31', '00000000005', '00000000012', '2018-11-25');
INSERT INTO `ssrs_web_visit_count` VALUES ('32', '00000000010', '00000000018', '2018-11-26');
INSERT INTO `ssrs_web_visit_count` VALUES ('33', '00000000010', '00000000014', '2018-11-27');
INSERT INTO `ssrs_web_visit_count` VALUES ('34', '00000000017', '00000000030', '2018-11-28');
INSERT INTO `ssrs_web_visit_count` VALUES ('35', '00000000014', '00000000029', '2018-11-29');
INSERT INTO `ssrs_web_visit_count` VALUES ('36', '00000000078', '00000000144', '2018-11-30');
INSERT INTO `ssrs_web_visit_count` VALUES ('37', '00000000095', '00000000194', '2018-12-01');
INSERT INTO `ssrs_web_visit_count` VALUES ('38', '00000000029', '00000000060', '2018-12-02');
INSERT INTO `ssrs_web_visit_count` VALUES ('39', '00000000061', '00000000102', '2018-12-03');
INSERT INTO `ssrs_web_visit_count` VALUES ('40', '00000000037', '00000000070', '2018-12-04');
INSERT INTO `ssrs_web_visit_count` VALUES ('41', '00000000015', '00000000024', '2018-12-05');
INSERT INTO `ssrs_web_visit_count` VALUES ('42', '00000000021', '00000000036', '2018-12-06');
INSERT INTO `ssrs_web_visit_count` VALUES ('43', '00000000017', '00000000026', '2018-12-07');
INSERT INTO `ssrs_web_visit_count` VALUES ('44', '00000000077', '00000000132', '2018-12-09');
INSERT INTO `ssrs_web_visit_count` VALUES ('45', '00000000031', '00000000075', '2018-12-10');

-- ----------------------------
-- Procedure structure for `init_quella_data`
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_quella_data`;
DELIMITER ;;
CREATE DEFINER=`quella`@`%` PROCEDURE `init_quella_data`()
BEGIN
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
INSERT INTO `ssrs_alidayu` VALUES ('1', 'LTAIh3zv5e82VE8O', 'ecB3c8naMHwSJUYXmxlbU1uFvEbcfL', '上善若水', 'SMS_126355465', '4');

-- ----------------------------
-- Table structure for `ssrs_dictionary_item`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_dictionary_item`;
CREATE TABLE `ssrs_dictionary_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(4) NOT NULL COMMENT '序号',
  `summary` varchar(200) DEFAULT NULL COMMENT '描述',
  `text` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL COMMENT '值',
  `type_id` int(11) NOT NULL COMMENT '所属字典类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_dictionary_item
-- ----------------------------
INSERT INTO `ssrs_dictionary_item` VALUES ('1', '1', '', '普通切换', '1', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('2', '2', '', '普通切换带按钮', '2', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('3', '3', '', '圆点分页器', '3', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('4', '4', '', '数字分页器', '4', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('5', '5', '', '渐变切换', '5', '1');
INSERT INTO `ssrs_dictionary_item` VALUES ('6', '6', '', '垂直切换', '6', '1');

-- ----------------------------
-- Table structure for `ssrs_dictionary_type`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_dictionary_type`;
CREATE TABLE `ssrs_dictionary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `name` varchar(100) NOT NULL COMMENT '字典类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of ssrs_dictionary_type
-- ----------------------------
INSERT INTO `ssrs_dictionary_type` VALUES ('1', 'imagePlayerType', '图片播放器类型');

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
INSERT INTO `ssrs_file_qiniu` VALUES ('1', 'IlBRNaLvTMqkK2PDsNC4f88lvVqbvSOqq090wmoD', 'inSvt0XaIe1d_4zVcL4IjRg6V91SbO1-hkGRQJgz', 'quella', 'http://qiniu.ssrsdev.top', 'zone2');

-- ----------------------------
-- Table structure for `ssrs_image_player`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_image_player`;
CREATE TABLE `ssrs_image_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '播放器名称',
  `width` int(11) NOT NULL COMMENT '播放器宽度',
  `height` int(11) NOT NULL COMMENT '播放器高度',
  `swiper_type` int(11) NOT NULL COMMENT '播放器类型',
  `display_count` int(11) NOT NULL COMMENT '播放器显示最大条数',
  `display_desc` varchar(2) NOT NULL COMMENT '是否反序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_image_player
-- ----------------------------
INSERT INTO `ssrs_image_player` VALUES ('1', '图片播放器1', '700', '380', '5', '5', 'N');

-- ----------------------------
-- Table structure for `ssrs_image_player_resources`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_image_player_resources`;
CREATE TABLE `ssrs_image_player_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `sequence` int(4) NOT NULL COMMENT '序号（数字越大越靠前，1-9999之间，默认是50）',
  `img` varchar(200) NOT NULL COMMENT '图片地址',
  `url` varchar(200) DEFAULT NULL COMMENT '图片需要跳转的地址',
  `time` datetime NOT NULL COMMENT '发布时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `type` int(1) NOT NULL COMMENT '是否关闭（关闭将不显示，1：显示，2：关闭）',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `summary` varchar(200) DEFAULT NULL COMMENT '概述（1-100之间）',
  `image_player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='图片播放器图片列表';

-- ----------------------------
-- Records of ssrs_image_player_resources
-- ----------------------------
INSERT INTO `ssrs_image_player_resources` VALUES ('4', '1', 'http://qiniu.ssrsdev.top/FvadGPXhFrPmu3ciAVhC5Uc5lu0_', '/', '2018-10-23 14:19:47', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片1', '图片1', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('5', '2', 'http://qiniu.ssrsdev.top/FnGYiGca3CrAc28tMWrNHAwC0LLi', '/', '2018-10-23 14:20:25', '2018-10-01 00:00:00', '2019-12-01 00:00:00', '1', '图片2', '图片2', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('6', '3', 'http://qiniu.ssrsdev.top/FgKIV1-HzUKv9weVX4mo2ZJrucvz', '/', '2018-10-23 14:20:55', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片3', '图片3', '1');
INSERT INTO `ssrs_image_player_resources` VALUES ('7', '4', 'http://qiniu.ssrsdev.top/FgwiU2SSPQ6RIYdYpcpD32lBy3ct', '/', '2018-10-23 14:21:22', '2018-10-01 00:00:00', '2019-11-01 00:00:00', '1', '图片4', '图片4', '1');

-- ----------------------------
-- Table structure for `ssrs_link`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_link`;
CREATE TABLE `ssrs_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_link
-- ----------------------------
INSERT INTO `ssrs_link` VALUES ('2', '1', '友情链接2', '/', 'http://qiniu.ssrsdev.top/FgJgXDK_6NJZ8Glz9NWUJJvfK4iv');

-- ----------------------------
-- Table structure for `ssrs_link_group`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_link_group`;
CREATE TABLE `ssrs_link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_link_group
-- ----------------------------
INSERT INTO `ssrs_link_group` VALUES ('1', '友情链接');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('3', '1', '&#xe62e;', '网站设置', '/websetting/index', '2', '2', '2');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('12', '2', '&#xe614;', '定时任务', '/', null, '20', '1');
INSERT INTO `ssrs_menu` VALUES ('13', '1', '&#xe62e;', '定时任务管理', '/timetask/index', '12', '21', '1');
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
INSERT INTO `ssrs_menu` VALUES ('24', '4', '&#xe614;', '功能组件', '/', null, '40', '1');
INSERT INTO `ssrs_menu` VALUES ('25', '1', '&#xe62e;', '图片播放器', '/swiper/index', '24', '41', '1');
INSERT INTO `ssrs_menu` VALUES ('26', '2', '&#xe62e;', '友情链接', '/link/index', '24', '45', '1');
INSERT INTO `ssrs_menu` VALUES ('27', '3', '&#xe62e;', '数据字典', '/dictionary/index', '24', '49', '1');
INSERT INTO `ssrs_menu` VALUES ('28', '8', '&#xe62e;', '实时控制台日志', '/catlinaLog/out', '2', '53', '1');

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
INSERT INTO `ssrs_pay_setting_alipay` VALUES ('1', '2016091700532697', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'https://openapi.rfhxkewq7tgdev.com/gateway.do', 'http://localhost:8080/aliPay/return', 'http://127.0.0.1:8080/aliPay/notify', 'utf-8', 'JSON', 'RSA2');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

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
INSERT INTO `ssrs_permission` VALUES ('20', '/', '定时任务', null);
INSERT INTO `ssrs_permission` VALUES ('21', '/test/test1', '定时任务管理', '20');
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
INSERT INTO `ssrs_permission` VALUES ('40', '/', '功能组件', null);
INSERT INTO `ssrs_permission` VALUES ('41', '/swiper/index', '图片播放器', '40');
INSERT INTO `ssrs_permission` VALUES ('42', '/swiper/update', '图片播放器编辑', '41');
INSERT INTO `ssrs_permission` VALUES ('43', '/swiper/del', '图片播放器删除', '41');
INSERT INTO `ssrs_permission` VALUES ('44', '/swiper/add', '图片播放器添加', '41');
INSERT INTO `ssrs_permission` VALUES ('45', '/link/index', '友情链接', '40');
INSERT INTO `ssrs_permission` VALUES ('46', '/link/add', '友情链接添加', '45');
INSERT INTO `ssrs_permission` VALUES ('47', '/link/update', '友情链接编辑', '45');
INSERT INTO `ssrs_permission` VALUES ('48', '/link/del', '友情链接删除', '45');
INSERT INTO `ssrs_permission` VALUES ('49', '/dictionary/index', '数据字典', '40');
INSERT INTO `ssrs_permission` VALUES ('50', '/dictionary/add', '数据字典添加', '49');
INSERT INTO `ssrs_permission` VALUES ('51', '/dictionary/update', '数据字典编辑', '49');
INSERT INTO `ssrs_permission` VALUES ('52', '/dictionary/del', '数据字典删除', '49');
INSERT INTO `ssrs_permission` VALUES ('53', '/catlinaLog/out', '实时控制台日志', '1');
INSERT INTO `ssrs_permission` VALUES ('54', '/timetask/add', '定时任务添加', '21');

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
INSERT INTO `ssrs_role_permission` VALUES ('1', '40');
INSERT INTO `ssrs_role_permission` VALUES ('1', '41');
INSERT INTO `ssrs_role_permission` VALUES ('1', '42');
INSERT INTO `ssrs_role_permission` VALUES ('1', '43');
INSERT INTO `ssrs_role_permission` VALUES ('1', '44');
INSERT INTO `ssrs_role_permission` VALUES ('1', '45');
INSERT INTO `ssrs_role_permission` VALUES ('1', '46');
INSERT INTO `ssrs_role_permission` VALUES ('1', '47');
INSERT INTO `ssrs_role_permission` VALUES ('1', '48');
INSERT INTO `ssrs_role_permission` VALUES ('1', '49');
INSERT INTO `ssrs_role_permission` VALUES ('1', '50');
INSERT INTO `ssrs_role_permission` VALUES ('1', '51');
INSERT INTO `ssrs_role_permission` VALUES ('1', '52');
INSERT INTO `ssrs_role_permission` VALUES ('1', '53');
INSERT INTO `ssrs_role_permission` VALUES ('1', '54');

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
) ENGINE=InnoDB AUTO_INCREMENT=4836 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------
INSERT INTO `ssrs_system_log` VALUES ('4788', '127.0.0.1', '/timetask/update', 'Ajax', 'POST', '{\"id\":[\"1\"],\"groupName\":[\"g1\"],\"name\":[\"清除系统日志\"],\"description\":[\"清除系统日志\"],\"cron\":[\"0 0 2 * * ?\"],\"beanName\":[\"com.ssrs.core.timer.job.CleanSystemLogTask\"],\"methodName\":[\"run\"],\"startTime\":[\"2018-12-05 16:45:43\"],\"endTime\":[\"2018-12-31 00:00:00\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:18', '2018-12-07 16:21:18', 'null', '200', '45');
INSERT INTO `ssrs_system_log` VALUES ('4789', '127.0.0.1', '/timetask/getTimeTaskPageInfo', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:19', '2018-12-07 16:21:19', 'null', '200', '106');
INSERT INTO `ssrs_system_log` VALUES ('4790', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:51', '2018-12-07 16:21:51', '{}', '200', '105');
INSERT INTO `ssrs_system_log` VALUES ('4791', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:51', '2018-12-07 16:21:51', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4792', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:21:53', '2018-12-07 16:21:53', 'null', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('4793', '127.0.0.1', '/dictionary/goAddChild', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:22:03', '2018-12-07 16:22:03', '{}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4794', '127.0.0.1', '/dictionary/addChild', 'Ajax', 'POST', '{\"sequence\":[\"7\"],\"text\":[\"<script>alert(1)</script>\"],\"value\":[\"7\"],\"summary\":[\"<script>alert(1)</script>\"],\"typeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:25:03', '2018-12-07 16:25:03', 'null', '200', '160');
INSERT INTO `ssrs_system_log` VALUES ('4795', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:25:09', '2018-12-07 16:25:09', 'null', '200', '127');
INSERT INTO `ssrs_system_log` VALUES ('4796', '127.0.0.1', '/editor/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:27:16', '2018-12-07 16:27:17', '{}', '200', '43');
INSERT INTO `ssrs_system_log` VALUES ('4797', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '94568194-aadd-44f1-a8fc-730c9d281cf2', '2018-12-07 16:27:25', '2018-12-07 16:27:25', '{}', '404', '33');
INSERT INTO `ssrs_system_log` VALUES ('4798', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:00', '2018-12-07 16:37:01', '{}', '200', '76');
INSERT INTO `ssrs_system_log` VALUES ('4799', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'd85577cc-6f87-4bc1-8137-c2c4759978e0', '2018-12-07 16:37:01', '2018-12-07 16:37:01', '{}', '404', '13');
INSERT INTO `ssrs_system_log` VALUES ('4800', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:16', '2018-12-07 16:37:16', '{}', '200', '187');
INSERT INTO `ssrs_system_log` VALUES ('4801', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1544171839117\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:19', '2018-12-07 16:37:19', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4802', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:19', '2018-12-07 16:37:20', 'null', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('4803', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', '{}', '200', '107');
INSERT INTO `ssrs_system_log` VALUES ('4804', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', '{}', '200', '104');
INSERT INTO `ssrs_system_log` VALUES ('4805', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', 'null', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4806', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:20', '2018-12-07 16:37:20', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4807', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:25', '2018-12-07 16:37:25', 'null', '200', '9');
INSERT INTO `ssrs_system_log` VALUES ('4808', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:37', '2018-12-07 16:37:38', 'null', '200', '277');
INSERT INTO `ssrs_system_log` VALUES ('4809', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"]}', 'aadec3d3-fb0c-4d32-ac75-6673fba6f5da', '2018-12-07 16:37:38', '2018-12-07 16:37:38', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\n; SQL []; Data truncation: Data too long for column \'summary\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '19');
INSERT INTO `ssrs_system_log` VALUES ('4810', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:37:44', '2018-12-07 16:37:44', 'null', '200', '38');
INSERT INTO `ssrs_system_log` VALUES ('4811', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a>项目介绍</h4><p>因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率 也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。</p><p>这里说明一下，因为Quella的设计是\\u00A0<strong>面向分布式集群部署</strong>\\u00A0的，所以在框架的选择上都是可以分布式部署的。</p><p>\\\"Quella\\\"中译英为\\\"杀手\\\"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy :)</p><p><br></p>\"],\"value\":[\"7\"]}', 'd85577cc-6f87-4bc1-8137-c2c4759978e0', '2018-12-07 16:37:44', '2018-12-07 16:37:44', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\\n; SQL []; Data truncation: Data too long for column \'summary\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'summary\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '29');
INSERT INTO `ssrs_system_log` VALUES ('4812', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:39:18', '2018-12-07 16:39:18', 'null', '200', '38');
INSERT INTO `ssrs_system_log` VALUES ('4813', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"11\"],\"text\":[\"<p style=\\\"text-align: center;\\\">这是一条重要通知</p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a id=\\\"项目介绍\\\" href=\\\"https://gitee.com/quella01/Quella#%E9%A1%B9%E7%9B%AE%E4%BB%8B%E7%BB%8D\\\"></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"]}', '19f9fdf6-1610-4386-aafc-deb481f119ce', '2018-12-07 16:39:18', '2018-12-07 16:39:18', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\n; SQL []; Data truncation: Data too long for column \'text\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '13');
INSERT INTO `ssrs_system_log` VALUES ('4814', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\"></p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:39:41', '2018-12-07 16:39:41', 'null', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('4815', '127.0.0.1', '/open/500', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"summary\":[\"11\"],\"text\":[\"<p style=\\\"text-align: center;\\\"></p><p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1>Quella</h1><h4><a></a></h4><p></p><p><br></p>\"],\"value\":[\"7\"]}', '4d36a4d0-01c4-4c8a-ae5f-66b56e158b4c', '2018-12-07 16:39:41', '2018-12-07 16:39:41', '{\"message\":\"Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \\r\\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\r\\n### The error may involve com.ssrs.mapper.DictionaryItemMapper.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE ssrs_dictionary_item  SET `sequence`=?,  summary=?,  `text`=?,  `value`=?  WHERE id=?\\r\\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\\n; SQL []; Data truncation: Data too long for column \'text\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'text\' at row 1\",\"line\":980,\"clazz\":\"org.springframework.web.servlet.FrameworkServlet\",\"methodName\":\"processRequest\"}', '500', '11');
INSERT INTO `ssrs_system_log` VALUES ('4816', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"7\"],\"sequence\":[\"7\"],\"text\":[\"<p style=\\\"text-align: center;\\\"><img src=\\\"http://qiniu.ssrsdev.top/Fp5eazEUjJU7ByVhSD1ClyYOkwun\\\" style=\\\"max-width:100%;\\\"></p><h1></h1><h4><a></a></h4><p></p>\"],\"value\":[\"7\"],\"summary\":[\"11\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:14', '2018-12-07 16:40:14', 'null', '200', '37');
INSERT INTO `ssrs_system_log` VALUES ('4817', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:15', '2018-12-07 16:40:15', 'null', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('4818', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:44', '2018-12-07 16:40:44', '{}', '200', '83');
INSERT INTO `ssrs_system_log` VALUES ('4819', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:44', '2018-12-07 16:40:44', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4820', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:45', '2018-12-07 16:40:45', 'null', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('4821', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:47', '2018-12-07 16:40:47', '{}', '200', '77');
INSERT INTO `ssrs_system_log` VALUES ('4822', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:48', '2018-12-07 16:40:48', 'null', '200', '8');
INSERT INTO `ssrs_system_log` VALUES ('4823', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:49', '2018-12-07 16:40:49', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4824', '127.0.0.1', '/dictionary/delChild', 'Ajax', 'POST', '{\"id\":[\"7\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:51', '2018-12-07 16:40:51', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4825', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:51', '2018-12-07 16:40:51', 'null', '200', '43');
INSERT INTO `ssrs_system_log` VALUES ('4826', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:53', '2018-12-07 16:40:53', '{}', '200', '88');
INSERT INTO `ssrs_system_log` VALUES ('4827', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:53', '2018-12-07 16:40:53', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4828', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:55', '2018-12-07 16:40:55', 'null', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('4829', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:57', '2018-12-07 16:40:57', '{}', '200', '116');
INSERT INTO `ssrs_system_log` VALUES ('4830', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:40:58', '2018-12-07 16:40:58', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4831', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:04', '2018-12-07 16:41:04', 'null', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4832', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:16', '2018-12-07 16:41:16', '{}', '200', '126');
INSERT INTO `ssrs_system_log` VALUES ('4833', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:17', '2018-12-07 16:41:17', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4834', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:17', '2018-12-07 16:41:18', '{}', '200', '174');
INSERT INTO `ssrs_system_log` VALUES ('4835', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', 'b8940e05-7acf-4446-8a71-1f7bb51aa33c', '2018-12-07 16:41:18', '2018-12-07 16:41:18', 'null', '200', '6');

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
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-12-07 16:19:38', '1');

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
-- Table structure for `ssrs_web_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_web_setting`;
CREATE TABLE `ssrs_web_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(50) NOT NULL COMMENT '网站名称',
  `sige_size` int(1) DEFAULT NULL COMMENT '验证码位数',
  `sign_active_time` int(2) DEFAULT NULL COMMENT '验证码有效时间（单位分钟）',
  `fotter_info` varchar(100) NOT NULL COMMENT '网站底部信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目配置表，有且仅有一条数据，不要删除';

-- ----------------------------
-- Records of ssrs_web_setting
-- ----------------------------
INSERT INTO `ssrs_web_setting` VALUES ('1', 'Quella 1.3', '4', '5', '2018 © 上善若水 Apache License 2.0');

-- ----------------------------
-- Table structure for `ssrs_web_visit_count`
-- ----------------------------


-- ----------------------------
-- Records of ssrs_web_visit_count
-- ----------------------------

END
;;
DELIMITER ;
