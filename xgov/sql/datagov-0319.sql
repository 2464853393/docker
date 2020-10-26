/*
Navicat MySQL Data Transfer

Source Server         : 10.221.121.2_3306
Source Server Version : 50715
Source Host           : 10.221.121.2:3306
Source Database       : datagov

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2019-03-19 09:42:49
*/

DROP DATABASE IF EXISTS `datagov`;
CREATE DATABASE `datagov` DEFAULT CHARACTER SET 'utf8';
use `datagov`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for check_result_count
-- ----------------------------
DROP TABLE IF EXISTS `check_result_count`;
CREATE TABLE `check_result_count` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `design_table_info_id` bigint(11) DEFAULT NULL,
  `task_his_id` bigint(11) DEFAULT NULL,
  `table_name` varchar(20) DEFAULT NULL COMMENT '表名',
  `design_source_id` bigint(11) DEFAULT NULL,
  `error_data_num` int(11) DEFAULT NULL COMMENT '问题数据条数',
  `owner` varchar(20) DEFAULT NULL COMMENT '问题责任人',
  `status` int(2) DEFAULT '0' COMMENT '状态(0:待处理，1:已处理)',
  `deal_people` varchar(20) DEFAULT NULL COMMENT '问题处理人',
  `deal_time` datetime DEFAULT NULL COMMENT '问题处理时间',
  `deal_comment` varchar(50) DEFAULT NULL COMMENT '处理情况详情',
  `column_names` varchar(255) DEFAULT NULL COMMENT '表的字段名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of check_result_count
-- ----------------------------

-- ----------------------------
-- Table structure for check_result_detail
-- ----------------------------
DROP TABLE IF EXISTS `check_result_detail`;
CREATE TABLE `check_result_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `result_count_id` bigint(11) DEFAULT NULL,
  `data_detail` text,
  PRIMARY KEY (`id`),
  KEY `result_count_id` (`result_count_id`)
) ENGINE=InnoDB AUTO_INCREMENT=730642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of check_result_detail
-- ----------------------------

-- ----------------------------
-- Table structure for design_change_info
-- ----------------------------
DROP TABLE IF EXISTS `design_change_info`;
CREATE TABLE `design_change_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `table_name` varchar(100) DEFAULT NULL COMMENT '表名称',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '质量规则的id',
  `before_detail` varchar(255) DEFAULT NULL COMMENT '之前的detail的id',
  `current_detail` varchar(255) DEFAULT NULL COMMENT '现在的detail的id',
  `delete_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='质量设计中的变更信息';

-- ----------------------------
-- Records of design_change_info
-- ----------------------------

-- ----------------------------
-- Table structure for design_source_info
-- ----------------------------
DROP TABLE IF EXISTS `design_source_info`;
CREATE TABLE `design_source_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `rule_change_notice` varchar(255) DEFAULT NULL COMMENT '是否有变更通知，有-Y ,没有-N',
  `delete_flag` char(1) DEFAULT NULL COMMENT '删除标志 0-未删除  1-已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of design_source_info
-- ----------------------------

-- ----------------------------
-- Table structure for design_table_info
-- ----------------------------
DROP TABLE IF EXISTS `design_table_info`;
CREATE TABLE `design_table_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `design_source_id` bigint(20) DEFAULT NULL COMMENT '质量设计源信息的id',
  `task_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务名称',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名称',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '对应的质量规则的id',
  `status` varchar(255) DEFAULT NULL COMMENT '状态：0-草稿，2-已提交，3-未配置，4-变更中',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `delete_flag` char(1) DEFAULT NULL COMMENT '0新建1删除',
  `cycle_type` varchar(255) DEFAULT NULL COMMENT '执行方式：0-一次性   1-周期性',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `job_cron` varchar(255) DEFAULT NULL COMMENT '调度频率',
  `trigger_time` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发时间',
  `move_rightdata` char(1) DEFAULT NULL COMMENT '是否移动正确数据',
  `move_errordata` char(1) DEFAULT NULL COMMENT '是否移动错误数据：是-Y,否-N',
  `right_source_id` bigint(20) DEFAULT NULL COMMENT '正确的数据源库',
  `error_source_id` bigint(20) DEFAULT NULL COMMENT '错误的数据源',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务描述',
  `change_notice` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '变更通知',
  `task_detail` text CHARACTER SET utf8 COMMENT '任务详情',
  `alarm_id` bigint(20) DEFAULT NULL COMMENT '报警设置的id',
  `is_rule_change` char(1) DEFAULT NULL COMMENT '质量规则是否有变动，如果有-Y,该参数是针对状态为已提交和变更中的',
  `is_dispatch` tinyint(3) DEFAULT NULL COMMENT '是否已经配置了调度   0-否 1-是',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2798 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='质量设计中表的质量任务详情';

-- ----------------------------
-- Records of design_table_info
-- ----------------------------

-- ----------------------------
-- Table structure for main_data
-- ----------------------------
DROP TABLE IF EXISTS `main_data`;
CREATE TABLE `main_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户数据源id',
  `data_name` varchar(50) DEFAULT NULL COMMENT '数据资产名称',
  `data_source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更改时间',
  `server_address` varchar(50) DEFAULT NULL COMMENT '服务地址',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `isdel` int(1) DEFAULT NULL COMMENT '删除标志位 0:未删除    1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存放用户主数据库的表';

-- ----------------------------
-- Records of main_data
-- ----------------------------

-- ----------------------------
-- Table structure for main_data_detail
-- ----------------------------
DROP TABLE IF EXISTS `main_data_detail`;
CREATE TABLE `main_data_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `main_data_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主数据id',
  `table_name` varchar(50) DEFAULT NULL COMMENT '表名--库.表',
  `isdel` int(1) DEFAULT NULL COMMENT '删除标志位：0-没删除、1-删除',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存放用户主数据中用户的表';

-- ----------------------------
-- Records of main_data_detail
-- ----------------------------

-- ----------------------------
-- Table structure for quality_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `quality_task_detail`;
CREATE TABLE `quality_task_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `design_table_id` bigint(20) DEFAULT NULL COMMENT '表设计的id',
  `verify_type` varchar(255) DEFAULT NULL COMMENT '校验类型',
  `verify_detail` text COMMENT '校验详情',
  `delete_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `column_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1581 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of quality_task_detail
-- ----------------------------

-- ----------------------------
-- Table structure for security_privilege
-- ----------------------------
DROP TABLE IF EXISTS `security_privilege`;
CREATE TABLE `security_privilege` (
  `id` int(18) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名',
  `parent_id` int(11) DEFAULT NULL COMMENT '父权限id',
  `path` varchar(50) DEFAULT NULL COMMENT 'href  路径',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `type` varchar(50) DEFAULT NULL COMMENT '权限类型',
  `is_parent` varchar(255) DEFAULT 'false',
  `is_menu` int(11) DEFAULT '0' COMMENT '1-菜单  0-不是菜单',
  `iconfont` varchar(100) DEFAULT NULL COMMENT '一级菜单图标',
  `new_path` varchar(255) DEFAULT NULL COMMENT '添加vue前端后增加的新的path',
  `icon` varchar(255) DEFAULT NULL COMMENT '添加新的vue前端后新的icon',
  `operation_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权权限表';

-- ----------------------------
-- Records of security_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for security_role
-- ----------------------------
DROP TABLE IF EXISTS `security_role`;
CREATE TABLE `security_role` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统角色表';

-- ----------------------------
-- Records of security_role
-- ----------------------------

-- ----------------------------
-- Table structure for security_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `security_role_privilege`;
CREATE TABLE `security_role_privilege` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `role_id` int(18) NOT NULL COMMENT '角色id',
  `privilege_id` int(18) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统角色-权限关系表';

-- ----------------------------
-- Records of security_role_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for security_user
-- ----------------------------
DROP TABLE IF EXISTS `security_user`;
CREATE TABLE `security_user` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用户名/昵称',
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录名/账号',
  `login_pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `salt` varchar(255) NOT NULL DEFAULT '1' COMMENT '加密盐值',
  `type` varchar(50) DEFAULT NULL COMMENT '组织类型',
  `org_id` int(18) DEFAULT NULL COMMENT '组织id',
  `tel` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `home_page` varchar(1000) DEFAULT NULL COMMENT '个人首页',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0-正常 1-删除 2-锁定 3-首次登陆',
  `department` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `frist_error_time` bigint(20) DEFAULT '0' COMMENT '首次登陆失败时间',
  `login_error_num` int(11) DEFAULT '0' COMMENT '连续失败次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限用户表';

-- ----------------------------
-- Records of security_user
-- ----------------------------
INSERT INTO `security_user` VALUES ('1', 'nobody', 'nobody', '123', '1', null, null, null, null, null, '0', null, null, '0', '0', null);
INSERT INTO `security_user` VALUES ('2', 'tom', 'tom', '123', '1', null, null, null, null, null, '0', null, null, '0', '0', null);
INSERT INTO `security_user` VALUES ('3', 'janmes', 'janmes', '123', '1', null, null, null, null, null, '0', null, null, '0', '0', null);
INSERT INTO `security_user` VALUES ('4', 'admin', 'admin', 'c4f8cf114cf8b17e537e4031ca0d1ae4', '1', null, null, null, null, null, '0', null, null, '0', '0', null);

-- ----------------------------
-- Table structure for security_user_role
-- ----------------------------
DROP TABLE IF EXISTS `security_user_role`;
CREATE TABLE `security_user_role` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `user_id` int(18) NOT NULL COMMENT '用户id',
  `role_id` int(18) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统用户-角色关系表';

-- ----------------------------
-- Records of security_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sign_in_log
-- ----------------------------
DROP TABLE IF EXISTS `sign_in_log`;
CREATE TABLE `sign_in_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `personnel` varchar(50) DEFAULT NULL,
  `Sign_in_time` datetime DEFAULT NULL COMMENT '登入时间',
  `Sign_ip` varchar(100) DEFAULT NULL COMMENT '登陆IP',
  `Sign_out_time` datetime DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sign_in_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_code
-- ----------------------------
DROP TABLE IF EXISTS `tb_code`;
CREATE TABLE `tb_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT '代码序号',
  `codeset_id` int(10) DEFAULT NULL COMMENT '代码集id',
  `name` varchar(20) DEFAULT NULL COMMENT '代码名称',
  `parent_id` int(10) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL COMMENT '所属目录',
  `status` varchar(10) DEFAULT NULL COMMENT '审核状态(0：草稿 1：待审核 2：已审核)',
  `isdel` int(5) DEFAULT NULL COMMENT '删除标志位',
  `ismenu` varchar(10) DEFAULT NULL COMMENT '是否有下级(0:是，1:否)',
  `unique_code` varchar(255) DEFAULT NULL COMMENT '代码唯一标识码 Code+代码序号',
  `change_info` varchar(255) DEFAULT NULL COMMENT '变更原因',
  `front_status` varchar(10) DEFAULT NULL COMMENT '代码送审前状态值',
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_code
-- ----------------------------

-- ----------------------------
-- Table structure for tb_codeset
-- ----------------------------
DROP TABLE IF EXISTS `tb_codeset`;
CREATE TABLE `tb_codeset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL COMMENT '代码集序号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `parent_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `is_codeset` varchar(10) DEFAULT NULL COMMENT '是否是代码集(0:是，1:否)',
  `explanation` varchar(50) DEFAULT NULL COMMENT '说明',
  `express` varchar(50) DEFAULT NULL COMMENT '表示',
  `code_rule` varchar(50) DEFAULT NULL COMMENT '编码规则',
  `isdel` int(5) DEFAULT NULL COMMENT '删除标志位',
  `unique_code` varchar(255) DEFAULT NULL COMMENT '代码集唯一标识码 CodeSet^+代码集序号',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_codeset
-- ----------------------------

-- ----------------------------
-- Table structure for tb_collect_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect_task`;
CREATE TABLE `tb_collect_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL COMMENT '采集任务名称',
  `datasource_id` int(11) DEFAULT NULL COMMENT 'tb_data_source表主键',
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT NULL COMMENT '0新建1删除',
  `cycle_type` varchar(255) DEFAULT NULL COMMENT '执行方式：0-一次性   1-周期性',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `job_cron` varchar(255) DEFAULT NULL COMMENT '调度频率',
  `trigger_time` varchar(255) DEFAULT NULL COMMENT '出发时间',
  `metadata_menu_id` bigint(20) DEFAULT NULL COMMENT '挂载目录',
  `status` char(1) DEFAULT NULL COMMENT '状态：0-草稿  1-已提交',
  `back_metadata_menu_id` varchar(255) DEFAULT NULL COMMENT '前端回显用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='元数据采集';

-- ----------------------------
-- Records of tb_collect_task
-- ----------------------------

