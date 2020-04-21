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
<title>경매 완료 현황</title>  <!-- Made By DyKim -->
<link href="../resources/css/farmermypage/paging.css"    
     rel="stylesheet"    
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
   List<AuctionDetailDto> list = (List<AuctionDetailDto>)session.getAttribute("auc_Endstatus");

   ADPagingDto currentpage = (ADPagingDto)session.getAttribute("Endtotalpaging");
   int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
   //1
   int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = currentpage.getUnderpagescale() * pagegroup;
   int totalpage = currentpage.getTotalpage();
%>
<script type="text/javascript">

</script>
<body>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<%@ include file="../home/sidemenu_fm.jsp" %>
		<div class="col" >
			<div class="panel" data-ng-controller="validationCtrl" style="text-align: center; margin-top:5%; margin-bottom:3%;">
			 <h2 style="color:#a2783f; font-weight:bold;">경매완료내역</h2>
			 
			  <div class="panel-body">
			      <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt">
			      <thead>
			        <tr>
			          <th>경매번호</th>
			          <th>경매상품명</th>
			          <th>무게</th>
			          <th>지역</th>
			          <th>경매시작가</th>
			          <th>낙찰가</th>
			          <th>경매등록일</th>
			          <th>경매종료일</th>
			          <th>참여인원</th>
			          <th>경매상태</th>
			          <th>상품배송</th>
			        </tr>
			      </thead>
			        <tbody>
			<%
			   if(list.size()==0){
			%>
			   <tr>
			         <td colspan="11" style="text-align: center;">-----낙찰내역이 존재하지 않습니다.----- </td>
			     </tr>
			     
			<%
			   }else{
			   for(int i = 0; i < list.size(); i++){
			      String status = "";
			%>        
			          <tr ng-repeat="n in data">
			            <td><%=list.get(i).getAuc_no() %></td>
			            <td><%=list.get(i).getStock_name() %></td>
			            <td><%=list.get(i).getStock_kg() %>kg</td>
			            <td><%=list.get(i).getStock_location() %></td>
			            <td><%=list.get(i).getAuc_startPrice() %>Won</td>
			            <td><%=list.get(i).getAuc_nowPrice() %>Won</td>
			            <td><%=list.get(i).getAuc_regDate() %></td>
			            <td><%=list.get(i).getAuc_endDate() %></td>
			            <td><%=list.get(i).getAuc_join() %>명</td>
			<%
			   if(list.get(i).getAuc_status()==3){
			      status = "낙찰";
			%>            
			            <td><%=status %></td>
			            <td><input type="button" value="배송" onclick="location.href='../farmerauctiondetail.do?command=sendproduct&auc_no=<%=list.get(i).getAuc_no() %>';" style="background:black; color:white; font-weight:bold; border-radius:10px; width: 80px; height:40px;"/></td>
			          </tr>
			<%
			   
			      } else if(list.get(i).getAuc_status()==4){
			    	  status = "낙찰";
			%>
						<td><%=status %></td>
						<td>배송완료</td>
			<%
					}
			   }
			   }
			%>          
			
			        </tbody>
			    </table>
			  </div>
			</div>
			 <!-- 페이징 시작 -->            
			    <div class="pagination">
			<%
			   if(pagegroup > 1){
			%>   
			   <a href="../farmerauctiondetail.do?command=end_auclist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
			<%
			   }
			   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
			%>
			   <a href="../farmerauctiondetail.do?command=end_auclist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>   
			<%
			   }
			   if(endseq < currentpage.getTotalpage()){
			%>
			   <a href="../farmerauctiondetail.do?command=end_auclist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
			<%      
			   }
			%>
			</div>
		</div>
	</div>
</div>

<%@ include file="../home/footer.jsp" %>
</body>
</html>