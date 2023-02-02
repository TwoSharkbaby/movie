<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>

<%@include file="../includes/header.jsp"%>

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
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <th>작성자 닉네임</th>
         </sec:authorize>
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
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <td><c:out value="${movie.mem_nickname}" /></td>
         </sec:authorize>
         <td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
         <td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
         <td><c:out value="${movie.mov_sco_point}" /></td>
      </tr>
   </tbody>
</table>

<a href="/"><button>뒤로 돌아가기</button></a>

<sec:authorize access="hasRole('ROLE_ADMIN')">
   <a href="/movie/modify/<c:out value="${movie.mov_num}" />"><button>수정하기</button></a>
   <form action="/movie/delete" method="post">
      <input type="hidden" name="mov_num" value="<c:out value="${movie.mov_num}"/>"> 
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <button type="submit">삭제하기</button>
   </form>
</sec:authorize>

<hr />

<sec:authorize access="hasRole('ROLE_ADMIN')">
   <div>
      <a href="/actor/insert/<c:out value="${movie.mov_num}" />">
         <button type="submit">배우등록하기</button>
      </a>
   </div>
</sec:authorize>

<table width="100%">
   <thead>
      <tr>
         <th>배우번호</th>
         <th>배우이름</th>
         <th>섬네일사진</th>
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <th>작성자 닉네임</th>
            <th>수정</th>
            <th>삭제</th>
         </sec:authorize>
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
                  <td><button name="actor_modal" class="btn btn-primary"
                        data-idx="<c:out value="${actor.act_num}" />">
                        <c:out value="${actor.act_name}" />
                     </button></td>
                  <td><img src='/imgs/<c:out value="${actor.act_thumb}" />'></td>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <td><c:out value="${actor.mem_nickname}" /></td>
                     <td><a
                        href="/actor/modify/<c:out value="${actor.act_num}" />">
                           <button>수정하기</button>
                     </a></td>
                     <td><form action="/actor/delete" method="post">
                           <input type="hidden" name="act_num"
                              value="<c:out value="${actor.act_num}" />"> <input
                              type="hidden" name="mov_num"
                              value="<c:out value="${actor.mov_num}" />"> <input
                              type="hidden" name="${_csrf.parameterName}"
                              value="${_csrf.token}" />
                           <button type="submit">삭제하기</button>
                        </form></td>
                  </sec:authorize>
               </tr>
            </c:forEach>
         </c:when>
      </c:choose>
   </tbody>
</table>

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
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class="modal-body-mem_nickname">
               <p>modal-body-mem_nickname</p>
            </div>
         </sec:authorize>
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
   <a href="/review/insert/<c:out value="${movie.mov_num}" />">
      <button type="submit">리뷰등록하기</button>
   </a>
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
         <th>작성자 닉네임</th>
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
                  <td id="comment" name="comment"
                     data-idx="<c:out value="${review.mov_rev_num}" />"><c:out
                        value="${review.mov_rev_num}" />

                     <button class="commentAdd" id="commentAdd" name="comment"
                        data-idx="<c:out value="${review.mov_rev_num}" />">
                        <c:out value="댓글작성" /></td>
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
                  <td><c:out value="${review.mem_nickname}" /></td>
                  <td><c:out value="${review.mov_sco_point}" /></td>
                  <sec:authorize access="isAuthenticated()">
                     <c:if test="${principal.member.mem_num eq review.mem_num}">
                        <td><a
                           href="/review/modify/<c:out value="${review.mov_num}" />/<c:out value="${review.mov_rev_num}" />/<c:out value="${review.mem_num}"/>"><button>수정하기</button></a></td>
                        <td><form action="/review/delete" method="post">
                              <input type="hidden" name="mov_rev_num"
                                 value="<c:out value="${review.mov_rev_num}" />"> <input
                                 type="hidden" name="mov_num"
                                 value="<c:out value="${review.mov_num}" />"> <input
                                 type="hidden" name="mem_num"
                                 value="<c:out value="${review.mem_num}" />"> <input
                                 type="hidden" name="${_csrf.parameterName}"
                                 value="${_csrf.token}" />
                              <button type="submit">삭제하기</button>
                           </form></td>
                     </c:if>
                  </sec:authorize>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <td><form action="/review/delete" method="post">
                           <input type="hidden" name="mov_rev_num"
                              value="<c:out value="${review.mov_rev_num}" />"> <input
                              type="hidden" name="mov_num"
                              value="<c:out value="${review.mov_num}" />"> <input
                              type="hidden" name="mem_num"
                              value="<c:out value="${review.mem_num}" />"> <input
                              type="hidden" name="${_csrf.parameterName}"
                              value="${_csrf.token}" />
                           <button type="submit">관리자삭제하기</button>
                        </form></td>
                  </sec:authorize>
               </tr>
               <br />

               <!-- 자바스크립트로 리뷰에 달린 덧글 처리 -->
               <tr>
                  <td>
                     <ul id="chat<c:out value="${review.mov_rev_num}" />"
                        class="chat2" name="com">
                        <li name="mov_rev_com_num" data-mov_rev_com_num="1" />
                        
                     <sec:authorize access="isAuthenticated()">
                     <c:if test="${principal.member.mem_num eq mem_num}">
                        <td><button id="com_modify">댓글수정하기</button></td>
                     </c:if>
                  </sec:authorize>
                  
                              
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <c:if test="${principal.member.mem_num eq mem_num}">
                        <button id="com_delete">댓글삭제하기</button>
                     </c:if>
                  </sec:authorize>
                        
                        <button name="com_good" id="com_good" data-mov_rev_com_num="1">좋아요</button>
                        <button name="com_bad" id="com_bad" data-mov_rev_com_num="1">싫어요</button>
                     </ul>
                  </td>
               </tr>

            </c:forEach>
         </c:when>
      </c:choose>
   </tbody>
