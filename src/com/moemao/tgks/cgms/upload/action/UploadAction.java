package com.moemao.tgks.cgms.upload.action;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonUtil;

public class UploadAction extends TGKSAction
{
	/** 
     * serialVersionUID 
     */ 
    private static final long serialVersionUID = -5718559984231877984L;
    
    private String basePath = "/upload/cgms/";
	
    private File upload;
    
    private String uploadFileName;
    
    private String uploadContentType;
    
    private String uploadUrl;
    
    private String path;
    
    private String name;
    
    /**
     * 
     * @Title: updateCardImage
     * @Description: 通用卡牌图上传action 相对存放路径path（无斜杠开头 左斜杠结尾） 保存文件名name（不带后缀名）
     * @return
     * @throws Exception
     * @return String 返回类型
     * @throws
     */
    public String updateCardImage() throws Exception
    {
    	if (CommonUtil.isEmpty(path) || CommonUtil.isEmpty(name))
    	{
    		return ERROR;
    	}
    	
    	// 图片存放的真实路径
    	String realPath = ServletActionContext.getServletContext().getRealPath(basePath + path);
    	
    	String newFileName = name + "." + FilenameUtils.getExtension(uploadFileName);
    	
    	File copyFile = new File(realPath + File.separator  + newFileName);
    	
    	// 检验copyFile的存在 删除已存在的同名文件
		if (copyFile.exists())
		{
			copyFile.delete();
		}
    	
    	FileUtils.copyFile(upload, copyFile);
    	
    	uploadUrl = basePath + path + newFileName;
    	
    	return SUCCESS;
    }

	public File getUpload()
    {
    	return upload;
    }

	public void setUpload(File upload)
    {
    	this.upload = upload;
    }

	public String getUploadFileName()
    {
    	return uploadFileName;
    }

	public void setUploadFileName(String uploadFileName)
    {
    	this.uploadFileName = uploadFileName;
    }

	public String getUploadContentType()
    {
    	return uploadContentType;
    }

	public void setUploadContentType(String uploadContentType)
    {
    	this.uploadContentType = uploadContentType;
    }

	public String getUploadUrl()
    {
    	return uploadUrl;
    }

	public void setUploadUrl(String uploadUrl)
    {
    	this.uploadUrl = uploadUrl;
    }

	public String getPath()
    {
    	return path;
    }

	public void setPath(String path)
    {
    	this.path = path;
    }

	public String getName()
    {
    	return name;
    }

	public void setName(String name)
    {
    	this.name = name;
    }
}
