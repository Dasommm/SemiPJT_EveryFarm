<%@page import="java.util.List"%>
<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.board.dto.BoardDto"%>
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
<title>Everyboard Reply Update</title>

<link href="../resources/css/board/boardDetail.css" rel="stylesheet"
	type="text/css">

<%
	BoardDto boardReplyUpdate = (BoardDto) session.getAttribute("boardReplyUpdate");
	MemberDto memDto = (MemberDto) session.getAttribute("dto");
	List<BoardDto> replyUpdate = (List<BoardDto>) session.getAttribute("replyUpdate");
	int reply_comment_no = (int)session.getAttribute("reply_comment_no");
%>

</head>
<body>

	<%@ include file="../home/header.jsp"%>

	<div class="board_container">
		<div class="board_container_inner">	

	<!-- title 영역 -->
	<%
		String category = null;
		switch (boardReplyUpdate.getBoard_category()) {
			case 1 :
				category = "공지사항";
				break;
			case 2 :
				category = "자유게시판";
				break;
		}
	%>
	
	<span class="title"><%=boardReplyUpdate.getBoard_title()%>
		<span class="subtitle"> | <%=category%></span></span>

	<p class="bsub_info"> <%=boardReplyUpdate.getMem_id()%>
	 | <%=boardReplyUpdate.getBoard_regdate()%> | 조회수 : <%=boardReplyUpdate.getBoard_readcnt()%>
	</p>
	<br>
	
	<!-- body영역 -->
	
	<div class="body_box">
		<%=boardReplyUpdate.getBoard_content()%>
	</div>
	
	<div class="btns">
	<input type="button" value="목록"
		onclick="location.href='../board.do?command=boardList&page=1'">

	<%
		System.out.println(boardReplyUpdate.getMem_id());
		System.out.println(memDto.getMem_id());
	%>
	</div>
	
	<br><hr>

	<%
		
		System.out.print(replyUpdate.size());
		
		
		if (replyUpdate.size() != 0) {
			
			for(int i = 0; i < replyUpdate.size(); i++){	
	%>
	<div class="replyList">
		<%
			if (replyUpdate.get(i).getMem_id().equals(memDto.getMem_id())&& (reply_comment_no == replyUpdate.get(i).getComment_no())) {
		%>
		<form action="../board.do?" method="post">
			<input type="hidden" name = "command" value="boardReplyUpdate">
			<input type="hidden" name ="board_id" value="<%=boardReplyUpdate.getBoard_id()%>">
			<input type="hidden" name="comment_no" value ="<%=replyUpdate.get(i).getComment_no()%>">
			<table>
				<tr>
					<th><%=replyUpdate.get(i).getMem_id()%> | <%=replyUpdate.get(i).getComment_regdate()%></th>
				</tr>
				<tr>
					<td><textarea name="comment_content_update" rows="5" cols="83"><%=replyUpdate.get(i).getComment_content()%></textarea>
					<input class="reply_btn" type="submit" value="댓글 수정">
					</td>
				</tr>
			</table>
		</form>
		<%
			} else {

		%>
		<table>
			<tr>
				<th><%=replyUpdate.get(i).getMem_id()%> | <%=replyUpdate.get(i).getComment_regdate()%></th>
			</tr>
			<tr>
				<td><%=replyUpdate.get(i).getComment_content()%></td>
			</tr>
		</table>
		<%

			}

					
		%>
		<hr>
	</div>
	<%
	
			}
		}
	%>

		</div>
	</div>


	<%@ include file="../home/footer.jsp"%>


</body>
</html>