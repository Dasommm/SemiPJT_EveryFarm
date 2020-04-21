<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.fundproduct.dto.FundPayDto"%>
<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../resources/css/pay/order.css" rel="stylesheet" type="text/css"/>

<%
	MemberDto memDto = (MemberDto)session.getAttribute("dto");	//회원정보
	FundPayDto fundPayDto = (FundPayDto)session.getAttribute("fundPayDto");	//주문정보(order_no, mem_id, pay_price 담겨있음)
	FundDto detailDto = (FundDto)session.getAttribute("detailDto");		//stock,fund 정보	

%>

 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- i'mport 결제기능 -->
 <script>
	 
 var IMP = window.IMP;
 IMP.init("imp43033309"); // 가맹점 식별코드
 
 function requestPay() {
	//IMP.request_pay(param, callback) 호출
		alert("확인");
			
		IMP.request_pay({ // param -> 내용 수정하기
	   pg: "inicis",
	   pay_method: "card",
	   merchant_uid: "<%=fundPayDto.getOrder_no()%>",	//주문번호, 결제가 된 적이 있는 주문번호의 경우 재결제 불가
	   name: "<%=detailDto.getStock_name()%>",	//품목명
	   amount: "<%=fundPayDto.getPay_price()%>",			//주문금액
	   buyer_email: "<%=memDto.getMem_email()%>",		
	   buyer_name: "<%=memDto.getMem_name()%>",			
	   buyer_tel: "<%=memDto.getMem_phone()%>",	
	   buyer_addr: "<%=memDto.getMem_addr()%>",	
	   buyer_postcode: "<%=memDto.getMem_zonecode()%>",
	   m_redirect_url : "http://localhost:8787/EveryFarm/test.html"
	 }, function (rsp) { // callback -> 결제 프로세스 완료 후 호출되는 함수, rsp:결제 결과의 정보를 담고 있는 객체
		 if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		     alert("결제성공");
	 		location.href="../fund.do?command=paySuccess";
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
		      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    }
		  });	 
		
	}
	 
 
 </script>

</head>
<body>
<%@ include file="../home/header.jsp" %>


