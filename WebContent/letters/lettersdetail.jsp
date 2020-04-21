<%@page import="com.everyfarm.letters.dto.LettersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//int index = Integer.parseInt(request.getParameter("index"));
	LettersDto lettersdetail = (LettersDto)session.getAttribute("lettersdetail");
	String mem_id_letter = (String)session.getAttribute("mem_id_letter");
%>
<style type="text/css">
   body{background:white;margin:0}
.form{width: 450px;
    height: 600px;
    background: white;border-radius:8px;box-shadow:0 0 40px -10px #000;margin: calc(50vh - 350px) auto;padding:20px 30px;max-width:calc(100vw - 40px);
    box-sizing:border-box;font-family:'Montserrat',sans-serif;position:relative;}
h2{margin:10px 0;padding-bottom:10px;width:180px;color:#78788c;border-bottom:3px solid #78788c}
input{width:100%;padding:10px;box-sizing:border-box;background:none;outline:none;resize:none;border:0;font-family:'Montserrat',sans-serif;transition:all .3s;border-bottom:2px solid #bebed2}
input:focus{border-bottom:2px solid #78788c}
p:before{content:attr(type);display:block;margin:28px 0 0;font-size:17px;color:#5a5a5a}
button{float:right;padding:8px 12px;margin:8px 0 0;font-family:'Montserrat',sans-serif;border:2px solid #78788c;background:0;color:#5a5a6e;cursor:pointer;transition:all .3s}
button:hover{background:#78788c;color:#fff}
div{content:'Hi';position:absolute;bottom:-15px;right:-20px;background:#50505a;color:#fff;width:320px;padding:16px 4px 16px 0;border-radius:6px;font-size:13px;box-shadow:10px 10px 40px -14px #000}
span{margin:0 5px 0 15px}
#sender,#title,#content{ font-size:16px; }
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
<form class="form" >
  <h2>쪽지상세</h2>
	  <p type="보낸사람:"><input id="sender" name="letter_sender" value="${lettersdetail.letter_sender }" readonly="readonly" style="width:155px;"></p>
	  <p type="제목:"><input id="title" name="letter_title" value="${lettersdetail.letter_title }" readonly="readonly"></input></p>
	  <p type="내용:"><textarea id="content" name="letter_content" readonly="readonly" style="width: 380px; height: 200px; border-radius:10px;">${lettersdetail.letter_content }</textarea></p>
	  <button type="button" onclick="location.href='../letters/replyletters.jsp'">답장하기</button>
</form>
<script type="text/javascript">
$(document).ready(function(){
	window.opener.location.href = "../letters.do?command=letters&mem_id=<%=mem_id_letter %>";
})
	
</script>
</body>
</html>