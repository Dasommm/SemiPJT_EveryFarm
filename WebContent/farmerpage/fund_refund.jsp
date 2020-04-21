<%@page import="com.everyfarm.farmer.fund.dto.PagingDto"%>
<%@page import="com.everyfarm.farmer.fund.dto.FundDetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀드 완료 현황</title>
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
   List<FundDetailDto> list = (List<FundDetailDto>)session.getAttribute("fundrefundlist");

   PagingDto pagingdto = (PagingDto)session.getAttribute("fundrefundpaging");
   int pagegroup = (int)Math.ceil((double)pagingdto.getCurrentpage()/pagingdto.getUnderpagescale());
   int startseq = pagingdto.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = pagingdto.getUnderpagescale() * pagegroup;
   int totalpage = pagingdto.getTotalpage();
%>
<script type="text/javascript">
	$(function(){
	$('.acceptrefund').click(function(){
		var order_no = $(this).parent().parent().children().first().children().val();
		location.href="../farmerfunddetail.do?command=acceptrefund&order_no=" + order_no;
	});
	
	});
</script>
<body>
<%@ include file="../home/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<%@ include file="../home/sidemenu_fm.jsp" %>
		<div class="col" >
			<div class="panel" data-ng-controller="validationCtrl" style="text-align: center; margin-top:5%; margin-bottom:3%;">
			 <h2 style="color:#a2783f; font-weight:bold;">펀드환불내역</h2>
			 
			  <div class="panel-body">
			      <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt">
			      <thead>
			        <tr>
						<th>주문번호</th>
			        	<th>펀드번호</th>
			        	<th>펀드상품명</th>
			          	<th>결제금액</th>
			          	<th>환불요청인</th>
						<th>환불요청일</th>
						<th>환불 수락</th>
			        </tr>
			      </thead>
			        <tbody>
			<%
			   if(list.size()==0){
			%>
			   <tr>
			         <td colspan="11" style="text-align: center;">-----내역이 존재하지 않습니다.----- </td>
			     </tr>
			     
			<%
			   }else{
			   for(int i = 0; i < list.size(); i++){
			     
			%>        
			          <tr ng-repeat="n in data">
			            <td class="order_no"><input type="hidden"value="<%=list.get(i).getOrder_no() %>"><%=list.get(i).getOrder_no() %></td>
			            <td><%=list.get(i).getFund_no() %></td>
			            <td><%=list.get(i).getStock_name() %>
			            <td><%=list.get(i).getPay_price() %>원</td>
			            <td><%=list.get(i).getMem_id() %></td>
			            <td><%=list.get(i).getOrderinfo_date() %></td>
<%
			if(list.get(i).getOrderinfo_status()==3){
%>
				 <td><input type="button" class="acceptrefund" value="수락" style="background:black; color:white; font-weight:bold; border-radius:10px; width: 80px; height:40px;"/></td>
<%
			} else if(list.get(i).getOrderinfo_status()==4) {
%>
						<td>환불완료</td>
<%				
			}
 %>

			          </tr>
			<%
			   
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
			   <a class="paging" href="../farmerfunddetail.do?command=fundrefundlist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
			<%
			   }
			   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
			%>
			   <a class="paging" href="../farmerfunddetail.do?command=fundrefundlist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>   
			<%
			   }
			   if(endseq < pagingdto.getTotalpage()){
			%>
			   <a class="paging" href="../farmerfunddetail.do?command=fundrefundlist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
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