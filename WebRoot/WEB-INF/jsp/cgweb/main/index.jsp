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
</head>
<body>
<div align="center">
	<a href="<%=basePath%>cgweb/loveLiveCard.action">LoveLive</a> | <a href="<%=basePath%>cgweb/kssmaCard.action">扩散性MA</a>
</div>
</body>
</html>