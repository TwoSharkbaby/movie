<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
<img src="https://mblogthumb-phinf.pstatic.net/MjAyMDAzMTdfMjEy/MDAxNTg0Mzc1NDAwMTc3.RRmhLLq_rdphZEQzrkRP0C7boCOld9pKp4kpfnLWXTMg.B0U-AncKybqb6V7gPCLrVbVpeQCVuOlwPNtWTfAxLpwg.PNG.onsot/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2020-03-16_%EC%98%A4%ED%9B%84_11.41.15.png?type=w800">
<h1><c:out value="${ msg }"/></h1>
<h1>잘못된 요청</h1>
</body>
</html>