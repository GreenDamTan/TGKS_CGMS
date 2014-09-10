package com.moemao.tgks.cgweb.card.action;

import java.util.Collections;
import java.util.List;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderReq;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.cgms.tool.CgmsConstant;
import com.moemao.tgks.cgweb.tool.CardIdComparator;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.ums.user.entity.UserEvt;
import com.opensymphony.xwork2.ActionContext;

public class CardOrderAction extends TGKSAction
{
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 1693703474450507646L;
    
    private CardOrderService cgms_cardOrderService;
	
    private CardOrderEvt cardOrder;
    
    public String addCardOrder()
    {
    	// 获取当前登录用户的信息
    	UserEvt user = (UserEvt) ActionContext.getContext().getSession().get(CommonConstant.USER_INFO);
    	
    	CardOrderReq cardOrderReq = new CardOrderReq();
    	cardOrderReq.setUid(user.getId());
    	// 查询预定状态的
    	cardOrderReq.setStatus(CgmsConstant.CARDORDER_STATUS_0);

    	// 根据用户信息查询当前的订单记录
    	List<CardOrderEvt> list = cgms_cardOrderService.queryCardOrder(cardOrderReq);
    	
    	if (CommonUtil.isEmpty(list))
    	{
    		// 如果不存在 则新建一条记录
        	cardOrder.setStatus(CgmsConstant.CARDORDER_STATUS_0);
        	cardOrder.setUid(user.getId());
        	cardOrder.setUsername(user.getUsername());
        	cardOrder.setAlww(user.getName());
        	
        	// 使用排序器Comparator进行排序 根据id的hashcode顺序
        	List<String> cardIdList = CommonUtil.stringToList(cardOrder.getCardId());
        	Collections.sort(cardIdList, new CardIdComparator());
        	cardOrder.setCardId(CommonUtil.listToString(cardIdList));
        	
        	// 保存新纪录
        	cgms_cardOrderService.addCardOrder(cardOrder);
    	}
    	else
    	{
    		// 如果存在
    		CardOrderEvt oldCardOrder = list.get(0);
        	
        	// 处理卡片ID 去除重复
        	String cardId = this.dealCardId(oldCardOrder.getCardId());
        	oldCardOrder.setCardId(cardId);
        	
        	// 更新该记录
        	cgms_cardOrderService.updateCardOrder(oldCardOrder);
    	}
    	
    	return SUCCESS;
    }
    
    /**
     * 
     * @Title: dealCardId
     * @Description: 原有卡片订单记录时，再选择卡片加入该订单，新旧数据取去重复的并集
     * @param oldListStr
     * @return
     * @return String 返回类型
     * @throws
     */
    private String dealCardId(String oldListStr)
    {
    	// 新加入的数据
		List<String> newList = CommonUtil.stringToList(cardOrder.getCardId());
		
		// 旧数据
		List<String> oldList = CommonUtil.stringToList(oldListStr);
		
		// 取两个List的去重复的并集
		newList.removeAll(oldList);
		oldList.addAll(newList);
		
		// 使用排序器Comparator进行排序 根据id的hashcode顺序
        Collections.sort(oldList, new CardIdComparator());
        cardOrder.setCardId(CommonUtil.listToString(oldList));
		
		return CommonUtil.listToString(oldList);
    }

	public CardOrderService getCgms_cardOrderService()
    {
    	return cgms_cardOrderService;
    }

	public void setCgms_cardOrderService(CardOrderService cgms_cardOrderService)
    {
    	this.cgms_cardOrderService = cgms_cardOrderService;
    }

	public CardOrderEvt getCardOrder()
    {
    	return cardOrder;
    }

	public void setCardOrder(CardOrderEvt cardOrder)
    {
    	this.cardOrder = cardOrder;
    }
}
