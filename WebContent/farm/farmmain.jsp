<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btn').hover(function(){
		$(this).css('color','red');
	},function(){
		$(this).css('color','white');
	});
});
</script>
<body>
<%@ include file="../home/header.jsp" %>

<img alt="img" src="../resources/images/farm/img01.png" style="width: 50%; height: 450px;">
<img alt="img" src="../resources/images/farm/img02.png" style="width: 50%; height: 450px; float: right;">
<section style="height: 350px; background:black;">
<img alt="img" src="../resources/images/home/header/logo.png" style="margin-left: 48%; margin-top:2%;"/>
<p style="text-align:center; color:white;">일상에서 받는 스트레스로 인해 지쳐있는 여러분에게 기분전환과 자연을 즐길 수 있는 기회를 UP<br/>
이제 복잡한 절차 없이 주말농장에서 신선한 농작물을 수확해보세요 <br/>
바쁜 현대인들을 위해 EveryFarm은 각 주말농장 영역마다 iot기능을 더하였습니다.</p><br/>
<input type="button" id="btn" value="주말농장 신청하기" onclick="location.href='../farm.do?command=farmlist&currentpage=1';" 
	style="
	width: 300px;
    height: 50px;
    background: green;
    color: white;
    font-weight: bold;
    border-radius: 10px;
    font-size: 20px;
    margin-left: 43%;"/>
</section>
<img alt="img" src="../resources/images/farm/img03.png" style="width: 50%; height: 450px;">
<img alt="img" src="../resources/images/farm/img04.png" style="width: 50%; height: 450px; float: right;">

<%@ include file="../home/footer.jsp" %>
</body>
</html>