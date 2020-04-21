<%@ page language="java" 
    pageEncoding="UTF-8"%>
     
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%
	String checkNum =request.getParameter("page");
%>

<body>
<script type="text/javascript">   //네이버 로그인 팝업창(정보 담아서 컨트롤러로 전송)
  var naver_id_login = new naver_id_login("JxTGu3NwgjDwUWLQsqlR", "http://localhost:8787/EveryFarm/login/naverloginsdk.jsp");
  // 접근 토큰 값 출력
 //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   	 	//alert(naver_id_login.getProfileData('email')+"email");
   		//alert(naver_id_login.getProfileData('name')+"name");
		//alert(naver_id_login.getProfileData('id')+"id");
		alert("로그인에 성공했습니다.");
		  var mem_email = naver_id_login.getProfileData('email');
		  var mem_name = naver_id_login.getProfileData('name');
		  var mem_id = naver_id_login.getProfileData('id');
		
		  location.href="../apilogin.do?command=login&mem_email="+mem_email+"&mem_name="+mem_name+"&mem_id="+mem_id;	
  }
</script>
	
</body>
</html>