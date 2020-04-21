<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>EveryFarm</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../resources/css/home/open-iconic-bootstrap.min.css">
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
  </head>
  <body>
 
	<%@ include file="header.jsp" %>
	<%@ include file="sectiontwo.jsp" %>
    
     <img alt="img" style="width: 100%;" src="../resources/images/home/section/section.png">
 
    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container-fluid">
    		<div class="row">
    			<div class="col-md-12">
    				<div class="featured">
    					<div class="row">
    						<div class="col-md-3">
    							<div class="featured-menus ftco-animate"><a href="#" onclick="location.href='../weather/weatherMain.jsp'">
			              <div class="menu-img img" style="background-image: url(../resources/images/home/section/weather.png);"></div>
			              <div class="text text-center">
		                  <h3>날씨</h3>
			              </div></a>
			            		</div>
    						</div>
    						<div class="col-md-3">
    							<div class="featured-menus ftco-animate"><a href="#" onclick="location.href='../farmbook.do?command=gofarmbook';">
			              <div class="menu-img img" style="background-image: url(../resources/images/home/section/book.png);"></div>
			              <div class="text text-center">
		                  <h3>농작물 도감</h3>
			              </div></a>
			            </div>
    						</div>
    						<div class="col-md-3">
    							<div class="featured-menus ftco-animate"><a href="#" onclick="location.href='../chat.do?command=gofaq';">
			              <div class="menu-img img" style="background-image: url(../resources/images/home/section/cs.png);"></div>
			              <div class="text text-center">
		                  <h3>고객센터</h3>
			              </div></a>
			            </div>
    						</div>
    						
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
  <!-- 채팅 구역 -->  	
 <img alt="img" src="../resources/images/home/section/chattingicon.png" style="width: 7%;
    position: fixed;
    z-index:2;
    margin: -31% 0% 0% 92%;
    cursor:pointer;" onclick="chatting();"/>
 <!-- 채팅 구역 -->
    </section>

   <%@ include file="footer.jsp" %> 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  
  <script src="../resources/js/home/jquery-migrate-3.0.1.min.js"></script>
  <script src="../resources/js/home/popper.min.js"></script>
  <script src="../resources/js/home/jquery.waypoints.min.js"></script>
  <script src="../resources/js/home/jquery.stellar.min.js"></script>
  <script src="../resources/js/home/owl.carousel.min.js"></script>
  <script src="../resources/js/home/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/home/aos.js"></script>
  <script src="../resources/js/home/scrollax.min.js"></script>
  <script src="../resources/js/home/main.js"></script>
  </body>
  <script type="text/javascript">
  	function chatting(){
  		if(${empty sessionScope.dto.mem_grade}){
  			alert("로그인이 필요합니다.");
  		}else{
  			window.open("../chatting/gochat.jsp","","width=410,height=450,left=500,top=100");
  		}
  	}
  </script>
</html>