-- ----------------------------
-- Table structure for tb_data_element
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_element`;
CREATE TABLE `tb_data_element` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `data_element_name` varchar(255) DEFAULT NULL COMMENT '数据元名称',
  `data_element_code` varchar(255) DEFAULT NULL COMMENT '数据元英文名',
  `data_element_type` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `data_element_attr` varchar(255) DEFAULT NULL COMMENT '数据元格式',
  `status` tinyint(3) DEFAULT NULL COMMENT '数据元状态 0：草稿 1：待审核 2：已审核 3：变更中',
  `data_element_flag` varchar(255) DEFAULT NULL COMMENT '数据元标记',
  `definition` varchar(255) DEFAULT NULL COMMENT '定义',
  `codeset` varchar(255) DEFAULT NULL COMMENT '值域',
  `regular_expression` varchar(255) DEFAULT NULL COMMENT '正则表达式',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `change_info` varchar(255) DEFAULT NULL COMMENT '变更原因',
  `data_range_front` varchar(11) DEFAULT NULL COMMENT '数据范围起始值',
  `data_range_end` varchar(11) DEFAULT NULL COMMENT '数据范围结束值',
  `unique_code` varchar(255) DEFAULT NULL COMMENT '数据元唯一标识码 英文名+数据类型',
  `front_status` tinyint(3) DEFAULT NULL COMMENT '数据元送审前状态值',
  `isdel` varchar(10) DEFAULT '0' COMMENT '删除标志 0：未删除 1：已删除',
  `code_list` varchar(255) DEFAULT NULL COMMENT '值域目录',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据元信息表';

-- ----------------------------
-- Records of tb_data_element
-- ----------------------------

-- ----------------------------
-- Table structure for tb_data_set
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_set`;
CREATE TABLE `tb_data_set` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `name` varchar(255) DEFAULT NULL COMMENT '元数据名称',
  `code` varchar(255) DEFAULT NULL COMMENT '元数据代码',
  `is_menu` varchar(255) DEFAULT NULL COMMENT '是否属于目录',
  `create_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `descrption` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `status` tinyint(3) DEFAULT NULL COMMENT '数据集状态0：草稿 1：待审核 2：已审核 3：变更中',
  `change_info` varchar(255) DEFAULT NULL COMMENT '变更原因',
  `front_status` tinyint(3) DEFAULT NULL COMMENT '数据元送审前状态值',
  `isdel` varchar(10) DEFAULT NULL COMMENT '删除标志 0：未删除 1：已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_data_set
-- ----------------------------

-- ----------------------------
-- Table structure for tb_data_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_source`;
CREATE TABLE `tb_data_source` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `datasource_name` varchar(50) DEFAULT NULL COMMENT '数据源名称',
  `database_type` varchar(100) DEFAULT NULL COMMENT '数据库类型',
  `character_set` varchar(100) DEFAULT NULL COMMENT '数据库字符集',
  `url` varchar(200) DEFAULT NULL COMMENT '数据源url',
  `user_name` varchar(100) DEFAULT NULL COMMENT '数据库用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '数据库用户密码',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `isdel` int(2) DEFAULT '0' COMMENT '删除标志位',
  `dbname` varchar(100) DEFAULT NULL COMMENT '数据库名',
  `driver` varchar(100) DEFAULT NULL COMMENT '数据库驱动',
  `last_modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `port` varchar(100) DEFAULT NULL COMMENT '端口号',
  `source_layer_id` bigint(20) DEFAULT NULL COMMENT '数据源分层id',
  `department_id` bigint(20) DEFAULT NULL COMMENT '所属部门id',
  `schemas_name` varchar(50) DEFAULT NULL COMMENT '模式名',
  `data_size` decimal(10,4) DEFAULT NULL COMMENT '数据量大小',
  `layer_list` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据源表';

-- ----------------------------
-- Records of tb_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dispatch_alarm
-- ----------------------------
DROP TABLE IF EXISTS `tb_dispatch_alarm`;
CREATE TABLE `tb_dispatch_alarm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alarm_name` varchar(100) DEFAULT NULL COMMENT '报警名称',
  `alarm_reasion` int(1) DEFAULT '0' COMMENT '报警原因，1：成功，0：失败，2:成功+失败',
  `alarm_method` int(1) DEFAULT '0' COMMENT '报警方式，1：邮件，2：短信，3：邮件+短信',
  `receive_people` varchar(100) DEFAULT '' COMMENT '报警接收人，报警人的id用逗号隔开',
  `status` int(1) DEFAULT '0' COMMENT '报警状态：0-关、1-开',
  `is_used` int(1) DEFAULT '0' COMMENT '是否被引用：0-关、1-开',
  `create_people` bigint(18) DEFAULT NULL COMMENT '创建人',
  `update_people` bigint(18) DEFAULT NULL COMMENT '修改者',
  `create_time` datetime DEFAULT NULL COMMENT '创建报警时间',
  `update_time` datetime DEFAULT NULL COMMENT '报警修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调度报警配置表';

-- ----------------------------
-- Records of tb_dispatch_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dispatch_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_dispatch_history`;
CREATE TABLE `tb_dispatch_history` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL COMMENT 'DispatchTask的id',
  `task_type` char(1) DEFAULT NULL COMMENT '任务类型：0-采集任务  1-质量任务',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` char(1) DEFAULT NULL COMMENT '状态：0-执行中 1-成功  2-失败',
  `spent` varchar(255) DEFAULT NULL COMMENT '花费时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='任务执行历史列表';

-- ----------------------------
-- Records of tb_dispatch_history
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dispatch_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_dispatch_task`;
CREATE TABLE `tb_dispatch_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL COMMENT '任务id',
  `task_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `task_type` char(1) DEFAULT NULL COMMENT '任务类型：0-采集任务  1-质量任务',
  `cycle_type` varchar(255) DEFAULT NULL COMMENT '执行方式：0-一次性   1-周期性',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `job_cron` varchar(255) DEFAULT NULL COMMENT '调度频率(0-每月，1-每周，2-每天，3-每小时，4-只执行一次)',
  `trigger_time` varchar(255) DEFAULT NULL COMMENT '触发执行时间',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'quzrtz cron表达式',
  `cron_description` varchar(255) DEFAULT NULL COMMENT 'cron表达式描述',
  `status` char(1) DEFAULT NULL COMMENT '状态：1-启用中 2-暂停 3-已完成',
  `alarm_id` bigint(20) DEFAULT NULL COMMENT '报警id',
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT '0' COMMENT '0新建1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_dispatch_task
-- ----------------------------

-- ----------------------------
-- Table structure for tb_document_contents
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_contents`;
CREATE TABLE `tb_document_contents` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `name` varchar(50) DEFAULT NULL COMMENT '文件目录名称',
  `parent_id` int(10) DEFAULT NULL COMMENT '父目录id',
  `isdel` int(2) DEFAULT NULL COMMENT '删除标志位',
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_document_contents
-- ----------------------------

-- ----------------------------
-- Table structure for tb_document_management
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_management`;
CREATE TABLE `tb_document_management` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '文档名称',
  `type` varchar(5) DEFAULT NULL COMMENT '文件类型(doc,docx,pdf)',
  `file_path` varchar(50) DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `user_id` int(10) DEFAULT NULL,
  `content_id` int(10) DEFAULT NULL COMMENT '所属文件夹id',
  `isdel` int(5) DEFAULT NULL COMMENT '删除标志位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档管理表';

-- ----------------------------
-- Records of tb_document_management
-- ----------------------------

-- ----------------------------
-- Table structure for tb_element_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_element_relation`;
CREATE TABLE `tb_element_relation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(255) DEFAULT NULL COMMENT '数据源id',
  `tablename` varchar(255) DEFAULT NULL COMMENT '表名',
  `fildname` varchar(255) DEFAULT NULL COMMENT '字段名',
  `data_element_id` varchar(255) DEFAULT NULL COMMENT '数据元id',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `isdel` varchar(10) DEFAULT '0' COMMENT '删除标志 0：未删除 1：已删除',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据元关联关系';

-- ----------------------------
-- Records of tb_element_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tb_element_set
-- ----------------------------
DROP TABLE IF EXISTS `tb_element_set`;
CREATE TABLE `tb_element_set` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) DEFAULT NULL COMMENT '数据集id',
  `element_id` int(11) DEFAULT NULL COMMENT '数据元id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据集与数据元的关系表';

-- ----------------------------
-- Records of tb_element_set
-- ----------------------------

-- ----------------------------
-- Table structure for tb_error_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_error_data`;
CREATE TABLE `tb_error_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名称',
  `design_table_id` bigint(20) DEFAULT NULL COMMENT '质量设计任务的id',
  `status` varchar(255) DEFAULT NULL COMMENT '是否已经处理：0-未处理  1-已经处理',
  `deal_user` bigint(20) DEFAULT NULL COMMENT '处理人',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `deal_mesage` varchar(255) DEFAULT NULL COMMENT '处理信息',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='问题数据';

-- ----------------------------
-- Records of tb_error_data
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hbase_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_hbase_source`;
CREATE TABLE `tb_hbase_source` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `datasource_id` bigint(12) DEFAULT NULL COMMENT '数据源id',
  `zk_quorum` varchar(255) DEFAULT NULL COMMENT 'hbase.zookeeper.quorum : xian-yeexun2,xian-yeexun3,xian-yeexun4',
  `rootdir` varchar(255) DEFAULT NULL COMMENT 'hbase.rootdir : hdfs://ip:9000/hbase',
  `distributed` int(1) DEFAULT NULL COMMENT '是否为分布式；0：否   1：是',
  `isdel` int(2) DEFAULT NULL COMMENT '删除标志位',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='hbase的数据源信息';

-- ----------------------------
-- Records of tb_hbase_source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hdfs_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_hdfs_source`;
CREATE TABLE `tb_hdfs_source` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `datasource_id` bigint(20) DEFAULT NULL,
  `have_kerberos` int(1) DEFAULT NULL COMMENT '1-有认证  0-没有认证',
  `keytab_filepath` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `isdel` int(2) DEFAULT NULL COMMENT '删除标志位',
  `java_security_krb5_conf` varchar(255) DEFAULT NULL,
  `hadoop_config` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='存储hdfs的Kerberos的参数';

-- ----------------------------
-- Records of tb_hdfs_source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hive_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_hive_source`;
CREATE TABLE `tb_hive_source` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `data_source_id` bigint(20) DEFAULT '0' COMMENT 'tb_data_source的主键id',
  `server_type` varchar(50) DEFAULT NULL COMMENT 'hiveserver类型',
  `driver` varchar(50) DEFAULT NULL COMMENT 'hive驱动',
  `hive_meta_data_user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `hive_meta_data_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `hive_meta_data_port` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `isdel` int(2) DEFAULT NULL COMMENT '删除标志位',
  `have_kerberos` int(1) DEFAULT NULL COMMENT '1-有认证  0-没有认证',
  `keytab_filepath` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `java_security_krb5_conf` varchar(255) DEFAULT NULL,
  `hadoop_config` text,
  `hive_meta_data_ip` varchar(100) DEFAULT NULL,
  `hive_meta_data_db_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='hive的数据源信息';

-- ----------------------------
-- Records of tb_hive_source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_impala_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_impala_source`;
CREATE TABLE `tb_impala_source` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `data_source_id` bigint(20) DEFAULT '0' COMMENT 'tb_data_source的主键id',
  `driver` varchar(50) DEFAULT NULL COMMENT 'hive驱动',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `port` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `isdel` varchar(10) DEFAULT NULL COMMENT '删除标志位',
  `have_kerberos` int(1) DEFAULT NULL COMMENT '1-有认证  0-没有认证',
  `keytab_filepath` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `java_security_krb5_conf` varchar(255) DEFAULT NULL,
  `hadoop_config` text,
  `kudu_master_address` varchar(255) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `dbname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='hive的数据源信息';

