<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<li style="width:280px;">
	<a>欢迎：<s:property value="#session.user_info.username"/></a>
	<a href="<%=basePath%>cgweb">退出系统</a>
</li>
<li>
	<div id="gameClassTag">
		<a><b>游戏分类</b></a>
	</div>
	<div id="gameClass" class="gameClass" style="display: none;">
		<a href="javascript:;" class="closeButton" title="关闭" hidefocus="true"></a>
		<a href="<%=basePath%>cgweb/loveLiveCard.action"><img class="logo" src="../resources/images/cgweb/logo_lovelive.png" /></a>
		<a href="<%=basePath%>cgweb/kssmaCard.action"><img class="logo" src="../resources/images/cgweb/logo_kssma.png" /></a>
	 </div>
</li>