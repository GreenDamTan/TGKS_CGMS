package com.moemao.tgks.cgweb.card.action;

import java.util.List;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.entity.KssmaReq;
import com.moemao.tgks.cgms.kssma.service.KssmaService;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonUtil;

public class KssmaCardAction extends TGKSAction
{

	/** 
     * serialVersionUID
     */ 
    private static final long serialVersionUID = 7478298686255043164L;
    
    /**
	 * ﻿Kssma业务接口
	 */
	private KssmaService cgms_kssmaService;
	
	private CardOrderService cgms_cardOrderService;
	
	/**
	 * 查询结果集
	 */
	private List<KssmaEvt> list;
	
	private List<String> preNameList;
	
	/**
	 * ﻿KssmaEvt对象
	 */
	private KssmaEvt kssmaEvt;
	
	/**
	 * ﻿Kssma查询条件封装对象
	 */
	private KssmaReq kssmaReq = new KssmaReq();
	
	/**
	 * 购物车页面使用的cardOrderId
	 */
	private String cardOrderId;
	
	/**
	 * 
	 * @Title: kssmaCard
	 * @Description: Kssma卡牌选择页面
	 * @return
	 * @return String 返回类型
	 * @throws
	 */
    public String kssmaCard()
    {
        preNameList = cgms_kssmaService.queryKssmaPreName();
        
    	return SUCCESS;
    }
    
    /**
     * 
     * @Title: queryKssmaCard
     * @Description: Kssma卡片列表页面
     * @return
     * @return String 返回类型
     * @throws
     */
    public String queryKssmaCard()
    {
    	list = cgms_kssmaService.queryKssma(kssmaReq);
    	
		return SUCCESS;
    }
    
    /**
     * 
     * @Title: kssmaCart
     * @Description: Kssma购物车页面
     * @return
     * @return String 返回类型
     * @throws
     */
    public String kssmaCart()
    {
        String id = this.getRequest().getParameter("id");
        cardOrderId = id;
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: kssmaCartHistory
     * @Description: Kssma购物车历史页面 不可删除卡片
     * @return
     * @return String 返回类型
     * @throws
     */
    public String kssmaCartHistory()
    {
        String id = this.getRequest().getParameter("id");
        cardOrderId = id;
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: queryKssmaCart
     * @Description: Kssma购物车卡片列表
     * @return
     * @return String 返回类型
     * @throws
     */
    public String queryKssmaCart()
    {
        CardOrderEvt cardOrder = cgms_cardOrderService.queryCardOrderById(cardOrderId);
        
        list = cgms_kssmaService.queryKssmaByCardId(CommonUtil.stringToList(cardOrder.getCardId()));
        return SUCCESS;
    }

	public KssmaService getCgms_kssmaService()
    {
    	return cgms_kssmaService;
    }

	public void setCgms_kssmaService(KssmaService cgms_kssmaService)
    {
    	this.cgms_kssmaService = cgms_kssmaService;
    }

	public CardOrderService getCgms_cardOrderService()
    {
        return cgms_cardOrderService;
    }

    public void setCgms_cardOrderService(CardOrderService cgms_cardOrderService)
    {
        this.cgms_cardOrderService = cgms_cardOrderService;
    }

    public List<KssmaEvt> getList()
    {
    	return list;
    }

	public void setList(List<KssmaEvt> list)
    {
    	this.list = list;
    }

	public List<String> getPreNameList()
    {
        return preNameList;
    }

    public void setPreNameList(List<String> preNameList)
    {
        this.preNameList = preNameList;
    }

    public KssmaEvt getKssmaEvt()
    {
    	return kssmaEvt;
    }

	public void setKssmaEvt(KssmaEvt kssmaEvt)
    {
    	this.kssmaEvt = kssmaEvt;
    }

	public KssmaReq getKssmaReq()
    {
    	return kssmaReq;
    }

	public void setKssmaReq(KssmaReq kssmaReq)
    {
    	this.kssmaReq = kssmaReq;
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
