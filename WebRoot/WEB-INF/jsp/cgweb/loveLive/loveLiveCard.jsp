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
	<link rel="stylesheet" type="text/css" href="../resources/css/cgweb/login/style.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/cgweb/cardlist/css/style.css" />
	<script type="text/javascript"  src="../resources/css/cgweb/cardlist/js/toolbar.js"></script>
	<script type="text/javascript"  src="../resources/css/cgweb/cardlist/js/nav.js"></script>
	<style type="text/css">
	</style>	
</head>
<body>

<!-- 增加卡片form -->
<form id="cardOrderForm" action="../cgweb/addCardOrder.action" method="post">
	<input type="hidden" id="cardOrderCardId" name="cardOrder.cardId" />
	<input type="hidden" id="cardOrderType" name="cardOrder.type" value="1" /><!-- LoveLive 1 -->
</form>
<div id="top_bg">
	<div class="top">
		<!--导航开始-->
		<div class="nav_z">
			<ul id="navul" class="cl">
				<%@ include file="/WEB-INF/jsp/cgweb/main/toolbar.jsp" %>
				<!-- 查询卡片form -->
				<form id="reqForm" method="post">
				<li>
					<a>角色：</a>
					<select class="cardoption" name="loveLiveReq.girl">
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
				</li>
				<li>
					<a>稀有度：</a>
					<select class="cardoption" name="loveLiveReq.rarity">
						<option value="">全部</option>
						<option value="UR">UR</option>
						<option value="SR">SR</option>
						<option value="R">R</option>
					</select>
				</li>
				<li>
					<a>类型：</a>
					<select class="cardoption" name="loveLiveReq.type">
						<option value="">全部</option>
						<option value="Smile">Smile</option>
						<option value="Pure">Pure</option>
						<option value="Cool">Cool</option>
						<option value="All">All</option>
					</select>
				</li>
				<li>
					<!-- <button id="clearReqForm">重置</button> -->
					<button id="queryCard" class="queryButton">查询</button>
				</li>
				<li>
				</li>
				<li>
				</li>
				<li>
				</li>
				</form>
				<!--可在此处直接添加导航-->
			</ul>
		</div><!--导航结束-->
		<script  type="text/javascript"> 
		$(".navbg").capacityFixed();
		</script>
	</div>	
</div>

<div style="height: 60px;"></div>

<div align="center"></div>
<div class="ui-widget" align="center">
	
</div>
<div id="cardDiv" align="center"></div>

<%@ include file="/WEB-INF/jsp/cgweb/main/footbar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgweb/queryLoveLiveCard.action",async:false});
	$("#cardDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgweb/queryLoveLiveCard.action", data:$("#reqForm").formSerialize(), async:false});
		$("#cardDiv").html(table.responseText);
	}
	
	 // 刷新按钮
	$( "#queryCard" ).button().click(function() {
		query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearReqForm" ).button().click(function() {
		$("#reqForm").clearForm();
		return false;
	});
});
</script>


</body>
</html>
