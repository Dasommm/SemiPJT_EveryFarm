<%@page import="com.everyfarm.farm.dto.FarmDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	FarmDto farmdto = (FarmDto)session.getAttribute("farmMemInfo");
	

	String mem_id = farmdto.getMem_id();
	int wfarm_key = farmdto.getWfarm_key();
	String mf_area = farmdto.getMf_area(); //배열객체(String->int예정)

%>

<link href="../resources/css/auction/auctionpay.css" rel="stylesheet" type="text/css"/>

<!-- i'mport 결제기능 -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script>
	 
 var IMP = window.IMP;
 IMP.init("imp43033309"); // 가맹점 식별코드
 
 function requestPay() {
	 if($('#checkbox').prop("checked")){
		//IMP.request_pay(param, callback) 호출
			IMP.request_pay({ // param -> 내용 수정하기
		   pg: "inicis",
		   pay_method: "card",
		   merchant_uid: "",	//주문번호, 결제가 된 적이 있는 주문번호의 경우 재결제 불가
		   name: "EveryFarm결제",	
		   amount: <%=farmdto.getTotalprice()%>,			
		   buyer_email: "<%=farmdto.getMem_email()%>",		
		   buyer_name: "<%=farmdto.getMem_name()%>",			
		   buyer_tel: "<%=farmdto.getMem_phone()%>",	
		   buyer_addr: "<%=farmdto.getMem_addr()%>",	
		   buyer_postcode: "<%=farmdto.getMem_zonecode()%>",
		   m_redirect_url : "http://localhost:8787/EveryFarm/test.html"
		 }, function (rsp) { // callback -> 결제 프로세스 완료 후 호출되는 함수, rsp:결제 결과의 정보를 담고 있는 객체
			 if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				 alert("결제에 성공하였습니다.");
		 			location.href="../farm.do?command=insertRentFarm&mem_id=<%=mem_id%>&wfarm_key=<%=wfarm_key%>&mf_area=<%=mf_area%>";
			      // jQuery로 HTTP 요청
			      jQuery.ajax({
			          url: "http://localhost:8787/EveryFarm/test.html", // 가맹점 서버
			          method: "POST",
			          headers: { "Content-Type": "application/json" },
			          data: {
			              imp_uid: rsp.imp_uid,	//아임포트 거래 고유번호
			              merchant_uid: rsp.merchant_uid	//가맹점에서 관리하는 주문번호
			          }
			      });
			 } else {
			     alert("결제에 실패하였습니다." +  rsp.error_msg);
			 }
			  });			
	 }else{
	 	alert("결제정보를 확인한 후, 동의해 주십시오.");
	 	return false;
	 }
}
 
 </script>
 <!-- 결제후 뒤로가기 금지 시키기 -->
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
 <!-- 결제후 뒤로가기 금지 시키기 -->
</head>
 <!-- 결제후 뒤로가기 금지 시키기 -->
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
 <!-- 결제후 뒤로가기 금지 시키기 -->
<%@ include file="../home/header.jsp" %>
<section id="orderBody">
	<div id="titleArea">
		<h2>ORDER</h2>
	</div>

	<!-- 주문내역 -->
	<div class="orderListArea">

		<!-- 기본배송 -->
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 40px">
					<col style="width: 92px">
					<col style="width: auto">
					<col style="width: 170px">
					<col style="width: 75px">
					<col style="width: 98px">
					<col style="width: 170px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" style="width: 15%;">IMAGE</th>
						<th scope="col" style="width: 20%;">주말농장 이름</th>
						<th scope="col">평당가격</th>
						<th scope="col" style="width: 15%;">땅위치</th>
						<th scope="col" style="width: 20%;">총 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href=""><img src="<%=farmdto.getWfarm_image() %>" alt="img" width="80px" height="80px"></a></td>
						<td><a href=""><%=farmdto.getWfarm_title() %></a>
						<td>
							<div class="">
								<%=farmdto.getWfarm_price() %> won x <%=farmdto.getSelectedCnt() %>
							</div>
						</td>
						<td><div><%=farmdto.getMf_area() %></div></td>
						<td>
							<div class=""><%=farmdto.getTotalprice() %> won</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 주문 정보 -->
	<div class="orderInfo">
		<div class="title">
			주문정보
			<span class="required">
				<img src="../resources/images/auction/req_check.png" alt="필수"> 필수입력사항
			</span>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 170px;">
					<col style="width: auto;">
				</colgroup>
				<!-- 국내 쇼핑몰 -->
				<tbody class="address_form">					
					<tr>
						<th class="basetable">주문하시는 분 <img src="../resources/images/auction/req_check.png" alt="필수"></th>
						<td><input id="" name="" class="" size="15" value="<%=farmdto.getMem_name() %>" type="text" readonly></td>
					</tr>
					<tr>
						<th class="basetable">주소 <img src="../resources/images/auction/req_check.png" alt="필수"></th>
						<td>
							<input id="" name="" class="" size="6" maxlength="6" readonly="" value="<%=farmdto.getMem_zonecode() %>" type="text" readonly> 
							<br/>
							<input id="" name="" class="addr2" size="40" readonly="" value="<%=farmdto.getMem_addr() %>" type="text" readonly> 
							<span class="grid">기본주소</span><br>
							<input id="" name="" class="addr3" size="40" value="<%=farmdto.getMem_addretc() %>" type="text" readonly> 
							<span class="grid">나머지주소</span>
						</td>
					</tr>
					<tr>
						<th class="basetable">전화번호
						</th>
						<td><input id="" name="" maxlength="12" size="20"
							value="<%=farmdto.getMem_phone() %>" type="text" readonly>
						</td>
					</tr>
					
					<tr>
						<th class="basetable">이메일 <img src="../resources/images/auction/req_check.png" alt="필수"></th>
						<td>
							<input id="" name="" class="" value="<%=farmdto.getMem_email() %>" type="text" readonly>
							<!--@<input id="" name="" class="" readonly="readonly" value="" type="text">-->
							
							<br>							
							- 이메일을 통해 주문처리과정을 보내드립니다. <br>
							- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요					
						</td>
					</tr>						
				</tbody>
			</table>
		</div>
	</div>


	<!-- 총 주문금액 상세내역 레이어 -->
	<div id="" class="totalPay">
		<div class="total">
			<span id="">최종결제 금액</span>
			<input id="inputTypeText" name="" size="6" readonly="1"	value="<%=farmdto.getTotalprice() %>" type="text">
				&nbsp;won
			
		</div>
		<div>
			<p>
				<input name="" value="" type="checkbox" id="checkbox">
				결제정보를 확인하였으며, 구매진행에 동의합니다.
			</p>
		</div>
		<a class="" id="payCancle" onclick="location.href='../farm.do?command=farmdetail&wfarm_key=<%=farmdto.getWfarm_key()%>';" style="cursor:pointer;">취소</a>
		<a class=""	id="payConfirm" onclick="requestPay()" style="cursor:pointer;">결제하기</a>
	</div>

	</section>	
<%@ include file="../home/footer.jsp" %>
</body>
</html>