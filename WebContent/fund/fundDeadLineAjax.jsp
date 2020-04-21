<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
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
<%
	FundDto deadLineAjax = (FundDto)session.getAttribute("deadLineAjax");
%>
<body>
	<a><%=deadLineAjax.getDay() %>일 <%=deadLineAjax.getHours() %>시간 <%=deadLineAjax.getMinutes() %>분</a>
</body>
</html>