</table>



<!-- Comment Modal -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" data-rev_num="-1">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title1" id="myModalLabel">댓글 정보</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>내용</label> <input class="form-control"
                  name='mov_rev_com_content' value='New content'>
            </div>
            <div class="form-group">
               <label></label> <input class="form-control" name='mem_num'
                  value='mem_num' readonly="readonly">
            </div>
            <div class="form-group">
               <label>닉네임</label> <input class="form-control"
                  name='mem_nickname' value='mem_nickname' readonly="readonly">
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
$(document).ready(function() {
               
   var csrfHeaderName = "${_csrf.headerName}";
   var csrfTokenValue = "${_csrf.token}";

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
         beforeSend: function(xhr){
         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         },
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
      <sec:authorize access="hasRole('ROLE_ADMIN')">   
      $(".modal-body-mem_nickname").html(response.mem_nickname);
      </sec:authorize>   
      $(".modal-body-act_img").html("<td><img src='/imgs/" + response.act_img + "'></td>");
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
   
   <sec:authorize access="isAuthenticated()">
   $("button[name='review_good']").on("click", function(e) {

      var mov_rev_num = $(this).data("idx");
      var good = $(this);
      var bad = $(this).next('button');
      <sec:authorize access="isAuthenticated()">
      var mem_num = "<c:out value="${principal.member.mem_num}"/>";
      </sec:authorize>
      var data = {
         mov_rev_num : mov_rev_num,
         mem_num : mem_num            
      };
      $.ajax({
         type : "POST",
         url : "/review/good",
         beforeSend: function(xhr){
         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         },
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
                  
      <sec:authorize access="isAuthenticated()">
         var mem_num = "<c:out value="${principal.member.mem_num}"/>";
      </sec:authorize>
                  
      var data = {
         mov_rev_num : mov_rev_num,
         mem_num : mem_num
      };
      $.ajax({
         type : "POST",
         url : "/review/bad",
         beforeSend: function(xhr){
         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         },
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
   
   
     $("tbody").on("click", "button[name='com_good']", function(e) {
         
          var mov_rev_com_num = $(this).data("mov_rev_com_num");
           var good = $(this);
           var bad = $(this).next('button');
          console.log(mov_rev_com_num +"좋아요");   
          
        <sec:authorize access="isAuthenticated()">
      var mem_num = "<c:out value="${principal.member.mem_num}"/>";
      </sec:authorize>
           var data = {
             mov_rev_com_num : mov_rev_com_num,
              mem_num : mem_num
           // ## 로그인 처리하면 고정값 수정필요 ##
           };

           $.ajax({
              type : "POST",
              url : "/comment/good",
            beforeSend: function(xhr){
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
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
       
       $("tbody").on("click", "button[name='com_bad']", function(e) {
        
            var mov_rev_com_num = $(this).data("mov_rev_com_num");
            var good = $(this).prev('button');
            var bad = $(this);
           console.log(mov_rev_com_num +"싫어요");   
           
         <sec:authorize access="isAuthenticated()">
      var mem_num = "<c:out value="${principal.member.mem_num}"/>";
      </sec:authorize>
           
            var data = {
              mov_rev_com_num : mov_rev_com_num,
               mem_num : mem_num
            // ## 로그인 처리하면 고정값 수정필요 ##
            };
      
           $.ajax({
              type : "POST",
              url : "/comment/bad",
            beforeSend: function(xhr){
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
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
   
   </sec:authorize>
});
</script>

<script type="text/javascript"
   src="\resources\js\movieReviewComment.js?v=11"></script>
<script type="text/javascript">

  
      $("td[id='comment']").each(function (index){
    
         var csrfHeaderName = "${_csrf.headerName}";
         var csrfTokenValue = "${_csrf.token}";

         var mem_nickname = null;

         
         <sec:authorize access="isAuthenticated()">
         mem_nickname = "<c:out value="${principal.member.mem_nickname}"/>";
         </sec:authorize>

            <sec:authorize access="isAuthenticated()">
             mem_num = "<c:out value="${principal.member.mem_num}"/>";
         </sec:authorize>

         $(document).ajaxSend(function(e, xhr, options){
              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         });       
                  
         
   
         var idx = $(this).data('idx');
         console.log(idx);


          var data1 = {
                mov_rev_num: idx};
         console.log(data1);

         
          
          var commentUL = $("#chat" + idx);
           showList(1);
        
           function showList(page){   
          
            movieReviewCommentService.getList(data1, function(list){
                 var str = "";
                 
                 <sec:authorize access="isAuthenticated()">
                 var mem_num = "<c:out value="${principal.member.mem_num}"/>";
                 </sec:authorize>
                 
                 if(list == null || list.length == 0){
                    commentUL.html("");          
                    return;
                 }
                 for(var i =0, len = list.length || 0; i < len; i++){
                     str +="<li class='left clearfix' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>";
                     str +="<div><div class='header'><strong class='primary-font'>"+"작성회원 :  " +list[i].mem_nickname+ "   " +"</strong>";
                     str +="<small class='pull-right text-muted'>"+ movieReviewCommentService.displayTime(list[i].mov_rev_com_regdate)+"</small></div>";
                
                     <sec:authorize access="isAuthenticated()">
                     if(mem_num == list[i].mem_num){
                             str +="<button name='com_modify'>" + "수정/삭제버튼" + "</button>";
                     }
                         </sec:authorize>
                          
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                    str += "<button name='com_delete'>" + "관리자 댓글삭제하기" + "</button>";
                    </sec:authorize>
                   
                     str +="<p>"+list[i].mov_rev_com_content+"</p>" + "</div></li>";
                     str +="<button name='com_good' id='com_good' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_good +"</button>";
                     str +="<button name='com_bad' id='com_bad' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_bad +"</button>";  
                     
            }
            commentUL.html(str); 
            }); // end function
         } // end showlist 
         
console.log(commentUL);
var modal = $("#commentModal");

var modalInputContent = modal.find("input[name='mov_rev_com_content']");
var modalInputMemNum = modal.find("input[name='mem_num']");
var modalInputMovRevComRegdate = modal.find("input[name='mov_rev_com_regdate']");
var modalInputMemNickname = modal.find("input[name='mem_nickname']");             
var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");
var modalCloseBtn = $("#modalCloseBtn");

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

var mem_nickname = null;

<sec:authorize access="isAuthenticated()">
mem_nickname = "<c:out value="${principal.member.mem_nickname}"/>";
</sec:authorize>

<sec:authorize access="isAuthenticated()">
var mem_num = "<c:out value="${principal.member.mem_num}"/>";
</sec:authorize>

$(document).ajaxSend(function(e, xhr, options){
     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
}); 

             
           $("#chat"+ idx).on("click" , "li","button[name= 'com_modify']", function(e){
              var mov_rev_com_num = $(this).data("mov_rev_com_num");
              console.log("chat + idx : " +  mov_rev_com_num);
               movieReviewCommentService.get(mov_rev_com_num, function(comment) {
                   modalInputContent.val(comment.mov_rev_com_content);
                   modalInputMemNum.val(comment.mem_num).hide();
                   modalInputMemNickname.val(comment.mem_nickname);
                   modalInputMovRevComRegdate.val(movieReviewCommentService.displayTime(comment.mov_rev_com_regdate))
                   .attr("readonly", "readonly");
                   modal.data("mov_rev_com_num", comment.mov_rev_com_num);
                   
                   modal.find("button[id != 'modalCloseBtn']").hide();
                   modalModBtn.show();
                   modalRemoveBtn.show();
                   
                   $("#commentModal").data("rev_num", idx);
                   $("#commentModal").modal("show");
              });
               
               
               
           });
           

      });       // td end   
                      


</script>


<script type="text/javascript">
var modal = $("#commentModal");

var modalInputContent = modal.find("input[name='mov_rev_com_content']");
var modalInputMemNum = modal.find("input[name='mem_num']");
var modalInputMovRevComRegdate = modal.find("input[name='mov_rev_com_regdate']");
     var modalInputMemNickname = modal.find("input[name='mem_nickname']");
var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");
var modalCloseBtn = $("#modalCloseBtn");

  var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

var mem_nickname = null;

<sec:authorize access="isAuthenticated()">
mem_nickname = "<c:out value="${principal.member.mem_nickname}"/>";
</sec:authorize>

console.log(mem_nickname);

   <sec:authorize access="isAuthenticated()">
   var mem_num = "<c:out value="${principal.member.mem_num}"/>";
</sec:authorize>

console.log(mem_num);

$(document).ajaxSend(function(e, xhr, options){
     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});
    var mov_rev_num = $("#commentModal").data("rev_num");
    
    console.log(mov_rev_num);
    
    
    function showRevList(mov_rev_num) {
        console.log("showRevList!!!!");
        var commentUL = $("#chat" + mov_rev_num); 
        var params = {mov_rev_num:mov_rev_num, page : 1};
        movieReviewCommentService.getList(params, function(list) {
                       var str = "";
                       console.log(list);
                       if (list == null || list.length == 0) {
                          commentUL.html("");
                          return;
                       }
                       
                       for (var i = 0, len = list.length || 0; i < len; i++) {
                           str +="<li class='left clearfix' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>";
                           str +="<div><div class='header'><strong class='primary-font'>"+"작성회원 :  " +list[i].mem_nickname+ "   " +"</strong>";
                           str +="<small class='pull-right text-muted'>"+ movieReviewCommentService.displayTime(list[i].mov_rev_com_regdate)+"</small></div>";
                      
                           <sec:authorize access="isAuthenticated()">
                           if(mem_num == list[i].mem_num){
                                   str +="<button name='com_modify'>" + "수정/삭제버튼" + "</button>";
                           }
                               </sec:authorize>
                                
                              <sec:authorize access="hasRole('ROLE_ADMIN')">
                          str += "<button name='com_delete'>" + "관리자 댓글삭제하기" + "</button>";
                          </sec:authorize>
                         
                           str +="<p>"+list[i].mov_rev_com_content+"</p>" + "</div></li>";
                           str +="<button name='com_good' id='com_good' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_good +"</button>";
                           str +="<button name='com_bad' id='com_bad' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_bad +"</button>";  
                       }
                       commentUL.html(str);
        });
     }
    
    modalRemoveBtn.on("click", function(e){
        var mov_rev_com_num = modal.data("mov_rev_com_num");
        console.log(mov_rev_com_num);
        console.log("mem_num : " + mem_num);
      
        var mov_rev_num = $("#commentModal").data("rev_num");

        var mem_num = null;
        
        var originalMemNum = modalInputMemNum.val();
        
        <sec:authorize access="isAuthenticated()">
         mem_num = "<c:out value="${principal.member.mem_num}"/>";
     </sec:authorize>
     
        
        if(!mem_num){
           alert("로그인 후 삭제가 가능합니다.");
           modal.modal("hide");
           return;   
        }
        
        
        if(mem_num != originalMemNum){
           alert("자신이 작성한 댓글만 삭제가 가능합니다.");
           modal.modal("hide");
           return;   
        }
        
        console.log("댓글 번호 : " + $("#commentModal").data("rev_num"));

        
        console.log("movieReviewDeleteService : " + mov_rev_com_num);
         movieReviewCommentService.remove(mov_rev_com_num, originalMemNum , function(result){
              alert(result);
            modal.modal("hide");
            showRevList(mov_rev_num);
         });
     });
    
    
    
    

    modalModBtn.on("click", function(e){
     var mov_rev_num = $("#commentModal").data("rev_num");
    
     var originalMemNum = modalInputMemNum.val();
     
     var mov_rev_com_num = modal.data("mov_rev_com_num");
      console.log(mov_rev_com_num);
      var mem_num = null;
      
      <sec:authorize access="isAuthenticated()">
       mem_num = "<c:out value="${principal.member.mem_num}"/>";
   </sec:authorize>
   
   
       var comment = 
       {mov_rev_com_num : modal.data("mov_rev_com_num"), 
             mov_rev_com_content : modalInputContent.val(),
             mem_num:originalMemNum ,
             mem_nickname : modalInputMemNickname.val()};
       
       if(!mem_num){
          alert("로그인 후 수정 가능합니다.");
          modal.modal("hide");
          return;   
       }
       
       console.log("original mem_num : " + originalMemNum);
       
       if(mem_num != originalMemNum){
          alert("자신이 작성한 댓글만 수정 가능합니다.");
          modal.modal("hide");
          return;   
       }
       
       
     movieReviewCommentService.update(comment, function(result){
          alert(result);
          modal.modal("hide");
          showRevList(mov_rev_num);
     });
  });
   </script>



<script type="text/javascript">
      var modal = $("#commentModal");
   
      var modalInputContent = modal.find("input[name='mov_rev_com_content']");
      var modalInputMemNum = modal.find("input[name='mem_num']");
      var modalInputMovRevComRegdate = modal.find("input[name='mov_rev_com_regdate']");
        var modalInputMemNickname = modal.find("input[name='mem_nickname']");
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      var modalCloseBtn = $("#modalCloseBtn");
      
       var csrfHeaderName = "${_csrf.headerName}";
     var csrfTokenValue = "${_csrf.token}";
   
     var mem_nickname = null;
    
    <sec:authorize access="isAuthenticated()">
    mem_nickname = "<c:out value="${principal.member.mem_nickname}"/>";
    </sec:authorize>
   
      <sec:authorize access="isAuthenticated()">
      var mem_num = "<c:out value="${principal.member.mem_num}"/>";
   </sec:authorize>
    
      $(document).ajaxSend(function(e, xhr, options){
         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      });
      
      $("button[name='comment']").on("click", function(e) {
               console.log($(this).data('idx'));
               var idx = $(this).data('idx');
       
                  modal.find("input").val("");
                modal.find("input[name='mem_num']").val(mem_num).hide();
               modal.find("input[name='mem_nickname']").val(mem_nickname);
                modalInputMovRevComRegdate.closest("div").hide();
                modal.find("button[id != 'modalCloseBtn']").hide();
                modalRegisterBtn.show();
                $("#commentModal").data("rev_num", idx);
                $("#commentModal").modal("show");
                  
            });
      
      modalRegisterBtn.on("click", function(e){
             
         console.log("댓글 등록 버튼 클릭!");
         console.log("댓글 번호 : " + $("#commentModal").data("rev_num"));
         var mov_rev_num = $("#commentModal").data("rev_num");
         

         
         var comment = {
            mov_rev_com_content : modalInputContent.val(),
            mem_num : modalInputMemNum.val(),
            mov_rev_num: mov_rev_num,
            mem_nickname : mem_nickname
         };
         
         movieReviewCommentService.add(comment, function(result){
            console.log("movieReviewCommentService : " + mov_rev_num);
            if(result == "success")
               alert(result);
               showRevList(mov_rev_num);
            $("#commentModal").modal("hide");
         });
              
      });
      
      modalCloseBtn.on("click", function(e){ 
         console.log("댓글 닫기 버튼 클릭!");
         $("#commentModal").modal("hide");
              
      });
      
      
      function showRevList(mov_rev_num) {
         console.log("showRevList!!!!");
         var commentUL = $("#chat" + mov_rev_num); 
         var params = {mov_rev_num:mov_rev_num, page : 1};
         movieReviewCommentService.getList(params, function(list) {
                        var str = "";
                        console.log(list);
                        if (list == null || list.length == 0) {
                           commentUL.html("");
                           return;
                        }
                        
                        for (var i = 0, len = list.length || 0; i < len; i++) {
                            str +="<li class='left clearfix' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>";
                            str +="<div><div class='header'><strong class='primary-font'>"+"작성회원 :  " +list[i].mem_nickname+ "   " +"</strong>";
                            str +="<small class='pull-right text-muted'>"+ movieReviewCommentService.displayTime(list[i].mov_rev_com_regdate)+"</small></div>";
                       
                            <sec:authorize access="isAuthenticated()">
                            if(mem_num == list[i].mem_num){
                                    str +="<button name='com_modify'>" + "수정/삭제버튼" + "</button>";
                            }
                                </sec:authorize>
                                 
                               <sec:authorize access="hasRole('ROLE_ADMIN')">
                           str += "<button name='com_delete'>" + "관리자 댓글삭제하기" + "</button>";
                           </sec:authorize>
                          
                            str +="<p>"+list[i].mov_rev_com_content+"</p>" + "</div></li>";
                            str +="<button name='com_good' id='com_good' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_good +"</button>";
                            str +="<button name='com_bad' id='com_bad' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + list[i].mov_rev_com_bad +"</button>";  
                        }
                        commentUL.html(str);
         });
         
         
         
      }
      
     
      

   </script>

<%@include file="../includes/footer.jsp"%>>