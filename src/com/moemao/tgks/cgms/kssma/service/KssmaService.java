package com.moemao.tgks.cgms.kssma.service;

import java.util.List;

import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.entity.KssmaReq;

public interface KssmaService
{
public List<KssmaEvt> queryKssma(KssmaReq kssmaReq);

public KssmaEvt queryKssmaById(String id);

public int addKssma(KssmaEvt kssmaEvt);

public int updateKssma(KssmaEvt kssmaEvt);

public int deleteKssma(List<String> ids);

public List<KssmaEvt> queryKssmaByCardId(List<String> list);

public List<String> queryKssmaPreName();
}