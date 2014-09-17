package com.moemao.tgks.cgms.kssma.service.impl;

import java.util.List;

import com.moemao.tgks.cgms.kssma.dao.KssmaDao;
import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.entity.KssmaReq;
import com.moemao.tgks.cgms.kssma.service.KssmaService;
import com.moemao.tgks.cgms.tool.CgmsUtil;
import com.moemao.tgks.common.tool.CommonUtil;

public class KssmaServiceImpl implements KssmaService
{
/**
 * ﻿KssmaDao
 */
private KssmaDao cgms_kssmaDao;

public List<KssmaEvt> queryKssma(KssmaReq kssmaReq)
{
if (CommonUtil.isEmpty(kssmaReq.getSortSql()))
{
kssmaReq.setSortSql(" t.ID DESC");
}
return cgms_kssmaDao.cgms_queryKssma(kssmaReq);
}

public KssmaEvt queryKssmaById(String id)
{
KssmaReq kssmaReq = new KssmaReq();
kssmaReq.setId(id);
KssmaEvt kssmaEvt = null;
List<KssmaEvt> kssmaList = cgms_kssmaDao.cgms_queryKssma(kssmaReq);
if (!CommonUtil.isEmpty(kssmaList))
{
kssmaEvt = kssmaList.get(0);
}
return kssmaEvt;
}

public int addKssma(KssmaEvt kssmaEvt)
{
kssmaEvt.setId(CgmsUtil.createUniqueID());
return cgms_kssmaDao.cgms_addKssma(kssmaEvt);
}

public int updateKssma(KssmaEvt kssmaEvt)
{
return cgms_kssmaDao.cgms_updateKssma(kssmaEvt);
}

public int deleteKssma(List<String> ids)
{
return cgms_kssmaDao.cgms_deleteKssma(ids);
}

/**
 * @return 返回 cgms_kssmaDao
 */
public KssmaDao getCgms_kssmaDao()
{
    return cgms_kssmaDao;
}

/**
 * @param 对cgms_kssmaDao进行赋值
 */
public void setCgms_kssmaDao(KssmaDao cgms_kssmaDao)
{
    this.cgms_kssmaDao = cgms_kssmaDao;
}

}