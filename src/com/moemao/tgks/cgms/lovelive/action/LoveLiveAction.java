package com.moemao.tgks.cgms.lovelive.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveReq;
import com.moemao.tgks.cgms.lovelive.service.LoveLiveService;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;

public class LoveLiveAction extends TGKSAction
{
	
	/** 
     * serialVersionUID
     */ 
    private static final long serialVersionUID = 8613986245475130759L;

	private static Log logger = LogFactory.getLog(LoveLiveAction.class);
	
	/**
	 * ﻿LoveLive业务接口
	 */
	private LoveLiveService cgms_loveLiveService;
	
	/**
	 * 查询结果集
	 */
	private List<LoveLiveEvt> list;
	
	/**
	 * ﻿LoveLiveEvt对象
	 */
	private LoveLiveEvt loveLiveEvt;
	
	/**
	 * ﻿LoveLive查询条件封装对象
	 */
	private LoveLiveReq loveLiveReq;
	
	public String loveLiveManager()
	{
		return SUCCESS;
	}
	
	public String queryLoveLive()
	{
		list = cgms_loveLiveService.queryLoveLive(loveLiveReq);
		return SUCCESS;
	}
	
	public String editLoveLivePage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			loveLiveEvt = cgms_loveLiveService.queryLoveLiveById(id);
		}
		return SUCCESS;
	}
	
	public String editLoveLive()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "LoveLiveAction.updateLoveLive");
		int result = 0;
		if (CommonUtil.isEmpty(loveLiveEvt.getId()))
		{
			result = cgms_loveLiveService.addLoveLive(loveLiveEvt);
			CommonUtil.systemLog("cgms/editLoveLive.action",
			                CommonConstant.SYSTEMLOG_TYPE_1,
			                result == 0 ? CommonConstant.FAILD
			                        : CommonConstant.SUCCESS,
			                String.format("新增loveLiveEvt\n%S",
			                        loveLiveEvt.toString()));
		}
		else
		{
			result = cgms_loveLiveService.updateLoveLive(loveLiveEvt);
			CommonUtil.systemLog("cgms/editLoveLive.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改loveLiveEvt\n%S", loveLiveEvt.toString()));
		}
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "LoveLiveAction.updateLoveLive");
		return SUCCESS;
	}
	
	public String deleteLoveLive()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "LoveLiveAction.deleteLoveLive");
		String ids = this.getRequest().getParameter("ids");
		int result = cgms_loveLiveService.deleteLoveLive(CommonUtil.stringToList(ids));
		CommonUtil.systemLog("cgms/deleteLoveLive.action",
		        CommonConstant.SYSTEMLOG_TYPE_3,
		        result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS,
		        String.format("删除loveLiveEvt\nID:%S", ids));
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "LoveLiveAction.deleteLoveLive");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 cgms_loveLiveService
	 */
	public LoveLiveService getCgms_loveLiveService()
	{
		return cgms_loveLiveService;
	}
	
	/**
	 * @param 对cgms_loveLiveService进行赋值
	 */
	public void setCgms_loveLiveService(LoveLiveService cgms_loveLiveService)
	{
		this.cgms_loveLiveService = cgms_loveLiveService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<LoveLiveEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<LoveLiveEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 loveLiveEvt
	 */
	public LoveLiveEvt getLoveLiveEvt()
	{
		return loveLiveEvt;
	}
	
	/**
	 * @param 对loveLiveEvt进行赋值
	 */
	public void setLoveLiveEvt(LoveLiveEvt loveLiveEvt)
	{
		this.loveLiveEvt = loveLiveEvt;
	}
	
	/**
	 * @return 返回 loveLiveReq
	 */
	public LoveLiveReq getLoveLiveReq()
	{
		return loveLiveReq;
	}
	
	/**
	 * @param 对loveLiveReq进行赋值
	 */
	public void setLoveLiveReq(LoveLiveReq loveLiveReq)
	{
		this.loveLiveReq = loveLiveReq;
	}
	
}