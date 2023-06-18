/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : rouyi

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 18/06/2023 18:15:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='帮助表';

-- ----------------------------
-- Records of cms_help
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `help_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='帮助分类表';

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report` (
  `id` bigint DEFAULT NULL,
  `report_type` int DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_status` int DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户举报表';

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优选专区';

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
BEGIN;
INSERT INTO `cms_prefrence_area` (`id`, `name`, `sub_title`, `pic`, `sort`, `show_status`) VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` (`id`, `name`, `sub_title`, `pic`, `sort`, `show_status`) VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` (`id`, `name`, `sub_title`, `pic`, `sort`, `show_status`) VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` (`id`, `name`, `sub_title`, `pic`, `sort`, `show_status`) VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优选专区和产品关系表';

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES (24, 1, 23);
COMMIT;

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专题主图',
  `product_count` int DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `comment_count` int DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `show_status` int DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `forward_count` int DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专题表';

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (1, 1, 'polo衬衫的也时尚', NULL, NULL, NULL, '2018-11-11 13:26:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (2, 2, '大牌手机低价秒', NULL, NULL, NULL, '2018-11-12 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (3, 2, '晓龙845新品上市', NULL, NULL, NULL, '2018-11-13 13:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (4, 1, '夏天应该穿什么', NULL, NULL, NULL, '2018-11-01 13:27:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (5, 1, '夏季精选', NULL, NULL, NULL, '2018-11-06 13:27:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES (6, 2, '品牌手机降价', NULL, NULL, NULL, '2018-11-07 13:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
COMMIT;

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `subject_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专题分类表';

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject_category` (`id`, `name`, `icon`, `subject_count`, `show_status`, `sort`) VALUES (1, '服装专题', NULL, NULL, NULL, NULL);
INSERT INTO `cms_subject_category` (`id`, `name`, `icon`, `subject_count`, `show_status`, `sort`) VALUES (2, '手机专题', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专题商品关系表';

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (1, 1, 12);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (2, 1, 13);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (3, 1, 14);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (4, 1, 18);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (5, 1, 7);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (6, 2, 7);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (7, 1, 22);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (29, 1, 23);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (30, 4, 23);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (31, 5, 23);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (68, 2, 26);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (69, 3, 26);
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES (70, 6, 26);
COMMIT;

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int DEFAULT NULL COMMENT '参与人数',
  `attention_count` int DEFAULT NULL COMMENT '关注人数',
  `read_count` int DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题表';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `subject_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题分类表';

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `topic_id` bigint DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_sku_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (12, 26, 90, 1, 1, 3788.00, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (13, 27, 98, 1, 3, 2699.00, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (14, 28, 102, 1, 1, 649.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (15, 28, 103, 1, 1, 699.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (16, 29, 106, 1, 1, 5499.00, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (19, 36, 163, 1, 3, 100.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:51:59', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (20, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:54:23', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (21, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 16:49:53', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (22, 26, 110, 1, 3, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 15:34:24', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (23, 27, 98, 1, 7, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 15:35:43', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (24, 26, 110, 1, 4, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 16:58:17', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (25, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 16:58:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (26, 28, 102, 1, 4, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-04 16:58:26', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (27, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 16:58:29', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (28, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:07:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (29, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:07:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (30, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:08:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (31, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 17:09:56', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (32, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:13:50', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (33, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:16:15', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (34, 36, 164, 1, 1, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036002', 'windir', '2020-05-04 17:19:20', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (35, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:41:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (36, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 10:41:55', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (37, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:42:57', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (38, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:29:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (39, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:32:52', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (40, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:33:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (41, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:49:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (42, 26, 111, 1, 1, 3999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'windir', '2020-05-05 15:26:05', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (43, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-16 15:16:04', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (44, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-16 15:18:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (45, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:00:16', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (46, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 15:00:22', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (47, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:14:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (48, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:20:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (49, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:21:54', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (50, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 16:07:22', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (51, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 16:07:26', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (52, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:33:36', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (53, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 19:33:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (54, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:39:07', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (55, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:41:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (56, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 16:50:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (57, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 20:22:04', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (58, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-18 20:22:08', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (59, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 16:21:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (60, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 17:01:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (61, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:36:50', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (62, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:44:39', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (63, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-07 17:01:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (64, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-14 15:24:40', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (65, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 14:27:13', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (66, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-21 15:12:14', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (67, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:12:53', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (68, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:15:10', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (69, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-27 10:27:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (70, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2022-10-28 14:50:46', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (71, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-10-28 15:27:32', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (72, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-09 15:14:46', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (73, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-09 15:25:28', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (74, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-09 15:26:04', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (75, 45, 239, 1, 1, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:16:23', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (76, 45, 239, 1, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:18:36', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (77, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-10 15:19:36', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (78, 37, 201, 1, 2, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-10 15:19:44', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (79, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:37:40', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (80, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:12', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (81, 38, 213, 1, 3, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:22', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (82, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:07:23', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (83, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:13:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (84, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-11 16:15:05', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (85, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2022-11-11 16:21:05', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (86, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-16 10:22:47', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (87, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-16 10:22:51', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (88, 39, 217, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'windir', '2022-11-16 10:22:54', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (89, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-16 10:23:16', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (90, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:49:00', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (91, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'test', '2022-12-21 15:49:42', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (92, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:49:53', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (93, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:51:03', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (94, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:51:28', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (95, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 16:45:16', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (96, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:46:41', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (97, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:50:10', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (98, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-23 09:55:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (99, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 15:39:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (100, 26, 111, 1, 1, 3899.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'test', '2023-01-10 16:58:08', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` (`id`, `product_id`, `product_sku_id`, `member_id`, `quantity`, `price`, `product_pic`, `product_name`, `product_sub_title`, `product_sku_code`, `member_nickname`, `create_date`, `modify_date`, `delete_status`, `product_category_id`, `product_brand`, `product_sn`, `product_attr`) VALUES (101, 26, 110, 1, 1, 3699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 17:10:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
COMMIT;

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址名称',
  `send_status` int DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='公司收发货地址表';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
BEGIN;
INSERT INTO `oms_company_address` (`id`, `address_name`, `send_status`, `receive_status`, `name`, `phone`, `province`, `city`, `region`, `detail_address`) VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` (`id`, `address_name`, `send_status`, `receive_status`, `name`, `phone`, `province`, `city`, `region`, `detail_address`) VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` (`id`, `address_name`, `send_status`, `receive_status`, `name`, `phone`, `province`, `city`, `region`, `detail_address`) VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');
COMMIT;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint NOT NULL,
  `coupon_id` bigint DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动信息',
  `bill_type` int DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
BEGIN;
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 20.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', '111', 0, 0, NULL, NULL, NULL, NULL, NULL, '2019-11-09 16:50:28');
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, '2018-10-11 14:04:19', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 3, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', '2022-11-11 16:19:34', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 1, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '圆通快递', 'xx', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, 1000, NULL, '2018-10-16 14:42:17', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '顺丰快递', 'xxx', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, 1000, NULL, '2018-10-16 14:41:28', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', 0, 1, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31');
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (26, 1, 2, '201809140101000003', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (27, 1, NULL, '202002250100000001', '2020-02-25 15:59:20', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (28, 1, NULL, '202002250100000002', '2020-02-25 16:05:47', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (29, 1, NULL, '202002250100000003', '2020-02-25 16:07:58', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (30, 1, NULL, '202002250100000004', '2020-02-25 16:50:13', 'test', 240.00, 240.00, 20.00, 0.00, 0.00, 0.00, 10.00, 0, 1, 3, 0, '顺丰快递', '12333333', NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 1, 0, NULL, '2020-02-25 16:53:29', '2020-02-25 16:54:03', '2020-05-17 19:38:15', NULL, '2020-02-25 16:52:51');
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (31, 1, 26, '202005160100000001', '2020-05-16 15:16:54', 'test', 13623.00, 11842.40, 0.00, 1629.60, 1.00, 150.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 13623, 13623, '满减优惠：满5000.00元，减500.00元;打折优惠：满2件，打8.00折;满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (32, 1, NULL, '202005170100000001', '2020-05-17 15:00:38', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-05-17 15:33:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (33, 1, NULL, '202005170100000002', '2020-05-17 15:14:18', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (34, 1, NULL, '202005170100000003', '2020-05-17 15:20:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (35, 1, NULL, '202005170100000004', '2020-05-17 15:22:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '123', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-05-17 15:29:07', '2020-05-17 15:30:24', '2020-05-17 15:41:45', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (36, 1, NULL, '202005170100000005', '2020-05-17 16:59:26', 'test', 10275.00, 9775.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 10275, 10275, '满减优惠：满5000.00元，减500.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (37, 1, NULL, '202005170100000006', '2020-05-17 19:33:48', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', 'aadd', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-05-17 19:33:59', '2020-05-17 19:34:59', '2020-05-17 19:35:50', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (38, 1, NULL, '202005170100000007', '2020-05-17 19:39:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (39, 1, NULL, '202005170100000008', '2020-05-17 19:41:30', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', 'sdf', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 1, NULL, '2020-05-17 19:41:41', '2020-05-17 19:42:07', '2020-05-17 19:42:36', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (40, 1, NULL, '202005180100000001', '2020-05-18 16:50:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-05-18 16:50:29', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (41, 1, 26, '202005180100000002', '2020-05-18 20:22:24', 'test', 6487.00, 6037.00, 0.00, 300.00, 0.00, 150.00, 0.00, 1, 1, 3, 0, '顺丰快递', '12313', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 1, 0, NULL, '2020-05-18 20:22:29', '2020-05-18 20:23:03', '2020-05-18 20:23:20', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (42, 1, NULL, '202005230100000001', '2020-05-23 16:21:27', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 5398, 5398, '打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-05-23 16:21:30', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (43, 1, NULL, '202005230100000002', '2020-05-23 17:01:33', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 5398, 5398, '打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (44, 1, NULL, '202005240100000001', '2020-05-24 09:37:07', 'test', 7576.00, 7076.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 7576, 7576, '满减优惠：满5000.00元，减500.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (45, 1, 25, '202006070100000001', '2020-06-07 17:02:04', 'test', 10275.00, 9674.90, 0.00, 500.00, 0.00, 100.10, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 10275, 10275, '满减优惠：满5000.00元，减500.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-06-07 17:02:17', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (46, 1, 24, '202006210100000001', '2020-06-21 14:27:34', 'test', 9186.00, 7796.40, 0.00, 1379.60, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 9186, 9186, '满减优惠：满3000.00元，减300.00元;打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-06-21 14:27:38', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (47, 1, NULL, '202006210100000002', '2020-06-21 15:13:06', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', '123131', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 1, 0, NULL, '2020-06-21 15:13:12', '2020-06-21 15:13:44', '2020-06-21 15:13:58', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (48, 1, 26, '202006210100000003', '2020-06-21 15:15:18', 'test', 3788.00, 3338.00, 0.00, 300.00, 0.00, 150.00, 0.00, 2, 1, 3, 0, '圆通快递', '12313', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-06-21 15:15:20', '2020-06-21 15:15:48', '2020-06-21 15:15:58', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (49, 1, NULL, '202006270100000001', '2020-06-27 10:27:56', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-06-27 10:27:58', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (50, 1, NULL, '202210280100000001', '2022-10-28 14:50:58', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2022-10-28 14:51:02', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (51, 1, NULL, '202210280100000002', '2022-10-28 15:27:41', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-10-28 15:27:44', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (52, 1, 30, '202211090100000001', '2022-11-09 15:14:58', 'test', 2999.00, 2799.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1233', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-11-09 15:15:00', '2022-11-09 15:16:12', '2022-11-09 15:16:31', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (53, 1, 27, '202211090100000002', '2022-11-09 15:25:38', 'test', 3599.00, 3589.00, 0.00, 0.00, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-09 15:25:41', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (54, 1, 29, '202211090100000003', '2022-11-09 15:26:11', 'test', 5999.00, 5399.00, 0.00, 0.00, 0.00, 600.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-09 15:26:13', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (55, 1, NULL, '202211100100000001', '2022-11-10 16:57:59', 'test', 11998.00, 11998.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (56, 1, 28, '202211110100000001', '2022-11-11 16:12:42', 'test', 2999.00, 2899.00, 0.00, 0.00, 0.00, 100.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:12:48', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (57, 1, NULL, '202211110100000002', '2022-11-11 16:13:14', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:13:21', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (58, 1, NULL, '202211110100000003', '2022-11-11 16:15:08', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:17:46', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (59, 1, NULL, '202211110100000004', '2022-11-11 16:21:12', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (60, 1, NULL, '202211160100000001', '2022-11-16 10:36:08', 'test', 11097.00, 11097.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1234555', 15, 0, 0, '无优惠;无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-11-16 10:37:25', '2022-11-16 10:42:50', '2022-11-16 10:44:40', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (61, 1, NULL, '202212210100000001', '2022-12-21 15:49:08', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (62, 1, NULL, '202212210100000002', '2022-12-21 15:49:57', 'test', 8098.00, 8098.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', 'SDFERR7845', 15, 0, 0, '无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-12-21 15:50:00', '2022-12-21 15:50:23', '2022-12-21 15:50:33', NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (63, 1, NULL, '202212210100000003', '2022-12-21 15:51:09', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 2, 0, '顺丰快递', '112', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-12-21 15:51:11', '2023-01-10 10:14:12', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (64, 1, NULL, '202212210100000004', '2022-12-21 15:51:35', 'test', 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (65, 1, 28, '202212210100000005', '2022-12-21 16:53:07', 'test', 5098.00, 4788.00, 0.00, 200.00, 10.00, 100.00, 0.00, 2, 1, 2, 0, '圆通快递', '115', 15, 0, 0, '满减优惠：满2000.00元，减200.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-12-21 16:53:58', '2023-01-10 10:14:12', NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (66, 1, NULL, '202301100100000001', '2023-01-10 15:34:59', 'test', 5998.00, 5798.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '满减优惠：满2000.00元，减200.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (67, 1, NULL, '202301100100000002', '2023-01-10 15:39:07', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2023-01-10 15:39:16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (68, 1, NULL, '202301100100000003', '2023-01-10 16:58:19', 'test', 3999.00, 3899.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2023-01-10 16:58:21', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int DEFAULT '0',
  `gift_growth` int DEFAULT '0',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单中所包含的商品';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (46, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (47, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (48, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (49, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (50, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (51, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (52, 30, '202002250100000004', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (53, 31, '202005160100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 75.00, 0.28, 3462.72, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (54, 31, '202005160100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.20, 2159.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (55, 31, '202005160100000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.05, 598.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (56, 32, '202005170100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (57, 32, '202005170100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (58, 33, '202005170100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (59, 34, '202005170100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (60, 35, '202005170100000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (61, 36, '202005170100000005', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (62, 36, '202005170100000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (63, 37, '202005170100000006', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (64, 37, '202005170100000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (65, 38, '202005170100000007', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (66, 39, '202005170100000008', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (67, 40, '202005180100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (68, 41, '202005180100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (69, 41, '202005180100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (70, 42, '202005230100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (71, 43, '202005230100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (72, 44, '202005240100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (73, 45, '202006070100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 36.90, 0.00, 3501.10, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (74, 45, '202006070100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 26.30, 0.00, 2672.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (75, 46, '202006210100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 4.12, 0.00, 3483.88, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (76, 46, '202006210100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 2.94, 0.00, 2156.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (77, 47, '202006210100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (78, 47, '202006210100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (79, 48, '202006210100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (80, 49, '202006270100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (81, 50, '202210280100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (82, 51, '202210280100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (83, 52, '202211090100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 200.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (84, 53, '202211090100000002', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 10.00, 0.00, 3589.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (85, 54, '202211090100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 600.00, 0.00, 5399.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (86, 55, '202211100100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 2, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (87, 56, '202211110100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 100.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (88, 57, '202211110100000002', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (89, 58, '202211110100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (90, 59, '202211110100000004', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (91, 60, '202211160100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (92, 60, '202211160100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (93, 60, '202211160100000001', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (94, 61, '202212210100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (95, 62, '202212210100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (96, 62, '202212210100000002', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (97, 63, '202212210100000003', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (98, 64, '202212210100000004', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (99, 65, '202212210100000005', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 58.80, 5.88, 2734.32, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (100, 65, '202212210100000005', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 41.20, 4.12, 2053.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (101, 66, '202301100100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 2, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 100.00, 0.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (102, 67, '202301100100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES (103, 68, '202301100100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3999.00, 1, 111, '201806070026002', 19, '单品促销', 100.00, 0.00, 0.00, 3899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (23, 12, '后台管理员', '2019-11-09 16:50:28', 4, '修改备注信息：111');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (24, 30, '后台管理员', '2020-02-25 16:52:37', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (25, 30, '后台管理员', '2020-02-25 16:52:51', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (26, 30, '后台管理员', '2020-02-25 16:54:03', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (27, 35, '后台管理员', '2020-05-17 15:30:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (28, 37, '后台管理员', '2020-05-17 19:35:00', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (29, 39, '后台管理员', '2020-05-17 19:42:08', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (30, 41, '后台管理员', '2020-05-18 20:23:04', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (31, 47, '后台管理员', '2020-06-21 15:13:44', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (32, 48, '后台管理员', '2020-06-21 15:15:49', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (33, 52, '后台管理员', '2022-11-09 15:16:13', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (34, 60, '后台管理员', '2022-11-16 10:42:50', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (35, 62, '后台管理员', '2022-12-21 15:50:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (36, 63, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES (37, 65, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货人电话',
  `status` int DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (3, 12, 1, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 0.00, '大梨', '18000000000', 2, '2022-11-11 10:16:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '111', 'admin', 'admin', '2022-11-11 10:16:26', NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货类型',
  `sort` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='退货原因表';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (1, '质量问题', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_setting` (`id`, `flash_order_overtime`, `normal_order_overtime`, `confirm_overtime`, `finish_overtime`, `comment_overtime`) VALUES (1, 60, 120, 15, 7, 7);
COMMIT;

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic_count` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='相册表';

-- ----------------------------
-- Records of pms_album
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `album_id` bigint DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='画册图片表';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '首字母',
  `sort` int DEFAULT NULL,
  `factory_status` int DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int DEFAULT NULL,
  `product_count` int DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
BEGIN;
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5b07ca8aN4e127d2f.jpg', 'http://img13.360buyimg.com/cms/jfs/t1/121860/35/2430/187800/5ec4e294E22f3ffcc/1e233b65b94ba192.jpg', '万和成立于1993年8月，总部位于广东顺德国家级高新技术开发区内，是国内生产规模最大的燃气具专业制造企业，也是中国燃气具发展战略的首倡者和推动者、中国五金制品协会燃气用具分会第三届理事长单位。');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/57201b47N7bf15715.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '三星集团（英文：SAMSUNG、韩文：삼성）是韩国最大的跨国企业集团，三星集团包括众多的国际下属企业，旗下子公司有：三星电子、三星物产、三星人寿保险等，业务涉及电子、金融、机械、化学等众多领域。');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5abf6f26N31658aa2.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '荣耀品牌成立于2013年,是华为旗下手机双品牌之一。荣耀以“创新、品质、服务”为核心战略,为全球年轻人提供潮酷的全场景智能化体验,打造年轻人向往的先锋文化和潮流生活方式');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5565f5a2N0b8169ae.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '小米公司正式成立于2010年4月，是一家专注于高端智能手机、互联网电视自主研发的创新型科技企业。主要由前谷歌、微软、摩托、金山等知名公司的顶尖人才组建。');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', 'OPPO于2008年推出第一款“笑脸手机”，由此开启探索和引领至美科技之旅。今天，OPPO凭借以Find和R系列手机为核心的智能终端产品，以及OPPO+等互联网服务，让全球消费者尽享至美科技。');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/qipilang.png', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a5c69b9N5d6c5696.jpg', 'http://img10.360buyimg.com/cms/jfs/t1/133148/4/1605/470028/5edaf5ccEd7a687a9/e0a007631361ff75.jpg', '“海澜之家”（英文缩写：HLA）是海澜之家股份有限公司旗下的服装品牌，总部位于中国江苏省无锡市江阴市，主要采用连锁零售的模式，销售男性服装、配饰与相关产品。');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/49b30bb0377030d1.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '苹果公司(Apple Inc. )是美国的一家高科技公司。 由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩(Ron Wayne)等人于1976年4月1日创立,并命名为美国苹果电脑公司(Apple Computer Inc. ),2007年1月9日更名为苹果公司,总部位于加利福尼亚州的...');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (58, 'NIKE', 'N', 0, 1, 0, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES (59, '测试品牌', 'C', 0, 0, 0, NULL, NULL, 'http://localhost:9000/mall/20220609/Snipaste_2022-06-08_14-35-53.png', 'http://localhost:9000/mall/20220609/biji_05.jpg', '12345');
COMMIT;

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `star` int DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品评价表';

-- ----------------------------
-- Records of pms_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品评价回复表';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `charge_type` int DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='运费模版';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `member_level_id` bigint DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品会员价格表';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
BEGIN;
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (246, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (247, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (248, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (249, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (250, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (251, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (258, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (259, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (260, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (261, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (262, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (263, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (264, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (265, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (266, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (270, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (271, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (272, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (273, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (274, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (275, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (285, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (286, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (287, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (294, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (295, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (296, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (297, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (298, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (299, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (315, 37, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (316, 37, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (317, 37, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (381, 38, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (382, 38, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (383, 38, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (384, 39, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (385, 39, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (386, 39, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (387, 41, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (388, 41, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (389, 41, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (390, 42, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (391, 42, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (392, 42, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (393, 43, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (394, 43, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (395, 43, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (396, 44, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (397, 44, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (398, 44, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (399, 45, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (400, 45, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (401, 45, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (402, 40, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (403, 40, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (404, 40, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (423, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (424, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES (425, 26, 3, NULL, '钻石会员');
COMMIT;

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  `feight_template_id` bigint DEFAULT NULL,
  `product_attribute_category_id` bigint DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int DEFAULT NULL COMMENT '排序',
  `sale` int DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int DEFAULT NULL COMMENT '库存',
  `low_stock` int DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品分类名称',
  `spu_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品信息';

-- ----------------------------
-- Records of pms_product
-- ----------------------------
BEGIN;
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机数码', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 100, 3788.00, 3659.00, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/81293/35/5822/369414/5d3fe77cE619c5487/6e775a52850feea5.jpg!q70.dpg.webp\" alt=\"\" width=\"750\" height=\"776\" /></p>\n<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/45300/25/11592/3658871/5d85ef66E92a8a911/083e47d8f662c582.jpg!q70.dpg.webp\" alt=\"\" width=\"596\" height=\"16383\" /></p>', '2023-01-10 15:49:38', '2023-01-31 00:00:00', 0, 1, '华为', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 99, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '1', '', '', '', '', '', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', NULL, NULL, 0, 3, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 98, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '<div><img src=\"//img12.360buyimg.com/imgzone/jfs/t1/67362/12/14546/708984/5dc28512Eefdd817d/c82503af0da6c038.gif\" /><img src=\"//img13.360buyimg.com/imgzone/jfs/t1/61488/17/14551/995918/5dc28512E821c228d/41e52005ea5b1f36.gif\" /><img src=\"//img14.360buyimg.com/imgzone/jfs/t1/72961/36/14769/305883/5dc28512E65d77261/3df6be29e3d489d1.gif\" />\n<p>&nbsp;</p>\n</div>', NULL, NULL, 0, 4, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 1, 1, 0, 0, 97, 5499.00, 4799.00, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '1,2,3', '', '', '', '', '', '', '<div><img src=\"//img10.360buyimg.com/cms/jfs/t1/20020/38/9725/228440/5c7f9208Eeaf4bf87/13a713066f71791d.jpg!q70.dpg.webp\" /> <img src=\"//img12.360buyimg.com/cms/jfs/t1/12128/39/9607/265349/5c7f9209Ecff29b88/08620ba570705634.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/22731/40/9578/345163/5c7f9209E9ba056e5/a8a557060b84447e.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/29506/38/9439/299492/5c7f9209E0e51eb29/15dedd95416f3c68.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/26766/28/9574/257101/5c7f9209Eaca1b317/c7caa047b1566cf1.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/11059/8/10473/286531/5c7f9208E05da0120/9034ad8799ad9553.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/25641/2/9557/268826/5c7f9208Efbf0dc50/399580629e05e733.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/28964/25/9527/305902/5c7f9208E275ffb9c/8464934d67e69b7a.jpg!q70.dpg.webp\" /></div>', '2020-05-04 15:12:54', '2020-05-30 00:00:00', 0, 1, '苹果', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (32, 50, 8, 0, 1, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (33, 6, 35, 0, 12, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '电视', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (34, 6, 35, 0, 12, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '电视', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (35, 58, 29, 0, 11, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (36, 58, 29, 0, 11, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (37, 51, 19, 0, 3, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', '100038005189', 0, 1, 0, 0, 0, 200, 0, 5999.00, NULL, 0, 0, 0, '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '', 5999.00, 1000, 0, '', 208.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/58071/39/19839/119559/63190110Edac0cea7/b62a84f1b8775fef.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img20.360buyimg.com/cms/jfs/t1/138903/36/29400/86115/63190110E0a98c819/d2efbef39eeb2995.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img30.360buyimg.com/cms/jfs/t1/176347/20/28995/115695/63190110Ef5d766f9/aee3d2d866522f66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/120515/39/28721/142961/63190110Eec31e31a/3486d6a065a18ddc.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/30161/12/17674/81508/63190110E1385cf61/f05a2a43f4d304ff.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/100037/16/31071/62177/6319010fE871efe01/b01a6f981c268e38.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/90843/33/25852/74752/63190110E373559f4/74b6b52a3fb08c66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/181914/22/28400/126094/63190110Edefb838c/802a16e758be2b1d.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, '苹果', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (38, 51, 53, 0, 3, 'Apple iPad 10.9英寸平板电脑 2022年款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', '100044025833', 0, 1, 0, 0, 0, 0, 0, 3599.00, NULL, 0, 0, 0, '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '', 3599.00, 1000, 0, '', 0.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img12.360buyimg.com/cms/jfs/t1/75040/28/21026/295081/634ed154E981e4d10/2ceef91d6f2b2273.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/191028/1/28802/401291/634ed15eEb234dc40/5ab89f83531e1023.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/32758/24/18599/330590/634ed15eEc3db173c/c52953dc8008a576.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, '苹果', '平板电脑', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (39, 6, 54, 0, 13, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '100023207945', 0, 1, 0, 1, 0, 0, 0, 5599.00, NULL, 0, 0, 0, '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '', 5599.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', '', '', '', '<div class=\"ssd-module-mobile-wrap\">\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\"><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_05.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_06.png\" /></div>\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\">&nbsp;</div>\n<div class=\"ssd-module M16534569204241\" data-id=\"M16534569204241\">&nbsp;</div>\n<div class=\"ssd-module M16667778416884\" data-id=\"M16667778416884\">\n<div class=\"ssd-widget-text W16667778440496\">&nbsp;</div>\n</div>\n<div class=\"ssd-module M165303211067557\" data-id=\"M165303211067557\">&nbsp;</div>\n<div class=\"ssd-module M16530320459861\" data-id=\"M16530320459861\">&nbsp;</div>\n<div class=\"ssd-module M16530320460062\" data-id=\"M16530320460062\">&nbsp;</div>\n<div class=\"ssd-module M16530320460153\" data-id=\"M16530320460153\">&nbsp;</div>\n<div class=\"ssd-module M16530320460366\" data-id=\"M16530320460366\">&nbsp;</div>\n<div class=\"ssd-module M16530320460477\" data-id=\"M16530320460477\">&nbsp;</div>\n<div class=\"ssd-module M16530320460578\" data-id=\"M16530320460578\">&nbsp;</div>\n<div class=\"ssd-module M16530320460699\" data-id=\"M16530320460699\">&nbsp;</div>\n<div class=\"ssd-module M165303204608110\" data-id=\"M165303204608110\">&nbsp;</div>\n<div class=\"ssd-module M165303204609511\" data-id=\"M165303204609511\">&nbsp;</div>\n<div class=\"ssd-module M165303204611213\" data-id=\"M165303204611213\">&nbsp;</div>\n<div class=\"ssd-module M165303204612714\" data-id=\"M165303204612714\">&nbsp;</div>\n<div class=\"ssd-module M165303204614115\" data-id=\"M165303204614115\">&nbsp;</div>\n<div class=\"ssd-module M165303204615516\" data-id=\"M165303204615516\">&nbsp;</div>\n<div class=\"ssd-module M165303204617417\" data-id=\"M165303204617417\">&nbsp;</div>\n<div class=\"ssd-module M165303204618818\" data-id=\"M165303204618818\">&nbsp;</div>\n<div class=\"ssd-module M165303204620219\" data-id=\"M165303204620219\">&nbsp;</div>\n<div class=\"ssd-module M165303204621620\" data-id=\"M165303204621620\">&nbsp;</div>\n<div class=\"ssd-module M165303204622921\" data-id=\"M165303204622921\">&nbsp;</div>\n<div class=\"ssd-module M165303204624522\" data-id=\"M165303204624522\">&nbsp;</div>\n<div class=\"ssd-module M165303204626024\" data-id=\"M165303204626024\">&nbsp;</div>\n<div class=\"ssd-module M165303204627525\" data-id=\"M165303204627525\">&nbsp;</div>\n<div class=\"ssd-module M165303204629127\" data-id=\"M165303204629127\">&nbsp;</div>\n<div class=\"ssd-module M165303204632330\" data-id=\"M165303204632330\">&nbsp;</div>\n<div class=\"ssd-module M165303204634031\" data-id=\"M165303204634031\">&nbsp;</div>\n<div class=\"ssd-module M165303204635832\" data-id=\"M165303204635832\">&nbsp;</div>\n<div class=\"ssd-module M165303204637533\" data-id=\"M165303204637533\">&nbsp;</div>\n<div class=\"ssd-module M165303204639334\" data-id=\"M165303204639334\">&nbsp;</div>\n<div class=\"ssd-module M165303204642235\" data-id=\"M165303204642235\">&nbsp;</div>\n<div class=\"ssd-module M165303204647936\" data-id=\"M165303204647936\">&nbsp;</div>\n<div class=\"ssd-module M165303204651037\" data-id=\"M165303204651037\">&nbsp;</div>\n<div class=\"ssd-module M165303204653838\" data-id=\"M165303204653838\">&nbsp;</div>\n<div class=\"ssd-module M165303204656239\" data-id=\"M165303204656239\">&nbsp;</div>\n<div class=\"ssd-module M165303204659141\" data-id=\"M165303204659141\">&nbsp;</div>\n<div class=\"ssd-module M165303204661943\" data-id=\"M165303204661943\">&nbsp;</div>\n<div class=\"ssd-module M165303204665844\" data-id=\"M165303204665844\">&nbsp;</div>\n<div class=\"ssd-module M165303204668045\" data-id=\"M165303204668045\">&nbsp;</div>\n<div class=\"ssd-module M165303204670146\" data-id=\"M165303204670146\">&nbsp;</div>\n<div class=\"ssd-module M165303204672147\" data-id=\"M165303204672147\">&nbsp;</div>\n<div class=\"ssd-module M165303204674348\" data-id=\"M165303204674348\">&nbsp;</div>\n<div class=\"ssd-module M165303204676749\" data-id=\"M165303204676749\">&nbsp;</div>\n<div class=\"ssd-module M165303204681352\" data-id=\"M165303204681352\">&nbsp;</div>\n<div class=\"ssd-module M165303204683553\" data-id=\"M165303204683553\">&nbsp;</div>\n<div class=\"ssd-module M165303204685855\" data-id=\"M165303204685855\">&nbsp;</div>\n<div class=\"ssd-module M165303204688356\" data-id=\"M165303204688356\">&nbsp;</div>\n</div>', NULL, NULL, 0, 0, '小米', '笔记本', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (40, 6, 19, 0, 3, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '100027789721', 0, 1, 0, 1, 0, 0, 0, 2999.00, NULL, 0, 0, 0, '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '', 2999.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_05.png\" /></p>', NULL, NULL, 0, 4, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (41, 6, 19, 0, 3, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', '100035246702', 0, 1, 0, 0, 0, 0, 0, 2099.00, NULL, 0, 0, 0, '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '', 2099.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (42, 3, 19, 0, 3, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', '100035295081', 0, 1, 0, 0, 0, 0, 0, 4999.00, NULL, 0, 0, 0, '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '', 4999.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '华为', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (43, 1, 39, 0, 14, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', '10044060351752', 0, 1, 0, 0, 0, 0, 0, 1799.00, NULL, 0, 0, 0, '【家电11.11享低价，抢到手价不高于1199】【发布种草秀享好礼！同价11.11买贵补差】爆款超一级能效零冷水】 ', '', 1799.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_16L_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '万和', '厨卫大电', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (44, 2, 55, 0, 15, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '100018768480', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '', 369.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_03.png\" /></p>', NULL, NULL, 0, 0, '三星', '硬盘', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (45, 21, 19, 0, 3, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', '10052147850350', 0, 1, 0, 0, 0, 0, 0, 2299.00, 999.00, 0, 0, 0, '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '', 2299.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_05.png\" /></p>', '2022-11-09 16:15:50', '2022-11-25 00:00:00', 0, 4, 'OPPO', '手机通讯', NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (64, NULL, NULL, NULL, NULL, 'dadad', NULL, '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (67, NULL, NULL, NULL, NULL, 'dadad', NULL, '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (68, NULL, NULL, NULL, NULL, 'dadad', NULL, '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (69, NULL, NULL, NULL, NULL, 'adad', NULL, 'adadad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (82, NULL, 7, NULL, NULL, 'dadad', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (83, NULL, 7, NULL, NULL, 'dadad', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (84, NULL, 7, NULL, NULL, 'dadad', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (85, NULL, 7, NULL, NULL, 'dadd', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (86, NULL, 7, NULL, NULL, 'dadd', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`, `spu_id`) VALUES (87, NULL, 7, NULL, NULL, 'dadd', NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `select_type` int DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int NOT NULL DEFAULT '0' COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品属性参数表';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G,256G,512G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (46, 3, '网络', 0, 1, '3G,4G,5G,WLAN', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (49, 11, '颜色', 0, 1, '红色,蓝色,绿色', 0, 1, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (50, 11, '尺寸', 0, 1, '38,39,40', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (51, 11, '风格', 0, 1, '夏季,秋季', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (52, 12, '尺寸', 0, 1, '50英寸,65英寸,70英寸', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (53, 12, '内存', 0, 1, '8G,16G,32G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (54, 12, '商品编号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (55, 12, '商品毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (56, 12, '商品产地', 0, 1, '中国大陆,其他', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (57, 12, '电视类型', 0, 1, '大屏,教育电视,4K超清', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (58, 13, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (59, 13, '版本', 0, 1, 'R7 16G 512,R5 16G 512,I5 16G 512,I7 16G 512', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (60, 13, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (61, 13, '屏幕分辨率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (62, 13, 'CPU型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (63, 14, '系列', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (64, 14, '上市时间', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (65, 14, '毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (66, 14, '额定功率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (67, 15, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (68, 15, '版本', 0, 1, '512GB,1TB', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (69, 15, '系列', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (70, 15, '型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (71, 15, '闪存类型', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (72, 15, '顺序读速', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES (73, 15, '顺序写入', 0, 0, '', 0, 0, 0, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute_count` int DEFAULT '0' COMMENT '属性数量',
  `param_count` int DEFAULT '0' COMMENT '参数数量',
  `attribute_id` bigint DEFAULT NULL COMMENT '属性id',
  `category_id` bigint DEFAULT NULL COMMENT '类别id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品分类参数信息表';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (16, NULL, 0, 0, 1, 1);
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (17, NULL, 0, 0, 7, 1);
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (18, NULL, 0, 0, 7, 2);
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (19, NULL, 0, 0, 7, 3);
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (20, NULL, 0, 0, 7, 4);
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`, `attribute_id`, `category_id`) VALUES (21, NULL, 0, 0, 7, 5);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_attribute_id` bigint DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='存储产品参数信息的表';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (243, 30, 7, '蓝色,白色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (244, 30, 24, 'HNTBJ2E042A');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (245, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (246, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (247, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (248, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (249, 31, 7, '浅灰色,深灰色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (250, 31, 24, 'HNTBJ2E080A');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (251, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (252, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (253, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (254, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (255, 32, 7, '黑色,白色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (256, 32, 24, 'HNTBJ2E153A');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (257, 32, 25, '夏季');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (258, 32, 37, '青年');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (259, 32, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (260, 32, 39, '短袖');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (265, 33, 54, '4609652');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (266, 33, 55, '28.6kg');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (267, 33, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (268, 33, 57, '大屏');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (269, 34, 54, '4609660');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (270, 34, 55, '30.8kg');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (271, 34, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (272, 34, 57, '4K超清');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (288, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (289, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (290, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (291, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (292, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (303, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (304, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (305, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (306, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (307, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (308, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (309, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (310, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (311, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (312, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (338, 37, 43, '午夜色,星光色,紫色,蓝色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (339, 37, 45, '6.1英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (340, 37, 46, '5G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (341, 37, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (342, 37, 48, '3000毫安');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (443, 38, 43, '银色,蓝色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (444, 38, 45, '10.9英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (445, 38, 46, 'WLAN');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (446, 38, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (447, 38, 48, '6000毫安');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (448, 39, 58, '新小米Pro 14英寸 2.8K屏,新Redmi Pro 15英寸 3.2K屏');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (449, 39, 60, '15.6英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (450, 39, 61, '3200*2000');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (451, 39, 62, 'R5 6600H');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (452, 41, 43, '墨羽,银迹');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (453, 41, 45, '6.67英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (454, 41, 46, '5G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (455, 41, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (456, 41, 48, '5500mAh');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (457, 42, 43, '曜金黑,冰霜银');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (458, 42, 45, '6.7英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (459, 42, 46, '5G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (460, 42, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (461, 42, 48, '4460mAh');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (462, 43, 63, 'JSQ25-565W13【13升】【恒温旗舰款】,JSQ30-565W16【16升】【恒温旗舰款】');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (463, 43, 64, '2021-05');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (464, 43, 65, '15.5kg');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (465, 43, 66, '30w');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (466, 44, 67, '新品980｜NVMe PCIe3.0*4,980 PRO｜NVMe PCIe 4.0');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (467, 44, 69, '980');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (468, 44, 70, 'MZ-V8V500BW');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (469, 44, 71, 'TLC');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (470, 44, 72, '3100MB/s');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (471, 44, 73, '2600MB/s');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (472, 45, 43, '鸢尾紫,晴空蓝');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (473, 45, 45, '6.43英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (474, 45, 46, '5G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (475, 45, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (476, 45, 48, '4500mAh');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (477, 40, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (478, 40, 45, '6.73英寸');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (479, 40, 46, '5G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (480, 40, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (481, 40, 48, '5160mAh');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (512, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (513, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (514, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (515, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES (516, 26, 48, '3000');
COMMIT;

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nav_status` int DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (1, 0, '服装2', 0, 100, '件', 1, 1, 1, NULL, '服装', '服装分类');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, NULL, '手机数码', '手机数码');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, NULL, '家用电器', '家用电器');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (7, 1, '外套1', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac4780cN6087feb5.jpg', '外套', '外套');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47ffaN8a7b2e14.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47845N7374a31d.jpg', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47841Nff658599.jpg', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48007Nb30b2118.jpg', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (19, 2, '手机通讯', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48d27N3f5bb821.jpg', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (30, 2, '手机配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48672N11cf61fe.jpg', '手机配件', '手机配件');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (31, 2, '摄影摄像', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1679f2Nc2f659b6.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (32, 2, '影音娱乐', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a167859N01d8198b.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (33, 2, '数码配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1676e9N1ba70a81.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (34, 2, '智能设备', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (35, 3, '电视', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f71eN25360979.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (36, 3, '空调', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6f6Ndfe746aa.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (37, 3, '洗衣机', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6eaN9ec936de.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (38, 3, '冰箱', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6c5Ne56d7e26.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (39, 3, '厨卫大电', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f369N6a55ff3f.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (43, 4, '厨房卫浴', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb12cN5ab932bb.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (44, 4, '灯饰照明', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb115Na5705672.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (45, 4, '五金工具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28e743Nf6d99998.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (46, 4, '卧室家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb096N6326e0bd.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (47, 4, '客厅家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb080N38c2e7b7.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (48, 5, '全新整车', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/ebe31b9cc535e122.png', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (49, 5, '车载电器', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8d2N53bbd2ba.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (50, 5, '维修保养', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8baNbe801af8.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (51, 5, '汽车装饰', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28ae20N34461e66.jpg', '', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (52, 0, '电脑办公', 0, 0, '件', 1, 1, 1, '', '电脑办公', '电脑办公');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (53, 52, '平板电脑', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/pad_category_01.jpg', '平板电脑', '平板电脑');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (54, 52, '笔记本', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/computer_category_01.jpg', '笔记本', '笔记本');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (55, 52, '硬盘', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/ssd_category_01.jpg', '硬盘', '');
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (56, 1, 'daad', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES (59, 1, 'dadad11a', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint DEFAULT NULL,
  `product_attribute_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='已废弃：产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES (10, 25, 25);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品满减表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (78, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (79, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (83, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (84, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (85, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (87, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (88, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (93, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (96, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (97, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (98, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (104, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (126, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (127, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (128, 41, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (129, 42, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (130, 43, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (131, 44, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (132, 45, 2000.00, 100.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (133, 40, 2000.00, 200.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (146, 26, 3000.00, 300.00);
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES (147, 26, 5000.00, 500.00);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `count` int DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品阶梯价格表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (83, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (84, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (88, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (89, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (90, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (92, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (93, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (99, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (100, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (103, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (104, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (110, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (133, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (134, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (135, 41, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (136, 42, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (137, 43, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (138, 44, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (139, 45, 1, 0.70, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (140, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES (147, 26, 0, 0.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int DEFAULT NULL,
  `use_point_limit_old` int DEFAULT NULL,
  `use_point_limit_new` int DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核人',
  `status` int DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品审核记录';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_vertify_record` (`id`, `product_id`, `create_time`, `vertify_man`, `status`, `detail`) VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` (`id`, `product_id`, `create_time`, `vertify_man`, `status`, `detail`) VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_attribute_value`;
CREATE TABLE `pms_sku_attribute_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku_id` bigint DEFAULT NULL,
  `attribute_id` bigint DEFAULT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='sku的参数信息表';

-- ----------------------------
-- Records of pms_sku_attribute_value
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (98, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (99, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (100, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (101, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (102, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (103, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (104, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (105, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (106, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (107, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (108, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (109, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (110, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (111, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (112, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (113, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (163, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (164, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (165, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (166, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (167, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (168, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (169, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (170, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (171, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (172, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (173, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (174, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (175, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (176, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (177, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (178, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (179, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (180, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (181, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (182, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (183, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (184, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (185, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (186, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (187, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (188, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (189, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (190, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (191, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (192, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (193, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (194, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (195, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (196, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (197, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (198, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (199, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (200, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (201, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (202, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (203, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (204, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (205, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (206, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (207, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (208, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (209, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (210, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (211, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (212, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (213, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (214, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (215, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (216, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (217, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (218, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (219, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (220, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (221, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (222, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (223, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (224, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (225, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (226, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (227, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (228, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (229, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (230, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (231, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (232, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (233, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (234, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (235, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (236, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (237, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (238, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (239, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (240, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (241, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (242, NULL, NULL, NULL);
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (243, 267, 1, 'M');
INSERT INTO `pms_sku_attribute_value` (`id`, `sku_id`, `attribute_id`, `attribute_value`) VALUES (244, 267, 7, '黑色');
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT '0' COMMENT '库存',
  `low_stock` int DEFAULT NULL COMMENT '预警库存',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '展示图片',
  `sale` int DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int DEFAULT '0' COMMENT '锁定库存',
  `sp_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性，json格式',
  `verify_status` varchar(255) DEFAULT NULL COMMENT '审核状态0未审核 1审核通过 2审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='sku的库存';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (98, 27, '201808270027001', 2699.00, 86, NULL, NULL, NULL, NULL, -24, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (99, 27, '201808270027002', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (100, 27, '201808270027003', 2699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (101, 27, '201808270027004', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (102, 28, '201808270028001', 649.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (103, 28, '201808270028002', 699.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (104, 28, '201808270028003', 649.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (105, 28, '201808270028004', 699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (106, 29, '201808270029001', 5499.00, 99, NULL, NULL, NULL, 4999.00, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, NULL, NULL, 4999.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (110, 26, '201806070026001', 3788.00, 487, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (111, 26, '201806070026002', 3999.00, 499, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (112, 26, '201806070026003', 3788.00, 500, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (113, 26, '201806070026004', 3999.00, 500, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (163, 36, '202002210036001', 100.00, 100, 25, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (164, 36, '202002210036002', 120.00, 98, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (165, 36, '202002210036003', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (166, 36, '202002210036004', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (167, 36, '202002210036005', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (168, 36, '202002210036006', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (169, 36, '202002210036007', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (170, 36, '202002210036008', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (171, 35, '202002250035001', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (172, 35, '202002250035002', 240.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (173, 35, '202002250035003', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (174, 35, '202002250035004', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (175, 35, '202002250035005', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (176, 35, '202002250035006', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (177, 35, '202002250035007', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (178, 35, '202002250035008', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (179, 30, '202004190030001', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (180, 30, '202004190030002', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (181, 30, '202004190030003', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (182, 30, '202004190030004', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (183, 30, '202004190030005', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (184, 30, '202004190030006', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (185, 31, '202004190031001', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (186, 31, '202004190031002', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (187, 31, '202004190031003', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (188, 31, '202004190031004', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (189, 32, '202004190032001', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (190, 32, '202004190032002', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (191, 32, '202004190032003', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (192, 32, '202004190032004', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (193, 33, '202004190033001', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (194, 33, '202004190033002', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (195, 33, '202004190033003', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (196, 33, '202004190033004', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (197, 34, '202004190034001', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (198, 34, '202004190034002', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (199, 34, '202004190034003', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (200, 34, '202004190034004', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (201, 37, '202210280037001', 5999.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (202, 37, '202210280037002', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (203, 37, '202210280037003', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"512G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (204, 37, '202210280037004', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (205, 37, '202210280037005', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (206, 37, '202210280037006', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"512G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (207, 37, '202210280037007', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (208, 37, '202210280037008', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (209, 37, '202210280037009', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"512G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (210, 37, '202210280037010', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (211, 37, '202210280037011', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (212, 37, '202210280037012', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"512G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (213, 38, '202210280038001', 3599.00, 199, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (214, 38, '202210280038002', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (215, 38, '202210280038003', 3599.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (216, 38, '202210280038004', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (217, 39, '202210280039001', 5999.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (218, 39, '202210280039002', 5599.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (219, 39, '202210280039003', 5499.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (220, 39, '202210280039004', 4999.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (221, 40, '202211040040001', 2999.00, 94, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (222, 40, '202211040040002', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (223, 40, '202211040040003', 2999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (224, 40, '202211040040004', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (225, 41, '202211040041001', 2099.00, 197, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (226, 41, '202211040041002', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (227, 41, '202211040041003', 2099.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (228, 41, '202211040041004', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (229, 42, '202211040042001', 4999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (230, 42, '202211040042002', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (231, 42, '202211040042003', 4999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (232, 42, '202211040042004', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (233, 43, '202211040043001', 1649.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"系列\",\"value\":\"JSQ25-565W13【13升】【恒温旗舰款】\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (234, 43, '202211040043002', 1799.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"系列\",\"value\":\"JSQ30-565W16【16升】【恒温旗舰款】\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (235, 44, '202211080044001', 369.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (236, 44, '202211080044002', 649.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"1TB\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (237, 44, '202211080044003', 549.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"512GB\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (238, 44, '202211080044004', 899.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"1TB\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (239, 45, '202211080045001', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (240, 45, '202211080045002', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (241, 45, '202211080045003', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (242, 45, '202211080045004', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"256G\"}]', NULL);
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (243, 64, 'adadda', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (244, 64, 'a11', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (245, 67, 'adadda', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (246, 67, 'a11', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (247, 68, 'adadda', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (248, 68, 'a11', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (249, 69, '1dad', 111.00, 11, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (257, 82, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (258, 82, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (259, 83, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (260, 83, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (261, 84, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (262, 84, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (263, 85, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (264, 85, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (265, 86, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (266, 86, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (267, 87, 'dadad', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '1');
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `pic`, `sale`, `promotion_price`, `lock_stock`, `sp_data`, `verify_status`) VALUES (268, 87, 'dadad', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `platform` int DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `publish_count` int DEFAULT NULL COMMENT '发行数量',
  `use_count` int DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优惠码',
  `member_level` int DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券表';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon` (`id`, `type`, `name`, `platform`, `count`, `amount`, `per_limit`, `min_point`, `start_time`, `end_time`, `use_type`, `note`, `publish_count`, `use_count`, `receive_count`, `enable_time`, `code`, `member_level`) VALUES (27, 0, '全品类通用券', 0, 97, 10.00, 10, 100.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 0, NULL, 100, 0, 3, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` (`id`, `type`, `name`, `platform`, `count`, `amount`, `per_limit`, `min_point`, `start_time`, `end_time`, `use_type`, `note`, `publish_count`, `use_count`, `receive_count`, `enable_time`, `code`, `member_level`) VALUES (28, 0, '手机分类专用券', 0, 997, 100.00, 5, 1000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 1, NULL, 1000, 0, 3, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` (`id`, `type`, `name`, `platform`, `count`, `amount`, `per_limit`, `min_point`, `start_time`, `end_time`, `use_type`, `note`, `publish_count`, `use_count`, `receive_count`, `enable_time`, `code`, `member_level`) VALUES (29, 0, '苹果手机专用券', 0, 999, 600.00, 1, 4000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 1, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` (`id`, `type`, `name`, `platform`, `count`, `amount`, `per_limit`, `min_point`, `start_time`, `end_time`, `use_type`, `note`, `publish_count`, `use_count`, `receive_count`, `enable_time`, `code`, `member_level`) VALUES (30, 0, '小米手机专用券', 0, 999, 200.00, 1, 2000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 1, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` (`id`, `type`, `name`, `platform`, `count`, `amount`, `per_limit`, `min_point`, `start_time`, `end_time`, `use_type`, `note`, `publish_count`, `use_count`, `receive_count`, `enable_time`, `code`, `member_level`) VALUES (31, 0, '限时优惠券', 0, 999, 20.00, 5, 500.00, '2022-12-01 00:00:00', '2022-12-22 00:00:00', 0, NULL, 1000, 0, 1, '2022-12-23 00:00:00', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券使用、领取历史表';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (37, 30, 1, '7806895974110001', 'windir', 1, '2022-11-09 15:14:29', 1, '2022-11-09 15:14:58', NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (38, 27, 1, '7872472849240001', 'windir', 1, '2022-11-09 15:25:25', 1, '2022-11-09 15:25:38', NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (39, 29, 1, '7876204111480001', 'windir', 1, '2022-11-09 15:26:02', 1, '2022-11-09 15:26:11', NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (40, 27, 1, '7911945030190001', 'windir', 1, '2022-11-09 15:31:59', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (41, 28, 1, '8194868687790001', 'windir', 1, '2022-11-09 16:19:09', 1, '2022-11-11 16:12:42', NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (42, 28, 1, '1239565720390001', 'test', 1, '2022-12-21 16:46:36', 1, '2022-12-21 16:53:07', NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (43, 31, 1, '6030247208280001', 'test', 1, '2022-12-23 09:51:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (44, 28, 1, '6050939443480001', 'test', 1, '2022-12-23 09:55:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` (`id`, `coupon_id`, `member_id`, `coupon_code`, `member_nickname`, `get_type`, `create_time`, `use_status`, `use_time`, `order_id`, `order_sn`) VALUES (45, 27, 1, '4182437014580001', 'test', 1, '2023-01-10 17:10:24', 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_product_category_relation` (`id`, `coupon_id`, `product_category_id`, `product_category_name`, `parent_category_name`) VALUES (11, 28, 19, '手机通讯', '手机数码');
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_product_relation` (`id`, `coupon_id`, `product_id`, `product_name`, `product_sn`) VALUES (18, 29, 37, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189');
INSERT INTO `sms_coupon_product_relation` (`id`, `coupon_id`, `product_id`, `product_name`, `product_sn`) VALUES (19, 29, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '7437799');
INSERT INTO `sms_coupon_product_relation` (`id`, `coupon_id`, `product_id`, `product_name`, `product_sn`) VALUES (21, 30, 41, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '100035246702');
INSERT INTO `sms_coupon_product_relation` (`id`, `coupon_id`, `product_id`, `product_name`, `product_sn`) VALUES (22, 30, 40, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721');
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '秒杀时间段名称',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion` (`id`, `title`, `start_date`, `end_date`, `status`, `create_time`) VALUES (14, '双11特卖活动', '2022-11-09', '2023-06-30', 1, '2022-11-09 14:56:48');
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='限时购通知记录';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint DEFAULT NULL,
  `flash_promotion_session_id` bigint DEFAULT NULL COMMENT '编号',
  `product_id` bigint DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int DEFAULT NULL COMMENT '每人限购数量',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (21, 14, 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (22, 14, 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (23, 14, 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (24, 14, 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (25, 14, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (26, 14, 2, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (27, 14, 2, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (28, 14, 2, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (29, 14, 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (30, 14, 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (31, 14, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (32, 14, 3, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (33, 14, 4, 37, 5699.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (34, 14, 4, 38, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (35, 14, 4, 39, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (36, 14, 4, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (37, 14, 5, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (38, 14, 5, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (39, 14, 5, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (40, 14, 5, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (41, 14, 5, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (42, 14, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (43, 14, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (44, 14, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (45, 14, 6, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (46, 14, 6, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (47, 14, 7, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (48, 14, 7, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (49, 14, 7, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (50, 14, 7, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` (`id`, `flash_promotion_id`, `flash_promotion_session_id`, `product_id`, `flash_promotion_price`, `flash_promotion_count`, `flash_promotion_limit`, `sort`) VALUES (51, 14, 7, 35, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (1, '8:00', '08:00:00', '10:00:00', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (7, '20:00', '20:00:00', '22:00:00', 1, '2018-11-16 13:22:55');
COMMIT;

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int DEFAULT NULL COMMENT '点击数',
  `order_count` int DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (2, '夏季大热促销', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', 0, 0, 0, NULL, '夏季大热促销', 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (3, '夏季大热促销1', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销1', 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (4, '夏季大热促销2', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad2.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销2', 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (11, '汽车推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 0, 0, 0, 'xxx', NULL, 98);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (12, '小米推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '2022-11-08 17:04:03', '2023-11-08 17:04:05', 1, 0, 0, '/pages/brand/brandDetail?id=6', NULL, 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (13, '华为推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '2022-11-08 17:10:27', '2023-11-08 17:10:28', 1, 0, 0, '/pages/brand/brandDetail?id=3', NULL, 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (14, '苹果推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '2022-11-08 17:12:54', '2023-11-08 17:12:55', 1, 0, 0, '/pages/brand/brandDetail?id=51', NULL, 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (15, '三星推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '2022-11-08 17:15:38', '2023-11-08 17:15:39', 1, 0, 0, '/pages/brand/brandDetail?id=2', NULL, 0);
INSERT INTO `sms_home_advertise` (`id`, `name`, `type`, `pic`, `start_time`, `end_time`, `status`, `click_count`, `order_count`, `url`, `note`, `sort`) VALUES (16, 'OPPO推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', '2022-11-08 17:20:10', '2023-11-08 17:20:11', 1, 0, 0, '/pages/brand/brandDetail?id=21', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (32, 50, '海澜之家', 1, 198);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (33, 51, '苹果', 1, 199);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (34, 2, '三星', 1, 195);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (35, 3, '华为', 1, 200);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (39, 21, 'OPPO', 1, 197);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (45, 1, '万和', 1, 0);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (46, 5, '方太', 1, 0);
INSERT INTO `sms_home_brand` (`id`, `brand_id`, `brand_name`, `recommend_status`, `sort`) VALUES (47, 4, '格力', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (19, 37, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', 1, 197);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (20, 38, 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', 1, 0);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (21, 39, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑(新R5-6600H标压 16G 512G win11)', 1, 198);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (22, 40, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', 1, 200);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (23, 41, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', 1, 199);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (24, 42, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB曜金黑华为鸿蒙手机', 1, 0);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (25, 44, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议) 980（MZ-V8V500BW）', 1, 0);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (26, 45, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', 1, 0);
INSERT INTO `sms_home_new_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (27, 43, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风 JSQ30-565W16【16升】【恒温旗舰款】', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_recommend_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (10, 38, 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', 1, 0);
INSERT INTO `sms_home_recommend_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (11, 39, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑(新R5-6600H标压 16G 512G win11)', 1, 0);
INSERT INTO `sms_home_recommend_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (12, 44, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议) 980（MZ-V8V500BW）', 1, 0);
INSERT INTO `sms_home_recommend_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (13, 43, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风 JSQ30-565W16【16升】【恒温旗舰款】', 1, 0);
INSERT INTO `sms_home_recommend_product` (`id`, `product_id`, `product_name`, `recommend_status`, `sort`) VALUES (14, 45, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (14, 1, 'polo衬衫的也时尚', 1, 0);
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (15, 2, '大牌手机低价秒', 1, 0);
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (16, 3, '晓龙845新品上市', 1, 0);
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (17, 4, '夏天应该穿什么', 1, 0);
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (18, 5, '夏季精选', 1, 100);
INSERT INTO `sms_home_recommend_subject` (`id`, `subject_id`, `subject_name`, `recommend_status`, `sort`) VALUES (19, 6, '品牌手机降价', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-05-14 01:54:28', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-05-14 01:54:28', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-05-14 01:54:28', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-05-14 01:54:28', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-05-14 01:54:28', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-05-14 01:54:28', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-05-14 01:54:28', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-05-14 01:54:28', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`access_time`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (100, 'fgq123456', '127.0.0.1', '1', '登录用户不存在', '2023-05-14 11:11:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-14 11:12:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-17 22:33:35');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-17 22:33:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-17 22:34:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (105, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2023-05-17 22:46:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (106, 'admin', '127.0.0.1', '1', '密码输入错误2次', '2023-05-17 22:49:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (107, 'admi', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:00:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (108, 'dad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:01:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (109, 'ad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:02:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (110, '11', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:03:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (111, 'dada', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:05:10');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (112, '11', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:07:15');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (113, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:08:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (114, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:09:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (115, 'dadad', '127.0.0.1', '1', '登录用户不存在', '2023-05-17 23:10:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (116, 'adad', '127.0.0.1', '1', '登录用户不存在', '2023-05-17 23:12:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (117, 'dada', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:16:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (118, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:16:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (119, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:17:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (120, 'ad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:17:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (121, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:19:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (122, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:19:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (123, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:23:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (124, 'dada', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:23:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (125, 'ad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:25:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (126, 'dada', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:27:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (127, 'dadad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:27:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (128, 'dadad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:28:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (129, 'adad', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:28:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (130, 'adad', '127.0.0.1', '1', '登录用户不存在', '2023-05-17 23:28:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (131, 'dada', '127.0.0.1', '1', '用户密码不在指定范围', '2023-05-17 23:29:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-17 23:31:05');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-05-14 01:54:27', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-05-14 01:54:27', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-05-14 01:54:27', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-05-14 01:54:27', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-05-14 01:54:27', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-05-14 01:54:27', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-05-14 01:54:27', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-05-14 01:54:27', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-05-14 01:54:27', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-05-14 01:54:27', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-05-14 01:54:27', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-05-14 01:54:27', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-05-14 01:54:27', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-05-14 01:54:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-05-14 01:54:27', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-05-14 01:54:27', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-05-14 01:54:27', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-05-14 01:54:27', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-05-14 01:54:27', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-05-14 01:54:27', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-05-14 01:54:27', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-05-14 01:54:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-05-14 01:54:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-05-14 01:54:27', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-05-14 01:54:28', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-05-14 01:54:28', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-05-14 01:54:27', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-05-14 01:54:27', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-05-14 01:54:27', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1060);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-14 01:54:27', 'admin', '2023-05-14 01:54:27', '', NULL, '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-14 01:54:27', 'admin', '2023-05-14 01:54:27', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 'test@qq.com', '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (3, 'admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-20 12:45:16', 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (4, 'macro', '$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'macro@qq.com', 'macro', 'macro专用', '2019-10-06 15:53:51', '2020-02-03 14:55:55', 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (6, 'productAdmin', '$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 'product@qq.com', '商品管理员', '只有商品权限', '2020-02-07 16:15:08', NULL, 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (7, 'orderAdmin', '$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_04.png', 'order@qq.com', '订单管理员', '只有订单管理权限', '2020-02-07 16:15:50', NULL, 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (8, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:45:42', NULL, 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (9, 'test256', '$2a$10$kTMBrt8mkXcO8T4eHThFWOf3KuNK6tqevkiAf4YbtXtaCJ6ocYkJa', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:52:57', NULL, 1);
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES (10, 'test1267', '$2a$10$VUywDhXVPY13YZxMD/uPWeDqkzSozN7o8u/3MX6sBig2NK2VaTJZ2', NULL, 'test1267@qq.com', 'test1267', 'test1267', '2023-01-04 16:13:34', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户登录日志表';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (1, 3, '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (2, 3, '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (3, 3, '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (4, 3, '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (5, 3, '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (6, 3, '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (7, 3, '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (8, 3, '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (9, 3, '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (10, 3, '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (11, 3, '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (12, 3, '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (13, 3, '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (14, 3, '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (15, 3, '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (16, 3, '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (17, 3, '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (18, 3, '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (19, 3, '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (20, 3, '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (21, 3, '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (22, 3, '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (23, 3, '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (24, 3, '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (25, 3, '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (26, 3, '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (27, 3, '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (28, 3, '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (29, 3, '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (30, 3, '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (31, 1, '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (32, 1, '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (33, 3, '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (34, 3, '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (35, 3, '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (36, 3, '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (37, 3, '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (38, 3, '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (39, 4, '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (40, 4, '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (41, 4, '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (42, 4, '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (43, 4, '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (44, 3, '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (45, 3, '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (46, 3, '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (47, 3, '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (48, 3, '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (49, 3, '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (50, 3, '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (51, 6, '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (52, 3, '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (53, 3, '2019-11-30 21:25:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (54, 3, '2019-11-30 21:27:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (55, 3, '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (56, 3, '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (57, 3, '2020-01-04 16:00:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (58, 3, '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (59, 3, '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (60, 3, '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (61, 3, '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (62, 3, '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (63, 3, '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (64, 3, '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (65, 3, '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (66, 3, '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (67, 3, '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (68, 3, '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (69, 3, '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (70, 3, '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (71, 3, '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (72, 3, '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (73, 3, '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (74, 3, '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (75, 3, '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (76, 3, '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (77, 3, '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (78, 3, '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (79, 3, '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (80, 3, '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (81, 3, '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (82, 3, '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (83, 3, '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (84, 3, '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (85, 3, '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (86, 3, '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (87, 3, '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (88, 3, '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (89, 3, '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (90, 3, '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (91, 3, '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (92, 3, '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (93, 3, '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (94, 3, '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (95, 3, '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (96, 3, '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (97, 3, '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (98, 3, '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (99, 3, '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (100, 3, '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (101, 3, '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (102, 3, '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (103, 3, '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (104, 3, '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (105, 3, '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (106, 3, '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (107, 3, '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (108, 3, '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (109, 3, '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (110, 3, '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (111, 3, '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (112, 3, '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (113, 3, '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (114, 3, '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (115, 3, '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (116, 3, '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (117, 3, '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (118, 5, '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (119, 5, '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (120, 5, '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (121, 3, '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (122, 5, '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (123, 3, '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (124, 3, '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (125, 5, '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (126, 3, '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (127, 1, '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (128, 3, '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (129, 3, '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (130, 3, '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (131, 3, '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (132, 3, '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (133, 4, '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (134, 3, '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (135, 3, '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (136, 3, '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (137, 3, '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (138, 1, '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (139, 3, '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (140, 3, '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (141, 3, '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (142, 3, '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (143, 3, '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (144, 3, '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (145, 3, '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (146, 6, '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (147, 7, '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (148, 3, '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (149, 7, '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (150, 3, '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (151, 3, '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (152, 3, '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (153, 3, '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (154, 3, '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (155, 3, '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (156, 3, '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (157, 3, '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (158, 3, '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (159, 3, '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (160, 3, '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (161, 3, '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (162, 3, '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (163, 3, '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (164, 6, '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (165, 6, '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (166, 6, '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (167, 6, '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (168, 3, '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (169, 6, '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (170, 3, '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (171, 3, '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (172, 3, '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (173, 3, '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (174, 3, '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (175, 3, '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (176, 3, '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (177, 3, '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (178, 3, '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (179, 3, '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (180, 6, '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (181, 6, '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (182, 3, '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (183, 3, '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (184, 8, '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (185, 8, '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (186, 8, '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (187, 8, '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (188, 8, '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (189, 8, '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (190, 8, '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (191, 8, '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (192, 8, '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (193, 3, '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (194, 3, '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (195, 3, '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (196, 3, '2020-03-07 16:33:59', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (197, 6, '2020-03-07 16:35:38', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (198, 3, '2020-03-07 17:00:09', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (199, 3, '2020-03-14 14:32:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (200, 8, '2020-03-14 14:32:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (201, 3, '2020-03-14 14:33:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (202, 8, '2020-03-14 14:34:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (203, 3, '2020-03-14 14:35:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (204, 8, '2020-03-14 14:36:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (205, 3, '2020-03-14 14:36:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (206, 8, '2020-03-14 14:37:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (207, 3, '2020-03-14 14:37:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (208, 8, '2020-03-14 14:38:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (209, 3, '2020-03-14 14:38:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (210, 8, '2020-03-14 14:39:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (211, 3, '2020-03-14 14:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (212, 3, '2020-03-15 14:23:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (213, 3, '2020-03-22 14:33:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (214, 3, '2020-03-22 14:59:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (215, 3, '2020-03-22 15:04:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (216, 3, '2020-03-29 16:14:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (217, 3, '2020-03-29 17:17:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (218, 3, '2020-04-06 16:54:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (219, 3, '2020-04-12 15:01:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (220, 3, '2020-04-19 09:50:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (221, 3, '2020-05-04 10:45:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (222, 3, '2020-05-05 11:02:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (223, 3, '2020-05-16 15:17:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (224, 3, '2020-05-17 14:58:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (225, 3, '2020-05-18 15:47:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (226, 3, '2020-05-23 16:51:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (227, 3, '2020-05-23 16:54:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (228, 3, '2020-05-23 17:00:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (229, 3, '2020-05-24 10:38:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (230, 3, '2020-06-07 09:39:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (231, 3, '2020-06-14 14:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (232, 3, '2020-06-14 17:11:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (233, 3, '2020-06-20 14:53:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (234, 3, '2020-06-21 14:57:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (235, 3, '2020-06-27 10:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (236, 3, '2020-07-05 15:54:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (237, 3, '2020-07-11 10:40:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (238, 3, '2020-07-11 10:45:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (239, 3, '2020-07-19 11:00:16', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (240, 3, '2020-07-19 11:46:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (241, 3, '2020-07-19 11:53:47', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (242, 3, '2020-07-19 14:17:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (243, 3, '2020-07-19 14:44:24', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (244, 3, '2020-07-19 14:44:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (245, 3, '2020-07-19 14:48:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (246, 3, '2020-07-19 14:48:57', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (247, 3, '2020-07-19 14:49:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (248, 3, '2020-07-19 14:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (249, 3, '2020-07-19 14:51:51', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (250, 3, '2020-07-19 14:55:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (251, 3, '2020-07-19 14:58:14', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (252, 6, '2020-07-19 15:04:21', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (253, 3, '2020-07-19 15:38:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (254, 6, '2020-07-19 16:26:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (255, 3, '2020-08-08 10:39:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (256, 3, '2020-08-09 11:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (257, 3, '2020-08-10 20:41:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (258, 3, '2020-08-15 10:12:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (259, 1, '2020-08-19 21:23:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (260, 1, '2020-08-19 21:25:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (261, 3, '2020-09-05 16:14:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (262, 3, '2020-09-05 16:15:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (263, 3, '2020-09-12 16:07:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (264, 6, '2020-09-12 16:08:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (265, 1, '2020-09-12 16:08:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (266, 6, '2020-09-12 16:09:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (267, 1, '2020-09-12 16:09:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (268, 3, '2020-09-13 14:22:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (269, 3, '2020-09-13 14:23:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (270, 3, '2020-09-13 14:24:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (271, 3, '2020-09-13 14:32:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (272, 1, '2020-09-19 15:43:31', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (273, 3, '2020-09-19 15:43:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (274, 3, '2020-09-19 15:49:44', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (275, 6, '2020-09-19 15:50:12', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (276, 6, '2020-09-19 15:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (277, 1, '2020-09-19 15:50:41', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (278, 6, '2020-09-19 15:52:28', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (279, 1, '2020-09-19 15:53:01', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (280, 1, '2020-09-19 15:53:48', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (281, 6, '2020-09-19 15:54:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (282, 3, '2020-09-20 11:13:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (283, 1, '2020-10-08 14:26:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (284, 1, '2020-10-08 14:30:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (285, 3, '2021-04-11 10:27:43', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (286, 1, '2021-04-11 10:29:19', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (287, 3, '2021-04-11 10:30:40', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (288, 3, '2021-04-11 10:37:50', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (289, 3, '2021-12-08 10:44:09', '192.168.3.4', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (290, 3, '2022-04-15 15:04:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (291, 1, '2022-05-10 15:25:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (292, 1, '2022-05-10 15:31:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (293, 1, '2022-05-10 15:32:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (294, 1, '2022-05-10 15:34:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (295, 1, '2022-05-10 15:34:38', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (296, 1, '2022-05-10 15:54:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (297, 1, '2022-05-10 16:31:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (298, 1, '2022-05-10 16:33:45', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (299, 1, '2022-05-10 16:39:07', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (300, 1, '2022-05-18 14:53:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (301, 3, '2022-06-07 17:28:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (302, 3, '2022-06-08 09:48:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (303, 3, '2022-06-08 10:34:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (304, 3, '2022-06-08 17:09:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (305, 3, '2022-06-08 17:10:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (306, 6, '2022-06-08 17:10:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (307, 3, '2022-06-08 17:23:05', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (308, 3, '2022-06-08 17:30:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (309, 3, '2022-06-08 17:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (310, 3, '2022-06-08 17:31:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (311, 3, '2022-06-08 21:03:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (312, 3, '2022-06-09 10:41:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (313, 3, '2022-06-09 15:18:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (314, 3, '2022-06-10 15:43:15', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (315, 3, '2022-06-10 15:52:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (316, 3, '2022-06-15 14:41:59', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (317, 3, '2022-06-23 16:24:09', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (318, 3, '2022-06-23 16:41:33', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (319, 3, '2022-06-23 16:42:50', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (320, 3, '2022-06-23 16:42:51', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (321, 3, '2022-06-23 16:42:52', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (322, 3, '2022-06-23 16:42:53', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (323, 3, '2022-06-23 16:43:07', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (324, 3, '2022-06-23 16:44:56', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (325, 3, '2022-06-23 16:45:42', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (326, 3, '2022-06-23 16:50:08', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (327, 3, '2022-06-24 15:19:04', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (328, 3, '2022-06-24 15:25:52', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (329, 3, '2022-06-24 15:40:29', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (330, 3, '2022-06-25 15:13:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (331, 3, '2022-06-25 15:25:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (332, 3, '2022-06-27 16:38:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (333, 3, '2022-07-24 10:10:06', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (334, 1, '2022-07-25 17:15:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (335, 3, '2022-07-27 09:41:32', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (336, 1, '2022-07-28 16:56:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (337, 1, '2022-07-28 16:56:25', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (338, 8, '2022-08-07 14:46:00', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (339, 9, '2022-08-07 14:53:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (340, 9, '2022-08-07 14:53:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (341, 9, '2022-08-07 14:56:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (342, 1, '2022-08-09 10:53:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (343, 1, '2022-08-09 10:54:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (344, 1, '2022-08-09 11:00:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (345, 1, '2022-08-09 11:02:04', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (346, 1, '2022-08-09 15:48:14', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (347, 1, '2022-08-16 16:35:24', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (348, 1, '2022-08-17 15:03:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (349, 1, '2022-08-20 16:49:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (350, 1, '2022-08-23 14:54:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (351, 1, '2022-08-31 17:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (352, 3, '2022-10-14 15:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (353, 3, '2022-10-14 15:42:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (354, 3, '2022-10-14 15:44:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (355, 3, '2022-10-14 15:46:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (356, 3, '2022-10-14 15:46:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (357, 3, '2022-10-14 16:06:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (358, 3, '2022-10-14 16:24:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (359, 3, '2022-10-17 16:44:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (360, 3, '2022-10-17 16:49:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (361, 3, '2022-10-17 16:49:53', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (362, 3, '2022-10-17 17:03:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (363, 3, '2022-10-17 17:03:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (364, 3, '2022-10-17 21:00:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (365, 3, '2022-10-24 16:32:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (366, 3, '2022-10-26 16:31:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (367, 3, '2022-10-26 16:50:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (368, 3, '2022-10-26 16:52:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (369, 3, '2022-10-27 17:21:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (370, 3, '2022-10-28 10:52:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (371, 3, '2022-11-04 16:09:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (372, 3, '2022-11-08 10:27:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (373, 3, '2022-11-09 10:42:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (374, 3, '2022-11-10 15:03:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (375, 3, '2022-11-11 10:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (376, 3, '2022-11-14 16:33:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (377, 3, '2022-11-15 10:54:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (378, 3, '2022-11-15 15:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (379, 3, '2022-11-15 15:17:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (380, 3, '2022-11-15 15:17:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (381, 1, '2022-11-15 15:19:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (382, 3, '2022-11-15 15:20:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (383, 3, '2022-11-15 15:22:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (384, 3, '2022-11-16 10:39:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (385, 1, '2022-11-24 20:02:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (386, 3, '2022-11-28 15:24:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (387, 3, '2022-11-30 09:34:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (388, 3, '2022-12-05 09:43:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (389, 3, '2022-12-09 17:18:09', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (390, 3, '2022-12-15 14:53:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (391, 3, '2022-12-15 16:11:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (392, 3, '2022-12-20 15:55:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (393, 3, '2022-12-21 14:49:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (394, 3, '2022-12-23 09:49:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (395, 3, '2023-01-04 10:17:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (396, 3, '2023-01-04 15:28:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (397, 3, '2023-01-05 10:13:43', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (398, 3, '2023-01-06 09:49:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (399, 3, '2023-01-06 10:04:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (400, 3, '2023-01-06 10:07:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (401, 3, '2023-01-06 16:21:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (402, 3, '2023-01-09 16:50:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (403, 3, '2023-01-10 10:05:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (404, 3, '2023-01-10 17:09:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (405, 3, '2023-01-11 10:17:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (406, 3, '2023-01-13 09:35:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (407, 3, '2023-01-13 09:40:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (408, 3, '2023-01-31 10:46:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (409, 3, '2023-02-08 17:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (410, 3, '2023-02-09 15:46:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES (411, 3, '2023-02-10 17:23:52', '192.168.56.1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `permission_id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (26, 3, 5);
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (27, 6, 1);
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (28, 7, 2);
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (29, 1, 5);
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (30, 4, 5);
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES (31, 8, 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作备注',
  `source_type` int DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='成长值变化历史记录表';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
BEGIN;
INSERT INTO `ums_growth_change_history` (`id`, `member_id`, `create_time`, `change_type`, `change_count`, `operate_man`, `operate_note`, `source_type`) VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作备注',
  `source_type` int DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='积分变化历史记录表';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='积分消费设置';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
BEGIN;
INSERT INTO `ums_integration_consume_setting` (`id`, `deduction_per_amount`, `max_percent_per_order`, `use_unit`, `coupon_status`) VALUES (1, 100, 50, 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `status` int DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `gender` int DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个性签名',
  `source_type` int DEFAULT NULL COMMENT '用户来源',
  `integration` int DEFAULT NULL COMMENT '积分',
  `growth` int DEFAULT NULL COMMENT '成长值',
  `luckey_count` int DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE,
  UNIQUE KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
BEGIN;
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (1, 4, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'test', '18061581849', 1, '2018-08-02 10:35:44', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 1, '2009-06-01', '上海', '学生', 'test', NULL, 3900, 1000, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `member_level_id`, `username`, `password`, `nickname`, `phone`, `status`, `create_time`, `icon`, `gender`, `birthday`, `city`, `job`, `personalized_signature`, `source_type`, `integration`, `growth`, `luckey_count`, `history_integration`) VALUES (10, 4, 'guest', '$2a$10$WQiD4RzEs1iJVWU.2HVu8OdSlExJHWKmwndaw3SUfMyqfKZmXe1vq', NULL, '18911111111', 1, '2020-03-14 14:52:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `growth_point` int DEFAULT NULL,
  `default_status` int DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员等级表';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_sign_in`, `priviledge_comment`, `priviledge_promotion`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_sign_in`, `priviledge_comment`, `priviledge_promotion`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_sign_in`, `priviledge_comment`, `priviledge_promotion`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_sign_in`, `priviledge_comment`, `priviledge_promotion`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_type` int DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员登录记录';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `tag_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户和标签关系表';

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员与产品分类关系表（用户喜欢的分类）';

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `default_status` int DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员收货地址表';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone_number`, `default_status`, `post_code`, `province`, `city`, `region`, `detail_address`) VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone_number`, `default_status`, `post_code`, `province`, `city`, `region`, `detail_address`) VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone_number`, `default_status`, `post_code`, `province`, `city`, `region`, `detail_address`) VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
COMMIT;

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员积分成长规则表';

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int DEFAULT NULL COMMENT '评价数',
  `return_order_count` int DEFAULT NULL COMMENT '退货数量',
  `login_count` int DEFAULT NULL COMMENT '登录次数',
  `attend_count` int DEFAULT NULL COMMENT '关注数量',
  `fans_count` int DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int DEFAULT NULL,
  `collect_subject_count` int DEFAULT NULL,
  `collect_topic_count` int DEFAULT NULL,
  `collect_comment_count` int DEFAULT NULL,
  `invite_friend_count` int DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员统计信息';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finish_order_count` int DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户标签表';

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `growth` int DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int DEFAULT NULL COMMENT '赠送积分',
  `type` int DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='会员任务表';

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `level` int DEFAULT NULL COMMENT '菜单级数',
  `sort` int DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端图标',
  `hidden` int DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台菜单表';

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
BEGIN;
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (1, 0, '2020-02-02 14:50:36', '商品', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (2, 1, '2020-02-02 14:51:50', '商品列表', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (3, 1, '2020-02-02 14:52:44', '添加商品', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (4, 1, '2020-02-02 14:53:51', '商品分类', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (5, 1, '2020-02-02 14:54:51', '商品类型', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (6, 1, '2020-02-02 14:56:29', '品牌管理', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (7, 0, '2020-02-02 16:54:07', '订单', 0, 0, 'oms', 'order', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (8, 7, '2020-02-02 16:55:18', '订单列表', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (9, 7, '2020-02-02 16:56:46', '订单设置', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (10, 7, '2020-02-02 16:57:39', '退货申请处理', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (11, 7, '2020-02-02 16:59:40', '退货原因设置', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (12, 0, '2020-02-04 16:18:00', '营销', 0, 0, 'sms', 'sms', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (13, 12, '2020-02-04 16:19:22', '秒杀活动列表', 1, 0, 'flash', 'sms-flash', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (14, 12, '2020-02-04 16:20:16', '优惠券列表', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (16, 12, '2020-02-07 16:22:38', '品牌推荐', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (17, 12, '2020-02-07 16:23:14', '新品推荐', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (18, 12, '2020-02-07 16:26:38', '人气推荐', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (19, 12, '2020-02-07 16:28:16', '专题推荐', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (20, 12, '2020-02-07 16:28:42', '广告列表', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (21, 0, '2020-02-07 16:29:13', '权限', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (22, 21, '2020-02-07 16:29:51', '用户列表', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (23, 21, '2020-02-07 16:30:13', '角色列表', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (24, 21, '2020-02-07 16:30:53', '菜单列表', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES (25, 21, '2020-02-07 16:31:13', '资源列表', 1, 0, 'resource', 'ums-resource', 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `type` int DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端资源路径',
  `status` int DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户权限表';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
BEGIN;
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` (`id`, `pid`, `name`, `value`, `icon`, `type`, `uri`, `status`, `create_time`, `sort`) VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `category_id` bigint DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台资源表';

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
BEGIN;
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (1, '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (2, '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/category/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (3, '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (4, '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (5, '2020-02-04 17:09:16', '商品管理', '/product/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (6, '2020-02-04 17:09:53', '商品库存管理', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (8, '2020-02-05 14:43:37', '订单管理', '/order/**', '', 2);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (9, '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (10, '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (11, '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (12, '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (13, '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (14, '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (15, '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (16, '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (17, '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (18, '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (19, '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (20, '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (21, '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (22, '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', 3);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (23, '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (24, '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', 5);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (30, '2020-09-19 15:47:57', '会员等级管理', '/memberLevel/**', '', 7);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (31, '2020-09-19 15:51:29', '获取登录用户信息', '/admin/info', '用户登录必配', 4);
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES (32, '2020-09-19 15:53:34', '用户登出', '/admin/logout', '用户登出必配', 4);
COMMIT;

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='资源分类表';

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
BEGIN;
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (1, '2020-02-05 10:21:44', '商品模块', 0);
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (2, '2020-02-05 10:22:34', '订单模块', 0);
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (3, '2020-02-05 10:22:48', '营销模块', 0);
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (4, '2020-02-05 10:23:04', '权限模块', 0);
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (5, '2020-02-07 16:34:27', '内容模块', 0);
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES (7, '2020-09-19 15:49:08', '其他模块', 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `admin_count` int DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
BEGIN;
INSERT INTO `ums_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`) VALUES (1, '商品管理员', '只能查看及操作商品', 0, '2020-02-03 16:50:37', 1, 0);
INSERT INTO `ums_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`) VALUES (2, '订单管理员', '只能查看及操作订单', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`) VALUES (5, '超级管理员', '拥有所有查看和操作功能', 0, '2020-02-02 15:11:05', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台角色菜单关系表';

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (53, 2, 7);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (54, 2, 8);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (55, 2, 9);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (56, 2, 10);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (57, 2, 11);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (72, 5, 1);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (73, 5, 2);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (74, 5, 3);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (75, 5, 4);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (76, 5, 5);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (77, 5, 6);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (78, 5, 7);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (79, 5, 8);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (80, 5, 9);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (81, 5, 10);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (82, 5, 11);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (83, 5, 12);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (84, 5, 13);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (85, 5, 14);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (86, 5, 16);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (87, 5, 17);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (88, 5, 18);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (89, 5, 19);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (90, 5, 20);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (91, 5, 21);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (92, 5, 22);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (93, 5, 23);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (94, 5, 24);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (95, 5, 25);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (121, 1, 1);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (122, 1, 2);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (123, 1, 3);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (124, 1, 4);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (125, 1, 5);
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES (126, 1, 6);
COMMIT;

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `permission_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` (`id`, `role_id`, `permission_id`) VALUES (17, 4, 17);
COMMIT;

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台角色资源关系表';

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (194, 5, 1);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (195, 5, 2);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (196, 5, 3);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (197, 5, 4);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (198, 5, 5);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (199, 5, 6);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (200, 5, 8);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (201, 5, 9);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (202, 5, 10);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (203, 5, 11);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (204, 5, 12);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (205, 5, 13);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (206, 5, 14);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (207, 5, 15);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (208, 5, 16);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (209, 5, 17);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (210, 5, 18);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (211, 5, 19);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (212, 5, 20);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (213, 5, 21);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (214, 5, 22);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (215, 5, 23);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (216, 5, 24);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (217, 5, 25);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (218, 5, 26);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (219, 5, 27);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (220, 5, 28);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (221, 5, 29);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (222, 5, 30);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (232, 2, 8);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (233, 2, 9);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (234, 2, 10);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (235, 2, 11);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (236, 2, 12);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (237, 2, 31);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (238, 2, 32);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (239, 1, 1);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (240, 1, 2);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (241, 1, 3);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (242, 1, 4);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (243, 1, 5);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (244, 1, 6);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (245, 1, 23);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (246, 1, 24);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (247, 1, 31);
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES (248, 1, 32);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
