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
.ajax01{
	position:absolute;
}
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
liveBestRank();  //실시간 참여인원 - 1초마다

function liveBestRank(){
   $.ajax({
        type: "post",
        url: "../product.do?command=curBestRank",
        /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
        success: function(data){ // callback함수 --> 결과값 돌려받는다.
           $(".ajax01").html(data); // 결과 출력
          
        },
        error: function(){
          // alert("오류");
        }
   	  });
     setTimeout(liveBestRank,10000);
  
	}
});

      setInterval(function(){
	  $(".ajax01").toggle();
	}, 1000);
</script>
<body>
<section style="heigth:50px; background:#190700;">
	<img alt="img" src="../resources/images/home/sectiontwo/besticon.png" style="width:25px; height:23px; margin-left: 62%;"/>
	<span class="togglefont" style="color:white;">경매 현재 Best상품 1위:</span>&nbsp;&nbsp;&nbsp;
	<span class="ajax01"><!-- 에이작스 영역 --></span>
</section>
</body>
</html>