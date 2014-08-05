package com.moemao.tgks.cgms.lovelive.service.impl;

import java.util.List;

import com.moemao.tgks.cgms.lovelive.dao.LoveLiveDao;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;
import com.moemao.tgks.cgms.lovelive.service.LoveLiveService;
import com.moemao.tgks.cgms.tool.CgmsUtil;
import com.moemao.tgks.common.tool.CommonUtil;

public class LoveLiveServiceImpl implements LoveLiveService
{
	/**
	 * ﻿LoveLiveDao
	 */
	private LoveLiveDao cgms_loveLiveDao;
	
	public List<LoveLiveEvt> queryLoveLive(LoveLiveReq loveLiveReq)
	{
		if (CommonUtil.isEmpty(loveLiveReq.getSortSql()))
		{
			loveLiveReq.setSortSql(" t.ID DESC");
		}
		return cgms_loveLiveDao.cgms_queryLoveLive(loveLiveReq);
	}
	
	public LoveLiveEvt queryLoveLiveById(String id)
	{
		LoveLiveReq loveLiveReq = new LoveLiveReq();
		loveLiveReq.setId(id);
		LoveLiveEvt loveLiveEvt = null;
		List<LoveLiveEvt> loveLiveList = cgms_loveLiveDao
		        .cgms_queryLoveLive(loveLiveReq);
		if (!CommonUtil.isEmpty(loveLiveList))
		{
			loveLiveEvt = loveLiveList.get(0);
		}
		return loveLiveEvt;
	}
	
	public int addLoveLive(LoveLiveEvt loveLiveEvt)
	{
		loveLiveEvt.setId(CgmsUtil.createUniqueID());
		return cgms_loveLiveDao.cgms_addLoveLive(loveLiveEvt);
	}
	
	public int updateLoveLive(LoveLiveEvt loveLiveEvt)
	{
		return cgms_loveLiveDao.cgms_updateLoveLive(loveLiveEvt);
	}
	
	public int deleteLoveLive(List<String> ids)
	{
		return cgms_loveLiveDao.cgms_deleteLoveLive(ids);
	}
	
	/**
	 * @return 返回 cgms_loveLiveDao
	 */
	public LoveLiveDao getCgms_loveLiveDao()
	{
		return cgms_loveLiveDao;
	}
	
	/**
	 * @param 对cgms_loveLiveDao进行赋值
	 */
	public void setCgms_loveLiveDao(LoveLiveDao cgms_loveLiveDao)
	{
		this.cgms_loveLiveDao = cgms_loveLiveDao;
	}
	
}