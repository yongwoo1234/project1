<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Portugal</title>
<script>
   function Portugal() {
      window.open (
         "/reviewPortugal", "reviewPortugal",
         "width=800, height=1000, top=20, left=350, location=no, menubar=0"
      )
   }
</script>
<style>
   .header{
     	position:fixed;
	    top:0;
	    left:0;
	    right:0;
	    z-index:10;
	    display:flax;
	    background:white;
	    height:60px;
	    justify-content:space-between;
	    align-items:center;
   }
   
   .section {
      color:black;
      font-family: 'Noto Sans KR', sans-serif;
   }

   .section .image_top {
      width: 100%;
   }
   
   .section .text {
      margin-left: 100px;
      font-size: 100px;
      font-family: 'Noto Sans KR', sans-serif;
   }
   
   .section .text2 {
      margin-right: 80px;
      font-size: 25px;
      font-family: 'Noto Sans KR', sans-serif;
   }
   
   .section .main {
      display: flex;
      justify-content: center;
      text-align: left;
      font-size: 20px;
      font-family: 'Noto Sans KR', sans-serif;
   }
   
   .section .image_middle {
      margin: 0 50px 0 20px;
   }
   
   .section .image_middle2 {
      margin-left: 140px;
   }
   
   .section .image_middle, .image_middle2 {
   		margin-bottom: 80px;
   }
   
   .reviewList table {
   		margin: 0 auto;
   		text-align: center;
   }
   
   .reviewList table th {
   		background-color: #F3F2D4;
   }
   
   .review2 {
   		margin-top: 40px;
   }
   
   .review2 button {
   		border: 1px solid black; 
   		border-radius: 5px;
   		background-color: rgba(0,0,0,0); 
   		color: black; 
   		padding: 5px;
   		cursor: pointer;
   }
   
   .review2 button:hover { 
   		color:white; 
   		background-color: black; 
   	}
   
   .footer{
      height: 10%;
   }
   
   #paging{
    font-size: 22pt;
}




</style>

</head>
<body>
	<div class="header">
			<jsp:include page="header.jsp"></jsp:include>
	</div>
	
	<div class="section">
		<div class="image_top" align="center">
			<img src="/images/portugal2.jpg">
		</div>
		
		<div class="text">
			포르투갈 <br>
			해양 왕국의 나라. <br>
		</div>
		
		<div class="text2" align="right">
			포르투갈은 남유럽 이베리아 반도 서쪽 끝에 위치한 국가이며<br> 
			수도는 리스본이고 한국으로부터 가장 이동거리가 긴 유럽 국가입니다.<br>
			'포르투는 일하고, 코임브라는 공부하고,<br>
			브라가는 기도하고, 리스본에서 즐긴다'<br>
			도시마다 다른 분위기를 느낄 수 있습니다.
			
			 <br><br><br>
		</div>
		
		<div class="main">
			
			<div class="image_middle2">
				<img src="/images/portugal3.jpg" width=600px>
			</div>
			<div class="image_middle">
				<img src="/images/portugal4.jpg" width=600px> 
				<br><br><br><br>
				바스코 다 가마의 위대한 발견을 기념하며 테주 강변에 '세워진 벨렘'<br>
				리스본 시내가 한눈에 내려다보이는 '그라사 전망대'<br>
				국토를 회복한 이후 지어진 로마네스크 양식의 '리스본 대성당'<br>
				자유 광장을 뜻하며 포르투의 중심인 '리베다데 광장'<br>
				세계적으로 유명한 포트 와인의 도시이자,<br>
				도우루강 하구 언덕에 펼쳐진 아름다운 도시 '포르투'
			</div>
			
		</div>
		
	</div>
	
	<div class="reviewList">
    <table width="70%" cellpadding="10px">
    <tr>
	    <th width=50%>제목</th>
	    <th width=15%>아이디</th>
	    <th width=25%>날짜</th>
	    <th width=10%>조회수</th>
    </tr>
    <c:forEach var="imsi" items="${reviewCountry}">
    <tr>
    	<td><a href="/reviewCountryDetail?fileName=${imsi.fileName}&serial=${imsi.serial}">${imsi.title}</a></td>
    	<td>${imsi.id}</td>
    	<td>${imsi.datetime}</td>
    	<td>${imsi.viewcnt}</td>
    	
    </tr>
    </c:forEach> 
	</table>
	</div>
	
   <div class="review2" align="center">
      <button onclick="Portugal()">작성</button>
   </div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>