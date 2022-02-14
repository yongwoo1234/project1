<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 상세글</title>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link rel="stylesheet" href="${contextPath}css/viewTogether.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">


<script>
//replyList를 불러오기
function replyList(){
	
	
	 var serial = ${serial};
	 $.getJSON("/view/replyList" + "?n=" + serial, function(data){
	  var str = ""; 
	  
	  if(data.length<1){
		  str="<div style='color:gray; font-weight:bold; font-style:italic;'><<< 등록된 댓글이 없습니다! >>></div>";
	  }
	  
	  else {
	  $(data).each(function(){
		  
	   console.log(data);
	   
	   var repDate = new Date(this.regdate);
	   repDate = repDate.toLocaleString();
	   
	   var rid = this.id;
	   
	   str += "<div id='reply_all'>"
		   + "<div data-repNum='" + this.rno + "'>"   	  
	     + "<div class='userInfo'>"
	     + "<span class='userName' style='font-weight:bold; color:#0A6EFF'>" + rid + "  " + "</span>"
	     + "<span class='date' style='color:gray; font-size:6px'>" + repDate + "</span>"
	     
	     + "<button type='button' class='delete' id='replyFooter' data-repNum='" + this.rno + "'>삭제</button>"
	     + "<button type='button' class='modify' id='replyFooter' data-repNum='" + this.rno + "'>수정</button>"
	     
	     + "</div>"
	     + "<div class='replyContent'>" + this.content + "</div>" + "<hr>"
	      
	     + "</div>"
	     + "</div>";           
	  });
  }
	  $("section.replyList ol").html(str);
	 });
 
}
</script>

</head>


<body>

<%
   String id = (String)session.getAttribute("sid");
%>

<!-- 헤더 -->
<div class="header">
      <jsp:include page="../header.jsp"></jsp:include>
</div>

<!-- 게시글 -->
<div class="test">
<br>
	<div align="right" style="font-size:13px;"> 게시물 작성자 : ${id}</div>
      <h1 align="center" style="font-weight:bold;">${title}</h1> 
     
      <hr>
      <div align="center"><img src="/img/${fileName}" onerror="this.style.display='none'"></div> <br><br>
      <div class="context">${context}</div> <br><br>
      <input type="hidden" name="id" value="${id}">

<br>

<c:if test="${id==sid}">
	<div class="button">
	   <a href="/updateTogetherForm?serial=${serial}"><input type="button" class="btn btn-light" style="font-weight:bold" value="게시물수정"></a>
	   <a href="/deleteTogether?serial=${serial}"><input type="button" class="btn btn-light" style="font-weight:bold" value="게시물삭제"></a>
	</div>
</c:if>





<!-- ============================== 댓글 ========================================  -->

<hr>
<div id="reply">

<section class = "replyForm">
		<form role="form" method="post" autocomplete="off">
			
			<input type="hidden" name="serial" value="${serial}">
			
			<div class="input_area">
				<span style="font-weight:bold;"> 작성자 : ${sid} </span>
				<br>
				<textarea name="repCon" id ="repCon"></textarea>

				<button type="submit" id="reply_btn" style="font-weight:bold" class="btn btn-light btn-outline-secondary">댓글<br>남기기</button>
			
				
			<script>
				 $("#reply_btn").click(function(){
				  
				  var formObj = $(".replyForm form[role='form']");
				  var serial = ${serial};
				  var repCon = $("#repCon").val();
				  //data에 serial과 repCon(내용) 값 주기
				  var data = {
				    "serial" : serial,
				    "repCon" : repCon
				    };
				  var insertConfirm = confirm("댓글을 등록하시겠습니까?");
				  //확인을 누르면 ajax실행
				  if(insertConfirm){
					  $.ajax({
					   url : "/view/registReply",
					   type : "post",
					   data : data,
					   success : function(){
					    replyList();
					    $("#repCon").val("");
					   }
					  });
				  }
				 });
			</script>
			
			</div>
		</form>
	</section>
	
	<br>
	
	<section class="replyList">	
		 <ol>
		</ol>    
				
		<script>
		//replyList function을 통해 불러오기
			replyList();	
		</script>
				
		<script>
			 $(document).on("click", ".delete", function(){
				  
				var deleteConfirm = confirm("게시물을 삭제하시겠습니까?");
				
				if(deleteConfirm){	
				 
				  	var data = {rno : $(this).attr("data-repNum"),
				  				serial:${serial}};
				   
					  $.ajax({
					   url : "/view/deleteReply",
					   type : "post",
					   data : data,
					   success : function(result){
						   
						   if(result == 1) {
						    replyList();
						   } else {
						    alert("작성자 본인만 할 수 있습니다.");     
						   }
						  }
					  });
				}
			 });
		</script>			
				
	</section>

</div>

</div>

<!-- 수정 창 -->
<div class="replyModal">

 <div class="modalContent" style="height:50%;">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>



<div class="footer">
      <jsp:include page="../footer.jsp"></jsp:include>
</div>




<!-- 댓글 수정 -->
<script>
		$(document).on("click", ".modify", function(){
			 //$(".replyModal").attr("style", "display:block;");
			 $(".replyModal").fadeIn(200);
			 
			 var repNum = $(this).attr("data-repNum");
			 var repCon = $(this).parent().parent().children(".replyContent").text();
			 
			 $(".modal_repCon").val(repCon);
			 $(".modal_modify_btn").attr("data-repNum", repNum);
			});
		</script>
		
		<script>
		$(".modal_cancel").click(function(){
		 //$(".replyModal").attr("style", "display:none;");
		 $(".replyModal").fadeOut(200);
		});
		</script>
		
		<script>
		$(".modal_modify_btn").click(function(){
			 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			 
			 if(modifyConfirm) {
			  var data = {
			     "rno" : $(this).attr("data-repNum"),
			     "content" : $(".modal_repCon").val()
			    };  // ReplyVO 형태로 데이터 생성
			  
			  $.ajax({
			   url : "/view/modifyReply",
			   type : "post",
			   data : data,
			   success : function(result){
			    
			    if(result == 1) {
			     replyList();
			     $(".replyModal").fadeOut(200);
			    } else {
			     alert("작성자 본인만 할 수 있습니다.");
			    }
			   },
			   error : function(){
			    alert("로그인하셔야합니다.")
			   }
			  });
			 }
			 
			});
</script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>


</body>
</html>
