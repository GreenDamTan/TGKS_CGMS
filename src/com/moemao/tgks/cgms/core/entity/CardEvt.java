package com.moemao.tgks.cgms.core.entity;

import java.util.Date;

public class CardEvt
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
     * 名称
     */
    private String name;
    
    /**
     * 稀有度
     */
    private String rarity;
    
    /**
     * 类型
     */
    private String type;
    
    /**
     * 图片URL
     */
    private String imageUrl;
    
    /**
     * 外网小图URL
     */
    private String imageTUrl;
    
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
        return String.format("id:%S\ncardId:%S\nname:%S\nrarity:%S\ntype:%S\nimageUrl:%S\nimageTUrl:%S\ncreateTime:%S\nremark:%S\n",
                        id, cardId, name, rarity, type, imageUrl, imageTUrl, createTime, remark);
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
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
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
