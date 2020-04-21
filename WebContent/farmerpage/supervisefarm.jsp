<%@page import="com.everyfarm.farmer.fund.dto.PagingDto"%>
<%@page import="com.everyfarm.farmer.farm.dto.FarmDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/farmermypage/paging.css"    
     rel="stylesheet"    
     type="text/css" />
<title>농장 관리</title>
<%
   List<FarmDto> list = (List<FarmDto>)session.getAttribute("supervisefarmlist");

   PagingDto currentpage = (PagingDto)session.getAttribute("supervisepaging");
   int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
   //1
   int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = currentpage.getUnderpagescale() * pagegroup;
   int totalpage = currentpage.getTotalpage();
%>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	
	.box{
	width: 80%; 
	height: 200px;
	border: 0; 
	padding: 30px; 
	margin:0 3em 2em 3em;
	background-color: #ece7e0; 
	border-radius: 10px;
	}
	
	.box table{
	margin: auto;
    width: 100%;
    text-align: center;
	}
	
	.box table thead{
		font-size: 20px;
	}
	.box table tbody{
		font-size: 18px;
	}
	.box h3{
		color: #75582e;
		font-weight: 800;
	}
	#newfarm {
		width: 130px;
		height: 50px;
		border: white;
		border-radius: 50px;
		color: white;
		background-color:#75582e;
		float: right;
		margin-right: 240px;
		font-size: 17px;
	}
</style>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu_fm.jsp" %>
	    <div class="col" >
	    	<h3 style="margin : 3em 3em 0 3em; font-weight: bold; color:#593b10;">${sessionScope.dto.mem_id } 님의 농장</h3>
	    	<input type="button" id="newfarm" value="새 농장 등록" onclick="location.href='../supervisefarm.do?command=registform'"><br><br>
	    	<c:choose>
	    		<c:when test="${empty sessionScope.supervisefarmlist }">
			    	<div class="box">
			      		<span>등록된 농장이 없습니다.</span>
			      	</div>
	      		</c:when>
	      		<c:otherwise>
	      			<c:forEach items="${sessionScope.supervisefarmlist }" var="list">
	      				<div class="box">
							<h3>${list.wfarm_title }</h3>
	      					<table>
	      						<thead>
	      							<tr>
	      								<th>농장 이름</th>
	      								<th>농장 주소</th>
	      								<th>농장 우편번호</th>
	      								<th>총 평수</th>
	      								<th>평당 가격</th>
	      								<th>상태</th>
	      								<th>등록일</th>
	      								<th>임대정보</th>
	      							</tr>
	      						</thead>
	      						<tbody>
	      							<tr>
	      								<td><input type="hidden" value="${list.wfarm_key }">${list.wfarm_title }</td>
	      								<td>${list.wfarm_addr }</td>
	      								<td>${list.wfarm_zoneCode }</td>
	      								<td>${list.wfarm_totalArea }</td>
	      								<td>${list.wfarm_price }</td>
	      								<c:choose>
	      									<c:when test="${list.wfarm_status eq '1' }">
	      									<td>승인대기</td>
	      									</c:when>
				      						<c:when test="${list.wfarm_status eq '2' }">
				      						<td>승인</td>
				      						</c:when>
				      						<c:otherwise>
				      						<td>품절</td>
				      						</c:otherwise>
	      								</c:choose>
	      								<td>${list.wfarm_regDate }</td>
	      								<td><a href="#" class="popupkey">상세보기</a></td>
	      							</tr>
	      						</tbody>
	      					</table>
	      				</div>
	      			</c:forEach>
	      		</c:otherwise>
	      	</c:choose>
	      	
	    
	    <!-- 페이징 시작 -->            
			<div class="pagination">
			<%
			   if(pagegroup > 1){
			%>   
			   <a href="../supervisefarm.do?command=farmdetaillist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
			<%
			   }
			   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
			%>
			   <a href="../supervisefarm.do?command=farmdetaillist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>   
			<%
			   }
			   if(endseq < currentpage.getTotalpage()){
			%>
			   <a href="../supervisefarm.do?command=farmdetaillist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
			<%      
			   }
			%>
			</div>
	    
	   	</div>
	   </div>
	 </div>
	
	
<%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
if(${empty sessionScope.dto.mem_id}){
	alert("로그인이 필요합니다");
	location.href="../home/section.jsp";
}

	$(function(){
		$(".popupkey").click(function(){
			var wfarm_key = $(this).parent().parent().children().first().children().val();
			
			var url = "../supervisefarm.do?command=choosefarm&wfarm_key="+wfarm_key;
			window.open(url, '임대상세', 'width=400px, height=400px;');
		});
	});
</script>
</html>