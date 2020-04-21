<%@page import="com.everyfarm.memberMyPage.dto.MyFarmListDto"%>
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
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<title>마이페이지</title>
<%
	List<MyFarmListDto> farmlist = (List<MyFarmListDto>)session.getAttribute("myfarmlist");
%>
</head>

<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;	}
	.button{margin-right: 10px; margin-top: 10px; font-size: 15pt;}
</style>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>나의 프로필</strong></h4>
	      <img alt="프로필이미지" src="../resources/images/home/header/member.png" style="border-radius:50px; width:100px; height:100px; margin: 15px; margin-right:30px; float: left;">
	      <div style="font-size: 20pt; font-weight: bold; margin-left: 35px;">${sessionScope.dto.mem_id }님</div>
	        <div class="wrap">
	        <a href="#" class="button" onclick="location.href='../letters.do?command=letters&currentpage=1&mem_id=${sessionScope.dto.mem_id}';">쪽 지</a><br/>
	      	<a href="#" class="button" onclick="location.href='../memberMyPage.do?command=myinfo&mem_id=${sessionScope.dto.mem_id}';">내정보 보기</a><br/>
	      	<a href="#" class="button" onclick="location.href='../memberMyPage.do?command=memberdelete';">회원탈퇴</a>
	        </div>
	      </fieldset>
	      <fieldset class="box">
	      <h4>농장 신청 내역</h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>농장이름</th>
	      				<th>분양받은 땅</th>
	      				<th>주소</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
<%
			if(farmlist.size() == 0){
%>
					<tr>
						<td colspan="4">신청한 내역이 없습니다.</td>
					</tr>
<%
			} else{
				for(int i=0; i< 3; i++){
%>	
					<tr>
						<td><%=farmlist.get(i).getWfarm_title() %></td>
						<td><%=farmlist.get(i).getMf_area() %>번</td>
						<td><%=farmlist.get(i).getWfarm_addr() %></td>
						<td><f:formatDate value="<%=farmlist.get(i).getMf_regDate() %>" pattern="yyyy.MM.dd"/></td>
					</tr>
<%
				}
			}
%>
	      	</table>
	      </fieldset>
	       <hr/>
	    <fieldset class="box">
	      <h4>펀드 내역</h4>
	       <table class="table">
	      		<thead>
	      			<tr>
	      				<th>펀드번호</th>
	      				<th>이름</th>
	      				<th>상태</th>
	      				<th>가격</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
	      		<c:if test="${empty myfundlist }">
	      			<tr>
	      				<td colspan="5">구매한 내역이 없습니다.</td>
	      			</tr>
	      		</c:if>
	      		<c:forEach var="dto" items="${myfundlist }" begin="0" end="2">
					<tr>
					    <td>${dto.fund_no }</td>
						<td>${dto.stock_name }</td>
						<c:choose>
							<c:when test="${dto.fund_status == 2}"><td>진행중</td></c:when>
							<c:when test="${dto.fund_status == 3}"><td>완료</td></c:when>
							<c:otherwise><td>배송</td></c:otherwise>
						</c:choose>
					    <td>&#8361 ${dto.memjoin_fundPrice }</td>
						<td><f:formatDate value="${dto.memjoin_regDate }" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
	      	</table>
	    </fieldset>
	    <hr/>
	    <fieldset class="box">
	     <h4> 경매 내역</h4>
	      <table class="table">
	      		<thead>
	      			<tr>
	      				<th>번호</th>
	      				<th>이름</th>
	      				<th>상태</th>
	      				<th>가격</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
	      		<c:if test="${empty myauctionlist }">
	      			<tr>
	      				<td colspan="5">구매한 내역이 없습니다.</td>
	      			</tr>
	      		</c:if>
	      		<c:forEach var="dto" items="${myauctionlist }" begin="0" end="2">
					<tr>
					    <td>${dto.stock_no }</td>
						<td>${dto.stock_name }</td>
						<c:choose>
							<c:when test="${dto.auc_status == 2}"><td>진행중</td></c:when>
							<c:when test="${dto.auc_status == 3}"><td>낙찰</td></c:when>
							<c:otherwise><td>배송</td></c:otherwise>
						</c:choose>
					    <td>&#8361 ${dto.memjoin_aucPrice }</td>
						<td><f:formatDate value="${dto.memjoin_regDate }" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
	      	</table>
	    </fieldset>
	    
	   		 </div>
	     </div>
	  </div>
	
	
<%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>
</html>