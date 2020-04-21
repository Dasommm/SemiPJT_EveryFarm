<%@page import="java.util.List"%>
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
<%
	List<FundDto> joinMemName =(List<FundDto>)session.getAttribute("joinMemName");
%>
</head>
<body>

<%
	for(int i = 0 ; i<joinMemName.size(); i++){
%>
<a> <%=joinMemName.get(i).getMem_id() %>님  &nbsp;</a>		
<%		
	}
%>

</body>
</html>