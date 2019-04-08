/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : tf-demo

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 07/04/2019 16:24:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_core_train
-- ----------------------------
DROP TABLE IF EXISTS `t_core_train`;
CREATE TABLE `t_core_train` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `data_state` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `sort` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类',
  `choiced` bit(1) DEFAULT NULL COMMENT '选中',
  `deleted` bit(1) DEFAULT NULL COMMENT '删除',
  `side` bit(1) DEFAULT NULL COMMENT '方面',
  `state` int(4) DEFAULT NULL COMMENT '状态',
  `flag` int(4) DEFAULT NULL COMMENT '标志',
  `date` date DEFAULT NULL COMMENT '日期',
  `datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `quantity` int(4) DEFAULT NULL COMMENT '数量',
  `total` decimal(12,2) DEFAULT NULL COMMENT '合计',
  `visible` int(1) DEFAULT NULL COMMENT '隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


update t_sys_user set username = 'chelian' , password = 'b16685c1f365e415a0c743dedc814e714d02ce64' where id = 1 ;

update t_sys_menu set data_state = 'Disable' where id in (23,3,19);


-- Train
INSERT INTO `t_sys_menu` (`created_time`, `updated_time`, `data_state`, `name`, `url`, `description`, `sort`, `i18n`, `icon_cls`, `parent_id`) VALUES (now(), now(), 'Enable', '培训表单',
'/admin/train', '', '0', null, null, NULL);

INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/page-list', 'Train-获取Train分页数据');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/list', 'Train-获取Train列表数据');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/create', 'Train-创建Train');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/update', 'Train-修改Train');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/careful-delete', 'Train-删除Train');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/detail', 'Train-查看Train详情');
INSERT INTO `t_sys_url` (`created_time`, `updated_time`, `data_state`, `url`, `description`) VALUES (now(), now(), 'Enable', '/admin/train/exist', 'Train-检查Train属性是否存在');


SET FOREIGN_KEY_CHECKS = 1;
