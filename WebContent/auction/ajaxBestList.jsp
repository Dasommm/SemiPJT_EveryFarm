<%@page import="com.everyfarm.product.dto.PagingDto"%>
<%@page import="com.everyfarm.product.dto.ProductDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/auction/auctionlist.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/auction/selectbox.css"    
	  rel="stylesheet"    
	  type="text/css" />  	 
</head>
<%
	List<ProductDto>bestlist =(List<ProductDto>)session.getAttribute("LiveBestlist");
	List<ProductDto>BestListTime = (List<ProductDto>)session.getAttribute("BestListTime");
	
	//리스트용 구분값
	//String paramtype = (String)session.getAttribute("paramtype");
%>
<body>
<div class="fixed-container">
	 <div class="shop-list">
	<%
		for(int i = 0; i < bestlist.size(); i++){
	%>            
	               <article class="shop-list__item currently-dont-selling">
	                    <img src="../<%=bestlist.get(i).getStock_image().split("/")[0] %>" alt="man" style="width:300px; height:250px; cursor:pointer; margin-left: 7%;"
	                    	onclick="location.href='../product.do?command=auctiondetail&auc_no=<%=bestlist.get(i).getAuc_no() %>';">
	                    
	                    <div class="item-disc">
	                        <img alt="img" src="../resources/images/auction/EveryFarmimage.png"/>
	                        <div id="seller">판매자:<%=bestlist.get(i).getMem_id() %></div>
	                        <h2 class="item-title" style="cursor:pointer" onclick="location.href='../product.do?command=auctiondetail&auc_no=<%=bestlist.get(i).getAuc_no()%>';"><%=bestlist.get(i).getStock_name() %>
	                       	<br/><a><b style="color:#330000">EveryFarm</b>에서 승인된 상품입니다.</a>
	                        <span id="productprice"> 최고가:<%=bestlist.get(i).getAuc_nowPrice() %>원</span>
	                      
	                    </div>
	                  
	                    <div class="item-price-block">
	                        <div class="item-price">
	                        <table border="1">
	                        	<tr>
	                        	 <!-- 에이작스 html 저장 공간 -->
	                        			 <td>시작가:<%=bestlist.get(i).getAuc_startPrice() %>원</td>
	      								 <td style="color:red;" class="auc_join">입찰:<%=bestlist.get(i).getAuc_join() %></td>
	                             <!-- 에이작스 html 저장 공간 -->
	                        	<tr/>
	                        </table>
	                         
	                        	<img alt="img" src="../resources/images/auction/watch.png" style="width:20px; height:20px;">
	                        	<div style="margin: -130px 0px 0px 40px; color:red; font-weight:bold;"><%=BestListTime.get(i).getDay() %>일<%=BestListTime.get(i).getHours() %>시간<%=BestListTime.get(i).getMinutes() %>분</div>
	                        </div>
	                    </div>
	
	                </article>
	<%
		}
	%>     
	 </div>  
 </div>        
</body>
</html>