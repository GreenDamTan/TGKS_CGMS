package com.moemao.tgks.cgweb.card.action;

import java.util.List;

import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;
import com.moemao.tgks.cgms.lovelive.service.LoveLiveService;
import com.moemao.tgks.common.core.action.TGKSAction;

public class LoveLiveCardAction extends TGKSAction
{

	/** 
     * serialVersionUID
     */ 
    private static final long serialVersionUID = 7478298686255043164L;
    
    /**
	 * ﻿LoveLive业务接口
	 */
	private LoveLiveService cgms_loveLiveService;
	
	/**
	 * 查询结果集
	 */
	private List<LoveLiveEvt> list;
	
	/**
	 * ﻿LoveLiveEvt对象
	 */
	private LoveLiveEvt loveLiveEvt;
	
	/**
	 * ﻿LoveLive查询条件封装对象
	 */
	private LoveLiveReq loveLiveReq = new LoveLiveReq();
	
    public String loveLiveCard()
    {
    	return SUCCESS;
    }
    
    public String queryLoveLiveCard()
    {
    	list = cgms_loveLiveService.queryLoveLive(loveLiveReq);
    	
		return SUCCESS;
    }

	public LoveLiveService getCgms_loveLiveService()
    {
    	return cgms_loveLiveService;
    }

	public void setCgms_loveLiveService(LoveLiveService cgms_loveLiveService)
    {
    	this.cgms_loveLiveService = cgms_loveLiveService;
    }

	public List<LoveLiveEvt> getList()
    {
    	return list;
    }

	public void setList(List<LoveLiveEvt> list)
    {
    	this.list = list;
    }

	public LoveLiveEvt getLoveLiveEvt()
    {
    	return loveLiveEvt;
    }

	public void setLoveLiveEvt(LoveLiveEvt loveLiveEvt)
    {
    	this.loveLiveEvt = loveLiveEvt;
    }

	public LoveLiveReq getLoveLiveReq()
    {
    	return loveLiveReq;
    }

	public void setLoveLiveReq(LoveLiveReq loveLiveReq)
    {
    	this.loveLiveReq = loveLiveReq;
    }
}
