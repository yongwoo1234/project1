<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
  <head>
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="-1"> 
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
  <title>번역</title>
  <style>
  
   
   .api{
   text-align:center;
    font-family: 'Noto Sans KR', sans-serif;
   }
   }
   
   
   
  </style>
   </head>
    <body>
    

    
     <!-- Start your code here -->
      <script src="https://code.jquery.com/jquery-3.6.0.js" 
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
      crossorigin="anonymous">
      </script>
      
      <div class="api">
       <h1>toworld 번역기</h1><br>
       <div> 
     	
       <form id="transExForm" name="transExForm">
        번역할 언어
       <select id="src_lang" name="src_lang">
     <option value="kr">한국어</option>
          	<option value="en">영어</option> 
             <option value="jp">일본어</option>
             <option value="fr">프랑스어</option> 
             <option value="th">태국어</option>
              <option value="cn">중국어</option> 
              <option value="pt">포르투갈어</option> 
              <option value="es">스페인어</option>
              <option value="it">이탈리아어</option> 
         </select><br><br>
        
                <textarea id="query" name="query" cols="80" rows="5" style="resize: none;"></textarea><br>
          <br> 번역 결과 언어 
           <select id="target_lang" name="target_lang">
          <option value="kr">한국어</option>
          	<option value="en">영어</option> 
             <option value="jp">일본어</option>
             <option value="fr">프랑스어</option> 
             <option value="th">태국어</option>
              <option value="cn">중국어</option> 
              <option value="pt">포르투갈어</option> 
              <option value="es">스페인어</option>
              <option value="it">이탈리아어</option>
              </select> <br> <br>
              
              
                
                </form> </div><br>
                
                 <div> <button onclick="process()"> 번역하기</button> <br><br>
                 
                  
                   <textarea id="result_translation" name="result_translation" cols="80" rows="5" style="resize: none;"></textarea>
                    </div> 
                    
                    <script>
                    
                    function process() {
                       $.ajax({
                       url: "https://dapi.kakao.com/v2/translation/translate", 
                       type: "POST",
                       contentType: "application/x-www-form-urlencoded",
                       headers: { 
                          "Authorization": "KakaoAK 3bc829050df8fee4c0918d7219ffdc3f" },
                       data: $("#transExForm").serialize(),
                       success: function(data) {
                          $("#result_translation").val(data.translated_text); },
                       error: function(jqXHR, textStatus, errorThrown) { 
                          var errorMsg = "Ready Status: "; 
                          errorMsg += jqXHR.readyState + "\n";
                          errorMsg += "Status Text:";
                          errorMsg += jqXHR.readystatusText + "\n"; 
                          alert(errorMsg); } }) }</script>
                   </div>             
                          
         
