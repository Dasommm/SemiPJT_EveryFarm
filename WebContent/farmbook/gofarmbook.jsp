<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/farmbook/gofarmbook.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
</head>
<body>
<%@ include file= "../home/header.jsp" %>
<section style="height:1250px;">
<img alt="img" src="../resources/images/farmbook/farmbookimg01.jpg" style="width:50%; height:400px; float:left;"/>
<img alt="img" src="../resources/images/farmbook/farmbookimg02.jpg" style="width:50%; height:400px; float:right;"/>
<section style="height:1000px;">
<img alt="img" src="../resources/images/farmbook/background.jpg" style="float:left; width:100%; height:500px;"/>
<img alt="img" src="../resources/images/farmbook/bookicon.png" style="float:left; width:21%; height:250px; margin: -20% 0% 0% 15%;"/>
<img alt="img" src="../resources/images/farmbook/videoicon.png" style="float:right; width:24%; height:330px; margin: -21% 15% 0% 0%;"/>
	<button class="btn" onclick="location.href='../farmbook.do?command=farmInfo';" style="margin: -5% 0% 0% 21%; float:left;"><span>품종 정보</span></button>
	<button class="btn" onclick="location.href='../farmbook.do?command=farmVideo';" style="margin: -5% 23% 0% 0%; float:right;"><span>농작물 기술 동영상</span></button>

</section>
<img alt="img" src="../resources/images/farmbook/farmbookimg03.jpg" style="width:50%; height:400px; float:left; margin-top:-6%;"/>
<img alt="img" src="../resources/images/farmbook/farmbookimg04.jpg" style="width:50%; height:400px; float:right; margin-top:-6%;"/>
</section>
<%@ include file= "../home/footer.jsp" %>
</body>
</html>