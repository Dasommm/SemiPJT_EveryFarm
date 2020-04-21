<%@page import="java.util.List"%>
<%@page import="com.everyfarm.farm.biz.FarmBizImpl"%>
<%@page import="com.everyfarm.farm.biz.FarmBiz"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.everyfarm.farm.dto.FarmDto"%>
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

</head>
<%
	FarmDto dto = (FarmDto)session.getAttribute("farmdto");
%>
<body>

<%@ include file="../home/header.jsp" %>
<section>

	<div class="movehome" style="margin: 100px 0px 0px 300px;"><a href="#" onclick="location.href='../home.do?command=home';" style="color:gray;">Home</a> > <a href="#" onclick="location.href='../farm.do?command=farmlist&currentpage=1';" style="color:gray;">List</a></div>
	<img alt="sumnail" name="wfarm_image" src="../<%=dto.getWfarm_image().split("/")[0] %>" style="width:450px; height:400px; margin: 30px 0px 0px 300px;"/>
	
	<div class="sumnailcontent" style="    margin: -450px 0px 0px 900px;">
	<h1><%=dto.getWfarm_title() %></h1>
	
	<hr style="    width: 70%; margin-left: 0px;"/>
	<p>[<b>만료일</b>:<b>신청일 기준</b>으로 9개월간]</p>
	<!-- fix내용 -->
	<p style="color:green;"><b style="color:brown;">EveryFarm</b>주말농장은 여러분과 함께합니다 .<br/>
	블랙리스트를 선정하기 위해서 관리자의 승인을 받은 농장만 여러분께 공유됩니다.</p>
	<p style="color:green;">각 토지 별로 <a style="color:blue; font-weight:bold;">iot기능(CCTV/물주기)</a>이 설치되어 있습니다.</p>
	<!-- fix내용 끝 -->
	<p><a style="font-weight:bold;">주소:</a><%=dto.getWfarm_addr() %>(<%=dto.getWfarm_zoneCode()%>)</p>
	<p><a style="font-weight:bold;">농장주:</a><%=dto.getMem_name() %>(<%=dto.getMem_id() %>)</p>
	<p><a style="font-weight:bold;">이메일:</a><%=dto.getMem_email()%></p>
	<p><a style="font-weight:bold;">전화번호:</a><%=dto.getMem_phone() %></p>
	
	<!-- 쪽지보내기 -->
	<img alt="img" src="../resources/images/auction/messageicon.png" style="width: 3%; margin: -4% 0% 2% 22%; cursor: pointer;" onclick="message();"/>
	<input type="hidden" id="childmem_id" value="${sessionScope.dto.mem_id }"/>
	<!-- 쪽지보내기 -->
	
	<p><a style="font-weight:bold;">총 평수:</a><%=dto.getWfarm_totalArea() %>평</p>
	<p><a style="font-weight:bold;">평당 가격(1x1):</a><%=dto.getWfarm_price() %>원</p>
	    <%
             Date regDate = dto.getWfarm_regDate();
             SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");	
             String regDateres = dateformat.format(regDate);
        %>	
	<p><a style="font-weight:bold;">농장등록일:</a><%=regDateres %></p>
	
<!-- 주말농장 선택 영역 --><!------------------------------------------------>	
<form action="../farm.do" method="post">	
	<input type="hidden" name="command" value="buyrentfarm"/>  <!-- 커맨드 값 -->	
	<input type="hidden" name="mem_id" value="${sessionScope.dto.mem_id }"/>
	<input type="hidden" name="wfarm_key" value="<%=dto.getWfarm_key() %>"/>
	<input type="hidden" name="wfarm_image" value="../<%=dto.getWfarm_image().split("/")[0] %>"/>
	<input type="hidden" name="wfarm_title" value="<%=dto.getWfarm_title() %>"/>
	<input type="hidden" name="wfarm_price" value="<%=dto.getWfarm_price() %>"/>
	<input type="hidden" name="selectedCnt" id="selectedCnt" value=""/>
<!-- 주말농장 선택영역 -->
	<input type="button" id="buyfarm" value="주말농장 선택" onclick="selectfarm();"
		style="background: green;
    width: 200px;
    height: 50px;
    border-radius: 15px;
    font-weight: bold;
    font-size: 16px;
    color: white;"/>
    
   <!-- 선택시 show될 태그 -->
   <div id="hiddentag" style="display:none;">
   <hr style="width: 75%; margin-left: -5%;"/>
   <p style="font-weight:bold;">선택된 평수:&nbsp;<a type="text" id="receiveFromPopup"></a>평 x <%=dto.getWfarm_price() %>원</p> 
   
   	선택한 주말농장 위치: <input type="text" name="mf_area" id="selectedArea" value="" readonly/>
   
   <p>총 금액:&nbsp;<a type="text" id="receiveFromTotal"></a>원</p>
   				<input type="hidden" name="totalprice" id="sendtotalprice"/>
	<input type="submit" value="신청하기" style="background:red; font-weight:bold; color:white; width:250px; height:50px; border-radius:15px;"/>
	
	</div>
	<!-- 선택시 show될 태그 -->	
