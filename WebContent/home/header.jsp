<%
   //브라우저가 캐시에 화면(응답된 도큐먼트) 저장하지 않도록 설정
   //로그아웃 시 페이지가 넘어가지 않도록 설정하는 방법
   response.setHeader("Pragma", "no-cache");         // http 1.0
   response.setHeader("Cache-control", "no-store");  // http 1.1
   response.setHeader("Expires", "0");               // proxy server
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../resources/css/home/animate.css">

    <link rel="stylesheet" href="../resources/css/home/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/home/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/home/magnific-popup.css">

    <link rel="stylesheet" href="../resources/css/home/aos.css">

    <link rel="stylesheet" href="../resources/css/home/ionicons.min.css">

    <link rel="stylesheet" href="../resources/css/home/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/css/home/jquery.timepicker.css">


    <link rel="stylesheet" href="../resources/css/home/flaticon.css">
    <link rel="stylesheet" href="../resources/css/home/icomoon.css">
    <link rel="stylesheet" href="../resources/css/home/style.css">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script type="text/javascript" src="../resources/js/home/header.js"></script>
   <!-- 쪽지 안읽음 갯수 추출 에이작스 영역 -->
   <script type="text/javascript">
   $(function(){
      
     ajaxLetterCnt();
      
    function ajaxLetterCnt(){  /* 쪽지 안읽은 거 개수 출력 에이작스 영역 */
     $.ajax({
       type: "post",
       url: "../home.do?command=liveTimeLetters&mem_id=${sessionScope.dto.mem_id }",
         
       success: function(data){
         $(".ajaxCount").html(data);
         
       },
       error: function(){
          alert("오류");
       }
     }); 
        setTimeout(ajaxLetterCnt,20000);
    }

   });
   </script>
   <!-- 쪽지 안읽음 갯수 추출 에이작스 영역 -->
