/*
Navicat MySQL Data Transfer

Source Server         : Mysql_Demo
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : 0620

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-07-01 08:37:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) NOT NULL,
  `apwd` varchar(255) NOT NULL,
  `power` int(255) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('7', 'boss', 'boss', '1');
INSERT INTO `admin` VALUES ('8', 'admin', 'admin', '2');
INSERT INTO `admin` VALUES ('9', 'weihu', 'weihu', '3');

-- ----------------------------
-- Table structure for adminrole
-- ----------------------------
DROP TABLE IF EXISTS `adminrole`;
CREATE TABLE `adminrole` (
  `rid` int(11) NOT NULL,
  `aid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminrole
-- ----------------------------
INSERT INTO `adminrole` VALUES ('6', '4');
INSERT INTO `adminrole` VALUES ('6', '4');
INSERT INTO `adminrole` VALUES ('6', '4');
INSERT INTO `adminrole` VALUES ('6', '4');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oid` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` double NOT NULL,
  KEY `pid_fk` (`pid`),
  KEY `oid_fk` (`oid`),
  CONSTRAINT `oid_fk` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pid_fk` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('4f9e6a48-7d56-46b0-b447-bc36005a393c', '35', '1', '299');
INSERT INTO `orderitem` VALUES ('4f9e6a48-7d56-46b0-b447-bc36005a393c', '59', '1', '199');
INSERT INTO `orderitem` VALUES ('4f9e6a48-7d56-46b0-b447-bc36005a393c', '47', '1', '155');
INSERT INTO `orderitem` VALUES ('f652bdbf-a4e5-4d7f-a886-bfcdf82c9a8e', '36', '1', '199');
INSERT INTO `orderitem` VALUES ('26e5c3c3-eb49-49f1-8a83-cb88b1e2fbb1', '19', '1', '269');
INSERT INTO `orderitem` VALUES ('6cf17dd8-16a7-4671-b26e-8bedb59f92d9', '18', '5', '1995');
INSERT INTO `orderitem` VALUES ('6cf17dd8-16a7-4671-b26e-8bedb59f92d9', '20', '1', '369');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `time` varchar(255) NOT NULL,
  `pay` varchar(255) NOT NULL,
  `sum` double NOT NULL,
  `state` varchar(255) NOT NULL,
  `oname` varchar(255) NOT NULL,
  `otel` varchar(255) NOT NULL,
  `oaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid_fk` (`uid`),
  CONSTRAINT `uid_fk` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('26e5c3c3-eb49-49f1-8a83-cb88b1e2fbb1', '1', '2019-06-29 10:18:44', '', '269', '完成订单', 'lucky', '13293140469', '天津市滨海新区');
INSERT INTO `orders` VALUES ('4f9e6a48-7d56-46b0-b447-bc36005a393c', '1', '2019-06-28 18:53:15', '招商银行', '653', '待发货', '刘清浩', '666666', '天津市滨海新区');
INSERT INTO `orders` VALUES ('6cf17dd8-16a7-4671-b26e-8bedb59f92d9', '1', '2019-06-29 10:19:25', '工商银行', '2364', '待支付', '刘清浩', '666666', '天津市滨海新区');
INSERT INTO `orders` VALUES ('f652bdbf-a4e5-4d7f-a886-bfcdf82c9a8e', '1', '2019-06-28 18:54:06', '工商银行', '199', '待支付', '姜尧', '18909131082', '天津滨海新区');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `minphoto` varchar(255) NOT NULL,
  `maxphoto` varchar(1024) NOT NULL,
  `stock` int(11) NOT NULL,
  `stid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `stid_fk` (`stid`),
  CONSTRAINT `stid_fk` FOREIGN KEY (`stid`) REFERENCES `secondtype` (`stid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('10', '男鞋跑步鞋2019春季新款SEEED全掌气垫星环跑鞋潮运动鞋', '299', 'upload/minphoto/男鞋跑步鞋2019春季新款SEEED全掌气垫星环跑鞋潮运动鞋.jpg;upload/minphoto/男鞋跑步鞋2019春季新款SEEED全掌气垫星环跑鞋潮运动鞋2.jpg;upload/minphoto/男鞋跑步鞋2019春季新款SEEED全掌气垫星环跑鞋潮运动鞋3.jpg;upload/minphoto/男鞋跑步鞋2019春季新款SEEED全掌气垫星环跑鞋潮运动鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083035_808.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083045_195.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190627/20190627141046_899.jpg\" alt=\"\" /><br />', '94', '1');
INSERT INTO `product` VALUES ('11', '安踏女子2019新款夏季轻便透气能量环跑鞋', '139', 'upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋1.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋2.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋3.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083611_834.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083625_311.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083618_196.jpg\" alt=\"\" /><br />', '95', '2');
INSERT INTO `product` VALUES ('12', '安踏女子2019新款夏季网面透气运动跑鞋', '149', 'upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋1.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋2.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋3.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083726_737.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083734_459.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083743_176.jpg\" alt=\"\" /><br />', '98', '2');
INSERT INTO `product` VALUES ('13', '安踏女子夏季闪能科技能量环女子休闲跑步鞋', '299', 'upload/minphoto/安踏女子夏季闪能科技能量环女子休闲跑步鞋1.jpg;upload/minphoto/安踏女子夏季闪能科技能量环女子休闲跑步鞋2.jpg;upload/minphoto/安踏女子夏季闪能科技能量环女子休闲跑步鞋3.jpg;upload/minphoto/安踏女子夏季闪能科技能量环女子休闲跑步鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083817_477.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083829_720.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083838_622.jpg\" alt=\"\" /><br />', '99', '2');
INSERT INTO `product` VALUES ('14', '安踏儿童2019新款夏季中大童短T短袖', '100', 'upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083928_128.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083934_383.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083941_475.jpg\" alt=\"\" /><br />', '100', '3');
INSERT INTO `product` VALUES ('15', '安踏儿童2019新款夏季中大童汤普森KT短袖', '199', 'upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083956_655.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084004_781.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084011_458.jpg\" alt=\"\" /><br />', '99', '3');
INSERT INTO `product` VALUES ('16', '安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋', '99', 'upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-1.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-2.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-3.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084052_807.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084102_610.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084107_458.jpg\" alt=\"\" /><br />', '100', '3');
INSERT INTO `product` VALUES ('17', '安踏2019新款女子无袖开叉运动背心', '156', 'upload/minphoto/安踏2019新款女子无袖开叉运动背心1.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心2.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心3.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084130_546.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084136_569.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084143_125.jpg\" alt=\"\" /><br />', '98', '4');
INSERT INTO `product` VALUES ('18', 'NASA系列SEEED零界60th纪念款鞋2019新款marvel漫威联名跑鞋', '399', 'upload/minphoto/NASA系列SEEED零界60th纪念款鞋2019新款marvel漫威联名跑鞋1.jpg;upload/minphoto/NASA系列SEEED零界60th纪念款鞋2019新款marvel漫威联名跑鞋2.jpg;upload/minphoto/NASA系列SEEED零界60th纪念款鞋2019新款marvel漫威联名跑鞋3.jpg;upload/minphoto/NASA系列SEEED零界60th纪念款鞋2019新款marvel漫威联名跑鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626083307_898.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083314_52.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626083500_702.jpg\" alt=\"\" /><br />', '94', '1');
INSERT INTO `product` VALUES ('19', '安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋', '269', 'upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋1.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋2.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋3.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084314_815.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084321_715.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084328_703.jpg\" alt=\"\" /><br />', '97', '5');
INSERT INTO `product` VALUES ('20', '篮球鞋高帮UFO2代-天体战靴', '369', 'upload/minphoto/篮球鞋高帮UFO2代-天体战靴1.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴2.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴3.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084349_482.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084358_567.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084407_24.jpg\" alt=\"\" /><br />', '99', '5');
INSERT INTO `product` VALUES ('21', '篮球鞋高帮要疯2代球鞋男', '369', 'upload/minphoto/篮球鞋高帮要疯2代球鞋男1.jpg;upload/minphoto/篮球鞋高帮要疯2代球鞋男2.jpg;upload/minphoto/篮球鞋高帮要疯2代球鞋男3.jpg;upload/minphoto/篮球鞋高帮要疯2代球鞋男4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084534_439.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084543_330.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084549_756.jpg\" alt=\"\" /><br />', '100', '5');
INSERT INTO `product` VALUES ('22', '篮球鞋男汤普森3代球鞋新款高帮运动鞋男KT3球鞋战靴', '499', 'upload/minphoto/篮球鞋男汤普森3代球鞋新款高帮运动鞋男KT3球鞋战靴1.jpg;upload/minphoto/篮球鞋男汤普森3代球鞋新款高帮运动鞋男KT3球鞋战靴2.jpg;upload/minphoto/篮球鞋男汤普森3代球鞋新款高帮运动鞋男KT3球鞋战靴3.jpg;upload/minphoto/篮球鞋男汤普森3代球鞋新款高帮运动鞋男KT3球鞋战靴4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084610_851.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084618_592.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084624_701.jpg\" alt=\"\" /><br />', '99', '5');
INSERT INTO `product` VALUES ('23', '篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋', '459', 'upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋1.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋2.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋3.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084659_288.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084706_798.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084714_954.jpg\" alt=\"\" /><br />', '100', '5');
INSERT INTO `product` VALUES ('24', '篮球鞋汤普森3代KT3总决赛FINALS高帮球鞋', '599', 'upload/minphoto/篮球鞋汤普森3代KT3总决赛FINALS高帮球鞋1.jpg;upload/minphoto/篮球鞋汤普森3代KT3总决赛FINALS高帮球鞋2.jpg;upload/minphoto/篮球鞋汤普森3代KT3总决赛FINALS高帮球鞋3.jpg;upload/minphoto/篮球鞋汤普森3代KT3总决赛FINALS高帮球鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084732_967.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084740_213.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084745_99.jpg\" alt=\"\" /><br />', '100', '5');
INSERT INTO `product` VALUES ('25', '汤普森3代KT3FINALS总决赛低帮战靴男', '459', 'upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男1.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男2.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男4.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男3.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084810_341.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084819_908.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084825_480.jpg\" alt=\"\" /><br />', '100', '5');
INSERT INTO `product` VALUES ('26', '汤普森4代战靴KT4鸳鸯高帮球鞋静水流深', '369', 'upload/minphoto/汤普森4代战靴KT4鸳鸯高帮球鞋静水流深1.jpg;upload/minphoto/汤普森4代战靴KT4鸳鸯高帮球鞋静水流深2.jpg;upload/minphoto/汤普森4代战靴KT4鸳鸯高帮球鞋静水流深3.jpg;upload/minphoto/汤普森4代战靴KT4鸳鸯高帮球鞋静水流深4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085418_952.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085427_423.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085434_932.jpg\" alt=\"\" /><br />', '100', '8');
INSERT INTO `product` VALUES ('27', '汤普森3代KT3FINALS总决赛低帮战靴男', '399', 'upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男1.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男2.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男3.jpg;upload/minphoto/汤普森3代KT3FINALS总决赛低帮战靴男4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085515_947.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085524_654.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085531_856.jpg\" alt=\"\" /><br />', '100', '8');
INSERT INTO `product` VALUES ('28', '安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋', '299', 'upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋1.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋2.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋3.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085200_647.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085210_183.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085219_195.jpg\" alt=\"\" /><br />', '100', '7');
INSERT INTO `product` VALUES ('29', '篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋', '399', 'upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋1.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋2.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋3.jpg;upload/minphoto/篮球鞋男汤普森KT3轻骑兵3代a-shock低帮运动球鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085558_624.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085611_332.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085619_372.jpg\" alt=\"\" /><br />', '100', '8');
INSERT INTO `product` VALUES ('30', '安踏儿童2019新款夏季中大童汤普森KT短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085249_730.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085257_564.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085305_354.jpg\" alt=\"\" /><br />', '100', '7');
INSERT INTO `product` VALUES ('31', '安踏儿童2019新款夏季中大童短T短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-4.jpg', '<img src=\"/01anta/attached/image/20190624/20190624102710_28.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190624/20190624102716_663.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085337_265.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085347_452.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085353_804.jpg\" alt=\"\" />', '100', '7');
INSERT INTO `product` VALUES ('32', '安踏外套男2019春季新款篮球运动上衣男连帽风衣潮', '139', 'upload/minphoto/安踏外套男2019春季新款篮球运动上衣男连帽风衣潮官网-1.jpg;upload/minphoto/安踏外套男2019春季新款篮球运动上衣男连帽风衣潮官网-2.jpg;upload/minphoto/安踏外套男2019春季新款篮球运动上衣男连帽风衣潮官网-3.jpg;upload/minphoto/安踏外套男2019春季新款篮球运动上衣男连帽风衣潮官网-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084909_475.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084916_997.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084922_361.jpg\" alt=\"\" /><br />', '98', '6');
INSERT INTO `product` VALUES ('33', '男子篮球比赛套装', '200', 'upload/minphoto/男子篮球比赛套装-1.jpg;upload/minphoto/男子篮球比赛套装-2.jpg;upload/minphoto/男子篮球比赛套装-3.jpg;upload/minphoto/男子篮球比赛套装-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084943_489.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084951_553.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084957_59.jpg\" alt=\"\" /><br />', '100', '6');
INSERT INTO `product` VALUES ('34', '男子要疯篮球比赛服上衣', '199', 'upload/minphoto/男子要疯篮球比赛服上衣-1.jpg;upload/minphoto/男子要疯篮球比赛服上衣-2.jpg;upload/minphoto/男子要疯篮球比赛服上衣-3.jpg;upload/minphoto/男子要疯篮球比赛服上衣-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085017_111.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085026_35.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085032_309.jpg\" alt=\"\" /><br />', '100', '6');
INSERT INTO `product` VALUES ('35', '足球鞋秋冬新款男鞋人造草地防水皮足成人短钉训练鞋TF碎', '299', 'upload/minphoto/足球鞋秋冬新款男鞋人造草地防水皮足成人短钉训练鞋TF碎-1.jpg;upload/minphoto/足球鞋秋冬新款男鞋人造草地防水皮足成人短钉训练鞋TF碎-2.jpg;upload/minphoto/足球鞋秋冬新款男鞋人造草地防水皮足成人短钉训练鞋TF碎-3.jpg;upload/minphoto/足球鞋秋冬新款男鞋人造草地防水皮足成人短钉训练鞋TF碎-5.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085649_568.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085657_148.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085704_578.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085711_269.jpg\" alt=\"\" /><br />', '98', '9');
INSERT INTO `product` VALUES ('36', '安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋', '199', 'upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-1.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-2.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-3.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085738_227.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085746_803.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085752_586.jpg\" alt=\"\" /><br />', '95', '9');
INSERT INTO `product` VALUES ('37', '足球比赛套装', '99', 'upload/minphoto/足球比赛套装-1.jpg;upload/minphoto/足球比赛套装-2.jpg;upload/minphoto/足球比赛套装-3.jpg;upload/minphoto/足球比赛套装-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085858_654.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085907_829.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085914_226.jpg\" alt=\"\" /><br />', '99', '10');
INSERT INTO `product` VALUES ('38', '男童足球比赛套装', '100', 'upload/minphoto/男童足球比赛套装-1.jpg;upload/minphoto/男童足球比赛套装-2.jpg;upload/minphoto/男童足球比赛套装-3.jpg;upload/minphoto/男童足球比赛套装-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626085935_473.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626085942_603.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090002_869.jpg\" alt=\"\" /><br />', '100', '10');
INSERT INTO `product` VALUES ('39', 'antaplus2019年新款男子运动跑步弹力针织长裤', '139', 'upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤1.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤2.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤3.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090040_120.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090049_616.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090100_393.jpg\" alt=\"\" /><br />', '100', '10');
INSERT INTO `product` VALUES ('40', '男子经久耐穿足球运动长袜', '59', 'upload/minphoto/男子经久耐穿足球运动长袜-1.jpg;upload/minphoto/男子经久耐穿足球运动长袜-2.jpg;upload/minphoto/男子经久耐穿足球运动长袜-3.jpg;upload/minphoto/男子经久耐穿足球运动长袜-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090142_637.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090149_947.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090154_408.jpg\" alt=\"\" /><br />', '100', '11');
INSERT INTO `product` VALUES ('41', '安踏儿童新款足球', '99', 'upload/minphoto/安踏儿童新款足球-1.jpg;upload/minphoto/安踏儿童新款足球-2.jpg;upload/minphoto/安踏儿童新款足球-3.jpg;upload/minphoto/安踏儿童新款足球-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090215_214.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090223_277.jpg\" alt=\"\" /><br />', '100', '11');
INSERT INTO `product` VALUES ('42', '安踏儿童新款足球', '99', 'upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-1.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-2.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-3.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090245_689.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090252_987.jpg\" alt=\"\" /><br />', '100', '11');
INSERT INTO `product` VALUES ('43', '儿童足球夏季新款儿童小学生彩色卡通耐磨训练正品足球', '99', 'upload/minphoto/儿童足球夏季新款儿童小学生彩色卡通耐磨训练正品足球-1.jpg;upload/minphoto/儿童足球夏季新款儿童小学生彩色卡通耐磨训练正品足球-2.jpg;upload/minphoto/儿童足球夏季新款儿童小学生彩色卡通耐磨训练正品足球-3.jpg;upload/minphoto/儿童足球夏季新款儿童小学生彩色卡通耐磨训练正品足球-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090334_294.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090342_114.jpg\" alt=\"\" /><br />', '100', '12');
INSERT INTO `product` VALUES ('44', '安踏2019新款夏季女子透气运动短T短袖', '149', 'upload/minphoto/安踏2019新款夏季女子透气运动短T短袖1.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖2.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖3.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090409_927.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090417_599.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090433_249.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090440_306.jpg\" alt=\"\" /><br />', '100', '12');
INSERT INTO `product` VALUES ('45', '安踏2019新款拼接连帽运动风衣薄外套', '199', 'upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套1.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套2.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套3.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090509_386.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090517_446.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090529_31.jpg\" alt=\"\" /><br />', '100', '12');
INSERT INTO `product` VALUES ('46', 'antaplus2019年新款男子运动跑步弹力针织长裤', '139', 'upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤1.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤2.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤3.jpg;upload/minphoto/antaplus2019年新款男子运动跑步弹力针织长裤4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090600_616.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090608_821.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090616_591.jpg\" alt=\"\" /><br />', '99', '13');
INSERT INTO `product` VALUES ('47', '墨绿短袖针织衫', '155', 'upload/minphoto/墨绿短袖针织衫1.jpg;upload/minphoto/墨绿短袖针织衫2.jpg;upload/minphoto/墨绿短袖针织衫3.jpg;upload/minphoto/墨绿短袖针织衫4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090643_22.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090650_71.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090656_172.jpg\" alt=\"\" /><br />', '96', '13');
INSERT INTO `product` VALUES ('48', '短袖男2019春夏新款舒适修身圆领跑步运动上衣休闲T恤', '139', 'upload/minphoto/短袖女2019春夏新款舒适修身圆领跑步运动上衣休闲T恤.jpg;upload/minphoto/短袖女2019春夏新款舒适修身圆领跑步运动上衣休闲T恤2.jpg;upload/minphoto/短袖女2019春夏新款舒适修身圆领跑步运动上衣休闲T恤3.jpg;upload/minphoto/短袖女2019春夏新款舒适修身圆领跑步运动上衣休闲T恤4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626090924_50.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090931_922.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626090936_345.jpg\" alt=\"\" /><br />', '98', '13');
INSERT INTO `product` VALUES ('49', '安踏2019新款女子无袖开叉运动背心', '99', 'upload/minphoto/安踏2019新款女子无袖开叉运动背心1.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心2.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心3.jpg;upload/minphoto/安踏2019新款女子无袖开叉运动背心4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091037_875.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091043_517.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091050_480.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091057_856.jpg\" alt=\"\" /><br />', '100', '14');
INSERT INTO `product` VALUES ('50', '安踏2019新款夏季女子透气运动短T短袖', '199', 'upload/minphoto/安踏2019新款夏季女子透气运动短T短袖1.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖2.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖3.jpg;upload/minphoto/安踏2019新款夏季女子透气运动短T短袖4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091128_687.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091135_897.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091142_154.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091148_808.jpg\" alt=\"\" /><br />', '100', '14');
INSERT INTO `product` VALUES ('51', '安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套', '199', 'upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套1.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套2.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套3.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091218_830.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091224_913.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091231_111.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091240_282.jpg\" alt=\"\" /><br />', '99', '14');
INSERT INTO `product` VALUES ('52', '安踏儿童2019新款夏季中大童短T短袖', '199', 'upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-4.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091530_690.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091537_40.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091542_814.jpg\" alt=\"\" /><br />', '100', '16');
INSERT INTO `product` VALUES ('53', '儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包', '55', 'upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-1.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-2.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-3.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091607_229.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091615_573.jpg\" alt=\"\" /><br />', '100', '16');
INSERT INTO `product` VALUES ('54', '安踏儿童2019新款夏季中大童汤普森KT短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-4.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091648_290.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091654_614.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091702_514.jpg\" alt=\"\" /><br />', '100', '16');
INSERT INTO `product` VALUES ('55', '安踏2019新款拼接连帽运动风衣薄外套', '199', 'upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套4.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套1.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套2.jpg;upload/minphoto/安踏2019新款拼接连帽运动风衣薄外套3.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091309_91.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091317_692.jpg\" alt=\"\" /><br />', '100', '15');
INSERT INTO `product` VALUES ('56', '安踏女子2019春夏新款背心式T字运动背心BRA', '199', 'upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA2.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA1.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA3.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091350_504.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091356_953.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091403_518.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091411_29.jpg\" alt=\"\" /><br />', '99', '15');
INSERT INTO `product` VALUES ('57', '安踏女子2019新款夏季透气棉短T短袖', '99', 'upload/minphoto/安踏女子2019新款夏季透气棉短T短袖1.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖2.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖3.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091443_788.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091450_888.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091456_70.jpg\" alt=\"\" /><br />', '100', '15');
INSERT INTO `product` VALUES ('58', '板鞋男鞋春季新款潮流休闲鞋运动鞋时尚潮鞋小白鞋男白板鞋', '99', 'upload/minphoto/板鞋男鞋春季新款潮流休闲鞋运动鞋时尚潮鞋小白鞋男白板鞋1.jpg;upload/minphoto/板鞋男鞋春季新款潮流休闲鞋运动鞋时尚潮鞋小白鞋男白板鞋2.jpg;upload/minphoto/板鞋男鞋春季新款潮流休闲鞋运动鞋时尚潮鞋小白鞋男白板鞋3.jpg;upload/minphoto/板鞋男鞋春季新款潮流休闲鞋运动鞋时尚潮鞋小白鞋男白板鞋4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091728_106.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091737_24.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091746_165.jpg\" alt=\"\" /><br />', '97', '17');
INSERT INTO `product` VALUES ('59', '篮球鞋高帮UFO2代-天体战靴', '199', 'upload/minphoto/篮球鞋高帮UFO2代-天体战靴1.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴2.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴3.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091825_825.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091833_619.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091840_889.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091848_216.jpg\" alt=\"\" /><br />', '95', '17');
INSERT INTO `product` VALUES ('60', '安踏女子2019新款夏季轻便透气能量环跑鞋', '199', 'upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋4.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋3.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋1.jpg;upload/minphoto/安踏女子2019新款夏季轻便透气能量环跑鞋2.jpg', '<img src=\"/01anta/attached/image/20190626/20190626091918_510.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091927_730.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626091934_658.jpg\" alt=\"\" /><br />', '97', '18');
INSERT INTO `product` VALUES ('61', '安踏女子2019新款夏季网面透气运动跑鞋', '199', 'upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋2.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋1.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋4.jpg;upload/minphoto/安踏女子2019新款夏季网面透气运动跑鞋3.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092002_244.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092009_887.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092016_706.jpg\" alt=\"\" /><br />', '100', '18');
INSERT INTO `product` VALUES ('62', '卫衣男2019春季新款新年大红色连帽套头卫衣国潮', '99', 'upload/minphoto/卫衣男2019春季新款新年大红色连帽套头卫衣国潮2.jpg;upload/minphoto/卫衣男2019春季新款新年大红色连帽套头卫衣国潮1.jpg;upload/minphoto/卫衣男2019春季新款新年大红色连帽套头卫衣国潮3.jpg;upload/minphoto/卫衣男2019春季新款新年大红色连帽套头卫衣国潮4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092044_0.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092054_232.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092108_263.jpg\" alt=\"\" /><br />', '97', '19');
INSERT INTO `product` VALUES ('63', '墨绿短袖针织衫', '99', 'upload/minphoto/墨绿短袖针织衫1.jpg;upload/minphoto/墨绿短袖针织衫2.jpg;upload/minphoto/墨绿短袖针织衫3.jpg;upload/minphoto/墨绿短袖针织衫4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092145_603.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092152_367.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092159_220.jpg\" alt=\"\" /><br />', '100', '19');
INSERT INTO `product` VALUES ('64', '安踏女子2019新款夏季透气棉短T短袖', '199', 'upload/minphoto/安踏女子2019新款夏季透气棉短T短袖3.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖1.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖2.jpg;upload/minphoto/安踏女子2019新款夏季透气棉短T短袖4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092222_783.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092230_888.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092238_835.jpg\" alt=\"\" /><br />', '100', '20');
INSERT INTO `product` VALUES ('65', '安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套', '199', 'upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套2.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套1.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套3.jpg;upload/minphoto/安踏运动外套女 2019春季新款潮流休闲复古连帽运动上衣女装外套4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092350_268.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092356_864.jpg\" alt=\"\" /><br />', '99', '20');
INSERT INTO `product` VALUES ('66', '安踏儿童2019新款夏季中大童短T短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-4.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092432_36.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092440_223.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092450_75.jpg\" alt=\"\" /><br />', '100', '21');
INSERT INTO `product` VALUES ('67', '安踏儿童2019新款夏季中大童汤普森KT短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-4.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-5.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092512_72.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092519_762.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092527_743.jpg\" alt=\"\" /><br />', '100', '21');
INSERT INTO `product` VALUES ('68', '男子经久耐穿足球运动长袜', '50', 'upload/minphoto/男子经久耐穿足球运动长袜-2.jpg;upload/minphoto/男子经久耐穿足球运动长袜-1.jpg;upload/minphoto/男子经久耐穿足球运动长袜-3.jpg;upload/minphoto/男子经久耐穿足球运动长袜-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092557_490.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092604_810.jpg\" alt=\"\" /><br />', '99', '22');
INSERT INTO `product` VALUES ('69', '安踏女子袜子新款袜船袜短袜运动袜组合三双装', '50', 'upload/minphoto/安踏女子袜子新款袜船袜短袜运动袜组合三双装-1.jpg;upload/minphoto/安踏女子袜子新款袜船袜短袜运动袜组合三双装-2.jpg;upload/minphoto/安踏女子袜子新款袜船袜短袜运动袜组合三双装-3.jpg;upload/minphoto/安踏女子袜子新款袜船袜短袜运动袜组合三双装-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092633_513.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092642_749.jpg\" alt=\"\" /><br />', '98', '22');
INSERT INTO `product` VALUES ('70', '安踏篮球', '99', 'upload/minphoto/安踏篮球-1.jpg;upload/minphoto/安踏篮球-2.jpg;upload/minphoto/安踏篮球-3.jpg;upload/minphoto/安踏篮球-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092905_453.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092912_286.jpg\" alt=\"\" /><br />', '98', '24');
INSERT INTO `product` VALUES ('71', '安踏足球足球儿童青少年成人专业比赛训练用球标准球', '99', 'upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-2.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-1.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-3.jpg;upload/minphoto/安踏足球足球儿童青少年成人专业比赛训练用球标准球-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092930_25.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092936_805.jpg\" alt=\"\" /><br />', '100', '24');
INSERT INTO `product` VALUES ('72', '男子运动内裤', '66', 'upload/minphoto/男子运动内裤b1.jpg;upload/minphoto/男子运动内裤b2.jpg;upload/minphoto/男子运动内裤b3.jpg;upload/minphoto/男子运动内裤b4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092736_570.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092741_406.jpg\" alt=\"\" /><br />', '100', '23');
INSERT INTO `product` VALUES ('73', '男子内裤紧身透气款', '30', 'upload/minphoto/男子运动内裤啊3.jpg;upload/minphoto/男子运动内裤啊1.jpg;upload/minphoto/男子运动内裤啊2.jpg;upload/minphoto/男子运动内裤啊4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092839_287.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626092824_845.jpg\" alt=\"\" /><br />', '100', '23');
INSERT INTO `product` VALUES ('74', '双肩背包', '99', 'upload/minphoto/双肩背包-1.jpg;upload/minphoto/双肩背包-2.jpg;upload/minphoto/双肩背包-3.jpg;upload/minphoto/双肩背包-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626092959_947.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093007_269.jpg\" alt=\"\" /><br />', '100', '25');
INSERT INTO `product` VALUES ('75', '安踏腰包 2018新款户外运动包男女跑步手机收纳袋水壶包贴身胸包', '59', 'upload/minphoto/安踏腰包 2018新款户外运动包男女跑步手机收纳袋水壶包贴身胸包-1.jpg;upload/minphoto/安踏腰包 2018新款户外运动包男女跑步手机收纳袋水壶包贴身胸包-2.jpg;upload/minphoto/安踏腰包 2018新款户外运动包男女跑步手机收纳袋水壶包贴身胸包-3.jpg;upload/minphoto/安踏腰包 2018新款户外运动包男女跑步手机收纳袋水壶包贴身胸包-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093024_693.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093032_145.jpg\" alt=\"\" /><br />', '100', '25');
INSERT INTO `product` VALUES ('76', '安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋', '99', 'upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-3.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-1.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-2.jpg;upload/minphoto/安踏童鞋男童 新款青少年学生皮面慢跑防滑碎钉TF人工草地足球鞋-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093116_187.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093124_787.jpg\" alt=\"\" /><br />', '99', '26');
INSERT INTO `product` VALUES ('77', '安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋', '99', 'upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋3.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋4.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋1.jpg;upload/minphoto/安踏儿童2019夏季新款KT汤普森篮球鞋中大童轻便透气鞋2.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093158_646.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093205_690.jpg\" alt=\"\" /><br />', '96', '26');
INSERT INTO `product` VALUES ('78', '安踏儿童2019新款夏季中大童短T短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-4.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童短T短袖-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093237_651.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093243_948.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093255_516.jpg\" alt=\"\" /><br />', '100', '27');
INSERT INTO `product` VALUES ('79', '安踏儿童2019新款夏季中大童汤普森KT短袖', '99', 'upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-3.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-1.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-2.jpg;upload/minphoto/安踏儿童2019新款夏季中大童汤普森KT短袖-6.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093324_346.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093331_425.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093337_390.jpg\" alt=\"\" /><br />', '100', '27');
INSERT INTO `product` VALUES ('80', '儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包', '99', 'upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-2.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-1.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-3.jpg;upload/minphoto/儿童双肩背包秋冬新款女童粉色卡通可爱公主洋气儿童书包-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093353_406.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093420_969.jpg\" alt=\"\" /><br />', '100', '28');
INSERT INTO `product` VALUES ('81', '棒球帽', '59', 'upload/minphoto/棒球帽-2.jpg;upload/minphoto/棒球帽-1.jpg;upload/minphoto/棒球帽-3.jpg;upload/minphoto/棒球帽-4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093442_941.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093449_931.jpg\" alt=\"\" /><br />', '100', '28');
INSERT INTO `product` VALUES ('82', '男童足球比赛套装', '99', 'upload/minphoto/男童足球比赛套装-4.jpg;upload/minphoto/男童足球比赛套装-3.jpg;upload/minphoto/男童足球比赛套装-2.jpg;upload/minphoto/男童足球比赛套装-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093512_817.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093534_460.jpg\" alt=\"\" /><br />', '100', '29');
INSERT INTO `product` VALUES ('83', '安踏童装 秋冬新款女童中大儿童时尚梭织运动短裙童装裙子女', '99', 'upload/minphoto/安踏童装 秋冬新款女童中大儿童时尚梭织运动短裙童装裙子女-4.jpg;upload/minphoto/安踏童装 秋冬新款女童中大儿童时尚梭织运动短裙童装裙子女-3.jpg;upload/minphoto/安踏童装 秋冬新款女童中大儿童时尚梭织运动短裙童装裙子女-2.jpg;upload/minphoto/安踏童装 秋冬新款女童中大儿童时尚梭织运动短裙童装裙子女-1.jpg', '<img src=\"/01anta/attached/image/20190626/20190626093552_436.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093559_760.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626093606_700.jpg\" alt=\"\" /><br />', '100', '29');
INSERT INTO `product` VALUES ('84', '安踏女子2019春夏新款背心式T字运动背心BRA', '159', 'upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA1.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA2.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA3.jpg;upload/minphoto/安踏女子2019春夏新款背心式T字运动背心BRA4.jpg', '<img src=\"/01anta/attached/image/20190626/20190626084222_129.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084230_191.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084238_662.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190626/20190626084244_383.jpg\" alt=\"\" /><br />', '99', '4');
INSERT INTO `product` VALUES ('85', '汤普森轻骑6代篮球鞋', '699', 'upload/minphoto/篮球鞋高帮UFO2代-天体战靴1.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴2.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴3.jpg;upload/minphoto/篮球鞋高帮UFO2代-天体战靴4.jpg', '<img src=\"/01anta/attached/image/20190628/20190628155920_192.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190628/20190628155928_397.jpg\" alt=\"\" /><img src=\"/01anta/attached/image/20190628/20190628155937_746.jpg\" alt=\"\" /><br />', '120', '5');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '增');
INSERT INTO `role` VALUES ('2', '删');
INSERT INTO `role` VALUES ('3', '改');

-- ----------------------------
-- Table structure for secondtype
-- ----------------------------
DROP TABLE IF EXISTS `secondtype`;
CREATE TABLE `secondtype` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `stname` varchar(255) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`stid`),
  KEY `tid_fk` (`tid`),
  CONSTRAINT `tid_fk` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondtype
-- ----------------------------
INSERT INTO `secondtype` VALUES ('1', '男子跑步系列', '1');
INSERT INTO `secondtype` VALUES ('2', '女子跑步系列', '1');
INSERT INTO `secondtype` VALUES ('3', '儿童跑步系列', '1');
INSERT INTO `secondtype` VALUES ('4', '跑步新品推荐', '1');
INSERT INTO `secondtype` VALUES ('5', '篮球鞋', '2');
INSERT INTO `secondtype` VALUES ('6', '篮球服', '2');
INSERT INTO `secondtype` VALUES ('7', '儿童篮球系列', '2');
INSERT INTO `secondtype` VALUES ('8', '汤普森系列', '2');
INSERT INTO `secondtype` VALUES ('9', '足球鞋', '3');
INSERT INTO `secondtype` VALUES ('10', '足球服', '3');
INSERT INTO `secondtype` VALUES ('11', '足球配件', '3');
INSERT INTO `secondtype` VALUES ('12', '足球新品推荐', '3');
INSERT INTO `secondtype` VALUES ('13', '男子健身', '4');
INSERT INTO `secondtype` VALUES ('14', '女子健身', '4');
INSERT INTO `secondtype` VALUES ('15', '健身新品推荐', '4');
INSERT INTO `secondtype` VALUES ('16', '儿童综训系列', '4');
INSERT INTO `secondtype` VALUES ('17', '男子休闲鞋', '5');
INSERT INTO `secondtype` VALUES ('18', '女子休闲鞋', '5');
INSERT INTO `secondtype` VALUES ('19', '男子休闲服', '5');
INSERT INTO `secondtype` VALUES ('20', '女子休闲服', '5');
INSERT INTO `secondtype` VALUES ('21', '儿童休闲系列', '5');
INSERT INTO `secondtype` VALUES ('22', '运动袜', '6');
INSERT INTO `secondtype` VALUES ('23', '运动内裤', '6');
INSERT INTO `secondtype` VALUES ('24', '篮球/足球', '6');
INSERT INTO `secondtype` VALUES ('25', '运动包包', '6');
INSERT INTO `secondtype` VALUES ('26', '童鞋', '7');
INSERT INTO `secondtype` VALUES ('27', '童装', '7');
INSERT INTO `secondtype` VALUES ('28', '儿童配件', '7');
INSERT INTO `secondtype` VALUES ('29', '儿童新品推荐', '7');

-- ----------------------------
-- Table structure for shopaddress
-- ----------------------------
DROP TABLE IF EXISTS `shopaddress`;
CREATE TABLE `shopaddress` (
  `mid` int(200) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `mtel` varchar(255) NOT NULL,
  `maddress` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `shopaddress_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shopaddress
-- ----------------------------
INSERT INTO `shopaddress` VALUES ('6', '1', '刘清浩', '666666', '天津市滨海新区');
INSERT INTO `shopaddress` VALUES ('7', '1', '姜尧', '18909131082', '天津滨海新区');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '跑步');
INSERT INTO `type` VALUES ('2', '篮球');
INSERT INTO `type` VALUES ('3', '足球');
INSERT INTO `type` VALUES ('4', '健身');
INSERT INTO `type` VALUES ('5', '休闲');
INSERT INTO `type` VALUES ('6', '配件');
INSERT INTO `type` VALUES ('7', '儿童');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `upwd` varchar(255) NOT NULL,
  `utel` varchar(255) NOT NULL,
  `uemail` varchar(255) NOT NULL,
  `uaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lucky', '13293140469', '13293140469', '541519467@qq.com', '天津市滨海新区');
INSERT INTO `user` VALUES ('2', 'king', 'king111111', '18718976567', 'hdjashdj@qq.com', '唐山路北');
INSERT INTO `user` VALUES ('3', '刘清浩', 'jjjjjj', '66666666666', '541519467@qq.com', ' ');
INSERT INTO `user` VALUES ('4', '凉快', 'qweqeq', '18713823215', '541519467@qq.com', ' ');
INSERT INTO `user` VALUES ('5', '看看', 'fsdfsdfsdf', '18713823211', '541519467@qq.com', '天津市海河');
INSERT INTO `user` VALUES ('6', '版本', 'dasdsada', '18713823218', '541519467@qq.com', '天津市海河');
INSERT INTO `user` VALUES ('7', '框架', 'nsfdmnfsd', '18713823220', '541519467@qq.com', '天津市海河');
INSERT INTO `user` VALUES ('8', '蒋家驹', 'jjjjjj', '44444444444', '541519467@qq.com', '天津市滨海新区');
INSERT INTO `user` VALUES ('9', '刘清浩', '1111111', '13254655556', '541519467@qq.com', '天津');
