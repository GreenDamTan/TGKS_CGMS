--
-- 转存表中的数据 `t_tgks_common_menu`
--

INSERT INTO `t_tgks_common_menu` (`id`, `preid`, `name`, `status`, `url`, `level`, `sort`) VALUES
('COMM20140806213655000001', '0', '卡牌管理系统', '1', '#', '1', '621'),
('COMM20140806214537000001', 'COMM20140806213655000001', 'LoveLive卡牌', '1', '../cgms/loveLiveManager.action', '2', '622'),
('COMM20140806214537000002', 'COMM20140806213655000001', '扩散性MA卡牌', '1', '../cgms/kssmaManager.action', '2', '623'),
('COMM20140806214537000099', 'COMM20140806213655000001', '卡牌订单', '1', '../cgms/cardOrderManager.action', '2', '629');