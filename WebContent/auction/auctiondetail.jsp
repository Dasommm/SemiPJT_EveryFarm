<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.product.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../resources/js/auction/ajax.js"></script>
</head>
<%
	
	ProductDto dto = (ProductDto)session.getAttribute("productdto");
	
	int kind = dto.getStock_kind();
	String kindval ="";
	if(kind == 1){
		kindval="과일";
	}else if(kind ==2){
		kindval="채소";
	}else if(kind ==3){
		kindval="곡류";
	}else if(kind ==4){
		kindval="견과류";
	}else if(kind ==5){
		kindval="약용작물";
	}else if(kind==6){
		kindval="버섯류";
	}
%>
<script type="text/javascript">
$(function(){
 
/* **************Ajax : 실시간 경매 현황*************** */         
   
   liveTimeAuc(); // 실시간 남은시간 - 1초마다
   Auc_nowPrice();  //실시간 최고가 - 1초마다
   Auc_join();  //실시간 참여인원 - 1초마다
   
   function liveTimeAuc(){
      $.ajax({
           type: "post",
           url: "../product.do?command=liveTimeAuc&auc_no=<%=dto.getAuc_no()%>",
           /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
           success: function(data){ // callback함수 --> 결과값 돌려받는다.
              $(".ajax01").html(data); // 결과 출력
             
           },
           error: function(){
             // alert("오류");
           }
      });
      setTimeout(liveTimeAuc,10000);
     
   }
   
   function Auc_nowPrice(){
	      $.ajax({
	           type: "post",
	           url: "../product.do?command=Auc_nowPrice&auc_no=<%=dto.getAuc_no()%>",
	           /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
	           success: function(data){ // callback함수 --> 결과값 돌려받는다.
	              $(".ajax02").html(data); // 결과 출력
	             
	           },
	           error: function(){
	             // alert("오류");
	           }
	      });
	      setTimeout(Auc_nowPrice,10000);
	   }
   
   function Auc_join(){
	      $.ajax({
	           type: "post",
	           url: "../product.do?command=Auc_join&auc_no=<%=dto.getAuc_no()%>",
	           /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
	           success: function(data){ // callback함수 --> 결과값 돌려받는다.
	              $(".ajax03").html(data); // 결과 출력
	             
	           },
	           error: function(){
	             // alert("오류");
	           }
	      });
	      setTimeout(Auc_join,10000);
	   }
  
   
}); 
</script>
<body>

<%@ include file="../home/header.jsp" %>
<section>

	<div class="movehome" style="margin: 100px 0px 0px 300px;"><a href="#" onclick="location.href='../home.do?command=home';" style="color:gray;">Home</a> > <a href="#" onclick="location.href='../product.do?command=auction&currentpage=1';" style="color:gray;">List</a></div>
	<img alt="sumnail" src="../<%=dto.getStock_image().split("/")[0] %>" style="width:450px; height:400px; margin: 30px 0px 0px 300px;"/>
	
	<div class="sumnailcontent" style="    margin: -450px 0px 0px 900px;">
	<h1><%=dto.getStock_name() %></h1>
	<div style="background:red; color:white; font-weight:bold; width:40%; height:5%; border-radius: 10px; text-align:center;"
		>경매종료까지 남은시간 :<span class="ajax01"><!-- 에이작스 저장영역 --></span></div>
	<hr style="    width: 70%; margin-left: 0px;"/>
	<p>[경매 종료일:<b style="color:blue;"><%=dto.getAuc_endDate()%></b>기준으로 발송]</p>
	<!-- fix내용 -->
	<p style="color:green;">예약구매는 농부의 걱정을 덜어줍니다.<br/>
	가장 좋을 때 수확한 먹거리를 함께해 주시는 회원들에게 할인하여 제공합니다.</p>
	<p>수확일 기준으로 예약순서대로 순차적으로 발송합니다.</p>
	<!-- fix내용 끝 -->
	<p><a style="font-weight:bold;">원산지:</a><%=dto.getStock_location() %></p>
	<p><a style="font-weight:bold;">생산자:</a><%=dto.getMem_id() %></p>
	
	<!-- 쪽지보내기 -->
	<img alt="img" src="../resources/images/auction/messageicon.png" style="width: 3%; margin: -4% 0% 2% 15%; cursor: pointer;" onclick="message();"/>
	<input type="hidden" id="childmem_id" value="${sessionScope.dto.mem_id }"/>
	<!-- 쪽지보내기 -->
	
	<p><a style="font-weight:bold;">배송방법:</a>택배</p>
	<p><a style="font-weight:bold;">배송비:</a>무료 | 도서산간 배송비 추가</p>
	<p><a style="font-weight:bold;">상품중량:</a><%=dto.getStock_kg() %>kg</p>
	<p><a style="font-weight:bold;">상품품목:</a><%=kindval %></p>
	<p><a style="font-weight:bold; color:blue;">경매시작가:</a><%=dto.getAuc_startPrice() %>원</p>
	<p><a style="font-weight:bold; color:red;">현재최고가:</a><a class="ajax02"></a>원</p>  <!-- 에이작스 저장영역 -->
	<p><a style="font-weight:bold;">경매등록일:</a><%=dto.getAuc_regDate() %></p>
	<p><a style="font-weight:bold; color:red;">참여인원:</a><a class="ajax03"></a>명</p>   <!-- 에이작스 저장영역 -->
	
