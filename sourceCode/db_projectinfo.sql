/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_projectinfo

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 27/11/2023 20:32:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for broadcast
-- ----------------------------
DROP TABLE IF EXISTS `broadcast`;
CREATE TABLE `broadcast`  (
  `broadcastid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `broadcast_kindsid` int(255) NULL DEFAULT NULL COMMENT '分类id',
  `istop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否置顶',
  `isflv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否轮播',
  `contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `addtime` date NULL DEFAULT NULL COMMENT '添加时间',
  `hits` int(255) NULL DEFAULT NULL COMMENT '点击量',
  `membersid` int(11) NULL DEFAULT 0 COMMENT '发布人0管理员 ',
  `videopath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频 地址',
  PRIMARY KEY (`broadcastid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of broadcast
-- ----------------------------
INSERT INTO `broadcast` VALUES (1, '1新闻通知资讯', 'upload_files/2.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 0, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (2, '2网站公告', 'upload_files/3.jpg', 2, '否', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 69, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (3, '3新闻通知资讯，你知道吗', 'upload_files/4.jpg', 1, '是', '否', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 69, 1, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (4, '4新闻通知资讯', 'upload_files/1.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 69, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (9, '5新闻通知资讯', 'upload_files/1.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-28', 71, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (10, '6网站公告', 'upload_files/1.jpg', 2, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 72, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (11, ' 7网站公告', 'upload_files/2.jpg', 2, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 1, 1, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (12, '8新闻通知资讯', 'upload_files/3.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 69, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (13, '11新闻通知资讯', 'upload_files/4.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 69, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (14, '22网站公告', 'upload_files/5.jpg', 2, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 0, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (15, '33网站公告', 'upload_files/1.jpg', 2, '否', '否', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 1, 1, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (16, '44发新闻通知了', 'upload_files/3.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 70, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (17, '55新闻通知资讯', 'upload_files/2.jpg', 1, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-30', 1, 0, 'upload_files/1.mp4');
INSERT INTO `broadcast` VALUES (30, '66网站公告 ', 'upload_files/1.jpg', 2, '是', '是', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', '2024-05-02', 10, 1, 'upload_files/1.mp4');

-- ----------------------------
-- Table structure for broadcast_kinds
-- ----------------------------
DROP TABLE IF EXISTS `broadcast_kinds`;
CREATE TABLE `broadcast_kinds`  (
  `broadcast_kindsid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `broadcast_kindsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`broadcast_kindsid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻通知分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of broadcast_kinds
-- ----------------------------
INSERT INTO `broadcast_kinds` VALUES (1, '新闻通知');
INSERT INTO `broadcast_kinds` VALUES (2, '网站公告');

-- ----------------------------
-- Table structure for classifyinfo
-- ----------------------------
DROP TABLE IF EXISTS `classifyinfo`;
CREATE TABLE `classifyinfo`  (
  `classifyinfoid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场地器材类型名称',
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场地器材类型介绍',
  `opendate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加日期',
  `contact` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系方式',
  `categorysid` int(255) NULL DEFAULT NULL COMMENT '备用字段',
  `contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`classifyinfoid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场地器材类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classifyinfo
-- ----------------------------
INSERT INTO `classifyinfo` VALUES (1,  'XX场地器材类型1', 'XX场地器材类型1', '2024-05-05', '13194451311', NULL, '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', 'upload_files/511.jpg');
INSERT INTO `classifyinfo` VALUES (2,  'XX场地器材类型2', 'XX场地器材类型1', '2024-05-05', '13194451319', NULL, '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', 'upload_files/522.jpg');
INSERT INTO `classifyinfo` VALUES (3,  'XX场地器材类型3', 'XX场地器材类型1', '2024-05-05', '13194451312', NULL, '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整/p>', 'upload_files/533.jpg');
INSERT INTO `classifyinfo` VALUES (4,  'XX场地器材类型4', 'XX场地器材类型1', '2024-05-05', '13194451313', NULL, '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', 'upload_files/544.jpg');
INSERT INTO `classifyinfo` VALUES (5,  'XX场地器材类型5', 'XX场地器材类型1', '2024-05-05', '13194451314', NULL, '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p>', 'upload_files/555.jpg');

-- ----------------------------
-- Table structure for goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo`  (
  `goodsinfoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `goodsinfoname` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '名称 ',
  `status` int(11) NULL DEFAULT 0 COMMENT '0,正常   1下线',
  `image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `countrequire` int(11) NULL DEFAULT 0 COMMENT '数量',
  `createdate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '创建时间',
  `iscooled` int(11) NULL DEFAULT 0 COMMENT '0正常    ',
  `goodsinfoprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单价',
  `goodsinfo_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  `goodsinfo_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  `goodsinfo_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  `goodsinfo_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  `goodsinfo_5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  `goodsinfo_6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`goodsinfoid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo` VALUES (236, '运动饮料', 0, 'upload_files/2003.jpg', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', 9, '2024-05-03 20:00:00', 0, '102', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goodsinfo` VALUES (237, '毛巾', 0, 'upload_files/2004.jpg', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', 5, '2024-05-03 20:00:00', 0, '102', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goodsinfo` VALUES (238, '球鞋', 0, 'upload_files/2005.jpg', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', 9, '2024-05-03 20:00:00', 0, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goodsinfo` VALUES (239, '运动服', 0, 'upload_files/2001.jpg', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', 500, '2024-05-03 20:00:00', 0, '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goodsinfo` VALUES (240, '篮球', 0, 'upload_files/2002.jpg', '<p>篮球比赛场地是一个长方形的坚实平面，篮球场地长28米，宽15米。篮球场地无土质。现在的篮球比赛场木质地板的使用较多。土质、水泥和沥青场地比较经济，大学、基层单位使用较多，但要注意地面不平整</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>', 3, '2024-05-03 17:53:52', 0, '111', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式 ',
  PRIMARY KEY (`managerid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'manager', '111111', '管理员', '13166665554');
INSERT INTO `manager` VALUES (2, 'manager1', '111111', '管理员1', '13155552222');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `membersid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  `regdate` date NULL DEFAULT NULL COMMENT '注册时间',
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `iscooled` int(2) NULL DEFAULT 0 COMMENT '0正常 1冻结',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `grades0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '备用',
  `grades1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  `grades2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  `grades3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  `grades4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  `grades5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  `grades6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备用字段',
  PRIMARY KEY (`membersid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES (1, '3333', '3333', '333', '男', '2024-05-19', '13122225555', 'upload_files/21.jpg', '2024-05-19', NULL, NULL, '北京市第一路222号', 0, '123456', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (2, '77', '77', '77', '男', '2024-05-19', '13166665555', 'upload_files/22.jpg', '2024-05-19', NULL, NULL, '北京市第一路222号', 0, '1112234', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (3, '1', '1', '1', '男', '2024-05-19', '13111112222', 'upload_files/23.jpg', '2024-05-19', NULL, NULL, '北京市第一路222号', 0, '1112', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (4, 'test', '111111', '刘小华', '女', '2024-05-01', '13199996666', 'upload_files/24.jpg', '2024-05-30', NULL, NULL, '北京市第一路222号', 0, '1113', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (5, '222', '222', '22', '男', '2024-05-30', '13111112222', 'upload_files/25.jpg', '2024-05-30', NULL, NULL, '北京市第一路222号', 0, '114', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (6, '111', '111', '1111', '男', '2024-05-28', '13155554444', 'upload_files/25.jpg', '2024-05-27', NULL, NULL, '北京市第一路222号', 0, '115', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (7, 'rrr', '111', '111', '男', '2024-05-27', '13622223333', 'upload_files/21.jpg', '2024-05-27', NULL, NULL, '北京市第一路222号', 0, '116', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (8, '555', '555', '555', '男', '2024-05-27', '13166669999', 'upload_files/25.jpg', '2024-05-27', NULL, NULL, '北京市第一路222号', 1, '117', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (9, '33', '1', '334', '女', '2024-05-30', '13166665954', 'upload_files/21.jpg', '2024-05-28', NULL, NULL, '北京市第一路222号', 1, '118', '12345678901458792', '1111111@sdf.com', '10', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases`  (
  `purchasesid` int(255) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `membersid` int(255) NULL DEFAULT NULL COMMENT '用户编号',
  `thinginfoid` int(255) NULL DEFAULT NULL COMMENT '场地器材编号',
  `addtime` date NULL DEFAULT NULL COMMENT '日期',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量',
  `purchase_time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  PRIMARY KEY (`purchasesid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES (1, 4, 1, '2024-05-17', '取消', '1', '2024-05-17 00:00:00');
INSERT INTO `purchases` VALUES (2, 4, 2, '2024-05-30', '已完成', '1', '2024-05-12 00:00:00');
INSERT INTO `purchases` VALUES (3, 1, 3, '2024-05-30', '已预约', '1', '2024-05-30 00:00:00');
INSERT INTO `purchases` VALUES (4, 1, 4, '2024-05-30', '已预约', '1', '2024-05-30 00:00:00');
INSERT INTO `purchases` VALUES (5, 4, 1, '2024-05-30', '已预约', '1', '2024-05-30 00:00:00');
INSERT INTO `purchases` VALUES (6, 2, 2, '2024-05-16', '已预约', '1', '2024-05-25 00:00:00');
INSERT INTO `purchases` VALUES (7, 4, 1, '2024-05-28', '已预约', '1', '2024-05-30 00:00:00');
INSERT INTO `purchases` VALUES (8, 4, 1, '2024-05-28', '已预约', '1', '2024-05-24 00:00:00');
INSERT INTO `purchases` VALUES (9, 4, 1, '2024-05-28', '已完成', '1', '2024-05-30 14:05:44');
INSERT INTO `purchases` VALUES (10, 4, 1, '2024-05-28', '已完成', '1', '2024-05-28 00:00:00');
INSERT INTO `purchases` VALUES (19, 4, 92, '2024-05-01', '已预约', '1', '2024-05-01 00:00:00');



-- ----------------------------
-- Table structure for thinginfo
-- ----------------------------
DROP TABLE IF EXISTS `thinginfo`;
CREATE TABLE `thinginfo`  (
  `thinginfoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `thinginfoname` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0,正常   1下线',
  `image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `countrequire` int(11) NULL DEFAULT 0 COMMENT '数量',
  `createdate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '创建时间',
  `classifyinfoid` int(11) NULL DEFAULT 0 COMMENT '类型ID',
  `thingprice` int(11) NULL DEFAULT 0 COMMENT '单价',
  PRIMARY KEY (`thinginfoid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场地器材表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thinginfo
-- ----------------------------
INSERT INTO `thinginfo` VALUES (1, '1号场地', 0, 'upload_files/1001.jpg', '<p>及时预约</p>', 1, '2024-05-03 20:00:00', 1, 300);
INSERT INTO `thinginfo` VALUES (2, '2号场地', 0, 'upload_files/1002.jpg', '<p>及时预约</p>', 48, '2024-05-03 20:00:00', 2, 300);
INSERT INTO `thinginfo` VALUES (3, '3号场地', 0, 'upload_files/1003.jpg', '<p>及时预约</p>', 20, '2024-05-03 20:00:00', 1, 300);
INSERT INTO `thinginfo` VALUES (4, '篮球收集框', 0, 'upload_files/1004.jpg', '<p>及时预约</p>', 10, '2024-05-03 20:00:00', 3, 300);
INSERT INTO `thinginfo` VALUES (92, '比赛比分展示器', 0, 'upload_files/1005.jpg', '<p>及时预约</p>', 9, '2024-05-03 20:00:00', 4, 300);
INSERT INTO `thinginfo` VALUES (93, '休息椅', 0, 'upload_files/1001.jpg', '<p>及时预约</p>', 5, '2024-05-03 20:00:00', 5, 300);
INSERT INTO `thinginfo` VALUES (94, '休息室', 0, 'upload_files/1002.jpg', '<p>及时预约</p>', 9, '2024-05-03 20:00:00', 1, 300);

SET FOREIGN_KEY_CHECKS = 1;
