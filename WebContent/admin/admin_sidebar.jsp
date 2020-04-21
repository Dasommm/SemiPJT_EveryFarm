<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sidebar-wrapper {
    height: 100%;
    margin-top: 20px;
    margin-left: 20px;
}
#sidebar-menu li:hover{background-color: black;}
</style>
</head>
<body>
<div class="col-md-2" id="sidebar-wrapper">
<!-- 메뉴 타이틀(optional) -->
<div class="panel panel-info">
  <div class="panel-heading" style="text-align: center;">
    <img alt="img" src="../resources/images/home/header/admin.png" style="width:70px; height:70px; border-radius:50px;"/>
    <h3 class="panel-title">Admin<br>MyPage</h3>

  </div>
<!-- 메뉴목록 -->
  <ul class="list-group" id="sidebar-menu">
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=adminmain';">메인화면</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=userlist&pageNumber=1';">회원관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=upgradelist&pageNumber=1';">등업관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=auctionapproval&pageNumber=1';">경매관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=adminfundlist&pageNumber=1';">펀드관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=adminbilllist&pageNumber=1';">주문관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=adminwf&pageNumber=1';">농장관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../admin.do?command=adminaccount';">정산</a></li>
  </ul>
</div>
</div>
</body>
</html>