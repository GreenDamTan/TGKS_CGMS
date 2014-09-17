package com.moemao.tgks.cgms.kssma.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.entity.KssmaReq;
import com.moemao.tgks.common.core.dao.TGKSDao;


public interface KssmaDao extends TGKSDao
{
    public List<KssmaEvt> cgms_queryKssma(KssmaReq kssmaReq) throws DataAccessException;
    
    public int cgms_addKssma(KssmaEvt kssmaEvt) throws DataAccessException;
    
    public int cgms_updateKssma(KssmaEvt kssmaEvt) throws DataAccessException;
    
    public int cgms_deleteKssma(List<String> list) throws DataAccessException;
}