<!-- 주말농장 선택영역 -->	
</form>
<!-- 주말농장 선택 영역 --><!------------------------------------------------>		
	</div><br/>
	<hr style="width:70%;"/>
	<div style="text-align:center;">
		<img alt="img" src="../resources/images/farm/farmintromarin.png" style="width: 50%;"/><br/>  <!-- fix이미지 -->
		<p style="font-size:18px;"><b>EveryFarm에서는 농작물관련된 지식이 없는 사람에게도 익숙하게 농사지을 수 있도록 농작물 도감을 공유하고 있습니다.</b></p><br/>
		<img alt="img" src="../resources/images/farm/smartfarm.png" style="width: 50%;"/><br/>
		<p style="font-size:18px;"><b>일상에 지친 여러분의 기분을 전환할 수 있도록 최첨단 SmartFarm시스템을 도입</b></p><br/>
		<img alt="img" src="../resources/images/farm/smartfarm01.jpg" style="width: 50%;"/>
		<p style="font-size:18px;"><b>EveryFarm과 제휴된 주말농장은 각 토지마다 iot(CCTV/물주기)기능을 탑재하고 있습니다.</b></p>
		<br/><br/><br/>
	</div>	
	<div style="margin: 0% 0% 0% 20%;">
		<a style="font-weight:bold;">주말농장 소개</a>
	</div>	
		
	<div style="margin: -2.1% 0% 0% 40%;">	
		<p><%=dto.getWfarm_content().split("/")[0] %></p>
		<img alt="img" src="../<%=dto.getWfarm_image().split("/")[1]%>" style="width:50%; height:350px;"/>
		<p><%=dto.getWfarm_content().split("/")[1] %></p>
		<img alt="img" src="../<%=dto.getWfarm_image().split("/")[2]%>" style="width:50%; height:350px;"/>
		<p><%=dto.getWfarm_content().split("/")[2] %></p>
		<img alt="img" src="../<%=dto.getWfarm_image().split("/")[3]%>" style="width:50%; height:350px;"/>
		<p><%=dto.getWfarm_content().split("/")[3] %></p>
	</div>
	<br/><br/>
	<div style="margin: 0% 0% 0% 20%;">
		<a style="font-weight:bold;">주말농장 위치</a>
		
		<!-- 카카오 지도 API영역 -->
			<div id="map" style="width:60%;height:250px;"></div>
		<!-- 카카오 지도 API영역 -->
		<span>주소:&nbsp;&nbsp;<%=dto.getWfarm_addr() %>(<%=dto.getWfarm_zoneCode()%>)</span>
		
	</div><br/><br/>	
	<div style="margin: 0% 0% 0% 20%;">
		<p><b>고객센터</b></p><hr/>
		<p>채팅/게시판 문의</p>
		<p>현재 페이지 상단의 고객센터 메뉴를 클릭하여 문의해 주십시오.</p>
		<br/>
		<p>이메일 문의(24시간 접수)</p>
		<p>kdy41000@naver.com / 운영시간에 순차적으로 답변드립니다.</p>
		<br/>
		<p>전화 문의(평일 09시~18시)</p>
		<p>010-1234-1234</p>
	</div><br/><br/>
</section>
<%@ include file="../home/footer.jsp" %>

<script type="text/javascript">
	function selectfarm(){         //주말농장 선택 함수

		if(${empty sessionScope.dto.mem_grade}){
			alert("로그인이 필요합니다.");
		}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
			alert("권한이 없습니다.");
		}else{
		  var url="selectfarm.jsp";
          window.open(url,"","width=500,height=500,left=500,top=100");
		}
	}
</script>
<script type="text/javascript">
function message(){               //쪽지 보내기 함수
	
	if(${empty sessionScope.dto.mem_grade}){
		alert("로그인이 필요합니다.");
	}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
		alert("권한이 없습니다.");
	}else {

		window.open("message.jsp","","width=400,height=600,left=500,top=100");
	}
}

</script>
<!-- 카카오 지도 API영역 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d9572bef9b32679eb142b46f095de65&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=dto.getWfarm_addr() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
    	

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
        
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords

        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=dto.getWfarm_title() %></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);

    }
    
});   

</script>
<!-- 카카오 지도 API영역 -->
</body>
</html>