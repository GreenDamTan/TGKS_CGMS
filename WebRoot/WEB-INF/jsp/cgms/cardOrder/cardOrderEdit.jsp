<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="cardOrderEvt.id" id="cardOrderId" value="${cardOrderEvt.id }" />
<table>
	<tr>
		<td><label for="name">cardOrder</label></td>
		<td><input type="text" name="cardOrderEvt.name" id="cardOrderName" class="text ui-widget-content ui-corner-all" value="${cardOrderEvt.name }" /></td>
	</tr>
</table>
<script type="text/javascript">
</script>