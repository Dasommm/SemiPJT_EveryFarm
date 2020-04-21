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
<title>Everyboard Detail</title>

<link href="../resources/css/board/boardDetail.css" rel="stylesheet"
	type="text/css">

<%
	BoardDto boardDetail = (BoardDto) session.getAttribute("boardDetail");
	MemberDto memDto = (MemberDto) session.getAttribute("dto");
	List<BoardDto> boardReplyAll = (List<BoardDto>) session.getAttribute("boardReplyAll");
%>

<script type="text/javascript">
	function deleteConfirm() {
		if(confirm("삭제하시겠습니까?")){
			location.href='../board.do?command=boardDelete&board_id=<%=boardDetail.getBoard_id()%>';
		}
	}
	
	function updatePopup() {
		window.open("everyboardUpdate.jsp","","width=800px, height=650px");
	}
</script>


</head>
<body>

	<%@ include file="../home/header.jsp"%>


	<div class="board_container">
		<div class="board_container_inner">

			<!-- title 역역 -->

			<%
				String category = null;
				switch (boardDetail.getBoard_category()) {
					case 1 :
						category = "공지사항";
						break;
					case 2 :
						category = "자유게시판";
						break;
				}
			%>
			<span class="title"><%=boardDetail.getBoard_title()%>
				<span class="subtitle"> | <%=category%></span></span>

			<p class="sub_info"><%=boardDetail.getMem_id()%>
				|
				<%=boardDetail.getBoard_regdate()%>
				| 조회수 :
				<%=boardDetail.getBoard_readcnt()%></p>

			<hr>
			<!-- body 영역 -->

			<div class="body_box"><%=boardDetail.getBoard_content()%></div>

			<div class="btns">
			<input type="button" value="목록"
				onclick="location.href='../board.do?command=boardList&page=1'">

			<%
				System.out.println(boardDetail.getMem_id());
				System.out.println(memDto.getMem_id());

				if (boardDetail.getMem_id().equals(memDto.getMem_id())) {
			%>
			<input type="button" value="수정하기" onclick="updatePopup();">
			<input type="button" value="삭제하기" onclick="deleteConfirm();">
			<%
				} else if (memDto.getMem_grade() == 3) {
			%>
			<input type="button" value="삭제하기" onclick="deleteConfirm();">
			<%
				}
			%>
			</div>
			
			<br><hr>
			<%
				if (boardDetail.getBoard_category() != 1) {
			%>
			

			<!-- 댓글 입력 영역 -->
			<div class="boardReply">
				<form action="../board.do?command=boardReply" method="post">
					<input type="hidden" name="mem_id_reply" value="<%=memDto.getMem_id()%>"> 
					<input type="hidden" name="board_id_reply" value="<%=boardDetail.getBoard_id()%>">
					<textarea name="comment_content" rows="5" cols="83"
						placeholder="댓글을 입력하세요"></textarea>
					<input class="reply_btn" type="submit" value="댓글 등록">
				</form>
			</div>

			<!-- 달린 댓글 보기 영역 -->
			<%
				}
				if (boardReplyAll.size() != 0) {
			%>
			<div class="replyList">
				<%
					for (int i = 0; i < boardReplyAll.size(); i++) {
				%>
				<table class="reply_table">
					<tr>
						<th><%=boardReplyAll.get(i).getMem_id()%> | <%=boardReplyAll.get(i).getComment_regdate()%></th>
					</tr>
					<tr>
						<td><%=boardReplyAll.get(i).getComment_content()%></td>
					</tr>
				</table>

				
				<%
				//내 댓글 수정하기
					if (memDto.getMem_id().equals(boardReplyAll.get(i).getMem_id())) {
				%>
				<input type="button" value="수정"
					onclick="location.href='../board.do?command=boardReplyUpdatePage&board_id=<%=boardDetail.getBoard_id()%>&comment_no=<%=boardReplyAll.get(i).getComment_no()%>'">
				<input type="button" value="삭제" onclick="location.href='../board.do?command=boardReplyDelete&board_id=<%=boardDetail.getBoard_id()%>&comment_no=<%=boardReplyAll.get(i).getComment_no()%>'">
				<%
					} else if (memDto.getMem_grade() == 3) {
				%>
				<input type="button" value="삭제" onclick="location.href='../board.do?command=boardReplyDelete&board_id=<%=boardDetail.getBoard_id()%>&comment_no=<%=boardReplyAll.get(i).getComment_no()%>'">				
				


				<%
					}
				%>

				<hr>
				<%
					}
				%>
			</div>
			<%
				}
			%>
			
		</div>
	</div>

	<%@ include file="../home/footer.jsp"%>


</body>
</html>