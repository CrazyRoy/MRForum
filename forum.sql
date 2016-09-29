/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2016-09-29 21:37:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `commentTime` datetime NOT NULL,
  `post` bigint(20) NOT NULL,
  `operator` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `out_key1` (`post`),
  KEY `out_key2` (`operator`),
  CONSTRAINT `out_key1` FOREIGN KEY (`post`) REFERENCES `post` (`postID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `out_key2` FOREIGN KEY (`operator`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '我回复了放假', '2015-06-30 09:52:30', '7', '7');
INSERT INTO `comment` VALUES ('2', '啊啊第三方山', '2015-06-29 10:07:33', '7', '7');
INSERT INTO `comment` VALUES ('3', 'eeeeee', '2015-06-30 16:30:03', '9', '7');
INSERT INTO `comment` VALUES ('4', '好的任务发你防守打法', '2015-06-30 16:42:54', '7', '7');
INSERT INTO `comment` VALUES ('5', '是吃撒地方', '2015-06-30 21:03:23', '7', '7');
INSERT INTO `comment` VALUES ('6', 'vas4铜球阀发他大二个', '2015-06-30 21:03:38', '7', '7');
INSERT INTO `comment` VALUES ('7', '和大三金佛', '2015-06-30 21:04:10', '7', '7');
INSERT INTO `comment` VALUES ('8', '多撒财富大厦', '2015-06-30 21:05:16', '7', '1');
INSERT INTO `comment` VALUES ('9', '发多少搜图额发的', '2015-06-30 21:05:33', '7', '8');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publishTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '作业', 'v点开放女内存卡零售价女大三才v激动啥', '2015-05-20');
INSERT INTO `notice` VALUES ('2', '高温', '由于连续高温，所有学校决定下雨在寝室睡觉', '2015-06-04');
INSERT INTO `notice` VALUES ('3', '放假', '放假48天', '2015-06-16');
INSERT INTO `notice` VALUES ('4', '关于某通知的更改', '该事件惊动了党中央，国务院，全国房价520天', '2015-06-20');
INSERT INTO `notice` VALUES ('5', '在快乐时间', '大吃了一顿，小吃了一碗，那感觉，fell 倍儿爽', '2015-06-26');
INSERT INTO `notice` VALUES ('6', '说啥呢', '飞飞飞飞', '2015-06-28');
INSERT INTO `notice` VALUES ('7', '大学生的大学生活', '还是你发的啥符号打车你打算回复', '2015-06-30');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `postID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `publishTime` datetime NOT NULL,
  `operator` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `pageview` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`postID`),
  KEY `post_operator` (`operator`) USING BTREE,
  KEY `post_postType` (`type`) USING BTREE,
  KEY `post_title` (`title`) USING BTREE,
  CONSTRAINT `operator_name` FOREIGN KEY (`operator`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_type` FOREIGN KEY (`type`) REFERENCES `posttype` (`postTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('7', '中国XX大学暑假长达48天', '某大学正式通知于2015年7月17日正式放假，9月5日正式上课！', '2014-01-27 11:11:11', '2', '16', '50');
INSERT INTO `post` VALUES ('8', '发的萨芬撒地方将', '疯狂送积分女警的返回南京的几率凯撒打算', '2015-06-27 23:55:30', '2', '16', '9');
INSERT INTO `post` VALUES ('9', '哈哈haha', 'v放大镜第三方尽快发来风景', '2015-06-28 01:06:40', '2', '19', '23');
INSERT INTO `post` VALUES ('10', '我在发论坛', '哦是真的再发论坛分砀山龙卷风kdsackajfjjdksajfjafkldjsfjsl;fj;asjflajflsajlfdjafjsljfkladsks;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjfjlajldsjdcnafksdjfj fdsj;jjfajfjdsljfolfdj;激发肌肤is金佛的的大家撒积分卡积分卡积分', '2015-06-29 15:20:14', '2', '17', '14');
INSERT INTO `post` VALUES ('11', '大家思考了', '接撒谎发', '2015-06-29 15:20:58', '2', '18', '2');

-- ----------------------------
-- Table structure for posttype
-- ----------------------------
DROP TABLE IF EXISTS `posttype`;
CREATE TABLE `posttype` (
  `postTypeID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` bigint(20) NOT NULL,
  PRIMARY KEY (`postTypeID`),
  UNIQUE KEY `postType_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of posttype
-- ----------------------------
INSERT INTO `posttype` VALUES ('16', '谷歌', '2');
INSERT INTO `posttype` VALUES ('17', '火狐', '1');
INSERT INTO `posttype` VALUES ('18', 'Safair', '1');
INSERT INTO `posttype` VALUES ('19', 'Opera', '1');
INSERT INTO `posttype` VALUES ('20', 'IE', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `account` varchar(16) NOT NULL COMMENT '登录时候用{3,16}',
  `password` varchar(18) NOT NULL COMMENT '{6,18}位',
  `type` int(20) NOT NULL COMMENT '普通用户、管理员、系统管理员',
  `email` varchar(100) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL COMMENT '男或者女',
  `photo` varchar(100) DEFAULT NULL COMMENT '保存头像文件的相对路径',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Sylar', 'ly', '123', '2', '123456798@qq.com', '女', 'images/icon.jpg');
INSERT INTO `user` VALUES ('2', '洛先森', 'Tylar', '554554', '2', '654321897@qq.com', '男', '/MyForum/images/head/logo.jpg');
INSERT INTO `user` VALUES ('6', 'aa', 'aa', 'aa', '2', 'none', 'none', 'images/icon.jpg');
INSERT INTO `user` VALUES ('7', 'cc', 'cc', 'cc', '2', 'none', 'none', 'images/icon.jpg');
INSERT INTO `user` VALUES ('8', '洛洛', 'ddd', 'dddddd', '2', 'none', 'none', 'images/icon.jpg');
INSERT INTO `user` VALUES ('9', '', '', '', '2', 'none', 'none', 'images/icon.jpg');

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `userTypeID` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`userTypeID`),
  UNIQUE KEY `OperatorType_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('2', '普通用户');
INSERT INTO `usertype` VALUES ('1', '管理员');
