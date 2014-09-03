package com.moemao.tgks.cgms.cardorder.entity;

import java.util.Date;

public class CardOrderEvt
{
	/**
	 * 表唯一主键
	 */
	private String id;
	
	/**
	 * 用户ID
	 */
	private String uid;
	
	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 旺旺ID
	 */
	private String alww;
	
	/**
	 * 订单类型（1 LoveLive；2 KSSMA）
	 */
	private String type;
	
	/**
	 * 状态（0 预定；1 完成）
	 */
	private String status;
	
	/**
	 * 卡片ID
	 */
	private String cardId;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 备注
	 */
	private String remark;
	
	@Override
	public String toString()
	{
		return String
		        .format("id:%S\nuid:%S\nusername:%S\nalww:%S\ntype:%S\nstatus:%S\ncardId:%S\ncreateTime:%S\nremark:%S\n",
		                id, uid, username, alww, type, status, cardId,
		                createTime, remark);
	}
	
	/**
	 * @return 返回 id
	 */
	public String getId()
	{
		return id;
	}
	
	/**
	 * @param 对id进行赋值
	 */
	public void setId(String id)
	{
		this.id = id;
	}
	
	/**
	 * @return 返回 uid
	 */
	public String getUid()
	{
		return uid;
	}
	
	/**
	 * @param 对uid进行赋值
	 */
	public void setUid(String uid)
	{
		this.uid = uid;
	}
	
	/**
	 * @return 返回 username
	 */
	public String getUsername()
	{
		return username;
	}
	
	/**
	 * @param 对username进行赋值
	 */
	public void setUsername(String username)
	{
		this.username = username;
	}
	
	/**
	 * @return 返回 alww
	 */
	public String getAlww()
	{
		return alww;
	}
	
	/**
	 * @param 对alww进行赋值
	 */
	public void setAlww(String alww)
	{
		this.alww = alww;
	}
	
	/**
	 * @return 返回 type
	 */
	public String getType()
	{
		return type;
	}
	
	/**
	 * @param 对type进行赋值
	 */
	public void setType(String type)
	{
		this.type = type;
	}
	
	/**
	 * @return 返回 status
	 */
	public String getStatus()
	{
		return status;
	}
	
	/**
	 * @param 对status进行赋值
	 */
	public void setStatus(String status)
	{
		this.status = status;
	}
	
	/**
	 * @return 返回 cardId
	 */
	public String getCardId()
	{
		return cardId;
	}
	
	/**
	 * @param 对cardId进行赋值
	 */
	public void setCardId(String cardId)
	{
		this.cardId = cardId;
	}
	
	/**
	 * @return 返回 createTime
	 */
	public Date getCreateTime()
	{
		return createTime;
	}
	
	/**
	 * @param 对createTime进行赋值
	 */
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}
	
	/**
	 * @return 返回 remark
	 */
	public String getRemark()
	{
		return remark;
	}
	
	/**
	 * @param 对remark进行赋值
	 */
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
	
}