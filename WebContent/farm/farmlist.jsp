<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.everyfarm.farm.dto.FarmPagingDto"%>
<%@page import="java.util.List"%>
<%@page import="com.everyfarm.farm.dto.FarmDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/farm/farmlist.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/farm/farmlist.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/auction/selectbox.css"    
	  rel="stylesheet"    
	  type="text/css" />  	   
</head>
</head>
<%
	FarmPagingDto currentpage = (FarmPagingDto)session.getAttribute("farmpagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();
	
	int pagingGubun =1; //1이면전체 페이징, 2이면 선택값 WHERE에 준후 페이징  
	
	//BY추가
	String listGubun = (String)session.getAttribute("listGubun"); 
	String backParamtype = (String)session.getAttribute("backParamtype"); 
	List<FarmDto>farmlist = (List<FarmDto>)session.getAttribute("farmlist");
	int cnt = farmlist.size();
%>
<script type="text/javascript">


	$(function(){
		$("#zone").change(function(){
		var zone = document.getElementById("zone").value;
			if(zone=="서울"){
				$("#zoneone").show();
				$("#zonetwo").hide();
			}else if(zone=="경기도"){
				$("#zonetwo").show();
				$("#zoneone").hide();
			}
		});
		
		$("#btnOne").click(function(){
			var zone = document.getElementById("zone").value;
			if(zone=="서울"){
				 zoneoneval = $("#zoneone option:selected").val();
				location.href="../farm.do?command=searchArea&currentpage=1&paramtype="+zoneoneval;
			
			}else if(zone=="경기도"){
				 zonetwoval = $("#zonetwo option:selected").val();
				location.href="../farm.do?command=searchArea&currentpage=1&paramtype="+zonetwoval;
			}
			
		});
		
	});
	
</script>
<body>
<%@ include file="../home/header.jsp" %>
<main>
<section>
<img alt="img" src="../resources/images/farm/rentfarmintro01.png" style="float:left; width:33.3%; height: 320px;">
<img alt="img" src="../resources/images/farm/rentfarmintro02.png" style="float:left; width:33.35%; height: 320px;"/>
<img alt="img" src="../resources/images/farm/rentfarmintro03.png" style="float:left; width:33.3%; height: 320px;"/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<h1 class="bestproduct" style="font-family: initial; color: chocolate; font-weight:bold;">EveryFarm 주말농장</h1><br/>
<a style="margin-left:600px;" id="titleone">지역별:</a><select id="zone">
		<option>서울</option>
		<option>경기도</option>
	</select>
	<select id="zoneone">
		<option>강서구</option>
		<option>양천구</option>
		<option>구로구</option>
		<option>금천구</option>
		<option>영등포구</option>
		<option>마포구</option>
		<option>서대문구</option>
		<option>은평구</option>
		<option>종로구</option>
		<option>관악구</option>
		<option>동작구</option>
		<option>용산구</option>
		<option>중구</option>
		<option>성북구</option>
		<option>강북구</option>
		<option>도봉구</option>
		<option>노원구</option>
		<option>동대문구</option>
		<option>성동구</option>
		<option>강남구</option>
		<option>서초구</option>
		<option>송파구</option>
		<option>광진구</option>
		<option>중랑구</option>
		<option>노원구</option>
		<option>강동구</option>
		
		
	</select>
	<select id="zonetwo" style="display:none;">
		<option>김포시</option>
		<option>파주시</option>
		<option>고양시</option>
		<option>양주시</option>
		<option>의정부시</option>
		<option>동두천시</option>
		<option>연천군</option>
		<option>포천시</option>
		<option>가평군</option>
		<option>의정부시</option>
		<option>남양주시</option>
		<option>구리시</option>
		<option>하남시</option>
		<option>양평군</option>
		<option>여주시</option>
		<option>광주시</option>
		<option>성남시</option>
		<option>과천</option>
		<option>안양</option>
		<option>군포</option>
		<option>광명</option>
		<option>부천</option>
		<option>시흥</option>
		<option>안산시</option>
		<option>화성시</option>
		<option>수원시</option>
		<option>오산시</option>
		<option>용인시</option>
		<option>광주시</option>
		<option>이천시</option>
		<option>인천광역시</option>
		
	</select>
    <input type="button" class="btn" id="btnOne" value="검색"/>

 		 <div class="fixed-container">
            <div class="shop-list">
<%
	if(farmlist.size()==0){
%>
         <p>게시글이 존재하지 않습니다. </p>

<%
	}else{
	for(int i = 0; i < farmlist.size(); i++){
%>
	<!-- 썸네일이미지  -->
               <article class="shop-list__item currently-dont-selling" style="height: 495px;">  
                    <img src="../<%=farmlist.get(i).getWfarm_image().split("/")[0] %>" alt="product" style="width:350px; height:250px; cursor:pointer; margin-left: 4%; margin-top: 3%;"    
                    	onclick="location.href='../farm.do?command=farmdetail&wfarm_key=<%=farmlist.get(i).getWfarm_key()%>';">
                    
                    <div class="item-disc">
                        <img alt="img" src="../resources/images/auction/EveryFarmimage.png"/>
                        <div id="seller">농장주:<%=farmlist.get(i).getMem_id() %></div>                <!-- 농부 아이디 -->
                        <h2 class="item-title" style="cursor:pointer; color: brown;" onclick="location.href='../farm.do?command=farmdetail&wfarm_key=<%=farmlist.get(i).getWfarm_key()%>';"><%=farmlist.get(i).getWfarm_title() %> <!-- 주말농장 이름 -->
                       	<br/><a><b style="color:#330000">EveryFarm</b>에서 승인된 농장입니다.</a><br/>
                         <span id="productprice" style="color:black; font-size:15px;"><%=farmlist.get(i).getWfarm_content().split("/")[0] %></span><br/>  <!-- 설명 -->
                         <%
         
                         	Date regDate = farmlist.get(i).getWfarm_regDate();
                        	 SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");	
                         	String regDateres = dateformat.format(regDate);
                         %>
                        <span id="productprice" style="color:black; font-size:15px;">등록일:<%=regDateres %></span>  <!-- 등록일 -->
                       
                    </div>
                    <div class="item-price-block">
                        <div class="item-price">
                        <table border="1" style="width: 150%; border-radius: 10px;">
                        	<tr>
                        		<td>총 평수:[<%=farmlist.get(i).getWfarm_totalArea() %>]</td>
                        		<td>평당가격:[<%=farmlist.get(i).getWfarm_price() %>원]</td>
                        	<tr/>
                        </table>
                  
                        </div>
                    </div>

                </article>
<%
		}	
	}

%>   
      
                </div>
                <!-- 일반경매상품 끝-->
                 <div class="overlay"></div>
            
</section>
  <!-- 페이징 시작 -->            
    <div class="pagination">
<%
	if(pagegroup > 1){
%>	
	<a href="../farm.do?command=<%=listGubun %>&currentpage=<%=startseq-1 %>&paramtype=<%=backParamtype %>" class="prev str">Prev</a>
<%
	}
	for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
	<a href="../farm.do?command=<%=listGubun %>&currentpage=<%=pagenum %>&paramtype=<%=backParamtype %>" class="pager"><%=pagenum %></a>	
<%
	}
	if(endseq < currentpage.getTotalpage()){
%>
	<a href="../farm.do?command=<%=listGubun %>&currentpage=<%=endseq+1 %>&paramtype=<%=backParamtype %>" class="next str">Next</a>
<%		
	}
%>
</div>
</main>
<%@ include file="../home/footer.jsp" %>
</body>
</html>