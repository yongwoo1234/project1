<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Korea</title>
<script>
   function Korea() {
      window.open (
         "/reviewKorea", "reviewKorea",
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
			<img src="/images/korea1.jpg">
		</div>
		
		<div class="text">
			대한민국<br>
			배달의 민족.
			<br>
			
		</div>
		
		<div class="text2" align="right">
			대한민국은 동아시아의 한반도에 위치한 민주공화국입니다.<br>
			광복 이후 남북 대립으로 인해 둘로 나뉜<br> 
			한반도의 남부에서 대한민국 임시정부의 법통을 계승하고<br>
			자본주의와 자유민주주의를 기반으로 하는 대한민국 정부가 수립되었습니다.
			<br><br><br>
		</div>
		
		<div class="main">
			
			<div class="image_middle2">
				<img src="/images/korea2.jpg" width=600px>
			</div>
			<div class="image_middle">
				<img src="/images/korea3.jpg" width=600px> 
				<br><br><br><br>
				
				
				
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
      <button onclick="Korea()">작성</button>
   </div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>