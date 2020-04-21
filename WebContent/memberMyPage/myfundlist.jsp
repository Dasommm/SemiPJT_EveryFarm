<%@page import="com.everyfarm.memberMyPage.dto.PagingDto"%>
<%@page import="com.everyfarm.memberMyPage.dto.MyPurchaseListDto"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<link href="../resources/css/auction/auctionlist.css"    
     rel="stylesheet"    
     type="text/css" /> 
<title>펀드내역</title>
<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;}
	.button{width: 100px; height:30px;}
	td,th{background: white;}
	td{font-weight: normal;}
	#stockname{color:black;}
	#stockname:hover{text-decoration: underline;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>펀드 투자 내역</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>펀드번호</th>
	      				<th>펀드이름</th>
	      				<th>펀드상태</th>
	      				<th>참여액수</th>
	      				<th>참여일</th>
	      				<th>취소</th>
	      			</tr>
	      		</thead>
	      		<c:if test="${empty myfundlist }">
	      			<tr>
	      				<td colspan="6">구매한 내역이 없습니다.</td>
	      			</tr>
	      		</c:if>
				<c:forEach var="dto" items="${myfundlist }" >
					<tr>
						<td>${dto.fund_no }</td>
						<td><a id="stockname" href="../fund.do?command=fundDetail&stock_no=${dto.stock_no }">${dto.stock_name }</a></td>
						<c:choose>
							<c:when test="${dto.fund_status == 2 }"><td>진행중</td></c:when>
							<c:otherwise><td>완료</td></c:otherwise>
						</c:choose>
						<td>&#8361 ${dto.memjoin_fundPrice }</td>
						<td><f:formatDate value="${dto.memjoin_regDate }" pattern="yyyy.MM.dd"/></td>
						<c:choose>
							<c:when test="${dto.fund_status == 2 && dto.orderinfo_status == 2 || dto.orderinfo_status == 1}">
								<td><input type="button" class="button" value="취소하기" 
							     onclick="location.href = '../memberMyPage.do?command=refund&order_no=${dto.order_no}'"></td>
							</c:when>
							<c:when test="${dto.orderinfo_status == 3 }">
								<td>환불신청</td>
							</c:when>
							<c:when test="${dto.orderinfo_status == 4 }">
								<td>환불완료</td>
							</c:when>
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
   <a href="../memberMyPage.do?command=myfundlist&currentpage=<%=startseq-1 %>&mem_id=${sessionScope.dto.mem_id }" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="../memberMyPage.do?command=myfundlist&currentpage=<%=pagenum %>&mem_id=${sessionScope.dto.mem_id }" class="pager"><%=pagenum %></a>   
<%
   }
   
   if(endseq < currentpage.getTotalpage()){
%>
   <a href="../memberMyPage.do?command=myfundlist&currentpage=<%=endseq+1 %>&mem_id=${sessionScope.dto.mem_id }" class="next str">Next</a>
<%      
   }
%>
</div>   
  <!-- 페이징 끝 -->
  <%@ include file="../home/footer.jsp" %>
<script type="text/javascript">
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>

</body>
</html>