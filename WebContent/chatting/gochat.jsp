<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#gobtn').hover(function(){
		$(this).css('color','red');
	},function(){
		$(this).css('color','white');
	});
});
</script>
</head>
<body style="background:#f3f2f2;">
<div style="text-align: center; margin-top:20%;">
	<img alt="img" src="../resources/images/chatting/gochaticonTwo.png" style="width:150px; height:140px;"/>
	<br/><h2><b style="color:brown;">EveryFarm</b> 실시간 Talk</h2><br/>
	<input type="button" value="입장하기" id="gobtn" onclick="location.href='../chat.do?command=gochat';" style="background:black; width:300px; height:50px; color:white; font-weight:bold; border-radius:20px;"/>
</div>
</body>
</html>