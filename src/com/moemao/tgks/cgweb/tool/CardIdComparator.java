package com.moemao.tgks.cgweb.tool;

import java.util.Comparator;

/**
 * 
 * 项目名称：TGKS_CGMS
 * 类名称：CardIdComparator
 * 类描述：为CardOrderEvt排序提供规则算法 调用方法Collections.sort(list, new CardIdComparator());
 * 创建人：Ken Buluba
 * 创建时间：2014-9-10 下午9:31:23
 * 修改人：
 * 修改时间：
 * 修改备注：
 * @version
 *
 */
public class CardIdComparator implements Comparator<String>
{
    
    @Override
    public int compare(String id1, String id2)
    {
        // id是否带t的标志
        boolean t1 = false;
        boolean t2 = false;
        
        if (id1.contains("t"))
        {
            id1 = id1.substring(0, id1.indexOf("t"));
            t1 = true;
        }
        
        if (id2.contains("t"))
        {
            id2 = id2.substring(0, id2.indexOf("t"));
            t2 = true;
        }
        
        if (id1.equals(id2))
        {
            if (t1)
            {
                return 1;
            }
            else if (t2)
            {
                return -1;
            }
            
            // 其实不会出现0的情况 不过姑且保留t2 以便后续更改规则（元素修改为和重复）
            return 0;
        }
        else
        {
            return (id1.hashCode() - id2.hashCode());
        }
    }
}
