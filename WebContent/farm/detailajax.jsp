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

</head>
<%
	FarmDto dto = (FarmDto)session.getAttribute("farmdto");
	int totalArea = dto.getWfarm_totalArea();   //총평수
%>
<body>

	
<br/><br/>
<%
String soldoutVal = (String)session.getAttribute("selectedArea"); //이미 선택된 땅 세션get
//(1,2,3)
System.out.println(soldoutVal+"::이건 땅선택 팝업창");

String[] soldoutParam;
soldoutParam = soldoutVal.split(",");  //soldoutParam[1,2,3]

//int soldout[] = {1,3,5}; // 해당 주말농장의 판매된 지역번호를 뽑아왔음. (db에서)
int[] soldout = new int[soldoutParam.length];   //length3인 배열 변수선언
for(int i=0 ; i < soldoutParam.length; i++){    //3번 반복
	System.out.println(soldoutParam[i]+"i");
	soldout[i] = Integer.parseInt(soldoutParam[i]);    //String->int형 배열로
}	

	for(int i = 0; i < totalArea; i++){ //총 농장수만큼 포문
%>
	
<%		
		for(int j = 0; j <soldout.length ; j++){ //판매된 농장수만큼 포문
			if(i == soldout[j]){
%>
	<script type="text/javascript">
	 	$('.areaimg').eq(<%=i%>).attr('src','../resources/images/farm/soldout.png');
	 	$('.ground').eq(<%=i%>).css('background','red').css('cursor','not-allowed');
	 	$('.ground').eq(<%=i%>).removeAttr('onclick');

	</script>
<%				
			}
		}
	}
%>	

</form>
</body>
</html>