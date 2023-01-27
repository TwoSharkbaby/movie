<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<main class="form-signin mt-5 mb-5 w-100 m-auto">
	<form id="regForm" action="/actor/modify" method="post" style="width:50em;" class="m-auto">
		<fieldset>
			<h1 class="h3 mb-3 fw-bold">배우등록</h1>
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="act_name" placeholder="배우 이름" value="<c:out value="${actor.act_name}" />" /> 
				<label for="floatingInput" class="fw-bold">배우 이름</label>
			</div>
			<div class="form-floating mb-3">
				<input type="date" class="form-control rounded-3" id="floatingInput" name="act_birth" placeholder="배우 생일" value="<c:out value="${actor.act_birth}" />" /> 
				<label for="floatingInput" class="fw-bold">배우 생일</label>
			</div>
			<div class="col-md-4 text-white mb-3">
				<label for="inputGenre" class="form-label">배우 성별</label>
                <select id="inputGenre" class="form-select" name="act_sex" >
                  <option selected>남성</option>
                  <option>여성</option>
                </select>
              </div>
			<div class="form-floating mb-3">
				<textarea class="form-control rounded-3" name="act_info" placeholder="배우 정보" style="height:200px;" ><c:out value="${actor.act_info}" /></textarea>
				<label for="floatingInput" class="fw-bold">배우 정보</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="mem_nickname" value="<c:out value="${principal.member.mem_nickname}"/>" readonly />
				<label for="floatingInput" class="fw-bold">닉네임</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="act_img" value="<c:out value="${actor.act_img}" />" /> 
				<label for="floatingInput" class="fw-bold">이미지</label>
			</div>	
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="act_thumb" value="<c:out value="${actor.act_thumb}" />" />
				<label for="floatingInput" class="fw-bold">섬네일</label>
			</div>	
			<input type="hidden" name="act_num" value="<c:out value="${actor.act_num}" />" /> 
			<input type="hidden" name="mov_num" value="<c:out value="${actor.mov_num}" />" /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' class="btn btn-danger">
							</div>
							<div class='uploadResult'>
								<ul>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button value="submit" class="btn btn-danger mt-3" >등록하기</button>
		</fieldset>
	</form>
</main>


<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm button").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='act_name']").val()) {
				alert("배우 이름을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='act_birth']").val()) {
				alert("배우 생일을 입력해주세요!");
				return false;
			}
			if (!regForm.find("select[name='act_sex']").val()) {
				alert("배우 성별을 입력해주세요!");
				return false;
			}
			if (!regForm.find("textarea[name='act_info']").val()) {
				alert("배우 정보를 입력해주세요!");
				return false;
			}
			if(!regForm.find("input[name='act_img']").val()){
				alert("배우 사진을 등록해주세요!");
				return false;
			}
			if(!regForm.find("input[name='act_thumb']").val()){
				alert("배우 섬네일을 입력해주세요!");
				return false;
			}
			regForm.submit();
		});

	});
</script>

<script>
	$(document).ready(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var cloneObj = $(".uploadDiv").clone();
		
		(function() {
			var act_num = '<c:out value="${actor.act_num}" />';
			$.getJSON(
				"/actor/getAttachList",
				{act_num : act_num},
				function(arr) {
					var str = "";
					$(arr).each(function(i, attach) {
						console.log(attach);
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_"	+ attach.uuid + "_" + attach.fileName);
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						str += "<span> " + attach.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName=" + fileCallPath + "'>";
						str += "</div>";
						str += "</li>";
				});
			$(".uploadResult ul").html(str);
		});
		})();

		$(".uploadResult").on("click", "button", function(e) {
			console.log("click!!!");
			if (confirm("Remove this file?")) {
				console.log("OK!");
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		// .uploadResult click button end

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(function(e) {

			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
			}

			$.ajax({
				url : '/uploadAjaxAction',
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			}); //$.ajax

		});

		function showUploadResult(uploadResultArr) {

			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}

			var uploadUL = $(".uploadResult ul");

			var str = "";

			$(uploadResultArr).each(function(i, obj) {

				if (obj.image) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'" +" ><div>";
					str += "<span> " + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
					$("input[name='act_thumb']").val(obj.uploadPath+"/s_"+obj.uuid +"_"+obj.fileName);
					$("input[name='act_img']").val(obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
				} else {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					var fileLink = fileCallPath .replace(new RegExp(/\\/g), "/");
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> " + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str + "</li>";
					}
				});
					uploadUL.append(str);
				}
						
				$(".uploadResult").on("click", "button", function(e){
					console.log("delete file");
							
					var targetFile = $(this).data("file"); 
					var type = $(this).data("type");
					var targetLi = $(this).closest("li");
							
					$.ajax({
						url : "/deleteFile",
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : {fileName:targetFile, type:type},
						dataType : 'text',
						type : 'POST',
						success : function(result){
							alert(result);
							targetLi.remove();
							$(".uploadDiv").html(cloneObj.html());
							$("input[type='file']").change(function(e) {

								var formData = new FormData();

								var inputFile = $("input[name='uploadFile']");

								var files = inputFile[0].files;

								for (var i = 0; i < files.length; i++) {

								if (!checkExtension(files[i].name, files[i].size)) {
									return false;
								}
								formData.append("uploadFile", files[i]);
								}

								$.ajax({
									url : '/uploadAjaxAction',
									beforeSend: function(xhr){
										xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
									},
									processData : false,
									contentType : false,
									data : formData,
									type : 'POST',
									dataType : 'json',
									success : function(result) {
										console.log(result);
										showUploadResult(result); //업로드 결과 처리 함수 
									}
								}); //$.ajax

							});
							
						}
					}); // ajax end
							
				}); // uploadResult button click end
						
});
</script>
	
<%@include file="../includes/footer.jsp"%>