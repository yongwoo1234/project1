<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>

<link rel="stylesheet" href="${contextPath}css/header_footer_body.css">
<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style>

*{
	font-family: 'Noto Sans KR', sans-serif;
}

.test{
   
   margin: 0 auto;
   width:80%;
   
   }
</style>

</head>
<body>




<%
	String id = (String)session.getAttribute("sid");
%>

<div class="header">
		<jsp:include page="../header.jsp"></jsp:include>
</div>
		
<div class="test">
<form action="/usedGoods/updateUsedGoodsForm" method="post">

	<table class ="table table-bordered" align="center">
		<br>
    	<thead>
        	<h1 style="font-weight:bold">게시물 수정하기</h1>
        </thead>
        <br>
        <tbody>
            <tr>
            	<th>제목</th>
                <td><input type ="text" name="title" class="form-control" value="${title}" required></td>
            </tr>
          
             <tr>
            	<th>가격 (원)</th>
                <td><input type ="text" name="price" class="form-control" value="${price}" required></td>
            </tr>
            
            <tr>
                <th>내용</th>
                <td><textarea name="context" cols="10" class="form-control" required>${context}</textarea></td>
            </tr>
            
        </tbody>
     </table>  
     
      <input type="hidden" name="serial" value="${serial}">
      <input type="hidden" name="id" value="${id}">
      <input type = "submit" class="btn btn-outline-primary" style="font-weight:bold" value = "수정하기">
 </form>
</div>



<div class="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

</body>
</html>

