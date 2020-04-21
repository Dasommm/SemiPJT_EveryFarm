<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.button{margin-left: 140px;}
</style>
</head>
<link rel="stylesheet" href="../resources/css/membermypage/memberdelete.css">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<body>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	 <div class="form-wrap">
			      <div class="form-wrap-inn">
			          <div class="frame">
			              <div class="form-content">
			                  <div class="header">
			                      <i class="fa fa-eye"></i>
			                      <h2>회원탈퇴</h2>
			                      <p>비밀번호를 다시 입력해주세요</p>
			                  </div>
			                  <div class="delete-form">
			                      <form action="" class="form">
			                        <div class="form-group">
			                          <input id="color" class="form-input" type="password" placeholder="Password">
			                        </div>
			                          <input type="button" class="button" value="확인" onclick="pwChk();"  >
			                      </form>
					              </div>
					          </div>
					      </div>
					   </div>
				    </div>
				  </div>
		   </div>
</div>
 <br><br><br><br><br><br><br><br><br><br><br><br>
     <%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
	function pwChk(){
		if($("#color").val() == ${sessionScope.dto.mem_pw}){
			location.href="../memberMyPage.do?command=memberdeleteres&mem_id=${sessionScope.dto.mem_id}";
		} else{
			alert("비밀번호가 틀렸습니다.");
		}
	}
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>
</html>