<%@page import="com.everyfarm.admin.dto.PagingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
    <link rel="stylesheet" href="../resources/css/admin/admin.css">   
	<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="../resources/js/admin/bootstrap.js"></script>

<%
	PagingDto paging = (PagingDto)session.getAttribute("adminfundlist_paging");
	int pagegroup = (int)Math.ceil((double)paging.getCurrentpage()/paging.getPagescale()); 
	int startpage = paging.getPagescale()*(pagegroup-1)+1;
	int endpage = paging.getPagescale()*pagegroup;
	int totalpage = paging.getTotalpage();
	int currentpage = paging.getCurrentpage();
%>

<body>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	<div class="row">
	<%@ include file="admin_sidebar.jsp" %>
		<div class="col" >
			
		<!-- 바디 -->
		<div class="section_content">
			<h2 style="margin: 40px;">펀드관리</h2>
			
			<div style="margin: 40px;">
				<table id="admin_table" class="table table-striped table-bordered">
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
					<tr>
						<th>펀드번호</th>
						<th>상품번호</th>
						<th>현재액</th>
						<th>목표액</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>참여인원</th>
						<th>펀드상태</th>
					</tr>
					<c:choose>
						<c:when test="${empty adminfundlist }">
							<tr>
								<td colspan="8">펀드 목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${adminfundlist }" var="dto">
								<tr>
									<td>${dto.fund_no }</td>
									<td>${dto.stock_no }</td>
									<td>${dto.fund_currentprice }</td>
									<td>${dto.fund_price }</td>
									<td>${dto.fund_regDate }</td>
									<td>${dto.fund_endDate }</td>
									<td>${dto.fund_join }</td>
									<td>
										<c:choose>
											<c:when test="${dto.fund_status eq 1}">
												<button type="button" class="btn btn-primary"
												onclick="location.href='../admin.do?command=adminfundres&no=${dto.fund_no}&pageNumber=<%=currentpage %>'"
												>미등록</button>
											</c:when>
											<c:when test="${dto.fund_status eq 2}">
												<button type="button" class="btn btn-success"
												style="cursor: default;" disabled="disabled"
												onclick="location.href='#'"
												>진행중</button>
											</c:when>
											<c:when test="${dto.fund_status eq 3}">
												<button type="button" class="btn btn-primary" 
												style="background-color: gray; border-color: gray; cursor: default;"
												disabled="disabled">완료</button>
											</c:when>										
											<c:when test="${dto.fund_status eq 4}">
												<button type="button" class="btn btn-primary" 
												style="background-color: gray; border-color: gray; cursor: default;"
												disabled="disabled">배송</button>
											</c:when>	
											<c:otherwise>
												<c:out value="오류"></c:out>
											</c:otherwise>										
										</c:choose>
									</td>
								</tr>								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
				<!-- 페이징 영역 -->
				<div align="center">
				<ul class="pagination" style="margin: 0 auto; display: inline-block;">
				<%
					if(pagegroup!=1){
				%>							
						<li><a href="../admin.do?command=adminfundlist&pageNumber=<%=startpage-1%>">
						<span class="glyphicon glyphicon-chevron-left">&lt;</span></a></li>
				<%
					} else if(pagegroup==1){
				%>
						<li><span style="color: gray;">&lt;</span></li>
				<%	
					}
					for(int pagenum = startpage; pagenum <= ((endpage<totalpage)?endpage:totalpage); pagenum++){
						if(paging.getCurrentpage()==pagenum){					
				%>					
						<li class="active"><a href="../admin.do?command=adminfundlist&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							} else {
				%>
						<li><a href="../admin.do?command=adminfundlist&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							}
						}
					if(endpage < paging.getTotalpage()){				
				%>
						<li><a href="../admin.do?command=adminfundlist&pageNumber=<%=endpage+1%>">
						<span class="glyphicon glyphicon-chevron-right">&gt;</span></a></li>
				<%
					} else {
				%>
						<li><span style="color: gray;">&gt;</span></li>
				<%
					}
				%>
				</ul>
				</div>	
			</div>
	    	
	    	</div>
	    
		</div>
	</div>
</div>
	
	
<%@ include file="../home/footer.jsp" %>
</body>
<script src="../resources/js/admin/admin.js"></script>
<script type="text/javascript">
/* 	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../home/section.jsp";
	} */
</script>
</html>