<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/farmermypage/buttonstyle.css">
<title>농부 마이페이지</title>
</head>

<style type="text/css">
   .hcolor{
      color: #593b10;
      font-weight: bold;
      margin-bottom: 12px;
   }
   .box{
   width: 550px; 
   height: 300px;
   border: 0; 
   padding:30px; 
   margin:50px 30px 50px 30px;
   background-color: #ece7e0; 
   border-radius: 10px;
   float:left;   }
   
   .box2{
   width: 550px; 
   height: 300px;
   border: 0; 
   padding: 30px; 
   margin:0px 30px 50px 30px;
   background-color: #ece7e0; 
   border-radius: 10px;
   float:left;   }
   
   .button{margin-right: 10px; margin-top: 10px;}
   
   #profiledetail h5 {
      display: inline-block; 
      font-weight: bold;
      margin: 10px;}
   
   .table thead tr th{
      text-align: center;
      padding: 5px;
   }
   
   .table tbody tr td{
      text-align: center;
      padding: 5px;
      color:#7d7770;
   }
   
   #profiledetail{
      margin: 30px;
   }
   #profiledetail span{
      margin: 10px;
      
   }
   .detailcount{
      font-weight: bold;
   }
   
</style>
<body>
<%@ include file="../home/header.jsp" %>
   <div class="container-fluid">
     <div class="row">
     <%@ include file="../home/sidemenu_fm.jsp" %>
       <div class="col" >
          <div class="box">
            <h4 class="hcolor">나의 프로필</h4>
            <div style="margin-top: 20px;">
            <img alt="프로필이미지" src="../resources/images/home/header/member.png" style="border-radius:50px; width:100px; height:100px; margin:20px; float:left;">
              <div id="profiledetail">
                 <h5>${sessionScope.dto.mem_id } </h5>님<br>
                  <span>진행 중 경매 <a class="detailcount" style="color: #9b7d52;">${sessionScope.runstandby.runningauc }</a>건</span>
                  <span>승인대기 경매 <a class="detailcount" style="color: #9b7d52;"> ${sessionScope.runstandby.standbyauc }</a>건</span><br>
                  <span>진행 중 펀드 <a class="detailcount" style="color: #9b7d52;">${sessionScope.runstandby.runningfund }</a>건</span>
                  <span>승인대기 펀드 <a class="detailcount" style="color: #9b7d52;">${sessionScope.runstandby.standbyfund }</a>건</span>
               </div>
           </div>
            </div>
         <div class="box">
         <h4 class="hcolor">농장 신청 내역</h4>
            <table class="table">
               <thead>
                  <tr>
                     <th>농장이름</th>
                     <th>신청인</th>
                     <th>평수</th>
                     <th>신청일</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
                  <c:when test="${empty sessionScope.farmapplylist}">
                     <tr>
                        <td colspan="4" align="center">신청내역이 없습니다</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${sessionScope.farmapplylist }" var="dto" begin="0" step="1">
                        <tr>
                           <td>${dto.wfarm_title }</td>
                           <td>${dto.mem_id }</td>
                           <td>${dto.count} </td>
                           <td>${dto.mf_regdate }</td>
                        </tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
               </tbody>
            </table>
         </div>
         
       <div class="box2">
         <h4 class="hcolor">펀드, 경매 내역</h4>
          <table class="table">
               <thead>
                  <tr>
                     <th>종류</th>
                     <th>상품명</th>
                     <th>참여자</th>
                     <th>구매액</th>
                     <th>신청일</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
                  <c:when test="${empty sessionScope.recentorderlist}">
                     <tr>
                        <td colspan="5" align="center">최근 주문 내역이 없습니다</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${sessionScope.recentorderlist }" var="list">
                     <tr>
                        <c:choose>
                           <c:when test="${list.orderinfo_kind eq 1 }">
                           <td>펀드</td>
                           </c:when>
                           <c:otherwise>
                           <td>경매</td>
                           </c:otherwise>
                        </c:choose>
                        <td>${list.stock_name }</td>
                        <td>${list.mem_id }</td>
                        <td>${list.pay_price }</td>
                        <td>${list.orderinfo_date }</td>
                     </tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
               </tbody>
            </table>
       </div>
       
       <div class="box2">
        <h4 class="hcolor">환불요청</h4>
         <table class="table">
               <thead>
                  <tr>
                     <th>주문번호</th>
                     <th>상품이름</th>
                     <th>구매액</th>
                     <th>요청자</th>
                     <th>환불요청일</th>
                  </tr>
               </thead>
            </table>
            <tbody>
               <c:choose>
                  <c:when test="${empty sessionScope.recentrefund}">
                     <tr>
                        <td colspan="5" align="center">&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 환불요청 내역이 없습니다</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${sessionScope.recentrefund }" var="rf">
                     <tr>
                        <td>${rf.order_no }</td>
                        <td>${rf.stock_name }</td>
                        <td>${rf.pay_price }</td>
                        <td>${rf.mem_id }</td>
                        <td>${rf.orderinfo_date }</td>
                     </tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
              </tbody>
       </div>
       
             </div>
        </div>
     </div>
   
   
<%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
if(${empty sessionScope.dto.mem_id}){
   alert("로그인이 필요합니다");
   location.href="../home/section.jsp";
}
</script>
</html>