<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#cardOrderReq{border:0px solid;}
#cardOrderReq td{border:0px solid;}
#cardOrderReq input{width:120px;}
#cardOrderReq select{width:120px;}
</style>
<input type="hidden" id="cardOrderManagerSubmit" name="cardOrderManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="cardOrderReq" action="../cgms/queryCardOrder.action" method="post">
		<table>
			<tr>
				<td><label>账号: </label></td><td><input type="text" name="cardOrderReq.username" /></td>
				<td><label>旺旺ID: </label></td><td><input type="text" name="cardOrderReq.alww" /></td>
				<td><label>类型: </label></td>
				<td>
					<select name="cardOrderReq.type" >
						<option value="">全部</option>
						<option value="1">LoveLive</option>
						<option value="2">扩散性MA</option>
					</select>
				</td>
				<td><label>状态: </label></td>
				<td>
					<select name="cardOrderReq.status" >
						<option value="">全部</option>
						<option value="0">预定</option>
						<option value="1">完成</option>
					</select>
				</td>
				<td>
				
				</td>
				<td>
				<button id="clearCardOrder">重置</button>
				<button id="queryCardOrder">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addCardOrder">新增</button>
<button id="deleteCardOrder">删除</button>
<button id="finishCardOrder">完成</button>
<!-- 
<button id="offCardOrder">禁用</button>
 -->
<div id="cardOrderDiv"></div>

<div id="cardOrderEdit" title="CardOrder Edit">
	<form id="cardOrderForm" action="../cgms/editCardOrder.action" method="post"></form>
</div>

<div id="cardOrderConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgms/queryCardOrder.action",async:false});
	$("#cardOrderDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgms/queryCardOrder.action", data:$("#cardOrderReq").formSerialize(), async:false});
		$("#cardOrderDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#cardOrderEdit" ).dialog({
		modal: true,
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!cardOrderFormCheck())
				{
					return false;
				}
				var form = $("#cardOrderForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#cardOrderManagerSubmit").val("0");
				$("#cardOrderEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#cardOrderForm").submit(function()
	{
		if ($("#cardOrderManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#cardOrderManagerSubmit").val("0");
		
		var options = { 
			url:"../cgms/editCardOrder.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#cardOrderEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#cardOrderEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#cardOrderForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addCardOrder" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#cardOrderManagerSubmit").val("1");
		$( "#cardOrderEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../cgms/editCardOrderPage.action",async:false});
		$("#cardOrderForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteCardOrder" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#cardOrderManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("cardOrderId");
		for (var i=0; i<array.length; i++)
	   	{
	   		if (array[i].checked)
  			{
	   			if (ids == "")
   				{
	   				ids += array[i].value;
   				}
	   			else
	   			{
	   				ids += "," + array[i].value;
	   			}
  			}
	   	}
		
		// 操作验证
		if (ids == "")
		{
			alert("请选择至少一条记录");
			$("#cardOrderManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../cgms/deleteCardOrder.action?ids=" + ids , // 提交给哪个执行
			type:'POST', 
			success: function(){
				alert("删除成功");
				// 执行成功刷新form
				query();
			},
			error:function(){ 
				alert("删除失败"); 
			}
		};
		
		// 确认操作
		$("#cardOrderConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#cardOrderConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 完成按钮
	$( "#finishCardOrder" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#cardOrderManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("cardOrderId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#cardOrderManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/finishCardOrder.action?ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#cardOrderConfirm").ajaxSubmit(options);
			$("#cardOrderManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offCardOrder" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#cardOrderManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("cardOrderId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#cardOrderManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusCardOrder.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#cardOrderConfirm").ajaxSubmit(options);
			$("#cardOrderManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryCardOrder" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearCardOrder" ).button().click(function() {
			$("#cardOrderReq").clearForm();
		return false;
	});
	
	// 页面校验
	function cardOrderFormCheck()
	{
		return true;
	}
});
</script>
