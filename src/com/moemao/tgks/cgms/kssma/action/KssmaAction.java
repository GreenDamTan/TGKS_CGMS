package com.moemao.tgks.cgms.kssma.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.entity.KssmaReq;
import com.moemao.tgks.cgms.kssma.service.KssmaService;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;

public class KssmaAction extends TGKSAction
{

    /** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 6920144085564704398L;

    private static Log logger = LogFactory.getLog(KssmaAction.class);
    
    /**
     * ﻿Kssma业务接口
     */
    private KssmaService cgms_kssmaService;
    
    /**
     * 查询结果集
     */
    private List<KssmaEvt> list;
    
    /**
     * ﻿KssmaEvt对象
     */
    private KssmaEvt kssmaEvt;
    
    /**
     * ﻿Kssma查询条件封装对象（自动生成代码后需要new对象）
     */
    private KssmaReq kssmaReq = new KssmaReq();
    
    public String kssmaManager()
    {
    return SUCCESS;
    }
    
    public String queryKssma()
    {
    list = cgms_kssmaService.queryKssma(kssmaReq);
    return SUCCESS;
    }
    
    public String editKssmaPage()
    {
    String id = this.getRequest().getParameter("id");
    if (!CommonUtil.isEmpty(id))
    {
    kssmaEvt = cgms_kssmaService.queryKssmaById(id);
    }
    return SUCCESS;
    }
    
    public String editKssma()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "KssmaAction.updateKssma");
    int result = 0;
    if (CommonUtil.isEmpty(kssmaEvt.getId()))
    {
    result = cgms_kssmaService.addKssma(kssmaEvt);
    CommonUtil.systemLog("cgms/editKssma.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增kssmaEvt\n%S", kssmaEvt.toString()));
    }
    else
    {
    result = cgms_kssmaService.updateKssma(kssmaEvt);
    CommonUtil.systemLog("cgms/editKssma.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改kssmaEvt\n%S", kssmaEvt.toString()));
    }
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "KssmaAction.updateKssma");
    return SUCCESS;
    }
    
    public String deleteKssma()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "KssmaAction.deleteKssma");
    String ids = this.getRequest().getParameter("ids");
    int result = cgms_kssmaService.deleteKssma(CommonUtil.stringToList(ids));
    CommonUtil.systemLog("cgms/deleteKssma.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除kssmaEvt\nID:%S", ids));
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "KssmaAction.deleteKssma");
    return SUCCESS;
    }
    
    /**
     * @return 返回 cgms_kssmaService
     */
    public KssmaService getCgms_kssmaService()
    {
        return cgms_kssmaService;
    }
    
    /**
     * @param 对cgms_kssmaService进行赋值
     */
    public void setCgms_kssmaService(KssmaService cgms_kssmaService)
    {
        this.cgms_kssmaService = cgms_kssmaService;
    }
    
    /**
     * @return 返回 list
     */
    public List<KssmaEvt> getList()
    {
        return list;
    }
    
    /**
     * @param 对list进行赋值
     */
    public void setList(List<KssmaEvt> list)
    {
        this.list = list;
    }
    
    /**
     * @return 返回 kssmaEvt
     */
    public KssmaEvt getKssmaEvt()
    {
        return kssmaEvt;
    }
    
    /**
     * @param 对kssmaEvt进行赋值
     */
    public void setKssmaEvt(KssmaEvt kssmaEvt)
    {
        this.kssmaEvt = kssmaEvt;
    }
    
    /**
     * @return 返回 kssmaReq
     */
    public KssmaReq getKssmaReq()
    {
        return kssmaReq;
    }
    
    /**
     * @param 对kssmaReq进行赋值
     */
    public void setKssmaReq(KssmaReq kssmaReq)
    {
        this.kssmaReq = kssmaReq;
    }

}