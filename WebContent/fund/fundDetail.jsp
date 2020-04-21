<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/fund/funddetail.css"
		rel="stylesheet" type="text/css">

<%
	FundDto detail = (FundDto)session.getAttribute("detailDto");
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   
   deadLineFund(); 
   fundJoinNum();
   fundJoinName();
   fundPriceUpdate();
   
   //펀드 남은시간 ajax
   function deadLineFund(){
      $.ajax({
           type: "post",
           url: "../fund.do?command=deadLineFund&fund_no=<%=detail.getFund_no()%>",
           success: function(data){ // callback함수 --> 결과값 돌려받는다.
              $("#deadLine").html(data); // 결과 출력
             
           },
           error: function(){
             alert("오류");
           }
      });
      setTimeout(deadLineFund,10000);
     
   }
   
   //펀드 참여자 수 Ajax
   function fundJoinNum() {
	$.ajax({
		type:"post",
		url: "../fund.do?command=fundJoinNum&fund_no=<%=detail.getFund_no()%>",
		success: function(data){
			$("#joinNum").html(data);
		},
		error: function(){
			alert("오류");
		}
	});
	setTimeout(fundJoinNum,10000);
}
   
 //펀드 참여자 명단 Ajax
   function fundJoinName() {
	$.ajax({
		type:"post",
		url: "../fund.do?command=fundJoinName&fund_no=<%=detail.getFund_no()%>",
		success: function(data){
			$("#joinName").html(data);
		},
		error: function(){
			alert("오류");
		}
	});
	setTimeout(fundJoinName,10000);
}
   
   //펀딩금액 ajax
   function fundPriceUpdate() {
	$.ajax({
		type:"post",
		url:"../fund.do?command=fundPriceUpdate&fund_no=<%=detail.getFund_no()%>",
		success:function(data){
			$("#currentPrice").html(data);
		},
		error: function () {
			alert("오류");
		}
	});
	setTimeout(fundPriceUpdate,10000);
}
   
}); 
</script>
<script type="text/javascript">

	$(document).ready(function (){
		var reward = document.getElementById("reward");
		var idx = reward.selectedIndex;
		var val = reward.options[idx].value;
		document.getElementById("totalAmount").innerHTML = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		//val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",") => 천단위 콤마찍기
		
	})

	function selectOption() {
		var reward = document.getElementById("reward");
		var idx = reward.selectedIndex;
		var val = reward.options[idx].value;
		document.getElementById("totalAmount").innerHTML = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
	}

</script>		


</head>
<body>

	<%@ include file="../home/header.jsp"%>
	<section>

		<div class="movehome">
			<a id="home" href="../home/section.jsp">Home</a> > <a id="list" href="../fund.do?command=fundlist&page=1">List</a>
		</div>
		<img id="thumbnail" alt="firstphoto" src="../<%=detail.getStock_image().split("/")[0] %>" />
		<%	System.out.println(detail.getStock_image().split("/")[0]);	%>
		<div class="thumbnailContent">
			<h1><%=detail.getStock_name() %></h1>	<!-- 상품이름 -->
			<hr/>
			<p class="space"><span id="deadLine"><!-- 펀딩 종료일 ajax--></span><span class="titleone"> 남음</span></p>	
			<p class="space"><span class="titletwo" id="currentPrice"><!-- 펀딩 금액 ajax--></span><span class="titleone">원 펀딩</span></p>	
			<p class="space"><span class="titletwo" id="joinNum"><!-- 참여자 ajax--></span><span class="titleone">명 참여 중 </span></p>	
			<p class="space">펀딩 참여자 : <span id="joinName"><!-- 참여자명 ajax--></span><span class="titleone"></span></p>	
			
			<hr>
			<p style="color: green; font-size: 14px;">
			※펀딩하기는 쇼핑하기가 아닙니다. 결제 완료 후 펀딩한 리워드가 바로 발송되지 않습니다.<br>
			  생산자는 리워드 발송 시작일을 명시하고 있으며, 약속한 발송 시작일에 배송이 진행되는 것을 원칙으로 합니다.
			</p>
			<p class="detailTitle">
				<span style="font-weight: bold; font-size: 14px;">원산지  : </span><%=detail.getStock_location() %>
			</p>
			<p class="detailTitle">
				<span style="font-weight: bold; font-size: 14px;">생산자  : </span><%=detail.getMem_id() %>
				<a href="#" onclick="letter();"><img id="notice" alt="img" src="../resources/images/auction/messageicon.png"/></a>
			</p>
			
