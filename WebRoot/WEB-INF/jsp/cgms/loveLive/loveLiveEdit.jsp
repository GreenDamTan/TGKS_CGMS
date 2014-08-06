<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="loveLiveEvt.id" id="loveLiveId" value="${loveLiveEvt.id }" />
<table>
	<tr><!-- cardId rarity character type -->
		<td>ID</td>
		<td><input type="text" name="loveLiveEvt.cardId" id="loveLiveCardId" class="text ui-widget-content ui-corner-all" value="${loveLiveEvt.cardId }" /></td>
		<td>稀有度</td>
		<td>
			<select id="loveLiveRarity" name="loveLiveEvt.rarity">
				<option value="UR" <s:if test='loveLiveEvt.rarity=="UR"'>selected="selected"</s:if>>UR</option>
				<option value="SR" <s:if test='loveLiveEvt.rarity=="SR"'>selected="selected"</s:if>>SR</option>
				<option value="R" <s:if test='loveLiveEvt.rarity=="R"'>selected="selected"</s:if>>R</option>
			</select>
		</td>
		<td>角色</td>
		<td>
			<select id="loveLiveCharacter" name="loveLiveEvt.character">
				<option value="Ayase Eli" <s:if test='loveLiveEvt.character=="Ayase Eli"'>selected="selected"</s:if>>絢瀬 絵里</option>
				<option value="Hoshizora Rin" <s:if test='loveLiveEvt.character=="Hoshizora Rin"'>selected="selected"</s:if>>星空 凛</option>
				<option value="Koizumi Hanayo" <s:if test='loveLiveEvt.character=="Koizumi Hanayo"'>selected="selected"</s:if>>小泉 花陽</option>
				<option value="Kousaka Honoka" <s:if test='loveLiveEvt.character=="Kousaka Honoka"'>selected="selected"</s:if>>高坂 穂乃果</option>
				<option value="Minami Kotori" <s:if test='loveLiveEvt.character=="Minami Kotori"'>selected="selected"</s:if>>南 ことり</option>
				<option value="Nishikino Maki" <s:if test='loveLiveEvt.character=="Nishikino Maki"'>selected="selected"</s:if>>西木野 真姫</option>
				<option value="Sonoda Umi" <s:if test='loveLiveEvt.character=="Sonoda Umi"'>selected="selected"</s:if>>園田 海未</option>
				<option value="Toujou Nozomi" <s:if test='loveLiveEvt.character=="Toujou Nozomi"'>selected="selected"</s:if>>東條 希</option>
				<option value="Yazawa Nico" <s:if test='loveLiveEvt.character=="Yazawa Nico"'>selected="selected"</s:if>>矢澤 にこ</option>
			</select>
		</td>
		<td>类型</td>
		<td>
			<select id="loveLiveType" name="loveLiveEvt.type">
				<option value="Smile" <s:if test='loveLiveEvt.type=="Smile"'>selected="selected"</s:if>>Smile</option>
				<option value="Pure" <s:if test='loveLiveEvt.type=="Pure"'>selected="selected"</s:if>>Pure</option>
				<option value="Cool" <s:if test='loveLiveEvt.type=="Cool"'>selected="selected"</s:if>>Cool</option>
				<option value="All" <s:if test='loveLiveEvt.type=="All"'>selected="selected"</s:if>>All</option>
			</select>
		</td>
	</tr>
	<tr><!-- imageUrl imageTUrl -->
		<td>未觉醒</td>
		<td colspan="3"><input type="text" name="loveLiveEvt.imageUrl" id="loveLiveImageUrl" class="text ui-widget-content ui-corner-all" value="${loveLiveEvt.imageUrl }" /></td>
		<td>觉醒后</td>
		<td colspan="3"><input type="text" name="loveLiveEvt.imageTUrl" id="loveLiveImageTUrl" class="text ui-widget-content ui-corner-all" value="${loveLiveEvt.imageTUrl }" /></td>
	</tr>
	<tr><!-- upload -->
		<td colspan="8">
			<form id="loveLiveImageUploadForm" name="loveLiveImageUploadForm" action="../cgms/uploadCardImage.action" method="post" enctype="multipart/form-data">
				<input type="hidden" name="path" id="path" value="" />
				<input type="hidden" name="name" id="name" value="" />
				<table>
					<tr>
						<td>
							<input type="file" id="loveLiveUpload" name="upload" size="30"/>
						</td>
						<td>
							<button id="uploadImageUrl">未觉醒</button>
						</td>
						<td>
							<button id="uploadImageTUrl">觉醒后</button>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr><!--  -->
		
	</tr>
</table>
<script type="text/javascript">
$(document).ready(function(){
	$( "#uploadImageUrl" ).button().click(function() {
		// 先校验是否选中图片再上传
		if ($("#loveLiveUpload").val() == null || $("#loveLiveUpload").val() == "")
		{
			alert("请选择图片");
			return;
		}
		// 校验是否填入cardId
		if ($("#loveLiveCardId").val() == null || $("#loveLiveCardId").val() == "")
		{
			alert("请填写卡片ID");
			return;
		}
		
		var cardName = $("#loveLiveCharacter").val().split(" ")[1] + "_" + $("#loveLiveCardId").val() + "_" + $("#loveLiveType").val().toLowerCase() + "_" + $("#loveLiveRarity").val().toLowerCase();
		$("#path").val("LoveLive/" + $("#loveLiveCharacter").val() + "/" + $("#loveLiveRarity").val() + "/");
		$("#name").val(cardName);
		
		var options = { 
			url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
			type:'POST', 
			success: function(uploadUrl){
				// 执行成功刷新form
				$("#loveLiveImageUrl").val(".." + uploadUrl);
			},
			error:function(){ 
				alert("操作失败"); 
			}
		};
		
		$("#loveLiveImageUploadForm").ajaxSubmit(options);
		return false;
	});
	
	$( "#uploadImageTUrl" ).button().click(function() {
		// 先校验是否选中图片再上传
		if ($("#loveLiveUpload").val() == null || $("#loveLiveUpload").val() == "")
		{
			alert("请选择图片");
			return;
		}
		// 校验是否填入cardId
		if ($("#loveLiveCardId").val() == null || $("#loveLiveCardId").val() == "")
		{
			alert("请填写卡片ID");
			return;
		}
		
		var cardName = $("#loveLiveCharacter").val().split(" ")[1] + "_" + $("#loveLiveCardId").val() + "_" + $("#loveLiveType").val().toLowerCase() + "_" + $("#loveLiveRarity").val().toLowerCase();
		$("#path").val("LoveLive/" + $("#loveLiveCharacter").val() + "/" + $("#loveLiveRarity").val() + "/");
		$("#name").val(cardName + "_t");
		
		var options = { 
			url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
			type:'POST', 
			success: function(uploadUrl){
				// 执行成功刷新form
				$("#loveLiveImageTUrl").val(".." + uploadUrl);
			},
			error:function(){ 
				alert("操作失败"); 
			}
		};
		
		$("#loveLiveImageUploadForm").ajaxSubmit(options);
		return false;
	});
});
</script>