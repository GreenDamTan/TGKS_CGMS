<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeader.inc.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
	<title>卡牌定制下单系统——猫萌公社</title>
	
	<meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">	
	<meta http-equiv="keywords" content="幻影帝国,猫盟公社,卡牌定制下单系统">
	
</head>
<body>

<input type="hidden" id="loveLiveManagerSubmit" name="loveLiveManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="loveLiveReq" action="../cgweb/queryLoveLiveCard.action" method="post">
		<table>
			<tr>
				<td>角色: </td>
				<td>
					<select name="loveLiveReq.girl">
						<option value="">全部</option>
						<option value="Ayase Eli">絢瀬 絵里</option>
						<option value="Hoshizora Rin">星空 凛</option>
						<option value="Koizumi Hanayo">小泉 花陽</option>
						<option value="Kousaka Honoka">高坂 穂乃果</option>
						<option value="Minami Kotori">南 ことり</option>
						<option value="Nishikino Maki">西木野 真姫</option>
						<option value="Sonoda Umi">園田 海未</option>
						<option value="Toujou Nozomi">東條 希</option>
						<option value="Yazawa Nico">矢澤 にこ</option>
					</select>
				</td>
				<td>稀有度: </td>
				<td>
					<select name="loveLiveReq.rarity">
						<option value="">全部</option>
						<option value="UR">UR</option>
						<option value="SR">SR</option>
						<option value="R">R</option>
					</select>
				</td>
				<td>类型: </td>
				<td>
					<select name="loveLiveReq.type">
						<option value="">全部</option>
						<option value="Smile">Smile</option>
						<option value="Pure">Pure</option>
						<option value="Cool">Cool</option>
						<option value="All">All</option>
					</select>
				</td>
				<td>
				<button id="clearLoveLive">重置</button>
				<button id="queryLoveLive">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="loveLiveDiv"></div>

<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgweb/queryLoveLiveCard.action",async:false});
	$("#loveLiveDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgweb/queryLoveLiveCard.action", data:$("#loveLiveReq").formSerialize(), async:false});
		$("#loveLiveDiv").html(table.responseText);
	}
	
	 // 刷新按钮
	$( "#queryLoveLive" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearLoveLive" ).button().click(function() {
			$("#loveLiveReq").clearForm();
		return false;
	});
});
</script>


</body>
</html>
