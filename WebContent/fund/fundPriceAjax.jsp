<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
FundDto priceAjax = (FundDto)session.getAttribute("fundPriceAjax");
%>
</head>
<body>
<a><fmt:formatNumber value="<%=priceAjax.getFund_currentprice() %>" type="number"/></a>
</body>
</html>