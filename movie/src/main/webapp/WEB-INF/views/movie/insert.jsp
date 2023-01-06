<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<form id="regForm" action="/movie/insert" method="post">
	<input type="text" name="mov_title" placeholder="제목" /> 
	<input type="text" name="mov_director" placeholder="감독" /> 
	<input type="text" name="mov_genre" placeholder="장르" /> 
	<input type="text" name="mov_synopsis" placeholder="줄거리" /> 
	<input type="date" name="mov_release" /> 
	<input type="text" name="mem_nickname" value="<c:out value="${principal.member.mem_nickname}"/>" readonly/> 
	<input type="time" name="mov_runtime" /> 
	<input type="text" name="mov_img" /> 
	<input type="text" name="mov_thumb" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button value="submit">등록하기</button>
</form>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile'>
				</div>
				<div class='uploadResult'>
					<ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm button").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='mov_title']").val()) {
				alert("영화 제목을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_director']").val()) {
				alert("영화 감독을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_genre']").val()) {
				alert("영화 장르를 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_synopsis']").val()) {
				alert("영화 줄거리를 입력해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mov_release']").val()){
				alert("영화 개봉일을 등록해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mov_runtime']").val()){
				alert("영화 러닝타임 입력해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mov_img']").val()){
				alert("영화 이미지를 입력해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mov_thumb']").val()){
				alert("영화 섬네일을 입력해주세요!");
				return false;
			}
			regForm.submit();
		});

	});
</script>

<script>
$(document).ready(function(e){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	var cloneObj = $(".uploadDiv").clone();

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");/* 정규 표현식 */
	var maxSize = 5242880; // 5M
	
	function checkExtension(fileName, fileSize){
		if(fileSize > maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	} // checkExtendsion end
	
	$("input[type='file']").change(function(e){
		var formData = new FormData(); 
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files; 
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			contentType:false,
			processData:false,
			data:formData,
			type:'POST',
			dataType:'json',
			success: function(result){
				$("input[name='mov_img']").val(result.uploadPath+"/"+result.img_path);
				showUploadResult(result);
			}
		});
		
	}); // change end
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || 
				uploadResultArr.length == 0){
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		var str = "";
		$(uploadResultArr).each(function(i, obj){
			// p.559
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
		        str += "<span> "+ obj.fileName+"</span>";
		        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		        str += "<img src='/display?fileName="+fileCallPath+"'>";
		        str += "</div>";
		        str + "</li>";
		        $("input[name='mov_thumb']").val(obj.uploadPath+"/s_"+obj.uuid +"_"+obj.fileName);
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
	            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	            str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
		        str += "<span> "+ obj.fileName+"</span>";
		        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		        str += "<img src='/resources/img/attach.png'></a>";
		        str += "</div>";
		        str +"</li>";
			}
		}); // each end
		
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
				$("input[name='mov_thumb']").val("");
				$("input[name='mov_img']").val("");
				$(".uploadDiv").html(cloneObj.html());
				
				$("input[type='file']").change(function(e){
					var formData = new FormData(); 
					var inputFile = $("input[name='uploadFile']");
					var files = inputFile[0].files; 
					console.log(files);
					
					for(var i = 0; i < files.length; i++){
						if(!checkExtension(files[i].name, files[i].size)){
							return false;
						}
						formData.append("uploadFile", files[i]);
					}
					
					$.ajax({
						url:'/uploadAjaxAction',
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						contentType:false,
						processData:false,
						data:formData,
						type:'POST',
						dataType:'json',
						success: function(result){
							$("input[name='mov_img']").val(result.uploadPath+"/"+result.img_path);
							showUploadResult(result);
						}
					});
					
				}); // change end
			}
		}); // ajax end
		
	}); // uploadResult button click end
	
}); // ready end
</script>

<%@include file="../includes/footer.jsp"%>