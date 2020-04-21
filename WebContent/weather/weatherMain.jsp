<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/weather/weatherMain.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="weatherAjax.js"></script>

<script type="text/javascript">


	function citySelect() {
		var city = document.getElementById("city").value;
		if (city == "1") {
			$("#villageOne").show();
			$("#villageTwo").hide();
		} else if (city == "2") {
			$("#villageTwo").show();
			$("#villageOne").hide();
		}
	}
	function selectVillage() {
		var res = document.getElementById("villageOne").value;
		document.getElementById("demo").value = res;

	}
	function selectVillageTwo() {
		var resTwo = document.getElementById("villageTwo").value;
		document.getElementById("demo").value = resTwo;

	}
</script>
</head>
<body>

	<%@ include file="../home/header.jsp"%>

	<div id="background-pic" style="background-image: url('../resources/images/weather/sunny_back.jfif')">
		<div class="weather_container">
		
		<div class="title_container">
			<span class="title">기상청이 제공하는 우리동네 날씨</span>
			<!-- 
		1.apach-xalan - xalan 2.7.2 - download - latest(xalan-j distribution directory) - binary - zip 
		2.기상청 날씨누리 - 생활과 산업 - 서비스- 인터넷 - rss 
	-->
			<br>
		<div class="selectBox">
			<select id="city" onchange="citySelect()">
				<option>--도시선택--</option>
				<option value="1">서울</option>
				<option value="2">경기도</option>
			</select> 
			<select id="villageOne" onchange="selectVillage()">
				<option>--동네선택--</option>
				<option value="1168066000">강남구</option>
				<option value="1174051500">강동구</option>
				<option value="1130553500">강북구</option>
				<option value="1150060300">강서구</option>
				<option value="1162058500">관악구</option>
				<option value="1121581000">광진구</option>
				<option value="1153059500">구로구</option>
				<option value="1154551000">금천구</option>
				<option value="1135059500">노원구</option>
				<option value="1132052100">도봉구</option>
				<option value="1123060000">동대문구</option>
				<option value="1159051000">동작구</option>
				<option value="1144056500">마포구</option>
				<option value="1141069000">서대문구</option>
				<option value="1165066000">서초구</option>
				<option value="1120059000">성동구</option>
				<option value="1129066000">성북구</option>
				<option value="1171063100">송파구</option>
				<option value="1147051000">양천구</option>
				<option value="1156055000">영등포구</option>
				<option value="1117053000">용산구</option>
				<option value="1138055100">은평구</option>
				<option value="1111060000">종로구</option>
				<option value="1114059000">중구</option>
				<option value="1126065500">중랑구</option>
			</select> 
			<select id="villageTwo" style="display: none;"
				onchange="selectVillageTwo()">
				<option value="4182025000">가평군</option>
				<option value="4128159000">고양시 덕양구</option>
				<option value="4128560000">고양시일산동구</option>
				<option value="4128757000">고양시 일산서구</option>
				<option value="4129052000">과천시</option>
				<option value="4121051000">광명시</option>
				<option value="4161051000">광주시</option>
				<option value="4131051000">구리시</option>
				<option value="4141062000">군포시</option>
				<option value="4157025300">김포시</option>
				<option value="4136053000">남양주시</option>
				<option value="4125055000">동두천시</option>
				<option value="4119074600">부천시</option>
				<option value="4113566500">성남시분당구</option>
				<option value="4113164000">성남시수정구</option>
				<option value="4113353000">성남시중원구</option>
				<option value="4111369000">수원시권선구</option>
				<option value="4111760000">수원시영통구</option>
				<option value="4111159100">수원시장안구</option>
				<option value="4111567000">수원시팔달구</option>
				<option value="4139062100">시흥시</option>
				<option value="4127352500">안산시단원구</option>
				<option value="4127160000">안산시상록구</option>
				<option value="4155042000">안성시</option>
				<option value="4117363000">안양시동안구</option>
				<option value="4117162100">안양시만안구</option>
				<option value="4163033000">양주시</option>
				<option value="4183031000">양평군</option>
				<option value="4167025000">여주시</option>
				<option value="4180031000">연천군</option>
				<option value="4137053000">오산시</option>
				<option value="4146352000">용인시기흥구</option>
				<option value="4146556000">용인시수지구</option>
				<option value="4146132000">용인시처인구</option>
				<option value="4143051000">의왕시</option>
				<option value="4115059500">의정부시</option>
				<option value="4150053000">이천시</option>
				<option value="4148035000">파주시</option>
				<option value="4122033000">평택시</option>
				<option value="4165033000">포천시</option>
				<option value="4145058000">하남시</option>
				<option value="4159056000">화성시</option>

			</select> <input type="hidden" id="demo" value=""> <input
				type="button" id="weaview" value="날씨보기"> <br>
				</div>
			</div>
			
			<div class="result" style="display: none;">
				<p id="pubData_title">
					기준 시간 <span id="pubData"></span>
				</p>

				<img alt="날씨정보" src="" id="weather_img" width="250" height="250">
				<table class="table_result">
					<tr>
						<td>기온</td>
						<td>습도</td>
						<td>강수확률</td>
					</tr>
					<tr >
						<td style="font-size: 25pt;"><span id="temp"></span>℃</td>
						<td style="font-size: 25pt;"><span id="reh"></span>%</td>
						<td style="font-size: 25pt;"><span id="pop"></span>%</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="../home/footer.jsp"%>


</body>
</html>