--
-- 表的结构 `t_tgks_cgms_lovelive`
--
DROP TABLE IF EXISTS `t_tgks_cgms_lovelive`;
CREATE TABLE IF NOT EXISTS `t_tgks_cgms_lovelive` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `cardid` varchar(30) NOT NULL COMMENT '卡牌ID',
  `character` varchar(30) default NULL COMMENT '角色',
  `rarity` varchar(30) default NULL COMMENT '稀有度（r sr ur）',
  `type` varchar(30) default NULL COMMENT '类型（smile pure cool all）',
  `imageurl` varchar(200) default NULL COMMENT '图片URL',
  `imageturl` varchar(200) default NULL COMMENT '觉醒图片URL',
  `maxlevel` varchar(10) default NULL COMMENT '最大等级',
  `minhp` varchar(10) default NULL COMMENT '一级HP',
  `minsmile` varchar(10) default NULL COMMENT '一级Smile',
  `minpure` varchar(10) default NULL COMMENT '一级Pure',
  `mincool` varchar(10) default NULL COMMENT '一级Cool',
  `maxhp` varchar(10) default NULL COMMENT '满级HP',
  `maxsmile` varchar(10) default NULL COMMENT '满级Smile',
  `maxpure` varchar(10) default NULL COMMENT '满级Pure',
  `maxcool` varchar(10) default NULL COMMENT '满级Cool',
  `appeal` varchar(30) default NULL COMMENT '特效',
  `appealinfo` varchar(200) default NULL COMMENT '特效描述',
  `centerskill` varchar(30) default NULL COMMENT 'Center技能',
  `centerskillinfo` varchar(200) default NULL COMMENT 'Center技能描述',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `cardid` (`cardid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Lovelive卡牌信息表';



