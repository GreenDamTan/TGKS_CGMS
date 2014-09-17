<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>

<!-- 图片方法功能 -->
<script src="<%=basePath%>js/common/image/js-global/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=basePath%>js/common/image/js-global/FancyZoom.js" language="JavaScript" type="text/javascript"></script>

<input type="hidden" id="kssmaListSubmit" name="kssmaListSubmit" value="0" />
<div id="kssmaTableDiv" class="ui-widget">
    <table id="kssmaTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allKssmaId" name="allKssmaId"  /></th>
				<th>编号</th>
                <th>本地图</th>
                <th>网络图</th>
                <th>名称</th>
                <th>稀有度</th>
                <th>类型</th
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="kssmaId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="kssmaUpdate"><s:property value="#evt.cardId"/></b></td>
                    <td><p><a href='<s:property value="#evt.imageUrl"/>' ><img width="60px" src="<s:property value="#evt.imageUrl"/>" class="photo"/></a></p></td>
                    <td><p><a href='<s:property value="#evt.imageTUrl"/>' ><img width="60px" src="<s:property value="#evt.imageTUrl"/>" class="photo"/></a></p></td>
                    <td><s:property value="#evt.name" /></td>
                    <td><s:property value="#evt.rarity"/></td>
                    <td>
                        <s:if test='#evt.type=="red"'>剣術の城</s:if>
                        <s:elseif test='#evt.type=="greed"'>技巧の場</s:elseif>
                        <s:elseif test='#evt.type=="blue"'>魔法の派</s:elseif>
                        <s:elseif test='#evt.type=="white"'>妖精</s:elseif>
                    </td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#kssmaTable').longtable({
			'perPage' : 10
		});
		
		// 使用图片缩放时需要初始化
        setupZoom();

		// 点击记录首栏进入更新操作
		$(".kssmaUpdate").click(function() {
			$("#kssmaManagerSubmit").val("1");
			$("#kssmaEdit").dialog("open");
			var edit = $.ajax({
				url : "../cgms/editKssmaPage.action?id=" + this.id,
				async : false
			});
			$("#kssmaForm").html(edit.responseText);
		});

		// 全选
		$("#allKssmaId").click(function() {
			var checkbox = $("#kssmaTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
