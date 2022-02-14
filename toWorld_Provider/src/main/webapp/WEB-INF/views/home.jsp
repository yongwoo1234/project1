<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
 @media all and (min-width:300px) {
      width:100%;
   }

   @media all and (min-width:768px){
      width:50%;
   }
   
   @media all and (min-width:1000px){
      width:25%;
   }


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

   .section{
      
      align-items:center;
      margin-top: 10px;
      margin-bottom: 10px;
      margin-left: 50px;
      margin-right: 50px;
      height: 80%;
   }

   .footer{
      height: 10%;
   }
   
   body{
      padding-top: 75px;
   }

</style>


<title>toWorld</title>
</head>
<body>

		<!-- header -->
<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
</div>
		
<div class="section">
		<jsp:include page="main_section.jsp"></jsp:include>
</div>

<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
</div>
		
</body>
</html>