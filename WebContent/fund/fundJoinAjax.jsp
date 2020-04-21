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
	FundDto fundJoinAjax = (FundDto)session.getAttribute("fundJoinAjax");
%>
<body>
	<a><%=fundJoinAjax.getFund_join() %></a>
</body>
</html>