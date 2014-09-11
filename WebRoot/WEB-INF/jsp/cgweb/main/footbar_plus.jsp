<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<div id="footBar" class="footBar">
    <button id="selectAll">全部选择</button>
    <button id="releaseAll">全部取消</button>
    <button id="addCard">加入</button>
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

    // 加入订单
    $( "#addCard" ).button({
        icons: {
            primary: "ui-icon-plus"
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
            url : "../cgweb/addCardOrder.action",
            type : "POST",
            success : function(){
                alert("加入成功");
            },
            error : function(){
                alert("加入失败");
            }
        };
        
        // 确认操作
        $("#cardOrderForm").ajaxSubmit(options);
        
        return false;
    });
});
</script>