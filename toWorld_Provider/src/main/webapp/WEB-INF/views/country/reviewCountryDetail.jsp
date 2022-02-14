<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.sboot.toworld.vo.ReviewVO"%>
<%@page import="com.sboot.toworld.dao.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>France</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
   .header{
      margin-top: 5px;
        margin-bottom: 0px;
        margin-left: 100px;
        margin-right: 60px;
        height: 10%;
   }
   
   .header img {
         display:block;
         margin:0 auto; 
         width:200px; 
         height:60px;
   }

   .reviewDetail {
   		margin-top: 40px;
   		text-align: center;
   		font-family: 'Noto Sans KR', sans-serif;
   }
   
   .reviewDetail .title {
   		font-family: 'Jua', sans-serif;
   		font-size: 40px;
   }
   
   .reviewDetail .id {
   		font-weight: bold;
   		margin-bottom: 30px;
   }
   
   .reviewDetail .id span {
   		font-weight: normal;
   		color: #929292;
   		font-size: 13px;
   	}
   	
   	.reviewDetail .contents .file img {
         margin-bottom: 20px;
         max-width: 50%;
         height: auto;
         display: block;
      }
   	
   	.reviewDetail .contents pre {
   		font-family: 'Noto Sans KR', sans-serif;
   		font-size: 18px;
   		font-weight: bold;
   	}
   	
   	.reviewDetail .button button {
   		border: 1px solid black; 
   		border-radius: 5px;
   		background-color: rgba(0,0,0,0); 
   		color: black; 
   		padding: 5px;
   		cursor: pointer;
   }
   
   .reviewDetail button:hover { 
   		color:white; 
   		background-color: black; 
   	}
   	
   	.regComment textarea {
   		resize: none;
   	}
   	
   	.regComment button {
   		border: 1px solid black; 
   		border-radius: 5px;
   		background-color: rgba(0,0,0,0); 
   		color: black; 
   		padding: 5px;
   		cursor: pointer;
   }
   
   .regComment button:hover { 
   		color:white; 
   		background-color: black; 
   	}
   	
   	.comment {
   		width: 70%;
   		margin: 0 auto;
   		font-family: 'Noto Sans KR', sans-serif;
   		background-color: #F7F7F7;
   	}
   	
   	.viewComment a {
   		color: black;
   		text-decoration : none;
   		font-size: 12px;
   		font-weight: bold;
   	}
   	
   	.viewComment button {
   		border-style: none;
   		background-color: transparent;
   		font-family: 'Noto Sans KR', sans-serif;
   		font-size: 12px;
   		cursor: pointer;
   	}
   	
   	.viewComment .id {
   		font-size: 13px;
   		font-weight: bold;
   	}
   	
   	.viewComment .date {
   		font-size: 10px;
   	}
   	
   	form {
   
   	display:inline;
   	
	}
   	
 div.replyModal { position:relative; z-index:1; display:none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 
 
 	section.replyList span.date {
 		font-size: 12px;
 	}
 	
 	section.replyList span.userName {
 		font-size: 16px;
 		font-weight: bold;
 	}
 
 	section.replyList span.replyFooter button { 
 		background-color: transparent;
 		border-style: none;
 		font-family: 'Noto Sans KR', sans-serif;
 		font-weight: bold;
 		cursor: pointer;
 	}
 	
 	section.replyList div.replyComment pre {
 		font-family: 'Noto Sans KR', sans-serif;
 		font-size: 16px;
 	}
   	
</style>

<script>
function replyList(){
	
	 var serial = ${serial};
	 $.getJSON("/view/replyList2" + "?n=" + serial, function(data){
	  var str = ""; 
	  
	  if(data.length<1){
		  str="<div style='color:gray; font-weight:bold; font-style:italic;'><<< 등록된 댓글이 없습니다! >>></div>";
	  }
	  
	  $(data).each(function(){
		  
	   console.log(data);
	   
	   str += "<data-repNum='" + this.rp_no + "'>"
	   + "<div align='center'>"
       + "<span class='userName'>" + this.rvwid + "</span> &nbsp;"
       + "<span class='date'>" + this.datetime + "</span> &nbsp;&nbsp;"
       + "<span class='replyFooter'>"
       + "<button type='button' class='modify' data-repNum='" + this.rp_no + "'>수정</button>"
       + "<button type='button' class='delete' data-repNum='" + this.rp_no + "'>삭제</button>"
       + "</span>"
       + "<div class='replyComment' align='center'> <pre>" + this.rvwcomment + "</pre> </div>"
       + "</div>";
	  });
	  
	  $("section.replyList ol").html(str);
	 });
	 
	}

</script>

</head>
<body>

   <div class="header">
	    <a href="/home">
      	<img src="/images/logo3.jpg">
      	</a>
    </div>
 
<!-- <form action="/insertComment" method="post"> -->
 	<div class="reviewDetail">
	    <c:forEach var="imsi" items="${reviewCountryDetail}">
	   	 	<div class="title">${imsi.title}</div>
		    <div class="id">${imsi.id} &nbsp; <span>${imsi.datetime}</span></div>
		    <div class="contents">
		    	<div class="file" align="center"> <img src="/img/${imsi.fileName}"> </div> 
		    	<pre> ${imsi.contents} </pre> <br>
		    </div>
		    <br>
			<div class="button">
				<a href="/updateReview?fileName=${imsi.fileName}"><button>수정</button></a> &nbsp; 
				<a href="/deleteReview?fileName=${imsi.fileName}&country=${imsi.country}"><button>삭제</button></a>
			</div>
	    </c:forEach>
	</div>
	
	<br>

<form action="/insertComment" method="post">
	<div class="comment">
	<c:forEach var="imsi" items="${reviewCountryDetail}">
	<input type="hidden" name="serial" value="${imsi.serial}">
	<input type="hidden" name="fileName" value="${imsi.fileName}">
	<input type="hidden" name="id" value="${imsi.id }">
	</c:forEach>
	
	<!-------------------- 댓글 ---------------------->
	<!----- 댓글 ------>
	
	<br>
	<section class="replyList">
		<ol>
		 
		</ol>  
	<script>
		replyList();
	</script>
	
	<!-- 댓글 삭제 -->
	<script>
	$(document).on("click", ".delete", function(){
		  
		var deleteConfirm = confirm("게시물을 삭제하시겠습니까?");
		
		if(deleteConfirm){
			
		 
		  	var data = {rp_no : $(this).attr("data-repNum")};
		   
			  $.ajax({
			   url : "/view/deleteReply2",
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
	
	<div class="replyModal">

 <div class="modalContent" style="height:50%;">
  
  <div>
   <textarea class="modal_repCom" name="modal_repCom" style="width:95%"></textarea>
  </div>
  
  <div style="margin-top:5%;">
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>
	
	<!-- 수정눌렀을때 수정창 띄우기 -->
	<script>
	$(document).on("click", ".modify", function(){
		 //$(".replyModal").attr("style", "display:block;");
		 $(".replyModal").fadeIn(200);
		 
		 var repNum = $(this).attr("data-repNum");
		 var repCom = $(this).parent().parent().children(".replyComment").text();
		 
		 $(".modal_repCom").val(repCom);
		 $(".modal_modify_btn").attr("data-repNum", repNum);
		});
	</script>
	
	<!-- 댓글수정창 취소 -->
	<script>
		$(".modal_cancel").click(function(){
		 //$(".replyModal").attr("style", "display:none;");
		 $(".replyModal").fadeOut(200);
		});
	</script>
	
	<!-- 댓글 수정 -->
	<script>
		$(".modal_modify_btn").click(function(){
			 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			 
			 if(modifyConfirm) {
				 var data = {
						 "rp_no" : $(this).attr("data-repNum"),
					     "rvwcomment2" : $(".modal_repCom").val()
				 }
			    // ReplyVO 형태로 데이터 생성
			  
			  $.ajax({
			   url : "/view/modifyReply2",
			   
			   type : "post",
			   data : data,
			   success : function(result){
			    
			    if(result == 1) {
			     $(".replyModal").fadeOut(200);
			     replyList();
			     
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
	 
	<br>

	<div class="regComment" align="center">
		<textarea name="rvwcomment" rows="4" cols="50"></textarea> <br>
		<button type="submit">등록</button>
	</div>
	<br>
	
	</div>

</form>

</body>
</html>