<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<table width="100%">
		<thead>
			<tr>
				<th>영화번호</th>
				<th>영화제목</th>
				<th>감독</th>
				<th>장르</th>
				<th>줄거리</th>
				<th>개봉일</th>
				<th>상영시간</th>
				<th>등록일</th>
				<th>포스터사진</th>
				<th>섬네일사진</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${movie.mov_num}" /></td>
				<td><c:out value="${movie.mov_title}" /></td>
				<td><c:out value="${movie.mov_director}" /></td>
				<td><c:out value="${movie.mov_genre}" /></td>
				<td><c:out value="${movie.mov_synopsis}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${movie.mov_release}" /></td>
				<td><fmt:formatDate pattern="HH:mm:ss"
						value="${movie.mov_runtime}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
						value="${movie.mov_regdate}" /></td>
				<td><c:out value="${movie.mov_img}" /></td>
				<td><c:out value="${movie.mov_thumb}" /></td>
				<td><c:out value="${movie.mov_sco_point}" /></td>
			</tr>
		</tbody>
	</table>

	<a href="/movie/list"><button>뒤로 돌아가기</button></a>
	<a href="/movie/modify/<c:out value="${movie.mov_num}" />"><button>수정하기</button></a>
	<form action="/movie/delete" method="post">
		<input type="hidden" name="mov_num"
			value="<c:out value="${movie.mov_num}" />">
		<button type="submit">삭제하기</button>
	</form>

	<hr />

	<table width="100%">
		<thead>
			<tr>
				<th>배우번호</th>
				<th>배우이름</th>
				<th>섬네일사진</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty actor}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty actor}">
					<c:forEach items="${actor}" var="actor">
						<tr>
							<td><c:out value="${actor.act_num}" /></td>
							<td>
								<!-- Button trigger modal -->
								<button name="actor_modal" class="btn btn-primary"
									data-idx="<c:out value="${actor.act_num}" />">
									<c:out value="${actor.act_name}" />
								</button>
							</td>
							<td><c:out value="${actor.act_thumb}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<!-- Modal -->
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배우상세페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body-act_birth">
					<p>modal-body-act_birth</p>
				</div>
				<div class="modal-body-act_sex">
					<p>modal-body-act_sex</p>
				</div>
				<div class="modal-body-act_info">
					<p>modal-body-act_info</p>
				</div>
				<div class="modal-body-act_img">
					<p>modal-body-act_img</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<hr />

	<div>
		<a href="/review/insert/<c:out value="${movie.mov_num}" />"><button
				type="submit">리뷰등록하기</button></a>
	</div>

	<table width="100%">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>리뷰제목</th>
				<th>리뷰내용</th>
				<th>등록일</th>
				<th>좋아요싫어요</th>
				<th>영화번호</th>
				<th>작성자</th>
				<th>평점</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty review}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty review}">
					<c:forEach items="${review}" var="review">
						<tr>
							<td id="comment" name="comment" data-idx="<c:out value="${review.mov_rev_num}" />"><c:out value="${review.mov_rev_num}" />
							<button id="comment" name="comment" data-idx="<c:out value="${review.mov_rev_num}" />" ><c:out value="댓글작성" />
							</td>
							<td><c:out value="${review.mov_rev_title}" /></td>
							<td><c:out value="${review.mov_rev_content}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${review.mov_rev_regdate}" /></td>
							<td><button id="review_good" name="review_good"
									data-idx="<c:out value="${review.mov_rev_num}" />">
									<c:out value="${review.mov_rev_good}" />
								</button>
								<button id="review_bad" name="review_bad"
									data-idx="<c:out value="${review.mov_rev_num}" />">
									<c:out value="${review.mov_rev_bad}" />
								</button></td>
							<td><c:out value="${review.mov_num}" /></td>
							<td><c:out value="${review.mem_num}" /></td>
							<td><c:out value="${review.mov_sco_point}" /></td>
							<td><a
								href="/review/modify/<c:out value="${review.mov_num}" />/<c:out value="${review.mov_rev_num}" />"><button>수정하기</button></a></td>
							<td><form action="/review/delete" method="post">
									<input type="hidden" name="mov_rev_num"
										value="<c:out value="${review.mov_rev_num}" />"> <input
										type="hidden" name="mov_num"
										value="<c:out value="${review.mov_num}" />">
									<button type="submit">삭제하기</button>
								</form></td>



							<br />
						<tr>
							<td>
								<ul id="chat<c:out value="${review.mov_rev_num}" />"
									class="chat2" name="com"
									data-comment="<c:out value="${review.mov_rev_num}" />"></ul>
							</td>
						</tr>
					</c:forEach>


				</c:when>
			</c:choose>
		</tbody>
	</table>
	
	
