<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>TPMR</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/main_carousel.css" rel="stylesheet">
<link href="resources/css/movie_style.css" rel="stylesheet">
<link href="resources/css/web.css" rel="stylesheet">
<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/footer.css" rel="stylesheet">
<style>
.row>* {
	padding-right: calc(var(- -bs-gutter-x)* 0.9) !important;
}

body {
	font-family: 'Pretendard-Regular';
}
</style>
</head>
<body>
  <!-- header -->
  <header class="css-6k8tqb">
    <nav>
      <div class="css-1gkas1x-Grid e1689zdh0">
        <div class="css-1djzg97">
          <ul class="css-6v7b8v-VisualUl">
            <li class="css-t686xv"><a href=""><img src="resources/imgs/img_logo.png" alt="LOGO 이미지"></a></li>
            <li class="css-1c3wwgb">
              <div class="css-1xm32e0">
                <div class="css-1okeg7p">
                  <form action="#"><label class="css-kyr608"><input type="text" autocomplete="off"
                        placeholder="영화를 검색해보세요." name="searchKeyword" value="" class="css-13i5xe6">
                      <div value="false" class="css-ikj5sk"><span aria-label="clear" role="button"
                          class="css-14vwb0g"></span></div>
                    </label></form>
                </div>
              </div>
            </li>
            <li class="css-bj71cw"><button class="css-fn0ezc-StylelessButton">로그인</button></li>
            <li class="css-bj71cw"><button class="css-139vxi-StylelessButton">회원가입</button></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <!-- header end -->
	<sec:authentication property="principal" var="principal" />

	<sec:authorize access="isAuthenticated()">
		<h1>
			아이디 :
			<c:out value="${principal.username}" />
			// pk넘버 :
			<c:out value="${principal.member.mem_num}" />
			// // 권한 :
			<c:out value="${principal.authorities}" />

		</h1>
		<a href="/customLogout"><button>Logout</button></a>
		<a href="/customModify/<c:out value="${principal.member.mem_num}"/>"><button>회원정보수정</button></a>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<a href="/customLogin"><button>Login</button></a>
	</sec:authorize>

	<!-- <h1>헤더임</h1> -->

	<hr />