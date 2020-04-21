<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.everyfarm.eventboard.dto.EventBoardDto"%>
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
@font-face{
		font-family: "Goyang";
		src: url("../resources/css/goyang/Goyang.ttf") format("truetype");  /* 고양체 파일 불러오기 */
	}
	.goyang{
		font-family: "Goyang";
	}
</style>
</head>
<%
	EventBoardDto dto = (EventBoardDto)session.getAttribute("eventdetaillist");
%>
<body>
<%@ include file="../home/header.jsp" %>
<section>

	<img alt="sumnail" name="eve_img" src="../<%=dto.getEve_img().split("/")[0] %>" style="width:30%; height:450px; margin: 3% 0% 0% 15%;"/>
	
	<div class="sumnailcontent" style="margin: -20% 0% 0% 50%;">
	<h1><%=dto.getEve_title() %></h1><br/>
	
	<p style="color:green; font-size:20px;"><b style="color:brown;">EveryFarm</b>에서 제공하는 이벤트정보 .<br/>
	EveryFarm과 제휴된 각 지역의 이벤트정보를 여러분께 제공합니다.</p>
	<p style="color:green; font-size:20px;">문의사항은 EveryFarm고객센터로 연락주세요.</p><br/>
	<!-- fix내용 끝 -->
	<p class="goyang" style="font-weight:bold; font-size:18px;"><%=dto.getEve_content().split("/")[0] %></p>
	    <%
             Date regDate = dto.getEve_regDate();
             SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");	
             String regDateres = dateformat.format(regDate);
        %>
    <p><a class="goyang" style="font-weight:bold; font-size:18px;">작성자: </a>EveryFarm관리자</p>    	
	<p><a class="goyang" style="font-weight:bold; font-size:18px;">작성일: </a><%=regDateres %></p>
	

	</div><br/><br/>
	<hr style="width:70%;"/><br/>
	<div style="text-align:center;">
		<img alt="img" src="../<%=dto.getEve_img().split("/")[1] %>" style="width: 50%; height:500px;"/><br/>  <!-- fix이미지 -->
		<p class="goyang" style="font-size:18px;"><b><%=dto.getEve_content().split("/")[1] %></b></p><br/>
		<img alt="img" src="../<%=dto.getEve_img().split("/")[2] %>" style="width: 50%; height:500px;"/><br/>
		<p class="goyang" style="font-size:18px;"><b><%=dto.getEve_content().split("/")[2] %></b></p><br/>
		<br/><br/>
	</div>	
	<hr style="width:70%;"/>
	<div style="margin: 0% 0% 0% 20%;">
		<a style="font-weight:bold;">이벤트 위치</a>
		
		<!-- 카카오 지도 API영역 -->
			<div id="map" style="width:60%;height:250px;"></div>
		<!-- 카카오 지도 API영역 -->
		<span>주소:&nbsp;&nbsp;<%=dto.getEve_addr().split(" ")[1]+dto.getEve_addr().split(" ")[2] %>(<%=dto.getEve_addr().split(" ")[0]%>)</span>
		
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
geocoder.addressSearch('<%=dto.getEve_addr().split(" ")[1]+dto.getEve_addr().split(" ")[2] %>', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=dto.getEve_title() %></div>'
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