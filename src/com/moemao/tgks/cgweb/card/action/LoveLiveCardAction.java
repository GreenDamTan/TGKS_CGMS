package com.moemao.tgks.cgweb.card.action;

import java.util.List;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;
import com.moemao.tgks.cgms.lovelive.service.LoveLiveService;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonUtil;

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
	
	private CardOrderService cgms_cardOrderService;
	
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
	
	/**
	 * 购物车页面使用的cardOrderId
	 */
	private String cardOrderId;
	
	/**
	 * 
	 * @Title: loveLiveCard
	 * @Description: LoveLive卡牌选择页面
	 * @return
	 * @return String 返回类型
	 * @throws
	 */
    public String loveLiveCard()
    {
    	return SUCCESS;
    }
    
    /**
     * 
     * @Title: queryLoveLiveCard
     * @Description: LoveLive卡片列表页面
     * @return
     * @return String 返回类型
     * @throws
     */
    public String queryLoveLiveCard()
    {
    	list = cgms_loveLiveService.queryLoveLive(loveLiveReq);
    	
		return SUCCESS;
    }
    
    /**
     * 
     * @Title: loveLiveCart
     * @Description: LoveLive购物车页面
     * @return
     * @return String 返回类型
     * @throws
     */
    public String loveLiveCart()
    {
        String id = this.getRequest().getParameter("id");
        cardOrderId = id;
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: loveLiveCartHistory
     * @Description: LoveLive购物车历史页面 不可删除卡片
     * @return
     * @return String 返回类型
     * @throws
     */
    public String loveLiveCartHistory()
    {
        String id = this.getRequest().getParameter("id");
        cardOrderId = id;
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: queryLoveLiveCart
     * @Description: LoveLive购物车卡片列表
     * @return
     * @return String 返回类型
     * @throws
     */
    public String queryLoveLiveCart()
    {
        CardOrderEvt cardOrder = cgms_cardOrderService.queryCardOrderById(cardOrderId);
        
        if (CommonUtil.isEmpty(cardOrder))
        {
            return SUCCESS;
        }
        
        list = cgms_loveLiveService.queryLoveLiveByCardId(CommonUtil.stringToList(cardOrder.getCardId()));
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

	public CardOrderService getCgms_cardOrderService()
    {
        return cgms_cardOrderService;
    }

    public void setCgms_cardOrderService(CardOrderService cgms_cardOrderService)
    {
        this.cgms_cardOrderService = cgms_cardOrderService;
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

    public String getCardOrderId()
    {
        return cardOrderId;
    }

    public void setCardOrderId(String cardOrderId)
    {
        this.cardOrderId = cardOrderId;
    }
}
