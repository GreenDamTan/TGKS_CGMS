<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>

<!-- 图片方法功能 -->
<script src="<%=basePath%>js/common/image/js-global/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=basePath%>js/common/image/js-global/FancyZoom.js" language="JavaScript" type="text/javascript"></script>

<input type="hidden" id="loveLiveListSubmit" name="loveLiveListSubmit" value="0" />
<div id="loveLiveTableDiv" class="ui-widget">
    <table id="loveLiveTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allLoveLiveId" name="allLoveLiveId"  /></th>
				<th>编号</th>
				<th>未觉醒</th>
				<th>觉醒后</th>
				<th>角色</th>
				<th>稀有度</th>
				<th>类型</th>
				<th>最大等级</th>
				<th>LvMax HP</th>
				<th>LvMax Smile</th>
				<th>LvMax Pure</th>
				<th>LvMax Cool</th>
				<th>特效</th>
				<th>技能</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="loveLiveId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="loveLiveUpdate"><s:property value="#evt.cardId"/></b></td>
					<td><p><a href='<s:property value="#evt.imageUrl"/>' ><img width="60px" src="<s:property value="#evt.imageUrl"/>" class="photo"/></a></p></td>
					<td><p><a href='<s:property value="#evt.imageTUrl"/>' ><img width="60px" src="<s:property value="#evt.imageTUrl"/>" class="photo"/></a></p></td>
					<td><s:property value="#evt.girl"/></td>
					<td><s:property value="#evt.rarity"/></td>
					<td><s:property value="#evt.type"/></td>
					<td><s:property value="#evt.maxLevel"/></td>
					<td><s:property value="#evt.maxHP"/></td>
					<td><s:property value="#evt.maxSmile"/></td>
					<td><s:property value="#evt.maxPure"/></td>
					<td><s:property value="#evt.maxCool"/></td>
					<td><s:property value="#evt.appeal"/></td>
					<td><s:property value="#evt.centerSkill"/></td>
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
		
		// 使用图片缩放时需要初始化
		setupZoom();

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
