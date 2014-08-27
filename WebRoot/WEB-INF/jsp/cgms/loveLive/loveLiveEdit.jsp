<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<style type="text/css">
.lovelive td{min-width: 40px;}
</style>
<input type="hidden" name="loveLiveEvt.id" id="loveLiveId" value="${loveLiveEvt.id }" />
<table class="lovelive">
	<tr><!-- cardId rarity girl type -->
		<td>ID</td>
		<td><input type="text" size="10" name="loveLiveEvt.cardId" id="loveLiveCardId" value="${loveLiveEvt.cardId }" /></td>
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
			<select id="loveLiveGirl" name="loveLiveEvt.girl">
				<option value="Ayase Eli" <s:if test='loveLiveEvt.girl=="Ayase Eli"'>selected="selected"</s:if>>絢瀬 絵里</option>
				<option value="Hoshizora Rin" <s:if test='loveLiveEvt.girl=="Hoshizora Rin"'>selected="selected"</s:if>>星空 凛</option>
				<option value="Koizumi Hanayo" <s:if test='loveLiveEvt.girl=="Koizumi Hanayo"'>selected="selected"</s:if>>小泉 花陽</option>
				<option value="Kousaka Honoka" <s:if test='loveLiveEvt.girl=="Kousaka Honoka"'>selected="selected"</s:if>>高坂 穂乃果</option>
				<option value="Minami Kotori" <s:if test='loveLiveEvt.girl=="Minami Kotori"'>selected="selected"</s:if>>南 ことり</option>
				<option value="Nishikino Maki" <s:if test='loveLiveEvt.girl=="Nishikino Maki"'>selected="selected"</s:if>>西木野 真姫</option>
				<option value="Sonoda Umi" <s:if test='loveLiveEvt.girl=="Sonoda Umi"'>selected="selected"</s:if>>園田 海未</option>
				<option value="Toujou Nozomi" <s:if test='loveLiveEvt.girl=="Toujou Nozomi"'>selected="selected"</s:if>>東條 希</option>
				<option value="Yazawa Nico" <s:if test='loveLiveEvt.girl=="Yazawa Nico"'>selected="selected"</s:if>>矢澤 にこ</option>
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
		<td>本地图</td>
		<td colspan="3"><input type="text" size="35" name="loveLiveEvt.imageUrl" id="loveLiveImageUrl" value="${loveLiveEvt.imageUrl }" /></td>
		<td>网络图</td>
		<td colspan="3"><input type="text" size="35" name="loveLiveEvt.imageTUrl" id="loveLiveImageTUrl" value="${loveLiveEvt.imageTUrl }" /></td>
	</tr>
	<tr><!-- upload -->
		<td colspan="5">
			<form id="loveLiveImageUploadForm" name="loveLiveImageUploadForm" action="../cgms/uploadCardImage.action" method="post" enctype="multipart/form-data">
				<input type="hidden" name="path" id="path" value="" />
				<input type="hidden" name="name" id="name" value="" />
				<table>
					<tr>
						<td>
							<input type="file" id="loveLiveUpload" name="upload" size="30"/>
						</td>
						<td >
							<button id="uploadImageUrl">上传</button>
							<button id="uploadImageTUrl">显示</button>
							<!-- <button id="uploadImageUrl">未觉醒</button> -->
							<!-- <button id="uploadImageTUrl">觉醒后</button> -->
						</td>
					</tr>
				</table>
			</form>
		</td>
		<td>
			Max Lv
		</td>
		<td colspan="2">
			<input type="text" size="10" name="loveLiveEvt.maxLevel" id="loveLiveMaxLevel" value="${loveLiveEvt.maxLevel }" />
		</td>
	</tr>
	<tr><!-- imageUrl -->
		<td align="center" rowspan="4" colspan="2" valign="middle">
			<img align="middle" width="160px" id="loveLiveImageUrlPic" alt="未觉醒" src="${loveLiveEvt.imageUrl }" />
		</td>
		<td>Lv1 HP</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.minHP" id="loveLiveMinHP" value="${loveLiveEvt.minHP }" /></td>
		<td>Lv1 Smile</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.minSmile" id="loveLiveMinSmile" value="${loveLiveEvt.minSmile }" /></td>
	</tr>
	<tr>
		<td>Lv1 Pure</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.minPure" id="loveLiveMinPure" value="${loveLiveEvt.minPure }" /></td>
		<td>Lv1 Cool</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.minCool" id="loveLiveMinCool" value="${loveLiveEvt.minCool }" /></td>
	</tr>
	<!-- 填补图片展示占用的行数 -->
	<tr>
	</tr>
	<tr>
	</tr>
	<!-- 填补图片展示占用的行数 -->
	<tr><!-- imageTUrl -->
		<td align="center" rowspan="4" colspan="2" valign="middle">
			<img align="middle" width="160px" id="loveLiveImageTUrlPic" alt="觉醒后" src="${loveLiveEvt.imageTUrl }" />
		</td>
		<td>LvMax HP</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.maxHP" id="loveLiveMaxHP" value="${loveLiveEvt.maxHP }" /></td>
		<td>LvMax Smile</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.maxSmile" id="loveLiveMaxSmile" value="${loveLiveEvt.maxSmile }" /></td>
	</tr>
	<tr>
		<td>LvMax Pure</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.maxPure" id="loveLiveMaxPure" value="${loveLiveEvt.maxPure }" /></td>
		<td>LvMax Cool</td><td colspan="2"><input type="text" size="10" name="loveLiveEvt.maxCool" id="loveLiveMaxCool" value="${loveLiveEvt.maxCool }" /></td>
	</tr>
	<!-- 填补图片展示占用的行数 -->
	<tr>
	</tr>
	<tr>
	</tr>
	<!-- 填补图片展示占用的行数 -->
	<tr><!-- appeal appealInfo -->
		<td>特效</td>
		<td><input type="text" name="loveLiveEvt.appeal" id="loveLiveAppeal" value="${loveLiveEvt.appeal }" /></td>
		<td>说明</td>
		<td colspan="5"><textarea name="loveLiveEvt.appealInfo" id="loveLiveAppealInfo" cols="60" rows="3">${loveLiveEvt.appealInfo }</textarea></td>
	</tr>
	<tr><!-- centerSkill centerSkillInfo -->
		<td>技能</td>
		<td><input type="text" name="loveLiveEvt.centerSkill" id="loveLiveCenterSkill" value="${loveLiveEvt.centerSkill }" /></td>
		<td>说明</td>
		<td colspan="5"><textarea name="loveLiveEvt.centerSkillInfo" id="loveLiveCenterSkillInfo" cols="60" rows="3">${loveLiveEvt.centerSkillInfo }</textarea></td>
	</tr>
	<tr><!-- remark -->
		<td>备注</td>
		<td colspan="7"><textarea name="loveLiveEvt.remark" id="loveLiveRemark" cols="105" rows="5">${loveLiveEvt.remark }</textarea></td>
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
		
		var cardName = $("#loveLiveGirl").val().split(" ")[1] + "_" + $("#loveLiveCardId").val() + "_" + $("#loveLiveType").val().toLowerCase() + "_" + $("#loveLiveRarity").val().toLowerCase();
		$("#path").val("LoveLive/" + $("#loveLiveGirl").val() + "/" + $("#loveLiveRarity").val() + "/");
		$("#name").val(cardName);
		
		var options = { 
			url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
			type:'POST', 
			success: function(uploadUrl){
				// 执行成功刷新form
				$("#loveLiveImageUrl").val(".." + uploadUrl);
				$("#loveLiveImageUrlPic").attr("src", ".." + uploadUrl);
			},
			error:function(){ 
				alert("操作失败"); 
			}
		};
		
		$("#loveLiveImageUploadForm").ajaxSubmit(options);
		return false;
	});
	
	/*
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
		
		var cardName = $("#loveLiveGirl").val().split(" ")[1] + "_" + $("#loveLiveCardId").val() + "_" + $("#loveLiveType").val().toLowerCase() + "_" + $("#loveLiveRarity").val().toLowerCase();
		$("#path").val("LoveLive/" + $("#loveLiveGirl").val() + "/" + $("#loveLiveRarity").val() + "/");
		$("#name").val(cardName + "_t");
		
		var options = { 
			url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
			type:'POST', 
			success: function(uploadUrl){
				// 执行成功刷新form
				$("#loveLiveImageTUrl").val(".." + uploadUrl);
				$("#loveLiveImageTUrlPic").attr("src", ".." + uploadUrl);
			},
			error:function(){ 
				alert("操作失败"); 
			}
		};
		
		$("#loveLiveImageUploadForm").ajaxSubmit(options);
		return false;
	});
	*/
	$( "#uploadImageTUrl" ).button().click(function() {
		$("#loveLiveImageTUrlPic").attr("src", $("#loveLiveImageTUrl").val());
	});
});
</script>