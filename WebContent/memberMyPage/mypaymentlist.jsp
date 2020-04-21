<%@page import="com.everyfarm.memberMyPage.dto.PagingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>결제/배송내역</title>
<link href="../resources/css/auction/auctionlist.css"    
     rel="stylesheet"    
     type="text/css" /> 
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
	      <h4><strong>결제/배송 내역</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>주문번호</th>
	      				<th>종류</th>
	      				<th>상품명</th>
	      				<th>금액</th>
	      				<th>요청일자</th>
	      				<th>결제상태</th>
	      				<th>상품현황</th>
	      			</tr>
	      		</thead>
	      		<c:if test="${empty mypaymentlist }">
	      			<tr>
	      				<td colspan="7">구매한 내역이 없습니다.</td>
	      			</tr>
	      		</c:if>
				<c:forEach var="dto" items="${mypaymentlist }" >
					<tr>
						<td>${dto.order_no }</td>
						<c:choose>
							<c:when test="${dto.fund_no == 0 }"><td>경매</td></c:when>
							<c:otherwise><td>펀드</td></c:otherwise>
						</c:choose>
						<td>${dto.stock_name }</td>
						<td>&#8361 ${dto.pay_price }</td>
						<td><f:formatDate value="${dto.orderinfo_date }" pattern="yyyy.MM.dd"/></td>
						<c:choose>
							<c:when test="${dto.orderinfo_status ==1}"><td>구매요청</td></c:when>
							<c:when test="${dto.orderinfo_status ==2}"><td>구매완료</td></c:when>
							<c:when test="${dto.orderinfo_status ==3}"><td>환불요청</td></c:when>
							<c:when test="${dto.orderinfo_status ==4}"><td>환불완료</td></c:when>
						</c:choose>
						<c:choose>
							<c:when test="${dto.fund_no != 0 && dto.fund_status ==2}"><td>진행중</td></c:when>
							<c:when test="${dto.fund_no != 0 && dto.fund_status ==3}"><td>완료</td></c:when>
							<c:when test="${dto.fund_no != 0 && dto.fund_status ==4}"><td>배송</td></c:when>
							<c:when test="${dto.auc_no != 0 && dto.auc_status ==2}"><td>진행중</td></c:when>
							<c:when test="${dto.auc_no != 0 && dto.auc_status ==3}"><td>낙찰</td></c:when>
							<c:when test="${dto.auc_no != 0 && dto.auc_status ==4}"><td>배송</td></c:when>
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
   <a href="../memberMyPage.do?command=mypayment&currentpage=<%=startseq-1 %>&mem_id=${sessionScope.dto.mem_id }" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="../memberMyPage.do?command=mypayment&currentpage=<%=pagenum %>&mem_id=${sessionScope.dto.mem_id }" class="pager"><%=pagenum %></a>   
<%
   }
   
   if(endseq < currentpage.getTotalpage()){
%>
   <a href="../memberMyPage.do?command=mypayment&currentpage=<%=endseq+1 %>&mem_id=${sessionScope.dto.mem_id }" class="next str">Next</a>
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