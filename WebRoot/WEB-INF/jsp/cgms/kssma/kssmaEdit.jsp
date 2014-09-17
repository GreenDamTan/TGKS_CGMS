<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="kssmaEvt.id" id="kssmaId" value="${kssmaEvt.id }" />
<table class="lovelive">
    <tr><!-- cardId rarity girl type -->
        <td>ID</td>
        <td><input type="text" size="10" name="kssmaEvt.cardId" id="kssmaCardId" value="${kssmaEvt.cardId }" /></td>
        <td>名称</td>
        <td><input type="text" name="kssmaEvt.name" id="kssmaName" value="${kssmaEvt.name }" /></td>
    </tr>
    <tr>
        <td>稀有度</td>
        <td>
            <select id="kssmaRarity" name="kssmaEvt.rarity">
                <option value="MR" <s:if test='kssmaEvt.rarity=="MR"'>selected="selected"</s:if>>MR</option>
                <option value="SR+" <s:if test='kssmaEvt.rarity=="SR+"'>selected="selected"</s:if>>SR+</option>
                <option value="SR" <s:if test='kssmaEvt.rarity=="SR"'>selected="selected"</s:if>>SR</option>
                <option value="R+" <s:if test='kssmaEvt.rarity=="R+"'>selected="selected"</s:if>>R+</option>
                <option value="R" <s:if test='kssmaEvt.rarity=="R"'>selected="selected"</s:if>>R</option>
                <option value="N+" <s:if test='kssmaEvt.rarity=="N+"'>selected="selected"</s:if>>N+</option>
                <option value="N" <s:if test='kssmaEvt.rarity=="N"'>selected="selected"</s:if>>N</option>
            </select>
        </td>
        <td>类型</td>
        <td>
            <select id="kssmaType" name="kssmaEvt.type">
                <option value="red" <s:if test='kssmaEvt.type=="red"'>selected="selected"</s:if>>剣術の城</option>
                <option value="green" <s:if test='kssmaEvt.type=="green"'>selected="selected"</s:if>>技巧の場</option>
                <option value="blue" <s:if test='kssmaEvt.type=="blue"'>selected="selected"</s:if>>魔法の派</option>
                <option value="white" <s:if test='kssmaEvt.type=="white"'>selected="selected"</s:if>>妖精</option>
            </select>
        </td>
    </tr>
    <tr><!-- imageUrl imageTUrl -->
        <td>本地图</td>
        <td><input type="text" size="35" name="kssmaEvt.imageUrl" id="kssmaImageUrl" value="${kssmaEvt.imageUrl }" /></td>
        <td>网络图</td>
        <td><input type="text" size="35" name="kssmaEvt.imageTUrl" id="kssmaImageTUrl" value="${kssmaEvt.imageTUrl }" /></td>
    </tr>
    <tr><!-- upload -->
        <td colspan="4">
            <form id="kssmaImageUploadForm" name="kssmaImageUploadForm" action="../cgms/uploadCardImage.action" method="post" enctype="multipart/form-data">
                <input type="hidden" name="path" id="path" value="" />
                <input type="hidden" name="name" id="name" value="" />
                <table>
                    <tr>
                        <td>
                            <input type="file" id="kssmaUpload" name="upload" size="30"/>
                        </td>
                        <td >
                            <button id="uploadImageUrl">上传</button>
                            <button id="uploadImageTUrl">显示</button>
                            <!-- <button id="uploadImageUrl">未觉醒</button> -->
                            <!-- <button id="uploadImageTUrl">觉醒后</button> -->
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr><!-- imageUrl imageTUrl -->
        <td style="text-align:center;" colspan="2" valign="middle">
            <img width="210px" height="294px" id="kssmaImageUrlPic" alt="本地图" src="${kssmaEvt.imageUrl }" />
        </td>
        <td style="text-align:center;" colspan="2" valign="middle">
            <img width="210px" height="294px" id="kssmaImageTUrlPic" alt="网络图" src="${kssmaEvt.imageTUrl }" />
        </td>
    </tr>
    <tr><!-- remark -->
        <td>备注</td>
        <td colspan="3"><textarea name="kssmaEvt.remark" id="kssmaRemark" cols="105" rows="5">${kssmaEvt.remark }</textarea></td>
    </tr>
</table>
<script type="text/javascript">
$(document).ready(function(){
    $( "#uploadImageUrl" ).button().click(function() {
        // 先校验是否选中图片再上传
        if ($("#kssmaUpload").val() == null || $("#kssmaUpload").val() == "")
        {
            alert("请选择图片");
            return;
        }
        // 校验是否填入cardId
        /*
        if ($("#kssmaCardId").val() == null || $("#kssmaCardId").val() == "")
        {
            alert("请填写卡片ID");
            return;
        }
        */
        
        //--------------------------------------------------------------------------------------------------
        //alert($("#kssmaUpload").val().split("\\")[$("#kssmaUpload").val().split("\\").length-1]);
        
        var strs = $("#kssmaUpload").val().split("\\")[$("#kssmaUpload").val().split("\\").length-1].split(".")[0].split("_");
        
        // strs[0] cardId
        $("#kssmaCardId").val(strs[0]);
        
        // strs[1] 类别
        $("#kssmaType option").each(function(){
            if (strs[1] == $(this).val())
            {
                $(this).attr("selected","true");
            }
        });
        
        // strs[2] 稀有度
        $("#kssmaRarity option").each(function(){
            if (strs[2] == $(this).val())
            {
                $(this).attr("selected","true");
            }
        });
        //--------------------------------------------------------------------------------------------------
        
        var cardName = $("#kssmaCardId").val() + "_" + $("#kssmaType").val() + "_" + $("#kssmaRarity").val();
        $("#path").val("KSSMA/");
        $("#name").val(cardName);
        
        var options = { 
            url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
            type:'POST', 
            success: function(uploadUrl){
                // 执行成功刷新form
                $("#kssmaImageUrl").val(".." + uploadUrl);
                $("#kssmaImageUrlPic").attr("src", ".." + uploadUrl);
            },
            error:function(){ 
                alert("操作失败"); 
            }
        };
        
        $("#kssmaImageUploadForm").ajaxSubmit(options);
        return false;
    });
    
    $( "#uploadImageTUrl" ).button().click(function() {
        $("#kssmaImageTUrlPic").attr("src", $("#kssmaImageTUrl").val());
    });
});
</script>