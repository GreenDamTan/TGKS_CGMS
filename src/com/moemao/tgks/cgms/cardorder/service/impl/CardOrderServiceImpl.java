package com.moemao.tgks.cgms.cardorder.service.impl;

import java.util.List;

import com.moemao.tgks.cgms.cardorder.dao.CardOrderDao;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderReq;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.cgms.tool.CgmsUtil;
import com.moemao.tgks.common.tool.CommonUtil;

public class CardOrderServiceImpl implements CardOrderService
{
/**
 * ﻿CardOrderDao
 */
private CardOrderDao cgms_cardOrderDao;

public List<CardOrderEvt> queryCardOrder(CardOrderReq cardOrderReq)
{
if (CommonUtil.isEmpty(cardOrderReq.getSortSql()))
{
cardOrderReq.setSortSql(" t.ID DESC");
}
return cgms_cardOrderDao.cgms_queryCardOrder(cardOrderReq);
}

public CardOrderEvt queryCardOrderById(String id)
{
CardOrderReq cardOrderReq = new CardOrderReq();
cardOrderReq.setId(id);
CardOrderEvt cardOrderEvt = null;
List<CardOrderEvt> cardOrderList = cgms_cardOrderDao.cgms_queryCardOrder(cardOrderReq);
if (!CommonUtil.isEmpty(cardOrderList))
{
cardOrderEvt = cardOrderList.get(0);
}
return cardOrderEvt;
}

public int addCardOrder(CardOrderEvt cardOrderEvt)
{
cardOrderEvt.setId(CgmsUtil.createUniqueID());
return cgms_cardOrderDao.cgms_addCardOrder(cardOrderEvt);
}

public int updateCardOrder(CardOrderEvt cardOrderEvt)
{
return cgms_cardOrderDao.cgms_updateCardOrder(cardOrderEvt);
}

public int deleteCardOrder(List<String> ids)
{
return cgms_cardOrderDao.cgms_deleteCardOrder(ids);
}

public int finishCardOrder(List<String> ids)
{
    return cgms_cardOrderDao.cgms_finishCardOrder(ids);
}

/**
 * @return 返回 cgms_cardOrderDao
 */
public CardOrderDao getCgms_cardOrderDao()
{
    return cgms_cardOrderDao;
}

/**
 * @param 对cgms_cardOrderDao进行赋值
 */
public void setCgms_cardOrderDao(CardOrderDao cgms_cardOrderDao)
{
    this.cgms_cardOrderDao = cgms_cardOrderDao;
}

}