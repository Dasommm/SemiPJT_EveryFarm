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
<%@ include file="../home/header.jsp" %>
<div class="col-md-2" id="sidebar-wrapper">
<!-- 메뉴 타이틀(optional) -->
<div class="panel panel-info">
  <div class="panel-heading">
    <img alt="img" src="../resources/images/home/header/member.png" style="width:70px; height:70px; border-radius:50px; margin-left: 35%;"/>
    <h3 class="panel-title" style="margin-left: 15%;">AdminMyPage</h3>

  </div>
<!-- 메뉴목록 -->
  <ul class="list-group" id="sidebar-menu">
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerdetail.do?command=applyfund';">펀드신청</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerdetail.do?command=applyauction';">경매신청</a></li>
   <li class="list-group-item"><a href="#">펀드상세</a></li>
   <li class="list-group-item"><a href="#">펀드진행현황</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../letters.do?command=letters&mem_id=${sessionScope.dto.mem_id}'">펀드완료내역</a></li>
   <li class="list-group-item"><a href="#">펀드환불현황</a></li>
   <li class="list-group-item"><a href="#">경매상세</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../dykim.do?command=cur_auclist&currentpage=1';">경매진행현황</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../dykim.do?command=end_auclist&currentpage=1';">경매완료내역</a></li>
     <li class="list-group-item"><a href="#" onclick="location.href='../dykim.do?command=send_history&currentpage=1';">배송내역</a></li>
       <li class="list-group-item"><a href="#">주말농장 관리</a></li>
         <li class="list-group-item"><a href="#" onclick="location.href='../letters.do?command=letters&mem_id=${sessionScope.dto.mem_id}'">쪽지</a></li>
  </ul>
</div>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>