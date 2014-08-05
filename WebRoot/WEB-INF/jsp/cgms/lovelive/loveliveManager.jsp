<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#loveliveReq{border:0px solid;}
#loveliveReq td{border:0px solid;}
#loveliveReq input{width:120px;}
#loveliveReq select{width:120px;}
</style>
<input type="hidden" id="loveliveManagerSubmit" name="loveliveManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="loveliveReq" action="../cgms/queryLovelive.action" method="post">
		<table>
			<tr>
				<td><label>名称: </label></td><td><input type="text" name="loveliveReq.name" /></td>
				<td>
				
				</td>
				<td>
				<button id="clearLovelive">重置</button>
				<button id="queryLovelive">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addLovelive">新增</button>
<button id="deleteLovelive">删除</button>
<button id="onLovelive">启用</button>
<button id="offLovelive">禁用</button>

<div id="loveliveDiv"></div>

<div id="loveliveEdit" title="Lovelive Edit">
	<form id="loveliveForm" action="../cgms/editLovelive.action" method="post"></form>
</div>

<div id="loveliveConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgms/queryLovelive.action",async:false});
	$("#loveliveDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgms/queryLovelive.action", data:$("#loveliveReq").formSerialize(), async:false});
		$("#loveliveDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#loveliveEdit" ).dialog({
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
				if (!loveliveFormCheck())
				{
					return false;
				}
				var form = $("#loveliveForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#loveliveManagerSubmit").val("0");
				$("#loveliveEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#loveliveForm").submit(function()
	{
		if ($("#loveliveManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#loveliveManagerSubmit").val("0");
		
		var options = { 
			url:"../cgms/editLovelive.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#loveliveEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#loveliveEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#loveliveForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addLovelive" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#loveliveManagerSubmit").val("1");
		$( "#loveliveEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../cgms/editLovelivePage.action",async:false});
		$("#loveliveForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteLovelive" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#loveliveManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("loveliveId");
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
			$("#loveliveManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../cgms/deleteLovelive.action?ids=" + ids , // 提交给哪个执行
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
		$("#loveliveConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#loveliveConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onLovelive" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#loveliveManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("loveliveId");
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
				$("#loveliveManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusLovelive.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveliveConfirm").ajaxSubmit(options);
			$("#loveliveManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offLovelive" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#loveliveManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("loveliveId");
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
				$("#loveliveManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusLovelive.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveliveConfirm").ajaxSubmit(options);
			$("#loveliveManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryLovelive" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearLovelive" ).button().click(function() {
			$("#loveliveReq").clearForm();
		return false;
	});
	
	// 页面校验
	function loveliveFormCheck()
	{
		return true;
	}
});
</script>
