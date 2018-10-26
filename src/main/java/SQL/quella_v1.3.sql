/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : quella

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-10-26 16:05:26
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4360 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------
INSERT INTO `ssrs_system_log` VALUES ('3886', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:50', '2018-10-24 20:39:50', '{}', '200', '242');
INSERT INTO `ssrs_system_log` VALUES ('3887', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:51', '2018-10-24 20:39:51', 'null', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('3888', '127.0.0.1', '/link/getLinkChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"linkGroupId\":[\"1\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:51', '2018-10-24 20:39:52', 'null', '200', '27');
INSERT INTO `ssrs_system_log` VALUES ('3889', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:53', '2018-10-24 20:39:53', '{}', '200', '48');
INSERT INTO `ssrs_system_log` VALUES ('3890', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:53', '2018-10-24 20:39:53', 'null', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('3891', '127.0.0.1', '/swiper/getSwiperChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"imagePlayerId\":[\"1\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:54', '2018-10-24 20:39:54', 'null', '200', '29');
INSERT INTO `ssrs_system_log` VALUES ('3892', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:58', '2018-10-24 20:39:59', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '387');
INSERT INTO `ssrs_system_log` VALUES ('3893', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540384798902\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:59', '2018-10-24 20:39:59', 'null', '200', '1');
INSERT INTO `ssrs_system_log` VALUES ('3894', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:39:59', '2018-10-24 20:39:59', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('3895', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:40:00', '2018-10-24 20:40:00', '{}', '200', '37');
INSERT INTO `ssrs_system_log` VALUES ('3896', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:40:00', '2018-10-24 20:40:00', '{}', '200', '71');
INSERT INTO `ssrs_system_log` VALUES ('3897', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:40:00', '2018-10-24 20:40:00', 'null', '200', '25');
INSERT INTO `ssrs_system_log` VALUES ('3898', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:40:00', '2018-10-24 20:40:00', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('3899', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 20:40:05', '2018-10-24 20:40:05', '{\"weekWebVisitCount\":null}', '200', '60');
INSERT INTO `ssrs_system_log` VALUES ('3900', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:32:12', '2018-10-24 21:32:12', '{}', '200', '122');
INSERT INTO `ssrs_system_log` VALUES ('3901', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:32:13', '2018-10-24 21:32:13', 'null', '200', '29');
INSERT INTO `ssrs_system_log` VALUES ('3902', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:45:56', '2018-10-24 21:45:56', '{}', '200', '41');
INSERT INTO `ssrs_system_log` VALUES ('3903', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:45:56', '2018-10-24 21:45:56', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('3904', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:45:58', '2018-10-24 21:45:58', '{}', '200', '109');
INSERT INTO `ssrs_system_log` VALUES ('3905', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:45:58', '2018-10-24 21:45:58', 'null', '200', '27');
INSERT INTO `ssrs_system_log` VALUES ('3906', '127.0.0.1', '/link/getLinkChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"linkGroupId\":[\"1\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:46:05', '2018-10-24 21:46:05', 'null', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('3907', '127.0.0.1', '/swiper/getSwiperChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"imagePlayerId\":[\"1\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:46:07', '2018-10-24 21:46:07', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('3908', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', '357b7062-dd89-4dd0-9c5f-933bc93bf04d', '2018-10-24 21:46:08', '2018-10-24 21:46:08', 'null', '200', '68');
INSERT INTO `ssrs_system_log` VALUES ('3909', '127.0.0.1', '/u/login;JSESSIONID=894e4b84-81b7-407d-ace1-23b8b754eb66', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:45', '2018-10-25 12:39:47', '{}', '200', '1552');
INSERT INTO `ssrs_system_log` VALUES ('3910', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:51', '2018-10-25 12:39:52', 'null', '200', '608');
INSERT INTO `ssrs_system_log` VALUES ('3911', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:51', '2018-10-25 12:39:52', 'null', '200', '647');
INSERT INTO `ssrs_system_log` VALUES ('3912', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:53', '2018-10-25 12:39:56', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '2754');
INSERT INTO `ssrs_system_log` VALUES ('3913', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:53', '2018-10-25 12:39:56', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '2615');
INSERT INTO `ssrs_system_log` VALUES ('3914', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540442396157\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:56', '2018-10-25 12:39:56', 'null', '200', '9');
INSERT INTO `ssrs_system_log` VALUES ('3915', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:57', '2018-10-25 12:39:57', 'null', '200', '87');
INSERT INTO `ssrs_system_log` VALUES ('3916', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:39:57', '2018-10-25 12:39:58', '{\"weekWebVisitCount\":null}', '200', '303');
INSERT INTO `ssrs_system_log` VALUES ('3917', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:05', '2018-10-25 12:40:05', '{}', '200', '249');
INSERT INTO `ssrs_system_log` VALUES ('3918', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:06', '2018-10-25 12:40:06', 'null', '200', '73');
INSERT INTO `ssrs_system_log` VALUES ('3919', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:07', '2018-10-25 12:40:07', 'null', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('3920', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:21', '2018-10-25 12:40:21', '{}', '200', '186');
INSERT INTO `ssrs_system_log` VALUES ('3921', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:21', '2018-10-25 12:40:21', 'null', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('3922', '127.0.0.1', '/swiper/goAdd', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:22', '2018-10-25 12:40:22', '{}', '200', '79');
INSERT INTO `ssrs_system_log` VALUES ('3923', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:27', '2018-10-25 12:40:27', 'null', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('3924', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"1\"],\"sequence\":[\"1\"],\"text\":[\"普通切换1\"],\"value\":[\"1\"],\"summary\":[\"\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:32', '2018-10-25 12:40:32', 'null', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('3925', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:33', '2018-10-25 12:40:33', 'null', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('3926', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:37', '2018-10-25 12:40:37', '{}', '200', '55');
INSERT INTO `ssrs_system_log` VALUES ('3927', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:37', '2018-10-25 12:40:37', 'null', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('3928', '127.0.0.1', '/swiper/goAdd', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:38', '2018-10-25 12:40:38', '{}', '200', '39');
INSERT INTO `ssrs_system_log` VALUES ('3929', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:41', '2018-10-25 12:40:42', 'null', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('3930', '127.0.0.1', '/dictionary/updateChild', 'Ajax', 'POST', '{\"id\":[\"1\"],\"sequence\":[\"1\"],\"text\":[\"普通切换\"],\"value\":[\"1\"],\"summary\":[\"\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:50', '2018-10-25 12:40:50', 'null', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('3931', '127.0.0.1', '/dictionary/getDictionaryChildPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictionaryTypeId\":[\"1\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:40:51', '2018-10-25 12:40:51', 'null', '200', '26');
INSERT INTO `ssrs_system_log` VALUES ('3932', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 12:41:35', '2018-10-25 12:41:35', '{\"weekWebVisitCount\":null}', '200', '92');
INSERT INTO `ssrs_system_log` VALUES ('3933', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:00:57', '2018-10-25 14:00:58', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1236');
INSERT INTO `ssrs_system_log` VALUES ('3934', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540447258005\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:00:58', '2018-10-25 14:00:58', 'null', '200', '2');
INSERT INTO `ssrs_system_log` VALUES ('3935', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:00:58', '2018-10-25 14:00:58', 'null', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('3936', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:00:59', '2018-10-25 14:00:59', '{\"weekWebVisitCount\":null}', '200', '95');
INSERT INTO `ssrs_system_log` VALUES ('3937', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:00:59', '2018-10-25 14:00:59', '{\"weekWebVisitCount\":null}', '200', '164');
INSERT INTO `ssrs_system_log` VALUES ('3938', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'f07dc3f1-870c-4211-88a6-3ed7f4a50087', '2018-10-25 14:01:41', '2018-10-25 14:01:41', '{}', '404', '10');
INSERT INTO `ssrs_system_log` VALUES ('3939', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:07', '2018-10-25 14:02:07', '{}', '200', '114');
INSERT INTO `ssrs_system_log` VALUES ('3940', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:07', '2018-10-25 14:02:07', 'null', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('3941', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:08', '2018-10-25 14:02:09', '{}', '200', '210');
INSERT INTO `ssrs_system_log` VALUES ('3942', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:09', '2018-10-25 14:02:09', 'null', '200', '42');
INSERT INTO `ssrs_system_log` VALUES ('3943', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:10', '2018-10-25 14:02:10', '{}', '200', '67');
INSERT INTO `ssrs_system_log` VALUES ('3944', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '894e4b84-81b7-407d-ace1-23b8b754eb66', '2018-10-25 14:02:10', '2018-10-25 14:02:10', 'null', '200', '41');
INSERT INTO `ssrs_system_log` VALUES ('3945', '127.0.0.1', '/u/login;JSESSIONID=605c2b6b-a13a-4142-bf74-40538b77181a', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:27', '2018-10-25 20:26:28', '{}', '200', '1321');
INSERT INTO `ssrs_system_log` VALUES ('3946', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:35', '2018-10-25 20:26:36', 'null', '200', '605');
INSERT INTO `ssrs_system_log` VALUES ('3947', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:35', '2018-10-25 20:26:36', 'null', '200', '560');
INSERT INTO `ssrs_system_log` VALUES ('3948', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:37', '2018-10-25 20:26:39', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1713');
INSERT INTO `ssrs_system_log` VALUES ('3949', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:37', '2018-10-25 20:26:39', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1676');
INSERT INTO `ssrs_system_log` VALUES ('3950', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540470398603\"]}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:39', '2018-10-25 20:26:39', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('3951', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:39', '2018-10-25 20:26:39', 'null', '200', '176');
INSERT INTO `ssrs_system_log` VALUES ('3952', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:40', '2018-10-25 20:26:40', '{\"weekWebVisitCount\":null}', '200', '356');
INSERT INTO `ssrs_system_log` VALUES ('3953', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:26:47', '2018-10-25 20:26:48', '{\"path\":\"http://localhost:80/\"}', '200', '1933');
INSERT INTO `ssrs_system_log` VALUES ('3954', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:28:16', '2018-10-25 20:28:18', '{\"path\":\"http://localhost:80/\"}', '200', '1704');
INSERT INTO `ssrs_system_log` VALUES ('3955', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:28:54', '2018-10-25 20:28:54', '{\"path\":\"http://localhost:80/\"}', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('3956', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:28:55', '2018-10-25 20:28:55', 'null', '101', '128');
INSERT INTO `ssrs_system_log` VALUES ('3957', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:34:09', '2018-10-25 20:34:09', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('3958', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:34:10', '2018-10-25 20:34:10', 'null', '101', '276');
INSERT INTO `ssrs_system_log` VALUES ('3959', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:37:58', '2018-10-25 20:37:59', '{\"path\":\"http://localhost:80/\"}', '200', '825');
INSERT INTO `ssrs_system_log` VALUES ('3960', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:38:01', '2018-10-25 20:38:01', 'null', '101', '69');
INSERT INTO `ssrs_system_log` VALUES ('3961', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:52:17', '2018-10-25 20:52:17', '{\"path\":\"http://localhost:80/\"}', '200', '253');
INSERT INTO `ssrs_system_log` VALUES ('3962', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:52:18', '2018-10-25 20:52:18', 'null', '101', '147');
INSERT INTO `ssrs_system_log` VALUES ('3963', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:53:48', '2018-10-25 20:53:48', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('3964', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:53:49', '2018-10-25 20:53:49', 'null', '101', '14');
INSERT INTO `ssrs_system_log` VALUES ('3965', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:54:04', '2018-10-25 20:54:04', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('3966', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:54:05', '2018-10-25 20:54:05', 'null', '101', '15');
INSERT INTO `ssrs_system_log` VALUES ('3967', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:56:53', '2018-10-25 20:56:54', '{\"path\":\"http://localhost:80/\"}', '200', '250');
INSERT INTO `ssrs_system_log` VALUES ('3968', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:56:55', '2018-10-25 20:56:55', 'null', '101', '389');
INSERT INTO `ssrs_system_log` VALUES ('3969', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:57:38', '2018-10-25 20:57:38', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('3970', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:57:38', '2018-10-25 20:57:38', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('3971', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:58:46', '2018-10-25 20:58:46', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('3972', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:58:46', '2018-10-25 20:58:46', 'null', '101', '12');
INSERT INTO `ssrs_system_log` VALUES ('3973', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:59:42', '2018-10-25 20:59:42', '{\"path\":\"http://localhost:80/\"}', '200', '314');
INSERT INTO `ssrs_system_log` VALUES ('3974', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 20:59:43', '2018-10-25 20:59:43', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('3975', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:02:38', '2018-10-25 21:02:38', '{\"path\":\"http://localhost:80/\"}', '200', '371');
INSERT INTO `ssrs_system_log` VALUES ('3976', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:02:40', '2018-10-25 21:02:40', 'null', '101', '98');
INSERT INTO `ssrs_system_log` VALUES ('3977', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:38:23', '2018-10-25 21:38:23', '{\"path\":\"http://localhost:80/\"}', '200', '212');
INSERT INTO `ssrs_system_log` VALUES ('3978', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:38:24', '2018-10-25 21:38:24', 'null', '101', '65');
INSERT INTO `ssrs_system_log` VALUES ('3979', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:38:59', '2018-10-25 21:38:59', '{\"path\":\"http://localhost:80/\"}', '200', '24');
INSERT INTO `ssrs_system_log` VALUES ('3980', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:39:00', '2018-10-25 21:39:00', 'null', '101', '17');
INSERT INTO `ssrs_system_log` VALUES ('3981', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:39:05', '2018-10-25 21:39:05', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('3982', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:39:05', '2018-10-25 21:39:05', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('3983', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:40:03', '2018-10-25 21:40:03', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('3984', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:40:04', '2018-10-25 21:40:04', 'null', '101', '18');
INSERT INTO `ssrs_system_log` VALUES ('3985', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:41:09', '2018-10-25 21:41:09', '{\"path\":\"http://localhost:80/\"}', '200', '27');
INSERT INTO `ssrs_system_log` VALUES ('3986', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:41:09', '2018-10-25 21:41:09', 'null', '101', '12');
INSERT INTO `ssrs_system_log` VALUES ('3987', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:41:13', '2018-10-25 21:41:13', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('3988', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:41:13', '2018-10-25 21:41:13', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('3989', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:45:01', '2018-10-25 21:45:01', '{\"path\":\"http://localhost:80/\"}', '200', '254');
INSERT INTO `ssrs_system_log` VALUES ('3990', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:45:03', '2018-10-25 21:45:03', 'null', '101', '131');
INSERT INTO `ssrs_system_log` VALUES ('3991', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:45:54', '2018-10-25 21:45:54', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('3992', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:45:55', '2018-10-25 21:45:55', 'null', '101', '42');
INSERT INTO `ssrs_system_log` VALUES ('3993', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:02', '2018-10-25 21:46:02', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('3994', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:03', '2018-10-25 21:46:03', 'null', '101', '24');
INSERT INTO `ssrs_system_log` VALUES ('3995', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:14', '2018-10-25 21:46:14', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('3996', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:15', '2018-10-25 21:46:15', 'null', '101', '27');
INSERT INTO `ssrs_system_log` VALUES ('3997', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:27', '2018-10-25 21:46:27', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('3998', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:28', '2018-10-25 21:46:28', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('3999', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:49', '2018-10-25 21:46:49', '{\"path\":\"http://localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4000', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:50', '2018-10-25 21:46:50', 'null', '101', '16');
INSERT INTO `ssrs_system_log` VALUES ('4001', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:50', '2018-10-25 21:46:50', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4002', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:51', '2018-10-25 21:46:51', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('4003', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:51', '2018-10-25 21:46:51', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4004', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:52', '2018-10-25 21:46:52', '{\"path\":\"http://localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4005', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:52', '2018-10-25 21:46:52', '{\"path\":\"http://localhost:80/\"}', '200', '149');
INSERT INTO `ssrs_system_log` VALUES ('4006', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:53', '2018-10-25 21:46:53', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4007', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:46:53', '2018-10-25 21:46:53', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4008', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:50:03', '2018-10-25 21:50:03', '{\"path\":\"http://localhost:80/\"}', '200', '272');
INSERT INTO `ssrs_system_log` VALUES ('4009', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:50:04', '2018-10-25 21:50:04', 'null', '101', '84');
INSERT INTO `ssrs_system_log` VALUES ('4010', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:53:04', '2018-10-25 21:53:04', '{\"path\":\"http://localhost:80/\"}', '200', '238');
INSERT INTO `ssrs_system_log` VALUES ('4011', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:53:05', '2018-10-25 21:53:05', 'null', '101', '96');
INSERT INTO `ssrs_system_log` VALUES ('4012', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:56:19', '2018-10-25 21:56:20', '{\"path\":\"http://localhost:80/\"}', '200', '299');
INSERT INTO `ssrs_system_log` VALUES ('4013', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 21:56:21', '2018-10-25 21:56:21', 'null', '101', '145');
INSERT INTO `ssrs_system_log` VALUES ('4014', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:18:07', '2018-10-25 22:18:08', '{\"path\":\"http://localhost:80/\"}', '200', '407');
INSERT INTO `ssrs_system_log` VALUES ('4015', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:18:09', '2018-10-25 22:18:09', 'null', '101', '74');
INSERT INTO `ssrs_system_log` VALUES ('4016', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:19:50', '2018-10-25 22:19:50', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4017', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:19:50', '2018-10-25 22:19:50', 'null', '101', '19');
INSERT INTO `ssrs_system_log` VALUES ('4018', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:20:49', '2018-10-25 22:20:50', '{\"path\":\"http://localhost:80/\"}', '200', '294');
INSERT INTO `ssrs_system_log` VALUES ('4019', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:20:51', '2018-10-25 22:20:51', 'null', '101', '85');
INSERT INTO `ssrs_system_log` VALUES ('4020', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:21:55', '2018-10-25 22:21:55', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4021', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:21:56', '2018-10-25 22:21:56', 'null', '101', '15');
INSERT INTO `ssrs_system_log` VALUES ('4022', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:24:37', '2018-10-25 22:24:37', '{\"path\":\"http://localhost:80/\"}', '200', '286');
INSERT INTO `ssrs_system_log` VALUES ('4023', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:24:39', '2018-10-25 22:24:39', 'null', '101', '69');
INSERT INTO `ssrs_system_log` VALUES ('4024', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:27:40', '2018-10-25 22:27:40', '{\"path\":\"http://localhost:80/\"}', '200', '200');
INSERT INTO `ssrs_system_log` VALUES ('4025', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:27:41', '2018-10-25 22:27:41', 'null', '101', '65');
INSERT INTO `ssrs_system_log` VALUES ('4026', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:31:24', '2018-10-25 22:31:24', '{\"path\":\"http://localhost:80/\"}', '200', '264');
INSERT INTO `ssrs_system_log` VALUES ('4027', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:31:25', '2018-10-25 22:31:25', 'null', '101', '132');
INSERT INTO `ssrs_system_log` VALUES ('4028', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:33:32', '2018-10-25 22:33:33', '{\"path\":\"http://localhost:80/\"}', '200', '227');
INSERT INTO `ssrs_system_log` VALUES ('4029', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '605c2b6b-a13a-4142-bf74-40538b77181a', '2018-10-25 22:33:35', '2018-10-25 22:33:35', 'null', '101', '201');
INSERT INTO `ssrs_system_log` VALUES ('4030', '127.0.0.1', '/u/login;JSESSIONID=2b23e31a-dac3-4a1f-ad58-fec3ea08d637', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:09', '2018-10-26 10:01:10', '{}', '200', '1002');
INSERT INTO `ssrs_system_log` VALUES ('4031', '127.0.0.1', '/u/login', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:11', '2018-10-26 10:01:11', '{}', '200', '4');
INSERT INTO `ssrs_system_log` VALUES ('4032', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:14', '2018-10-26 10:01:15', 'null', '200', '428');
INSERT INTO `ssrs_system_log` VALUES ('4033', '127.0.0.1', '//u/submitLogin', 'Ajax', 'POST', '\"ssrs@qq.com\"', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:14', '2018-10-26 10:01:15', 'null', '200', '496');
INSERT INTO `ssrs_system_log` VALUES ('4034', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:16', '2018-10-26 10:01:18', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '2588');
INSERT INTO `ssrs_system_log` VALUES ('4035', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540519279463\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:20', '2018-10-26 10:01:20', 'null', '200', '7');
INSERT INTO `ssrs_system_log` VALUES ('4036', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:16', '2018-10-26 10:01:20', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '3536');
INSERT INTO `ssrs_system_log` VALUES ('4037', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:20', '2018-10-26 10:01:20', '{\"path\":\"http://localhost:80/\"}', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('4038', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:21', '2018-10-26 10:01:21', 'null', '101', '65');
INSERT INTO `ssrs_system_log` VALUES ('4039', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:26', '2018-10-26 10:01:26', 'null', '200', '72');
INSERT INTO `ssrs_system_log` VALUES ('4040', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:01:26', '2018-10-26 10:01:27', '{\"weekWebVisitCount\":null}', '200', '278');
INSERT INTO `ssrs_system_log` VALUES ('4041', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:02:57', '2018-10-26 10:02:57', '{\"path\":\"http://localhost:80/\"}', '200', '760');
INSERT INTO `ssrs_system_log` VALUES ('4042', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:02:59', '2018-10-26 10:02:59', 'null', '101', '90');
INSERT INTO `ssrs_system_log` VALUES ('4043', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:09:57', '2018-10-26 10:09:58', '{\"path\":\"http://localhost:80/\"}', '200', '234');
INSERT INTO `ssrs_system_log` VALUES ('4044', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:09:59', '2018-10-26 10:09:59', '{\"path\":\"http://localhost:80/\"}', '200', '55');
INSERT INTO `ssrs_system_log` VALUES ('4045', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:10:03', '2018-10-26 10:10:03', 'null', '101', '63');
INSERT INTO `ssrs_system_log` VALUES ('4046', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:10:26', '2018-10-26 10:10:26', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('4047', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:10:26', '2018-10-26 10:10:26', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4048', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:50', '2018-10-26 10:15:50', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4049', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:51', '2018-10-26 10:15:51', 'null', '101', '14');
INSERT INTO `ssrs_system_log` VALUES ('4050', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:53', '2018-10-26 10:15:53', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4051', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:54', '2018-10-26 10:15:54', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4052', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:55', '2018-10-26 10:15:55', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4053', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:55', '2018-10-26 10:15:55', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4054', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:57', '2018-10-26 10:15:57', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('4055', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:57', '2018-10-26 10:15:57', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4056', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:58', '2018-10-26 10:15:58', '{\"path\":\"http://localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4057', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:58', '2018-10-26 10:15:58', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('4058', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:59', '2018-10-26 10:15:59', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('4059', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:15:59', '2018-10-26 10:15:59', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4060', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:00', '2018-10-26 10:16:00', '{\"path\":\"http://localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4061', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:00', '2018-10-26 10:16:00', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4062', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:00', '2018-10-26 10:16:00', '{\"path\":\"http://localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4063', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:01', '2018-10-26 10:16:01', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4064', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:01', '2018-10-26 10:16:01', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4065', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:02', '2018-10-26 10:16:02', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4066', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:02', '2018-10-26 10:16:02', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4067', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:03', '2018-10-26 10:16:03', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4068', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:03', '2018-10-26 10:16:03', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4069', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:04', '2018-10-26 10:16:04', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4070', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:04', '2018-10-26 10:16:04', '{\"path\":\"http://localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4071', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:05', '2018-10-26 10:16:05', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4072', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:05', '2018-10-26 10:16:05', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4073', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:06', '2018-10-26 10:16:06', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4074', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:06', '2018-10-26 10:16:06', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4075', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:06', '2018-10-26 10:16:06', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4076', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:15', '2018-10-26 10:16:15', '{\"path\":\"http://localhost:80/\"}', '200', '23');
INSERT INTO `ssrs_system_log` VALUES ('4077', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:16:16', '2018-10-26 10:16:16', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('4078', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:13', '2018-10-26 10:20:13', '{\"path\":\"http://localhost:80/\"}', '200', '348');
INSERT INTO `ssrs_system_log` VALUES ('4079', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:16', '2018-10-26 10:20:16', 'null', '101', '82');
INSERT INTO `ssrs_system_log` VALUES ('4080', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:21', '2018-10-26 10:20:21', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('4081', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:21', '2018-10-26 10:20:21', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4082', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:23', '2018-10-26 10:20:23', '{\"path\":\"http://localhost:80/\"}', '200', '42');
INSERT INTO `ssrs_system_log` VALUES ('4083', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:24', '2018-10-26 10:20:24', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4084', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:25', '2018-10-26 10:20:25', '{\"path\":\"http://localhost:80/\"}', '200', '133');
INSERT INTO `ssrs_system_log` VALUES ('4085', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:25', '2018-10-26 10:20:25', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4086', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:26', '2018-10-26 10:20:26', '{\"path\":\"http://localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4087', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:26', '2018-10-26 10:20:26', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4088', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:28', '2018-10-26 10:20:28', '{\"path\":\"http://localhost:80/\"}', '200', '24');
INSERT INTO `ssrs_system_log` VALUES ('4089', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:28', '2018-10-26 10:20:28', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4090', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:29', '2018-10-26 10:20:29', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4091', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:29', '2018-10-26 10:20:29', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4092', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:30', '2018-10-26 10:20:30', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4093', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:31', '2018-10-26 10:20:31', 'null', '101', '16');
INSERT INTO `ssrs_system_log` VALUES ('4094', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:31', '2018-10-26 10:20:31', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4095', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:31', '2018-10-26 10:20:31', 'null', '101', '4');
INSERT INTO `ssrs_system_log` VALUES ('4096', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:32', '2018-10-26 10:20:32', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4097', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:20:32', '2018-10-26 10:20:32', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4098', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:24:00', '2018-10-26 10:24:00', '{\"path\":\"http://localhost:80/\"}', '200', '211');
INSERT INTO `ssrs_system_log` VALUES ('4099', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:24:01', '2018-10-26 10:24:01', 'null', '101', '125');
INSERT INTO `ssrs_system_log` VALUES ('4100', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:27:08', '2018-10-26 10:27:09', '{\"path\":\"http://localhost:80/\"}', '200', '400');
INSERT INTO `ssrs_system_log` VALUES ('4101', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:27:11', '2018-10-26 10:27:11', 'null', '101', '273');
INSERT INTO `ssrs_system_log` VALUES ('4102', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:28:35', '2018-10-26 10:28:35', '{\"path\":\"http://localhost:80/\"}', '200', '286');
INSERT INTO `ssrs_system_log` VALUES ('4103', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:28:36', '2018-10-26 10:28:36', 'null', '101', '165');
INSERT INTO `ssrs_system_log` VALUES ('4104', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:29:09', '2018-10-26 10:29:09', '{\"path\":\"http://localhost:80/\"}', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('4105', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:29:10', '2018-10-26 10:29:10', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4106', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:29:21', '2018-10-26 10:29:21', '{\"path\":\"http://localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4107', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:29:22', '2018-10-26 10:29:22', 'null', '101', '14');
INSERT INTO `ssrs_system_log` VALUES ('4108', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:24', '2018-10-26 10:32:24', '{\"path\":\"http://localhost:80/\"}', '200', '296');
INSERT INTO `ssrs_system_log` VALUES ('4109', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:25', '2018-10-26 10:32:25', 'null', '101', '133');
INSERT INTO `ssrs_system_log` VALUES ('4110', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:31', '2018-10-26 10:32:31', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4111', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:31', '2018-10-26 10:32:31', 'null', '101', '11');
INSERT INTO `ssrs_system_log` VALUES ('4112', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:33', '2018-10-26 10:32:33', '{\"path\":\"http://localhost:80/\"}', '200', '103');
INSERT INTO `ssrs_system_log` VALUES ('4113', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:34', '2018-10-26 10:32:34', 'null', '101', '36');
INSERT INTO `ssrs_system_log` VALUES ('4114', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:41', '2018-10-26 10:32:41', '{\"path\":\"http://localhost:80/\"}', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4115', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:42', '2018-10-26 10:32:42', 'null', '101', '17');
INSERT INTO `ssrs_system_log` VALUES ('4116', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:43', '2018-10-26 10:32:43', '{\"path\":\"http://localhost:80/\"}', '200', '30');
INSERT INTO `ssrs_system_log` VALUES ('4117', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:44', '2018-10-26 10:32:44', 'null', '101', '40');
INSERT INTO `ssrs_system_log` VALUES ('4118', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:46', '2018-10-26 10:32:46', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4119', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:46', '2018-10-26 10:32:46', 'null', '101', '11');
INSERT INTO `ssrs_system_log` VALUES ('4120', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:48', '2018-10-26 10:32:48', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4121', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:32:49', '2018-10-26 10:32:49', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4122', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:33:54', '2018-10-26 10:33:55', '{\"path\":\"http://localhost:80/\"}', '200', '289');
INSERT INTO `ssrs_system_log` VALUES ('4123', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:33:55', '2018-10-26 10:33:56', 'null', '101', '91');
INSERT INTO `ssrs_system_log` VALUES ('4124', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:34:10', '2018-10-26 10:34:10', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4125', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:34:11', '2018-10-26 10:34:11', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4126', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:00', '2018-10-26 10:58:00', '{\"path\":\"http://localhost:80/\"}', '200', '303');
INSERT INTO `ssrs_system_log` VALUES ('4127', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:01', '2018-10-26 10:58:01', 'null', '101', '137');
INSERT INTO `ssrs_system_log` VALUES ('4128', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:51', '2018-10-26 10:58:52', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1691');
INSERT INTO `ssrs_system_log` VALUES ('4129', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540522732341\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:53', '2018-10-26 10:58:53', 'null', '200', '72');
INSERT INTO `ssrs_system_log` VALUES ('4130', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:53', '2018-10-26 10:58:54', 'null', '200', '303');
INSERT INTO `ssrs_system_log` VALUES ('4131', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:54', '2018-10-26 10:58:55', '{}', '200', '273');
INSERT INTO `ssrs_system_log` VALUES ('4132', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:55', '2018-10-26 10:58:56', '{}', '200', '545');
INSERT INTO `ssrs_system_log` VALUES ('4133', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:55', '2018-10-26 10:58:56', 'null', '200', '873');
INSERT INTO `ssrs_system_log` VALUES ('4134', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:56', '2018-10-26 10:58:56', 'null', '200', '76');
INSERT INTO `ssrs_system_log` VALUES ('4135', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"5\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:58:59', '2018-10-26 10:58:59', 'null', '200', '36');
INSERT INTO `ssrs_system_log` VALUES ('4136', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"4\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 10:59:01', '2018-10-26 10:59:01', 'null', '200', '34');
INSERT INTO `ssrs_system_log` VALUES ('4137', '127.0.0.1', '/role/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:02:17', '2018-10-26 11:02:17', '{}', '200', '95');
INSERT INTO `ssrs_system_log` VALUES ('4138', '127.0.0.1', '/role/getRolePage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:02:17', '2018-10-26 11:02:17', 'null', '200', '46');
INSERT INTO `ssrs_system_log` VALUES ('4139', '127.0.0.1', '/role/goAdd', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:02:18', '2018-10-26 11:02:18', '{}', '200', '55');
INSERT INTO `ssrs_system_log` VALUES ('4140', '127.0.0.1', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:02:18', '2018-10-26 11:02:19', 'null', '200', '669');
INSERT INTO `ssrs_system_log` VALUES ('4141', '127.0.0.1', '/role/getRolePage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:02:32', '2018-10-26 11:02:32', 'null', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('4142', '127.0.0.1', '/role/goAdd', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:03:57', '2018-10-26 11:03:57', '{}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4143', '127.0.0.1', '/permission/getPermissionTree', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:03:57', '2018-10-26 11:03:58', 'null', '200', '643');
INSERT INTO `ssrs_system_log` VALUES ('4144', '127.0.0.1', '/role/getRolePage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:03', '2018-10-26 11:04:03', 'null', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4145', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:10', '2018-10-26 11:04:10', '{}', '200', '349');
INSERT INTO `ssrs_system_log` VALUES ('4146', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:10', '2018-10-26 11:04:10', 'null', '200', '102');
INSERT INTO `ssrs_system_log` VALUES ('4147', '127.0.0.1', '/dictionary/goAdd', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:11', '2018-10-26 11:04:11', '{}', '200', '56');
INSERT INTO `ssrs_system_log` VALUES ('4148', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:13', '2018-10-26 11:04:13', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4149', '127.0.0.1', '/dictionary/goAddChild', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:14', '2018-10-26 11:04:14', '{}', '200', '72');
INSERT INTO `ssrs_system_log` VALUES ('4150', '127.0.0.1', '/swiper/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:16', '2018-10-26 11:04:17', '{}', '200', '118');
INSERT INTO `ssrs_system_log` VALUES ('4151', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:17', '2018-10-26 11:04:17', 'null', '200', '23');
INSERT INTO `ssrs_system_log` VALUES ('4152', '127.0.0.1', '/swiper/goAdd', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:18', '2018-10-26 11:04:18', '{}', '200', '190');
INSERT INTO `ssrs_system_log` VALUES ('4153', '127.0.0.1', '/swiper/getSwiperPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:04:22', '2018-10-26 11:04:22', 'null', '200', '23');
INSERT INTO `ssrs_system_log` VALUES ('4154', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:11:56', '2018-10-26 11:11:56', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4155', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:11:57', '2018-10-26 11:11:57', 'null', '101', '52');
INSERT INTO `ssrs_system_log` VALUES ('4156', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:16:04', '2018-10-26 11:16:04', '{\"path\":\"http://localhost:80/\"}', '200', '247');
INSERT INTO `ssrs_system_log` VALUES ('4157', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:16:05', '2018-10-26 11:16:05', 'null', '101', '117');
INSERT INTO `ssrs_system_log` VALUES ('4158', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:17:52', '2018-10-26 11:17:53', '{\"path\":\"http://localhost:80/\"}', '200', '258');
INSERT INTO `ssrs_system_log` VALUES ('4159', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:17:54', '2018-10-26 11:17:54', 'null', '101', '109');
INSERT INTO `ssrs_system_log` VALUES ('4160', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:36:16', '2018-10-26 11:36:17', '{\"weekWebVisitCount\":null}', '200', '882');
INSERT INTO `ssrs_system_log` VALUES ('4161', '127.0.0.1', '/menu/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:36:49', '2018-10-26 11:36:50', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1816');
INSERT INTO `ssrs_system_log` VALUES ('4162', '127.0.0.1', '/menu/goAdd', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:36:52', '2018-10-26 11:36:52', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":null,\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"},{\"children\":[],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":null,\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":null,\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":null,\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":null,\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"}]}', '200', '142');
INSERT INTO `ssrs_system_log` VALUES ('4163', '127.0.0.1', '/menu/add', 'Ajax', 'POST', '{\"title\":[\"实时控制台日志\"],\"sequence\":[\"8\"],\"isFu\":[\"2\"],\"parentId\":[\"2\"],\"permission.name\":[\"实时控制台日志\"],\"url\":[\"/catlinaLog/out\"],\"icon\":[\"xe62e\"],\"systemMenu\":[\"1\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:26', '2018-10-26 11:38:26', 'null', '200', '294');
INSERT INTO `ssrs_system_log` VALUES ('4164', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:27', '2018-10-26 11:38:28', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '776');
INSERT INTO `ssrs_system_log` VALUES ('4165', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540525107625\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:28', '2018-10-26 11:38:28', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4166', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:28', '2018-10-26 11:38:29', 'null', '200', '472');
INSERT INTO `ssrs_system_log` VALUES ('4167', '127.0.0.1', '/menu/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:29', '2018-10-26 11:38:30', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1038');
INSERT INTO `ssrs_system_log` VALUES ('4168', '127.0.0.1', '/menu/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:38:30', '2018-10-26 11:38:31', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1092');
INSERT INTO `ssrs_system_log` VALUES ('4169', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:40:06', '2018-10-26 11:40:06', '{\"path\":\"http://localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4170', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:40:06', '2018-10-26 11:40:06', 'null', '101', '48');
INSERT INTO `ssrs_system_log` VALUES ('4171', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:08', '2018-10-26 11:41:08', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4172', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:08', '2018-10-26 11:41:08', 'null', '101', '22');
INSERT INTO `ssrs_system_log` VALUES ('4173', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:34', '2018-10-26 11:41:34', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4174', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:34', '2018-10-26 11:41:34', 'null', '101', '11');
INSERT INTO `ssrs_system_log` VALUES ('4175', '127.0.0.1', '/systemLog/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:43', '2018-10-26 11:41:43', '{}', '200', '57');
INSERT INTO `ssrs_system_log` VALUES ('4176', '127.0.0.1', '/systemLog/getSystemLogPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:41:43', '2018-10-26 11:41:43', 'null', '200', '112');
INSERT INTO `ssrs_system_log` VALUES ('4177', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:42:42', '2018-10-26 11:42:42', '{\"path\":\"http://localhost:80/\"}', '200', '99');
INSERT INTO `ssrs_system_log` VALUES ('4178', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:42:43', '2018-10-26 11:42:43', 'null', '101', '30');
INSERT INTO `ssrs_system_log` VALUES ('4179', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:42:51', '2018-10-26 11:42:51', '{\"path\":\"http://localhost:80/\"}', '200', '18');
INSERT INTO `ssrs_system_log` VALUES ('4180', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:42:51', '2018-10-26 11:42:51', 'null', '101', '29');
INSERT INTO `ssrs_system_log` VALUES ('4181', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:44:25', '2018-10-26 11:44:25', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4182', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:44:26', '2018-10-26 11:44:26', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4183', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'e457a714-c08c-4562-a9dc-ac3f06703990', '2018-10-26 11:47:02', '2018-10-26 11:47:02', '{}', '404', '31');
INSERT INTO `ssrs_system_log` VALUES ('4184', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'ff3daa79-67f3-4afc-a4cd-5351308faa14', '2018-10-26 11:47:43', '2018-10-26 11:47:43', '{}', '404', '11');
INSERT INTO `ssrs_system_log` VALUES ('4185', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:47:47', '2018-10-26 11:47:47', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '473');
INSERT INTO `ssrs_system_log` VALUES ('4186', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540525667091\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:47:47', '2018-10-26 11:47:47', 'null', '200', '6');
INSERT INTO `ssrs_system_log` VALUES ('4187', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:47:48', '2018-10-26 11:47:48', 'null', '200', '50');
INSERT INTO `ssrs_system_log` VALUES ('4188', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', 'e457a714-c08c-4562-a9dc-ac3f06703990', '2018-10-26 11:47:48', '2018-10-26 11:47:48', '{}', '404', '8');
INSERT INTO `ssrs_system_log` VALUES ('4189', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '472de327-d971-486f-8ae1-9c03b62ffb59', '2018-10-26 11:47:48', '2018-10-26 11:47:48', '{}', '404', '7');
INSERT INTO `ssrs_system_log` VALUES ('4190', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:51:24', '2018-10-26 11:51:24', '{\"path\":\"http://localhost:80/\"}', '200', '65');
INSERT INTO `ssrs_system_log` VALUES ('4191', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:51:25', '2018-10-26 11:51:25', 'null', '101', '12');
INSERT INTO `ssrs_system_log` VALUES ('4192', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:51:25', '2018-10-26 11:51:25', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4193', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:51:26', '2018-10-26 11:51:26', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4194', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:52:11', '2018-10-26 11:52:11', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4195', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:52:11', '2018-10-26 11:52:11', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('4196', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:13', '2018-10-26 11:53:13', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4197', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:14', '2018-10-26 11:53:14', 'null', '101', '30');
INSERT INTO `ssrs_system_log` VALUES ('4198', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:17', '2018-10-26 11:53:17', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4199', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:17', '2018-10-26 11:53:17', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('4200', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:27', '2018-10-26 11:53:28', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4201', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:28', '2018-10-26 11:53:28', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4202', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:35', '2018-10-26 11:53:35', '{\"path\":\"http://localhost:80/\"}', '200', '14');
INSERT INTO `ssrs_system_log` VALUES ('4203', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:36', '2018-10-26 11:53:36', 'null', '101', '57');
INSERT INTO `ssrs_system_log` VALUES ('4204', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:42', '2018-10-26 11:53:42', '{\"path\":\"http://localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4205', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:42', '2018-10-26 11:53:42', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4206', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:57', '2018-10-26 11:53:57', '{\"path\":\"http://localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4207', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:53:58', '2018-10-26 11:53:58', 'null', '101', '12');
INSERT INTO `ssrs_system_log` VALUES ('4208', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:54:39', '2018-10-26 11:54:39', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4209', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:54:39', '2018-10-26 11:54:39', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4210', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:54:55', '2018-10-26 11:54:55', '{\"path\":\"http://localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4211', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:54:55', '2018-10-26 11:54:55', 'null', '101', '26');
INSERT INTO `ssrs_system_log` VALUES ('4212', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:55:18', '2018-10-26 11:55:18', '{\"path\":\"http://localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4213', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:55:18', '2018-10-26 11:55:18', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4214', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:55:22', '2018-10-26 11:55:22', '{\"path\":\"http://localhost:80/\"}', '200', '45');
INSERT INTO `ssrs_system_log` VALUES ('4215', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:55:22', '2018-10-26 11:55:22', 'null', '101', '15');
INSERT INTO `ssrs_system_log` VALUES ('4216', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 11:59:43', '2018-10-26 11:59:43', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4217', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:02:22', '2018-10-26 12:02:22', '{\"path\":\"http://localhost:80/\"}', '200', '27');
INSERT INTO `ssrs_system_log` VALUES ('4218', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:02:33', '2018-10-26 12:02:33', '{\"path\":\"http://localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4219', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:02:59', '2018-10-26 12:02:59', '{\"path\":\"http://localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4220', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:03:14', '2018-10-26 12:03:14', '{\"path\":\"http://localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4221', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:03:15', '2018-10-26 12:03:15', 'null', '101', '16');
INSERT INTO `ssrs_system_log` VALUES ('4222', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:03:54', '2018-10-26 12:03:54', '{\"path\":\"http://localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4223', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:03:54', '2018-10-26 12:03:54', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4224', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:11', '2018-10-26 12:04:11', '{\"path\":\"http://localhost:80/\"}', '200', '31');
INSERT INTO `ssrs_system_log` VALUES ('4225', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:12', '2018-10-26 12:04:12', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('4226', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:17', '2018-10-26 12:04:17', '{\"path\":\"http://localhost:80/\"}', '200', '9');
INSERT INTO `ssrs_system_log` VALUES ('4227', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:17', '2018-10-26 12:04:17', 'null', '101', '3');
INSERT INTO `ssrs_system_log` VALUES ('4228', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:22', '2018-10-26 12:04:22', '{\"path\":\"http://localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4229', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:22', '2018-10-26 12:04:22', 'null', '101', '4');
INSERT INTO `ssrs_system_log` VALUES ('4230', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:37', '2018-10-26 12:04:37', '{\"path\":\"http://localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4231', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:37', '2018-10-26 12:04:37', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4232', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:47', '2018-10-26 12:04:47', '{\"path\":\"http://localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4233', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 12:04:47', '2018-10-26 12:04:47', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4234', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 13:32:57', '2018-10-26 13:33:06', '{\"path\":\"localhost:80/\"}', '200', '9582');
INSERT INTO `ssrs_system_log` VALUES ('4235', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 13:33:07', '2018-10-26 13:33:07', 'null', '101', '81');
INSERT INTO `ssrs_system_log` VALUES ('4236', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:13:49', '2018-10-26 14:13:51', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '2900');
INSERT INTO `ssrs_system_log` VALUES ('4237', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540534433064\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:13:54', '2018-10-26 14:13:54', 'null', '200', '64');
INSERT INTO `ssrs_system_log` VALUES ('4238', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:13:55', '2018-10-26 14:13:55', 'null', '200', '151');
INSERT INTO `ssrs_system_log` VALUES ('4239', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:13:56', '2018-10-26 14:14:00', '{\"path\":\"localhost:80/\"}', '200', '4626');
INSERT INTO `ssrs_system_log` VALUES ('4240', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:14:00', '2018-10-26 14:14:00', '{\"path\":\"localhost:80/\"}', '200', '9');
INSERT INTO `ssrs_system_log` VALUES ('4241', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:14:01', '2018-10-26 14:14:01', 'null', '101', '52');
INSERT INTO `ssrs_system_log` VALUES ('4242', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:14:01', '2018-10-26 14:14:01', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4243', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:36:10', '2018-10-26 14:36:10', '{\"path\":\"localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4244', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:36:10', '2018-10-26 14:36:10', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4245', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:16', '2018-10-26 14:37:18', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1735');
INSERT INTO `ssrs_system_log` VALUES ('4246', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540535837855\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:18', '2018-10-26 14:37:18', 'null', '200', '3');
INSERT INTO `ssrs_system_log` VALUES ('4247', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:19', '2018-10-26 14:37:19', 'null', '200', '67');
INSERT INTO `ssrs_system_log` VALUES ('4248', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:19', '2018-10-26 14:37:19', '{\"path\":\"localhost:80/\"}', '200', '29');
INSERT INTO `ssrs_system_log` VALUES ('4249', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:19', '2018-10-26 14:37:20', '{\"path\":\"localhost:80/\"}', '200', '60');
INSERT INTO `ssrs_system_log` VALUES ('4250', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:20', '2018-10-26 14:37:20', 'null', '101', '30');
INSERT INTO `ssrs_system_log` VALUES ('4251', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:20', '2018-10-26 14:37:20', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4252', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:40', '2018-10-26 14:37:40', '{\"path\":\"localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4253', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:37:40', '2018-10-26 14:37:40', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4254', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:38:30', '2018-10-26 14:38:30', '{\"path\":\"localhost:80/\"}', '200', '24');
INSERT INTO `ssrs_system_log` VALUES ('4255', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:38:31', '2018-10-26 14:38:31', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4256', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:38:43', '2018-10-26 14:38:43', '{\"path\":\"localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4257', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:38:44', '2018-10-26 14:38:44', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4258', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:39:02', '2018-10-26 14:39:02', '{\"path\":\"localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4259', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:39:02', '2018-10-26 14:39:02', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4260', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:03', '2018-10-26 14:40:03', '{\"path\":\"localhost:80/\"}', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4261', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:03', '2018-10-26 14:40:03', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4262', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:27', '2018-10-26 14:40:27', '{\"path\":\"localhost:80/\"}', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4263', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:27', '2018-10-26 14:40:27', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4264', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:49', '2018-10-26 14:40:50', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1335');
INSERT INTO `ssrs_system_log` VALUES ('4265', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540536050410\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:51', '2018-10-26 14:40:51', 'null', '200', '99');
INSERT INTO `ssrs_system_log` VALUES ('4266', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:51', '2018-10-26 14:40:51', 'null', '200', '116');
INSERT INTO `ssrs_system_log` VALUES ('4267', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:52', '2018-10-26 14:40:52', '{\"path\":\"localhost:80/\"}', '200', '28');
INSERT INTO `ssrs_system_log` VALUES ('4268', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:52', '2018-10-26 14:40:52', '{\"path\":\"localhost:80/\"}', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4269', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:52', '2018-10-26 14:40:52', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4270', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:40:52', '2018-10-26 14:40:52', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4271', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:23', '2018-10-26 14:41:23', '{\"path\":\"localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4272', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:23', '2018-10-26 14:41:23', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4273', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:30', '2018-10-26 14:41:30', '{\"path\":\"localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4274', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:31', '2018-10-26 14:41:31', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4275', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:48', '2018-10-26 14:41:48', '{\"path\":\"localhost:80/\"}', '200', '44');
INSERT INTO `ssrs_system_log` VALUES ('4276', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:41:49', '2018-10-26 14:41:49', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4277', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:42:37', '2018-10-26 14:42:37', '{\"path\":\"localhost:80/\"}', '200', '13');
INSERT INTO `ssrs_system_log` VALUES ('4278', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:42:37', '2018-10-26 14:42:37', 'null', '101', '13');
INSERT INTO `ssrs_system_log` VALUES ('4279', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:42:57', '2018-10-26 14:42:57', '{\"path\":\"localhost:80/\"}', '200', '394');
INSERT INTO `ssrs_system_log` VALUES ('4280', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:42:57', '2018-10-26 14:42:57', 'null', '101', '5');
INSERT INTO `ssrs_system_log` VALUES ('4281', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:12', '2018-10-26 14:43:12', '{\"path\":\"localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4282', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:13', '2018-10-26 14:43:13', 'null', '101', '12');
INSERT INTO `ssrs_system_log` VALUES ('4283', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:30', '2018-10-26 14:43:30', '{\"path\":\"localhost:80/\"}', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4284', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:31', '2018-10-26 14:43:31', 'null', '101', '16');
INSERT INTO `ssrs_system_log` VALUES ('4285', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:53', '2018-10-26 14:43:53', '{\"path\":\"localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4286', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:43:53', '2018-10-26 14:43:53', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4287', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:44:16', '2018-10-26 14:44:16', '{\"path\":\"localhost:80/\"}', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4288', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:44:36', '2018-10-26 14:44:36', '{\"path\":\"localhost:80/\"}', '200', '21');
INSERT INTO `ssrs_system_log` VALUES ('4289', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:44:37', '2018-10-26 14:44:37', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4290', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:44:41', '2018-10-26 14:44:41', '{\"path\":\"localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4291', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:44:42', '2018-10-26 14:44:42', 'null', '101', '10');
INSERT INTO `ssrs_system_log` VALUES ('4292', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:02', '2018-10-26 14:45:02', '{\"path\":\"localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4293', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:03', '2018-10-26 14:45:03', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4294', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:13', '2018-10-26 14:45:13', '{\"path\":\"localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4295', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:14', '2018-10-26 14:45:14', 'null', '101', '11');
INSERT INTO `ssrs_system_log` VALUES ('4296', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:31', '2018-10-26 14:45:31', '{\"path\":\"localhost:80/\"}', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4297', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:32', '2018-10-26 14:45:32', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4298', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:43', '2018-10-26 14:45:43', '{\"path\":\"localhost:80/\"}', '200', '75');
INSERT INTO `ssrs_system_log` VALUES ('4299', '127.0.0.1', '/open/500', 'Json', 'GET', '{}', '44639d37-a5c3-44c4-9568-252150a6fa39', '2018-10-26 14:45:43', '2018-10-26 14:45:43', '{\"message\":\"Template \\\"log/catlinaLog.ftl\\\" not found.\",\"line\":742,\"clazz\":\"freemarker.template.Configuration\",\"methodName\":\"getTemplate\"}', '500', '96');
INSERT INTO `ssrs_system_log` VALUES ('4300', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:47', '2018-10-26 14:45:47', '{\"path\":\"localhost:80/\"}', '200', '27');
INSERT INTO `ssrs_system_log` VALUES ('4301', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:45:48', '2018-10-26 14:45:48', 'null', '101', '17');
INSERT INTO `ssrs_system_log` VALUES ('4302', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:04', '2018-10-26 14:46:04', '{\"path\":\"localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4303', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:04', '2018-10-26 14:46:04', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4304', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:10', '2018-10-26 14:46:10', '{\"path\":\"localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4305', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:11', '2018-10-26 14:46:11', 'null', '101', '9');
INSERT INTO `ssrs_system_log` VALUES ('4306', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:19', '2018-10-26 14:46:19', '{\"path\":\"localhost:80/\"}', '200', '39');
INSERT INTO `ssrs_system_log` VALUES ('4307', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:20', '2018-10-26 14:46:20', 'null', '101', '43');
INSERT INTO `ssrs_system_log` VALUES ('4308', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:42', '2018-10-26 14:46:42', '{\"path\":\"localhost:80/\"}', '200', '17');
INSERT INTO `ssrs_system_log` VALUES ('4309', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:42', '2018-10-26 14:46:42', 'null', '101', '45');
INSERT INTO `ssrs_system_log` VALUES ('4310', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:49', '2018-10-26 14:46:49', '{\"path\":\"localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4311', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:46:50', '2018-10-26 14:46:50', 'null', '101', '6');
INSERT INTO `ssrs_system_log` VALUES ('4312', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:00', '2018-10-26 14:47:00', '{\"path\":\"localhost:80/\"}', '200', '15');
INSERT INTO `ssrs_system_log` VALUES ('4313', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:00', '2018-10-26 14:47:00', 'null', '101', '7');
INSERT INTO `ssrs_system_log` VALUES ('4314', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:06', '2018-10-26 14:47:06', '{\"path\":\"localhost:80/\"}', '200', '10');
INSERT INTO `ssrs_system_log` VALUES ('4315', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:07', '2018-10-26 14:47:07', 'null', '101', '4');
INSERT INTO `ssrs_system_log` VALUES ('4316', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:31', '2018-10-26 14:47:31', '{\"path\":\"localhost:80/\"}', '200', '11');
INSERT INTO `ssrs_system_log` VALUES ('4317', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:47:32', '2018-10-26 14:47:32', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4318', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540536874724\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:35', '2018-10-26 14:54:35', 'null', '200', '79');
INSERT INTO `ssrs_system_log` VALUES ('4319', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:32', '2018-10-26 14:54:35', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '2644');
INSERT INTO `ssrs_system_log` VALUES ('4320', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:36', '2018-10-26 14:54:36', 'null', '200', '424');
INSERT INTO `ssrs_system_log` VALUES ('4321', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:36', '2018-10-26 14:54:37', '{\"path\":\"localhost:80/\"}', '200', '39');
INSERT INTO `ssrs_system_log` VALUES ('4322', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:37', '2018-10-26 14:54:37', '{\"path\":\"localhost:80/\"}', '200', '34');
INSERT INTO `ssrs_system_log` VALUES ('4323', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:38', '2018-10-26 14:54:38', 'null', '101', '115');
INSERT INTO `ssrs_system_log` VALUES ('4324', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:38', '2018-10-26 14:54:38', 'null', '101', '15');
INSERT INTO `ssrs_system_log` VALUES ('4325', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:43', '2018-10-26 14:54:43', '{\"path\":\"localhost:80/\"}', '200', '12');
INSERT INTO `ssrs_system_log` VALUES ('4326', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:44', '2018-10-26 14:54:44', 'null', '101', '8');
INSERT INTO `ssrs_system_log` VALUES ('4327', '127.0.0.1', '/open/404', 'Json', 'GET', '{}', '0385c701-6801-45a0-849b-095f48ccba22', '2018-10-26 14:54:45', '2018-10-26 14:54:45', '{}', '404', '24');
INSERT INTO `ssrs_system_log` VALUES ('4328', '127.0.0.1', '/menu/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:54:48', '2018-10-26 14:54:49', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '802');
INSERT INTO `ssrs_system_log` VALUES ('4329', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:57:19', '2018-10-26 14:57:19', '{}', '200', '71');
INSERT INTO `ssrs_system_log` VALUES ('4330', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:57:20', '2018-10-26 14:57:20', 'null', '200', '204');
INSERT INTO `ssrs_system_log` VALUES ('4331', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"5\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 14:57:22', '2018-10-26 14:57:22', 'null', '200', '20');
INSERT INTO `ssrs_system_log` VALUES ('4332', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:24', '2018-10-26 15:32:25', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '1085');
INSERT INTO `ssrs_system_log` VALUES ('4333', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540539145511\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:26', '2018-10-26 15:32:26', 'null', '200', '83');
INSERT INTO `ssrs_system_log` VALUES ('4334', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:28', '2018-10-26 15:32:28', 'null', '200', '216');
INSERT INTO `ssrs_system_log` VALUES ('4335', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:29', '2018-10-26 15:32:29', '{}', '200', '84');
INSERT INTO `ssrs_system_log` VALUES ('4336', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:29', '2018-10-26 15:32:29', '{}', '200', '126');
INSERT INTO `ssrs_system_log` VALUES ('4337', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:29', '2018-10-26 15:32:30', 'null', '200', '151');
INSERT INTO `ssrs_system_log` VALUES ('4338', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:32:29', '2018-10-26 15:32:30', 'null', '200', '255');
INSERT INTO `ssrs_system_log` VALUES ('4339', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:23', '2018-10-26 15:57:23', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '608');
INSERT INTO `ssrs_system_log` VALUES ('4340', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540540643276\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:23', '2018-10-26 15:57:23', 'null', '200', '2');
INSERT INTO `ssrs_system_log` VALUES ('4341', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:24', '2018-10-26 15:57:24', 'null', '200', '144');
INSERT INTO `ssrs_system_log` VALUES ('4342', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:25', '2018-10-26 15:57:25', '{}', '200', '63');
INSERT INTO `ssrs_system_log` VALUES ('4343', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:26', '2018-10-26 15:57:26', 'null', '200', '104');
INSERT INTO `ssrs_system_log` VALUES ('4344', '127.0.0.1', '/permission/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:25', '2018-10-26 15:57:26', '{}', '200', '394');
INSERT INTO `ssrs_system_log` VALUES ('4345', '127.0.0.1', '/permission/getPermissionPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:26', '2018-10-26 15:57:26', 'null', '200', '162');
INSERT INTO `ssrs_system_log` VALUES ('4346', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 15:57:27', '2018-10-26 15:57:27', '{\"weekWebVisitCount\":null}', '200', '168');
INSERT INTO `ssrs_system_log` VALUES ('4347', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:36', '2018-10-26 16:01:36', '{\"weekWebVisitCount\":null}', '200', '179');
INSERT INTO `ssrs_system_log` VALUES ('4348', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:52', '2018-10-26 16:01:52', '{\"weekWebVisitCount\":null}', '200', '88');
INSERT INTO `ssrs_system_log` VALUES ('4349', '127.0.0.1', '/user/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:54', '2018-10-26 16:01:54', '{\"menus\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":21,\"parentId\":null,\"permission\":{\"children\":[],\"id\":37,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":27,\"parentId\":24,\"permission\":{\"children\":[],\"id\":49,\"name\":\"数据字典\",\"parentId\":null,\"url\":\"/dictionary/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"数据字典\",\"url\":\"/dictionary/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":26,\"parentId\":24,\"permission\":{\"children\":[],\"id\":45,\"name\":\"友情链接\",\"parentId\":null,\"url\":\"/link/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"友情链接\",\"url\":\"/link/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":25,\"parentId\":24,\"permission\":{\"children\":[],\"id\":41,\"name\":\"图片播放器\",\"parentId\":null,\"url\":\"/swiper/index\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"图片播放器\",\"url\":\"/swiper/index\"}],\"icon\":\"&#xe614;\",\"id\":24,\"parentId\":null,\"permission\":{\"children\":[],\"id\":40,\"name\":\"功能组件\",\"parentId\":null,\"url\":\"/\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"功能组件\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":23,\"parentId\":17,\"permission\":{\"children\":[],\"id\":39,\"name\":\"支付宝配置\",\"parentId\":null,\"url\":\"/aliPaySetting/index\"},\"sequence\":10,\"systemMenu\":1,\"title\":\"支付宝配置\",\"url\":\"/aliPaySetting/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":22,\"parentId\":17,\"permission\":{\"children\":[],\"id\":38,\"name\":\"七牛云存储\",\"parentId\":null,\"url\":\"/fileQiniu/index\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"七牛云存储\",\"url\":\"/fileQiniu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":20,\"parentId\":17,\"permission\":{\"children\":[],\"id\":36,\"name\":\"富文本\",\"parentId\":null,\"url\":\"/editor/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"富文本\",\"url\":\"/editor/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":19,\"parentId\":17,\"permission\":{\"children\":[],\"id\":35,\"name\":\"邮件发送\",\"parentId\":null,\"url\":\"/mail/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"邮件发送\",\"url\":\"/mail/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":18,\"parentId\":17,\"permission\":{\"children\":[],\"id\":34,\"name\":\"阿里大鱼\",\"parentId\":null,\"url\":\"/alidayu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"阿里大鱼\",\"url\":\"/alidayu/index\"}],\"icon\":\"&#xe614;\",\"id\":17,\"parentId\":null,\"permission\":{\"children\":[],\"id\":33,\"name\":\"第三方集成\",\"parentId\":null,\"url\":\"/\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"第三方集成\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":13,\"parentId\":12,\"permission\":{\"children\":[],\"id\":21,\"name\":\"测试子菜单\",\"parentId\":null,\"url\":\"/test/test1\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"测试子菜单\",\"url\":\"/test/test1\"}],\"icon\":\"&#xe614;\",\"id\":12,\"parentId\":null,\"permission\":{\"children\":[],\"id\":20,\"name\":\"测试顶级菜单\",\"parentId\":null,\"url\":\"/\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"测试顶级菜单\",\"url\":\"/\"},{\"children\":[{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":28,\"parentId\":2,\"permission\":{\"children\":[],\"id\":53,\"name\":\"实时控制台日志\",\"parentId\":null,\"url\":\"/catlinaLog/out\"},\"sequence\":8,\"systemMenu\":1,\"title\":\"实时控制台日志\",\"url\":\"/catlinaLog/out\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":16,\"parentId\":2,\"permission\":{\"children\":[],\"id\":32,\"name\":\"系统日志\",\"parentId\":null,\"url\":\"/systemLog/index\"},\"sequence\":7,\"systemMenu\":1,\"title\":\"系统日志\",\"url\":\"/systemLog/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":15,\"parentId\":2,\"permission\":{\"children\":[],\"id\":30,\"name\":\"在线用户设置\",\"parentId\":null,\"url\":\"/member/index\"},\"sequence\":6,\"systemMenu\":1,\"title\":\"在线用户\",\"url\":\"/member/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":14,\"parentId\":2,\"permission\":{\"children\":[],\"id\":26,\"name\":\"管理员设置\",\"parentId\":null,\"url\":\"/user/list\"},\"sequence\":5,\"systemMenu\":1,\"title\":\"管理员设置\",\"url\":\"/user/list\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":9,\"parentId\":2,\"permission\":{\"children\":[],\"id\":17,\"name\":\"权限设置\",\"parentId\":null,\"url\":\"/permission/index\"},\"sequence\":4,\"systemMenu\":1,\"title\":\"权限设置\",\"url\":\"/permission/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":7,\"parentId\":2,\"permission\":{\"children\":[],\"id\":11,\"name\":\"角色管理\",\"parentId\":null,\"url\":\"/role/index\"},\"sequence\":3,\"systemMenu\":1,\"title\":\"角色设置\",\"url\":\"/role/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":4,\"parentId\":2,\"permission\":{\"children\":[],\"id\":3,\"name\":\"菜单设置\",\"parentId\":null,\"url\":\"/menu/index\"},\"sequence\":2,\"systemMenu\":1,\"title\":\"菜单设置\",\"url\":\"/menu/index\"},{\"children\":[],\"icon\":\"&#xe62e;\",\"id\":3,\"parentId\":2,\"permission\":{\"children\":[],\"id\":2,\"name\":\"网站设置\",\"parentId\":null,\"url\":\"/webSet/index\"},\"sequence\":1,\"systemMenu\":2,\"title\":\"网站设置\",\"url\":\"/webSet/index\"}],\"icon\":\"&#xe614;\",\"id\":2,\"parentId\":null,\"permission\":{\"children\":[],\"id\":1,\"name\":\"系统设置\",\"parentId\":null,\"url\":\"/\"},\"sequence\":1,\"systemMenu\":1,\"title\":\"系统设置\",\"url\":\"/\"}]}', '200', '647');
INSERT INTO `ssrs_system_log` VALUES ('4350', '127.0.0.1', '/webStatistics', 'Json', 'GET', '{\"i\":[\"1540540914425\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:54', '2018-10-26 16:01:54', 'null', '200', '2');
INSERT INTO `ssrs_system_log` VALUES ('4351', '127.0.0.1', '/menu/buildMenuUrl', 'Ajax', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:55', '2018-10-26 16:01:55', 'null', '200', '22');
INSERT INTO `ssrs_system_log` VALUES ('4352', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:55', '2018-10-26 16:01:55', '{\"weekWebVisitCount\":null}', '200', '70');
INSERT INTO `ssrs_system_log` VALUES ('4353', '127.0.0.1', '/open/app', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:01:55', '2018-10-26 16:01:55', '{\"weekWebVisitCount\":null}', '200', '82');
INSERT INTO `ssrs_system_log` VALUES ('4354', '127.0.0.1', '/catlinaLog/out', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:09', '2018-10-26 16:02:09', '{\"path\":\"localhost:80/\"}', '200', '16');
INSERT INTO `ssrs_system_log` VALUES ('4355', '127.0.0.1', '/catlinaLogWebsocket', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:10', '2018-10-26 16:02:10', 'null', '101', '51');
INSERT INTO `ssrs_system_log` VALUES ('4356', '127.0.0.1', '/dictionary/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:41', '2018-10-26 16:02:41', '{}', '200', '215');
INSERT INTO `ssrs_system_log` VALUES ('4357', '127.0.0.1', '/dictionary/getDictionaryPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:41', '2018-10-26 16:02:41', 'null', '200', '19');
INSERT INTO `ssrs_system_log` VALUES ('4358', '127.0.0.1', '/link/index', 'Json', 'GET', '{}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:58', '2018-10-26 16:02:58', '{}', '200', '264');
INSERT INTO `ssrs_system_log` VALUES ('4359', '127.0.0.1', '/link/getLinkPage', 'Ajax', 'POST', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', '2b23e31a-dac3-4a1f-ad58-fec3ea08d637', '2018-10-26 16:02:59', '2018-10-26 16:02:59', 'null', '200', '49');

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
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-10-26 10:01:14', '1');

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
-- Table structure for `ssrs_web_visit_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_web_visit_count`;
CREATE TABLE `ssrs_web_visit_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_count` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '每日ip数',
  `pv_count` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '每日pv数',
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='站点统计表';

-- ----------------------------
-- Records of ssrs_web_visit_count
-- ----------------------------

-- ----------------------------
-- Procedure structure for `init_quella_data`
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_quella_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `init_quella_data`()
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
INSERT INTO `ssrs_alidayu` VALUES ('1', 'LTAIh3zv5e82VE8O', 'ecB3c8naMHwSJUYXmxlbU1uFvEbcfL', '上善若水', 'SMS_126355465', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3886 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-10-24 11:16:50', '1');

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
