<%@page import="com.everyfarm.memberMyPage.dto.PagingDto"%>
<%@page import="com.everyfarm.memberMyPage.dto.MyPurchaseListDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%
	PagingDto currentpage = (PagingDto)session.getAttribute("pagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();
	int cPage =currentpage.getCurrentpage(); //상품 페이징
%>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<link href="../resources/css/auction/auctionlist.css"    
     rel="stylesheet"    
     type="text/css" /> 
<title>경매내역</title>
<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;}
	.button{width: 100px; height:30px;}
	td,th{background: white;}
	td{font-weight: normal;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>경매 참가 내역</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>상품번호</th>
	      				<th>경매이름</th>
	      				<th>참여일</th>
	      				<th>종료일</th>
	      				<th>경매상태</th>
	      				<th>가격</th>
	      				<th>결제하기</th>
	      			</tr>
	      		</thead>
	      		<c:if test="${empty myauctionlist }">
	      			<tr>
	      				<td colspan="7">참가한 내역이 없습니다.</td>
	      			</tr>
	      		</c:if>
	      		<c:forEach var="dto" items="${myauctionlist }" >
					<tr>
						<td>${dto.stock_no }</td>
						<td>${dto.stock_name }</td>
						<td><f:formatDate value="${dto.memjoin_regDate }" pattern="yyyy.MM.dd"/></td>
						<td><f:formatDate value="${dto.auc_endDate }" pattern="yyyy.MM.dd"/></td>
						<td>낙찰</td>
						<td> &#8361 ${dto.memjoin_aucPrice }</td>
						<c:choose>
							<c:when test="${dto.pay_no != 0}"><td>결제완료</td></c:when>
							<c:otherwise>
								<td><input type="button" class="button" value="결제하기" 
						              onclick="location.href='../memberMyPage.do?command=order&stock_no=${dto.stock_no}&mem_id=${sessionScope.dto.mem_id }&stock_kg=${dto.stock_kg }'"></td>
							</c:otherwise>
					    </c:choose>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
	 </div>
	</div>
   </div>
     <!-- 페이징 시작 -->            
    <div class="pagination">
<%
   if(pagegroup > 1){
%>   
   <a href="../memberMyPage.do?command=myauctionlist&currentpage=<%=startseq-1 %>&mem_id=${sessionScope.dto.mem_id }" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="../memberMyPage.do?command=myauctionlist&currentpage=<%=pagenum %>&mem_id=${sessionScope.dto.mem_id }" class="pager"><%=pagenum %></a>   
<%
   }
   
   if(endseq < currentpage.getTotalpage()){
%>
   <a href="../memberMyPage.do?command=myauctionlist&currentpage=<%=endseq+1 %>&mem_id=${sessionScope.dto.mem_id }" class="next str">Next</a>
<%      
   }
%>
</div>   
  <!-- 페이징 끝 -->
   <br><br><br><br>
     <%@ include file="../home/footer.jsp" %>
<script type="text/javascript">
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>

</body>
</html>