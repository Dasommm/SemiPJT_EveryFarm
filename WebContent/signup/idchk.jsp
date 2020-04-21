<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	onload=function(){   //회원가입 창에서 입력한 아이디를 현재 팝업창으로 가져와 끼워넣는 함수
		var parentid = opener.document.getElementsByName("mem_id")[0].value;  //opener함수 : 부모창과 자식창의 텍스트를 교환하는 함수
		document.getElementsByName("mem_id")[0].value = parentid;
	}

	function myconfirm(bool){
		if(bool=='true'){    //아이디를 사용할 수 있으면
			opener.document.getElementsByName("mem_pw")[0].focus();
			opener.document.getElementsByName("mem_id")[0].title='y';
	
		}else{       //아이디를 사용 할 수 없으면
			opener.document.getElementsByName("mem_id")[0].focus();
		}
		self.close();
	}
</script>
</head>
<%                                         //idnotused (true/false)
	String idnotused = request.getParameter("idnotused");  //넘어올 때는 String형으로 바뀌기 때문에 String형으로 받는다.
%>
<body>
	
	<fieldset>	
	<img alt="img" src="../resources/images/signup/idchk.png" style="width:150px; height:150px; margin: 50px 0px 0px 200px;"/>
		
	<table style="       margin: 00px 0px 0px 70px;">
	
		<tr>
			<td><input type="text" name="mem_id" value="parentid" readonly style="width:400px; height:30px; border-radius:5px; border: 1px solid #bb8080;"/></td>
		</tr>
		<tr>
		<% if(idnotused.equals("true")){ 
		%>
			<td style="color:blue; font-weight:bold; font-size: 18px;">아이디 생성 가능</td>
			<% }if(idnotused.equals("false")){ 
			%>
				<td style="color:red; font-weight:bold; font-size: 18px;">중복된 아이디 존재</td>
		<%	
			}
			%>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="myconfirm('<%=idnotused %>');" style=" width:400px; height:50px; color:white; font-weight:bold; border-radius:10px; background:black;"/>  <!-- 스크립트에서 문자열을 전달할 때 싱글쿼테이션 사용해야한다 -->
			</td>
		</tr>
	</table>
	</fieldset>
</body>
</html>