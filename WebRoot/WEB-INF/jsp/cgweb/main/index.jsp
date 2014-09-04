<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <base href=<%=basePath%>> 
    <title>卡牌定制下单系统——猫萌公社</title>
    <link rel="stylesheet" type="text/css" href="resources/css/cgweb/login/style.css" />
</head>
<body>
<div align="left">
	欢迎登陆：<s:property value="#session.user_info.username"/>
					<a href="<%=basePath%>cgweb">退出系统</a>
</div>
<div align="center">
	<a href="<%=basePath%>cgweb/loveLiveCard.action"><img src="resources/images/cgweb/logo_lovelive.png" /></a> <a href="<%=basePath%>cgweb/kssmaCard.action"><img src="resources/images/cgweb/logo_kssma.png" /></a>
</div>
</body>
</html>