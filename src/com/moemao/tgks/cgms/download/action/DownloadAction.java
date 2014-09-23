package com.moemao.tgks.cgms.download.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.moemao.tgks.cgms.cardorder.entity.CardOrderEvt;
import com.moemao.tgks.cgms.cardorder.service.CardOrderService;
import com.moemao.tgks.cgms.kssma.entity.KssmaEvt;
import com.moemao.tgks.cgms.kssma.service.KssmaService;
import com.moemao.tgks.cgms.lovelive.entity.LoveLiveEvt;
import com.moemao.tgks.cgms.lovelive.service.LoveLiveService;
import com.moemao.tgks.cgms.tool.CgmsConstant;
import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonUtil;

public class DownloadAction extends TGKSAction
{

    /** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 8166293537310971647L;
    
    private CardOrderService cgms_cardOrderService;
    
    private KssmaService cgms_kssmaService;

    private LoveLiveService cgms_loveLiveService;
    
    private static final String basePath = "/upload/cgms";
    
    private String cardIds;
    
    private String cardType;
    
    /**
     * @throws IOException 
     * 
     * @Title: downloadCardZip
     * @Description: CGMS下载cardOrder选中的卡图包
     * @return
     * @return String 返回类型
     * @throws
     */
    public String downloadCardZip() throws IOException
    {
        String cardOrderId = this.getRequest().getParameter("id");
        
        CardOrderEvt cardOrder = cgms_cardOrderService.queryCardOrderById(cardOrderId);
        
        if (CommonUtil.isEmpty(cardOrder))
        {
            return ERROR;
        }
        
        List<File> fileList = new ArrayList<File>();
        
        if (CgmsConstant.CARDORDER_TYPE_1.equals(cardOrder.getType()))
        {
            List<LoveLiveEvt> list = cgms_loveLiveService.queryLoveLiveByCardId(CommonUtil.stringToList(cardOrder.getCardId()));
            
            for (LoveLiveEvt ll : list)
            {
                File file = new File(ServletActionContext.getServletContext().getRealPath(basePath) + ll.getImageUrl().split(".." + basePath)[1]);
                
                if (file.exists())
                {
                    fileList.add(file);
                }
            }
        }
        else if (CgmsConstant.CARDORDER_TYPE_2.equals(cardOrder.getType()))
        {
            List<KssmaEvt> list = cgms_kssmaService.queryKssmaByCardId(CommonUtil.stringToList(cardOrder.getCardId()));
            
            for (KssmaEvt ma : list)
            {
                File file = new File(ServletActionContext.getServletContext().getRealPath(basePath) + ma.getImageUrl().split(".." + basePath)[1]);
                
                if (file.exists())
                {
                    fileList.add(file);
                }
            }
        }
        
        if (CommonUtil.isEmpty(fileList))
        {
            return ERROR;
        }
        
        HttpServletResponse response = ServletActionContext.getResponse();
        
        OutputStream os = response.getOutputStream();
        
        //清空输出流 
        response.reset();
        
        //设定输出文件头 
        response.setHeader("Content-disposition ","attachment; filename=" + cardOrderId + ".zip");   
        response.setContentType("application/zip");
        
        ZipOutputStream zos = new ZipOutputStream(os);
        
        // 文件进行打包处理
        zipFiles(fileList, "", zos);
        
        zos.close();
        os.close();
        
        return SUCCESS;
    }
    
    /**
     * @throws IOException 
     * 
     * @Title: downloadCardZipByIds
     * @Description: 通过cardOrder的ids来下载图片包
     * @return
     * @return String 返回类型
     * @throws
     */
    public String downloadCardZipByIds() throws IOException
    {
        if (CommonUtil.isEmpty(cardIds))
        {
            return ERROR;
        }
        
        List<File> fileList = new ArrayList<File>();
        
        if (CgmsConstant.CARDORDER_TYPE_1.equals(cardType))
        {
            List<LoveLiveEvt> list = cgms_loveLiveService.queryLoveLiveByCardId(CommonUtil.stringToList(cardIds));
            
            for (LoveLiveEvt ll : list)
            {
                File file = new File(ServletActionContext.getServletContext().getRealPath(basePath) + ll.getImageUrl().split(".." + basePath)[1]);
                
                if (file.exists())
                {
                    fileList.add(file);
                }
            }
        }
        else if (CgmsConstant.CARDORDER_TYPE_2.equals(cardType))
        {
            List<KssmaEvt> list = cgms_kssmaService.queryKssmaByCardId(CommonUtil.stringToList(cardIds));
            
            for (KssmaEvt ma : list)
            {
                File file = new File(ServletActionContext.getServletContext().getRealPath(basePath) + ma.getImageUrl().split(".." + basePath)[1]);
                
                if (file.exists())
                {
                    fileList.add(file);
                }
            }
        }
        
        if (CommonUtil.isEmpty(fileList))
        {
            return ERROR;
        }
        
        HttpServletResponse response = ServletActionContext.getResponse();
        
        OutputStream os = response.getOutputStream();
        
        //清空输出流 
        response.reset();
        
        //设定输出文件头 
        response.setHeader("Content-disposition ","attachment; filename=card.zip");   
        response.setContentType("application/zip");
        
        ZipOutputStream zos = new ZipOutputStream(os);
        
        // 文件进行打包处理
        zipFiles(fileList, "", zos);
        
        zos.close();
        os.close();
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: zipFiles
     * @Description: 将文件打包成一个zip
     * @param fileList
     * @param baseName
     * @param zos
     * @throws IOException
     * @return void 返回类型
     * @throws
     */
    private void zipFiles(List<File> fileList, String baseName, ZipOutputStream zos) throws IOException, FileNotFoundException
    {
        for (File file : fileList)
        {
            zos.putNextEntry(new ZipEntry(baseName + file.getName()));
            FileInputStream fis = new FileInputStream(file);
            byte[] buffer = new byte[1024];
            int r = 0;
            while (-1 != (r = fis.read(buffer)))
            {
                zos.write(buffer, 0, r);
            }
            fis.close();
        }
    }

    public CardOrderService getCgms_cardOrderService()
    {
        return cgms_cardOrderService;
    }

    public void setCgms_cardOrderService(CardOrderService cgms_cardOrderService)
    {
        this.cgms_cardOrderService = cgms_cardOrderService;
    }

    public KssmaService getCgms_kssmaService()
    {
        return cgms_kssmaService;
    }

    public void setCgms_kssmaService(KssmaService cgms_kssmaService)
    {
        this.cgms_kssmaService = cgms_kssmaService;
    }

    public LoveLiveService getCgms_loveLiveService()
    {
        return cgms_loveLiveService;
    }

    public void setCgms_loveLiveService(LoveLiveService cgms_loveLiveService)
    {
        this.cgms_loveLiveService = cgms_loveLiveService;
    }

    public String getCardIds()
    {
        return cardIds;
    }

    public void setCardIds(String cardIds)
    {
        this.cardIds = cardIds;
    }

    public String getCardType()
    {
        return cardType;
    }

    public void setCardType(String cardType)
    {
        this.cardType = cardType;
    }
}
