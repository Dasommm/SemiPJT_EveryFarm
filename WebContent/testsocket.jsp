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
<body>

    <fieldset style="width:20%; height:600px; background:#442e2e; border-radius: 10px;">
		<p style="color:white;"><b>EveryFarm</b> 1:1채팅 문의</p>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true" style="width:95%; height:450px; border-radius:10px; resize: none;"></textarea>

        <br/>

        <input id="inputMessage" type="text" style="width:63%; height:25px; border-radius:5px;"/>

        <input type="submit" value="send" onclick="send()" style="width:30%; height:30px; background:#c12317; border-raius:10px; color:white; font-weight:bold; font-size:15px;"/>

    </fieldset>

</body>

    <script type="text/javascript">

        var textarea = document.getElementById("messageWindow");

        var webSocket = new WebSocket('ws://localhost:8787/EveryFarm/broadcasting');

        var inputMessage = document.getElementById('inputMessage');

    webSocket.onerror = function(event) {

      onError(event)

    };



    webSocket.onopen = function(event) {

      onOpen(event)

    };



    webSocket.onmessage = function(event) {

      onMessage(event)

    };



    function onMessage(event) {

        textarea.value += "상대 : " + event.data + "\n";

    }



    function onOpen(event) {
    	
        textarea.value += "연결 성공\n";

    }



    function onError(event) {

      alert(event.data);

    }



    function send() {

        textarea.value += "나 : " + inputMessage.value + "\n";

        webSocket.send(inputMessage.value);

        inputMessage.value = "";

    }

  </script>
</html>