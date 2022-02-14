<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${contextPath}/css/default.css">
<style>

table{
		margin:auto;
		margin-top:70px;
		text-align: center;

	}
	
.loginform {
	margin-top: 7%;
}

.loginform img {
	margin-bottom: 40px;
}

.loginform #login {
		background: #FFF0CB;
		border-radius: 11px;
		cursor: pointer;
		width: 10%;
		height: 30px;
}

.loginform #join{
		background: #FFF0CB;
		border-radius: 11px;
		cursor: pointer;
		width: 10%;
		height: 30px;
}

.loginform #id, #pw {
	width: 20%;
	margin-bottom: 20px;
}

	
</style>


</head>
<body>

<%-- <div class="header">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div> --%>


<form action="/login-Process" method="post">
<div class="loginform" align="center">
<img src="/images/loginlogo.png"> <br>
 <input type="text" id="id" name="username" placeholder="아이디를 입력하세요"> <br>
 <input type="password" id="pw" name="password" placeholder="비밀번호를 입력하세요">
<br><br>
<input type="submit" id="login" value="로그인">
<input type="button" id="join" onclick="location.href='/join';" value="회원가입">
</div>
</form>

</body>
</html>