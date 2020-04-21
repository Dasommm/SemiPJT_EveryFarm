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
   List<FundDetailDto> list = (List<FundDetailDto>)session.getAttribute("fund_Endstatus");

   PagingDto pagingdto = (PagingDto)session.getAttribute("Endtotalpaging");
   int pagegroup = (int)Math.ceil((double)pagingdto.getCurrentpage()/pagingdto.getUnderpagescale());
   int startseq = pagingdto.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = pagingdto.getUnderpagescale() * pagegroup;
   int totalpage = pagingdto.getTotalpage();
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
			 <h2 style="color:#a2783f; font-weight:bold;">펀드완료내역</h2>
			 
			  <div class="panel-body">
			      <table class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt">
			      <thead>
			        <tr>
			          <th>펀드번호</th>
			          <th>펀드상품명</th>
			          <th>종류</th>
			          <th>무게</th>
			          <th>펀드가격</th>
			          <th>총모금액</th>
			          <th>등록일</th>
			          <th>종료일</th>
			          <th>참여인원</th>
			          
			        </tr>
			      </thead>
			        <tbody>
			<%
			   if(list.size()==0){
			%>
			   <tr>
			         <td colspan="11" style="text-align: center;">-----펀드내역이 존재하지 않습니다.----- </td>
			     </tr>
			     
			<%
			   }else{
			   for(int i = 0; i < list.size(); i++){
			     
			%>        
			          <tr ng-repeat="n in data">
			            <td><%=list.get(i).getFund_no() %></td>
			            <td><%=list.get(i).getStock_name() %></td>
			            <td><%=list.get(i).getStock_location() %>
			            <td><%=list.get(i).getStock_kg() %>kg</td>
			            <td><%=list.get(i).getStock_price() %>원</td>
			            <td><%=list.get(i).getFund_currentprice() %>원</td>
			            <td><%=list.get(i).getFund_regDate() %></td>
			            <td><%=list.get(i).getFund_endDate() %></td>
			            <td><a href="#" onclick="location.href='../farmerfunddetail.do?command=fundjoiner&fund_no=<%=list.get(i).getFund_no() %>';"><%=list.get(i).getFund_join() %></a>명</td>
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
			   <a class="paging" href="../farmerfunddetail.do?command=end_fundlist&currentpage=<%=startseq-1 %>" class="prev str">Prev</a>
			<%
			   }
			   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
			%>
			   <a class="paging" href="../farmerfunddetail.do?command=end_fundlist&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>   
			<%
			   }
			   if(endseq < pagingdto.getTotalpage()){
			%>
			   <a class="paging" href="../farmerfunddetail.do?command=end_fundlist&currentpage=<%=endseq+1 %>" class="next str">Next</a>
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