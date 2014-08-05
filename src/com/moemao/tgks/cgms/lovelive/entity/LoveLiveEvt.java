package com.moemao.tgks.cgms.lovelive.entity;

import java.util.Date;

public class LoveLiveEvt
{
	/**
	 * 表唯一主键
	 */
	private String id;
	
	/**
	 * 卡牌ID
	 */
	private String cardId;
	
	/**
	 * 角色
	 */
	private String character;
	
	/**
	 * 稀有度
	 */
	private String rarity;
	
	/**
	 * 类型（Smile Pure Cool）
	 */
	private String type;
	
	/**
	 * 图片URL
	 */
	private String imageUrl;
	
	/**
	 * 觉醒图片URL
	 */
	private String imageTUrl;
	
	/**
	 * 最大等级
	 */
	private String maxLevel;
	
	/**
	 * 一级HP
	 */
	private String minHP;
	
	/**
	 * 一级Smile
	 */
	private String minSmile;
	
	/**
	 * 一级Pure
	 */
	private String minPure;
	
	/**
	 * 一级Cool
	 */
	private String minCool;
	
	/**
	 * 满级HP
	 */
	private String maxHP;
	
	/**
	 * 满级Smile
	 */
	private String maxSmile;
	
	/**
	 * 满级Pure
	 */
	private String maxPure;
	
	/**
	 * 满级Cool
	 */
	private String maxCool;
	
	/**
	 * 特效
	 */
	private String appeal;
	
	/**
	 * 特效描述
	 */
	private String appealInfo;
	
	/**
	 * Center技能
	 */
	private String centerSkill;
	
	/**
	 * Center技能描述
	 */
	private String centerSkillInfo;
	
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
		        .format("id:%S\ncardId:%S\ncharacter:%S\nrarity:%S\ntype:%S\nimageUrl:%S\nimageTUrl:%S\nmaxLevel:%S\nminHP:%S\nminSmile:%S\nminPure:%S\nminCool:%S\nmaxHP:%S\nmaxSmile:%S\nmaxPure:%S\nmaxCool:%S\nappeal:%S\nappealInfo:%S\ncenterSkill:%S\ncenterSkillInfo:%S\ncreateTime:%S\nremark:%S\n",
		                id, cardId, character, rarity, type, imageUrl,
		                imageTUrl, maxLevel, minHP, minSmile, minPure, minCool,
		                maxHP, maxSmile, maxPure, maxCool, appeal, appealInfo,
		                centerSkill, centerSkillInfo, createTime, remark);
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
	 * @return 返回 character
	 */
	public String getCharacter()
	{
		return character;
	}
	
	/**
	 * @param 对character进行赋值
	 */
	public void setCharacter(String character)
	{
		this.character = character;
	}
	
	/**
	 * @return 返回 rarity
	 */
	public String getRarity()
	{
		return rarity;
	}
	
	/**
	 * @param 对rarity进行赋值
	 */
	public void setRarity(String rarity)
	{
		this.rarity = rarity;
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
	 * @return 返回 imageUrl
	 */
	public String getImageUrl()
	{
		return imageUrl;
	}
	
	/**
	 * @param 对imageUrl进行赋值
	 */
	public void setImageUrl(String imageUrl)
	{
		this.imageUrl = imageUrl;
	}
	
	/**
	 * @return 返回 imageTUrl
	 */
	public String getImageTUrl()
	{
		return imageTUrl;
	}
	
	/**
	 * @param 对imageTUrl进行赋值
	 */
	public void setImageTUrl(String imageTUrl)
	{
		this.imageTUrl = imageTUrl;
	}
	
	/**
	 * @return 返回 maxLevel
	 */
	public String getMaxLevel()
	{
		return maxLevel;
	}
	
	/**
	 * @param 对maxLevel进行赋值
	 */
	public void setMaxLevel(String maxLevel)
	{
		this.maxLevel = maxLevel;
	}
	
	/**
	 * @return 返回 minHP
	 */
	public String getMinHP()
	{
		return minHP;
	}
	
	/**
	 * @param 对minHP进行赋值
	 */
	public void setMinHP(String minHP)
	{
		this.minHP = minHP;
	}
	
	/**
	 * @return 返回 minSmile
	 */
	public String getMinSmile()
	{
		return minSmile;
	}
	
	/**
	 * @param 对minSmile进行赋值
	 */
	public void setMinSmile(String minSmile)
	{
		this.minSmile = minSmile;
	}
	
	/**
	 * @return 返回 minPure
	 */
	public String getMinPure()
	{
		return minPure;
	}
	
	/**
	 * @param 对minPure进行赋值
	 */
	public void setMinPure(String minPure)
	{
		this.minPure = minPure;
	}
	
	/**
	 * @return 返回 minCool
	 */
	public String getMinCool()
	{
		return minCool;
	}
	
	/**
	 * @param 对minCool进行赋值
	 */
	public void setMinCool(String minCool)
	{
		this.minCool = minCool;
	}
	
	/**
	 * @return 返回 maxHP
	 */
	public String getMaxHP()
	{
		return maxHP;
	}
	
	/**
	 * @param 对maxHP进行赋值
	 */
	public void setMaxHP(String maxHP)
	{
		this.maxHP = maxHP;
	}
	
	/**
	 * @return 返回 maxSmile
	 */
	public String getMaxSmile()
	{
		return maxSmile;
	}
	
	/**
	 * @param 对maxSmile进行赋值
	 */
	public void setMaxSmile(String maxSmile)
	{
		this.maxSmile = maxSmile;
	}
	
	/**
	 * @return 返回 maxPure
	 */
	public String getMaxPure()
	{
		return maxPure;
	}
	
	/**
	 * @param 对maxPure进行赋值
	 */
	public void setMaxPure(String maxPure)
	{
		this.maxPure = maxPure;
	}
	
	/**
	 * @return 返回 maxCool
	 */
	public String getMaxCool()
	{
		return maxCool;
	}
	
	/**
	 * @param 对maxCool进行赋值
	 */
	public void setMaxCool(String maxCool)
	{
		this.maxCool = maxCool;
	}
	
	/**
	 * @return 返回 appeal
	 */
	public String getAppeal()
	{
		return appeal;
	}
	
	/**
	 * @param 对appeal进行赋值
	 */
	public void setAppeal(String appeal)
	{
		this.appeal = appeal;
	}
	
	/**
	 * @return 返回 appealInfo
	 */
	public String getAppealInfo()
	{
		return appealInfo;
	}
	
	/**
	 * @param 对appealInfo进行赋值
	 */
	public void setAppealInfo(String appealInfo)
	{
		this.appealInfo = appealInfo;
	}
	
	/**
	 * @return 返回 centerSkill
	 */
	public String getCenterSkill()
	{
		return centerSkill;
	}
	
	/**
	 * @param 对centerSkill进行赋值
	 */
	public void setCenterSkill(String centerSkill)
	{
		this.centerSkill = centerSkill;
	}
	
	/**
	 * @return 返回 centerSkillInfo
	 */
	public String getCenterSkillInfo()
	{
		return centerSkillInfo;
	}
	
	/**
	 * @param 对centerSkillInfo进行赋值
	 */
	public void setCenterSkillInfo(String centerSkillInfo)
	{
		this.centerSkillInfo = centerSkillInfo;
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