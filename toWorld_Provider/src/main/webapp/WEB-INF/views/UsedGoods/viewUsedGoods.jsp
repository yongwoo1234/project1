<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 게시글</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>



<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${contextPath}css/header_footer_body.css">

<style>

*{
	font-family: 'Noto Sans KR', sans-serif;
}

   
   .test{
   
	margin:0 auto;
   	width:80%;  
  
   }
 
 
.buy {
	width:100%; 
	height:50px; 
	font-size:1.5em; 
	font-weight: bold; 
	font-style:italic;
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
      
      
<div class="test">

  	<div align="right" style="font-size:13px;"> 게시물 작성자 : ${id}</div>
  	<h1 align="center" style="font-weight:bold;">${title}</h1>      
     
     <hr>
    
    <table border=1 frame="void" rules="cols" bordercolor="lightgray" align=center>
   
    <tr>
    	<td rowspan=5 width=50% >
    		<img src="/img/${fileName}" width=99% onerror="this.style.display='none'">
    	</td>
    </tr>
    
    <tr>
    	<td> &nbsp; <span style="font-weight:bold;">상품명 </span>
	  				<span> : ${goodsName}</span>
	  	</td>
    </tr>
    
    <tr>
    	<td style="color:#a89b94;font-weight:bold"> &nbsp; ${context}</td>
    </tr>
    
    <tr>
    	<td> &nbsp; <span style="font-weight:bold">가격 </span>
	  				<span> : ${price}원</span>	
	  	</td>
    </tr>
   
     
    
    <tr>
    	<td style="margin-bottom:-100px">
    		<c:if test="${id==sid}">
				<div class="button">
				   <a href="/usedGoods/updateUsedGoodsForm?serial=${serial}"><input type="button" class="btn btn-warning btn-lg" style="font-weight:bold; width:49%;" value="게시물 수정"></a>
				   <a href="/usedGoods/delete?serial=${serial}"><input type="button" class="btn btn-warning btn-lg" style="font-weight:bold; width:49%;" value="게시물 삭제"></a>
				</div>
			</c:if>
			
			<c:if test="${id != sid}">		
			
				<c:if test="${many!=1}">
						<div class="button">				  
						    <input type="button" class="buy" value="SOLD OUT" disabled>
						</div>
						
				</c:if>		
				
				<c:if test="${many==1}">
					<form action="/usedGoods/buy" method="post">		
						<input type="hidden" class="serial" name="serial" value="${serial}">
						<input type="hidden" class="price" name="price" value="${price}">
						<input type="hidden" class="id" name="id" value="${id}">
						<input type="hidden" class="goodsName" name="goodsName" value="${goodsName}">
					   
						<input type="submit" class="btn btn-warning btn-lg btn-block" style="font-weight:bold; height:50px" value="구매">	
					</form>
				</c:if>
					
				
				
			</c:if>
		</td>
    
    </tr>
    
    
    
    </table>
       
    
 </div>

<br>

<div class="footer">
      <jsp:include page="../footer.jsp"></jsp:include>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>


</body>
</html>




