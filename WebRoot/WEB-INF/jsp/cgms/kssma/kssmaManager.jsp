<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#kssmaReq{border:0px solid;}
#kssmaReq td{border:0px solid;}
#kssmaReq input{width:120px;}
#kssmaReq select{width:120px;}
</style>
<input type="hidden" id="kssmaManagerSubmit" name="kssmaManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="kssmaReq" action="../cgms/queryKssma.action" method="post">
		<table>
			<tr>
				<td>编号: </td><td><input type="text" name="kssmaReq.cardId" /></td>
                <td>名称: </td><td><input type="text" name="kssmaReq.name" /></td>
                <td>稀有度: </td>
                <td>
                    <select name="kssmaReq.rarity">
                        <option value="">全部</option>
                        <option value="MR">MR</option>
                        <option value="SR+">SR+</option>
                        <option value="SR">SR</option>
                        <option value="R+">R+</option>
                        <option value="R">R</option>
                        <option value="N+">N+</option>
                        <option value="N">N</option>
                    </select>
                </td>
                <td>类型: </td>
                <td>
                    <select name="kssmaReq.type">
                        <option value="">全部</option>
                        <option value="red">剣術の城</option>
                        <option value="green">技巧の場</option>
                        <option value="blue">魔法の派</option>
                        <option value="white">妖精</option>
                    </select>
                </td>
				<td>
				<button id="clearKssma">重置</button>
				<button id="queryKssma">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addKssma">新增</button>
<button id="deleteKssma">删除</button>

<div id="kssmaDiv"></div>

<div id="kssmaEdit" title="Kssma Edit">
	<form id="kssmaForm" action="../cgms/editKssma.action" method="post"></form>
</div>

<div id="kssmaConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgms/queryKssma.action",async:false});
	$("#kssmaDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgms/queryKssma.action", data:$("#kssmaReq").formSerialize(), async:false});
		$("#kssmaDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#kssmaEdit" ).dialog({
		modal: true,
		height:800,
		width:800,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!kssmaFormCheck())
				{
					return false;
				}
				var form = $("#kssmaForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#kssmaManagerSubmit").val("0");
				$("#kssmaEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#kssmaForm").submit(function()
	{
		if ($("#kssmaManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#kssmaManagerSubmit").val("0");
		
		var options = { 
			url:"../cgms/editKssma.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#kssmaEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#kssmaEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#kssmaForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addKssma" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#kssmaManagerSubmit").val("1");
		$( "#kssmaEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../cgms/editKssmaPage.action",async:false});
		$("#kssmaForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteKssma" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#kssmaManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("kssmaId");
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
			$("#kssmaManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../cgms/deleteKssma.action?ids=" + ids , // 提交给哪个执行
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
		$("#kssmaConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#kssmaConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onKssma" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#kssmaManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("kssmaId");
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
				$("#kssmaManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusKssma.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#kssmaConfirm").ajaxSubmit(options);
			$("#kssmaManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offKssma" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#kssmaManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("kssmaId");
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
				$("#kssmaManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusKssma.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#kssmaConfirm").ajaxSubmit(options);
			$("#kssmaManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryKssma" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearKssma" ).button().click(function() {
			$("#kssmaReq").clearForm();
		return false;
	});
	
	// 页面校验
	function kssmaFormCheck()
	{
		return true;
	}
});
</script>
