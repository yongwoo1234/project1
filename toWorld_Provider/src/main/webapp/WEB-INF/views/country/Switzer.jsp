<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Switzerland</title>
<script>
   function Switzer() {
      window.open (
         "/reviewSwitzer", "reviewSwitzer",
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
			<img src="/images/Switzerland.jpg">
		</div>
		
		<div class="text">
			스위스 <br>
			신이 빚어낸<br> 
			알프스의 보석. <br>
		</div>
		
		<div class="text2" align="right">
			스위스는 중부 유럽에 위치한 연방제 공화국입니다.<br>
			오스트리아에 비해 영세중립국으로 유명합니다.<br>
			헌법상의 수도는 따로 없지만<br> 
			연방의회와 국제기구가 많이 위치한 베른이<br> 
			사실상 수도의 역할을 하고 있습니다. <br><br><br>
		</div>
		
		<div class="main">
			
			<div class="image_middle2">
				<img src="/images/montreux.jpg" width=600px>
			</div>
			<div class="image_middle">
				<img src="/images/zurich.jpg" width=600px> 
				<br><br><br><br>
				스위스 최대의 도시이자 경제문화의 중심인 '취리히'<br>
				스위스의 수도이자 구시가지 '전체가'<br> 
				유네스코 세계문화유산에 등재된 '베른'<br>
				하얀 눈으로 덮인 그림 같은 산맥 '융프라우'<br>
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
      <button onclick="Switzer()">작성</button>
   </div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>