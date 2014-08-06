<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="loveLiveListSubmit" name="loveLiveListSubmit" value="0" />
<div id="loveLiveTableDiv" class="ui-widget">
    <table id="loveLiveTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allLoveLiveId" name="allLoveLiveId"  /></th>
				<th>loveLive</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="loveLiveId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="loveLiveUpdate"><s:property value="#evt.cardId"/></b></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#loveLiveTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".loveLiveUpdate").click(function() {
			$("#loveLiveManagerSubmit").val("1");
			$("#loveLiveEdit").dialog("open");
			var edit = $.ajax({
				url : "../cgms/editLoveLivePage.action?id=" + this.id,
				async : false
			});
			$("#loveLiveForm").html(edit.responseText);
		});

		// 全选
		$("#allLoveLiveId").click(function() {
			var checkbox = $("#loveLiveTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>