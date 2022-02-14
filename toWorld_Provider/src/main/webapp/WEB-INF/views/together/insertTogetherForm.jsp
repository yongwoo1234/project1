<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 작성</title>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link rel="stylesheet" href="${contextPath}css/header_footer_body.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style type="text/css">

*{
	font-family: 'Noto Sans KR', sans-serif;
}



tbody th {

	width:20%;
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
		

<form action="/insertTogether" method="post" enctype="multipart/form-data">
	<table class ="table table-bordered" align="center">
	<br>
    	<thead>
        	<h1>게시물작성하기</h1>
        </thead>
        <br>
        <tbody>
            <tr>
            	<th>제목</th>
                <td><input type ="text" name = "title" class="form-control" placeholder = "제목을 입력하세요" required></td>
            </tr>
            <tr>    
                <th>작성자</th>
                <td>${sid}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="context" cols="10" class="form-control" placeholder="내용을 입력하세요" required></textarea></td>
            </tr>
            <tr>
            	<td colspan=2><input type="file" name="uploadReplyImg" multiple="multiple"></td>
            </tr>
        </tbody>
     </table>  
     
           <%-- <input type="hidden" name="id" value="${id}"> --%>
           <input type = "submit" class="btn btn-outline-primary" value = "저장하기">
 </form>


<div class="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

</body>
</html>