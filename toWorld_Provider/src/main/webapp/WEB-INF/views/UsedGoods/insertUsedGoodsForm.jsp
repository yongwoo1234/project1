<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매해요</title>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link rel="stylesheet" href="${contextPath}css/header_footer_body.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
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


<form action="/usedGoods/insert" method="post" enctype="multipart/form-data">
	<table class ="table table-bordered" align="center">
    	<thead>
        	<h1>게시물작성하기</h1>
        </thead>
        
        <tbody>
            <tr>
            	<th>제목</th>
                <td><input type ="text" name = "title" class="form-control" placeholder = "제목을 입력하세요" required></td>
            </tr>
            <tr>    
                <th>작성자 </th>
                <td>${sid}</td>
            </tr>        
            <tr>
            	<th>상품명</th>
                <td><input type ="text" name = "goodsName" class="form-control" placeholder = "상품명을 입력하세요" required></td>        
            </tr>          
            <tr>
            	<th>가격 (원)</th>
            	<td><input type ="text" name = "price" class="form-control" placeholder = "가격을 입력하세요" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="context" cols="10" class="form-control" placeholder="내용을 입력하세요" required></textarea></td>
            </tr>
            <tr>
            	<td><input type="file" name="uploadReplyImg" multiple="multiple" required></td>
            </tr>
        </tbody>
     </table>  
     
           <input type = "submit" class="btn btn-outline-primary" value = "저장하기">
 </form>




<div class="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

</body>
</html>