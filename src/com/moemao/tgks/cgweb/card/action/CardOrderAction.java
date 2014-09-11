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
    
    private List<CardOrderEvt> cardOrderList;
    
    private List<CardOrderEvt> oldCardOrderList;
    
    /**
     * 
     * @Title: addCardOrder
     * @Description: 将卡牌ID加入订单
     * @return
     * @return String 返回类型
     * @throws
     */
    public String addCardOrder()
    {
    	// 获取当前登录用户的信息
    	UserEvt user = (UserEvt) ActionContext.getContext().getSession().get(CommonConstant.USER_INFO);
    	
    	CardOrderReq cardOrderReq = new CardOrderReq();
    	cardOrderReq.setUid(user.getId());
    	cardOrderReq.setType(cardOrder.getType());
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
        	String cardId = this.addCardId(oldCardOrder.getCardId());
        	oldCardOrder.setCardId(cardId);
        	
        	// 更新该记录
        	cgms_cardOrderService.updateCardOrder(oldCardOrder);
    	}
    	
    	return SUCCESS;
    }
    
    /**
     * 
     * @Title: addCardId
     * @Description: 原有卡片订单记录时，再选择卡片加入该订单，新旧数据取去重复的并集
     * @param oldListStr
     * @return
     * @return String 返回类型
     * @throws
     */
    private String addCardId(String oldListStr)
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
		
		return CommonUtil.listToString(oldList);
    }
    
    /**
     * 
     * @Title: delCardOrder
     * @Description: 将选中的卡片ID从订单中删除
     * @return
     * @return String 返回类型
     * @throws
     */
    public String delCardOrder()
    {
        // 获取当前登录用户的信息
        UserEvt user = (UserEvt) ActionContext.getContext().getSession().get(CommonConstant.USER_INFO);
        
        CardOrderReq cardOrderReq = new CardOrderReq();
        cardOrderReq.setUid(user.getId());
        cardOrderReq.setType(cardOrder.getType());
        // 查询预定状态的
        cardOrderReq.setStatus(CgmsConstant.CARDORDER_STATUS_0);

        // 根据用户信息查询当前的订单记录
        List<CardOrderEvt> list = cgms_cardOrderService.queryCardOrder(cardOrderReq);
        
        if (CommonUtil.isEmpty(list))
        {
            return SUCCESS;
        }
        else
        {
            // 如果存在
            CardOrderEvt oldCardOrder = list.get(0);
            
            // 处理卡片ID 去除重复
            String cardId = this.delCardId(oldCardOrder.getCardId());
            oldCardOrder.setCardId(cardId);
            
            // 更新该记录
            cgms_cardOrderService.updateCardOrder(oldCardOrder);
        }
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: delCardId
     * @Description: 原有卡片订单记录时，再选择卡片加入该订单，新旧数据取去重复的并集
     * @param oldListStr
     * @return
     * @return String 返回类型
     * @throws
     */
    private String delCardId(String oldListStr)
    {
        // 新加入的数据
        List<String> newList = CommonUtil.stringToList(cardOrder.getCardId());
        
        // 旧数据
        List<String> oldList = CommonUtil.stringToList(oldListStr);
        
        // 老数据中删除选中的id
        oldList.removeAll(newList);
        
        if (CommonUtil.isEmpty(oldList))
        {
            return "";
        }
        
        // 使用排序器Comparator进行排序 根据id的hashcode顺序
        Collections.sort(oldList, new CardIdComparator());
        
        return CommonUtil.listToString(oldList);
    }
    
    /**
     * 
     * @Title: cardOrderHistory
     * @Description: 跳转至历史订单页面 上面显示当前订单
     * @return
     * @return String 返回类型
     * @throws
     */
    public String cardOrderHistory()
    {
        UserEvt user = (UserEvt) ActionContext.getContext().getSession().get(CommonConstant.USER_INFO);
        CardOrderReq cardOrderReq = new CardOrderReq();
        cardOrderReq.setUid(user.getId());
        cardOrderReq.setStatus(CgmsConstant.CARDORDER_STATUS_0);

        cardOrderList = cgms_cardOrderService.queryCardOrder(cardOrderReq);
        
        cardOrderReq = new CardOrderReq();
        cardOrderReq.setUid(user.getId());
        cardOrderReq.setStatus(CgmsConstant.CARDORDER_STATUS_1);
        
        oldCardOrderList = cgms_cardOrderService.queryCardOrder(cardOrderReq);
        
        return SUCCESS;
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

    public List<CardOrderEvt> getCardOrderList()
    {
        return cardOrderList;
    }

    public void setCardOrderList(List<CardOrderEvt> cardOrderList)
    {
        this.cardOrderList = cardOrderList;
    }

    public List<CardOrderEvt> getOldCardOrderList()
    {
        return oldCardOrderList;
    }

    public void setOldCardOrderList(List<CardOrderEvt> oldCardOrderList)
    {
        this.oldCardOrderList = oldCardOrderList;
    }
}
