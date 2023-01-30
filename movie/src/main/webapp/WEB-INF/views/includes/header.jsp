<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>

<script src="/resources/jquery-3.6.3.min.js"></script>
<script src="/resources/bootstrap.bundle.min.js"></script>
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/dist/css/main_css/carousel.css" rel="stylesheet">
<link href="/resources/assets/dist/css/main_css/style.css" rel="stylesheet">
<link href="/resources/assets/dist/css/main_css/web.css" rel="stylesheet">
<link href="/resources/assets/dist/css/main_css/header.css" rel="stylesheet">
<link href="/resources/assets/dist/css/main_css/footer.css" rel="stylesheet">
<link href="/resources/dist/css/headers.css" rel="stylesheet" type="text/css">

</head>
<body>

 <!-- header -->
  <header class="css-6k8tqb">
    <nav>
        <div class="css-1gkas1x-Grid e1689zdh0">
            <div class="css-1djzg97">
                <ul class="css-6v7b8v-VisualUl">
                    <li class="css-t686xv"><a href="/"><img src="/resources/img/img_logo.png" alt="LOGO 이미지"></a></li>
                    <!-- <li class="categories css-bj71cw"><button class="css-x6oby2-StylelessButton">Home</button></li>
                    <li class="categories css-bj71cw"><button class="css-x6oby2-StylelessButton">Movies</button></li>
                    <li class="categories css-bj71cw"><button class="css-x6oby2-StylelessButton">Community</button></li>
                    <li class="categories css-bj71cw"><button class="css-x6oby2-StylelessButton">MyList</button></li>
                    <li class="categories css-bj71cw"><button class="css-x6oby2-StylelessButton">WatchedList</button></li> -->
                    
<!--                     <li class="css-1c3wwgb">
                        <div class="css-1xm32e0">
                            <div class="css-1okeg7p">
                                <form action="#"><label class="css-kyr608"><input type="text" autocomplete="off" placeholder="영화를 검색해보세요." name="searchKeyword" value="" class="css-13i5xe6">
                                    <div value="false" class="css-ikj5sk"><span aria-label="clear" role="button" class="css-14vwb0g"></span></div>
                                </label></form>
                            </div>
                        </div>
                    </li> -->
                    <li style="width:50em">
                    </li>
                    <li>
                    	<form id="searchForm" action="/movie/search" method="get" class="d-flex mt-2" role="search">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null ?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/>>제목</option>
								<option value="G" <c:out value="${pageMaker.cri.type eq 'G' ?'selected':''}"/>>장르</option>
								<option value="D" <c:out value="${pageMaker.cri.type eq 'D' ?'selected':''}"/>>감독</option>
								<option value="A" <c:out value="${pageMaker.cri.type eq 'A' ?'selected':''}"/>>배우</option>
								<option value="TD" <c:out value="${pageMaker.cri.type eq 'TD' ?'selected':''}"/>>제목 OR 감독</option>
								<option value="GD" <c:out value="${pageMaker.cri.type eq 'GD' ?'selected':''}"/>>장르 OR 감독</option>
							</select>
							<input class="form-control ms-2" type="search" placeholder="검색" aria-label="Search" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>" style="width:10em">
				        <button class="btn btn-outline-success" type="submit" hidden>Search</button>
				        <input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum == null ?'1':pageMaker.cri.pageNum}" />" /> 
						<input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount == null ?'12':pageMaker.cri.amount}" />" />
				      </form>
                    </li>

					<sec:authentication property="principal" var="principal" />
					<sec:authorize access="isAnonymous()">
                    <li class="css-bj71cw"><a href="/customLogin"><button class="css-139vxi-StylelessButton">로그인</button></a></li>
                    <li class="css-bj71cw"><a href="/customSingup"><button class="css-139vxi-StylelessButton">회원가입</button></a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                    <li class="css-bj71cw"><a href="/customLogout"><button class="css-139vxi-StylelessButton">로그아웃</button></a></li>
                    <li class="css-bj71cw"><a href="/customModify/<c:out value="${principal.member.mem_num}"/>"><button class="css-139vxi-StylelessButton">회원정보수정</button></a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>
  </header>
  
<script type="text/javascript">
$(document).ready(function() {
	  
	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		} else {
			alert(result);
		}

	}
		
	var searchForm = $('#searchForm');
	
	$('#searchForm button').on("click", function(e) {
		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요.");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}
		e.preventDefault();
		searchForm.submit();
	});

});
</script>
  <!-- header end -->