<!-- 경매 구매 영역 --><!------------------------------------------------>	
<form action="../product.do" method="post" id="insertform">	
	<input type="hidden" name="command" value="purchaseProduct"/>  <!-- 커맨드 값 -->	
	<input type="hidden" name="mem_id" value="${sessionScope.dto.mem_id }"/>
	<input type="hidden" name="mem_grade" value="${sessionScope.dto.mem_grade }"/>
	<input type="hidden" name="auc_no" value="<%=dto.getAuc_no() %>"/>   <!-- 경매번호 기준으로 값 update시킬 것 -->
	
	<b>입찰가입력:</b>&nbsp;<input id="insertprice" name="insertprice" type="text" value="" placeholder="최고가 보다 높게 입력하세요." style="width:300px; height:30px; border:1px solid green; border-radius:5px;"/>
	<br/>
	<input type="button" id="buyauction" value="구매하기" 
		style="background:green; width:150px; height:50px; border-radius:10px; font-weight:bold; color:white;"/>
</form>
<!-- 경매 구매 영역 --><!------------------------------------------------>		
	</div><br/>
	<hr style="width:70%;"/>
	<div style="text-align:center;">
		<img alt="img" src="../resources/images/auction/contentfirst.png"/>  <!-- fix이미지 -->
		<br/><br/><br/>
	</div>	
	<div style="margin: 0% 0% 0% 20%;">
		<a style="font-weight:bold;">상품소개</a>
	</div>	
		
	<div style="margin: -2.1% 0% 0% 40%;">	
		<p><%=dto.getStock_detail().split("/")[0] %></p>
		<img alt="img" src="../<%=dto.getStock_image().split("/")[1]%>" style="width:550px; height:450px;">
		<p><%=dto.getStock_detail().split("/")[1] %></p>
		<img alt="img" src="../<%=dto.getStock_image().split("/")[2]%>" style="width:550px; height:450px;">
		<p><%=dto.getStock_detail().split("/")[2] %></p>
		<img alt="img" src="../<%=dto.getStock_image().split("/")[3]%>" style="width:550px; height:450px;">
		<p><%=dto.getStock_detail().split("/")[3] %></p>
	</div>
	<div style="margin: 0% 0% 0% 20%;">
		<p><b>고객센터</b></p><hr/>
		<p>쪽지문의</p>
		<p>현재 페이지 상단에 쪽지 버튼을 클릭하여 문의해 주십시오.</p>
		<br/>
		<p>이메일 문의(24시간 접수)</p>
		<p>kdy41000@naver.com / 운영시간에 순차적으로 답변드립니다.</p>
		<br/>
		<p>전화 문의(평일 09시~18시)</p>
		<p>010-1234-1234</p>
	</div><br/><br/><br/>
	<div style="margin: 0% 0% 0% 20%;">
		<p><b>상품정보 제공표시</b></p>
		<table border="1" style="border-top: none;
    border-bottom: none;
    border-right: none;
    border-left: none;
    margin-bottom:15px;">
			<tr>
				<td style="background:#eae9e9; width:40%;">포장단위별 중량(수량)</td>
				<td>[<%=dto.getStock_kg() %>kg]</td>
			</tr>
			<tr>
				<td style="background:#eae9e9; width:40%;">생산자</td>
				<td>[<%=dto.getMem_id() %>]</td>
			</tr>
			<tr>
				<td style="background:#eae9e9; width:40%;">원산지</td>
				<td>국산[<%=dto.getStock_location() %>]</td>
			</tr>
			<tr>
				<td style="background:#eae9e9; width:40%;">보관 또는 취급방법</td>
				<td>수령 후 냉장보관, 가급적 빨리 드시길 권장드립니다.</td>
			</tr>
			<tr>
				<td style="background:#eae9e9; width:40%;">소비자 상담 관련 전화번호</td>
				<td>010-1234-1234</td>
			</tr>
		</table>
	</div>
</section>
<%@ include file="../home/footer.jsp" %>
<script type="text/javascript">
	$(function(){                         //경매 입찰 유효성 검사
		$("#buyauction").click(function(){
			var insertprice = document.getElementById("insertprice").value;
			
			if(${empty sessionScope.dto.mem_grade}){
				alert("로그인이 필요합니다.");
			}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
				alert("권한이 없습니다.");
			}else if(insertprice < <%=dto.getAuc_startPrice() %>){
				alert("경매시작가보다 높게 입력해주세요.");
			}else if(isNaN(insertprice)==true){
				alert("잘못된 입력입니다.");
				return false;
			}else{
				var nowPrice = <%=dto.getAuc_nowPrice()%>;
				if(insertprice <= nowPrice){
					alert("최고가보다 높게 입력해주세요.");
				}else{

					$("#insertform").submit();
				}
			}	
		});
	});
</script>
<script type="text/javascript">
function message(){
	
	if(${empty sessionScope.dto.mem_grade}){
		alert("로그인이 필요합니다.");
	}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
		alert("권한이 없습니다.");
	}else {

		window.open("message.jsp","","width=400,height=600,left=500,top=100");
	}
}

</script>
</body>
</html>