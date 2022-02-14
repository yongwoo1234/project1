<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<style>

	.header{
      	margin-top: 5px;
        margin-bottom: 20px;
        margin-left: 100px;
        margin-right: 60px;
        height: 10%;
   }
   
   .header img {
         display:block;
         margin:0 auto; 
         width:200px; 
         height:60px;
   }

	.update .textarea, .text {
		background-color: #eeeeee;
		color: #666666;
		padding: 1em;
		border-radius: 10px;
		border: 2px solid transparent;
		outline: none;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		transition: all 0.2s;
		
	}
	
	.update .textarea:hover, .text:hover {
		cursor: text;
		background-color: #eeeeee;
		
	}
	
	.update .textarea:focus,.text:focus {
		cursor: text;
		color: #333333;
		background-color: white;
		border-color: #333333;
	}

	.update {
		
	}
	
	.update button {
		border: 1px solid black; 
   		border-radius: 5px;
   		background-color: rgba(0,0,0,0); 
   		color: black; 
   		padding: 5px;
   		cursor: pointer;
	}
	
	.update button:hover { 
   		color:white; 
   		background-color: black; 
   	}
</style>
</head>
<body>

	<div class="header">
	  <a href="/home">
      <img src="/images/logo3.jpg">
      </a>
    </div>
   
	<form action="/updateReview" method="post">
	<div class="update" align="center">
		<input type="text" class="text" name="title" value="${title}"> 
		<br><br>
		<textarea class="textarea" name="contents" rows="25" cols="80">${contents}</textarea>
		<br><br>
		<input type="hidden" name="fileName" value="${fileName}">
		<input type="hidden" name="country" value="${country}">
		<button type="submit">수정</button>
		<a href="/toCountry?country=${country}"><button>취소</button></a>
		
	</div>
	</form>
</body>
</html>