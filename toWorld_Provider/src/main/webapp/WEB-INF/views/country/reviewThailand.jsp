<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<title>Review</title>
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

	.reviewTop .textarea, .text {
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
	
	.reviewTop .textarea:hover, .text:hover {
		cursor: text;
		background-color: #eeeeee;
		
	}
	
	.reviewTop .textarea:focus,.text:focus {
		cursor: text;
		color: #333333;
		background-color: white;
		border-color: #333333;
	}

	.reviewTop button {
		border: 1px solid black; 
   		border-radius: 5px;
   		background-color: rgba(0,0,0,0); 
   		color: black; 
   		padding: 5px;
   		cursor: pointer;
   }
   
   .reviewTop button:hover { 
   		color:white; 
   		background-color: black; 
	}
	
</style>
</head>
<body>

	<div class="header">
	      <img src="/images/logo3.jpg">
   </div>
   
   <form action="/sendThailandReview" method="post" enctype="multipart/form-data">
   <div class="reviewTop" align="center">
      <input type="text" class="text" name="title" placeholder="제목" required> <br><br>
      <textarea class="textarea" name="contents" rows="25" cols="80" required></textarea> <br><br>
      <input type="file" name="uploadfile" multiple="multiple" required>
      <button type="submit">등록</button>
   </div>
   </form>
</body>
</html>