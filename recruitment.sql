/*
Navicat MySQL Data Transfer

Source Server         : lhb
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : recruitment

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-04-28 18:56:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '编码',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '有效状态（0 无效，1 有效（区域），2 开通（城市）)',
  `pinyin` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '全拼音',
  `py` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简拼',
  `city_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自定义编号',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';

-- ----------------------------
-- Records of district
-- ----------------------------

-- ----------------------------
-- Table structure for `district_config`
-- ----------------------------
DROP TABLE IF EXISTS `district_config`;
CREATE TABLE `district_config` (
  `code` int(11) NOT NULL COMMENT '城市编码',
  `presale_phone` varchar(15) DEFAULT NULL COMMENT '售前电话',
  `after_phone` varchar(15) DEFAULT NULL COMMENT '售后电话',
  `complaint_phone` varchar(15) DEFAULT NULL COMMENT '投诉电话',
  `transfer_director_phone` varchar(15) DEFAULT NULL COMMENT '转让总监电话',
  `consume_director_phone` varchar(15) DEFAULT NULL COMMENT '消费总监电话',
  `staffing_director_phone` varchar(15) DEFAULT NULL COMMENT '招聘总监电话',
  `need_director_phone` varchar(15) DEFAULT NULL COMMENT '选址总监电话',
  `address` varchar(127) DEFAULT NULL COMMENT '公司地址',
  `wechat` varchar(63) DEFAULT NULL COMMENT '微信',
  `tq` varchar(127) DEFAULT NULL COMMENT 'tq客户咨询工具',
  `wap_tq` varchar(255) DEFAULT NULL COMMENT 'wap版tq客户咨询工具',
  `creator_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市属性配置';

-- ----------------------------
-- Records of district_config
-- ----------------------------
INSERT INTO `district_config` VALUES ('1', '138000138000', '138000138000', '138000138000', '138000138000', '138000138000', '138000138000', '138000138000', 'fdsf', '138000138000', null, null, null, null);

-- ----------------------------
-- Table structure for `flow_bill`
-- ----------------------------
DROP TABLE IF EXISTS `flow_bill`;
CREATE TABLE `flow_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `flow_no` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联目标Id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易类型 0:招聘职位购买，1 招聘套餐购买',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易状态 0 初始状态  1：成功 2：失败',
  `out_flow_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方流水号',
  `callBack_time` timestamp NULL DEFAULT NULL COMMENT '系统回调时间',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
  `amount` int(11) NOT NULL COMMENT '金额',
  `stack_trace` text COLLATE utf8mb4_unicode_ci COMMENT '异常信息',
  `paymenttype` smallint(6) DEFAULT '0' COMMENT '付款类型（1 支付宝，2 微信支付）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_no` (`flow_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流水账单';

-- ----------------------------
-- Records of flow_bill
-- ----------------------------

-- ----------------------------
-- Table structure for `industry`
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '行业编码',
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '行业名称',
  `shop_industry_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物业名称',
  `engage_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经营名称',
  `full_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '全称',
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='行业表';

-- ----------------------------
-- Records of industry
-- ----------------------------

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '职位编码',
  `title` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '职位名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='职位类别表';

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for `price_config`
-- ----------------------------
DROP TABLE IF EXISTS `price_config`;
CREATE TABLE `price_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `days` int(11) NOT NULL DEFAULT '0' COMMENT '天数',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '报价金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0 有效，1 无效）',
  PRIMARY KEY (`id`),
  KEY `days` (`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='报价表';

-- ----------------------------
-- Records of price_config
-- ----------------------------

-- ----------------------------
-- Table structure for `recommendation_resume`
-- ----------------------------
DROP TABLE IF EXISTS `recommendation_resume`;
CREATE TABLE `recommendation_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rec_position_id` int(11) NOT NULL COMMENT '招聘需求Id',
  `resume_id` int(11) NOT NULL COMMENT '简历Id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '处理结果（0 待处理，1 邀约， 2 已面试，3 不合适，4 聘请， 5 超时)',
  `handle_time` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(300) DEFAULT NULL COMMENT '处理备注',
  `abandon` tinyint(4) DEFAULT '0' COMMENT '是否放弃（0 否，1 是)',
  `abandon_reason` varchar(100) DEFAULT NULL,
  `abandon_time` timestamp NULL DEFAULT NULL COMMENT '放弃时间',
  `summary` varchar(300) DEFAULT NULL COMMENT '职位概要',
  `msg_qty` int(11) DEFAULT '0' COMMENT '短信数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `resume_sms_qty` int(11) DEFAULT '0' COMMENT '给简历自己发短信次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招聘投递表';

-- ----------------------------
-- Records of recommendation_resume
-- ----------------------------

-- ----------------------------
-- Table structure for `recruitment_position`
-- ----------------------------
DROP TABLE IF EXISTS `recruitment_position`;
CREATE TABLE `recruitment_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `owner_id` int(11) NOT NULL COMMENT '(店主)用户id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺Id',
  `position_id` int(11) NOT NULL COMMENT '职位类别Id',
  `position_name` varchar(40) DEFAULT NULL COMMENT '职位名称',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `wages` int(11) NOT NULL DEFAULT '0' COMMENT '薪资（0 表示面谈）',
  `work_experience` int(11) NOT NULL DEFAULT '0' COMMENT '工作经验（ 0 表示不限, n 表示n 年，最大 n=10表示10年以上)',
  `holiday_mode` int(11) NOT NULL DEFAULT '0' COMMENT '休息方式（ 0 调休，1 单休，2 双休 )',
  `age` int(11) DEFAULT '0' COMMENT '年龄( 0 表示不限）',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：为不限 1：男 2：女',
  `description` varchar(300) DEFAULT NULL COMMENT '职位描述',
  `end` tinyint(4) DEFAULT '0' COMMENT '是否结束（0 未结束，1 已结束)',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '收费状态（0 未收费，1 已收费）',
  `pay_amount` int(11) NOT NULL DEFAULT '0' COMMENT '开通费用（单位：分）',
  `pay_days` int(11) NOT NULL DEFAULT '0' COMMENT '开通天数',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '收费开始时间',
  `stop_time` timestamp NULL DEFAULT NULL COMMENT '收费截止时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `refresh_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '刷新时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0 正常，1 删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招聘职位表';

-- ----------------------------
-- Records of recruitment_position
-- ----------------------------

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `mobile` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `real_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` int(11) NOT NULL DEFAULT '0' COMMENT '头相',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：为不限 1：男 2：女',
  `birthday_year` int(11) NOT NULL DEFAULT '1990' COMMENT '出生年(1949-今）',
  `birthday_month` int(11) NOT NULL DEFAULT '1' COMMENT '出生月(1~12月）',
  `work_experience` int(11) DEFAULT '-1' COMMENT '工作经验(-1 没填，0 无经验，1 表示1年，2 表示2年，.. 10 表示10，大于10表示大于10年）',
  `education` int(11) DEFAULT '0' COMMENT '最高学历（1 初中以下，2 高中，3 中专/技校，4 大专 ，5 本科， 6 硕士及以上）',
  `cityId` int(11) DEFAULT '0' COMMENT '意向城市',
  `wages` int(11) DEFAULT '0' COMMENT '期望工资 （ 0 表示面议, ..)',
  `positions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '意向职位（职位名称用“、”号分隔)',
  `districts` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '意向区域（区域名称用“、”号分隔)',
  `work_history` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作经历（职位名称用“、”号分隔)',
  `introduction` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `refresh_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '刷新时间',
  `refresh_num` int(11) DEFAULT '0' COMMENT '刷新次数',
  `remark` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐语',
  `owner` int(11) NOT NULL COMMENT '所属人',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志（0 正常，1 已删除)',
  `lock` tinyint(4) DEFAULT '0' COMMENT '锁定（0 未锁定，1 锁定)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='个人简历表';

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for `resume_district`
-- ----------------------------
DROP TABLE IF EXISTS `resume_district`;
CREATE TABLE `resume_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历Id',
  `district_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resume_district_unique_key` (`resume_id`,`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简历意向区域表';

-- ----------------------------
-- Records of resume_district
-- ----------------------------

-- ----------------------------
-- Table structure for `resume_photo`
-- ----------------------------
DROP TABLE IF EXISTS `resume_photo`;
CREATE TABLE `resume_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `resume_id` int(11) NOT NULL COMMENT '简历Id',
  `photo_id` int(11) NOT NULL COMMENT '图片Id',
  PRIMARY KEY (`id`),
  KEY `resume_id_photo_fkey` (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简历图片表';

-- ----------------------------
-- Records of resume_photo
-- ----------------------------

-- ----------------------------
-- Table structure for `resume_position`
-- ----------------------------
DROP TABLE IF EXISTS `resume_position`;
CREATE TABLE `resume_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历Id',
  `position_id` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `resume_position_unique_key` (`resume_id`,`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='意向职位表';

-- ----------------------------
-- Records of resume_position
-- ----------------------------

-- ----------------------------
-- Table structure for `resume_work_history`
-- ----------------------------
DROP TABLE IF EXISTS `resume_work_history`;
CREATE TABLE `resume_work_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历Id',
  `position_id` int(11) NOT NULL COMMENT '职位Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_history_resume_id_unique` (`resume_id`,`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简历工作经历表';

-- ----------------------------
-- Records of resume_work_history
-- ----------------------------

-- ----------------------------
-- Table structure for `schema_version`
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_version
-- ----------------------------
INSERT INTO `schema_version` VALUES ('1', '1', '0', '<< Flyway Schema Creation >>', 'SCHEMA', '`recruitment`', null, 'root', '2018-04-26 14:25:01', '0', '1');
INSERT INTO `schema_version` VALUES ('2', '2', '1.1', 'init recruitment tables', 'SQL', 'V1_1__init_recruitment_tables.sql', '-1740215359', 'root', '2018-04-26 14:25:03', '1916', '1');
INSERT INTO `schema_version` VALUES ('3', '3', '1.2', 'create task', 'SQL', 'V1_2__create_task.sql', '-316398494', 'root', '2018-04-26 14:25:03', '219', '1');
INSERT INTO `schema_version` VALUES ('4', '4', '1.3', 'inset system task', 'SQL', 'V1_3__inset_system_task.sql', '-1400571905', 'root', '2018-04-26 14:25:03', '35', '1');
INSERT INTO `schema_version` VALUES ('5', '5', '1.4', 'create price config', 'SQL', 'V1_4__create_price_config.sql', '-601746236', 'root', '2018-04-26 16:37:01', '337', '1');
INSERT INTO `schema_version` VALUES ('6', '6', '1.5', 'create table basic', 'SQL', 'V1_5__create_table_basic.sql', '-258769473', 'root', '2018-04-26 16:37:02', '630', '1');
INSERT INTO `schema_version` VALUES ('7', '7', '1.6', 'alter table flow bill', 'SQL', 'V1_6__alter_table_flow_bill.sql', '506136828', 'root', '2018-04-28 11:11:18', '225', '1');
INSERT INTO `schema_version` VALUES ('8', '8', '1.7', 'alter table resume add avatar', 'SQL', 'V1_7__alter_table_resume_add_avatar.sql', '-586130571', 'root', '2018-04-28 11:11:18', '206', '1');
INSERT INTO `schema_version` VALUES ('9', '9', '1.8', 'alter rec add refresh time', 'SQL', 'V1_8__alter_rec_add_refresh_time.sql', '-337553534', 'root', '2018-04-28 11:11:19', '208', '1');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `industry_id` int(11) NOT NULL COMMENT '行业 id',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域Id',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺地址',
  `latitude` double(10,6) NOT NULL DEFAULT '0.000000' COMMENT '纬度',
  `longitude` double(10,6) NOT NULL DEFAULT '0.000000' COMMENT '经度',
  `city_id` int(11) NOT NULL COMMENT '城市id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `owner_id` int(11) NOT NULL COMMENT '(店主)用户id',
  `introduction` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺介绍',
  `contact` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '负责人',
  `telephone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招聘描述',
  `cover` int(11) DEFAULT '0' COMMENT '门头图Id',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除（0 未删除，1 已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺表';

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('2', '面点王', '1101', '1101', '深圳市南山区海岸城', '1.000000', '1.000000', '4403', '2018-04-27 15:33:37', '2018-04-27 15:33:37', '2', null, '周华', '13890678930', '描述', '1', '0');
INSERT INTO `shop` VALUES ('4', '面很香', '1101', '1101', '深圳市南山区海岸城', '1.000000', '1.000000', '4403', '2018-04-27 15:46:48', '2018-04-27 15:46:48', '4', null, '周华', '137905690920', '描述', '1', '0');

-- ----------------------------
-- Table structure for `shop_welfare`
-- ----------------------------
DROP TABLE IF EXISTS `shop_welfare`;
CREATE TABLE `shop_welfare` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `welfare_id` int(11) NOT NULL COMMENT '福利Id',
  `welfare_name` varchar(30) DEFAULT NULL COMMENT '福利名称',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='福利待遇子表';

-- ----------------------------
-- Records of shop_welfare
-- ----------------------------

-- ----------------------------
-- Table structure for `task_config`
-- ----------------------------
DROP TABLE IF EXISTS `task_config`;
CREATE TABLE `task_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""' COMMENT '业务code',
  `full_class` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `corn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""' COMMENT 'corn表达式',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""' COMMENT '名称',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""' COMMENT '所属组',
  `trigger_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常运行;1:删除;2:停止运行',
  PRIMARY KEY (`id`),
  KEY `idx1` (`biz_code`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of task_config
-- ----------------------------
INSERT INTO `task_config` VALUES ('4', 'ackTask', 'com.xw.task.AckTask', '2018-04-18 11:38:54', '0/15 * * * * ?', 'ackTask', 'system', 'systemAckTask', '2018-04-18 11:38:54', '0');