-- ----------------------------
-- Records of tb_impala_source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_md_relation_version
-- ----------------------------
DROP TABLE IF EXISTS `tb_md_relation_version`;
CREATE TABLE `tb_md_relation_version` (
  `Id` int(11) NOT NULL,
  `start_meta_id` bigint(20) DEFAULT NULL COMMENT '血统元数据id',
  `end_meta_id` bigint(20) DEFAULT NULL COMMENT '影响元数据id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version_id` bigint(20) DEFAULT NULL COMMENT '版本id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='带版本号的元数据关联关系';

-- ----------------------------
-- Records of tb_md_relation_version
-- ----------------------------

-- ----------------------------
-- Table structure for tb_metadata
-- ----------------------------
DROP TABLE IF EXISTS `tb_metadata`;
CREATE TABLE `tb_metadata` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '元数据名称',
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '元数据代码',
  `parent_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_menu` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '是否属于目录 Y-是目录  N-不是目录',
  `buildin` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为内置的元数据',
  `metamodel_id` bigint(20) DEFAULT NULL COMMENT '元模型id',
  `create_user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '路径',
  `source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `metadata_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类型：0：业务元数据 1：技术元数据  2：管理元数据',
  `unique_code` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一标志符',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  `is_release` tinyint(3) DEFAULT NULL COMMENT '是否发布 0否 1是  2丢弃',
  `collect_id` bigint(20) DEFAULT NULL COMMENT '元数据采集历史id',
  `version_description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '版本描述',
  `delete_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`Id`),
  KEY `clct_meta_sour` (`metamodel_id`,`source_id`,`collect_id`),
  KEY `sour_parcode_code_meta_clct` (`code`,`parent_code`,`metamodel_id`,`source_id`,`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='元数据信息表';

-- ----------------------------
-- Records of tb_metadata
-- ----------------------------
INSERT INTO `tb_metadata` VALUES ('1', '0', '数据源分层', 'BUSSINESS_DATASOURCE_LAYER', null, 'Y', 'Y', null, '2', '/', null, null, null, '0', 'BUSSINESS_DATASOURCE_LAYER', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('2', '0', '数据元', 'BUSSINESS_DATA_ELEMENT', null, 'Y', 'Y', null, '2', '/', null, null, null, '0', 'BUSSINESS_DATA_ELEMENT', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('3', '0', '业务术语', 'BUSSINESS_CODE_SET', null, 'Y', 'Y', null, '2', '/', null, null, null, '0', 'BUSSINESS_CODE_SET', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('4', '0', '质量规则', 'BUSSINESS_QUALITY_RULE', null, 'Y', 'Y', null, '2', '/', null, null, null, '0', 'BUSSINESS_QUALITY_RULE', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('5', '0', '关系型数据库', 'TECHNOLOGY_RETALATIONAL', null, 'Y', 'Y', null, '2', '/', null, null, null, '1', 'TECHNOLOGY_RETALATIONAL', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('6', '0', '大数据库', 'TECHNOLOGY_BIGDATA', null, 'Y', 'Y', null, '2', '/', null, null, null, '1', 'TECHNOLOGY_BIGDATA', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('9', '0', '关系型数据权限', 'MANAGEMENT_RETALATIONAL', null, 'Y', 'Y', null, '2', '/', null, null, null, '2', 'MANAGEMENT_RETALATIONAL', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('10', '0', '大数据权限', 'MANAGEMENT_BIGDATA', null, 'Y', 'Y', null, '2', '/', null, null, null, '2', 'MANAGEMENT_BIGDATA', '1', null, null, null, '0');
INSERT INTO `tb_metadata` VALUES ('11', '1', '接入层', 'DataSourceLayer^37', null, 'N', 'Y', '26', '0', '/', null, '2018-12-28 14:52:26', '2018-12-28 14:52:26', '0', 'DataSourceLayer^37', '1', '1', null, '修改', '0');
INSERT INTO `tb_metadata` VALUES ('12', '1', '明细层', 'DataSourceLayer^38', null, 'N', 'Y', '26', '0', '/', null, '2018-12-28 14:52:37', '2018-12-28 14:52:37', '0', 'DataSourceLayer^38', '1', '1', null, '修改', '0');
INSERT INTO `tb_metadata` VALUES ('13', '1', '汇总层', 'DataSourceLayer^39', null, 'N', 'Y', '26', '0', '/', null, '2018-12-28 14:52:48', '2018-12-28 14:52:48', '0', 'DataSourceLayer^39', '1', '1', null, '修改', '0');
INSERT INTO `tb_metadata` VALUES ('14', '1', '应用层', 'DataSourceLayer^40', null, 'N', 'Y', '26', '0', '/', null, '2018-12-28 14:53:01', '2018-12-28 14:53:01', '0', 'DataSourceLayer^40', '1', '1', null, '修改', '0');

-- ----------------------------
-- Table structure for tb_metadata_attr
-- ----------------------------
DROP TABLE IF EXISTS `tb_metadata_attr`;
CREATE TABLE `tb_metadata_attr` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_id` bigint(20) DEFAULT NULL COMMENT '元数据id',
  `model_attr_id` bigint(20) DEFAULT NULL COMMENT '元模型的属性id：是什么属性',
  `attr_value` text COMMENT '属性值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`),
  KEY `model_attr_id` (`model_attr_id`),
  KEY `metadata_id` (`metadata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1782152 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元数据属性表';

-- ----------------------------
-- Records of tb_metadata_attr
-- ----------------------------
INSERT INTO `tb_metadata_attr` VALUES ('1', '11', '46', '接入层', '2018-12-28 14:52:26', '0', '2018-12-28 14:52:26');
INSERT INTO `tb_metadata_attr` VALUES ('2', '11', '47', null, '2018-12-28 14:52:26', '0', '2018-12-28 14:52:26');
INSERT INTO `tb_metadata_attr` VALUES ('3', '11', '48', '接入层', '2018-12-28 14:52:26', '0', '2018-12-28 14:52:26');
INSERT INTO `tb_metadata_attr` VALUES ('4', '11', '49', 'Fri Dec 28 14:52:26 CST 2018', '2018-12-28 14:52:26', '0', '2018-12-28 14:52:26');
INSERT INTO `tb_metadata_attr` VALUES ('5', '11', '50', 'Fri Dec 28 14:52:25 CST 2018', '2018-12-28 14:52:26', '0', '2018-12-28 14:52:26');
INSERT INTO `tb_metadata_attr` VALUES ('6', '12', '46', '明细层', '2018-12-28 14:52:37', '0', '2018-12-28 14:52:37');
INSERT INTO `tb_metadata_attr` VALUES ('7', '12', '47', null, '2018-12-28 14:52:37', '0', '2018-12-28 14:52:37');
INSERT INTO `tb_metadata_attr` VALUES ('8', '12', '48', '明细层', '2018-12-28 14:52:37', '0', '2018-12-28 14:52:37');
INSERT INTO `tb_metadata_attr` VALUES ('9', '12', '49', 'Fri Dec 28 14:52:37 CST 2018', '2018-12-28 14:52:37', '0', '2018-12-28 14:52:37');
INSERT INTO `tb_metadata_attr` VALUES ('10', '12', '50', 'Fri Dec 28 14:52:36 CST 2018', '2018-12-28 14:52:37', '0', '2018-12-28 14:52:37');
INSERT INTO `tb_metadata_attr` VALUES ('11', '13', '46', '汇总层', '2018-12-28 14:52:48', '0', '2018-12-28 14:52:48');
INSERT INTO `tb_metadata_attr` VALUES ('12', '13', '47', null, '2018-12-28 14:52:48', '0', '2018-12-28 14:52:48');
INSERT INTO `tb_metadata_attr` VALUES ('13', '13', '48', '汇总层', '2018-12-28 14:52:48', '0', '2018-12-28 14:52:48');
INSERT INTO `tb_metadata_attr` VALUES ('14', '13', '49', 'Fri Dec 28 14:52:47 CST 2018', '2018-12-28 14:52:48', '0', '2018-12-28 14:52:48');
INSERT INTO `tb_metadata_attr` VALUES ('15', '13', '50', 'Fri Dec 28 14:52:47 CST 2018', '2018-12-28 14:52:48', '0', '2018-12-28 14:52:48');
INSERT INTO `tb_metadata_attr` VALUES ('16', '14', '46', '应用层', '2018-12-28 14:53:01', '0', '2018-12-28 14:53:01');
INSERT INTO `tb_metadata_attr` VALUES ('17', '14', '47', null, '2018-12-28 14:53:01', '0', '2018-12-28 14:53:01');
INSERT INTO `tb_metadata_attr` VALUES ('18', '14', '48', '应用层', '2018-12-28 14:53:01', '0', '2018-12-28 14:53:01');
INSERT INTO `tb_metadata_attr` VALUES ('19', '14', '49', 'Fri Dec 28 14:53:00 CST 2018', '2018-12-28 14:53:01', '0', '2018-12-28 14:53:01');
INSERT INTO `tb_metadata_attr` VALUES ('20', '14', '50', 'Fri Dec 28 14:53:00 CST 2018', '2018-12-28 14:53:01', '0', '2018-12-28 14:53:01');

-- ----------------------------
-- Table structure for tb_metadata_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_metadata_relation`;
CREATE TABLE `tb_metadata_relation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `start_meta_id` bigint(20) DEFAULT NULL COMMENT '血统元数据id',
  `end_meta_id` bigint(20) DEFAULT NULL COMMENT '影响元数据id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元数据关联关系表';

-- ----------------------------
-- Records of tb_metadata_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tb_metamodel
-- ----------------------------
DROP TABLE IF EXISTS `tb_metamodel`;
CREATE TABLE `tb_metamodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '元模型代码',
  `name` varchar(255) DEFAULT NULL COMMENT '元模型名称',
  `ico_id` char(20) DEFAULT NULL COMMENT '图标的id',
  `discription` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建用户',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改用户',
  `is_menu` char(1) DEFAULT NULL COMMENT '是否是菜单',
  `buildin` char(1) DEFAULT NULL COMMENT '是否为内置的元模型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元模型表';

-- ----------------------------
-- Records of tb_metamodel
-- ----------------------------
INSERT INTO `tb_metamodel` VALUES ('1', '-1', 'BUSSINESS', '业务元数据', null, '业务元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('2', '4', 'BUSSINESS_DATA_ELEMENT', '数据元', null, '数据元', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('3', '4', 'BUSSINESS_CODE_SET', '代码集', null, '代码集', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('4', '1', 'BUSSINESS_STANDARD_PACKAGE', '数据标准包', null, '数据标准包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('5', '-1', 'TECHNOLOGY', '技术元数据', null, '技术元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('6', '1', 'BUSSINESS_QUALITY_RULE_PACKAGE', '质量规则包', null, '质量规则包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('7', '1', 'BUSSINESS_DATASOURCE_LAYER_PACKAGE', '数据源层包', null, '数据源层包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('8', '5', 'TECHNOLOGY_RETALATIONAL_PACKAGE', '关系型包', null, '关系型包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('9', '5', 'TECHNOLOGY_BIGDATA_PACKAGE', '大数据包', null, '大数据包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('10', '5', 'TECHNOLOGY_TOOLS_PACKAGE', '工具包', null, '工具包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('11', '-1', 'MANAGEMENT', '管理元数据', null, '管理元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('12', '11', 'MANAGEMENT_DATASOURCE_PERMISSIONS_PACKAGE', '数据源权限', null, '数据源权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('13', '9', 'TECHNOLOGY_HDFS', 'HDFS', null, 'HDFS', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('14', '9', 'TECHNOLOGY_HIVE', 'HIVE', null, 'HIVE', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('15', '9', 'TECHNOLOGY_HBASE', 'HBASE', null, 'HBASE', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('16', '0', 'TECHNOLOGY_ES', 'ELASTICSEARCH', null, 'ELASTICSEARCH', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('18', '10', 'TECHNOLOGY_SDCQUALITY', 'SDC QUALITY', null, 'SDC QUALITY', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('19', '12', 'MANAGEMENT_DATASOURCE_PERMISSIONS_DB', 'DB数据源权限', null, 'DB数据源权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('20', '12', 'MANAGEMENT_DATASOURCE_PERMISSIONS_HIVE', '大数据HIVE权限', null, '大数据HIVE权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel` VALUES ('21', '2', 'DataElement', '数据元', 'metamod1', '数据元的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('22', '3', 'CodeSet', '代码集', 'metamod2', '代码集的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('23', '3', 'Code', '代码', 'metamod32', '代码的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('24', '6', 'QualityRule', '质量规则', 'metamod3', '质量规则的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('25', '6', 'CheckObject', '校验对象', 'metamod4', '校验对象的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('26', '7', 'DataSourceLayer', '数据源分层', 'metamod5', '数据源分层的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('27', '8', 'DBDatabase', '数据库', 'metamod6', '关系型数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('28', '8', 'DBTable', '表', 'metamod7', '表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('29', '8', 'DBColumns', '字段', 'metamod8', '字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('30', '8', 'DBPrimaryKey', '主键', 'metamod9', '主键的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('31', '8', 'DBForeignKey', '外键', 'metamod10', '外键的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('32', '8', 'DBView', '视图', 'metamod11', '视图的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('33', '8', 'DBIndex', '索引', 'metamod12', '索引的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('34', '13', 'HdfsFileSystem', '文件系统', 'metamod13', 'HDFS文件系统的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('35', '13', 'HdfsFolder', '文件夹', 'metamod14', 'HDFS文件夹的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('36', '13', 'HdfsFile', '文件', 'metamod15', 'HDFS文件的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('37', '14', 'HiveDatabase', 'Hive数据库', 'metamod16', 'Hive数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('38', '14', 'HiveTable', 'Hive表', 'metamod17', 'Hive表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('39', '14', 'HiveColumns', 'Hive字段', 'metamod18', 'Hive字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('40', '15', 'HbaseNameSpace', '命名空间', 'metamod19', 'Hbase命名空间的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('41', '15', 'HbaseTable', 'Hbase表', 'metamod20', 'Hbase表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('42', '15', 'HbaseFamily', '列族', 'metamod21', 'Hbase的列族元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('43', '15', 'HbaseCell', '成员', 'metamod22', 'Hbase成员的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('44', '0', 'ESDataBase', '数据库', null, 'ES共享库数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('45', '0', 'ESTable', '表', null, 'ES共享库表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('46', '0', 'ESColumns', '字段', null, '字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('59', '18', 'QualityTask', '质量任务', 'metamod23', '质量任务描述', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('60', '18', 'QualityScript', '脚本', 'metamod24', '质量脚本的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('61', '18', 'QualityInputSource', '输入源', 'metamod25', '输入源的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('62', '18', 'QualityInputInstance', '输入源实例', 'metamod26', '质量输入源实例的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('63', '18', 'QualityInputObject', '输入源对象', 'metamod27', '输入源对象的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('64', '19', 'DBAuthority', 'DB数据库权限', 'metamod28', '数据库权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('65', '19', 'DBTableAuthority', 'DB表权限', 'metamod29', '表权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('66', '20', 'HiveAuthority', 'Hive数据库权限', 'metamod30', 'Hive数据库权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel` VALUES ('67', '20', 'HiveTableAuthority', 'Hive表权限', 'metamod31', 'Hive表权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');

-- ----------------------------
-- Table structure for tb_metamodel_attr
-- ----------------------------
DROP TABLE IF EXISTS `tb_metamodel_attr`;
CREATE TABLE `tb_metamodel_attr` (
  `id` bigint(20) NOT NULL,
  `model_id` bigint(20) DEFAULT NULL COMMENT '元模型id',
  `code` varchar(255) DEFAULT NULL COMMENT '属性代码',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `length` int(11) DEFAULT NULL COMMENT '长度',
  `readable` char(1) DEFAULT NULL COMMENT '是否可读：Y-可读  N-不可读',
  `required` char(1) DEFAULT NULL,
  `buildin` char(1) DEFAULT NULL COMMENT '是否内置',
  `controls_type` varchar(255) DEFAULT NULL COMMENT '控制类型',
  `sort_key` int(11) DEFAULT NULL COMMENT '属性排序',
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元模型属性表';

-- ----------------------------
-- Records of tb_metamodel_attr
-- ----------------------------
INSERT INTO `tb_metamodel_attr` VALUES ('1', '21', 'DataElementName', '数据元名称', 'string', '300', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515223687000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('2', '21', 'DataElementFlag', '数据元标记', 'string', '50', 'Y', 'Y', 'Y', '1', '2', '1521261509000', '1515223687000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('3', '21', 'DataElementType', '数据元类型', 'string', '10', 'Y', 'Y', 'Y', '1', '3', '1521261509000', '1515223687000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('4', '21', 'DataElementFormat', '数据元格式', 'string', '20', 'Y', 'Y', 'Y', '1', '4', '1521261509000', '1515223687000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('5', '21', 'Definition', '定义', 'string', '300', 'Y', 'N', 'Y', '1', '5', '1521261509000', '1515223687000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('6', '21', 'CodeSet', '值域', 'string', '330', 'Y', 'N', 'Y', '1', '6', '1521261509000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('7', '21', 'Range', '数据范围', 'string', '30', 'Y', 'N', 'Y', '1', '7', '1521261509000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('8', '21', 'RegularExpression', '正则表达式', 'string', '1000', 'Y', 'N', 'Y', '1', '8', '1521261509000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('9', '21', 'Remark', '备注', 'string', '1000', 'Y', 'N', 'Y', '1', '9', '1521261509000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('10', '21', 'Classification', '数据元分类', 'string', '300', 'Y', 'N', 'Y', '1', '10', '1521261509000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('11', '21', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '11', '1521261536000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('12', '21', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '12', '1521261536000', '1515223688000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('13', '21', 'VersionNum', '版本号', 'string', '100', 'Y', 'Y', 'Y', '1', '13', '1521261509000', '1515223689000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('14', '22', 'CodeSetName', '代码集名称', 'string', '300', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515223866000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('15', '22', 'CodeSetNUM', '代码集序号', 'string', '20', 'Y', 'Y', 'Y', '1', '2', '1521261509000', '1515223866000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('16', '22', 'Illustration', '说明', 'string', '300', 'Y', 'N', 'Y', '1', '3', '1521261560000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('17', '22', 'Expression', '表示', 'string', '300', 'Y', 'N', 'Y', '1', '4', '1521261561000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('18', '22', 'CodeRules', '编码规则', 'string', '300', 'Y', 'N', 'Y', '1', '5', '1521261565000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('19', '22', 'Classification', '目录分类', 'string', '300', 'Y', 'Y', 'Y', '1', '6', '1521261509000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('20', '22', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '7', '1521261536000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('21', '22', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '8', '1521261536000', '1515223867000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('22', '23', 'CodeName', '代码名称', 'string', '300', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('23', '23', 'CodeID', '代码', 'string', '50', 'Y', 'Y', 'Y', '1', '2', '1521261509000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('24', '23', 'SuperiorCodeName', '上级代码名称', 'string', '300', 'Y', 'N', 'Y', '1', '3', '1521261708000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('25', '23', 'SuperiorCodeID', '上级代码', 'string', '50', 'Y', 'N', 'Y', '1', '4', '1521261710000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('26', '23', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '5', '1521261677000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('27', '23', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '6', '1521261677000', '1515224142000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('28', '24', 'RuleName', '规则名称', 'string', '256', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515224346000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('29', '24', 'DataSource', '所属数据源', 'string', '256', 'Y', 'Y', 'Y', '1', '2', '1521261509000', '1515224346000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('30', '24', 'ColumnNumber', '字段个数', 'string', '8', 'Y', 'Y', 'Y', '1', '3', '1521261509000', '1515224346000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('31', '24', 'CheckFieldNumber', '校验字段数', 'string', '8', 'Y', 'Y', 'Y', '1', '4', '1521261509000', '1515224346000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('32', '24', 'RuleTotal', '规则总数', 'string', '8', 'Y', 'Y', 'Y', '1', '5', '1521261509000', '1515224347000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('33', '24', 'Status', '状态', 'string', '8', 'Y', 'Y', 'Y', '1', '6', '1521261509000', '1515224347000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('34', '24', 'ResponsiblePerson', '问题责任人', 'string', '1024', 'Y', 'N', 'Y', '1', '7', '1521261781000', '1515224347000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('35', '24', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '8', '1521261677000', '1515224347000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('36', '24', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '9', '1521261677000', '1515224347000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('37', '25', 'ColumnName', '字段名称', 'string', '50', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515224904000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('38', '25', 'IsDataFormatStart', '是否启用数据格式校验', 'string', '8', 'Y', 'Y', 'Y', '1', '2', '1521261509000', '1515224904000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('39', '25', 'IsCodeSetStart', '是否启用值域校验', 'string', '8', 'Y', 'Y', 'Y', '1', '3', '1521261509000', '1515224904000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('40', '25', 'IsRangeStart', '是否启用数据范围校验', 'string', '8', 'Y', 'Y', 'Y', '1', '4', '1521261509000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('41', '25', 'IsRegularExpressionStart', '是否启用正则表达式校验', 'string', '8', 'Y', 'Y', 'Y', '1', '5', '1521261509000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('42', '25', 'IsNullValueStart', '是否启用空值校验', 'string', '8', 'Y', 'Y', 'Y', '1', '6', '1521261509000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('43', '25', 'Status', '状态', 'string', '8', 'Y', 'Y', 'Y', '1', '7', '1521261509000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('44', '25', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '8', '1521261677000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('45', '25', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '9', '1521261677000', '1515224905000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('46', '26', 'LayerName', '分层名称', 'string', '32', 'Y', 'Y', 'Y', '1', '1', '1521261509000', '1515225114000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('47', '26', 'SuperiorLayer', '上级分层', 'string', '32', 'Y', 'N', 'Y', '1', '2', '1521261948000', '1515225114000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('48', '26', 'LayerRemark', '分层描述', 'string', '500', 'Y', 'N', 'Y', '1', '3', '1521261950000', '1515225114000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('49', '26', 'CreateTime', '创建时间', 'date', null, 'Y', 'Y', 'Y', '1', '4', '1521261677000', '1515225114000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('50', '26', 'UpdateTime', '更新时间', 'date', null, 'Y', 'Y', 'Y', '1', '5', '1521261677000', '1515225114000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('51', '27', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'Y', 'Y', '1', '8', '1521262145000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('52', '27', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('53', '27', 'DBPort', '端口', 'string', '16', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515205535000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('54', '27', 'DatabaseName', '数据库名', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515205535000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('55', '27', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('56', '27', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('57', '27', 'Password', '密码', 'string', '64', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515205535000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('58', '27', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'Y', 'Y', '1', '7', '1521262144000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('59', '27', 'CharacterSet', '字符集', 'string', '128', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('60', '27', 'SortRules', '排序规则', 'string', '16', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('61', '27', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '11', '1521261677000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('62', '28', 'TableSpaceName', '表空间', 'string', '1000', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515205676000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('63', '28', 'CreateTime', '表创建时间', 'date', null, 'N', 'N', 'Y', '1', '2', '1521261677000', '1515205677000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('64', '28', 'Description', '描述', 'string', '2000', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515205677000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('65', '29', 'IsPK', '是否主键', 'string', '8', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515205880000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('66', '29', 'IsFK', '是否外键', 'string', '8', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515205880000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('67', '29', 'InitialValue', '初始值', 'string', '2048', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('68', '29', 'Nullable', '是否可空', 'string', '8', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('69', '29', 'IsUnique', '是否业务唯一', 'string', '8', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('70', '29', 'ColumnSize', '长度', 'string', '8', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('71', '29', 'Precision', '精度', 'string', '8', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('72', '29', 'DecimalDigits', '小数位数', 'string', '8', 'N', 'N', 'Y', '1', '8', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('73', '29', 'DataType', '数据类型', 'string', '64', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515205881000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('74', '29', 'DataTypeName', '数据类型名称', 'string', '1024', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515205882000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('75', '29', 'Note', '注释', 'string', '2048', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515205882000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('76', '30', 'KeySeq', '主键次序', 'string', '64', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515206011000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('77', '30', 'TableName', '表名称', 'string', '64', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515206011000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('78', '30', 'ColumnName', '列名称', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515206011000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('79', '31', 'FKColumnName', '字段名称', 'string', '200', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515206176000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('80', '31', 'ReferenceDatabase', '参考数据库', 'string', '1024', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515206176000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('81', '31', 'ReferenceTableName', '参考表', 'string', '1024', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515206177000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('82', '31', 'ReferenceColumnName', '参考字段', 'string', '1024', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515206177000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('83', '32', 'SQL', 'SQL', 'string', '4096', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515206279000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('84', '32', 'DDL', '视图定义', 'string', '2048', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515206280000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('85', '33', 'ColumnName', '列名称', 'string', '64', 'N', 'N', 'Y', '1', '1', '1521261509000', '1516342499000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('86', '33', 'IsUnique', '是否为唯一索引', 'string', '8', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515206411000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('87', '33', 'IndexType', '索引类型', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515206412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('88', '33', 'OrdinalPosition', '初始位置', 'string', '128', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515206412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('89', '33', 'Pages', '页数', 'string', '50', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515206412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('90', '34', 'HdfsPort', 'HDFS地址对应的端口', 'string', '10', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515207942000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('91', '34', 'HdfsIp', 'HDFS文件系统地址IP', 'string', '20', 'N', 'N', 'Y', '1', '2', '1522240146000', '1515207942000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('92', '34', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'Y', 'Y', '1', '3', '1521262144000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('93', '35', 'HdfsFolderName', '文件夹名称', 'string', '512', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('94', '35', 'HdfsFolderPath', '路径', 'string', '512', 'N', 'N', 'Y', '1', '2', '1522240173000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('95', '35', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '3', '1522240173000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('96', '35', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '4', '1522240175000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('97', '35', 'HdfsFolderOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '5', '1522240188000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('98', '35', 'HdfsFolderGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '6', '1522240189000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('99', '35', 'HdfsFolderLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '7', '1522240189000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('100', '35', 'HdfsFolderBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '8', '1522240190000', '1515208158000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('101', '35', 'HdfsFolderReplication', '副本数', 'string', '8', 'N', 'N', 'Y', '1', '9', '1522240190000', '1515208159000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('102', '35', 'HdfsFolderPermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '10', '1522240193000', '1515208159000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('103', '36', 'HdfsFileName', '文件名称', 'string', '512', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515208356000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('104', '36', 'HdfsFilePath', '文件路径', 'string', '512', 'N', 'N', 'Y', '1', '2', '1522240210000', '1515208356000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('105', '36', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '3', '1522240211000', '1515208356000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('106', '36', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '4', '1522240212000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('107', '36', 'HdfsFileOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '5', '1522240212000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('108', '36', 'HdfsFileGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '6', '1522240213000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('109', '36', 'HdfsFileLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '7', '1522240213000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('110', '36', 'HdfsFileBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '8', '1522240214000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('111', '36', 'HdfsFileReplication', '文件副本数', 'string', '8', 'N', 'N', 'Y', '1', '9', '1522240215000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('112', '36', 'HdfsFilePermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '10', '1522240217000', '1515208357000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('113', '37', 'HiveDataBaseIP', '数据库IP', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515208792000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('114', '37', 'HiveDataBasePort', '数据库端口', 'string', '16', 'N', 'N', 'Y', '1', '2', '1522240021000', '1515208793000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('115', '37', 'HiveDataBaseName', '数据库名', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522240022000', '1515208793000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('116', '37', 'HiveDataBaseOwner', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '4', '1522240024000', '1515208793000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('117', '37', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'Y', 'Y', '1', '5', '1521262144000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('118', '39', 'ColumnSeq', '字段顺序', 'string', '20', 'N', 'N', 'Y', '1', '1', '1521261509000', '1521261509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('119', '39', 'ColmType', '字段类型', 'string', '50', 'N', 'N', 'Y', '1', '2', '1521261509000', '1521261509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('120', '39', 'ColmSize', '字段长度', 'string', '8', 'N', 'N', 'Y', '1', '3', '1521261509000', '1521261509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('121', '39', 'IsBucketCol', '是否桶字段', 'string', '10', 'N', 'N', 'Y', '1', '4', '1521261509000', '1521261509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('122', '39', 'IsPartCol', '是否分区字段', 'string', '10', 'N', 'N', 'Y', '1', '5', '1521261509000', '1521261509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('123', '40', 'ZookeeperQuorum', 'Hbase集群地址', 'string', '16', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515207328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('124', '40', 'ZookeeperClientPort', '集群端口', 'string', '8', 'N', 'N', 'Y', '1', '2', '1522239173000', '1515207328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('125', '40', 'Master', 'Hbase主机', 'string', '16', 'N', 'N', 'Y', '1', '3', '1522239178000', '1515207329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('126', '40', 'MasterPort', '主机端口', 'string', '8', 'N', 'N', 'Y', '1', '4', '1522239179000', '1515207329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('127', '40', 'Admin', '用户', 'string', '16', 'N', 'N', 'Y', '1', '5', '1522239181000', '1515207329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('128', '40', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'Y', 'Y', '1', '7', '1521262144000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('129', '41', 'MaxRegionSize', '最大区域大小', 'string', '64', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515207445000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('130', '41', 'MinRegionSize', '最小区域大小', 'string', '64', 'N', 'N', 'Y', '1', '2', '1522239217000', '1515207445000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('131', '41', 'MemstoreSize', '内存大小', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522239219000', '1515207445000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('132', '41', 'ColumnFamilyCount', '列族个数', 'string', '64', 'N', 'N', 'Y', '1', '4', '1522239221000', '1515207445000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('133', '41', 'Regition', '副本数', 'string', '64', 'N', 'N', 'Y', '1', '5', '1522239222000', '1515207446000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('134', '41', 'Priority', '优先权', 'string', '64', 'N', 'N', 'Y', '1', '6', '1522239224000', '1515207446000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('135', '42', 'DataBlockEncode', '信息组编码', 'string', '500', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515207798000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('136', '42', 'BloomFilter', '布隆过滤器', 'string', '500', 'N', 'N', 'Y', '1', '2', '1522239252000', '1515207798000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('137', '42', 'BlockCache', '块缓存', 'string', '500', 'N', 'N', 'Y', '1', '3', '1522239253000', '1515207798000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('138', '42', 'Configuration', '结构', 'string', '500', 'N', 'N', 'Y', '1', '4', '1522239254000', '1515207798000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('139', '42', 'ReplicationScope', '拷贝范围', 'string', '500', 'N', 'N', 'Y', '1', '5', '1522239254000', '1515207798000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('140', '42', 'Versions', '版本', 'string', '500', 'N', 'N', 'Y', '1', '6', '1522239255000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('141', '42', 'Compression', '压缩', 'string', '500', 'N', 'N', 'Y', '1', '7', '1522239256000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('142', '42', 'MinVersions', '最小版本', 'string', '500', 'N', 'N', 'Y', '1', '8', '1522239256000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('143', '42', 'TTL', '生存周期', 'string', '500', 'N', 'N', 'Y', '1', '9', '1522239257000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('144', '42', 'KeepDeletedCells', '保留删除的单元', 'string', '500', 'N', 'N', 'Y', '1', '10', '1522239260000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('145', '42', 'BlockSize', '块大小', 'string', '500', 'N', 'N', 'Y', '1', '11', '1522239261000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('146', '42', 'InMemory', '内存存储', 'string', '500', 'N', 'N', 'Y', '1', '12', '1522239264000', '1515207799000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('147', '44', 'IPAddress', 'IP地址', 'string', '32', 'Y', 'N', 'Y', '1', '1', '1521261509000', '1515221279000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('148', '44', 'DBPort', '端口', 'string', '16', 'Y', 'N', 'Y', '1', '2', '1521261509000', '1515221279000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('149', '44', 'DatabaseName', '数据库名', 'string', '64', 'Y', 'N', 'Y', '1', '3', '1521261509000', '1515221279000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('150', '44', 'UserName', '用户名', 'string', '32', 'Y', 'N', 'Y', '1', '4', '1521261509000', '1515221279000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('151', '44', 'DataSourceName', '数据源名称', 'string', '64', 'Y', 'N', 'Y', '1', '5', '1521261509000', '1515221280000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('152', '45', 'TableSpaceName', '表空间', 'string', '1000', 'Y', 'N', 'Y', '1', '1', '1521261509000', '1515221353000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('153', '45', 'CreateTime', '表创建时间', 'date', null, 'Y', 'N', 'Y', '1', '2', '1521261677000', '1515221354000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('154', '45', 'Description', '描述', 'string', '2000', 'Y', 'N', 'Y', '1', '3', '1521261509000', '1515221354000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('155', '46', 'IsPK', '是否主键', 'string', '8', 'Y', 'N', 'Y', '1', '1', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('156', '46', 'IsFK', '是否外键', 'string', '8', 'Y', 'N', 'Y', '1', '2', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('157', '46', 'ColumnSize', '长度', 'string', '8', 'Y', 'N', 'Y', '1', '3', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('158', '46', 'Precision', '精度', 'string', '8', 'Y', 'N', 'Y', '1', '4', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('159', '46', 'DecimalDigits', '小数位数', 'string', '8', 'Y', 'N', 'Y', '1', '5', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('160', '46', 'DataType', '数据类型', 'string', '64', 'Y', 'N', 'Y', '1', '6', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('161', '46', 'DataTypeName', '数据类型名称', 'string', '1024', 'Y', 'N', 'Y', '1', '7', '1521261509000', '1515221666000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('162', '46', 'Note', '注释', 'string', '2048', 'Y', 'N', 'Y', '1', '8', '1521261509000', '1515221667000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('163', '47', 'SourceDBIP', '资源库IP', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515375132000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('164', '47', 'SourceDBPort', '端口', 'string', '16', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('165', '47', 'DatabaseName', '数据库名', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('166', '47', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('167', '47', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('168', '47', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('169', '47', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('170', '47', 'CharacterSet', '字符集', 'string', '128', 'N', 'N', 'Y', '1', '8', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('171', '47', 'SortRules', '排序规则', 'string', '16', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515375133000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('172', '47', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '10', '1521261677000', '1515375134000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('173', '48', 'CatalogName', '目录名称', 'string', '128', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515375235000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('174', '48', 'SuperiorCatalogName', '上级目录名称', 'string', '128', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515375235000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('175', '48', 'CatalogDesc', '目录描述', 'string', '512', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515375235000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('176', '49', 'Task_name', '任务名称', 'string', '128', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515375441000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('177', '49', 'Type', '任务类型', 'string', '64', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515375441000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('178', '49', 'Frequency', '调度频率', 'string', '128', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515375441000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('179', '49', 'Status', '任务状态', 'string', '32', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515375441000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('180', '49', 'Create_time', '创建日期', 'date', null, 'N', 'N', 'Y', '1', '5', '1521261677000', '1515375441000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('181', '49', 'Create_user', '创建人', 'string', '16', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515375442000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('182', '49', 'Description', '任务描述', 'string', '1024', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515375442000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('183', '50', 'JobName', '作业名称', 'string', '64', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515209695000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('184', '50', 'Description', '描述', 'string', '512', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515209695000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('185', '50', 'CreateUser', '创建人', 'string', '16', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515209695000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('186', '50', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '4', '1521261677000', '1515209695000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('187', '50', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '5', '1521261677000', '1515209695000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('188', '51', 'TransformName', '转换名称', 'string', '64', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515209774000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('189', '51', 'Description', '描述', 'string', '512', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515209775000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('190', '51', 'CreateUser', '创建人', 'string', '16', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515209775000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('191', '51', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '4', '1521261677000', '1515209775000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('192', '51', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '5', '1521261677000', '1515209775000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('193', '52', 'ScriptName', '脚本名称', 'string', '128', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515209950000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('194', '52', 'ScriptDesc', '脚本描述', 'string', '128', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515209950000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('195', '52', 'ScriptType', '脚本类型', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515209950000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('196', '52', 'ScriptContent', '脚本内容', 'string', '5120', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515209950000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('197', '53', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('198', '53', 'Port', '端口', 'string', '16', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515205535000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('199', '53', 'Database', '数据库名', 'string', '64', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515205535000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('200', '53', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('201', '53', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('202', '53', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('203', '53', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('204', '53', 'CharacterSet', '字符集', 'string', '128', 'N', 'N', 'Y', '1', '8', '1521261509000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('205', '53', 'SortRules', '排序规则', 'string', '16', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('206', '53', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '10', '1521261677000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('207', '53', 'HiveDataBaseIP', '数据库IP', 'string', '32', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('208', '53', 'HiveDataBasePort', '数据库端口', 'string', '16', 'N', 'N', 'Y', '1', '12', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('209', '53', 'HiveDataBaseName', '数据库名', 'string', '64', 'N', 'N', 'Y', '1', '13', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('210', '53', 'HiveDataBaseOwner', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '14', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('211', '53', 'HbaseZookeeperQuorum', 'Hbase集群地址', 'string', '16', 'N', 'N', 'Y', '1', '15', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('212', '53', 'HbaseZookeeperClientPort', '集群端口', 'string', '8', 'N', 'N', 'Y', '1', '16', '1521261509000', '1515210328000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('213', '53', 'HbaseMaster', 'Hbase主机', 'string', '16', 'N', 'N', 'Y', '1', '17', '1521261509000', '1515210329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('214', '53', 'HbaseMasterPort', '主机端口', 'string', '8', 'N', 'N', 'Y', '1', '18', '1521261509000', '1515210329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('215', '53', 'Admin', '用户', 'string', '16', 'N', 'N', 'Y', '1', '19', '1521261509000', '1515210329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('216', '53', 'HdfsIp', 'HDFS文件系统地址IP', 'string', '20', 'N', 'N', 'Y', '1', '20', '1521261509000', '1515210329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('217', '53', 'HdfsPort', 'HDFS地址对应的端口', 'string', '10', 'N', 'N', 'Y', '1', '21', '1521261509000', '1515210329000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('218', '54', 'TableSpaceName', '表空间', 'string', '1000', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515217385000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('219', '54', 'CreateTime', '表创建时间', 'date', null, 'N', 'N', 'Y', '1', '2', '1521261677000', '1515217385000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('220', '54', 'Description', '描述', 'string', '2000', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('221', '54', 'TableType', '表类型', 'string', '32', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('222', '54', 'TableLocation', '表路径', 'string', '512', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('223', '54', 'TableName', '表名', 'string', '64', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('224', '54', 'TableOwner', '所有者', 'string', '32', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('225', '54', 'TableCreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '8', '1521261677000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('226', '54', 'TableAccessTime', '最近访问时间', 'date', null, 'N', 'N', 'Y', '1', '9', '1521261677000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('227', '54', 'Retention', '保留字段', 'string', '100', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515217386000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('228', '54', 'ProtectMode', '保护模式', 'string', '50', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('229', '54', 'ViewExpandedText', '视图详细HQL语句', 'string', '1000', 'N', 'N', 'Y', '1', '12', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('230', '54', 'ViewOriginalText', '视图原始HQL语句', 'string', '1000', 'N', 'N', 'Y', '1', '13', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('231', '54', 'BucketsNum', '分桶数量', 'string', '10', 'N', 'N', 'Y', '1', '14', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('232', '54', 'Parameters', '参数', 'string', '20', 'N', 'N', 'Y', '1', '15', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('233', '54', 'PricipalName', '被授权用户', 'string', '50', 'N', 'N', 'Y', '1', '16', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('234', '54', 'TablePrivacy', '权限', 'string', '30', 'N', 'N', 'Y', '1', '17', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('235', '54', 'InputFormat', '文件输入格式', 'string', '1000', 'N', 'N', 'Y', '1', '18', '1521261509000', '1515217387000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('236', '54', 'IsCompressed', '是否压缩', 'string', '10', 'N', 'N', 'Y', '1', '19', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('237', '54', 'HdfsLocation', 'HDFS路径', 'string', '1000', 'N', 'N', 'Y', '1', '20', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('238', '54', 'OutputFormat', '文件输出格式', 'string', '1000', 'N', 'N', 'Y', '1', '21', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('239', '54', 'MaxRegionSize', '最大区域大小', 'string', '64', 'N', 'N', 'Y', '1', '22', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('240', '54', 'MinRegionSize', '最小区域大小', 'string', '64', 'N', 'N', 'Y', '1', '23', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('241', '54', 'MemstoreSize', '内存大小', 'string', '64', 'N', 'N', 'Y', '1', '24', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('242', '54', 'ColumnFamilyCount', '列族个数', 'string', '64', 'N', 'N', 'Y', '1', '25', '1521261509000', '1515217388000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('243', '54', 'Regition', '副本数', 'string', '64', 'N', 'N', 'Y', '1', '26', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('244', '54', 'HdfsFolderName', '文件夹名称', 'string', '512', 'N', 'N', 'Y', '1', '27', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('245', '54', 'HdfsFolderPath', '路径', 'string', '512', 'N', 'N', 'Y', '1', '28', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('246', '54', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '29', '1521261677000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('247', '54', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '30', '1521261677000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('248', '54', 'HdfsFolderOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '31', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('249', '54', 'HdfsFolderGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '32', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('250', '54', 'HdfsFolderLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '33', '1521261509000', '1515217389000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('251', '54', 'HdfsFolderBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '34', '1521261509000', '1515217390000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('252', '54', 'HdfsFolderReplication', '副本数', 'string', '8', 'N', 'N', 'Y', '1', '35', '1521261509000', '1515217390000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('253', '54', 'HdfsFolderPermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '36', '1521261509000', '1515217390000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('254', '55', 'IsPK', '是否主键', 'string', '8', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('255', '55', 'IsFK', '是否外键', 'string', '8', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('256', '55', 'InitialValue', '初始值', 'string', '2048', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('257', '55', 'Nullable', '是否可空', 'string', '8', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('258', '55', 'IsUnique', '是否业务唯一', 'string', '8', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('259', '55', 'ColumnSize', '长度', 'string', '8', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515218263000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('260', '55', 'Precision', '精度', 'string', '8', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('261', '55', 'DecimalDigits', '小数位数', 'string', '8', 'N', 'N', 'Y', '1', '8', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('262', '55', 'DataType', '数据类型', 'string', '64', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('263', '55', 'DataTypeName', '数据类型名称', 'string', '1024', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('264', '55', 'Note', '注释', 'string', '2048', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('265', '55', 'ColumnSeq', '字段顺序', 'string', '20', 'N', 'N', 'Y', '1', '12', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('266', '55', 'ColmType', '字段类型', 'string', '50', 'N', 'N', 'Y', '1', '13', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('267', '55', 'Isbucketcol', '是否桶字段', 'string', '10', 'N', 'N', 'Y', '1', '14', '1521261509000', '1515218264000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('268', '55', 'Ispartcol', '是否分区字段', 'string', '10', 'N', 'N', 'Y', '1', '15', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('269', '55', 'DataBlockEncode', '信息组编码', 'string', '500', 'N', 'N', 'Y', '1', '16', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('270', '55', 'BloomFilter', '布隆过滤器', 'string', '500', 'N', 'N', 'Y', '1', '17', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('271', '55', 'BlockCache', '块缓存', 'string', '500', 'N', 'N', 'Y', '1', '18', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('272', '55', 'Configuration', '结构', 'string', '500', 'N', 'N', 'Y', '1', '19', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('273', '55', 'ReplicationScope', '拷贝范围', 'string', '500', 'N', 'N', 'Y', '1', '20', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('274', '55', 'Versions', '版本', 'string', '500', 'N', 'N', 'Y', '1', '21', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('275', '55', 'Compression', '压缩', 'string', '500', 'N', 'N', 'Y', '1', '22', '1521261509000', '1515218265000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('276', '55', 'MinVersions', '最小版本', 'string', '500', 'N', 'N', 'Y', '1', '23', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('277', '55', 'TTL', '生存周期', 'string', '500', 'N', 'N', 'Y', '1', '24', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('278', '55', 'KeepDeletedCells', '保留删除的单元', 'string', '500', 'N', 'N', 'Y', '1', '25', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('279', '55', 'BlockSize', '块大小', 'string', '500', 'N', 'N', 'Y', '1', '26', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('280', '55', 'InMemory', '内存存储', 'string', '500', 'N', 'N', 'Y', '1', '27', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('281', '55', 'HdfsFileName', '文件名称', 'string', '512', 'N', 'N', 'Y', '1', '28', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('282', '55', 'HdfsFilePath', '文件路径', 'string', '512', 'N', 'N', 'Y', '1', '29', '1521261509000', '1515218266000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('283', '55', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '30', '1521261677000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('284', '55', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '31', '1521261677000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('285', '55', 'HdfsFileOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '32', '1521261509000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('286', '55', 'HdfsFileGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '33', '1521261509000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('287', '55', 'HdfsFileLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '34', '1521261509000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('288', '55', 'HdfsFileBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '35', '1521261509000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('289', '55', 'HdfsFileReplication', '文件副本数', 'string', '8', 'N', 'N', 'Y', '1', '36', '1521261509000', '1515218267000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('290', '55', 'HdfsFilePermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '37', '1521261509000', '1515218268000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('291', '56', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218411000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('292', '56', 'Port', '端口号', 'string', '16', 'N', 'N', 'Y', '2', '2', '1522240794000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('293', '56', 'Database', '数据库', 'string', '64', 'N', 'N', 'Y', '3', '3', '1522240798000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('294', '56', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '4', '4', '1522240801000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('295', '56', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '5', '5', '1522240806000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('296', '56', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '6', '6', '1522240808000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('297', '56', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'N', 'Y', '7', '7', '1522240809000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('298', '56', 'CharacterSet', '字符集', 'string', '128', 'N', 'N', 'Y', '8', '8', '1522240810000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('299', '56', 'SortRules', '排序规则', 'string', '16', 'N', 'N', 'Y', '9', '10', '1522240813000', '1515218412000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('300', '56', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '10', '11', '1522240815000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('301', '56', 'HiveDataBaseIP', '数据库IP', 'string', '32', 'N', 'N', 'Y', '11', '12', '1522240817000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('302', '56', 'HiveDataBasePort', '数据库端口', 'string', '16', 'N', 'N', 'Y', '12', '13', '1522240818000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('303', '56', 'HiveDataBaseName', '数据库名', 'string', '64', 'N', 'N', 'Y', '13', '14', '1522240819000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('304', '56', 'HiveDataBaseOwner', '用户名', 'string', '32', 'N', 'N', 'Y', '14', '15', '1522240821000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('305', '56', 'HbaseZookeeperQuorum', 'Hbase集群地址', 'string', '16', 'N', 'N', 'Y', '15', '16', '1522240822000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('306', '56', 'HbaseZookeeperClientPort', '集群端口', 'string', '8', 'N', 'N', 'Y', '16', '17', '1522240824000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('307', '56', 'HbaseMaster', 'Hbase主机', 'string', '16', 'N', 'N', 'Y', '17', '18', '1522240826000', '1515218413000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('308', '56', 'HbaseMasterPort', '主机端口', 'string', '8', 'N', 'N', 'Y', '18', '19', '1522240827000', '1515218414000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('309', '56', 'Admin', '用户', 'string', '16', 'N', 'N', 'Y', '19', '20', '1522240829000', '1515218414000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('310', '56', 'HdfsIp', 'HDFS文件系统地址IP', 'string', '20', 'N', 'N', 'Y', '20', '21', '1522240830000', '1515218414000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('311', '56', 'HdfsPort', 'HDFS地址对应的端口', 'string', '10', 'N', 'N', 'Y', '21', '22', '1522240835000', '1515218414000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('312', '57', 'TableSpaceName', '表空间', 'string', '1000', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('313', '57', 'CreateTime', '表创建时间', 'date', null, 'N', 'N', 'Y', '1', '2', '1521261677000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('314', '57', 'Description', '描述', 'string', '2000', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('315', '57', 'TableType', '表类型', 'string', '32', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('316', '57', 'TableLocation', '表路径', 'string', '512', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('317', '57', 'TableName', '表名', 'string', '64', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515218508000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('318', '57', 'TableOwner', '所有者', 'string', '32', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('319', '57', 'TableCreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '8', '1521261677000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('320', '57', 'TableAccessTime', '最近访问时间', 'date', null, 'N', 'N', 'Y', '1', '9', '1521261677000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('321', '57', 'Retention', '保留字段', 'string', '100', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('322', '57', 'ProtectMode', '保护模式', 'string', '50', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('323', '57', 'ViewExpandedText', '视图详细HQL语句', 'string', '1000', 'N', 'N', 'Y', '1', '12', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('324', '57', 'ViewOriginalText', '视图原始HQL语句', 'string', '1000', 'N', 'N', 'Y', '1', '13', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('325', '57', 'BucketsNum', '分桶数量', 'string', '10', 'N', 'N', 'Y', '1', '14', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('326', '57', 'Parameters', '参数', 'string', '20', 'N', 'N', 'Y', '1', '15', '1521261509000', '1515218509000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('327', '57', 'PricipalName', '被授权用户', 'string', '50', 'N', 'N', 'Y', '1', '16', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('328', '57', 'TablePrivacy', '权限', 'string', '30', 'N', 'N', 'Y', '1', '17', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('329', '57', 'InputFormat', '文件输入格式', 'string', '1000', 'N', 'N', 'Y', '1', '18', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('330', '57', 'IsCompressed', '是否压缩', 'string', '10', 'N', 'N', 'Y', '1', '19', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('331', '57', 'HdfsLocation', 'HDFS路径', 'string', '1000', 'N', 'N', 'Y', '1', '20', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('332', '57', 'OutputFormat', '文件输出格式', 'string', '1000', 'N', 'N', 'Y', '1', '21', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('333', '57', 'MaxRegionSize', '最大区域大小', 'string', '64', 'N', 'N', 'Y', '1', '22', '1521261509000', '1515218510000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('334', '57', 'MinRegionSize', '最小区域大小', 'string', '64', 'N', 'N', 'Y', '1', '23', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('335', '57', 'MemstoreSize', '内存大小', 'string', '64', 'N', 'N', 'Y', '1', '24', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('336', '57', 'ColumnFamilyCount', '列族个数', 'string', '64', 'N', 'N', 'Y', '1', '25', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('337', '57', 'Regition', '副本数', 'string', '64', 'N', 'N', 'Y', '1', '26', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('338', '57', 'HdfsFolderName', '文件夹名称', 'string', '512', 'N', 'N', 'Y', '1', '27', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('339', '57', 'HdfsFolderPath', '路径', 'string', '512', 'N', 'N', 'Y', '1', '28', '1521261509000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('340', '57', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '29', '1521261677000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('341', '57', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '30', '1521261677000', '1515218511000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('342', '57', 'HdfsFolderOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '31', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('343', '57', 'HdfsFolderGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '32', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('344', '57', 'HdfsFolderLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '33', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('345', '57', 'HdfsFolderBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '34', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('346', '57', 'HdfsFolderReplication', '副本数', 'string', '8', 'N', 'N', 'Y', '1', '35', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('347', '57', 'HdfsFolderPermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '36', '1521261509000', '1515218512000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('348', '58', 'IsPK', '是否主键', 'string', '8', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218631000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('349', '58', 'IsFK', '是否外键', 'string', '8', 'N', 'N', 'Y', '1', '2', '1521261509000', '1515218631000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('350', '58', 'InitialValue', '初始值', 'string', '2048', 'N', 'N', 'Y', '1', '3', '1521261509000', '1515218631000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('351', '58', 'Nullable', '是否可空', 'string', '8', 'N', 'N', 'Y', '1', '4', '1521261509000', '1515218631000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('352', '58', 'IsUnique', '是否业务唯一', 'string', '8', 'N', 'N', 'Y', '1', '5', '1521261509000', '1515218631000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('353', '58', 'ColumnSize', '长度', 'string', '8', 'N', 'N', 'Y', '1', '6', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('354', '58', 'Precision', '精度', 'string', '8', 'N', 'N', 'Y', '1', '7', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('355', '58', 'DecimalDigits', '小数位数', 'string', '8', 'N', 'N', 'Y', '1', '8', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('356', '58', 'DataType', '数据类型', 'string', '64', 'N', 'N', 'Y', '1', '9', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('357', '58', 'DataTypeName', '数据类型名称', 'string', '1024', 'N', 'N', 'Y', '1', '10', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('358', '58', 'Note', '注释', 'string', '2048', 'N', 'N', 'Y', '1', '11', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('359', '58', 'ColumnSeq', '字段顺序', 'string', '20', 'N', 'N', 'Y', '1', '12', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('360', '58', 'ColmType', '字段类型', 'string', '50', 'N', 'N', 'Y', '1', '13', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('361', '58', 'Isbucketcol', '是否桶字段', 'string', '10', 'N', 'N', 'Y', '1', '14', '1521261509000', '1515218632000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('362', '58', 'Ispartcol', '是否分区字段', 'string', '10', 'N', 'N', 'Y', '1', '15', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('363', '58', 'DataBlockEncode', '信息组编码', 'string', '500', 'N', 'N', 'Y', '1', '16', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('364', '58', 'BloomFilter', '布隆过滤器', 'string', '500', 'N', 'N', 'Y', '1', '17', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('365', '58', 'BlockCache', '块缓存', 'string', '500', 'N', 'N', 'Y', '1', '18', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('366', '58', 'Configuration', '结构', 'string', '500', 'N', 'N', 'Y', '1', '19', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('367', '58', 'ReplicationScope', '拷贝范围', 'string', '500', 'N', 'N', 'Y', '1', '20', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('368', '58', 'Versions', '版本', 'string', '500', 'N', 'N', 'Y', '1', '21', '1521261509000', '1515218633000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('369', '58', 'Compression', '压缩', 'string', '500', 'N', 'N', 'Y', '1', '22', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('370', '58', 'MinVersions', '最小版本', 'string', '500', 'N', 'N', 'Y', '1', '23', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('371', '58', 'TTL', '生存周期', 'string', '500', 'N', 'N', 'Y', '1', '24', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('372', '58', 'KeepDeletedCells', '保留删除的单元', 'string', '500', 'N', 'N', 'Y', '1', '25', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('373', '58', 'BlockSize', '块大小', 'string', '500', 'N', 'N', 'Y', '1', '26', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('374', '58', 'InMemory', '内存存储', 'string', '500', 'N', 'N', 'Y', '1', '27', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('375', '58', 'HdfsFileName', '文件名称', 'string', '512', 'N', 'N', 'Y', '1', '28', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('376', '58', 'HdfsFilePath', '文件路径', 'string', '512', 'N', 'N', 'Y', '1', '29', '1521261509000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('377', '58', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '30', '1521261677000', '1515218634000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('378', '58', 'UpdateTime', '修改时间', 'date', null, 'N', 'N', 'Y', '1', '31', '1521261677000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('379', '58', 'HdfsFileOwner', '用户', 'string', '32', 'N', 'N', 'Y', '1', '32', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('380', '58', 'HdfsFileGroup', '组', 'string', '64', 'N', 'N', 'Y', '1', '33', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('381', '58', 'HdfsFileLenth', '文件大小', 'string', '32', 'N', 'N', 'Y', '1', '34', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('382', '58', 'HdfsFileBlockSize', '块大小', 'string', '32', 'N', 'N', 'Y', '1', '35', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('383', '58', 'HdfsFileReplication', '文件副本数', 'string', '8', 'N', 'N', 'Y', '1', '36', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('384', '58', 'HdfsFilePermission', '权限', 'string', '32', 'N', 'N', 'Y', '1', '37', '1521261509000', '1515218635000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('385', '59', 'TaskName', '任务名称', 'string', '128', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218829000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('386', '59', 'TaskType', '任务类型', 'string', '64', 'N', 'N', 'Y', '1', '2', '1522239829000', '1515218829000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('387', '59', 'Frequency', '调度频率', 'string', '128', 'N', 'N', 'Y', '1', '3', '1522239830000', '1515218829000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('388', '59', 'Status', '任务状态', 'string', '32', 'N', 'N', 'Y', '1', '4', '1522239831000', '1515218829000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('389', '59', 'CreateTime', '创建日期', 'date', null, 'N', 'N', 'Y', '1', '5', '1522239832000', '1515218830000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('390', '59', 'CreateUser', '创建人', 'string', '16', 'N', 'N', 'Y', '1', '6', '1522239834000', '1515218830000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('391', '59', 'Description', '任务描述', 'string', '1024', 'N', 'N', 'Y', '1', '7', '1522239836000', '1515218830000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('392', '60', 'ScriptName', '脚本名称', 'string', '128', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515218934000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('393', '60', 'ScriptDesc', '脚本描述', 'string', '128', 'N', 'N', 'Y', '1', '2', '1522239856000', '1515218934000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('394', '60', 'ScriptType', '脚本类型', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522239858000', '1515218935000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('395', '60', 'ScriptContent', '脚本内容', 'string', '5120', 'N', 'N', 'Y', '1', '4', '1522239859000', '1515218935000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('396', '61', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515219238000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('397', '61', 'Port', '端口号', 'string', '16', 'N', 'N', 'Y', '1', '2', '1522239879000', '1515219238000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('398', '61', 'Database', '数据库', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522239880000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('399', '61', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '1', '4', '1522239881000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('400', '61', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '5', '1522239882000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('401', '61', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '1', '6', '1522239884000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('402', '61', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'N', 'Y', '1', '7', '1522239885000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('403', '61', 'CharacterSet', '字符集', 'string', '128', 'N', 'N', 'Y', '1', '8', '1522239888000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('404', '61', 'SortRules', '排序规则', 'string', '16', 'N', 'N', 'Y', '1', '9', '1522239889000', '1515219239000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('405', '61', 'CreateTime', '创建时间', 'date', null, 'N', 'N', 'Y', '1', '10', '1522239891000', '1515219240000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('406', '62', 'TableSpaceName', '表空间', 'string', '1000', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515219370000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('407', '62', 'CreateTime', '表创建时间', 'date', null, 'N', 'N', 'Y', '1', '2', '1522239912000', '1515219370000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('408', '62', 'Description', '描述', 'string', '2000', 'N', 'N', 'Y', '1', '3', '1522239914000', '1515219370000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('409', '63', 'IsPK', '是否主键', 'string', '8', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515221077000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('410', '63', 'IsFK', '是否外键', 'string', '8', 'N', 'N', 'Y', '1', '2', '1522239932000', '1515221077000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('411', '63', 'InitialValue', '初始值', 'string', '2048', 'N', 'N', 'Y', '1', '3', '1522239934000', '1515221077000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('412', '63', 'Nullable', '是否可空', 'string', '8', 'N', 'N', 'Y', '1', '4', '1522239935000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('413', '63', 'IsUnique', '是否业务唯一', 'string', '8', 'N', 'N', 'Y', '1', '5', '1522239936000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('414', '63', 'ColumnSize', '长度', 'string', '8', 'N', 'N', 'Y', '1', '6', '1522239936000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('415', '63', 'Precision', '精度', 'string', '8', 'N', 'N', 'Y', '1', '7', '1522239937000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('416', '63', 'DecimalDigits', '小数位数', 'string', '8', 'N', 'N', 'Y', '1', '8', '1522239938000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('417', '63', 'DataType', '数据类型', 'string', '64', 'N', 'N', 'Y', '1', '9', '1522239938000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('418', '63', 'DataTypeName', '数据类型名称', 'string', '2014', 'N', 'N', 'Y', '1', '10', '1522239941000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('419', '63', 'Note', '注释', 'string', '2048', 'N', 'N', 'Y', '1', '11', '1522239943000', '1515221078000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('420', '64', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('421', '64', 'Port', '端口号', 'string', '16', 'N', 'N', 'Y', '1', '2', '1522240263000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('422', '64', 'Database', '数据库', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522240264000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('423', '64', 'Schema', '模式', 'string', '16', 'N', 'N', 'Y', '1', '4', '1522240264000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('424', '64', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '5', '1522240265000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('425', '64', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '1', '6', '1522240266000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('426', '64', 'DatabaseType', '数据库类型', 'string', '16', 'N', 'N', 'Y', '1', '7', '1522240267000', '1515221879000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('427', '65', 'TableName', '表名', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515222006000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('428', '65', 'AuthorityUser', '权限用户', 'string', '5120', 'N', 'N', 'Y', '1', '2', '1522240285000', '1515222006000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('429', '65', 'AuthorityRole', '权限角色', 'string', '5120', 'N', 'N', 'Y', '1', '3', '1522240286000', '1515222006000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('430', '66', 'IPAddress', 'IP地址', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515222129000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('431', '66', 'Port', '端口号', 'string', '16', 'N', 'N', 'Y', '1', '2', '1522240301000', '1515222129000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('432', '66', 'Database', '数据库', 'string', '64', 'N', 'N', 'Y', '1', '3', '1522240302000', '1515222129000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('433', '66', 'UserName', '用户名', 'string', '32', 'N', 'N', 'Y', '1', '4', '1522240303000', '1515222129000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('434', '66', 'DataSourceName', '数据源名称', 'string', '64', 'N', 'N', 'Y', '1', '5', '1522240305000', '1515222129000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('435', '67', 'HiveTableName', '表名', 'string', '32', 'N', 'N', 'Y', '1', '1', '1521261509000', '1515222232000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('436', '67', 'AuthorityUser', '权限用户', 'string', '5120', 'N', 'N', 'Y', '1', '2', '1522240320000', '1515222232000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('437', '67', 'AuthorityRole', '权限角色', 'string', '5120', 'N', 'N', 'Y', '1', '3', '1522240321000', '1515222233000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('438', '38', 'TableType', '表类型', 'string', '32', 'N', 'Y', 'Y', '1', '5', '1521262144000', '1515210327000', '系统管理员', '系统管理员');
INSERT INTO `tb_metamodel_attr` VALUES ('439', '38', 'TableLocation', '表路径', 'string', '512', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('440', '38', 'TableName', '表名', 'string', '64', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('441', '38', 'TableOwner', '所有者', 'string', '32', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('442', '38', 'TableCreateTime', '创建时间', 'date', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('443', '38', 'TableAccessTime', '最近访问时间', 'date', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('444', '38', 'Retention', '保留字段', 'string', '100', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('445', '38', 'ProtectMode', '保护模式', 'string', '50', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('446', '38', 'ViewExpandedText', '视图详细HQL语句', null, '1000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('447', '38', 'ViewOriginalText', '视图原始HQL语句', 'string', '1000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('448', '38', 'BucketsNum', '分桶数量', null, '10', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('449', '38', 'Parameters', '参数', 'string', '20', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('450', '38', 'PricipalName', '被授权用户', 'string', '50', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('451', '38', 'TablePrivacy', '权限', 'string', '30', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('452', '38', 'InputFormat', '文件输入格式', 'string', '1000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('453', '38', 'IsCompressed', '是否压缩', 'string', '10', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('454', '38', 'HdfsLocation', 'HDFS路径', 'string', '1000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_metamodel_attr` VALUES ('455', '38', 'OutputFormat', '文件输出格式', 'string', '1000', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_metamodel_back
-- ----------------------------
DROP TABLE IF EXISTS `tb_metamodel_back`;
CREATE TABLE `tb_metamodel_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '元模型代码',
  `name` varchar(255) DEFAULT NULL COMMENT '元模型名称',
  `ico_id` int(11) DEFAULT NULL COMMENT '图标的id',
  `discription` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建用户',
  `update_user` varchar(255) DEFAULT NULL COMMENT '修改用户',
  `is_menu` char(1) DEFAULT NULL COMMENT '是否是菜单',
  `buildin` char(1) DEFAULT NULL COMMENT '是否为内置的元模型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元模型表';

-- ----------------------------
-- Records of tb_metamodel_back
-- ----------------------------
INSERT INTO `tb_metamodel_back` VALUES ('1', '-1', 'BUSSINESS', '业务元数据', '33', '业务元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('2', '4', 'BUSSINESS_DATA_ELEMENT', '数据元', '33', '数据元', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('3', '4', 'BUSSINESS_CODE_SET', '代码集', '33', '代码集', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('4', '1', 'BUSSINESS_STANDARD_PACKAGE', '数据标准包', '33', '数据标准包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('5', '-1', 'TECHNOLOGY', '技术元数据', '33', '技术元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('6', '1', 'BUSSINESS_QUALITY_RULE_PACKAGE', '质量规则包', '33', '质量规则包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('7', '1', 'BUSSINESS_DATASOURCE_LAYER_PACKAGE', '数据源层包', '33', '数据源层包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('8', '5', 'TECHNOLOGY_RETALATIONAL_PACKAGE', '关系型包', '33', '关系型包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('9', '5', 'TECHNOLOGY_BIGDATA_PACKAGE', '大数据包', '33', '大数据包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('10', '5', 'TECHNOLOGY_TOOLS_PACKAGE', '工具包', '33', '工具包', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('11', '-1', 'MANAGEMENT', '管理元数据', '33', '管理元数据', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('12', '11', 'MANAGEMENT_DATASOURCE_PERMISSIONS_PACKAGE', '数据源权限', '33', '数据源权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('13', '9', 'TECHNOLOGY_HDFS', 'HDFS', '33', 'HDFS', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('14', '9', 'TECHNOLOGY_HIVE', 'HIVE', '33', 'HIVE', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('15', '9', 'TECHNOLOGY_HBASE', 'HBASE', '33', 'HBASE', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('16', '9', 'TECHNOLOGY_ES', 'ELASTICSEARCH', '33', 'ELASTICSEARCH', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('18', '10', 'TECHNOLOGY_SDCQUALITY', 'SDC QUALITY', '33', 'SDC QUALITY', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('19', '12', 'MANAGEMENT_DATASOURCE_PERMISSIONS_DB', 'DB数据源权限', '33', 'DB数据源权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('20', '12', 'MANAGEMENT_DATASOURCE_PERMISSIONS_HIVE', '大数据HIVE权限', '33', '大数据HIVE权限', '1514282383000', '1514282383000', '系统管理员', '系统管理员', 'Y', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('21', '2', 'DataElement', '数据元', '19', '数据元的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('22', '3', 'CodeSet', '代码集', '5', '代码集的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('23', '3', 'Code', '代码', '4', '代码的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('24', '6', 'QualityRule', '质量规则', '27', '质量规则的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('25', '6', 'CheckObject', '校验对象', '26', '校验对象的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('26', '7', 'DataSourceLayer', '数据源分层', '20', '数据源分层的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('27', '8', 'DBDatabase', '数据库', '17', '关系型数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('28', '8', 'DBTable', '表', '0', '表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('29', '8', 'DBColumns', '字段', '15', '字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('30', '8', 'DBPrimaryKey', '主键', '17', '主键的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('31', '8', 'DBForeignKey', '外键', '22', '外键的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('32', '8', 'DBView', '视图', '10', '视图的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('33', '8', 'DBIndex', '索引', '21', '索引的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('34', '13', 'HdfsFileSystem', '文件系统', '25', 'HDFS文件系统的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('35', '13', 'HdfsFolder', '文件夹', '24', 'HDFS文件夹的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('36', '13', 'HdfsFile', '文件', '23', 'HDFS文件的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('37', '14', 'HiveDatabase', 'Hive数据库', '17', 'Hive数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('38', '14', 'HiveTable', 'Hive表', '0', 'Hive表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('39', '14', 'HiveColumns', 'Hive字段', '11', 'Hive字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('40', '15', 'HbaseNameSpace', '命名空间', '7', 'Hbase命名空间的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('41', '15', 'HbaseTable', 'Hbase表', '0', 'Hbase表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('42', '15', 'HbaseFamily', '列族', '32', 'Hbase的列族元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('43', '15', 'HbaseCell', '成员', '2', 'Hbase成员的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('44', '16', 'ESDataBase', '数据库', '17', 'ES共享库数据库的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('45', '16', 'ESTable', '表', '0', 'ES共享库表的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('46', '16', 'ESColumns', '字段', '15', '字段的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('59', '18', 'QualityTask', '质量任务', '1', '质量任务描述', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('60', '18', 'QualityScript', '脚本', '6', '质量脚本的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('61', '18', 'QualityInputSource', '输入源', '14', '输入源的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('62', '18', 'QualityInputInstance', '输入源实例', '15', '质量输入源实例的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('63', '18', 'QualityInputObject', '输入源对象', '16', '输入源对象的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('64', '19', 'DBAuthority', 'DB数据库权限', '18', '数据库权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('65', '19', 'DBTableAuthority', 'DB表权限', '1', '表权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('66', '20', 'HiveAuthority', 'Hive数据库权限', '18', 'Hive数据库权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');
INSERT INTO `tb_metamodel_back` VALUES ('67', '20', 'HiveTableAuthority', 'Hive表权限', '1', 'Hive表权限的元模型定义', '1514294076000', '1514294076000', '系统管理员', '系统管理员', 'N', 'Y');

-- ----------------------------
-- Table structure for tb_metamodel_comb
-- ----------------------------
DROP TABLE IF EXISTS `tb_metamodel_comb`;
CREATE TABLE `tb_metamodel_comb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '组合关系代码',
  `name` varchar(255) DEFAULT NULL COMMENT '组合关系名称',
  `model_code` varchar(255) DEFAULT NULL COMMENT '元模型代码',
  `model_name` varchar(255) DEFAULT NULL COMMENT '元模型名称',
  `model_id` bigint(20) DEFAULT NULL COMMENT '元模型id',
  `combin_model_id` varchar(255) DEFAULT NULL COMMENT '组合的元模型的id',
  `combin_model_code` varchar(255) DEFAULT NULL COMMENT '组合的元模型的代码',
  `combin_model_name` varchar(255) DEFAULT NULL COMMENT '组合的元模型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元模型的组合关系表';

-- ----------------------------
-- Records of tb_metamodel_comb
-- ----------------------------
INSERT INTO `tb_metamodel_comb` VALUES ('1', 'ComETLSourceDBETLCatalog', '资源库与目录的组合', 'ETLCatalog', '目录', '48', '47', 'ETLSourceDB', '资源库');
INSERT INTO `tb_metamodel_comb` VALUES ('2', 'ComETLSourceDBETLTask', 'ETL资源库与ETL目录的组合', 'ETLTask', 'ETL任务', '49', '47', 'ETLSourceDB', '资源库');
INSERT INTO `tb_metamodel_comb` VALUES ('3', 'ComETLCatalogETLCatalog', '目录与目录的组合', 'ETLCatalog', '目录', '48', '48', 'ETLCatalog', '目录');
INSERT INTO `tb_metamodel_comb` VALUES ('4', 'ComETLCatalogETLTask', 'ETL目录和ETL任务关系', 'ETLTask', 'ETL任务', '49', '48', 'ETLCatalog', '目录');
INSERT INTO `tb_metamodel_comb` VALUES ('5', 'ComETLTaskETLJob', 'ETL任务与作业组合', 'ETLJob', '作业', '50', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_comb` VALUES ('6', 'ComETLJobETLTransform', 'ETL作业与ETL转换组合', 'ETLTransform', '转换', '50', '50', 'ETLJob', '作业');
INSERT INTO `tb_metamodel_comb` VALUES ('7', 'ComETLTaskETLTransform', 'ETL任务与ETL转换组合', 'ETLTransform', '转换', '50', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_comb` VALUES ('8', 'ComETLTransformETLScript', 'ETL转换与ETL脚本组合', 'ETLScript', '脚本', '52', '50', 'ETLTransform', '转换');
INSERT INTO `tb_metamodel_comb` VALUES ('9', 'ComETLJobETLETLScript', 'ETL作业与ETL脚本组合', 'ETLScript', '脚本', '52', '50', 'ETLJob', '作业');
INSERT INTO `tb_metamodel_comb` VALUES ('10', 'ComETLJobETLInputSource', 'ETL作业与输入源组合', 'ETLInputSource', '输入源', '53', '50', 'ETLJob', '作业');
INSERT INTO `tb_metamodel_comb` VALUES ('11', 'ComETLTransformETLInputSource', 'ETL转换与输入源组合', 'ETLInputSource', '输入源', '53', '50', 'ETLTransform', '转换');
INSERT INTO `tb_metamodel_comb` VALUES ('12', 'ComETLInputSourceETLInputInstance', '输入源与输入源实例组合', 'ETLInputInstance', '输入源实例', '54', '53', 'ETLInputSource', '输入源');
INSERT INTO `tb_metamodel_comb` VALUES ('13', 'ComETLInputInstanceETLInputObject', '输入源实例和输入源对象组合', 'ETLInputObject', '输入源对象', '55', '54', 'ETLInputInstance', '输入源实例');
INSERT INTO `tb_metamodel_comb` VALUES ('14', 'ComETLJobETLTargetSource', 'ETL作业与输出源组合', 'ETLTargetSource', '输出源', '56', '50', 'ETLJob', '作业');
INSERT INTO `tb_metamodel_comb` VALUES ('15', 'ComETLTransformETLTargetSource', 'ETL转换与输出源组合', 'ETLTargetSource', '输出源', '56', '50', 'ETLTransform', '转换');
INSERT INTO `tb_metamodel_comb` VALUES ('16', 'ComETLTargetSourceETLTargetInstance', '输出源与输出源实例组合', 'ETLTargetInstance', '输出源实例', '57', '56', 'ETLTargetSource', '输出源');
INSERT INTO `tb_metamodel_comb` VALUES ('17', 'ComETLTargetInstanceETLTargetObject', '输出源实例和输出源对象组合', 'ETLTargetObject', '输出源对象', '58', '57', 'ETLTargetInstance', '输出源实例');
INSERT INTO `tb_metamodel_comb` VALUES ('18', 'ComHdfsFileSystemHdfsFileSystem', '文件系统与文件系统组合', 'HdfsFileSystem', '文件系统', '34', '34', 'HdfsFileSystem', '文件系统');
INSERT INTO `tb_metamodel_comb` VALUES ('19', 'ComHdfsFolderHdfsFolder', '文件夹与文件夹组合', 'HdfsFolder', '文件夹', '35', '35', 'HdfsFolder', '文件夹');
INSERT INTO `tb_metamodel_comb` VALUES ('20', 'ComHdfsFileSystemHdfsFolder', '文件系统与文件夹组合', 'HdfsFolder', '文件夹', '35', '34', 'HdfsFileSystem', '文件系统');
INSERT INTO `tb_metamodel_comb` VALUES ('21', 'ComQualityTaskQualityScript', '质量任务与脚本组合', 'QualityScript', '脚本', '60', '59', 'QualityTask', '质量任务');
INSERT INTO `tb_metamodel_comb` VALUES ('22', 'ComQualityTaskQualityInputSource', '质量任务与输入源组合', 'QualityInputSource', '输入源', '61', '59', 'QualityTask', '质量任务');
INSERT INTO `tb_metamodel_comb` VALUES ('23', 'ComQualityInputSourceQualityInputInstance', '输入源与输入源实例组合', 'QualityInputInstance', '输入源实例', '62', '61', 'QualityInputSource', '输入源');
INSERT INTO `tb_metamodel_comb` VALUES ('24', 'ComQualityInputInstanceQualityInputObject', '输入源实例和输入源对象组合', 'QualityInputObject', '输入源对象', '63', '62', 'QualityInputInstance', '输入源实例');
INSERT INTO `tb_metamodel_comb` VALUES ('25', 'ComHiveDataBaseHiveTable', 'Hive数据库与Hive表组合', 'HiveTable', 'Hive表', '38', '37', 'HiveDatabase', 'Hive数据库');
INSERT INTO `tb_metamodel_comb` VALUES ('26', 'ComHiveTableHiveColumns', 'Hive表和Hive字段的组合', 'HiveColumns', 'Hive字段', '39', '38', 'HiveTable', 'Hive表');
INSERT INTO `tb_metamodel_comb` VALUES ('27', 'ComCodeCode', '代码和代码的组合', 'Code', '代码', '23', '23', 'Code', '代码');
INSERT INTO `tb_metamodel_comb` VALUES ('28', 'ComCodeSetCode', '代码集和代码的组合', 'Code', '代码', '23', '22', 'CodeSet', '代码集');
INSERT INTO `tb_metamodel_comb` VALUES ('29', 'ComQualityRuleCheckObject', '质量规则和校验对象的组合', 'CheckObject', '校验对象', '25', '24', 'QualityRule', '质量规则');
INSERT INTO `tb_metamodel_comb` VALUES ('30', 'ComDataSourceLayerDataSourceLayer', '数据源分层和数据源分层的组合', 'DataSourceLayer', '数据源分层', '26', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_comb` VALUES ('31', 'ComDBDatabaseDBTable', '数据库与表组合', 'DBTable', '表', '28', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_comb` VALUES ('32', 'ComDBTableDBColumns', '表和字段的组合', 'DBColumns', '字段', '29', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_comb` VALUES ('33', 'ComDBViewDBColumns', '视图和字段的组合', 'DBColumns', '字段', '29', '32', 'DBView', '视图');
INSERT INTO `tb_metamodel_comb` VALUES ('34', 'ComDBTableDBPrimaryKey', '表和主键的组合', 'DBPrimaryKey', '主键', '30', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_comb` VALUES ('35', 'ComDBTableDBForeignKey', '表和外键的组合', 'DBForeignKey', '外键', '31', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_comb` VALUES ('36', 'ComDBDatabaseDBView', '数据库与视图组合', 'DBView', '视图', '32', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_comb` VALUES ('37', 'ComESDatabaseESTable', '数据库与表组合', 'ESTable', '表', '45', '44', 'ESDataBase', '数据库');
INSERT INTO `tb_metamodel_comb` VALUES ('38', 'ComESTableESColumns', '表和字段的组合', 'ESColumns', '字段', '46', '45', 'ESTable', '表');
INSERT INTO `tb_metamodel_comb` VALUES ('39', 'ComHdfsFileSystemHdfsFile', '文件系统与文件组合', 'HdfsFile', '文件', '36', '34', 'HdfsFileSystem', '文件系统');
INSERT INTO `tb_metamodel_comb` VALUES ('40', 'ComHdfsFolderHdfsFile', '文件夹与文件组合', 'HdfsFile', '文件', '36', '35', 'HdfsFolder', '文件夹');
INSERT INTO `tb_metamodel_comb` VALUES ('41', 'ComHbaseNameSpaceHbaseTable', '命名空间与Hbase表组合', 'HbaseTable', 'Hbase表', '41', '40', 'HbaseNameSpace', '命名空间');
INSERT INTO `tb_metamodel_comb` VALUES ('42', 'ComHbaseTableHbaseFamily', 'Hbase表与列族组合', 'HbaseFamily', '列族', '42', '41', 'HbaseTable', 'Hbase表');
INSERT INTO `tb_metamodel_comb` VALUES ('43', 'ComHbaseFamilyHbaseCell', '列族与成员组合', 'HbaseCell', '成员', '43', '42', 'HbaseFamily', '列族');
INSERT INTO `tb_metamodel_comb` VALUES ('44', 'ComDBTableDBIndex', '表与索引组合', 'DBIndex', '索引', '33', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_comb` VALUES ('45', 'ComDBAuthorityDBTableAuthority', '数据库权限与表权限组合', 'DBTableAuthority', 'DB表权限', '65', '64', 'DBAuthority', 'DB数据库权限');
INSERT INTO `tb_metamodel_comb` VALUES ('46', 'ComHiveAuthorityHiveTableAuthority', '数据库授权与表授权组合', 'HiveTableAuthority', 'Hive表权限', '67', '66', 'HiveAuthority', 'Hive数据库权限');

-- ----------------------------
-- Table structure for tb_metamodel_dep
-- ----------------------------
DROP TABLE IF EXISTS `tb_metamodel_dep`;
CREATE TABLE `tb_metamodel_dep` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `model_code` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `dep_model_id` varchar(255) DEFAULT NULL,
  `dep_model_code` varchar(255) DEFAULT NULL,
  `dep_model_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='元模型的依赖关系表';

-- ----------------------------
-- Records of tb_metamodel_dep
-- ----------------------------
INSERT INTO `tb_metamodel_dep` VALUES ('1', 'RelDBTableDBTableAuthority', '关系型表与表权限的依赖', '65', 'DBTableAuthority', 'DB表权限', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('2', 'RelDBTableESTable', '关系型表与ES共享库表的依赖', '45', 'ESTable', '表', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('3', 'RelDBDatabaseESDatabase', '关系型库与ES数据库的依赖', '44', 'ESDataBase', '数据库', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('4', 'RelDataSourceLayerESDataBase', '数据源分层与ES数据库的依赖', '44', 'ESDataBase', '数据库', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_dep` VALUES ('5', 'RelETLInputtObjectETLTargetObject', '输入源对象与输出源对象的依赖', '58', 'ETLTargetObject', '输出源对象', '55', 'ETLInputObject', '输入源对象');
INSERT INTO `tb_metamodel_dep` VALUES ('6', 'RelETLInputObjectETLTargetObject', '输入源对象与输出源对象的依赖', '58', 'ETLTargetObject', '输出源对象', '55', 'ETLInputObject', '输入源对象');
INSERT INTO `tb_metamodel_dep` VALUES ('7', 'RelETLInputInstanceETLTargetInstance', '输入源实例与输出源实例的依赖', '57', 'ETLTargetInstance', '输出源实例', '54', 'ETLInputInstance', '输入源实例');
INSERT INTO `tb_metamodel_dep` VALUES ('8', 'RelETLInputSourceETLTargetSource', '输入源与输出源的依赖', '56', 'ETLTargetSource', '输出源', '54', 'ETLInputSource', '输入源');
INSERT INTO `tb_metamodel_dep` VALUES ('9', 'RelETLTaskDBDataBase', '数据库与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('10', 'RelETLTaskDBTable', '表与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('11', 'RelETLTaskDBColumn', 'ETL任务与字段的依赖关系', '49', 'ETLTask', 'ETL任务', '29', 'DBColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('12', 'RelETLTaskHiveColumn', 'ETL任务和Hive字段依赖关系', '49', 'ETLTask', 'ETL任务', '39', 'HiveColumns', 'Hive字段');
INSERT INTO `tb_metamodel_dep` VALUES ('13', 'RelETLTaskHbaseNameSpace', '命名空间与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '40', 'HbaseNameSpace', '命名空间');
INSERT INTO `tb_metamodel_dep` VALUES ('14', 'RelHbaseTableETLTask', 'Hbase表与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '41', 'HbaseTable', 'Hbase表');
INSERT INTO `tb_metamodel_dep` VALUES ('15', 'RelHbaseFamilyETLTask', '列族与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '42', 'HbaseFamily', '列族');
INSERT INTO `tb_metamodel_dep` VALUES ('16', 'RelETLTaskETLTask', 'ETL任务和ETL任务依赖关系', '49', 'ETLTask', 'ETL任务', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('17', 'RelHdfsFileSystemETLTask', 'Hdfs文件系统与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '34', 'HdfsFileSystem', '文件系统');
INSERT INTO `tb_metamodel_dep` VALUES ('18', 'RelHdfsFolderETLTask', 'Hdfs文件夹与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '35', 'HdfsFolder', '文件夹');
INSERT INTO `tb_metamodel_dep` VALUES ('19', 'RelHdfsFileETLTask', 'Hdfs文件的ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '36', 'HdfsFile', '文件');
INSERT INTO `tb_metamodel_dep` VALUES ('20', 'RelETLTaskHiveDataBase', 'ETL任务和Hive数据库依赖关系', '49', 'ETLTask', 'ETL任务', '37', 'HiveDatabase', 'Hive数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('21', 'RelETLTaskHiveTable', 'Hive表与ETL任务的依赖', '49', 'ETLTask', 'ETL任务', '38', 'HiveTable', 'Hive表');
INSERT INTO `tb_metamodel_dep` VALUES ('22', 'RelHbaseTableHbaseTable', 'Hbase表与Hbase表的依赖', '41', 'HbaseTable', 'Hbase表', '41', 'HbaseTable', 'Hbase表');
INSERT INTO `tb_metamodel_dep` VALUES ('23', 'RelETLTaskHbaseTable', 'ETL任务与Hbase表的依赖', '41', 'HbaseTable', 'Hbase表', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('24', 'RelETLTaskHbaseFamily', 'ETL任务与列族的依赖', '42', 'HbaseFamily', '列族', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('25', 'RelHBaseNameSpaceHBaseNameSpace', '命名空间与命名空间的依赖', '40', 'HbaseNameSpace', '命名空间', '40', 'HbaseNameSpace', '命名空间');
INSERT INTO `tb_metamodel_dep` VALUES ('26', 'RelDataSourceLayerHbaseNameSpace', '数据源分层与命名空间的依赖', '40', 'HbaseNameSpace', '命名空间', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_dep` VALUES ('27', 'RelETLTaskHbaseNameSpace', 'ETL任务与命名空间的依赖', '40', 'HbaseNameSpace', '命名空间', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('28', 'RelETLTaskHdfsFolder', 'ETL任务与Hdfs文件夹的依赖', '35', 'HdfsFolder', '文件夹', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('29', 'RelETLTaskHdfsFileSystem', 'ETL任务与Hdfs文件系统的依赖', '34', 'HdfsFileSystem', '文件系统', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('30', 'RelDataSourceLayerHdfsFileSystem', '数据源分层与HDFS文件系统的依赖', '34', 'HdfsFileSystem', '文件系统', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_dep` VALUES ('31', 'RelETLTaskHdfsFile', 'ETL任务与Hdfs文件的依赖', '36', 'HdfsFile', '文件', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('32', 'RelHiveTableHiveTable', 'Hive表与Hive表的依赖', '38', 'HiveTable', 'Hive表', '38', 'HiveTable', 'Hive表');
INSERT INTO `tb_metamodel_dep` VALUES ('33', 'RelETLTaskHiveTable', 'ETL任务与Hive表的依赖', '38', 'HiveTable', 'Hive表', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('34', 'RelHiveTableHiveTableAuthority', 'Hive表与Hive表权限的依赖', '67', 'HiveTableAuthority', 'Hive表权限', '38', 'HiveTable', 'Hive表');
INSERT INTO `tb_metamodel_dep` VALUES ('35', 'RelHiveDatabaseHiveDatabase', 'Hive数据库与Hive数据库的依赖', '37', 'HiveDatabase', 'Hive数据库', '37', 'HiveDatabase', 'Hive数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('36', 'RelDataSourceLayerHiveDatabase', '数据源分层与Hive数据库的依赖', '37', 'HiveDatabase', 'Hive数据库', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_dep` VALUES ('37', 'RelETLTaskHiveDatabase', 'ETL任务与数据库的依赖', '37', 'HiveDatabase', 'Hive数据库', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('38', 'RelHiveColumnsHiveColumns', 'Hive字段与Hive字段的依赖', '39', 'HiveColumns', 'Hive字段', '39', 'HiveColumns', 'Hive字段');
INSERT INTO `tb_metamodel_dep` VALUES ('39', 'RelDataElementHiveColumns', '数据元与Hive字段的依赖关系', '39', 'HiveColumns', 'Hive字段', '21', 'DataElement', '数据元');
INSERT INTO `tb_metamodel_dep` VALUES ('40', 'RelETLTaskHiveColumns', 'ETL任务与Hive字段的依赖', '39', 'HiveColumns', 'Hive字段', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('41', 'RelQualityTaskDBDataBase', '质量任务和关系型数据库依赖关系', '59', 'QualityTask', '质量任务', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('42', 'RelQualityTaskDBTable', '质量任务和关系型表依赖关系', '59', 'QualityTask', '质量任务', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('43', 'RelQualityTaskDBColumn', '质量任务和关系型字段依赖关系', '59', 'QualityTask', '质量任务', '29', 'DBColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('44', 'RelQualityRuleQualityTask', '质量规则与质量任务的依赖关系', '59', 'QualityTask', '质量任务', '24', 'QualityRule', '质量规则');
INSERT INTO `tb_metamodel_dep` VALUES ('45', 'RelESTableDBTable', 'ES表与关系型表的依赖', '28', 'DBTable', '表', '45', 'ESTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('46', 'RelDBTableDBTable', '表与表的依赖', '28', 'DBTable', '表', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('47', 'RelETLTaskDBTable', '表与ETL任务的依赖', '28', 'DBTable', '表', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('48', 'RelDBTableDBView', '表与视图的依赖', '32', 'DBView', '视图', '28', 'DBTable', '表');
INSERT INTO `tb_metamodel_dep` VALUES ('49', 'RelDBViewDBView', '视图与视图的依赖', '32', 'DBView', '视图', '32', 'DBView', '视图');
INSERT INTO `tb_metamodel_dep` VALUES ('50', 'RelESDatabaseDBDatabase', 'ES数据库与关系型库的依赖', '27', 'DBDatabase', '数据库', '44', 'ESDataBase', '数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('51', 'RelDBDatabaseDBDatabase', '数据库与数据库的依赖', '27', 'DBDatabase', '数据库', '27', 'DBDatabase', '数据库');
INSERT INTO `tb_metamodel_dep` VALUES ('52', 'RelDataSourceLayerDBDatabase', '数据源分层与数据库的依赖', '27', 'DBDatabase', '数据库', '26', 'DataSourceLayer', '数据源分层');
INSERT INTO `tb_metamodel_dep` VALUES ('53', 'RelETLTaskDBDatabase', 'ETL任务与数据库的依赖', '27', 'DBDatabase', '数据库', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('54', 'RelDBColumnDBIndex', '字段与索引的依赖', '33', 'DBIndex', '索引', '29', 'DBColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('55', 'RelDBForeignKeyDBColumns', '外键与字段的依赖', '31', 'DBForeignKey', '外键', '29', 'DBColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('56', 'RelDBColumnsDBColumns', '字段与字段的依赖', '29', 'DBColumns', '字段', '29', 'DBColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('57', 'RelDBForeignKeyDBColumns', '字段与外键的依赖', '29', 'DBColumns', '字段', '31', 'DBForeignKey', '外键');
INSERT INTO `tb_metamodel_dep` VALUES ('58', 'RelDataElementDBColumns', '数据元与关系型数据库字段的依赖关系', '29', 'DBColumns', '字段', '21', 'DataElement', '数据元');
INSERT INTO `tb_metamodel_dep` VALUES ('59', 'RelETLTaskDBColumns', '字段与ETL任务的依赖', '29', 'DBColumns', '字段', '49', 'ETLTask', 'ETL任务');
INSERT INTO `tb_metamodel_dep` VALUES ('60', 'RelESColumnsDBColumns', 'ES字段与关系型字段的依赖', '29', 'DBColumns', '字段', '46', 'ESColumns', '字段');
INSERT INTO `tb_metamodel_dep` VALUES ('61', 'RelCodeSetDataElement', '代码集与数据元的依赖关系', '21', 'DataElement', '数据元', '22', 'CodeSet', '代码集');
INSERT INTO `tb_metamodel_dep` VALUES ('62', 'RelDataElementCheckObject', '数据元与校验对象的依赖关系', '25', 'CheckObject', '校验对象', '21', 'DataElement', '数据元');

-- ----------------------------
-- Table structure for tb_quality_rule
-- ----------------------------
DROP TABLE IF EXISTS `tb_quality_rule`;
CREATE TABLE `tb_quality_rule` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL COMMENT '数据源id',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名称',
  `column_num` int(11) DEFAULT NULL COMMENT '字段个数',
  `check_field_num` int(11) DEFAULT NULL COMMENT '校验的字段个数',
  `rule_num` int(11) DEFAULT NULL COMMENT '规则总数',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `responsible_person` bigint(20) DEFAULT NULL COMMENT '责任人用户id',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `delete_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_quality_rule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_quality_rule_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_quality_rule_detail`;
CREATE TABLE `tb_quality_rule_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则的id',
  `field_validate_switch` varchar(10) DEFAULT NULL COMMENT '校验启动开关',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户id',
  `column_name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `data_ele_id` bigint(20) DEFAULT NULL COMMENT '数据元id',
  `format_verify_status` char(10) DEFAULT NULL COMMENT '格式校验的勾选状态',
  `interval_status` char(10) DEFAULT NULL COMMENT '数据范围的校验勾选状态',
  `defect_status` char(10) DEFAULT NULL COMMENT '空值校验的勾选状态',
  `enum_status` char(10) DEFAULT NULL COMMENT '值域校验的勾选状态',
  `regular_status` char(10) DEFAULT NULL COMMENT '正则表达式校验的勾选状态',
  `delete_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  `de_format` varchar(255) DEFAULT NULL COMMENT '数据元格式',
  `de_length` varchar(255) DEFAULT NULL COMMENT '数据元格式长度',
  `data_range` varchar(255) DEFAULT NULL COMMENT '数值范围',
  `code_set_id` bigint(20) DEFAULT NULL COMMENT '值域id',
  `regular_name` varchar(255) DEFAULT NULL COMMENT '正则校验名称',
  `regular_value` varchar(255) DEFAULT NULL COMMENT '正则校验的值',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_quality_rule_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tb_source_layer
-- ----------------------------
DROP TABLE IF EXISTS `tb_source_layer`;
CREATE TABLE `tb_source_layer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '数据源分层名称',
  `parent_id` int(11) NOT NULL COMMENT '父层级的id',
  `remark` varchar(50) DEFAULT NULL COMMENT '分层描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `unique_code` varchar(255) DEFAULT NULL COMMENT '数据源分层识别码 DataSourceLayer^+id',
  `buildin` char(1) DEFAULT 'N' COMMENT '是否为内置数据源分层(Y:是，N:否)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据源分层表';

-- ----------------------------
-- Records of tb_source_layer
-- ----------------------------
INSERT INTO `tb_source_layer` VALUES ('37', '接入层', '-1', '接入层', '2018-12-28 14:52:26', '2018-12-28 14:52:26', 'DataSourceLayer^37', 'N');
INSERT INTO `tb_source_layer` VALUES ('38', '明细层', '-1', '明细层', '2018-12-28 14:52:37', '2018-12-28 14:52:37', 'DataSourceLayer^38', 'N');
INSERT INTO `tb_source_layer` VALUES ('39', '汇总层', '-1', '汇总层', '2018-12-28 14:52:47', '2018-12-28 14:52:47', 'DataSourceLayer^39', 'N');
INSERT INTO `tb_source_layer` VALUES ('40', '应用层', '-1', '应用层', '2018-12-28 14:53:00', '2018-12-28 14:53:00', 'DataSourceLayer^40', 'N');

-- ----------------------------
-- Table structure for tb_standard_audit
-- ----------------------------
DROP TABLE IF EXISTS `tb_standard_audit`;
CREATE TABLE `tb_standard_audit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `type` varchar(50) DEFAULT NULL COMMENT '所属类型 0：数据元 1：数据集 2：代码',
  `submitter` varchar(50) DEFAULT NULL COMMENT '送审人',
  `submit_time` datetime DEFAULT NULL COMMENT '送审时间',
  `status` varchar(10) DEFAULT '0' COMMENT '审核状态(0:待审核,1:已审核)',
  `flow_id` int(10) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL COMMENT '审核描述',
  `audit_result` varchar(10) DEFAULT NULL COMMENT '审核结果(1:通过，2:退回)',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标准审核表';

-- ----------------------------
-- Records of tb_standard_audit
-- ----------------------------

-- ----------------------------
-- Table structure for tb_standard_audit_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_standard_audit_detail`;
CREATE TABLE `tb_standard_audit_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_result` varchar(50) DEFAULT NULL COMMENT '审核结论(1:通过，2:退回)',
  `audit_desc` varchar(50) DEFAULT NULL COMMENT '审核描述',
  `standard_audit_id` int(10) DEFAULT NULL COMMENT '标准审核id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_standard_audit_detail
-- ----------------------------
