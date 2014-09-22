package com.moemao.tgks.cgms.lovelive.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;
import com.moemao.tgks.common.core.dao.TGKSDao;

public interface LoveLiveDao extends TGKSDao
{
	public List<LoveLiveEvt> cgms_queryLoveLive(LoveLiveReq loveLiveReq)
	        throws DataAccessException;
	
	public int cgms_addLoveLive(LoveLiveEvt loveLiveEvt)
	        throws DataAccessException;
	
	public int cgms_updateLoveLive(LoveLiveEvt loveLiveEvt)
	        throws DataAccessException;
	
	public int cgms_deleteLoveLive(List<String> list)
	        throws DataAccessException;
	
	public List<LoveLiveEvt> cgms_queryLoveLiveByCardId(List<String> list)
	        throws DataAccessException;
}