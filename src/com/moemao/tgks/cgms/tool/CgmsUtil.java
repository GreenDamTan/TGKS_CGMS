package com.moemao.tgks.cgms.tool;

import com.moemao.tgks.common.tool.IDUtil;
import com.moemao.tgks.cgms.tool.CgmsConstant;

public class CgmsUtil
{
	/**
     * CGMS模块唯一标识生成
     * 根据传入的模块标识生成24位的ID
     * 
     * @return
     */
    public static String createUniqueID()
    {
        return IDUtil.createUniqueID(CgmsConstant.MODULE_TAG);
    }
}
