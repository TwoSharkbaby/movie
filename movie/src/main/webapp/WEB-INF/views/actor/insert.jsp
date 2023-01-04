<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<form action="/actor/insert" method="post">
	<input type="text" name="act_name" placeholder="이름" /> <input
		type="date" name="act_birth" placeholder="생일" /> <input type="text"
		name="act_sex" placeholder="성별" /> <input type="text" name=act_info
		placeholder="정보" /> <input type="text" name=act_img placeholder="이미지" />
	<input type="text" name=act_thumb placeholder="섬네일" /> <input
		type="hidden" name="mov_num" value="<c:out value="${mov_num}" />" /> <input
		type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
				$("input[name='act_img']").val(result.uploadPath+"/"+result.img_path);
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
		        $("input[name='act_thumb']").val(obj.uploadPath+"/s_"+obj.uuid +"_"+obj.fileName);
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
				$("input[name='act_thumb']").val("");
				$("input[name='act_img']").val("");
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
							$("input[name='act_img']").val(result.uploadPath+"/"+result.img_path);
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