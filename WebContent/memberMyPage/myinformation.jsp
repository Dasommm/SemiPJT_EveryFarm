<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<title>내정보 수정</title>
<!-- 도로명 API -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){            //도로명주소 클릭시 함수 실행
	$("#zonecode").click(function(){
		openDaumZipAddress();
	});
});
function openDaumZipAddress() {   //클릭시 실행되는 함수
	new daum.Postcode({
		oncomplete:function(data) {
			jQuery("#postcode1").val(data.postcode1);
			jQuery("#postcode2").val(data.postcode2);
			jQuery("#zonecode").val(data.zonecode);
			jQuery("#address").val(data.address);
			jQuery("#address_etc").focus();
			console.log(data);
		}
	}).open();
	$("#detail01").show();
	$("#detail02").show();
}
</script>
<style type="text/css">
	.row{margin-top:30px;}
	.button{width: 100px; height:30px;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>

<div class="container-fluid" >
<form action="../memberMyPage.do?command=myinfoupdate" method="post">
<input type="hidden" name="mem_id" value="${dto.mem_id }">
          <div class="row">
          <%@ include file="../home/sidemenu.jsp" %>
            <div class="col">
              <h3 align="center" ><strong>내 정보 조회/수정</strong></h3>
              <div class="row">
                <div class="col-md-8 col-lg-8 " id="infotable"> 
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>아이디</th>
                        <td>${dto.mem_id }</td>
                      </tr>
                      <tr>
                        <th>비밀번호</th>
                        <td><input type="text" class="form-control" name="mem_pw" value="${dto.mem_pw }"></td>
                      </tr>
                      <tr>
                        <th>이름</th>
                        <td>${dto.mem_name }</td>
                      </tr>
                      <tr>
                        <th>휴대폰 번호</th>
                        <td><input type="text" class="form-control" name="mem_phone" value="${dto.mem_phone }"></td>
                      </tr>
                      <tr>
                        <th>이메일</th>
                        <td><input type="text" class="form-control" name="mem_email" value="${dto.mem_email }"></td>
                      </tr>
                      <tr>
                        <th>주소</th>
                        <td><input type="text" class="form-control" value="${dto.mem_zonecode }" name="mem_zonecode" id="zonecode" readonly/><br>
  							<input type="text" class="form-control" value="${dto.mem_addr }" name="mem_addr" id="address" readonly /><br>
  							<input type="text" class="form-control" value="${dto.mem_addretc }" name="mem_addretc" id="addr_etc" >
  						</td>
                      </tr>
                      <tr>
                        <th>가입일</th>
                        <td>${dto.mem_regdate }</td>
                      </tr>
                      <tr>
                      	<td colspan="2" align="center">
                      	 <input class="button" type="submit" value="수정">
                	     <input class="button" type="button" value="취소" onclick="history.back();">
                      	</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              </div>
         </div>
     </form>
</div>
<%@ include file="../home/footer.jsp" %>
<script type="text/javascript">
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../login/loginform.jsp";
	}
</script>

</body>
</html>