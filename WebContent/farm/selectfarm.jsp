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

<style type="text/css">
	.ground:hover{
		background:beige;
	}
</style>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<%
	FarmDto dto = (FarmDto)session.getAttribute("farmdto");
	int totalArea = dto.getWfarm_totalArea();   //총평수
%>
<body>
<!-- 에이작스 영역 -->
<script type="text/javascript">  
$(function(){
	Farm_selected();
function Farm_selected(){
    $.ajax({
         type: "post",
         url: "../farm.do?command=Farm_selected&wfarm_key=<%=dto.getWfarm_key()%>",
        
         success: function(data){ // callback함수 --> 결과값 돌려받는다.
            $(".ajax01").html(data); // 결과 출력
           
         },
         error: function(){
            //alert("오류");
         }
    });
    setTimeout(Farm_selected,20000);
 }
});
</script>
<!-- 에이작스 영역 -->
<section style="margin-left:7%; margin-top:10%;">
<form action="../farm.do" method="post" name="userinput">
	<h1>총 평수:&nbsp;<%=totalArea %></a>평</h1>
<span>test태그(현재선택한 땅갯수):</span><input type="text" id="area" readonly/>
<br/><br/><br/>
<%
	for(int i = 0; i < totalArea; i++){ //총 농장수만큼 포문
%>
	<!-- 땅 -->
		<a class="ground"
		style="width:150px; 
		height:180px; padding:15px; border:1.5px solid brown; border-radius:5px; 
		cursor:pointer;" onclick="sendVal(<%=i%>);">
	<!-- 땅 -->
	<!-- 이미지 -->	
		<img class="areaimg" alt="img" src="../resources/images/farm/farmimage.png" 
			style="width:60px; height:60px;"/>
	<!-- 이미지 -->
	<%
	if(i<10){
%>			
			0<%=i %>
<%
	}else{
%>		
		<%=i %>
<%
	}
%>		
		</a>

<%
	if((i+1)%5==0){
%>
	
	<br/>
<%	
		}

	}
%>	
	<br/><br/>
	<input onclick="btn();" type="button" class="sendbuttonOne" value="선택" style="width:250px; height:50px; color:white; font-weight:bold; font-size:18px; background:black; border-radius:10px; cursor:pointer; margin-left:25%;"/>	
<%
	for(int i = 0; i < totalArea; i++){ //총 농장수만큼 포문
%>	
<!-- 에이작스영역 -->
	<span class="ajax01">

	</span>	
	<!-- 에이작스영역 -->	

	
<%	
	}
%>


</section>
<script type="text/javascript">

		var selectArea = new Array();
		var areaCnt = 0 ; // 땅번호
	
	function sendVal(val){   //주말농장 위치 전달 받는 함수(val==땅번호)
		
		selectArea[areaCnt] = val;
		//alert(selectArea[0]+"::셀렉트에리아"+selectArea.length);
		areaCnt +=1;
 	    $('.areaimg').eq(val).attr('src','../resources/images/farm/locationcheck.png');
 	   $('.ground').eq(val).css('cursor','not-allowed');
 	   $('.ground').eq(val).removeAttr('onclick');
 	    $('#area').val(selectArea.length);
	}
	
	function btn(){
		var totalAreaCnt = document.getElementById("area").value;
		//alert(totalAreaCnt+"::토탈에리아 카운트다");
		if(totalAreaCnt==0){
			alert("선택한 농장이 없습니다.");
			self.close();
		}else{
			//alert(selectArea+"::셀렉트에리아다");
		//alert(selectedArea+"::선택된 땅의 수");
		$("#hiddentag",opener.document).css("display","block");
		opener.document.getElementById("receiveFromPopup").innerHTML = totalAreaCnt;
		opener.document.getElementById("selectedArea").value = selectArea;
		opener.document.getElementById("receiveFromTotal").innerHTML = totalAreaCnt*<%=dto.getWfarm_price()%>;
		opener.document.getElementById("sendtotalprice").value = totalAreaCnt*<%=dto.getWfarm_price()%>;
		opener.document.getElementById("selectedCnt").value = totalAreaCnt;
		
		self.close();
		}
	}
	
</script>
</body>
</html>