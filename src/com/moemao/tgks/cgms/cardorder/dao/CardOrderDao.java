package com.moemao.tgks.cgms.cardorder.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.entity.CardOrderReq;

public interface CardOrderDao extends TGKSDao
{
public List<CardOrderEvt> cgms_queryCardOrder(CardOrderReq cardOrderReq) throws DataAccessException;

public int cgms_addCardOrder(CardOrderEvt cardOrderEvt) throws DataAccessException;

public int cgms_updateCardOrder(CardOrderEvt cardOrderEvt) throws DataAccessException;

public int cgms_deleteCardOrder(List<String> list) throws DataAccessException;
}