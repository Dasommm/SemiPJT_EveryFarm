<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.member.biz.MemberBiz"%>
<%@page import="com.everyfarm.member.biz.MemberBizImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/signup/additionalinfo.css"    
	  rel="stylesheet"    
	  type="text/css" />  
<%
	String mem_email = (String)session.getAttribute("mem_email");
	String mem_name = (String)session.getAttribute("mem_name");
	String mem_id = (String)session.getAttribute("mem_id");
	System.out.println("additional 들어왓띠ㅏ");
	
	MemberBiz biz = new MemberBizImpl();
	List<MemberDto>list = biz.apiEmailChk(mem_id);
	if(list.size() > 0){  //이미있는회원이면(홈화면으로)
%>
	<script type="text/javascript">
		location.href="../apilogin.do?command=alreadyused&mem_id=<%=mem_id%>";
		</script>
<%
	}
%>
<%@ include file="../home/header.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 도로명 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){            //도로명주소 클릭시 함수 실행
	$("#mem_zonecode").click(function(){

		openDaumZipAddress();
	
	});
	
});
function openDaumZipAddress() {   //클릭시 실행되는 함수
	
	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#postcode1").val(data.postcode1);

			jQuery("#postcode2").val(data.postcode2);

			jQuery("#mem_zonecode").val(data.zonecode);

			jQuery("#mem_addr").val(data.address);

			jQuery("#mem_addretc").focus();

			console.log(data);

		}

	}).open();
	$("#detail01").show();
	$("#detail02").show();
}
</script>
</head>
<body>

</head>
<body>
<section style="height:800px; background: #eaeaea;">
<br/>
<div class="container" style="height: 600px;">

<div class="page-header">
    <h1 style="color: black;
    text-align: center;">추가정보입력 <small>회원가입을 환영합니다.</small></h1>
</div>

<!-- Contact Us Form - START -->

<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="text-center">Contact us</h3>
                       
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                       		<div class="col-md-6">
                       		 <img src="../resources/images/signup/naver.png" style="width: 70px;  height: 60px; margin-left: 75%;">
                     
                                <form action="../apilogin.do" method="post">
                         
								<input type="hidden" name="command" value="inputinfores"/>
								<input type="hidden" name="mem_id" value="<%=mem_id%>" readonly style="  margin-top: 70px;"/>
								<input type="hidden" name="mem_pw" value="1" readonly/>
								<input type="hidden" name="mem_grade" value="1"/>
									<br>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_name">이름</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input  type="text" name="mem_name" value="<%=mem_name %>" readonly class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_email">E-mail</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input  type="text" name="mem_email" value="<%=mem_email %>" readonly class="form-control" placeholder="이메일을 입력하세요">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_phone">핸드폰</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="mem_phone" id="mem_phone" class="form-control" placeholder="번호를 입력하세요">
                                        </div>
                                    </div>
                            	</div>
                            	<div class="col-md-6">
                            	   <img src="../resources/images/signup/kakao.png" style="width: 70px;height: 60px;">
                            	<br><br>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_zonecode">우편번호</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="mem_zonecode" id="mem_zonecode" class="form-control" placeholder="Click" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_addr">주소</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="mem_addr" id="mem_addr" class="form-control" placeholder="" readonly>
                                        </div>
                                    </div>
									<div class="form-group row">
                                        <div class="col-md-4">
                                            <label for="mem_addretc">상세주소</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" name="mem_addretc" id="mem_addretc" class="form-control" placeholder="상세주소를 입력하세요">
                                        </div>
                                    </div>
                                    <br>
                                   
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                        </div>
                                        <div class="col-md-8">
<input type="submit" value="회원가입" style="color:white; font-weight:bold; background:black; border-radius:5px;     height: 35px;
    margin-top: 20px;margin-left: -320px;
    width: 370px;"/>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <br>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
</section><style>
    body {
        font-family: 'PT Sans', sans-serif;
    }

    .container-fluid {
        background: url("http://www.prepbootstrap.com/Content/images/shared/misc/contact-us.png");
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100%;
    }

    hr {
        border: 1px solid #354458;
    }

    .panel {
        margin-top: 50px;
        margin-right: 10px;
    }

    .col-md-8 > button {
        display: block;
        margin: auto;
    }

    .social > a {
        width: 100%;
    }
    label{
    	font-weight:bold;
    	color:black;
    }
</style>
<%@ include file="../home/footer.jsp" %>	
</body>
</html>