<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="loveliveEvt.id" id="loveliveId" value="${loveliveEvt.id }" />
<table>
	<tr><!-- cardId rarity character type -->
		<td>ID</td>
		<td><input type="text" name="loveliveEvt.cardId" id="loveliveCardId" class="text ui-widget-content ui-corner-all" value="${loveliveEvt.cardId }" /></td>
		<td>稀有度</td>
		<td>
			<select id="loveliveRarity" name="loveliveEvt.rarity">
				<option value="ur">UR</option>
				<option value="sr">SR</option>
				<option value="r">R</option>
			</select>
		</td>
		<td>角色</td>
		<td>
			<select id="loveliveCharacter" name="loveliveEvt.character">
				<option value="Ayase Eli">絢瀬 絵里</option>
				<option value="Hoshizora Rin">星空 凛</option>
				<option value="Koizumi Hanayo">小泉 花陽</option>
				<option value="Kousaka Honoka">高坂 穂乃果</option>
				<option value="Minami Kotori">南 ことり</option>
				<option value="Nishikino Maki">西木野 真姫</option>
				<option value="Sonoda Umi">園田 海未</option>
				<option value="Toujou Nozomi">東條 希</option>
				<option value="Yazawa Nico">矢澤 にこ</option>
			</select>
		</td>
		<td>类型</td>
		<td>
			<select id="loveliveType" name="loveliveEvt.type">
				<option value="smile">Smile</option>
				<option value="pure">Pure</option>
				<option value="cool">Cool</option>
				<option value="all">All</option>
			</select>
		</td>
	</tr>
	<tr><!-- imageUrl imageTUrl -->
		<td>未觉醒</td>
		<td colspan="3"><input type="text" name="loveliveEvt.imageUrl" id="loveliveImageUrl" class="text ui-widget-content ui-corner-all" value="${loveliveEvt.imageUrl }" /></td>
		<td>觉醒后</td>
		<td colspan="3"><input type="text" name="loveliveEvt.imageTUrl" id="loveliveImageTUrl" class="text ui-widget-content ui-corner-all" value="${loveliveEvt.imageTUrl }" /></td>
	</tr>
	<tr><!-- upload -->
		<td colspan="8">
			<form id="loveliveImageUploadForm" name="loveliveImageUploadForm" action="../cgms/uploadCardImage.action" method="post"  enctype="multipart/form-data">
				<input type="hidden" name="path" id="path" value="" />
				<input type="hidden" name="name" id="name" value="" />
				<table>
					<tr>
						<td>
							<input type="file" name="upload"  size="30"/>
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
			var options = { 
				url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
				type:'POST', 
				success: function(uploadUrl){
					// 执行成功刷新form
					$("#loveliveImageUrl").val(".." + uploadUrl);
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveliveImageUploadForm").ajaxSubmit(options);
			return false;
	});
	
	$( "#uploadImageTUrl" ).button().click(function() {
			var options = { 
				url:"${pageContext.request.contextPath}/cgms/uploadCardImage.action", // 提交给哪个执行
				type:'POST', 
				success: function(uploadUrl){
					// 执行成功刷新form
					$("#loveliveImageTUrl").val(".." + uploadUrl);
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveliveImageUploadForm").ajaxSubmit(options);
			return false;
	});
});
</script>