--
-- 表的结构 `t_tgks_wms_customer`
--
DROP TABLE IF EXISTS `t_tgks_wms_customer`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_customer` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `name` varchar(100) NOT NULL COMMENT '客户名称',
  `address` varchar(200) default NULL COMMENT '地址',
  `account` varchar(100) default NULL COMMENT '银行账户',
  `bank` varchar(200) default NULL COMMENT '开户银行',
  `taxnumber` varchar(50) default NULL COMMENT '税号',
  `details` varchar(1000) default NULL COMMENT '详细信息',
  `category` varchar(500) default NULL COMMENT '主营商品类别',
  `url` varchar(100) default NULL COMMENT '网址URL',
  `person` varchar(50) NOT NULL COMMENT '联系人',
  `sex` varchar(5) NOT NULL COMMENT '性别',
  `age` varchar(5) NOT NULL COMMENT '年龄',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `mobile` varchar(30) default NULL COMMENT '手机',
  `tel` varchar(30) default NULL COMMENT '电话',
  `fax` varchar(30) default NULL COMMENT '传真',
  `qq` varchar(30) default NULL COMMENT 'QQ',
  `alww` varchar(30) default NULL COMMENT '阿里旺旺',
  `msn` varchar(30) default NULL COMMENT 'MSN',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户信息表';



