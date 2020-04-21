<%@page import="com.everyfarm.product.dto.ProductDto"%>
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
	ProductDto dto = (ProductDto)session.getAttribute("curBestRank");
%>
<body>
<span style="color:#ffc9b5; cursor:pointer;" onclick="location.href='../product.do?command=auctiondetail&auc_no=<%=dto.getAuc_no()%>';"><%=dto.getStock_name() %>
(<%=dto.getStock_kg() %>kg)&nbsp;
현재 최고가:&nbsp;&nbsp;<span style="color:red; font-weight:bold;"><%=dto.getAuc_nowPrice() %>원</span>
&nbsp;입찰:&nbsp;&nbsp;<span style="color:red; font-weight:bold;"><%=dto.getAuc_join() %>건</span></span>
</body>
</html>