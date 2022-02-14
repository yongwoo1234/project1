<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.sboot.toworld.vo.ReviewVO"%>
<%@page import="com.sboot.toworld.dao.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>France</title>
<%
	String sesid = (String)session.getAttribute("sid");
%>
<script>
   function France() {
      window.open (
         "/reviewFrance", "reviewFrance",
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
         <img src="/images/eiffel-tower.jpg">
      </div>
      
      <div class="text">
         프랑스<br>
         파리의 빛나는 밤.<br>
      </div>
      
      <div class="text2" align="right">
         프랑스는 유럽은 물론 세계의 문화, 예술의 중심지로서<br>
         오랜 역사를 자랑해온, 세계 제1의 관광국입니다.<br> 
         프랑스의 수도 파리는 패션과 미식, <br>
         예술과 낭만이 있는 세계문화의 중심지입니다.<br>
          <br><br><br>
      </div>
      
      <div class="main">
         
         <div class="image_middle2">
            <img src="/images/monument.jpg" width=600px>
         </div>
         <div class="image_middle">
            <img src="/images/louvre.jpg" width=600px> 
            <br><br><br><br>
             <br>
            프랑스와 파리의 과거와 현재를 상징하는 '에펠탑' <br>
            남성적인 건축물의 대표작 '개선문' <br>
            그리고 투명한 유리 피라미드를 마치 보석인양 품고 있는 <br>
            파리의 심장 '루브르 박물관'
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
      <button onclick="France()">작성</button>
   </div>
   
  



   
   <div class="footer">
      <jsp:include page="footer.jsp"></jsp:include>
   </div>
</body>
</html>