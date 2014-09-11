package com.moemao.tgks.cgms.cardorder.service;

import java.util.List;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderReq;

public interface CardOrderService
{
public List<CardOrderEvt> queryCardOrder(CardOrderReq cardOrderReq);

public CardOrderEvt queryCardOrderById(String id);

public int addCardOrder(CardOrderEvt cardOrderEvt);

public int updateCardOrder(CardOrderEvt cardOrderEvt);

public int deleteCardOrder(List<String> ids);

public int finishCardOrder(List<String> ids);

}