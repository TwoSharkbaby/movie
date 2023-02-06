<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<main>
   <div class="main_frame">
      <div class="frame1">
         <div class="frame2">
            <div class="section_frame1">
               <div class="section_frame2">
                  <div class="section_frame3-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock">
                     <section class="w_exposed_cell section_main" data-rowindex="5">
                        <div class="section_frame4-Grid">
                           <div class="section_frame5-Row">
                              <header class="section_title">
                                 <h2 class="main_title">기본 정보
                                 <sec:authorize access="hasRole('ROLE_ADMIN')">
                                 &nbsp; &nbsp; ( &nbsp; 작성자 &nbsp; : &nbsp; <c:out value="${movie.mem_nickname}" /> &nbsp; )
                                    <a href="/movie/modify/<c:out value="${movie.mov_num}" />"><button class="btn btn-danger ms-2">수정하기</button></a>
                                    <form action="/movie/delete" method="post" style="float:right;">
                                       <input type="hidden" name="mov_num"
                                          value="<c:out value="${movie.mov_num}"/>"> <input
                                          type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                       <button class="btn btn-danger ms-2" type="submit">삭제하기</button>
                                    </form>
                                 </sec:authorize>
                                 </h2>
                                 <div class="more_view1">
                                    <div class="more_view2"></div>
                                 </div>
                                 <div>
                                 
                                 </div>
                              </header>
                           </div>
                        </div>
                        <div class="section_frame4-Grid">
                           <div class="section_frame5-Row">
                              <article class="mov_info_frame-Overview">
                                 <div class="container">
                                    <div class="row">
                                       <div class="col-3">
                                          <div class=" mov_info_thum-StyledLazyLoadingImage">
                                             <img alt="포스터 이미지" src='/imgs/<c:out value="${movie.mov_thumb}" />'
                                             class="mov_info_img-StyledImg">
                                          </div>
                                       </div>
                                       <div class="col">
                                          <div class="mov_info_part1-Summary">
                                             제목 :
                                             <c:out value="${movie.mov_title}" />
                                             <br> <span class="mov_info_part2-OverviewMeta">개봉일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
                                             </span><br> <span class="mov_info_part2-OverviewMeta">장르 : <c:out value="${movie.mov_genre}" /></span><br> <span
                                                class="mov_info_part2-OverviewMeta">상영시간 : <fmt:formatDate pattern="HH:mm:ss" value="${movie.mov_runtime}" /></span>
                                          </div>
                                          <div class="mov_info_part3-StyledSelf">
                                             <div class="mov_info_part4-StyledText">
                                                <c:out value="${movie.mov_synopsis}" />
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </article>
                              <hr class="section_hr">
                           </div>
                        </div>
                     </section>
                     <section class="w_exposed_cell section_main" data-rowindex="5">
                        <div class="section_frame4-Grid">
                           <div class="section_frame5-Row">
                              <header class="section_title">
                                 <h2 class="main_title">리뷰/코멘트</h2>
                                 <div class="write_review1">
                                    <a href="/review/insert/<c:out value="${movie.mov_num}" />"><button class="btn btn-primary" type="submit">리뷰등록하기</button></a>
                                 </div>
                              </header>
                           </div>
                        </div>
                        <div class="section_frame4-Grid">
                           <div class="section_frame5-Row">
                              <div class="section_main1">
                                 <div class="section_main2">
                                    <div class="section_main3">
                                       <div class="section_frame4-Grid">
                                          <c:choose>
                                             <c:when test="${empty review}">
                                                <tr>
                                                   <td colspan="5">[없음]
                                                </tr>
                                             </c:when>
                                             <c:when test="${!empty review}">
                                                <div class="section_frame5-Row">
                                                   <ul class="ew8mnl61 ul_frame-VisualUl-CommentHorizontalUl">
                                                      <c:forEach items="${review}" var="review">
                                                         <li class="li_frame1">
                                                            <div class="li_frame2">
                                                               <div class="mov_rev_mem_frame1">
                                                                  <div class="mov_rev_mem_frame2">
                                                                     <div class="mov_rev_frame1-StylelessLocalLink">
                                                                        <div class="mov_rev_mem">
                                                                           <c:out value="${review.mem_nickname}" />
                                                                        </div>
                                                                     </div>
                                                                  </div>
                                                                  <div class="rev_star">
                                                                     <img src="/resources/icon_imgs/star_icon.svg" width="16px" height="16px" alt="star"><span><c:out
                                                                           value="${review.mov_sco_point}" /></span>
                                                                  </div>
                                                               </div>
                                                               <div class="mov_rev_con_frame1">
                                                                  <div class="mov_rev_frame1-StylelessLocalLink">
                                                                     <div class=" mov_rev_con1-StyledSelf">
                                                                        <div class="mov_rev_con2-StyledText">
                                                                           <c:out value="${review.mov_rev_content}" />
                                                                        </div>
                                                                     </div>
                                                                  </div>
                                                               </div>
                                                               <div class="mov_rev_icon">
                                                               
                                                                  <button id="review_good" name="review_good"
                                                                     data-idx="<c:out value="${review.mov_rev_num}" />">
                                                                     <c:out value="${review.mov_rev_good}" />
                                                                  </button>
                                                                  <button id="review_bad" name="review_bad"
                                                                     data-idx="<c:out value="${review.mov_rev_num}" />">
                                                                     <c:out value="${review.mov_rev_bad}" />
                                                                  </button>
                                                               
                                                                  <span src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_good"></span>
                                                                   <em><c:out value="${review.mov_rev_good}" /></em> 
                                                                  <span src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_bad"></span>
                                                                  <em><c:out value="${review.mov_rev_bad}" /></em> 
                                                                  <span src="/resources/icon_imgs/reply_icon.svg" width="18px" height="18px" class="icon_comment"></span> <em>댓글보기</em>
                                                               </div>
                                                               <div>
                                                                  <p hidden id="comment" name="comment"
                                                                     data-idx="<c:out value="${review.mov_rev_num}" />"><c:out
                                                                        value="${review.mov_rev_num}" /></p>
                                                                  <button class="commentAdd" id="commentAdd" name="comment"
                                                                        data-idx="<c:out value="${review.mov_rev_num}" />">
                                                                        <c:out value="댓글작성" /></button>
                                                               </div>
                                                            </div>
                                                         </li>
                                                         <li>
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
                                                            </ul>
                                                         </li>
                                                      </c:forEach>
                                                   </ul>
                                                </div>
                                             </c:when>
                                          </c:choose>
                                       </div>
                                       <div class="more_view1">
                                          <div class="more_view2">
                                             <a href="/ko-KR/contents/mOk7BJO/overview">더보기</a>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <hr class="section_hr">
                           </div>
                        </div>
                     </section>
                     <section class="w_exposed_cell section_main" data-rowindex="7" id="content_credits">
                        <div class="section_frame4-Grid">
                           <div class="section_frame5-Row">
                              <header class="section_title">
                                 <h2 class="main_title">출연 배우
                                 <sec:authorize access="hasRole('ROLE_ADMIN')">
                                       <a href="/actor/insert/<c:out value="${movie.mov_num}" />">
                                          <button type="submit" class="btn btn-danger ms-3">배우등록하기</button>
                                       </a>
                                 </sec:authorize>
                                 </h2>
                              </header>
                           </div>
                        </div>
                        <div class="section_main1">
                           <div id="ActCarousel" class="carousel slide" data-bs-ride="carousel">
                              <div class="mov_act_frame1">
                                 <div class="section_main3">
                                    <div class="section_frame4-Grid">
                                       <div class="mov_act_frame2-PeopleUlRow">
                                          <div class="carousel-inner1">
                                             <div class="carousel-item1 active">
                                                <c:choose>
                                                   <c:when test="${empty actor}">
                                                      <tr>
                                                         <td colspan="5">[없음]
                                                      </tr>
                                                   </c:when>
                                                   <c:when test="${!empty actor}">
                                                      <ul class="e5xrf7a0 mov_act_ul_frame-VisualUl-PeopleStackableUl">
                                                         <c:forEach items="${actor}" var="actor" begin="0" end="5">
                                                            <li class="mov_act_li_frame1"><a title="<c:out value="${actor.act_num}" />"
                                                               class="mov_act_li_frame2-InnerPartOfListWithImage">
                                                                  <div class="mov_act_thum_frame1">
                                                                     <div class="profilePhotoBlock mov_act_thum_frame2">
                                                                        <div class="css-ProfilePhotoImage">
                                                                           <img src='/imgs/<c:out value="${actor.act_thumb}" />'>
                                                                           
                                                                        </div>
                                                                     </div>
                                                                     
                                                                  </div>
                                                                  <div class="mov_act_info_frame1">
                                                                     <div class="mov_act_info_frame2">
                                                                        <div class="mov_act_name">
                                                                           <c:out value="${actor.act_name}" />
                                                                        </div>
                                                                        <div class="mov_act-StyledSubtitle">배우</div>
                                                                     </div>
                                                                     <div>
                                                                        <button name="actor_modal" class="btn btn-primary" data-idx="<c:out value="${actor.act_num}" />">상세보기</button>
                                                                     </div>
                                                                  </div>
                                                            </a></li>
                                                         </c:forEach>
                                                      </ul>
                                                   </c:when>
                                                </c:choose>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="section_frame4-Grid e1689zdh0">
                           <div class="section_frame5-Row emmoxnt0">
                              <hr class="section_hr">
                           </div>
                        </div>
                        <div class="modal">
                           <div  class="modal-dialog modal_main_frame2">
                                       <div class="modal-content modal_frame1-modalAddStyle">
                                 <header class="modal_header_frame-HeaderBarPrimitive-headerAddStyle">
                                    <div class="modal_header_frame2">
                                       <h5 id="modal-title">배우 상세페이지</h5>
                                    </div>
                                    <div class="modal_header_frame2">
                                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                 </header>
                                 <div class="modal_body_frame-Row">
                                    <div class="css-ProfilePhotoImage">
                                       <div id="modal-body-act_img" />
                                    </div>
                                    <ul class="modal_body_ul_frame-VisualUl-DescriptionUl">
                                       <dl class="modal_body_dl_frame-DescriptionList">
                                          <dt class="modal_body_dt_frame1-DescriptionTitle">성별</dt>
                                          <dd class="modal_body_dt_frame2-DescriptionDetail" id="modal-body-act_sex"></dd>
                                       </dl>
                                       <dl class="modal_body_dl_frame-DescriptionList">
                                          <dt class="modal_body_dt_frame1-DescriptionTitle">생년월일</dt>
                                          <dd class="modal_body_dt_frame2-DescriptionDetail" id="modal-body-act_birth">modal-body-act_birth</dd>
                                       </dl>
                                       <sec:authorize access="hasRole('ROLE_ADMIN')">
                                          <dl class="modal_body_dl_frame-DescriptionList">
                                             <dt class="modal_body_dt_frame1-DescriptionTitle">닉네임</dt>
                                             <dd class="modal_body_dt_frame2-DescriptionDetail" id="modal-body-mem_nickname"></dd>
                                          </dl>
                                       </sec:authorize>
                                       <dl class="modal_body_dl_frame2-DescriptionList">
                                          <dt class="modal_body_dt_frame1-DescriptionTitle">정보</dt>
                                          <dd class="modal_body_dd_frame1-SummaryDetail" id="modal-body-act_info"></dd>
                                       </dl>
                                    </ul>
                                    <br>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </section>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</main>

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
               <label>닉네임</label> <input class="form-control" name='mem_nickname'
                  value='mem_nickname' readonly="readonly">
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

   $("button[name='actor_modal']").on("click", function(e){

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
      $("#modal-title").html(response.act_name + " 상세내용");
      $("#modal-body-act_name").html(displayTime(response.act_name));
      $("#modal-body-act_birth").html(displayTime(response.act_birth));
      $("#modal-body-act_sex").html(response.act_sex);
      $("#modal-body-act_info").html(response.act_info);
      <sec:authorize access="hasRole('ROLE_ADMIN')">   
      $("#modal-body-mem_nickname").html(response.mem_nickname);
      </sec:authorize>   
      $("#modal-body-act_img").html("<td><img src='/resources/act_imgs/" + response.act_thumb + "'></td>");
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
   
   // 댓글 좋아요 
    $("tbody").on("click", "button[name='com_good']", function(e) {
        
         var mov_rev_com_num = $(this).data("mov_rev_com_num");
          var good = $(this);
          var bad = $(this).next('button');
      
         
       <sec:authorize access="isAuthenticated()">
     var mem_num = "<c:out value="${principal.member.mem_num}"/>";
     </sec:authorize>
          var data = {
            mov_rev_com_num : mov_rev_com_num,
             mem_num : mem_num
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
      
  
  // 댓글 싫어요
      $("tbody").on("click", "button[name='com_bad']", function(e) {  
           var mov_rev_com_num = $(this).data("mov_rev_com_num");
           var good = $(this).prev('button');
           var bad = $(this);
        <sec:authorize access="isAuthenticated()">
     var mem_num = "<c:out value="${principal.member.mem_num}"/>";
     </sec:authorize>
          
           var data = {
             mov_rev_com_num : mov_rev_com_num,
              mem_num : mem_num
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

<script type="text/javascript" src="/resources/js/movieReviewComment.js"></script>
<script type="text/javascript">
// 리뷰 마다 댓글 표시
      $("td[id='comment']").each(function (index){
         var idx = $(this).data('idx');
         var data1 = {
                mov_rev_num: idx};    
         var commentUL = $("#chat" + idx);
           showList(1);
           
           // 댓글 목록
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
                             str +="<button name='com_modify' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + "수정/삭제버튼" + "</button>";
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
         
var modal = $("#commentModal");
var modalInputContent = modal.find("input[name='mov_rev_com_content']");
var modalInputMemNum = modal.find("input[name='mem_num']");
var modalInputMovRevComRegdate = modal.find("input[name='mov_rev_com_regdate']");
var modalInputMemNickname = modal.find("input[name='mem_nickname']");             
var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");
var modalCloseBtn = $("#modalCloseBtn");
   
   
      //리뷰 마다 댓글 표시
           $("#chat"+ idx).on("click", "button[name= 'com_modify']", function(e){
             
              var mov_rev_com_num = $(this).data("mov_rev_com_num");
        
              
              // 댓글 조회
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
 
 
 // 댓글 목록
    function showRevList(mov_rev_num) {
   
        var commentUL = $("#chat" + mov_rev_num); 
        var params = {mov_rev_num:mov_rev_num, page : 1};
        movieReviewCommentService.getList(params, function(list) {
                       var str = "";
              
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
                                   str +="<button name='com_modify' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + "수정/삭제버튼" + "</button>";
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
    
 // 댓글 삭제 이벤트
    modalRemoveBtn.on("click", function(e){
        var mov_rev_com_num = modal.data("mov_rev_com_num");
      
        var mov_rev_num = $("#commentModal").data("rev_num");
        var mem_num = null;
            
        <sec:authorize access="isAuthenticated()">
        mem_num = "<c:out value="${principal.member.mem_num}"/>";
        </sec:authorize>        
        var originalMemNum = modalInputMemNum.val();
           
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
                    
         movieReviewCommentService.remove(mov_rev_com_num, originalMemNum , function(result){
              alert(result);
            modal.modal("hide");
            showRevList(mov_rev_num);
         });
     });
 
 // 댓글 수정 이벤트
    modalModBtn.on("click", function(e){
     var mov_rev_num = $("#commentModal").data("rev_num");    
     var originalMemNum = modalInputMemNum.val();    
     var mov_rev_com_num = modal.data("mov_rev_com_num");         
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
      
      // 댓글 등록 이벤트
      $("button[name='comment']").on("click", function(e) {    
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
         var mov_rev_num = $("#commentModal").data("rev_num");                
         var comment = {
            mov_rev_com_content : modalInputContent.val(),
            mem_num : modalInputMemNum.val(),
            mov_rev_num: mov_rev_num,
            mem_nickname : mem_nickname
         };         
         movieReviewCommentService.add(comment, function(result){          
            if(result == "success")
               alert(result);
               showRevList(mov_rev_num);
            $("#commentModal").modal("hide");
         });
              
      });
      
      modalCloseBtn.on("click", function(e){ 
         $("#commentModal").modal("hide");
              
      });
      
      
      function showRevList(mov_rev_num) {
         var commentUL = $("#chat" + mov_rev_num); 
         var params = {mov_rev_num:mov_rev_num, page : 1};
         movieReviewCommentService.getList(params, function(list) {
                        var str = "";
                
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
                                    str +="<button name='com_modify' data-mov_rev_com_num='"+list[i].mov_rev_com_num+"'>" + "수정/삭제버튼" + "</button>";
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