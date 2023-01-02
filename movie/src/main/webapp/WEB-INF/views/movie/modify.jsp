<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
	<form action="/movie/modify" method="post">
		<input type="text" name="mov_title" value="<c:out value="${movie.mov_title}"/>" placeholder="제목"/>
		<input type="text" name="mov_director" value="<c:out value="${movie.mov_director}"/>" placeholder="감독"/>
		<input type="text" name="mov_genre" value="<c:out value="${movie.mov_genre}"/>" placeholder="장르"/>
		<input type="text" name="mov_synopsis" value="<c:out value="${movie.mov_synopsis}"/>" placeholder="줄거리"/>
		<input type="date" name="mov_release" value="<c:out value="${movie.mov_release}"/>" />
		<input type="time" name="mov_runtime" value="<c:out value="${movie.mov_runtime}"/>"/>
		<img src='http://localhost:8080/display?fileName=<c:out value="${movie.mov_img}" />'>
		<input type="text" name="mov_img" value="<c:out value="${movie.mov_img}"/>"/>
		<img src='http://localhost:8080/display?fileName=<c:out value="${movie.mov_thumb}" />'>
		<input type="text" name="mov_thumb" value="<c:out value="${movie.mov_thumb}"/>"/>
		<input type="hidden" name="mov_num" value="<c:out value="${movie.mov_num}"/>">
		<button value="submit">수정완료</button>
	</form>
	
<script>
	$(document).ready(
		function() {(
			function() {
				var mov_num = '<c:out value="${movie.mov_num}" />';
				$.getJSON(
					"/movie/getAttachList",
					{mov_num : mov_num},
					function(arr) {
						var str = "";
						$(arr).each(function(i, attach) {
							if (attach.fileType) {
								var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_"	+ attach.uuid + "_" + attach.fileName);
									str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									str += "<span> " + attach.fileName + "</span>";
									str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
									str += "<img src='/display?fileName=" + fileCallPath + "'>";
									str += "</div>";
									str += "</li>";
								} else {
									var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
									var fileLink = fileCallPath.replace(
										new RegExp(/\\/g), "/");
										str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
										str += "<span> " + attach.fileName + "</span><br/>";
										str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
										str += "<img src='/resources/img/attach.png'></a>";
										str += "</div>";
										str += "</li>";
										}
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
					});
</script>
	
</body>
</html>