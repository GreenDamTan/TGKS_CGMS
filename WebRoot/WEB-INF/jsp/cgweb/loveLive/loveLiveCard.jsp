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
	<script type="text/javascript"  src="../resources/css/cgweb/cardlist/js/nav.js"></script>
	<style type="text/css">
	.logo {height: 120px;}
	</style>	
</head>
<body>

<input type="hidden" id="loveLiveManagerSubmit" name="loveLiveManagerSubmit" value="0" />
<div id="top_bg">
	<div class="top">
		<!--导航开始-->
		<div class="nav_z">
			<ul id="navul" class="cl">
				<li style="width:280px;">
					<form id="loveLiveAdd" action="../cgms/addCardOrder.action" method="post">
					<a>欢迎：<s:property value="#session.user_info.username"/></a>
					<a href="<%=basePath%>cgweb">退出系统</a>
					</form>
				</li>
				<li style="width:80px;">
					<a><b>游戏分类</b></a>
					<!-- 
					<a href="<%=basePath%>cgweb/loveLiveCard.action"><img class="logo" src="../resources/images/cgweb/logo_lovelive.png" /></a> <a href="<%=basePath%>cgweb/kssmaCard.action"><img class="logo" src="../resources/images/cgweb/logo_kssma.png" /></a>
					 -->
				</li>
				<form id="loveLiveReq" action="../cgweb/queryLoveLiveCard.action" method="post">
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
				<li style="width:80px;">
					<!-- <button id="clearLoveLive">重置</button> -->
					<button id="queryLoveLive">查询</button>
				</li>
				<li style="width:100px;">
					<button id="addLoveLive">加入</button>
				</li>
				<li>
					<button id="cardOrder">购物车</button>
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

<div id="loveLiveDiv" align="center"></div>

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
	
	// 加入订单
	$( "#addLoveLive" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		//alert($("#loveLiveSelect").val());
		if ($("#loveLiveSelect").val() == null)
		{
			alert("请先选择图片");
		}
		
		return false;
	});
	
	// 购物车按钮
	$( "#cardOrder" ).button({
		icons: {
			primary: "ui-icon-cart"
			}
		}).click(function() {
		return false;
	});
});
</script>


</body>
</html>
