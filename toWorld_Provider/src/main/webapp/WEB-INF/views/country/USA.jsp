<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>USA</title>
<script>
   function USA() {
      window.open (
         "/reviewUSA", "reviewUSA",
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
			<img src="/images/USA1.jpg">
		</div>
		
		<div class="text">
			미국 <br>
			반짝이는 뉴욕의 밤.<br>
		</div>
		
		<div class="text2" align="right">
			미국은 북아메리카 대륙과<br>
			태평양에 위치한 연방제 국가입니다.<br>
			정치, 경제, 군사 등의 하드파워는 물론 문화와 교육,<br>
			학술 연구를 포함한 소프트파워의 모든 분야에서<br>
			가장 막강한 영향력을 행사하는 국가이며<br>
			전 세계 유일의 초강대국으로 군림하고 있습니다.
			<br><br><br>
		</div>
		
		<div class="main">
			
			<div class="image_middle2">
				<img src="/images/USA3.jpg" width=600px>
			</div>
			<div class="image_middle">
				<img src="/images/USA2.jpg" width=600px> 
				<br><br><br><br>
				전 세계에서 가장 트렌디한 도시 '뉴욕'<br>
				태평양의 낙원 '하와이'<br>
				사막 위에 지어진 기적의 도시 '라스베이가스'<br>
				세계영화산업을 이끌고 있는 할리우드 '로스앤젤레스'<br>
				금융, 사업, IT, 첨단산업의 중심 '샌프란시스코'
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
      <button onclick="USA()">작성</button>
   </div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>