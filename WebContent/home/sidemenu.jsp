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
  <div class="panel-heading" onclick="location.href='../memberMyPage.do?command=mypage&mem_id=${sessionScope.dto.mem_id}'" style="cursor: pointer;">
   <img alt="img" src="../resources/images/home/header/member.png" 
        style="width:70px; height:70px; border-radius:50px; margin-left: 35%;"/>
    <h3 class="panel-title" align="center">MyPage</h3>
  </div>
<!-- 메뉴목록 -->
  <ul class="list-group" id="sidebar-menu">
   <li class="list-group-item"><a href="#" onclick="location.href='../memberMyPage.do?command=grade&mem_id=${sessionScope.dto.mem_id}'">등급관리</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../memberMyPage.do?command=myfundlist&currentpage=1&mem_id=${sessionScope.dto.mem_id}'">펀드내역</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../memberMyPage.do?command=myauctionlist&currentpage=1&mem_id=${sessionScope.dto.mem_id}'">경매내역</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../memberMyPage.do?command=mypayment&currentpage=1&mem_id=${sessionScope.dto.mem_id}'">결제/배송내역</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../letters.do?command=letters&currentpage=1&mem_id=${sessionScope.dto.mem_id}'">쪽지</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../memberMyPage.do?command=myweekendfarmlist&mem_id=${sessionScope.dto.mem_id}'">나의 주말농장</a></li>
  </ul>
</div>
</div>
</body>
</html>