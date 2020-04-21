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
	PagingDto paging = (PagingDto)session.getAttribute("approvallist_paging");
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
			<h2 style="margin: 40px;">경매승인</h2>
			
			<div style="margin: 40px;">
				<table id="admin_table" class="table table-striped table-bordered">
				<col width="15%">
				<col width="35%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
					<tr>
						<th>아이디</th>
						<th>상품명</th>
						<th>시작가</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>승인</th>
					</tr>
					
					<c:choose>
						<c:when test="${empty approvallist }">
							<tr>
								<td colspan="6">경매 목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${approvallist }" var="dto">
								<tr>
									<td>${dto.mem_id }</td>
									<td>${dto.stock_name }</td>
									<td>${dto.auc_startPrice }</td>
									<td>${dto.auc_regDate }</td>
									<td>${dto.auc_endDate }</td>
									<td>
										<c:choose>
											<c:when test="${dto.auc_status eq 1}">
												<button type="button" class="btn btn-primary"
												onclick="location.href='../admin.do?command=approvalres&no=${dto.auc_no}&pageNumber=<%=currentpage %>'"
												>미등록</button>
											</c:when>
											<c:when test="${dto.auc_status eq 2}">
												<button type="button" class="btn btn-success"
												style="cursor: default;" disabled="disabled"
												onclick="location.href='#'"
												>진행중</button>
											</c:when>
											<c:when test="${dto.auc_status eq 3}">
												<button type="button" class="btn btn-primary" 
												style="background-color: gray; border-color: gray; cursor: default;"
												disabled="disabled">낙찰</button>
											</c:when>										
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
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=startpage-1%>">
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
						<li class="active"><a href="../admin.do?command=auctionapproval&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							} else {
				%>
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							}
						}
					if(endpage < paging.getTotalpage()){						
				%>
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=endpage+1%>">
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