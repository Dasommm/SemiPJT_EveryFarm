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
.slide_diagonal:hover {
  box-shadow: inset 400px 50px 0 0 #D80286;
}

#outer {
  width: 364px;
  margin: 50px auto 0 auto;
  text-align: center;
}
.button_slide {
  color: #FFF;
  border: 2px solid rgb(111, 162, 158);
  border-radius: 10px;
  padding: 5px 30px;
  height:50px;
  display: inline-block;
  font-family: "Lucida Console", Monaco, monospace;
  font-size: 14px;
  letter-spacing: 1px;
  cursor: pointer;
  box-shadow: inset 0 0 0 0 rgb(111, 162, 158);
  -webkit-transition: ease-out 0.4s;
  -moz-transition: ease-out 0.4s;
  transition: ease-out 0.4s;
}
@font-face{
		font-family: "Goyang";
		src: url("../resources/css/goyang/Goyang.ttf") format("truetype");  /* 고양체 파일 불러오기 */
	}
	#goyang{
		font-family: "Goyang";
		font-size:20px;
		font-weight:bold;
	}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<section style="height:3000px;">
	<img alt="img" src="../resources/images/siteintroduce/introimg01.png" style="width: 100%;"/>
	<div style="margin: 5% 0% 0% 25%;">
		<p>우리가</p>
	    <p><h5 style="font-weight:bold;">이 일을 하는 이유</h5></p><br/>
		<p>농부가 걱정 없이 농사 지을 수 있다면 어떨까요?</p>
		<p>정당한 가치를 인정받고 판매에 대한 걱정이 없어진다면 농부는 더 나은 농사에 집중할 수 있게 됩니다.</p><br>
		<p>도시에 사는 우리들은 농부가 정성들여 키운 건강한 먹거리를 먹을 수 있게 됩니다.</p>
		<p>농부가 별다른 걱정없이 농사지을 수 있도록 만드는 일은 우리 스스로를 위한 일과 같습니다.</p><br>
		<p>우리는 좋은 먹거리가 더 나은 삶을 만든다고 믿기에 매일 더 나은 먹거리 환경을 만들기 위해 노력됩니다.</p>
		<hr/>
		<img alt="img" src="../resources/images/siteintroduce/introimg02.png""/>
		<hr/><br/>
		<img alt="img" src="../resources/images/siteintroduce/introimg03.jpg" style="width:60%; height:450px;"/><br/>
		<p><b style="color:brown;">EveryFarm</b>에서는 직접 밭을 일구어 친환경으로 기른 작물들을 얻어 보다 값싼 가격에 유기농 농산물을 소비할 수 있습니다.</p><br/>
		<img alt="img" src="../resources/images/farm/smartfarm.png" style="width:60%; height:400px;"/><br/>
		<p>일상에 지치고 농작물을 관리할 시간이 부족한 고객을 위한, 각 토지마다 <b style="color:green;">최첨단 Iot시스템</b> 도입.</p><br/>
		<p><b style="color:brown;">주말농장 신청하러 가기</b></p>
		 <div class="button_slide slide_diagonal" id="goyang" style="color:black;" onclick="location.href='../farm.do?command=farmmain';">주말농장 신청하기 </div>
		<hr/>
		<br/>
		<h2 style="font-weight:bold;">CONTACT US</h2>

		<!-- 카카오 지도 API영역 -->
			<div id="map" style="width:60%;height:250px;"></div>
		<!-- 카카오 지도 API영역 -->
			<br/><br/><br/>		
		<img alt="img" src="../resources/images/siteintroduce/leftimg.png" style="margin: -5% 0% 0% 0%;"/>
		<div style="margin: -6.6% 0% 0% 5%;">서울특별시 강남구 테헤란로14길 6</div><div style="margin: 1.3% 0% 0% 5%;">02.759.5457</div>
		
			<img alt="img" src="../resources/images/siteintroduce/rightimg.png" style="margin: -9% 0% 0% 30%;"/>
			<div style="margin: -8.6% 0% 0% 35%;">02.759.5458</div><div style="margin: 1% 0% 0% 35%;">kdy41000@naver.com</div>
	</div>
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
geocoder.addressSearch('서울특별시 강남구 강남구 테헤란로14길 6', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">EveryFarm</div>'
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