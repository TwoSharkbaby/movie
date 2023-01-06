<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>
	
<form action="/movie/modify" method="post">
	<input type="text" name="mov_title" value="<c:out value="${movie.mov_title}"/>" placeholder="제목"/>
	<input type="text" name="mov_director" value="<c:out value="${movie.mov_director}"/>" placeholder="감독"/>
	<input type="text" name="mov_genre" value="<c:out value="${movie.mov_genre}"/>" placeholder="장르"/>
	<input type="text" name="mov_synopsis" value="<c:out value="${movie.mov_synopsis}"/>" placeholder="줄거리"/>
	<input type="date" name="mov_release" value="<c:out value="${movie.mov_release}"/>" />
	<input type="time" name="mov_runtime" value="<c:out value="${movie.mov_runtime}"/>"/>
	<input type="text" name="mem_nickname" value="<c:out value="${principal.member.mem_nickname}"/>" readonly/> 
	<input type="text" name="mov_img" value="<c:out value="${movie.mov_img}"/>"/>
	<input type="text" name="mov_thumb" value="<c:out value="${movie.mov_thumb}"/>"/>
	<input type="hidden" name="mov_num" value="<c:out value="${movie.mov_num}"/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button value="submit">수정완료</button>
</form>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile'>
				</div>

				<div class='uploadResult'>
					<ul>

					</ul>
				</div>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<script>
	$(document).ready(function() {
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		(function() {
			var mov_num = '<c:out value="${movie.mov_num}" />';
			$.getJSON(
				"/movie/getAttachList",
				{mov_num : mov_num},
				function(arr) {
					var str = "";
					$(arr).each(function(i, attach) {
						console.log(attach);
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_"	+ attach.uuid + "_" + attach.fileName);
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						str += "<span> " + attach.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
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
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
					$("input[name='mov_thumb']").val(obj.uploadPath+"/s_"+obj.uuid +"_"+obj.fileName);
					$("input[name='mov_img']").val(obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
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