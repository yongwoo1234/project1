<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자</title>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${contextPath}css/list.css">


</head>
<body>



<h1 align="center" style="font-weight:bold">동행자 게시판</h1>

<br>


<div class="search">
    <select name="searchType" style="width:100px; height:30px">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" style="width:200px" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button" style="height:30px; border:1px solid;">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + "${pageMaker.makeQuery(1)}" + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
</div>
  
  <br>

<table align="center" width=90% class="type10 table-hover" >

<thead>
<tr>
	<th width=10%>글번호</th>
	<th width=42%>제목</th>
	<th width=13%>작성자</th>
	<th width=17%>날짜</th>
	<th width=9%>조회수</th>
	<th width=9%>댓글수</th>
</tr>
</thead>
	
<tbody>

      <c:forEach var="temp" items="${list}">
      <tr>
      	<td>${temp.serial}</td>
	    <td><a href="whoTogether?serial=${temp.serial}" id="line" style="font-weight:bold">${temp.title}</a></td>
	    <td>${temp.id}</td>
	    <td>${temp.ddate}</td>
	    <td>${temp.viewcnt}</td>
	    <td>${temp.commentcnt}</td>
      </tr>
      </c:forEach>

</tbody>

</table>

<br>

<div id="btn">
	<a href="/insertTogetherForm"><input type="button" class="badge-pill btn btn-dark" style="font-weight:bold" value="글쓰기"></a>
</div>


<br>

 

<div>
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item ${pageMaker.cri.page == idx ? "active":"" }""><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul> 
</div>


<br>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

</body>
</html>