<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
    <link rel="stylesheet" href="../resources/css/admin/admin.css">   
	<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="../resources/js/admin/bootstrap.js"></script>
	<script src="../resources/js/admin/dist/Chart.bundle.js"></script>
	<style>
		.admin_list_container{
			width: 95%;
			height: 350px;
			border: 1px solid #ddd;
			padding: 1%;
			border-radius: 8px;
			margin-left: 3.5%;
		}
		.admin_container{
			width: 95%;
			height: 350px;
			border: 1px solid #ddd;
			padding-left: 7.5%;
			border-radius: 8px;
			margin-left: 3.5%;
			overflow-y: auto;
		}
		#admin_table{
			font-size: 15px; line-height: 1; font-weight: 200;
		}
		#admin_table tr th {
			background-color: #b5ccfc;
		}
		#admin_table tr:nth-child(5){
			opacity: 0.5;
		}
		#admin_table tr:nth-child(6){
			opacity: 0.2;
		}
	</style>	
<body>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	<div class="row">
	<%@ include file="admin_sidebar.jsp" %>
		<div class="col" >
		<div class="section_content">	
			<h2 style="margin: 40px;">메인화면</h2>
			<!-- 좌측바디 -->
			<div style="width:70%; float: left; border-right: 1px solid #ddd;">
				
				<!-- 좌측 위 -->
				<div class="admin_list_container">
				<h5><a href="../admin.do?command=userlist&pageNumber=1">회원목록</a></h5>
					<table id="admin_table" class="table table-striped table-bordered">
					<col width="12%">
					<col width="10%">
					<col width="15%">
					<col width="8%">
					<col width="10%">
					<col width="8%">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>등급</th>
							<th>가입일</th>
							<th style="font-size: 15px;">탈퇴여부</th>
						</tr>
						<c:choose>
							<c:when test="${empty userlist_adminmain }">
								<tr>
									<td colspan="6">회원 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${userlist_adminmain }" var="dto1">
									<tr>
										<td>${dto1.mem_id }</td>
										<td>${dto1.mem_name }</td>
										<td>${dto1.mem_email }</td>
										<td>
											<c:choose>
												<c:when test="${dto1.mem_grade eq 2}">
													<c:out value="농부"></c:out>
												</c:when>
												<c:when test="${dto1.mem_grade eq 3}">
													<c:out value="관리자"></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="회원"></c:out>
												</c:otherwise>											
											</c:choose>
										</td>
										<td>${dto1.mem_regdate }</td>
										<td>
											<c:choose>
												<c:when test="${dto1.mem_drop eq 'n'}">
													<c:out value="탈퇴"></c:out>
												</c:when>
												<c:when test="${dto1.mem_drop eq 'y'}">
													<c:out value="가입"></c:out>
												</c:when>	
												<c:otherwise>
													<c:out value="오류"></c:out>
												</c:otherwise>									
											</c:choose>
										</td>
									</tr>								
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div style="text-align: center;">
						<span style="writing-mode: tb-rl; color:#bbb;">. . .</span>
					</div>
				</div> 
				<br>
				
				<!-- 좌측 아래 -->
				<div class="admin_list_container">
				<h5><a href="../admin.do?command=adminbilllist&pageNumber=1">주문목록</a></h5>
					<table id="admin_table" class="table table-striped table-bordered">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="10%">
						<tr>
							<th>아이디</th>
							<th>거래상태</th>
							<th>주문종류</th>
							<th>상품명</th>
							<th>상품가격</th>
							<th>품목</th>
						</tr>
						<c:choose>
							<c:when test="${empty orderlist_adminmain }">
								<tr>
									<td colspan="6">주문 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${orderlist_adminmain }" var="dto">
									<tr>
										<td>${dto.mem_id }</td>
										<td>
											<c:choose>
												<c:when test="${dto.orderInfo_status eq 1}">
													<c:out value="구매요청"></c:out>
												</c:when>
												<c:when test="${dto.orderInfo_status eq 2}">
													<c:out value="구매완료"></c:out>
												</c:when>
												<c:when test="${dto.orderInfo_status eq 3}">
													<c:out value="환불요청"></c:out>
												</c:when>
												<c:when test="${dto.orderInfo_status eq 4}">
													<c:out value="환불완료"></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="오류"></c:out>
												</c:otherwise>											
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${dto.orderInfo_kind eq 1}">
													<c:out value="펀드"></c:out>
												</c:when>
												<c:when test="${dto.orderInfo_kind eq 2}">
													<c:out value="경매"></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="오류"></c:out>
												</c:otherwise>											
											</c:choose>
										</td>
										<td>${dto.stock_name }</td>
										<td>${dto.stock_price }</td>
										<td>
											<c:choose>
												<c:when test="${dto.stock_kind eq 1}">
													<c:out value="과일"></c:out>
												</c:when>
												<c:when test="${dto.stock_kind eq 2}">
													<c:out value="채소"></c:out>
												</c:when>
												<c:when test="${dto.stock_kind eq 3}">
													<c:out value="곡류"></c:out>
												</c:when>
												<c:when test="${dto.stock_kind eq 4}">
													<c:out value="견과류"></c:out>
												</c:when>
												<c:when test="${dto.stock_kind eq 5}">
													<c:out value="약용작물"></c:out>
												</c:when>
												<c:when test="${dto.stock_kind eq 6}">
													<c:out value="버섯류"></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="오류"></c:out>
												</c:otherwise>											
											</c:choose>
										</td>
									</tr>								
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div style="text-align: center;">
						<span style="writing-mode: tb-rl; color:#bbb;">. . .</span>
					</div>
				</div> 
				
			</div>
			
			<!-- 우측바디 -->
			<div style="width:30%; float: left;">

				<!-- 차트1 -->			
				<div class="admin_container" onclick="location.href='../admin.do?command=adminaccount'">
					<canvas id="pie-chart"></canvas>
				</div> 
					<script>
						var mychart = $('#pie-chart');
						var stock1 = ${adminaccount_main.stock1_count };
						var stock2 = ${adminaccount_main.stock2_count };
						var stock3 = ${adminaccount_main.stock3_count };
						var stock4 = ${adminaccount_main.stock4_count };
						var stock5 = ${adminaccount_main.stock5_count };
						var stock6 = ${adminaccount_main.stock6_count };
						var piechart = {
						  label:'piechart',
						  data:[stock1,stock2,stock3,stock4,stock5,stock6],
						  backgroundColor:[
						    'rgba(200,0,0,.45)',
						    'rgba(200,200,0,.45)',
						    'rgba(0,200,0,.45)',
						    'rgba(0,200,200,.45)',
						    'rgba(0,0,200,.45)',
						    'rgba(200,0,200,.45)'
						  ],
						  borderColor:'white',
						  borderWidth:2,
						};
						
						var myLineChart = new Chart(mychart,{
						  type:'pie',
						  data: {
						    labels:['과일','채소','곡류','견과류','약용작물','버섯'],
						    datasets:[piechart]
						  },
						  options:{
						    maintainAspectRatio:false,
						    cutoutPercentage: 40,
						    rotation: 30    
						  }
						});
					</script>
				<!-- 차트 1 끝 -->
				<br>
				<!-- 차트2 -->			
				<div class="admin_container" onclick="location.href='../admin.do?command=adminaccount'">
					<canvas id="bar-chart3"></canvas>
				</div>
					 
					<script>
					var mychart3 = $('#bar-chart3');
					var fundSumCurrentPrice = ${adminaccount_main.fundSumCurrentPrice};
					var auctionSumCurrentPrice = ${adminaccount_main.auctionSumCurrentPrice};
					var fundCurrentMember = ${adminaccount_main.fundCurrentMember};
					var auctionCurrentMember = ${adminaccount_main.auctionCurrentMember};
					var myBarChart3 = new Chart(mychart3, {
					     type: 'bar',
					     data: {
					       labels: ['경매', '펀드'],
					       datasets: [{
					         label: '총액(좌)',
					         yAxisID: 'A',
					         data:[auctionSumCurrentPrice, fundSumCurrentPrice],
					         backgroundColor:'rgba(40,180,130,.5)',
					         borderColor:'rgba(40,180,130)',
					         borderWidth:1
					       }, {
					         label: '인원수(우)',
					         yAxisID: 'B',
					         data: [auctionCurrentMember,fundCurrentMember],
					         backgroundColor:'rgba(180,40,20,.5)',
					         borderColor:'rgba(180,40,20)',
					         borderWidth:1
					       }]
					     },
					     options: {
					       maintainAspectRatio:false,
					       scales: {
					         yAxes: [{
					           id: 'A',
					           type: 'linear',
					           position: 'left',
					           ticks: {
					             min: 0
					           },
					           gridLines : { display : false }
					         }, {
					           id: 'B',
					           type: 'linear',
					           position: 'right',
					           ticks: {
					             min: 0
					           }
					         }]
					       }
					     }
					});
					</script>
					<!-- 차트 2 끝 -->

			</div> 
	    </div>
		</div>
	</div>
</div>
	
	
<%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
/* 	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../home/section.jsp";
	} */
</script>
</html>