<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!-- 네이버 로그인 -->
<!-- 카카오 로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 카카오 로그인 -->       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="../resources/css/login/loginform.css"
	  rel="stylesheet"
	  type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../resources/js/login/loginform.js"></script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<section style="height:90%;">

<div id="wrap" class="wrap">
<div class="wrap-inner">

<!--Login Section-->
<div class="section" id="section1">
  <div class="form form--login">
    <h1 class="alpha">Login</h1>
    <p>You already have an account? Great! Login here.</p>
    <div>
    <!-- 로그인 -->
      <form class="form-wrap" action="../login.do" method="post">
      	<input type="hidden" name="command" value="loginres"/>
        <input name="mem_id" id="" value="" class="inputbox email" type="text" placeholder="Id" />
        <input name="mem_pw" id="" value="" class="inputbox password" type="password" placeholder="Password" />
        <input type="submit" value="Login" style="width:400px; height:50px; color:white; background:black; border-radius:10px;"/>
      </form>
      <!-- 로그인 -->
      <!-- 아이디,패스워드 찾기 -->
      <p>Forget id? It's ok. <a style="text-decoration: none; color:red;"href="#" onclick="location.href='../login.do?command=searchaccount';"><b>Search for ID</b></a></p>
      <p>Forget password? It's ok. <a style="text-decoration: none; color:red;"href="#" onclick="location.href='../login.do?command=searchaccount';"><b>Search for Password</b></a></p>
    </div>
    <!-- 아이디,패스워드 찾기 -->
    <hr />
    Or you can Login with one of the following
    <div class="social">
      <!-- 네이버아이디로로그인 버튼 노출 영역 -->
 		 <div id="naver_id_login" style="margin: -30px 0px 0px 0px;"></div>
		<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		<!-- 카카오 로그인 버튼 노출 영역 -->
			<a id="kakao-login-btn" style="margin: -10px 0px 0px 0px;"></a><br/>
			<a href="http://developers.kakao.com/logout"></a>
<!-- //카카오 로그인 버튼 노출 영역 -->
    </div>
    <!-- 회원가입 버튼 -->
  <input type="button" onclick="location.href='../signup.do?command=signup';" value="SignUp" style="width: 40%;
    height: 7%; background:red; color:white; font-weight:bold; border-radius:10px;"/>
  </div>
</div>
<!--END: Login Section-->
 


</div>
</div>

</body>

<!-- //네이버아이디로로그인 버튼 노출 영역 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("JxTGu3NwgjDwUWLQsqlR", "http://localhost:8787/EveryFarm/login/naverloginsdk.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,50);
  	naver_id_login.setDomain("http://localhost:8787/EveryFarm/login/naverloginsdk.jsp");  //callback함수 경로
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
   
  	 //location.href="home.jsp?naver_email="+naver_email+"&naver_name="+naver_name+"&naver_id="+naver_id;

  </script>
  <!-- 네이버아이디로 로그인 버튼 노출 영역 -->
  <!-- 카카오 로그인 버튼 노출 영역 -->
  <script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b2d925f213a75cac82639ca9570867ca');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
  
    Kakao.Auth.createLoginButton({

    	   container: '#kakao-login-btn',

    	   success: function(authObj) {

    	     Kakao.API.request({

    	       url: '/v2/user/me',

    	       success: function(res) {

    	             //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

    	             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

    	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

    	             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

    	             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
					var mem_email = res.kakao_account.email;
    	            var mem_id = res.id;
    	            var mem_name = res.properties['nickname'];
    	            
    	            //alert(mem_email+"::카카오이메일");
    	            //alert(mem_id+"::카카오아이디");
    	            //alert(mem_name+"::카카오이름");
    	            location.href="../apilogin.do?command=login&mem_email="+mem_email+"&mem_name="+mem_name+"&mem_id="+mem_id;	
    	         // res.properties.nickname으로도 접근 가능 )

    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

    	           }

    	         })

    	       },

    	       fail: function(error) {

    	         alert(JSON.stringify(error));

    	       }

    	     });

    	//]]>

</script>
<!-- 카카오 로그인 버튼 노출 영역 -->
</section>
<%@ include file="../home/footer.jsp" %>
</html>