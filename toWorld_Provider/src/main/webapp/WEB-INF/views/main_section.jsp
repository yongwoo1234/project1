<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   
   .worldlist {
      max-width:1500;
      width:100%;
      margin:0 auto;
   }
   
   ul {font-size:0;}
   
   ul>li {
      display:inline-block;
      vertical-align:middle;
      width:25%;
   }
   
   ul > li >a {
      display:block;
      width:auto;
      text-decoration: none;
      margin:5px;
   }
   
   ul >li >a .screen {
      position:relative;
      overflow:hidden;
   }
   
   ul>li>a:hover .middle {top:30%;}
   
   ul>li>a .screen::after {      /* after:스타일로만 가상요소를 만든다 */
      content:'';
      display:block;
      position:absolute;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background:rgba(0,0,0,.5);
      z-index:1;
      opacity:0;
   }
   
   ul>li>a:hover .screen::after {
         opacity:1;
         border-radius:10px;
   }
   
   ul > li >a .screen .middle {
      position:absolute;
      bottom:100%;
      left:0.7vw;
      z-index:2;
      color:#FFF;
      font-size:3.3vw;
      font-weight:600;
   }
   
   ul>li>.dice img{
	  display:block;
	  width:90%;
      margin:5px;
	  left:80px;
	   }
   
   
   ul > li>a .screen img{
	   width:100%;
	   border-radius:10px;
   }
  
</style>
</head>
<body>

      <div class="worldlist">
      <ul>
      <li>
      <a href="/France">
      <div class="screen">
      <div class="middle">France</div>
      <img src="/images/paris2.jpg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Switzer">
      <div class="screen">
      <div class="middle">Switzerland</div>
      <img src="/images/Switzer.jpeg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Canada">
      <div class="screen">
      <div class="middle">Canada</div>
      <img src="/images/canada.jpg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Thailand">
      <div class="screen">
      <div class="middle">Thailand</div>
      <img src="/images/bangkok.jpg">
      </div>
      </a>
      </li>
      </ul>
      </div>
      
      <div class="worldlist">
      
      <ul>
      <li>
      <a href="/Croatia">
      <div class="screen">
      <div class="middle">Croatia</div>
      <img src="/images/croatia.jpg">
      </div>
      </a>
      </li>
      
      <li>
      </li>
      
      <li>
      </li>
      
      <li>
      <a href="/Hongkong">
      <div class="screen">
      <div class="middle">Hongkong</div>
      <img src="/images/hongkong1.jpg">
      </div>
      </a>
      </li>
      </ul>
      </div>
      
      
      
      <div class="worldlist">
      
      <ul>
      <li>
      <a href="/Japan">
      <div class="screen">
      <div class="middle">Japan</div>
      <img src="/images/japan.jpg">
      </div>
      </a>
      </li>
      
      <li>
      </li>
      
     <li>    
      <div class="dice">
      <img src="/images/dice.png">
      </div>
      </li>
      
      <li>
      <a href="/USA">
      <div class="screen">
      <div class="middle">USA</div>
      <img src="/images/USA.jpg">
      </div>
      </a>
      </li>
      </ul>
      </div>
      
      
      <div class="worldlist">
      <ul>
      <li>
      <a href="/Portugal">
      <div class="screen">
      <div class="middle">Portugal</div>
      <img src="/images/portugal.jpg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Italy">
      <div class="screen">
      <div class="middle">Italy</div>
      <img src="/images/Italy.jpeg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Spain">
      <div class="screen">
      <div class="middle">Spain</div>
      <img src="/images/Spain.jpeg">
      </div>
      </a>
      </li>
      
      <li>
      <a href="/Korea">
      <div class="screen">
      <div class="middle">Korea</div>
      <img src="/images/korea.jpg">
      </div>
      </a>
      </li>
      </ul>
      </div>

<!-- 
   <table border="0">
   <tr><td><img src="/images/paris2.jpg" width="300" height="300"></td><td><img src="/images/switzer.jpg" width="300" height="300"></td><td><img src="/images/canada.jpg" width="300" height="300"></td><td><img src="/images/bangkok.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/croatia2.jpg" width="300" height="300"></td><td colspan=2 rowspan="2">toWorld</td><td><img src="/images/hongkong1.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/japan.jpg" width="300" height="300"><td><img src="/images/norway.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/portugal.jpg" width="300" height="300"></td><td><img src="/images/venice_italy.jpg" width="300" height="300"></td><td><img src="/images/spain.jpg" width="300" height="300"></td><td><img src="/images/korea.jpg" width="300" height="300"></td></tr>
   </table>

 --></body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   
   table{
      text-align: center;
      width: 80%;
      font-size: 40pt;
      font:italic bold;
      margin: 0 auto;
   }
   
   tr{
      padding: 0px 0px
      margin: 0 0 0 0;
   }
   
   td{
      padding:0px 0px;
      margin: 0 0 0 0;
   }
   
   img{
      border-radius:10px;
   }
   
</style>
</head>
<body>

   <table border="0">
   <tr><td><img src="/images/paris2.jpg" width="300" height="300"></td><td><img src="/images/switzer.jpg" width="300" height="300"></td><td><img src="/images/canada.jpg" width="300" height="300"></td><td><img src="/images/bangkok.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/croatia2.jpg" width="300" height="300"></td><td colspan=2 rowspan="2">toWorld</td><td><img src="/images/hongkong1.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/japan.jpg" width="300" height="300"><td><img src="/images/norway.jpg" width="300" height="300"></td></tr>
   <tr><td><img src="/images/portugal.jpg" width="300" height="300"></td><td><img src="/images/venice_italy.jpg" width="300" height="300"></td><td><img src="/images/spain.jpg" width="300" height="300"></td><td><img src="/images/korea.jpg" width="300" height="300"></td></tr>
   </table>

</body>
</html> --%>