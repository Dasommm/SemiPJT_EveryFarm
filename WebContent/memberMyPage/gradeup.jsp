<%@page import="com.everyfarm.member.dto.MemberDto"%>
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
<title>등급관리</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;}
	button{width: 100px; height:30px; float:right;}
</style>
</head>
<body>
<%
	MemberDto mem = (MemberDto)session.getAttribute("mem");
%>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>등급 요청 현황</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>회원등급</th>
	      				<th>이름</th>
	      				<th>승인상태</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
				<c:if test="${empty mem.farmer_status }">
					<tbody>
	      				<tr>
	      					<td colspan="4" align="center">
	      						신청한 내역이 없습니다.
	      					</td>
	      				</tr>
	      			</tbody>
				</c:if>
				<c:if test="${not empty mem.farmer_status}">
					<tbody>
						<tr>
							<td>
								<c:choose>
									<c:when test="${mem.mem_grade eq 1 }">
										회원
									</c:when>
									<c:otherwise>
										농부
									</c:otherwise>
								</c:choose> 
							</td>
							<td>${mem.mem_name }</td>
							<td>
								<c:choose>
									<c:when test="${mem.farmer_status eq 1 }">
										승인대기
									</c:when>
									<c:otherwise>
										승인완료
									</c:otherwise>
								</c:choose> 
							</td>
							<td><f:formatDate value="${mem.farmer_regdate }" pattern="yyyy.MM.dd"/> </td>
						</tr>
					</tbody>
				</c:if>
	      	</table>
	      	<c:if test="${sessionScope.dto.mem_grade == 1 }">
	      	  <button class="button" id="gradeupbtn" >신청하기</button>
	        </c:if>
	      </fieldset>
	     </div>
	    </div>
	   </div>
	   </br></br></br></br></br></br></br></br></br></br>
	   <%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function(){
		$("#gradeupbtn").click(function(){
			if(${not empty mem.farmer_status}){
				alert("신청한 내역이 존재합니다");
			} else{
				location.href='../memberMyPage.do?command=gradeup&mem_id=${sessionScope.dto.mem_id}';
			}
		})
	})
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>
</html>