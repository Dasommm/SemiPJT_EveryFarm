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
@font-face{
		font-family: "Goyang";
		src: url("../resources/css/goyang/Goyang.ttf") format("truetype");  /* 고양체 파일 불러오기 */
	}
	.goyang{
		font-family: "Goyang";
	}
</style>
</head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.imgAll').hover(function(){
		$(this).css('background','gray');
	},function(){
		$(this).css('background','#dedbdb');
	});
});
</script>
<body>
<%@ include file="../home/header.jsp" %>
<img alt="img" src="../resources/images/faqgo/faqgo.jpg" style="width:50%; height:350px; float:left;"/>
<img alt="img" src="../resources/images/faqgo/faqbanner.jpg" style="width:50%; height:350px; float:right;"/><br/>
<section style="height: 800px; background:#2f1208;">
<img alt="img" src="../resources/images/faqgo/faqbackground.jpg" style="width:100%; height:70%;"/>

<a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">
<img class="imgAll" alt="img" src="../resources/images/faqgo/userfaq.png" style="width:15%; height:250px; margin: -28% 0% 0% 25%; background:#dedbdb; border-radius:5px; cursor:pointer;"/>
</a><br/>

<a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">
<img class="imgAll" alt="img" src="../resources/images/faqgo/farmerfaq.png" style="width:15%; height:250px; margin: -32.3% 0% 0% 60%; background:#dedbdb; border-radius:5px; cursor:pointer;"/>
</a><br/>

<div class="goyang" style="    color: black; font-weight:bold; font-size:26px;     margin: -26% 0% 0% 30.5%;">
	<span class="goyang"><a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">회원 FAQ</a></span>
	<span class="goyang" style="margin-left: 43%;"><a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">농부 FAQ</a></span>
</div>
</section>
<%@ include file="../home/footer.jsp" %>
</body>
</html>