<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/chatting/chat.css"
		  rel="stylesheet"
		  type="text/css" />
</head>
<body>
<%
	MemberDto memdto = (MemberDto)session.getAttribute("dto");
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function exit(){
		self.close();
	}
</script>
<script type="text/javascript">
	$(function(){
		$('#sendbtn').hover(function(){
			$(this).css('color','white').css('background','skyblue');
		},function(){
			$(this).css('color','skyblue').css('background','white');
		});
		
		$('#exitbtn').hover(function(){
			$(this).css('color','white').css('background','red');
		},function(){
			$(this).css('color','red').css('background','white');
		});
	});
</script>
<div class="chat" style="border: 1px solid black; margin-top: 2%;">
<div class="new">
    		<p style="color:white; font-weight:bold; font-size: 20px; font-family: inherit;">EveryTalk</p>
  		</div>
	  <section class="messages" style="width:100%; background: rgb(33, 13, 5);">
			<body>
			    <fieldset style="width: 100%; height: 580px; border: none;">
			        <textarea id="messageWindow" rows="15" cols="60" readonly="true" style="resize:none; width: 100%; height: 90%; border-radius: 10px; border: 2px solid #b35e5e; font-family:sans-serif;"></textarea>
			        <br/>
			        <img alt="img" src="../resources/images/chatting/lefticon.png" style="width:40px; height:40px;">
			        <input type="hidden" id="id" value="${sessionScope.dto.mem_id }"/>
			        <input id="inputMessage" type="text" style="width: 250px;
    					height: 27px;
   						 border: 1px solid #FF9800;
   						 margin-top: 1%;
   						 border-radius: 5px;"/>
			        <input type="submit" value="send" onclick="send();" id="sendbtn" style="border: 3px solid skyblue; background-color: white; color: skyblue; padding: 5px; width:120px; height:30px; font-size:14px; font-weight:bold;"/>
			         <input type="button" value="exit" onclick="exit();" id="exitbtn" style="border: 3px solid red; background-color: white; color: red; padding: 5px; width:120px; height:30px; font-size:14px; font-weight:bold;"/>
			    </fieldset>
			</body>
		</section>
		</div>
</body>
  <script type="text/javascript">
  $(function(){
	  
	 $('#inputMessage').keypress(function(){  //엔터키 눌러서 send
		 if (window.event.keyCode == 13) {

			 send();
		 }
	  });
  });
  /*******************************************/
        var textarea = document.getElementById("messageWindow");
  		//ipv4 주소 변경해야함
        var webSocket = new WebSocket('ws://172.30.1.50:8787/EveryFarm/broadcasting');  //localhost를 상대방ip주소로 변경
        var inputMessage = document.getElementById('inputMessage');
        var id = document.getElementById("id").value;
       
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {   //상대가 보낸 메세지(파라미터)
    
  	  document.getElementById("messageWindow").scrollTop = document.getElementById("messageWindow").scrollHeight;	
      onMessage(event)          //onMessage함수실행(파라미터 전달)
    };

    function onMessage(event) {
        textarea.value += event.data + "\n";
    }

    function onOpen(event) {
    	
        textarea.value += "${sessionScope.dto.mem_id}님이 접속하셨습니다.\n";
      
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
    	var inputVal = document.getElementById("inputMessage").value;
    	if(inputVal.length==0){
    		return false;
    	}else{
        	textarea.value += "${sessionScope.dto.mem_id}(${sessionScope.dto.mem_name}) : " + inputMessage.value + "\n";
        	webSocket.send(id + " : " + inputMessage.value);
        	inputMessage.value = "";   //보낸 후 input태그 공백으로 돌리기
 
        	//스크롤바 가장 하단으로 내리기
      	    document.getElementById("messageWindow").scrollTop = document.getElementById("messageWindow").scrollHeight;



    	}
    }
  </script>
</html>