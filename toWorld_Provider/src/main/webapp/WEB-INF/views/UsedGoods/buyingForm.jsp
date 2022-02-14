<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style>


*{
   font-family: 'Noto Sans KR', sans-serif;
}

#addressbtn{
 
   position:relative;
   top:-63px;
    width: 5em;
    height:63px;
     left:86.5%;
     border-radius: 5px;
     margin-bottom:-300px;

  }

.test{
   
   margin: 0 auto;
   width:75%;
   
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

   .footer{
      height: 10%;
   }
   
   body{
      padding-top: 75px;
      margin-left:9%;
      margin-right:9%;
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
<!-- <form method="post" id="pay" enctype="multipart/form-data"> -->
   <table class ="table table-bordered" align="center">
       <thead>
           <h1 style="font-weight:bold">구매하기</h1>
        </thead>
        
        <tbody>
            <tr>
               <th>이름</th>
                <td><input type ="text" name = "name" id="rname" class="form-control" placeholder = "이름" required></td>
            </tr>
            <tr>    
                <th>아이디 </th>
                <td>${sid}</td>
            </tr>
            <tr>
               <th>가격 (원)</th>
               <td>
               ${price} (원)
               <input type ="hidden" name = "price" value="${price}">
               </td>
            </tr>
        
           <tr>
                <th>주소</th>
                <td><textarea name="address" id="address" cols="10" class="form-control" style="width: 86%; resize: none;" placeholder="주소를 입력해주세요" readonly required></textarea>
                   <button id="addressbtn">주소검색</button>
                   <input type="text" name="address_detail" cols="10" rows="1" class="form-control" style="resize: none; margin-top:-30px;" placeholder="상세주소를 입력하세요" required></textarea>
                </td>
            </tr>

            <tr>
               <th>결제수단</th>
               <td><input type="radio" name="radiocheck" id="radiocard" checked="checked"> 카드 &nbsp; &nbsp; &nbsp;
                  <input type="radio" name="radiocheck" id="radiomoney" disabled="true"> 계좌이체</td>
            </tr>
            
            
        </tbody>
     </table>  
     
           <input type="hidden" name="serial" value="${serial}">
           <input type = "button" id="paybtn" style="font-weight:bold" class="btn btn-outline-primary" value = "결제">
           <a href="/usedGoods/detail">
                 <input type = "button" style="font-weight:bold" class="btn btn-outline-primary" value="취소">
           </a>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("addressbtn").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>



<script>
$("#paybtn").click(function(){

   var name = $('#rname').val();
   var address = $('#address').val();
      
   IMP.init('imp19917773'); //고유 넘버

   IMP.request_pay({
       pg : 'inicis', //kg이니시스
       pay_method : 'card', //카드 결제
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '${goodsName}',
       amount : ${price}, //판매 가격
       //밑에는 db에서 가지고오기
       buyer_email : 'iamport@siot.do',
       buyer_name : name, 
       buyer_tel : '${phone}',
       buyer_addr : address,
       buyer_postcode : '123-456',
      
       
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
// x msg += '고유ID : ' + rsp.imp_uid;
//        msg += '상점 거래ID : ' + rsp.merchant_uid;
//        msg += '결제 금액 : ' + rsp.paid_amount;
//        msg += '카드 승인번호 : ' + rsp.apply_num;
       alert(msg);
       location.href="/usedGoods/soldDetail?serial=${serial}";
        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        
        location.href='/usedGoods/detail?serial=${serial}'; 
        
    }
   
    //location.href='/usedGoods/list'
    //location.href='/usedGoods/soldDetail';
   });
});
</script>

</div>



<div class="footer">
      <jsp:include page="../footer.jsp"></jsp:include>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

</body>
</html>