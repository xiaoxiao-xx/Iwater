/*
 Navicat Premium Data Transfer

 Source Server         : xiaoxiao
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : iwater

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 22/11/2019 14:23:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bucket_in_out
-- ----------------------------
DROP TABLE IF EXISTS `bucket_in_out`;
CREATE TABLE `bucket_in_out`  (
  `BUCKET_IN_OUT_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUSTOMER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARKS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACCOUNT_MONEY` double NULL DEFAULT NULL,
  `CHANGE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`BUCKET_IN_OUT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bucket_in_out
-- ----------------------------
INSERT INTO `bucket_in_out` VALUES ('2db85319-8cbc-47a4-b8e4-f0e6cddd262e', '0c60d192-8e10-4eaa-a8e5-0a70964dea34', '1', '娃哈哈(1)', 40, '2019-11-22 14:18:08');

-- ----------------------------
-- Table structure for buy_in
-- ----------------------------
DROP TABLE IF EXISTS `buy_in`;
CREATE TABLE `buy_in`  (
  `BUY_IN_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUY_NUM` int(11) NULL DEFAULT NULL,
  `BUY_MONEY` double NULL DEFAULT NULL,
  `BUY_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`BUY_IN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer_goods
-- ----------------------------
DROP TABLE IF EXISTS `customer_goods`;
CREATE TABLE `customer_goods`  (
  `CUSTOMER_GOODS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUSTOMER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_GOODS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_goods
-- ----------------------------
INSERT INTO `customer_goods` VALUES ('c340aab4-4818-4a9a-9383-dd3d0f144e5a', '0c60d192-8e10-4eaa-a8e5-0a70964dea34', '22cc2c93-8c73-4f81-b3d6-134641e70578');
INSERT INTO `customer_goods` VALUES ('f73f6f40-eeb5-45ae-a714-6fd8489f4724', 'eabc58b1-720c-4cae-9198-d70e8234e4ae', '3ae38d05-dabc-4f02-9cfa-4fa3fc3d9690');

-- ----------------------------
-- Table structure for customer_table
-- ----------------------------
DROP TABLE IF EXISTS `customer_table`;
CREATE TABLE `customer_table`  (
  `CUSTOMER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUSTOMER_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_TEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_STATU` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_OTHERINFO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_table
-- ----------------------------
INSERT INTO `customer_table` VALUES ('0c60d192-8e10-4eaa-a8e5-0a70964dea34', '1', '新疆乌鲁木齐', '13956898521', '活跃', '', '2019-11-22 14:12:25');
INSERT INTO `customer_table` VALUES ('eabc58b1-720c-4cae-9198-d70e8234e4ae', '2', '成都市', '17789565263', '活跃', '', '2019-11-22 14:19:36');

-- ----------------------------
-- Table structure for goods_table
-- ----------------------------
DROP TABLE IF EXISTS `goods_table`;
CREATE TABLE `goods_table`  (
  `GOODS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODS_OUT` double NULL DEFAULT NULL,
  `GOODS_IN` double NULL DEFAULT NULL,
  `GOODS_SPECS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_table
-- ----------------------------
INSERT INTO `goods_table` VALUES ('22cc2c93-8c73-4f81-b3d6-134641e70578', '娃哈哈', 30, 20, '大桶', '2019-11-22 14:11:33');
INSERT INTO `goods_table` VALUES ('3ae38d05-dabc-4f02-9cfa-4fa3fc3d9690', '恒大冰泉', 16, 10, '大桶', '2019-11-22 14:11:47');
INSERT INTO `goods_table` VALUES ('b57d14cf-a3c5-4bbb-bd18-2b7b55760c99', '怡宝', 18, 12, '大桶', '2019-11-22 14:11:22');

-- ----------------------------
-- Table structure for money_manage
-- ----------------------------
DROP TABLE IF EXISTS `money_manage`;
CREATE TABLE `money_manage`  (
  `MANAGE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INCOME` double NULL DEFAULT NULL,
  `OUTCOME` double NULL DEFAULT NULL,
  `REMARKS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MANAGE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`MANAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of money_manage
-- ----------------------------
INSERT INTO `money_manage` VALUES ('11d174a2-f403-47cb-b332-dd8e4ce2827b', 16, NULL, '客户(2)购买恒大冰泉[大桶](1)桶', '2019-11-22 14:19:57');
INSERT INTO `money_manage` VALUES ('2db85319-8cbc-47a4-b8e4-f0e6cddd262e', 40, NULL, '客户1号押娃哈哈(1)', '2019-11-22 14:18:08');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '2019-11-22 14:04:51');

-- ----------------------------
-- Table structure for water_sale
-- ----------------------------
DROP TABLE IF EXISTS `water_sale`;
CREATE TABLE `water_sale`  (
  `WATER_SALE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUSTOMER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SALE_NUM` int(11) NULL DEFAULT NULL,
  `SALE_MONEY` double NULL DEFAULT NULL,
  `TICKET_COUNT` int(11) NULL DEFAULT NULL,
  `REMARKS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SALE_STATU` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SALE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`WATER_SALE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_sale
-- ----------------------------
INSERT INTO `water_sale` VALUES ('03d56027-b1c8-49cb-8267-06fed3a4057c', '0c60d192-8e10-4eaa-a8e5-0a70964dea34', '1', '22cc2c93-8c73-4f81-b3d6-134641e70578', '娃哈哈[大桶]', 1, 20, 1, NULL, '1', '2019-11-22 14:18:58');
INSERT INTO `water_sale` VALUES ('461206da-25df-4f81-828a-1dd8b55da7b2', 'eabc58b1-720c-4cae-9198-d70e8234e4ae', '2', '3ae38d05-dabc-4f02-9cfa-4fa3fc3d9690', '恒大冰泉[大桶]', 1, 16, 0, NULL, '1', '2019-11-22 14:19:57');

-- ----------------------------
-- Table structure for water_ticket
-- ----------------------------
DROP TABLE IF EXISTS `water_ticket`;
CREATE TABLE `water_ticket`  (
  `WATER_TICKET_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CUSTOMER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WATER_TICKET_COUNT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WATER_TICKET_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_ticket
-- ----------------------------
INSERT INTO `water_ticket` VALUES ('9524e4f5-86e5-4a67-9e5e-9d133a4392d8', '0c60d192-8e10-4eaa-a8e5-0a70964dea34', '1', 0);
INSERT INTO `water_ticket` VALUES ('d4243b48-40a1-424e-88b9-8c79954d2ec0', 'eabc58b1-720c-4cae-9198-d70e8234e4ae', '2', 0);

SET FOREIGN_KEY_CHECKS = 1;
