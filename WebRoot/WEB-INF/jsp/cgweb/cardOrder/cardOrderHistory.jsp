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
	.historyTable {
        width: 50%;
	}
    .historyTable thead tr th, tbody tr td{
        border: 1px solid #eee;
		padding: .6em 10px;
		text-align: left;
		color: black;
    }
	</style>	
</head>
<body>

<div id="top_bg">
	<div class="top">
		<!--导航开始-->
		<div class="nav_z">
			<ul id="navul" class="cl">
				<%@ include file="/WEB-INF/jsp/cgweb/main/toolbar.jsp" %>
				<!--可在此处直接添加导航-->
			</ul>
		</div><!--导航结束-->
		<script  type="text/javascript"> 
		$(".navbg").capacityFixed();
		</script>
	</div>	
</div>


<div id="cardOrderTableDiv" align="center" class="historyTableDiv" style="padding-top: 50px;">
    <table class="historyTable">
        <thead>
            <tr class="historyTableTr">
                <th>当前订单</th>
                <th>类型</th>
                <th>状态</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="cardOrderList" var="evt">
                <tr>
                    <td><s:property value="#evt.id"/></td>
                    <td>
                        <s:if test="#evt.type == 1">
                            LoveLive
                        </s:if>
                        <s:elseif test="#evt.type == 2">
                            扩散性MA
                        </s:elseif>
                    </td>
                    <td>
                        <s:if test="#evt.status == 0">
                            预定
                        </s:if>
                        <s:elseif test="#evt.status == 1">
                            完成
                        </s:elseif>
                    </td>
                    <td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <s:if test="#evt.type == 1">
                            <a href="../cgweb/loveLiveCart.action?id=<s:property value='#evt.id'/>">详细信息</a>
                        </s:if>
                        <s:elseif test="#evt.type == 2">
                            <a href="../cgweb/kssmaCart.action?id=<s:property value='#evt.id'/>">详细信息</a>
                        </s:elseif>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>
<div id="cardOrderTableDiv" align="center" class="historyTableDiv" style="padding-top: 25px;">
    <table class="historyTable">
        <thead>
            <tr class="historyTableTr">
                <th>历史订单</th>
                <th>类型</th>
                <th>状态</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="oldCardOrderList" var="evt">
                <tr>
                    <td><s:property value="#evt.id"/></td>
                    <td>
                        <s:if test="#evt.type == 1">
                            LoveLive
                        </s:if>
                        <s:elseif test="#evt.type == 2">
                            扩散性MA
                        </s:elseif>
                    </td>
                    <td>
                        <s:if test="#evt.status == 0">
                            预定
                        </s:if>
                        <s:elseif test="#evt.status == 1">
                            完成
                        </s:elseif>
                    </td>
                    <td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <s:if test="#evt.type == 1">
                            <a href="../cgweb/loveLiveCartHistory.action?id=<s:property value='#evt.id'/>">详细信息</a>
                        </s:if>
                        <s:elseif test="#evt.type == 2">
                            <a href="../cgweb/kssmaCartHistory.action?id=<s:property value='#evt.id'/>">详细信息</a>
                        </s:elseif>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>


<script type="text/javascript">
$(document).ready(function(){

	
});
</script>


</body>
</html>
