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

<div style="height: 60px;"></div>

<div align="center">
	<a href="<%=basePath%>cgweb/loveLiveCard.action"><img width="400px" src="../resources/images/cgweb/logo_lovelive.png" /></a>
<div align="center">
</div>
    <a href="<%=basePath%>cgweb/kssmaCard.action"><img width="400px" src="../resources/images/cgweb/logo_kssma.png" /></a>
</div>

</body>
</html>