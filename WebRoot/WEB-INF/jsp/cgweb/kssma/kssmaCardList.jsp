<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/cgweb/image-picker/image-picker.css" />
<script src="<%=basePath%>js/cgweb/image-picker/image-picker.js"></script>

<style type="text/css">
img {width: 150px; height: 210px; filter:alpha(opacity=70);moz-opacity:.70;opacity:.80;}
.thumbnail {background:#fff url(../resources/images/cgweb/yajirushi.gif) no-repeat center bottom;margin:0px auto;width:150x;overflow:hidden}
</style>
<div id="cardDiv" align="center">
    <select id="cardSelect" multiple="multiple" class="image-picker show-html">
    	<s:iterator  value="list" var="evt">
    		<option data-img-src='<s:property value="#evt.imageTUrl"/>' value='<s:property value="#evt.cardId"/>'><s:property value="#evt.cardId"/></option>
		</s:iterator>
	</select>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#cardSelect").imagepicker({
		hide_select : true,
		show_label : true
	});
});
</script>
