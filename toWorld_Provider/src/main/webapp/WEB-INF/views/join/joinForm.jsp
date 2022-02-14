<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/css/default.css">
<style>

   .btn #join {
      width: 20%;
      height: 40px;
      background: #FFF0CB;
      border-radius: 11px;
      margin: 20px 5px 5px 5px;
      cursor: pointer;
   }
   
   .btn #cancel {
      width: 20%;
      height: 40px;
      background: #FFF0CB;
      border-radius: 11px;
      margin: 20px 5px 5px 5px;
      cursor: pointer;
   }
   
   .form {
      width: 40%;
      margin: 0 auto;
   }
   
</style>
</head>
<body>
<br><br>
<h1 align = "center">회원가입</h1>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<br>
<br><br>
<form action="/join/joinProcess" method="post">
<div class="form">
   아이디 <input type="text" id="username" name="username">
   <br><input type="button" id="checkbtn" value="중복확인" style="float:right"> <br><br>
   비밀번호 <input type="password" name="password" required> <br><br>
   이름 <input type="text" name ="name" required> <br><br>
   생년월일 <input type="text" name="birthdate" placeholder="예)19960422" required> <br><br>
   전화번호 <input type="text" name="tel" required> <br>
</div>
 <br>
   
   <div class="btn" align="center">
        <input type="submit" id="join" value = "회원가입"> &nbsp;
      <input type="reset" id="cancel" value="취소" onclick = "location.href='/join/joinfail';">
   </div>
</form>


<script>
$("#checkbtn").click(function(){
   
   var data = {"id" : $("#username").val()};
   
   $.ajax({
      url: "/join/joinCheck",
      type: "post",
      data: data,
      success: function(result){
         if(result==1){
            alert("사용 가능한 아이디입니다");
         }else{
            alert("중복된 아이디입니다");
         }
      },error: function(){
         alert("에러");
      }
   });
   
});

</script>

</body>
</html>