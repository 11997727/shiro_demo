/*
Navicat MySQL Data Transfer

Source Server         : 阿里云docker
Source Server Version : 50729
Source Host           : 123.57.128.164:3307
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-03-11 08:45:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `explain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '1', '超级管理员');
INSERT INTO `role` VALUES ('2', '2', '普通管理员');

-- ----------------------------
-- Table structure for uar
-- ----------------------------
DROP TABLE IF EXISTS `uar`;
CREATE TABLE `uar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of uar
-- ----------------------------
INSERT INTO `uar` VALUES ('1', '1', '1');
INSERT INTO `uar` VALUES ('2', '1', '2');
INSERT INTO `uar` VALUES ('3', '2', '2');
INSERT INTO `uar` VALUES ('6', '21', '1');
INSERT INTO `uar` VALUES ('7', '21', '2');
INSERT INTO `uar` VALUES ('8', '22', '2');
INSERT INTO `uar` VALUES ('9', '23', '2');
INSERT INTO `uar` VALUES ('10', '24', '1');
INSERT INTO `uar` VALUES ('11', '24', '2');
INSERT INTO `uar` VALUES ('12', '25', '1');
INSERT INTO `uar` VALUES ('13', '25', '2');
INSERT INTO `uar` VALUES ('14', '26', '2');
INSERT INTO `uar` VALUES ('15', '27', '2');
INSERT INTO `uar` VALUES ('16', '28', '2');
INSERT INTO `uar` VALUES ('17', '29', '2');
INSERT INTO `uar` VALUES ('18', '30', '2');
INSERT INTO `uar` VALUES ('19', '31', '2');
INSERT INTO `uar` VALUES ('21', '33', '1');
INSERT INTO `uar` VALUES ('22', '33', '2');
INSERT INTO `uar` VALUES ('23', '34', '2');
INSERT INTO `uar` VALUES ('24', '35', '1');
INSERT INTO `uar` VALUES ('25', '35', '2');
INSERT INTO `uar` VALUES ('26', '36', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'i2TbG4y5+cKyrkHGW38sSxRW9o3RI1uFJyNPrl5AvOU=', '0', '18600730811');
INSERT INTO `user` VALUES ('2', 'wcz', 'V94X3goytpd/vhIqHSmx1DLwoGkaGjGul9PVKJp5Jew=', '0', '19919990911');
INSERT INTO `user` VALUES ('3', 'chengzhuo', '1TeWKFa+M/6122lvTPOqqjrkOlUFqCm1c8hhf0OvWbw=', '1', '18600732654');
INSERT INTO `user` VALUES ('21', 'aaa', '+Jd9m4fqLaluyrnZf6XAS5rP8luGKz+mlJVb+v6rdPs=', '0', '1111111111111111111');
INSERT INTO `user` VALUES ('22', 'bbb', 'YKc7vLqFmYG2QEjeoxJGGDJXW8JXr4PVzky3G9NT71w=', '0', '3334');
INSERT INTO `user` VALUES ('23', 'ccc', 'L+M9soLkYyuqPRvhO/mcodt48gW3t5+mvCglEKSOa0Y=', '0', '111');
INSERT INTO `user` VALUES ('24', 'ddd', '+2RzbsuFVQxsZ+sJJdgiVuKWUaIJx+IrGX6pzPRsHSs=', '1', '1112');
INSERT INTO `user` VALUES ('25', 'eee', 'm7B8SvyhpeeIRJbh4ra4l93Y4ncMi9qBqABkqqIuoy4=', '0', '1112');
INSERT INTO `user` VALUES ('26', 'fff', 'ULOiFQztcbXpjGBTneZndms4OqH6pY9cgnJn8i0mG6c=', '0', '111');
INSERT INTO `user` VALUES ('27', 'ggg', 'tTHookrVZ7YkGef08Rph9KSjyStyioc/vmVZ7+9/oFc=', '0', '111');
INSERT INTO `user` VALUES ('28', 'hhh', 'EwyXuECj/KOV7wAwfKhIM5ALpu6if9Fut6jBSmVDzUM=', '0', '222222');
INSERT INTO `user` VALUES ('29', 'iii', 'jsyhy2lgaZYoGo1LtFRrABPQoS/GXFvIQjcmti2+izQ=', '0', '111');
INSERT INTO `user` VALUES ('30', 'jjj', 'BLMJgTw4p9czP+UAM5bxhJ5NhrTYRJVh9uHt8twwLR8=', '0', '1112');
INSERT INTO `user` VALUES ('31', 'kkk', 'xM7IqzutpySa2WgeoKtTerez9o7VfRMJndAf5M1ewhI=', '1', '1112222');
INSERT INTO `user` VALUES ('33', 'lll', 'Tq2CeczHEAAEL0nJxkO8IbxJAhW80W+Jx7KA8Nh7XH4=', '0', '111');
INSERT INTO `user` VALUES ('34', 'mmm', 'iiH8hHLnlLsNt8oRBwmBf9faYlPNPDq7y0wBbKBQk4U=', '0', '111');
INSERT INTO `user` VALUES ('35', 'sss', '7d8ISYTMsIKvwT2Nw6SG3CAAKqACpVfK4DGFwPbHcPk=', '0', '333');
INSERT INTO `user` VALUES ('36', 'nnn', 'lDrH4fZFus+tMXuv3TxSy7FmXbDWyqXN+LFQL9NdgBI=', '0', '111');
