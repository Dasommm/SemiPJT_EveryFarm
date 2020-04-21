<%@page import="java.io.PrintWriter"%>
<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.board.biz.BoardBizImpl"%>
<%@page import="com.everyfarm.board.biz.BoardBiz"%>
<%@page import="com.everyfarm.chat.Broadsocket"%>
<%@page import="com.everyfarm.board.dto.BoardPagingDto"%>
<%@page import="com.everyfarm.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Q&A</title>

<link href="../resources/css/board/everyboard.css" rel="stylesheet"
	type="text/css">
	
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.js">

$(function () {
	$("#multiDeleteList").submit(function () {
		if($("#multiDeleteList input :checked").length ==0){
			alert("하나 이상 체크해주세요");
			retrun false;
		}
		
	});
	
});

</script>	
	
	
<script type="text/javascript"></script>
<script>
	
	function category() {
		var category = document.getElementById("selectCategory").value;
		if (category == "3") {
			location.href = '../board.do?command=qaCate3&page=1';
		} else if (category == "4") {
			location.href = '../board.do?command=qaCate4&page=1';
		}else if(category =="0"){
			location.href='../board.do?command=qaList&page=1';
		}
	}
	
	function insertPopup() {
		window.open("qaInsert.jsp","","width=800px, height= 650px");
	}
	
	function allchk(bool) {
		var chks = document.getElementsByName("chk"); //node list로 반환된다 [chk,chk,chk,...]
		for(var i = 0; i <chks.length;i++){
			chks[i].checked = bool;			
		}		
	}
</script>


</head>

<%
	MemberDto memDto = (MemberDto)session.getAttribute("dto");
	List<BoardDto> farmerQa = (List<BoardDto>) session.getAttribute("farmerQa");
	BoardPagingDto boardPaging = (BoardPagingDto) session.getAttribute("boardPaging");
	int pagegroup = (int) Math.ceil((double) boardPaging.getCurrentpage() / boardPaging.getPagescale());
	int startpage = boardPaging.getPagescale() * (pagegroup - 1) + 1;
	int endpage = boardPaging.getPagescale() * pagegroup;
	int totalpage = boardPaging.getTotalpage();
%>



<body>

<script type="text/javascript">
onload=function dtoConfirm(){
	if(<%=memDto%> == null){
		alert("로그인이 필요합니다.");
		location.href="../login/loginform.jsp"
	}
}

</script>


	<%@ include file="../home/header.jsp"%>

	<div class="container">
		<div class="container_inner">
			<div class="title">
				<h1>Farmer Q&A</h1>
			</div>
			<div class="selectBox">
				<select id="selectCategory" onchange="category();">
					<option selected="selected">--말머리 선택--</option>
					<%
					if(memDto.getMem_grade()==3){
					%>
					<option value="0">모든글 보기</option>
					<option value="3">회원문의</option>
					<option value="4">농부문의</option>
					<%
					}else{
					%>
					<option value="4">농부문의</option>					
					<%
					}
					%>							
				</select>
				<%
					if(memDto.getMem_grade()==1 || memDto.getMem_grade()==2){
				%>
				<input type="button" value="글쓰기"
					onclick="insertPopup();" class="btn">
				<%
					}
				%>
			
			</div>

			<div class="allList">
			<form action="../board.do?" method="post" id="multiDeleteList">
			<input type="hidden" name="command" value="multiDelete2">
				<table class="board_list">
			<%
				BoardBiz biz = new BoardBizImpl();
				if(memDto.getMem_grade()==3){
			%>
					<colgroup>
						<col style="width: 3%">
						<col style="width: 8%">
						<col style="width: 12%">
						<col style="width: 40%">
						<col style="width: 12%">
						<col style="width: 8%">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" onclick="allchk(this.checked);"></th>
							<th>글번호</th>
							<th>글종류</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>					
			<%
					}else{
			%>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 12%">
						<col style="width: 45%">
						<col style="width: 12%">
						<col style="width: 8%">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>글종류</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
			<%
					}
			%>
					<tbody>
			<%
					for (int i = 0; i < farmerQa.size(); i++) {
			%>

						<tr>
			<%
							if(memDto.getMem_grade()==3){
			%>
							<td><input type="checkbox" name="chk" value="<%=farmerQa.get(i).getBoard_id()%>"></td>
			<%
							}
			%>
							<td><%=farmerQa.get(i).getBoard_id()%></td>
			<%
								String category = null;
									switch (farmerQa.get(i).getBoard_category()) {
									case 3:
										category = "회원문의";
										break;
									case 4:
										category = "농부문의";
										break;
									}
			%>
							<td><%=category%></td>
							<td class="tLeft"><a
								href="../board.do?command=qaDetail&board_id=<%=farmerQa.get(i).getBoard_id()%>"><%=farmerQa.get(i).getBoard_title()%>
									<%
										int replyCnt = biz.replyCnt(farmerQa.get(i).getBoard_id());
											if (replyCnt != 0) {
									%> <span class="reply">[<%=replyCnt%>]</span><%
										}
									%>
									</a></td>
							<td><%=farmerQa.get(i).getMem_id()%></td>
							<td><%=farmerQa.get(i).getBoard_readcnt()%></td>
							<td><%=farmerQa.get(i).getBoard_regdate()%></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			<%
				if(memDto.getMem_grade()==3){
			%>
			<input type="submit" value="삭제하기" class="btn" style="float:left;">
			</form>
			<%
					}
				
			%>
			</div>

			<!--페이징 -->
			<div class="pagination">
				<%
					if (pagegroup > 1) {
				%>
				<a href="../board.do?command=qaCate4&page=<%=startpage - 1%>" class="prevstr">Prev</a>
				<span> <%
					 	}
					 	for (int pagenum = startpage; pagenum <= ((endpage < totalpage) ? endpage : totalpage); pagenum++) {
					 %>
				</span> <a href="../board.do?command=qaCate4&page=<%=pagenum%>" class="pager"><%=pagenum%></a>
				<%
					}
					if (endpage < boardPaging.getTotalpage()) {
				%>
				<a href="../board.do?command=qaCate4&page=<%=endpage + 1%>" class="nextstr">Next</a>
				<%
					}
					
					
				%>

			</div>
		</div>
	</div>

	<%@ include file="../home/footer.jsp"%>

</body>
</html>