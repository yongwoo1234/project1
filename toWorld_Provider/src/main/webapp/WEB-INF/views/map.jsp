<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
            <!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1635310044397" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
   2. 설치 스크립트
   * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
   new daum.roughmap.Lander({
      "timestamp" : "1635310044397",
      "key" : "27ti6",
      "mapWidth" : "600",
      "mapHeight" : "400"
   }).render();
</script>
</body>
</html>