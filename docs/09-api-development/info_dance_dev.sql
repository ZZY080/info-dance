/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80402 (8.4.2)
 Source Host           : localhost:3306
 Source Schema         : info_dance_dev

 Target Server Type    : MySQL
 Target Server Version : 80402 (8.4.2)
 File Encoding         : 65001

 Date: 18/10/2024 16:40:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绫诲埆琛╥d',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍒嗙被鍚嶇О',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '鍒嗙被鎻忚堪',
  `created_at` datetime NOT NULL COMMENT '绫诲埆鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '绫诲埆鏇存柊鏃堕棿',
  `entity_type` enum('resource','car') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'resource' COMMENT '鍏蜂綋鏄摢涓被鍨嬪疄浣撶殑绫诲埆',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '绫诲埆琛?(澶氱浜у搧鐨勭被鍒〃)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for chat_room
-- ----------------------------
DROP TABLE IF EXISTS `chat_room`;
CREATE TABLE `chat_room`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鎴块棿id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '鎴块棿鍚?',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `type` enum('PRIVATETYPE','GROUPTYPE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'PRIVATETYPE' COMMENT '鎴块棿绫诲瀷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鎴块棿琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_room
-- ----------------------------
INSERT INTO `chat_room` VALUES ('1', '涓浗', '2024-09-06 15:01:01', '2024-09-06 15:01:15', 'PRIVATETYPE');
INSERT INTO `chat_room` VALUES ('2', '澶х編娌冲北', '2024-09-06 15:01:30', '2024-09-06 15:01:44', 'GROUPTYPE');

-- ----------------------------
-- Table structure for chat_room_content
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_content`;
CREATE TABLE `chat_room_content`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱婂ぉ娑堟伅id',
  `chat_room_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱婂ぉ鎴块棿id',
  `messages` json NULL COMMENT '璇ユ埧闂翠笅鎵?鏈夎亰澶╂秷鎭?',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鑱婂ぉ娑堟伅琛ㄧ敤浜庡瓨鍌ㄦ秷鎭?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_room_content
-- ----------------------------

-- ----------------------------
-- Table structure for chat_room_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_user`;
CREATE TABLE `chat_room_user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鎴块棿鍜岀敤鎴峰叧鑱旇〃id',
  `chat_room_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '鎴块棿id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `toggle_push` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鑱婂ぉ鎴块棿鐢ㄦ埛琛ㄥ瓨鍌ㄦ埧闂翠笌鐢ㄦ埛' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_room_user
-- ----------------------------
INSERT INTO `chat_room_user` VALUES ('1', '1', '1', '2024-09-06 15:04:45', 'true');
INSERT INTO `chat_room_user` VALUES ('2', '1', '2', '2024-09-06 15:04:58', 'true');
INSERT INTO `chat_room_user` VALUES ('3', '2', '1', '2024-09-06 15:05:12', 'true');
INSERT INTO `chat_room_user` VALUES ('4', '2', '2', '2024-09-06 15:05:20', 'true');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璁㈠崟琛?',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `total_price` decimal(10, 2) NOT NULL COMMENT '鎬讳环鏍?',
  `status` enum('pending','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending' COMMENT '璁㈠崟鐘舵??',
  `created_at` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '璁㈠崟鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璁㈠崟琛ㄤ笉瑕佷笌璐拱琛ㄦ贩涓轰竴璋?,鍥犱负杩欐牱鍙互璁板綍鎵?鏈夌被鍨嬬殑璐拱璁板綍' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'order_resource鐨勮祫婧恑d',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璁㈠崟id',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮id',
  `quantity` bigint NOT NULL COMMENT '璧勬簮璐拱鏁伴噺',
  `price` decimal(10, 2) NOT NULL COMMENT '璐拱鍗曚环',
  `created_at` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璧勬簮璁㈠崟琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_product
-- ----------------------------

-- ----------------------------
-- Table structure for order_resource
-- ----------------------------
DROP TABLE IF EXISTS `order_resource`;
CREATE TABLE `order_resource`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'order_resource鐨勮祫婧恑d',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璁㈠崟id',
  `resource_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮id',
  `quantity` bigint NOT NULL COMMENT '璧勬簮璐拱鏁伴噺',
  `price` decimal(10, 2) NOT NULL COMMENT '璐拱鍗曚环',
  `created_at` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璧勬簮璁㈠崟琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_resource
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'create', '增加', '2024-09-18 10:37:05.816481', '2024-09-18 10:37:05.816481');
INSERT INTO `permission` VALUES ('2', 'delete', '删除', '2024-09-18 10:37:19.918352', '2024-09-18 10:37:19.918352');
INSERT INTO `permission` VALUES ('3', 'update', '更新', '2024-09-18 10:37:39.286661', '2024-09-18 10:37:39.286661');
INSERT INTO `permission` VALUES ('4', 'find', '查找', '2024-09-18 10:37:50.875044', '2024-09-18 10:37:50.875044');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `stock` bigint NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '浜у搧妯″潡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮鏍囬',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '璧勬簮鎻忚堪',
  `type` enum('ppt','pdf','video','audio','excel','word') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮绫诲瀷',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮鐨勯摼鎺?',
  `cover_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮灏侀潰鍥剧墖url',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `created_at` datetime NOT NULL COMMENT '璧勬簮鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '璧勬簮鏇存柊鏃堕棿',
  `price` decimal(10, 3) NOT NULL COMMENT '璧勬簮浠锋牸',
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绫诲埆id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璧勬簮琛ㄥ寘鍚悇绉嶇數瀛愯祫婧?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'normal', '普通用户', '2024-09-18 10:33:10.262597', '2024-09-18 10:36:09.724998');
INSERT INTO `role` VALUES ('2', 'admin', '管理员', '2024-09-18 10:33:26.784865', '2024-09-18 10:36:24.043663');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `permission_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '4', '2024-09-18 10:38:33.115454', '2024-09-18 10:38:33.115454');
INSERT INTO `role_permission` VALUES ('2', '2', '1', '2024-09-18 10:38:45.450269', '2024-09-18 10:38:45.450269');
INSERT INTO `role_permission` VALUES ('3', '2', '2', '2024-09-18 10:38:51.813963', '2024-09-18 10:38:51.813963');
INSERT INTO `role_permission` VALUES ('4', '2', '3', '2024-09-18 10:38:58.772180', '2024-09-18 10:38:58.772180');
INSERT INTO `role_permission` VALUES ('5', '2', '4', '2024-09-18 10:39:05.642796', '2024-09-18 10:39:05.642796');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_e12875dfb3b1d92d7d7c5377e2`(`email` ASC) USING BTREE,
  UNIQUE INDEX `IDX_8e1f623798118e629b46a9e629`(`phone` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'kenny', '123456', '2916363651@qq.com', NULL, '', '2024-09-17 14:45:06.600886', '2024-09-18 10:34:06.718730', '');
INSERT INTO `user` VALUES ('2', 'novia', '123456', '2916363652@qq.com', NULL, '', '2024-09-18 10:34:31.442200', '2024-09-18 10:34:31.442200', '');
INSERT INTO `user` VALUES ('3', 'tina', '123456', '2916363653@qq.com', NULL, '', '2024-09-18 10:34:50.260300', '2024-09-18 10:34:50.260300', '');
INSERT INTO `user` VALUES ('4', 'dinna', '123456', '2916363654@qq.com', NULL, '', '2024-09-18 10:35:20.944753', '2024-09-18 10:35:20.944753', '');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1', '2024-09-18 10:33:53.692080', '2024-09-18 10:34:01.394763');
INSERT INTO `user_role` VALUES ('2', '2', '1', '2024-09-18 10:35:36.070442', '2024-09-18 10:35:36.070442');
INSERT INTO `user_role` VALUES ('3', '3', '1', '2024-09-18 10:35:43.317486', '2024-09-18 10:35:43.317486');
INSERT INTO `user_role` VALUES ('4', '4', '2', '2024-09-18 10:35:48.738740', '2024-09-18 10:35:48.738740');
INSERT INTO `user_role` VALUES ('5', '2', '2', '2024-09-18 12:47:09.241130', '2024-09-18 12:47:09.241130');

SET FOREIGN_KEY_CHECKS = 1;
