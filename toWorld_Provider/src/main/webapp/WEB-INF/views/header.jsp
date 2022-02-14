<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
   
   a {
      text-decoration: none;
      color: black;
   }
   
   .logo img {
         display:block;
         margin:0 auto; 
         width:200px; 
         height:60px;
   }
   
   input[id="menuicon"]{
   display:none;
   }


   input[id="menuicon"] +label{
   display:block;
   width:30px;
   height:30px;
   position:fixed;
   top:10px;
   right:10px;
   cursor:pointer;
   }
   
   input[id="menuicon"]:checked + label{
   z-index:2;
   right:250px;
   }
   
   input[id="menuicon"] +label span {
   display:block;
   position:absolute;
   width:100%;
   height:5px;
   border-radius:30px;
   background:#000;
   transition:all .35s;
   }
   input[id="menuicon"]:checked+label+div{
   right:0;
   }
   
   input[id="menuicon"] + label span:nth-child(1) {
   top:0;
   }
   
   input[id="menuicon"] + label span:nth-child(2) {
   top:50%;
   transform:translateY(-50%);
   }
   
   input[id="menuicon"] + label span:nth-child(3) {
   bottom:0;
   }
   
   input[id="menuicon"]:checked + label span:nth-child(1){
   top:50%;
   transform:translateY(-50%) rotate(45deg);
   }
   
   input[id="menuicon"]:checked + label span:nth-child(2){
   opacity:0;
   }
   
   input[id="menuicon"]:checked + label span:nth-child(3){
   bottom:50%;
   transform:translateY(50%) rotate(-45deg);
   }
   
   div[class="sidebar"]{
   width:250px;
   height:100%;
   background:#fff;
   opacity:0.95;
   position:fixed;
   top:0;
   right:-300px;
   z-index:3;
   transition:all .35s;
   }
  
   
    input[id="menuicon"]:checked + label + div{
   right:0;
   }
   
    @media all and (min-width:300px) {
      width:100%;
   }

   @media all and (min-width:768px){
      width:50%;
   }
   
   @media all and (min-width:1000px){
      width:25%;
   }
   
   div[class="menu"]{
   position:absolute;
   width:200px;
   top: 5%;
   font-size:medium;
   left:10%;
   
      }
      
      .menu button {
         border: 1px solid black; 
         border-radius: 5px;
         background-color: rgba(0,0,0,0); 
         color: black; 
         padding: 5px;
         cursor: pointer;
	   }
	   
	   .menu button:hover { 
	         color:white; 
	         background-color: black; 
	      }
	   
   .gcw_mainFBhQXkxz4{
   position:fixed;
   bottom:10px;
   align:center;
   }
</style>

      </head>
      <body>
      
      <div class="logo">
      <a href="/home">
      <img src="/images/logo3.jpg">
      </a>
      </div>
      
        <div class="icon">
      <input type="checkbox" id="menuicon">
      <label for="menuicon">
      <span></span>
      <span></span>
      <span></span>
      </label>
      
      <div class="sidebar">
      
      <div class="menu">
     
     <%String id = (String)session.getAttribute("sid");
       if(id == null){     
      %>
      &nbsp; 로그인을 해주세요<br><br>
           <button id="login" onclick="location.href='/login';">로그인</button>
	       <button id="join" onclick="location.href='/join';">회원가입</button>
	       <br><br>
     
      <a href="/list">&nbsp; 같이가요 :> </a><br><br>
     
      <a href="/usedGoods/list">&nbsp; 구매해요 :D  </a><br><br>
      
      <a href="">&nbsp; &nbsp;번역기 </a><br><br>
      <%}else{ %>
       &nbsp;<br>
          &nbsp;<% out.println((String)session.getAttribute("sid")); %> 님 환영합니다~ <br><br>
       
	  <button id="logout" onclick="location.href='/logout';">로그아웃</button>
      <br><br>
     
      <a href="/list">&nbsp; 같이가요 :> </a><br><br>
     
      <a href="/usedGoods/list">&nbsp; 구매해요 :D  </a><br><br>
      
      <a href="http://localhost:8812"
      onclick="window.open(this.href, '_blank', 'width=800,height=600'); return false;"> &nbsp; &nbsp;번역기</a><br><br>
      <%} %>
      
      
      <!-- 환율 위젯 -->
                       <!--Currency Converter widget by FreeCurrencyRates.com -->

   <div id='gcw_mainFBhQXkxz4' class='gcw_mainFBhQXkxz4'></div>
   <a id='gcw_siteFBhQXkxz4' href='https://freecurrencyrates.com/en/'></a>
   <script>function reloadFBhQXkxz4(){
   var sc = document.getElementById('scFBhQXkxz4');
   if (sc) sc.parentNode.removeChild(sc);
   sc = document.createElement('script');
   sc.type = 'text/javascript';
   sc.charset = 'UTF-8';
   sc.async = true;
   sc.id='scFBhQXkxz4';
   sc.src = 'https://freecurrencyrates.com/en/widget-vertical?iso=KRW-USD-EUR-JPY-CNY-HKD-TWD&df=1&p=FBhQXkxz4&v=fits&source=fcr&width=250&width_title=0&firstrowvalue=1&thm=dddddd,ffffff,dddddd,dddddd,444444,dddddd,ffffff,0073EA,000000&title=%ED%99%98%EC%9C%A8&tzo=-540';
   var div = document.getElementById('gcw_mainFBhQXkxz4');
   div.parentNode.insertBefore(sc, div);} reloadFBhQXkxz4();
   </script>
   
      </div>
      </div>
      </div>
      
      
</body>
</html>