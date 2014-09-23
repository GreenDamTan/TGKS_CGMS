<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="cardOrderListSubmit" name="cardOrderListSubmit" value="0" />
<div id="cardOrderTableDiv" class="ui-widget">
    <table id="cardOrderTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allCardOrderId" name="allCardOrderId"  /></th>
				<th>订单ID</th>
				<th>用户名</th>
				<th>旺旺ID</th>
				<th>类型</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>备注</th>
				<th>操作</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr <s:if test="#evt.status == 1">bgcolor="#ddd"</s:if>>
					<td width="20"><input type="checkbox" name="cardOrderId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="cardOrderUpdate"><s:property value="#evt.id"/></b></td>
					<td><s:property value='#evt.username'/></td>
					<td><s:property value='#evt.alww'/></td>
					<td>
						<s:if test="#evt.type == 1">
							LoveLive
						</s:if>
						<s:elseif test="#evt.type == 2">
							扩散性MA
						</s:elseif>
					</td>
					<td>
						<s:if test="#evt.status == 0">
							预定
						</s:if>
						<s:elseif test="#evt.status == 1">
							完成
						</s:elseif>
					</td>
					<td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value='#evt.remark'/></td>
					<td>
					   <s:if test="#evt.type == 1">
                            <input type="button" onclick="window.open('../cgweb/loveLiveCartHistory.action?id=<s:property value='#evt.id'/>')" value="详情" />
                        </s:if>
                        <s:elseif test="#evt.type == 2">
                            <input type="button" onclick="window.open('../cgweb/kssmaCartHistory.action?id=<s:property value='#evt.id'/>')" value="详情" />
                        </s:elseif>
                        <!-- 
                        <input type="button" onclick="window.open('../cgms/downloadCardZip.action?id=<s:property value='#evt.id'/>')" value="下载" />
                         -->
					</td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#cardOrderTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".cardOrderUpdate").click(function() {
			$("#cardOrderManagerSubmit").val("1");
			$("#cardOrderEdit").dialog("open");
			var edit = $.ajax({
				url : "../cgms/editCardOrderPage.action?id=" + this.id,
				async : false
			});
			$("#cardOrderForm").html(edit.responseText);
		});

		// 全选
		$("#allCardOrderId").click(function() {
			var checkbox = $("#cardOrderTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
