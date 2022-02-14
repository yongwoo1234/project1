<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Hongkong</title>
<script>
   function Hongkong() {
      window.open (
         "/reviewHongkong", "reviewHongkong",
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
			<img src="/images/hongkong4.jpg">
		</div>
		
		<div class="text">
			홍콩<br>
			동양과 서양이 공존하는<br>
			역동적인 매력.
		</div>
		
		<div class="text2" align="right">
		홍콩은 동아시아의 도시이자<br>
		중화인민공화국에 속한 특별행정구입니다.<br> 
		1842년 8월 29일 난징 조약으로 영국의 식민지가 되었으나<br> 
		중영공동선언을 거쳐 일국양제 시행에 합의 후<br>
		1997년 7월 1일에 중국에 특별행정구로 편입되었습니다.
		<br><br><br>
		</div>
		
		<div class="main">
			
			<div class="image_middle2">
				<img src="/images/hongkong2.jpg" width=600px>
			</div>
			<div class="image_middle">
				<img src="/images/hongkong3.jpg" width=600px> 
				<br><br><br><br>
				일곱개의 테마구역과 다양한 볼거리가 있는 '디즈니랜드'<br>
				구룡반도의 척추이자 최고의 쇼핑 대로 '네이선 거리'<br>
				홍콩시장의 매력을 느낄 수 있는 템플 '스트리트 야시장'<br>
				구룡반도의 허파 역할을 하는 전통 중국식  '카우룽 정원'<br>
				여러 영화 촬영지로 유명한 '미드레벨 에스컬레이터'
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
      <button onclick="Hongkong()">작성</button>
   </div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>