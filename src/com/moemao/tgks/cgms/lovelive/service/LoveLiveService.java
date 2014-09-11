package com.moemao.tgks.cgms.lovelive.service;

import java.util.List;

import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;

public interface LoveLiveService
{
	public List<LoveLiveEvt> queryLoveLive(LoveLiveReq loveLiveReq);
	
	public LoveLiveEvt queryLoveLiveById(String id);
	
	public int addLoveLive(LoveLiveEvt loveLiveEvt);
	
	public int updateLoveLive(LoveLiveEvt loveLiveEvt);
	
	public int deleteLoveLive(List<String> ids);
	
	public List<LoveLiveEvt> queryLoveLiveByCardId(List<String> list);
}