<section id="orderBody">
	<div id="titleArea">
		<h2>ORDER</h2>
	</div>

	<!-- 주문내역 -->
	<div class="orderListArea">
		<div class="title">
			주문내역
		</div>

		<!-- 기본배송 -->
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 40px">
					<col style="width: 92px">
					<col style="width: auto">
					<col style="width: 170px">
					<col style="width: 98px">
					<col style="width: 170px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class=""><input type="checkbox" onclick=""></th>
						<th scope="col">IMAGE</th>
						<th scope="col">PRODUCT NAME</th>
						<th scope="col">PRICE</th>
						<th scope="col">DELIVERY</th>
						<th scope="col">TOTAL</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input id="" name="" value="" type="checkbox"></td>
						<%
						System.out.print("pay"+detailDto.getStock_image().split("/")[0]);
						%>
						<td><a href="../fund.do?command=fundDetail&stock_no=<%=detailDto.getStock_no()%>"><img src="../<%=detailDto.getStock_image().split("/")[0] %>" width="100px" height="100px"></a></td>
						<td><a href="../fund.do?command=fundDetail&stock_no=<%=detailDto.getStock_no()%>"><%=detailDto.getStock_name() %></a>
						<td>
							<div class="">
							<fmt:formatNumber type="number" value="<%=fundPayDto.getPay_price() %>" />	won
							</div>
						</td>

						<td><div class="">기본배송</div></td>
						<td>
							<div class="">
							<fmt:formatNumber type="number" value="<%=fundPayDto.getPay_price() %>" />	won
							</div>
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
				<img src="../resources/images/pay/req_check.png" alt="필수"> 필수입력사항
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
						<th class="basetable">주문하시는 분 <img src="../resources/images/pay/req_check.png" alt="필수"></th>
						<td><input id="" name="" class="" size="15" value="<%=memDto.getMem_name() %>" type="text"></td>
					</tr>
					<tr>
						<th class="basetable">주소 <img src="../resources/images/pay/req_check.png" alt="필수"></th>
						<td>
							<input id="" name="" class="" size="6" maxlength="6"  value="<%=memDto.getMem_zonecode() %>" type="text"> 
							<a href="" class="zipcode" alt="우편번호">우편번호</a><br>
							<input id="" name="" class="addr2" size="40"  value="<%=memDto.getMem_addr() %>" type="text"> 
							<span class="grid">기본주소</span><br>
							<input id="" name="" class="addr3" size="40" value="<%=memDto.getMem_addretc() %>" type="text"> 
							<span class="grid">나머지주소</span>
						</td>
					</tr>
					<tr>
						<th class="basetable">일반전화
						</th>
						<td><input id="" name="" maxlength="12" size="20"
							value="<%=memDto.getMem_phone() %>" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">휴대전화 <span class=""><img
							src="../resources/images/pay/req_check.png" alt="필수"></span>
						</th>
						<td>
							<input id="" name="" maxlength="12" size="20"
							value="<%=memDto.getMem_phone() %>" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">이메일 <img src="../resources/images/pay/req_check.png" alt="필수"></th>
						<td>
							<input id="" name="" class="" value="<%=memDto.getMem_email() %>" type="text">
							<!-- <select id="">
								<option value="" selected="selected">- 이메일 선택 -</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="empas.com">empas.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select>  -->
							<br>							
							- 이메일을 통해 주문처리과정을 보내드립니다. <br>
							- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요					
						</td>
					</tr>						
				</tbody>
			</table>
		</div>
	</div>

	<!-- 배송 정보 -->
	<div class="deliveryArea">
		<div class="title">
			배송 정보
			<span class="required">
				<img src="../resources/images/pay/req_check.png" alt="필수"> 필수입력사항
			</span>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 170px;">
					<col style="width: auto;">
				</colgroup>

				<!--배송지 정보 -->
				<tbody>
					<tr>
						<th class="basetable">받으시는 분 <img src="../resources/images/pay/req_check.png" alt="필수"></th>
						<td><input id="" name="" class=""
							size="15" value="<%=memDto.getMem_name() %>" type="text"></td>
					</tr>
					<tr>
						<th class="basetable">주소 <img src="../resources/images/pay/req_check.png" alt="필수"></th>
						<td>
							<input id="" name="" class="" size="6" maxlength="6" value="<%=memDto.getMem_zonecode() %>" type="text"> 
							<a href="" class="zipcode" alt="우편번호">우편번호</a><br>
							<input id="" name="" class="addr2" size="40" value="<%=memDto.getMem_addr() %>" type="text"> 
							<span class="grid">기본주소</span><br>
							<input id="" name="" class="addr3" size="40" value="<%=memDto.getMem_addretc() %>" type="text"> 
							<span class="grid">나머지주소</span>
						</td>
					</tr>
					<tr>
						<th class="basetable">일반전화
						</th>
						<td>
							<input id="" name="" maxlength="12" size="20"
							value="<%=memDto.getMem_phone() %>" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">휴대전화
							<img src="../resources/images/pay/req_check.png" alt="필수">
						</th>
						<td>
							<input id="" name="" maxlength="20" size="20" value="<%=memDto.getMem_phone() %>" type="text">
						</td>
					</tr>
				</tbody>
				<tbody class="delivery">
					<tr>
						<th class="basetable">배송메시지
						</th>
						<td><textarea id="" name="" maxlength="255" cols="70"></textarea>
							<br>
							배송메시지란에는 배송시 참고할 사항이 있으면 적어주십시오.
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
			<input id="inputTypeText" name="" size="6" readonly="readonly"	value="<%=fundPayDto.getPay_price() %>" type="text">
				&nbsp;won
			
		</div>
		<div>
			<p>
				<input name="" value="T" type="checkbox">
				결제정보를 확인하였으며, 구매진행에 동의합니다.
			</p>
		</div>
		<a class="" id="payCancle" onclick="">취소</a>
		<a class=""	id="payConfirm" onclick="requestPay()">결제하기</a>
	</div>

	</section>	
	
	<%@ include file="../home/footer.jsp" %>
	

</body>
</html>