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
<title>Everyboard Update</title>

<link href="../resources/css/board/boardInput.css" rel="stylesheet"
	type="text/css">


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>


<!-- 썸머노트 실행 -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height :400,
			width:700,
			focus: true,
			
			callbacks:{
				onImageUpload: function(files, editor, welEditable){
					alert(files);
					alert(editor);
					alert(welEditable);
					for(var i = 0; i<files.length; i++){
						sendFile(files[i], this);
					}
				}
			}
			
		});
	});
	
	function sendFile(file, el){
		var form_data = new FormData();
		form_data.append('file',file);
		$.ajax({
			data: form_data,
			type:"POST",
			url : '../board.do?command=imageUpload',
			cache: false,
			contentType: false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url){
				$(el).summernote('insertImage',url);
			}
		})
	}
</script>
<%
	MemberDto mem_dto = (MemberDto)session.getAttribute("dto");
	BoardDto boardDetail = (BoardDto) session.getAttribute("boardDetail");
%>
<script type="text/javascript">

onload=function keepSelect(){
	document.getElementById("keepSelect").value = <%=boardDetail.getBoard_category()%>;
	for(var i =0; i <document.getElementById("keepSelect").value; i++){
		if(document.getElementById("keepSelect")[i].value==<%=boardDetail.getBoard_category()%>){
			document.getElementById("keepSelect")[i].selected ="true";
		}
	}
}

</script>

</head>
<body>


<div class="container">
	<div class="container_inner">
		<div class="title">
			<br>
			<h3>글수정</h3>
		</div>
		<div class="inputBody">
		<form action="../board.do?" method="post">
			<input type="hidden" name="command" value="boardUpdateDb"> 
			<input type="hidden" name="board_id" value="<%=boardDetail.getBoard_id()%>">
			<select required="required" name="board_category" id="keepSelect">
				<%
				if(mem_dto.getMem_grade()==1 || mem_dto.getMem_grade()==2){
				%>
				<option value ="2">자유게시판</option>
				<%	
				}else{
				%>	
				<option value="1">공지사항</option>
				<option value="2">자유게시판</option>	
				<%	
				}
				%>
			</select> 
			<input type="text" name="board_title"
				value="<%=boardDetail.getBoard_title()%>">

			<!-- 글내용 -->
			<textarea id="summernote" name="board_content"><%=boardDetail.getBoard_content() %></textarea>
			<input type="submit" value="확인"> 
			<input type="button" value="취소" onclick="self.close();">
		</form>
	</div>

	</div>
</div>

</body>
</html>