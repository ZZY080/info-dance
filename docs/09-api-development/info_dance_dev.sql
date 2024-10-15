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

 Date: 24/09/2024 17:56:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for campaign
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩鍚嶅瓧',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '娲诲姩鎻忚堪',
  `start_date` datetime NULL DEFAULT NULL COMMENT '寮?濮嬫棩鏈?',
  `end_date` datetime NULL DEFAULT NULL COMMENT '缁撴潫鏃ユ湡',
  `status` enum('pennding','active','ended','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pennding' COMMENT '娲诲姩鐘舵??',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩绛栧垝琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_notification
-- ----------------------------
DROP TABLE IF EXISTS `campaign_notification`;
CREATE TABLE `campaign_notification`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩閫氱煡琛?',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩琛╥d',
  `notification_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '閫氱煡鍐呭',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `target_group` enum('all','subscribtion','vip') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'all' COMMENT '閫氱煡鐩爣缇や綋',
  `status` enum('pending','send','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '鍙戦?佺姸鎬?',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩閫氱煡琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_notification
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_participate
-- ----------------------------
DROP TABLE IF EXISTS `campaign_participate`;
CREATE TABLE `campaign_participate`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '瀹㈡埛鍙備笌璁板綍id',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩琛╥d',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '瀹㈡埛琛╥d',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '璁㈠崟琛╥d',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '瀹㈡埛鍙備笌娲诲姩璁板綍琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_participate
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_product
-- ----------------------------
DROP TABLE IF EXISTS `campaign_product`;
CREATE TABLE `campaign_product`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩浜у搧鍏宠仈琛╥d',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩琛╥d',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧琛╥d',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '鎶樻墸(濡傛弧鍑忔椿鍔?,鐩存帴鎵撴姌鎵?)',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩浜у搧鍏宠仈琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_product
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_reward
-- ----------------------------
DROP TABLE IF EXISTS `campaign_reward`;
CREATE TABLE `campaign_reward`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩濂栧搧琛╥d',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩琛╥d',
  `reward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '濂栧搧鍚嶇О',
  `reward_type` enum('product','coupon','cashback') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'product' COMMENT '濂栧搧绫诲瀷',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '濂栧搧浜у搧id(濡傛灉濂栧姳涓轰骇鍝?)',
  `coupon_value` decimal(10, 2) NULL DEFAULT NULL COMMENT '浼樻儬鍗烽噾棰?',
  `cashback` decimal(10, 2) NULL DEFAULT NULL COMMENT '杩旂幇閲戦',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩濂栧搧琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_reward
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_rule
-- ----------------------------
DROP TABLE IF EXISTS `campaign_rule`;
CREATE TABLE `campaign_rule`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩瑙勫垯琛?',
  `campaign_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩琛╥d',
  `rule_type` enum('discount','gift','buy_one_get_one','threshold') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'discount' COMMENT '瑙勫垯绫诲瀷',
  `threshold` decimal(10, 2) NULL DEFAULT NULL COMMENT '婊¤冻鏉′欢(鍏ユ弧鍑忕殑閲戦闂ㄦ)',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '鎶樻墸閲戦(濡傛弧100鍑?20)',
  `gift_product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '璧犲搧浜у搧id(濡傛灉鏄禒閫佸晢鍝佹椿鍔?)',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩瑙勫垯琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_rule
-- ----------------------------

-- ----------------------------
-- Table structure for campaign_type
-- ----------------------------
DROP TABLE IF EXISTS `campaign_type`;
CREATE TABLE `campaign_type`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '娲诲姩绫诲瀷id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娲诲姩绫诲瀷鍚?',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '娲诲姩绫诲瀷鎻忚堪',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '娲诲姩绛栧垝绫诲瀷琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign_type
-- ----------------------------

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
-- Table structure for chat_message
-- ----------------------------
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE `chat_message`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱婂ぉ娑堟伅id',
  `chat_room_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱婂ぉ鎴块棿id',
  `content` json NULL COMMENT '璇ユ埧闂翠笅鎵?鏈夎亰澶╂秷鎭?',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鑱婂ぉ娑堟伅琛ㄧ敤浜庡瓨鍌ㄦ秷鎭?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_message
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
-- Table structure for chat_room_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_user`;
CREATE TABLE `chat_room_user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鎴块棿鍜岀敤鎴峰叧鑱旇〃id',
  `chat_room_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '鎴块棿id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鑱婂ぉ鎴块棿鐢ㄦ埛琛ㄥ瓨鍌ㄦ埧闂翠笌鐢ㄦ埛' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_room_user
-- ----------------------------
INSERT INTO `chat_room_user` VALUES ('1', '1', '1', '2024-09-06 15:04:45');
INSERT INTO `chat_room_user` VALUES ('2', '1', '2', '2024-09-06 15:04:58');
INSERT INTO `chat_room_user` VALUES ('3', '2', '1', '2024-09-06 15:05:12');
INSERT INTO `chat_room_user` VALUES ('4', '2', '2', '2024-09-06 15:05:20');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍏徃ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鍏徃鍚嶇О',
  `legal_representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娉曞畾浠ｈ〃浜?',
  `register_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鍏徃娉ㄥ唽鍙?',
  `register_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '娉ㄥ唽鍦板潃',
  `business` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '缁忚惀鑼冨洿',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鎵?灞炶涓?',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鑱旂郴閭',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鑱旂郴鐢佃瘽',
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '鍏ラ┗鐘舵??',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鍏徃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for company_document
-- ----------------------------
DROP TABLE IF EXISTS `company_document`;
CREATE TABLE `company_document`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍏徃鏂囦欢id',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鍏徃id',
  `type` enum('business_license','tax_certificate','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'business_license' COMMENT '鏂囦欢绫诲瀷(钀ヤ笟鎵х収,绋庡姟鐧昏璇佷功)',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鏂囦欢url',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鍏徃鏂囦欢琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company_document
-- ----------------------------

-- ----------------------------
-- Table structure for company_view
-- ----------------------------
DROP TABLE IF EXISTS `company_view`;
CREATE TABLE `company_view`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍏徃瀹℃牳璁板綍琛╥d',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鍏徃id',
  `review_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '瀹℃牳鍛榠d',
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '瀹℃牳鐘舵??',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '瀹℃牳鎰忚',
  `created_at` datetime NULL DEFAULT NULL COMMENT '瀹℃牳鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鍏徃瀹℃牳璁板綍琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company_view
-- ----------------------------

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浼樻儬鍗穒d',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浼樻儬鍗蜂唬鐮?',
  `discount_type` enum('percentage','fixed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'percentage' COMMENT '鎶樻墸绫诲瀷(榛樿绫诲瀷鍜屾姌鎵ｇ被鍨?)',
  `end_date` datetime NOT NULL COMMENT '浼樻儬鍗疯繃鏈熸椂闂?',
  `created_at` datetime NOT NULL COMMENT '浼樻儬鍗峰垱寤烘椂闂?',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '浼樻儬鍗锋洿鏂版椂闂?',
  `discount_value` decimal(10, 2) NOT NULL COMMENT '鎶樻墸鍊?',
  `total_quantity` bigint NOT NULL COMMENT '浼樻儬鍗锋暟閲?',
  `claimed_quantity` bigint NOT NULL DEFAULT 0 COMMENT '浼樻儬鍗峰凡棰嗗彇鏁伴噺',
  `popup_time` datetime NOT NULL COMMENT '浼樻儬鍗峰脊鍑烘椂闂?',
  `start_date` datetime NOT NULL COMMENT '浼樻儬鍗峰紑濮嬫湁鏁堟椂闂?',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '浼樻儬鍔佃〃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閮ㄩ棬淇℃伅琛╥d',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閮ㄩ棬鍚嶇О',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閮ㄩ棬鎻忚堪',
  `created_at` datetime NULL DEFAULT NULL COMMENT '閮ㄩ棬鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '閮ㄩ棬鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '閮ㄩ棬琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for digital_resource
-- ----------------------------
DROP TABLE IF EXISTS `digital_resource`;
CREATE TABLE `digital_resource`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮鏍囬',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '璧勬簮鎻忚堪',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮鐨勯摼鎺?',
  `cover_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮灏侀潰鍥剧墖url',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `created_at` datetime NOT NULL COMMENT '璧勬簮鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '璧勬簮鏇存柊鏃堕棿',
  `price` decimal(10, 3) NOT NULL COMMENT '璧勬簮浠锋牸',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浜у搧id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璧勬簮琛ㄥ寘鍚悇绉嶇數瀛愯祫婧?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of digital_resource
-- ----------------------------

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '涓嬭浇id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `created_at` datetime NOT NULL COMMENT '涓嬭浇鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '涓嬭浇琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for financial_record
-- ----------------------------
DROP TABLE IF EXISTS `financial_record`;
CREATE TABLE `financial_record`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璐㈠姟璁板綍琛╥d',
  `type` enum('income','expense') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鏀跺叆鎴栨敮鍑?',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '閲戦',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '澶囨敞',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璐㈠姟璁板綍琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial_record
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '搴撳瓨琛╥d',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧id',
  `quantity` bigint NULL DEFAULT NULL COMMENT '搴撳瓨鏁伴噺',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '搴撳瓨绠＄悊妯″潡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_log
-- ----------------------------
DROP TABLE IF EXISTS `inventory_log`;
CREATE TABLE `inventory_log`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '搴撳瓨璁板綍琛╥d',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧id',
  `change_type` enum('in','out') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'out' COMMENT '鍙樺姩绫诲瀷(鍏ュ簱,鍑哄簱)',
  `quantity` bigint NULL DEFAULT NULL COMMENT '鍙樺姩鏁伴噺',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '搴撳瓨璁板綍琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_log
-- ----------------------------

-- ----------------------------
-- Table structure for job_position
-- ----------------------------
DROP TABLE IF EXISTS `job_position`;
CREATE TABLE `job_position`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱屼綅淇℃伅琛╥d',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱屼綅鍚嶇О',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鑱屼綅鎻忚堪',
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鎵?灞為儴闂╥d',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '宸ヤ綔鍦扮偣',
  `salary_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '钖祫鑼冨洿',
  `requirement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浠昏亴瑕佹眰',
  `status` enum('open','closed','filled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'open' COMMENT '鑱屼綅鐘舵??',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鑱屼綅鍙戝竷鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鑱屼綅鏇存柊鏃堕棿',
  `review_status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '瀹℃牳鐘舵??',
  `review_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '瀹℃牳澶囨敞鎴栨嫆缁濆師鍥?',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鑱屼綅淇℃伅琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_position
-- ----------------------------

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
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鏀粯琛╥d',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璁㈠崟id',
  `method` enum('credit_card_pay','paypal_pay','wechat_pay','ali_pay') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鏀粯鏂瑰紡',
  `status` enum('pending','completed','failed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鏀粯琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浜у搧id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧鍚嶇О',
  `product_category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧绫诲埆id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '浜у搧浠锋牸',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '浜у搧鎴愭湰',
  `stock` bigint NULL DEFAULT NULL COMMENT '浜у搧搴撳瓨鏁伴噺',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '浜у搧鎻忚堪',
  `created_at` datetime NULL DEFAULT NULL COMMENT '浜у搧鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '浜у搧鏇存柊鏃堕棿',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧鍒涘缓浜篿d',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧鏇存柊浜篿d',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '浜у搧妯″潡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浜у搧绫诲埆琛╥d',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍒嗙被鍚嶇О',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '鍒嗙被鎻忚堪',
  `created_at` datetime NOT NULL COMMENT '浜у搧绫诲埆鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '浜у搧绫诲埆鏇存柊鏃堕棿',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧绫诲埆鍒涘缓浜篿d',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧绫诲埆鏇存柊浜篿d',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '绫诲埆琛?(澶氱浜у搧鐨勭被鍒〃)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', 'car', '姹借溅', '2024-09-13 11:13:26', NULL, NULL, NULL);
INSERT INTO `product_category` VALUES ('2', 'recourse', '鐢靛瓙璧勬簮', '2024-09-13 11:13:53', NULL, NULL, NULL);
INSERT INTO `product_category` VALUES ('3', 'phone', '鎵嬫満', '2024-09-13 11:14:28', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for production_paln
-- ----------------------------
DROP TABLE IF EXISTS `production_paln`;
CREATE TABLE `production_paln`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢熶骇璁″垝id',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧id',
  `quantity` bigint NULL DEFAULT NULL COMMENT '璁″垝鐢熶骇鏁伴噺',
  `start_date` datetime NULL DEFAULT NULL COMMENT '鐢熶骇寮?濮嬫棩鏈?',
  `end_date` datetime NULL DEFAULT NULL COMMENT '棰勮瀹屾垚鏃ユ湡',
  `status` enum('pending','processing','completed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '鐢熶骇鐘舵??',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鐢熶骇璁″垝妯″潡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of production_paln
-- ----------------------------

-- ----------------------------
-- Table structure for production_record
-- ----------------------------
DROP TABLE IF EXISTS `production_record`;
CREATE TABLE `production_record`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢熶骇璁板綍id',
  `production_plan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鐢熶骇璁″垝琛╥d',
  `completed_quantity` bigint NULL DEFAULT NULL COMMENT '瀹屾垚鏁伴噺',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鍏宠仈鐨勫伐浜篿d',
  `completed_at` datetime NULL DEFAULT NULL COMMENT '瀹屾垚鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鐢熶骇璁板綍琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of production_record
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
-- Table structure for resource_download
-- ----------------------------
DROP TABLE IF EXISTS `resource_download`;
CREATE TABLE `resource_download`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮涓嬭浇琛╥d',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `resource_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '璧勬簮id',
  `created_at` datetime NOT NULL COMMENT '璧勬簮涓嬭浇鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '璧勬簮琛?' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resource_download
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
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閿?鍞鍗曡〃id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '瀹㈡埛id',
  `order_date` datetime NULL DEFAULT NULL COMMENT '璁㈠崟鏃ユ湡',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '璁㈠崟鎬婚',
  `status` enum('pending','shipped','delivered','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending' COMMENT '璁㈠崟鐘舵??',
  `created_at` datetime NULL DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '閿?鍞鍗曡〃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sale_order
-- ----------------------------

-- ----------------------------
-- Table structure for sale_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_detail`;
CREATE TABLE `sale_order_detail`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閿?鍞鍗曡〃璇︽儏id',
  `sale_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '閿?鍞鍗曡〃id',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浜у搧id',
  `quantity` bigint NULL DEFAULT NULL COMMENT '閿?鍞暟閲?',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '鍗曚釜浜у搧鐨勯攢鍞环鏍?',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '閿?鍞?婚噾棰?',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '閿?鍞鍗曡鎯呰〃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sale_order_detail
-- ----------------------------

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
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛浼樻儬鍗峰叧鑱旇〃id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鐢ㄦ埛id',
  `coupon_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浼樻儬鍗穒d',
  `created_at` datetime NOT NULL COMMENT '浼樻儬鍗烽鍙栨椂闂?',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '鍐嶆棰嗗彇鐩稿悓鐨勪紭鎯犲嵎鏇存柊鏃堕棿',
  `used_at` datetime NULL DEFAULT NULL COMMENT '浣跨敤鏃堕棿',
  `status` enum('used','expired','claimed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'claimed' COMMENT '鐘舵??',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '鐢ㄦ埛浼樻儬鍗峰叧鑱旇〃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------

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
