<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="loveliveListSubmit" name="loveliveListSubmit" value="0" />
<div id="loveliveTableDiv" class="ui-widget">
    <table id="loveliveTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allLoveliveId" name="allLoveliveId"  /></th>
				<th>lovelive</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="loveliveId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="loveliveUpdate"><s:property value="#evt.cardId"/></b></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#loveliveTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".loveliveUpdate").click(function() {
			$("#loveliveManagerSubmit").val("1");
			$("#loveliveEdit").dialog("open");
			var edit = $.ajax({
				url : "../cgms/editLovelivePage.action?id=" + this.id,
				async : false
			});
			$("#loveliveForm").html(edit.responseText);
		});

		// 全选
		$("#allLoveliveId").click(function() {
			var checkbox = $("#loveliveTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
