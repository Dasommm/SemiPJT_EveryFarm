<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
label{
	color: white;
	font-weight:bold;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 도로명 API -->

<link href="../resources/css/eventboard/eventwrite.css"    
	  rel="stylesheet"    
	  type="text/css" /> 	  	
</head>
<script type="text/javascript">
$(document).ready(function(){            //도로명주소 클릭시 함수 실행
	$("#zonecode").click(function(){

		openDaumZipAddress();
	
	});
	
});
function openDaumZipAddress() {   //클릭시 실행되는 함수
	
	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#postcode1").val(data.postcode1);

			jQuery("#postcode2").val(data.postcode2);

			jQuery("#zonecode").val(data.zonecode);

			jQuery("#address").val(data.address);

			jQuery("#address_etc").focus();

			console.log(data);

		}

	}).open();

}

</script>
<body>
<%@ include file="../home/header.jsp" %>
<section style="height:1700px;">
	  <div class="container">
      <div id="form-wrap" style="margin-top:10%;">
        <form action="../eventboard.do" method="post" enctype="Multipart/form-data">
        	<input type="hidden" name="command" value="eventwriteres"/>
          <h1 style="color:white; font-weight:bold;">Event게시판 글쓰기</h1>
          <p style="color:white; font-weight:bold;">관리자 이벤트 게시판 글쓰기 페이지입니다.</p>
          <p style="color:white; font-weight:bold;">양식에 맞게 작성해 주십시오.</p>
          <div class="form-group">
            <label for="first-name">작성자</label>
            <input type="text" name="writer" id="first-name" value="${sessionScope.dto.mem_id}" readonly style="width: 30%;"/>
          </div> 
          <div class="form-group">
            <label for="first-name">제목</label>
            <input type="text" name="title" id="first-name" style="width: 50%;">
          </div> 
           <div class="form-group">
            <label for="first-name">대표이미지</label>
            <input type="file" name="image01">
           </div>
          <div class="form-group">
            <label for="first-name">대표내용</label>
            <input type="text" name="content01" id="first-name" style="width: 80%;">
          </div>
          <div class="form-group">
            <label for="first-name">이미지01</label>
            <input type="file" name="image02">
           </div> 
          <div class="form-group">
            <label for="first-name">내용01</label>
            <textarea type="text" name="content02" id="first-name" style="width:100%; height:100px; resize:none;"></textarea>
          </div>
           <div class="form-group">
            <label for="first-name">이미지02</label>
            <input type="file" name="image03">
           </div>
           <div class="form-group">
            <label for="first-name">내용02</label>
            <textarea type="text" name="content03" id="first-name" style="width:100%; height:100px; resize:none;"></textarea>
           </div>
          <div class="form-group">
            <label for="first-name">주소</label> 
          		<input type="text" value="" name="eve_zonecode" id="zonecode" readonly style="width:40%;"/>
  		 		<input type="text" value="" name="eve_addr" id="address" readonly style="width:80%;"/>
  	      		<input type="text" value="" name="eve_addretc" id="addr_etc" style="width:80%;"/>
			</div>
          <input type="submit" class="btn" value="글쓰기"/>
        </form> 
      </div>
      
    </div>
  
</body>
</section>
  <%@ include file="../home/footer.jsp" %>
</body>
</html>