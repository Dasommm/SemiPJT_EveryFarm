<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.everyfarm.eventboard.dto.EventBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.everyfarm.eventboard.dto.EventPagingDto"%>
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
@font-face{
		font-family: "Goyang";
		src: url("../resources/css/goyang/Goyang.ttf") format("truetype");  /* 고양체 파일 불러오기 */
	}
	.goyang{
		font-family: "Goyang";
	}
</style>
<script type="text/javascript" src="../resources/js/eventboard/eventboardlist.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/eventboard/eventboardlist.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/eventboard/table.css"    
	  rel="stylesheet"    
	  type="text/css" />
<link href="../resources/css/eventboard/button.css"    
	  rel="stylesheet"    
	  type="text/css" />
<link href="../resources/css/eventboard/paging.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/eventboard/sectionOne.css"    
	  rel="stylesheet"    
	  type="text/css" /> 	   	  	   	  	   	  
</head>
<body>
<script type="text/javascript">
$(function() {
    $('.scroll-down').click (function() {
      $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
      return false;
    });
  });
</script>
<script type="text/javascript">
$(function(){
	if(${sessionScope.dto.mem_grade ==3}){
		$(".wrapper").show();
		$(".user-mobile").show();
		$("#chkth").show();
	}
});

	function deleteboard(){
		var seqs = document.getElementsByName("chkVal");
		var form = document.getElementById("form");
		
		if($('input:checkbox[name="chkVal"]').is(":checked") == false){
			alert("하나이상 선택해주세요.");
		}else{
			form.submit();
		}
	}
</script>
<%@ include file="../home/header.jsp" %>
<section style="height:1800px;">

<section style="background: #dccdcd;">
<!-- 꾸미는 영역 --><br/>
  <h1 class="goyang" style="font-weight:bold; color:#794b3a; font-size:50px;">EveryFarm 이벤트 정보</h1>
  
  <p class="goyang">아래 버튼을 클릭하여 EveryFarm에서 제공하는 이벤트 정보를 확인하세요.</p>
  
  <div class="wrap">

    <figure class="tint">
      <img src="../resources/images/eventboard/topleft.jpg" alt="" width="400" height="270" />
    </figure>
    
    <figure class="tint t2">
      <img src="../resources/images/eventboard/topright.jpg" alt="" width="400" height="270" />
    </figure>
    
    <figure class="tint t3">
      <img src="../resources/images/eventboard/bottomleft.jpg" alt="" width="400" height="270" />
    </figure>
    
    <figure class="tint t4">
      <img src="../resources/images/eventboard/bottomright.jpg" alt="" width="400" height="270" />
    </figure>

  </div><!-- .wrap -->
<!-- 꾸미는 영역 -->
<a style="margin-bottom: -6%;" href="#" class="scroll-down" address="true"></a>  <!-- 스크롤 -->
</section>
<%
	EventPagingDto currentpage = (EventPagingDto)session.getAttribute("eventpagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();
	
	List<EventBoardDto>eventlist = (List<EventBoardDto>)session.getAttribute("eventlist");
%>
<section class="ok" style="text-align:center; position:absolute; background:#d6d9e4; height: 1100px;">
<h2 class="goyang" style="color:orange; font-weight:bold; font-size:50px; margin-top:5%;">Event게시판</h2>
<!-- 테이블 영역 -->
<form action="../eventboard.do" method="get" id="form">
<table>
	<colgroup>
		<col width="5%"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="30%"/>
		<col width="19%"/>
		<col width="19%"/>
		<col width="5%"/>  
	</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>이미지</th>
							<th>작성자</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
							<th id="chkth" style="display:none;">선택</th>
						</tr>
					</thead>
					<tbody>
<%
	if(eventlist.size()==0){
%>					
	<td>게시글이 존재하지 않습니다.</td>
<%
	}else{
		for(int i = 0; i < eventlist.size(); i++){	
%>			

<input type="hidden" name="command" value="multidelete"/>				
						<tr>
						<td class="user-name"><%=eventlist.get(i).getEve_seq() %></td>
						<td class="user-name"><img style="width:30%; height:60px;"alt="img" src="../<%=eventlist.get(i).getEve_img().split("/")[0] %>"></td>
						<td class="user-email"><%=eventlist.get(i).getEve_writer() %></td>
						<td class="user-phone" style="cursor:pointer; color:green; font-weight:bold;" onclick="location.href='../eventboard.do?command=eventdetail&eve_seq=<%=eventlist.get(i).getEve_seq()%>';"><%=eventlist.get(i).getEve_title() %></td>
						<%
                         	Date regDate = eventlist.get(i).getEve_regDate();
                        	 SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");	
                         	String regDateres = dateformat.format(regDate);
                         %>
						<td class="user-name"><%=regDateres %></td>
						<td class="user-name"><%=eventlist.get(i).getEve_count() %></td>
						<td class="user-mobile" style="display:none;"><input type="checkbox" name="chkVal" value="<%=eventlist.get(i).getEve_seq() %>"/></td>
						</tr>
					
<%
		}
	}	
%>	
					</tbody>
					
				</table>
		</form>			
<!-- 테이블 영역 -->	

<!-- 관리자 글등록 -->
<div class="wrapper" style="margin: 12% 0% 0% 27%; display:none;">
  <a id="atag" href="#" onclick="location.href='../eventboard.do?command=writeboard';"><span>글쓰기</span></a>
</div>			
<!-- 관리자 글등록 -->
<!-- 관리자 글삭제 -->
<div class="wrapper" style="margin: 12% 0% 0% 39%; display:none;">
  <a id="atag" href="#" onclick="deleteboard();"><span>글삭제</span></a>
</div>	
		
<!-- 관리자 글삭제 -->
<!-- 페이징 영역 -->          
    <div class="pagination">
<%
	if(pagegroup > 1){
%>	
	<a href="../eventboard.do?command=eventboardlist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
<%
	}
	for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
	<a href="../eventboard.do?command=eventboardlist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>	
<%
	}
	if(endseq < currentpage.getTotalpage()){
%>
	<a href="../eventboard.do?command=eventboardlist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
<%		
	}
%>
</div>
<!-- 페이징 영역 -->

</section>

</section>
<%@ include file="../home/footer.jsp" %>

</body>
</html>