<%@page import="com.everyfarm.farmer.auction.dto.ADPagingDto"%>
<%@page import="com.everyfarm.farmer.auction.dto.AuctionDetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농부 경매 현황</title>      <!-- Made By DyKim -->
<link href="../resources/css/farmermypage/paging.css" rel="stylesheet"    
     type="text/css" /> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
table tr th{
  background:#5e482b;
  color:white;
  text-align:center;
  vertical-align:center;
}

table {
	margin: 30px 5% 0 5%;
	max-width: 1400px;
}
</style>
</head>
<%
   List<AuctionDetailDto>list = (List<AuctionDetailDto>)session.getAttribute("auc_curstatus");

   ADPagingDto currentpage = (ADPagingDto)session.getAttribute("adpagingdto");
   int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
   int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = currentpage.getUnderpagescale() * pagegroup;
   int totalpage = currentpage.getTotalpage();
%>
<body>
<script type="text/javascript">
$(function(){
   $("#searchbtn").click(function(){
      
   
   var selectedStatus = document.getElementById("selectStatus").value;
   
      if(selectedStatus==1){
         location.href="../farmerauctiondetail.do?command=notyet&currentpage=1";
         
      }else if(selectedStatus==2){
         location.href="../farmerauctiondetail.do?command=cur_auclist&currentpage=1";
      }
   
   
   });
});
</script>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	<div class="row">
	  <%@ include file="../home/sidemenu_fm.jsp" %>
	    <div class="col" >
		
	  <div class="panel" data-ng-controller="validationCtrl" style="text-align: center; margin-top:5%; margin-bottom:3%; ">
	   <h2 style="color:#a2783f; font-weight:bold;">경매진행현황</h2>
	
	<div>  
	  <a style="font-weight:bold; margin: 10px;">경매상태</a>
	  <select id="selectStatus" style="width:200px; height:30px; border-radius:5px; border:1px solid light-gray; margin: 10px;">
	      <option value="2">진행중</option>
	      <option value="1">미등록</option>
	  </select>
	  <input type="button" id="searchbtn" value="search" style="background:black; color:white; font-weight:bold; border-radius:10px; width:150px; height:38px;"/>
	</div>  
	
	  <div class="panel-body">
	      <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt">
	      <thead>
	        <tr>
	          <th>경매번호</th>
	          <th>경매상품명</th>
	          <th>무게</th>
	          <th>지역</th>
	          <th>경매시작가</th>
	          <th>현재최고가</th>
	           <th>경매등록일</th>
	            <th>경매종료일</th>
	             <th>경매참여인원</th>
	               <th>경매상태</th>
	        </tr>
	      </thead>
	        <tbody>
	<%
	   if(list.size()==0){
	%>
	   <tr>
	         <td colspan="10" style="text-align: center;">-----경매현황이 존재하지 않습니다.----- </td>
	     </tr>
	        
	<%
	
	   }else{
	   for(int i = 0; i < list.size(); i++){
	
	      String status = "";
	%>        
	          <tr ng-repeat="n in data">
	            <td><%=list.get(i).getAuc_no() %></td>
	            <td><%=list.get(i).getStock_name() %></td>
	            <td><%=list.get(i).getStock_kg() %> Kg</td>
	            <td><%=list.get(i).getStock_location() %></td>
	            <td><%=list.get(i).getAuc_startPrice() %>원</td>
	            <td><%=list.get(i).getAuc_nowPrice() %>원</td>
	            <td><%=list.get(i).getAuc_regDate() %></td>
	            <td><%=list.get(i).getAuc_endDate() %></td>
	            <td><%=list.get(i).getAuc_join() %>명</td>
	<%
	   if(list.get(i).getAuc_status()==1){
	      status = "미등록";
           
	   }else if(list.get(i).getAuc_status()==2){
	      status = "진행중";
	      
	   }
	%>
	            <td><%=status %></td>
	          </tr>
	<%
	      }
	   }
	%>          
	        </tbody>
	    </table>
	  </div>
	
	 <!-- 페이징 시작 -->            
	    <div class="pagination">
	<%
	   if(pagegroup > 1){
	%>   
	   <a href="../farmerauctiondetail.do?command=cur_auclist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
	<%
	   }
	   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
	%>
	   <a href="../farmerauctiondetail.do?command=cur_auclist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>   
	<%
	   }
	   if(endseq < currentpage.getTotalpage()){
	%>
	   <a href="../farmerauctiondetail.do?command=cur_auclist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
	<%      
	   }
	%>
		</div>
	
	</div>
	</div>

</div>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>