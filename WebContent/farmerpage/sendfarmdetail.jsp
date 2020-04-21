<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임대 상세</title>
<style type="text/css">
	
	table {
		width: 100%;
	}
	tbody tr {
		height: 40px;
		text-align: center;
	}
	thead tr{
		height: 50px;
		background-color: #a99781;
		color: white;
	}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	
	<table>
		<thead>
			<tr>
				<th>농장 이름</th>
				<th>임차인</th>
				<th>신청일</th>
				<th>분양 평수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty sessionScope.sendfarmdetail}">
				<tr>
					<td colspan=5>---- 분양된 농장이 아닙니다 ----</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${sessionScope.sendfarmdetail}" var="list">
					<tr>
						<td>${list.wfarm_title }</td>
						<td>${list.mem_id }</td>
						<td>${list.mf_regdate }</td>
						<td>${list.count }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	
	</table>
</body>
</html>