<!-- Comment Modal -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">COMMENT MODAL</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>content</label> <input class="form-control" name='mov_rev_com_content'
                  value='New content'>
            </div>
            <div class="form-group">
               <label>mem_num</label> <input class="form-control" name='mem_num'
                  value='mem_num'>
            </div>
            <div class="form-group">
               <label>mov_rev_com_regdate</label> <input class="form-control"
                  name='mov_rev_com_regdate' value='2018-01-01 13:13'>
            </div>

         </div>
         <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
         </div>
      </div>
      <!— /.modal-content —>
   </div>
   <!— /.modal-dialog —>
</div>
<!— /.modal —>



	<script type="text/javascript">
      $(document).ready(
            function() {

               var result = '<c:out value="${result}"/>';

               checkModal(result);

               history.replaceState({}, null, null);

               function checkModal(result) {

                  if (result === '' || history.state) {
                     return;
                  } else {
                     alert(result);
                  }

               };
               
            

               var modal = $(".modal");

               $("button[name='actor_modal']").on("click", function(e) {

                  e.preventDefault();
                  var act_num = $(this).data("idx");

                  var data = {
                     act_num : act_num
                  };
                  $.ajax({
                     type : "GET",
                     url : "/actor/" + act_num,
                     contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
                     dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
                  }).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
                     showActorDetail(response);
                  }).fail(function(error) {
                     alert("올바른 경로가 아닙니다");
                  });

               });

               function showActorDetail(response) {
                  $(".modal-title").html(response.act_name + "상세내용");
                  $(".modal-body-act_birth").html(displayTime(response.act_birth));
                  $(".modal-body-act_sex").html(response.act_sex);
                  $(".modal-body-act_info").html(response.act_info);
                  $(".modal-body-act_img").html(response.act_img);
                  $(".modal").modal("show");
               };

               function displayTime(timeValue) {
                  var today = new Date();
                  var gap = today.getTime() - timeValue;
                  var dateObj = new Date(timeValue);

                  if (gap < (1000 * 60 * 60 * 24)) {
                     var hh = dateObj.getHours();
                     var mi = dateObj.getMinutes();
                     var ss = dateObj.getSeconds();
                     return [ (hh > 9 ? '' : '0') + hh, ':',
                           (mi > 9 ? '' : '0') + mi, ':',
                           (ss > 9 ? '' : '0') + ss ].join('');
                  } else {
                     var yy = dateObj.getFullYear();
                     var mm = dateObj.getMonth() + 1;
                     var dd = dateObj.getDate();
                     return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                           (dd > 9 ? '' : '0') + dd ].join('');
                  }
               };

               $("button[name='review_good']").on("click", function(e) {

                  var mov_rev_num = $(this).data("idx");
                  var good = $(this);
                  var bad = $(this).next('button');

                  var data = {
                     mov_rev_num : mov_rev_num,
                     mem_num : 1
                  // ## 로그인 처리하면 고정값 수정필요 ##
                  };
                  $.ajax({
                     type : "POST",
                     url : "/review/good",
                     data : JSON.stringify(data), // http body 데이터
                     contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
                     dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
                  }).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
                     good.html(response.good);
                     bad.html(response.bad);
                  }).fail(function(error) {
                     alert("올바른 경로가 아닙니다");
                  });

               });

               $("button[name='review_bad']").on("click", function(e) {

                  var mov_rev_num = $(this).data("idx");
                  var bad = $(this);
                  var good = $(this).prev('button');
                  ;

                  var data = {
                     mov_rev_num : mov_rev_num,
                     mem_num : 1
                  // ## 로그인 처리하면 고정값 수정필요 ##
                  };
                  $.ajax({
                     type : "POST",
                     url : "/review/bad",
                     data : JSON.stringify(data), // http body 데이터
                     contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
                     dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
                  }).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
                     good.html(response.good);
                     bad.html(response.bad);
                  }).fail(function(error) {
                     alert("올바른 경로가 아닙니다");
                  });
               });

            });
   </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>


	<script type="text/javascript"
		src="\resources\js\movieReviewComment.js"></script>
	<script type="text/javascript">
   $(document).ready(function(){
	 	     
	   $("td[id='comment']").each(function (index){
	

		   var idx = $(this).data('idx');
	   
		   
		   var data = {
		             mov_rev_num: idx,
		             mem_num: 1  // ## 로그인 처리하면 고정값 수정필요 ##
		          };
		   
		   console.log($(this).data("idx"))
		   var commentUL = $("#chat" + idx);	   
		   movieReviewCommentService.getList(data, function(list){
		         
	            
	            var str ="";
	            if(list == null || list.length ==0){
	               commentUL.html("");
	               return;
	            }
	            
	            for(var i =0, len = list.length || 0; i < len; i++){
	                     str +="<li class='left clearfix' data-idx='"+list[i].mov_rev_com_num+"'>";
	                     str +="<div><div class='header'><strong class='primary-font'>"+"작성회원 :  " +list[i].mem_num+ "   " +"</strong>";
	                     str +="<small class='pull-right text-muted'>"
	                               + movieReviewCommentService.displayTime(list[i].mov_rev_com_regdate)+"</small></div>";
	                     str +="<p>"+list[i].mov_rev_com_content+"</p></div></li>";             
	            }
	            commentUL.html(str);            
	      });
		   
		   

	   });
   

	          
	       
   
   });
   
   
         

  

   </script>


	<script type="text/javascript"
		src="\resources\js\movieReviewComment.js"></script>
	<script type="text/javascript">
   
   $(document).ready(function(){

      var comment = $("td[id='comment']").data('comment');
      var data = {
                   mov_rev_num: comment ,
                   mem_num: 1  // ## 로그인 처리하면 고정값 수정필요 ##
                };

           
           var commentUL = $("#chat");
     
      });
      
   </script>
   
	<script type="text/javascript"
		src="\resources\js\movieReviewComment.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var idx = $(this).data('idx');

		var modal = $("#commentModal");
	
	var modalInputContent = modal.find("input[name='mov_rev_com_content']");
	var modalInputMemNum = modal.find("input[name='mem_num']");
	var modalInputMovRevComRegdate = modal.find("input[name='mov_rev_com_regdate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	
	

    $(".chat2").on("click", "li", function(e){
  	  var idx = $(this).data('idx');
  	movieReviewCommentService.get(idx, function(comment){
  		modalInputContent.val(comment.content);
  		
  	})
  	  
    });
	
	$("button[name='comment']").on("click", function(e){
		var idx = $(this).data('idx');
		
		 var data = {
		            mov_rev_num: idx,
		            mem_num: 1  // ## 로그인 처리하면 고정값 수정필요 ##
		         };
		      console.log(data);

		 modal.find("input").val("");
		 modalInputMovRevComRegdate.closest("div").hide();
		 modal.find("button[id != 'modalCloseBtn']").hide();
		 
		 modalRegisterBtn.show();
		 $("#commentModal").modal("show");
		
		 modalRegisterBtn.on("click", function(e){
	       
			 var comment = {
				mov_rev_com_content : modalInputContent.val(),
	            mem_num : modalInputMemNum.val(),
	            mov_rev_num: idx
	         };
	         movieReviewCommentService.add(comment, function(result){
	            alert(result);
	            modal.find("input").val("");
	            modal.modal("hide");
	            showList(1);
	         });
	      });
	      
	      $('#modalCloseBtn').on("click", function(e){
	         modal.find("input").val("");
	         modal.modal("hide");
	      });
	     
	      
		 
		 
	});
	

	
	});
	
	</script>
	
</body>
</html>