<script type="text/javascript">
function letter() {

	if(${empty sessionScope.dto.mem_grade}){
		alert("로그인이 필요합니다.");
	}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
		alert("권한이 없습니다.");
	}else {

		window.open("fund_writeletters.jsp","","width=500,height=600,left=500,top=100");
	}
}			
</script>

			<p  class="detailTitle">
				<span style="font-weight: bold; font-size: 14px;">배송방법  : </span>택배
			</p>
			<p class="detailTitle">
				<span style="font-weight: bold; font-size: 14px;">배송비  : </span>무료 | 도서산간 배송비 추가
			</p>
			<p class="detailTitle">
				<span style="font-weight: bold; font-size: 14px;">리워드  :</span>
			</p>
			<form action="../fund.do?">
			<input type = "hidden" name = "command" value = "fundPay">
			<input type = "hidden" name = "stock_no" value = "<%=detail.getStock_no()%>">
			<input type="hidden" name = "fund_no" value = "<%=detail.getFund_no()%>">
			<select name = "pay_price" id="reward" onchange="selectOption();"><!-- 옵션 바뀔 떄 마다 -->
				<option selected="selected" value="<%=detail.getStock_price()%>"><%=detail.getStock_kg() %>kg (<fmt:formatNumber value="<%=detail.getStock_price()%>" type="number"/>원)</option>
				<option value="<%=detail.getStock_price() *2 %>"><%=detail.getStock_kg() *2 %>kg (<fmt:formatNumber value="<%=detail.getStock_price() *2%>" type="number"/>원)</option>
			</select> <br /><br /> 
			<span class="detailTitle">총 상품 금액 : &nbsp;
				<span id="totalAmount" style="color: red; font-size: 25px;"><!-- 총 결제금액 --></span>원
			</span>
			<input type="submit" value="펀딩신청" id="btn"/>
			</form>
		</div>
		
		<br />
		
		<hr/>
		<div style="text-align: center;">
			<img alt="img" src="../resources/images/auction/contentfirst.png" />
			<br />
			<br />
			<br />
		</div>
		<div class="bottom">
			<span class="detailTitle">상품소개</span>
		</div>

		<div style="margin: 1% 20% 1% 20%;">
		<div class="detailBody">
			<p><%=detail.getStock_detail().split("/")[0] %></p>
			<img alt="img" src="../<%=detail.getStock_image().split("/")[1] %>"
				style="width: 100%; height: 45%;" />
			<%	System.out.println(detail.getStock_image().split("/")[1]);	%>
			
			<p><%=detail.getStock_detail().split("/")[1] %></p>
			<img alt="img" src="../<%=detail.getStock_image().split("/")[2] %>"
				style="width: 100%; height: 45%;" />
			<%	System.out.println(detail.getStock_image().split("/")[2]);	%>
				
			<p><%=detail.getStock_detail().split("/")[2] %></p>
			<img alt="img" src="../<%=detail.getStock_image().split("/")[3] %>"
				style="width: 100%; height: 45%;" />
			<%	System.out.println(detail.getStock_image().split("/")[3]);	%>
				
			<p><%=detail.getStock_detail().split("/")[3] %></p>
		</div>
		</div>
		
		<div class="bottom">
			<p>
				<b>고객센터</b>
			</p>
			<hr />
			<p>쪽지문의</p>
			<p>현재 페이지 상단에 쪽지 버튼을 클릭하여 문의해 주십시오.</p>
			<br />
			<p>이메일 문의(24시간 접수)</p>
			<p>kdy41000@naver.com / 운영시간에 순차적으로 답변드립니다.</p>
			<br />
			<p>전화 문의(평일 09시~18시)</p>
			<p>010-1234-1234</p>
		</div>
		
		<br />
		<br />
		
		<div class="bottom">
			<p>
				<b>상품정보 제공표시</b>
			</p>
			<table border="1">
				<tr>
					<td>포장단위별 중량(수량)</td>
					<td>[<%=detail.getStock_kg() %>kg , <%=detail.getStock_kg()*2 %>kg]</td>
				</tr>
				<tr>
					<td>생산자</td>
					<td><%=detail.getMem_id() %></td>
				</tr>
				<tr>
					<td>원산지</td>
					<td><%=detail.getStock_location() %></td>
				</tr>
				<tr>
					<td>보관 또는 취급방법</td>
					<td>수령 후 냉장보관, 가급적 빨리 드시길 권장드립니다.</td>
				</tr>
				<tr>
					<td>소비자 상담 관련 전화번호</td>
					<td>010-1234-1234</td>
				</tr>
			</table>
		</div>
	</section>
	<br><br>

	<%@ include file="../home/footer.jsp"%>

</body>
</html>