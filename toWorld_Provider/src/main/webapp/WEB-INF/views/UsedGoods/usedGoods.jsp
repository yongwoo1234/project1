<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행장터</title>


<link rel="stylesheet" href="${contextPath}css/header_footer_body.css">

<style>

   .section{
      
      align-items:center;
      margin-top: 10px;
      margin-bottom: 10px;
      margin-left: 50px;
      margin-right: 50px;
      height: 80%;
   }


</style>


</head>
<body>

<div class="header">
		<jsp:include page="../header.jsp"></jsp:include>
</div>

<div class="section">		
		<jsp:include page="usedGoods_section_list.jsp"></jsp:include>
</div>

<div class="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
</div>

</body>
</html>