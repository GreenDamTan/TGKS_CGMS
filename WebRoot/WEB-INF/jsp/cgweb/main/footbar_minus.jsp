<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<div id="footBar" class="footBar">
    <button id="selectAll">全部选择</button>
    <button id="releaseAll">全部取消</button>
    <button id="delCard">删除</button>
</div>

<script type="text/javascript">
$(document).ready(function(){
    // 全部选择
    $("#selectAll").button().click(function(){
        var count = $("#cardSelect option").length;
        for (var i=0; i<count; i++)
        {
            $("#cardSelect").get(0).options[i].selected = true;
        }
        
        $(".image_picker_selector li div").addClass("selected");
    });
    
    // 全部取消
    $("#releaseAll").button().click(function(){
        var count = $("#cardSelect option").length;
        for (var i=0; i<count; i++)
        {
            $("#cardSelect").get(0).options[i].selected = false;
        }
        
        $(".image_picker_selector li div").removeClass("selected");
    });

    // 删除
    $( "#delCard" ).button({
        icons: {
            primary: "ui-icon-minus"
            }
        }).click(function() {
        //alert($("#cardSelect").val());
        if ($("#cardSelect").val() == null)
        {
            alert("请先选择图片");
            return false;
        }
        
        $("#cardOrderCardId").val($("#cardSelect").val());
        
        var options = {
            url : "../cgweb/delCardOrder.action",
            type : "POST",
            success : function(){
                alert("删除成功");
                var table=$.ajax({url:"../cgweb/queryLoveLiveCart.action", data:$("#reqForm").formSerialize(), async:false});
                $("#cardDivFrame").html(table.responseText);
                
                $("#result").html($("#cardSelect option").length);
            },
            error : function(){
                alert("删除失败");
            }
        };
        
        // 确认操作
        $("#cardOrderForm").ajaxSubmit(options);
        
        return false;
    });
});
</script>