<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="cardOrderEvt.id" id="cardOrderId" value="${cardOrderEvt.id }" />
<table>
	<tr>
		<td>用户名</td>
		<td>${cardOrderEvt.username }</td>
		<td>阿里旺旺</td>
		<td>${cardOrderEvt.alww }</td>
	</tr>
	<tr>
		<td>类型</td>
		<td>
			<s:if test="cardOrderEvt.type == 1">
				LoveLive
			</s:if>
			<s:elseif test="cardOrderEvt.type == 2">
				扩散性MA
			</s:elseif>
		</td>
		<td>状态</td>
		<td>
			<s:if test="cardOrderEvt.status == 0">
				预定
			</s:if>
			<s:elseif test="cardOrderEvt.type == 1">
				完成
			</s:elseif>
		</td>
	</tr>
	<tr>
		<td>卡片ID</td>
		<td colspan="3">${cardOrderEvt.cardId }</td>
	</tr>
	<tr>
		<td>备注</td>
		<td colspan="3">${cardOrderEvt.remark }</td>
	</tr>
</table>
<script type="text/javascript">
</script>