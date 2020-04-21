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
  <div class="panel-heading">
    <img alt="img" src="../resources/images/home/header/farmer.png" style="width:70px; height:70px; border-radius:50px; margin-left: 35%;"/>
    <h3 class="panel-title" style="margin-left: 15%;">FarmerMyPage</h3>

  </div>
<!-- 메뉴목록 -->
  <ul class="list-group" id="sidebar-menu">
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerfunddetail.do?command=applyfund';">펀드신청</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerfunddetail.do?command=applyauction';">경매신청</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerfunddetail.do?command=cur_fundlist&currentpage=1';">펀드진행현황</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerfunddetail.do?command=end_fundlist&currentpage=1';">펀드완료내역</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerfunddetail.do?command=fundrefundlist&currentpage=1';">펀드환불현황</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerauctiondetail.do?command=cur_auclist&currentpage=1';">경매진행현황</a></li>
   <li class="list-group-item"><a href="#" onclick="location.href='../farmerauctiondetail.do?command=end_auclist&currentpage=1';">경매완료내역</a></li>
     <li class="list-group-item"><a href="#" onclick="location.href='../farmerauctiondetail.do?command=send_history&currentpage=1';">배송내역</a></li>
       <li class="list-group-item"><a href="#" onclick="location.href='../supervisefarm.do?command=farmdetaillist&currentpage=1'">주말농장 관리</a></li>
         <li class="list-group-item"><a href="#" onclick="location.href='../letters.do?command=letters&mem_id=${sessionScope.dto.mem_id}'">쪽지</a></li>
  </ul>
</div>
</div>
</body>
</html>