package com.moemao.tgks.cgms.cardorder.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderReq;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;

public class CardOrderAction extends TGKSAction
{

	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 5822137160004716010L;

	private static Log logger = LogFactory.getLog(CardOrderAction.class);
	
	/**
	 * ﻿CardOrder业务接口
	 */
	private CardOrderService cgms_cardOrderService;
	
	/**
	 * 查询结果集
	 */
	private List<CardOrderEvt> list;
	
	/**
	 * ﻿CardOrderEvt对象
	 */
	private CardOrderEvt cardOrderEvt;
	
	/**
	 * ﻿CardOrder查询条件封装对象（自动生成代码后需要new对象）
	 */
	private CardOrderReq cardOrderReq = new CardOrderReq();
	
	public String cardOrderManager()
	{
	return SUCCESS;
	}
	
	public String queryCardOrder()
	{
		list = cgms_cardOrderService.queryCardOrder(cardOrderReq);
		return SUCCESS;
	}
	
	public String editCardOrderPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
		cardOrderEvt = cgms_cardOrderService.queryCardOrderById(id);
		}
		return SUCCESS;
	}
	
	public String editCardOrder()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CardOrderAction.updateCardOrder");
		int result = 0;
		if (CommonUtil.isEmpty(cardOrderEvt.getId()))
		{
		result = cgms_cardOrderService.addCardOrder(cardOrderEvt);
		CommonUtil.systemLog("cgms/editCardOrder.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增cardOrderEvt\n%S", cardOrderEvt.toString()));
		}
		else
		{
		result = cgms_cardOrderService.updateCardOrder(cardOrderEvt);
		CommonUtil.systemLog("cgms/editCardOrder.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改cardOrderEvt\n%S", cardOrderEvt.toString()));
		}
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CardOrderAction.updateCardOrder");
		return SUCCESS;
	}
	
	public String deleteCardOrder()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CardOrderAction.deleteCardOrder");
		String ids = this.getRequest().getParameter("ids");
		int result = cgms_cardOrderService.deleteCardOrder(CommonUtil.stringToList(ids));
		CommonUtil.systemLog("cgms/deleteCardOrder.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除cardOrderEvt\nID:%S", ids));
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CardOrderAction.deleteCardOrder");
		return SUCCESS;
	}
	
	public String finishCardOrder()
	{
	    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CardOrderAction.finishCardOrder");
	    String ids = this.getRequest().getParameter("ids");
        int result = cgms_cardOrderService.finishCardOrder(CommonUtil.stringToList(ids));
        CommonUtil.systemLog("cgms/finishCardOrder.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("完成cardOrderEvt\nID:%S", ids));
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CardOrderAction.finishCardOrder");
	    return SUCCESS;
	}
	
	/**
	 * @return 返回 cgms_cardOrderService
	 */
	public CardOrderService getCgms_cardOrderService()
	{
	    return cgms_cardOrderService;
	}
	
	/**
	 * @param 对cgms_cardOrderService进行赋值
	 */
	public void setCgms_cardOrderService(CardOrderService cgms_cardOrderService)
	{
	    this.cgms_cardOrderService = cgms_cardOrderService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<CardOrderEvt> getList()
	{
	    return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<CardOrderEvt> list)
	{
	    this.list = list;
	}
	
	/**
	 * @return 返回 cardOrderEvt
	 */
	public CardOrderEvt getCardOrderEvt()
	{
	    return cardOrderEvt;
	}
	
	/**
	 * @param 对cardOrderEvt进行赋值
	 */
	public void setCardOrderEvt(CardOrderEvt cardOrderEvt)
	{
	    this.cardOrderEvt = cardOrderEvt;
	}
	
	/**
	 * @return 返回 cardOrderReq
	 */
	public CardOrderReq getCardOrderReq()
	{
	    return cardOrderReq;
	}
	
	/**
	 * @param 对cardOrderReq进行赋值
	 */
	public void setCardOrderReq(CardOrderReq cardOrderReq)
	{
	    this.cardOrderReq = cardOrderReq;
	}

}