</head>
<body>

   <header style="background: black; height: 100px;">
      <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
          <div class="container">
            <a class="navbar-brand" href="#" onclick="location.href='../home.do?command=home';"><img alt="logo" src="../resources/images/home/header/logo.png"></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="oi oi-menu"></span> Menu
            </button>
      <c:if test="${empty sessionScope.dto.mem_grade and sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2 and sessionScope.dto.mem_grade!=3}">         
      <div class="nonmember">
            <div class="collapse navbar-collapse" id="ftco-nav">
              <ul class="navbar-nav ml-auto">
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../home.do?command=siteintroduce';">사이트소개</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../product.do?command=auction&currentpage=1';">경매상품</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../fund.do?command=fundlist&page=1'">펀드상품</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farm.do?command=farmmain';">주말농장</a></li>        

                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=boardList&page=1';">게시판</a>
                     <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate1&page=1'">공지사항</a></li>
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate2&page=1'">자유게시판</a></li>
                       <li><a href="#" onclick="location.href='../eventboard.do?command=eventboardlist&currentpage=1';">이벤트</a></li>
                     </ul>
                 </li>
                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=qaList&page=1';">고객센터</a>
                    <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">회원 문의</a></li>
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">농부 문의</a></li>
                   </ul>
                 </li>
                 <li class="nav-item cta"><a href="#" onclick="location.href='../login.do?command=login';" class="nav-link">로그인</a></li>
                         
            </ul>
            </div>
         </div>
         </c:if>
   <c:if test="${sessionScope.dto.mem_grade ==1}">      
   <div class="member">
            <div class="collapse navbar-collapse" id="ftco-nav">
              <ul class="navbar-nav ml-auto">
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../home.do?command=siteintroduce';">사이트소개</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../fund.do?command=fundlist&page=1'">펀드상품</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../product.do?command=auction&currentpage=1';">경매상품</a></li>
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farm.do?command=farmmain';">주말농장</a></li>

                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=boardList&page=1';">게시판</a>
                     <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate1&page=1'">공지사항</a></li>
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate2&page=1'">자유게시판</a></li>
                       <li><a href="#" onclick="location.href='../eventboard.do?command=eventboardlist&currentpage=1';">이벤트</a></li>
                     </ul>
                 </li>
                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=qaList&page=1';">고객센터</a>
                    <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">회원 문의</a></li>
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">농부 문의</a></li>
                   </ul>
                 </li>
                 <!-- 로그아웃 -->
                 <a href="#"><img src="../resources/images/home/header/logout.png" onclick="location.href='../login.do?command=logout';"></a>
                <!-- 로그아웃 -->
                <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../memberMyPage.do?command=mypage&mem_id=${dto.mem_id}';">마이페이지</a></li>
                <img src="../resources/images/home/header/member.png" alt="" style="border-radius:50px; width:40px; height:40px; margin: 1% 0% 0% -1%;"/> 
               <!-- 쪽지알람 -->
               <img class="alramtoggle" src="../resources/images/home/header/alram.png" alt="" style="width:30px; height:30px; margin-top:1.5%; margin-left:1%; cursor:pointer;" onclick="location.href='../letters.do?command=letters&currentpage=1&mem_id=${sessionScope.dto.mem_id}';"/>&nbsp;
               <span style="color:red; font-weight:bold; margin-top:1.8%;">[<span class="ajaxCount"></span>]</span>
               <!-- 쪽지알람 -->
            </ul>
            </div>
         </div>
         </c:if>
         <c:if test="${sessionScope.dto.mem_grade==2}">
         <div class="farmer">
                <div class="collapse navbar-collapse" id="ftco-nav">
              <ul class="navbar-nav ml-auto">
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../home.do?command=siteintroduce';">사이트소개</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../fund.do?command=fundlist&page=1'">펀드상품</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../product.do?command=auction&currentpage=1';">경매상품</a></li>
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farm.do?command=farmmain';">주말농장</a></li>

                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=boardList&page=1';">게시판</a>
                     <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate1&page=1'">공지사항</a></li>
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate2&page=1'">자유게시판</a></li>
                       <li><a href="#" onclick="location.href='../eventboard.do?command=eventboardlist&currentpage=1';">이벤트</a></li>
                     </ul>
                 </li>
                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=qaList&page=1';">고객센터</a>
                    <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">회원 문의</a></li>
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">농부 문의</a></li>
                   </ul>
                 </li>
                 <!-- 로그아웃 -->
                <a href="#"><img src="../resources/images/home/header/logout.png" onclick="location.href='../login.do?command=logout';"></a>
               <!-- 로그아웃 -->
               <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../memberMyPage.do?command=mypage&mem_id=${dto.mem_id}';">마이페이지</a></li>
               <img src="../resources/images/home/header/farmer.png" alt="" style="border-radius:50px; width:40px; height:40px; margin: 1% 0% 0% 0%;"/>

                     <!--  <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farmerdetail.do?command=goFarmerMyPage';" style="margin: -1% 0% 0% 0%;">농부관리 페이지</a></li>-->
                 <!-- 쪽지알람 -->

                     <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farmerfunddetail.do?command=goFarmerMyPage';" style="margin: -1% 0% 0% 0%;">농부관리 페이지</a></li> 
                       

             
               <img class="alramtoggle" src="../resources/images/home/header/alram.png" alt="" style="width:30px; height:30px; margin-top:1.5%; cursor:pointer;" onclick="location.href='../letters.do?command=letters&currentpage=1&mem_id=${sessionScope.dto.mem_id}';"/>&nbsp;
               <span style="color:red; font-weight:bold; margin-top:1.5%;">[<span class="ajaxCount"></span>]</span>
            
               <!-- 쪽지알람 -->
            </ul>
            </div>
         </div>

         </c:if>
          <c:if test="${sessionScope.dto.mem_grade==3}">
         <div class="admin">
               <div class="collapse navbar-collapse" id="ftco-nav">
              <ul class="navbar-nav ml-auto">
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../home.do?command=siteintroduce';">사이트소개</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../fund.do?command=fundlist&page=1'">펀드상품</a></li>

                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../product.do?command=auction&currentpage=1';">경매상품</a></li>
                 <li class="nav-item active"><a href="#" class="nav-link" onclick="location.href='../farm.do?command=farmmain';">주말농장</a></li>

                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=boardList&page=1';">게시판</a>
                     <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate1&page=1'">공지사항</a></li>
                       <li><a href="#" onclick="location.href='../board.do?command=boardCate2&page=1'">자유게시판</a></li>
                       <li><a href="#" onclick="location.href='../eventboard.do?command=eventboardlist&currentpage=1';">이벤트</a></li>
                     </ul>
                 </li>
                 <li class="nav-item active" id="menu-hover"><a href="#" class="nav-link" onclick="location.href='../board.do?command=qaList&page=1';">고객센터</a>
                    <ul style="border:1px solid black; width:100px; height:100px; background:black; border-radius:5px;">
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate3&page=1'">회원 문의</a></li>
                      <li><a href="#" onclick="location.href='../board.do?command=qaCate4&page=1'">농부 문의</a></li>
                   </ul>
                 </li>
                 <!-- 로그아웃 -->
                  <a href="#"><img src="../resources/images/home/header/logout.png" onclick="location.href='../login.do?command=logout';"></a>
                <!-- 로그아웃 -->
                   <li class="nav-item active"><a href="../admin.do?command=adminmain" class="nav-link">관리자 페이지</a></li>  
                   <img src="../resources/images/home/header/admin.png" alt="" style="border-radius:50px; width:40px; height:40px; margin: 1% 0% 0% 0%;"/>         
            </ul>
            </div>
         </div>
         </c:if>
         </div>   
       </div>
     </nav>
   </header>
</body>
</html>