<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>    <!-- 아이디/비밀번호 찾기 페이지 -->
</head>
<body>
<%@ include file="../home/header.jsp" %>
<section style="height:1000px;     background: #dedede;">
<link href="../resources/css/login/searchaccount.css"
	  rel="stylesheet"
	  type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<fieldset style="width:50%;height:35%; margin:0% 0% 0% 25%">	  
<img alt="img" src="../resources/images/login/searchicon.ico" style="margin-left: 40%;"/>
<br/>
<div class="contents" style=" font-weight:bold; margin-left: 30%;">
<p style="margin-left:10%; color:black;">아이디, 비밀번호 찾기 페이지 입니다.</p>
<p style="margin-left:-5%;; color:black;">정보 입력 후, 이메일로 발송되는 아이디, 비밀번호를 확인해 주십시오.</p> 
</div>
</fieldset>
<div class="login" style="margin: 10px 0px 0px 550px;">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Search for Id</h2>

  <form class="login-container" action="../login.do" method="post">
    <input type="hidden" name="command" value="searchId"/>
    <p>이름 :<input type="text" name="mem_name" value=""/></p>
    <p>이메일:<input type="email" name="mem_email" value=""/></p>
    <p>전화번호:<input type="text" name="mem_phone" value=""/></p>
    
    <input type="submit" value="아이디 찾기"/>
  </form>
</div>

<div class="login" style="margin: -520px 0px 0px 1000px;">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Search for Password</h2>

  <form class="login-container" action="../login.do" method="post">
    <input type="hidden" name="command" value="searchPw"/>
    <p>아이디:<input type="text" name="mem_id" value=""/></p>
    <p>이름:<input type="text" name="mem_name" value=""/></p>
    <p>이메일:<input type="email" name="mem_email" value=""/></p>
    <p>전화번호:<input type="text" name="mem_phone" value=""/></p>
    
    	<input type="submit" value="비밀번호 찾기"/>
  </form>
</div>

</section>
<%@ include file="../home/footer.jsp" %>

</body>
</html>