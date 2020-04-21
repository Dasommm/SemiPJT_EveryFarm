<%@page import="com.everyfarm.fundproduct.dto.FundPagingDto"%>
<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funding list</title>
<link href="../resources/css/fund/fundlist.css" rel="stylesheet"
	type="text/css">
	
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function fundStatus() {
	var status = document.getElementById("status").value;
	if(status == "2"){
		location.href ='../fund.do?command=fundlist&page=1';
	}else if(status == "3"){
		location.href = '../fund.do?command=fundFinish&page=1';
	}
}

</script>


</head>
<body>

	<%
		List<FundDto> list = (List<FundDto>) session.getAttribute("allList");
		List<FundDto> bestlist = (List<FundDto>) session.getAttribute("fundBestList");
		FundPagingDto fundPaging = (FundPagingDto) session.getAttribute("fundPaging");
		int pagegroup = (int) Math.ceil((double) fundPaging.getCurrentpage() / fundPaging.getPagescale());
		int startpage = fundPaging.getPagescale() * (pagegroup - 1) + 1;
		int endpage = fundPaging.getPagescale() * pagegroup;
		int totalpage = fundPaging.getTotalpage();
	%>

	<%@ include file="../home/header.jsp"%>
	<section>
		<div id="fundIntro">
			<img alt="fundIntroImage"
				src="../resources/images/auction/introduce.png" style="width:100%;">
		</div>
		<br>

	
		<div class="fundSearch">
			<span> 상태 :</span> 
			<select  id = "status" onchange="fundStatus();">
				<option value = "2" selected="selected">진행중인 상품</option>
				<option value = "3">종료된 상품</option>
			</select>
		</div> 
		
		<br> <br>

		<!-- best 펀드 상품  -->
		<article>
			<div id="">
				<h1 class="bestproduct">
					<span style="color: darkorange;">Best</span> 펀드 상품
				</h1>
				<div class="fixed-container">
					<div class="shop-list">
						<%
							for (int i = 0; i < bestlist.size(); i++) {
						%>
						<!-- for문 돌려서 best 뽑기 -->
						<div class="shop-list__item">

							<div class="item-disc">
								<div id="bestprd">
									<a
										href="../fund.do?command=fundDetail&stock_no=<%=bestlist.get(i).getStock_no()%>">
										<img alt="bestproduct"
										src="../<%=bestlist.get(i).getStock_image().split("/")[0]%>" width="300px"
										height="250px">
									</a>
									<%
									System.out.println(bestlist.get(i).getStock_image().split("/")[0]);
									%>
								</div>
								<div id="item-title"><%=bestlist.get(i).getMem_id()%></div>
								<h2 class="seller"><%=bestlist.get(i).getStock_name()%></h2><br>
							</div>

							<div class="item-price-block">
								<div class="item-price">
									<table border="1">
										<tr>
											<td><%=bestlist.get(i).getFund_join()%>명 참여 중</td>
											<td><%=bestlist.get(i).getFund_enddate()%>일 종료</td>
										</tr>
										<tr id="productprice">
											<td>
												<% double temp = bestlist.get(i).getFund_currentprice();
													double temp2 = bestlist.get(i).getFund_price();
													double res = (temp/temp2) *100.0;
												%>
												<%=res %>% 달성
											</td>
											<td>
											<fmt:formatNumber value="<%=bestlist.get(i).getFund_currentprice() %>" type="number"/>원</td>
										</tr>
										<tr>
											<td colspan="2" style="font-size: 15px;">
												목표금액 : <fmt:formatNumber value="<%=bestlist.get(i).getFund_price() %>" type="number"/>원
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<hr>
			<br>

			<!-- 진행중인 모든 펀드 상품(등록일 별) -->
			<div>
				<h1 class="bestproduct">펀드 상품</h1>
				<div class="fixed-container">
					<div class="shop-list">
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<div class="shop-list__item">
							<div class="item-disc">
								<a
									href="../fund.do?command=fundDetail&stock_no=<%=list.get(i).getStock_no()%>">
									<img alt="itemPic" src="../<%=list.get(i).getStock_image().split("/")[0]%>"
									width="300px" height="250px">
								</a>
								<div id="item-title"><%=list.get(i).getMem_id()%></div>
								<h2 class="seller"><%=list.get(i).getStock_name()%></h2><br>
							</div>

							<div class="item-price-block">
								<div class="item-price">
									<table border="1">
										<tr>
											<td><%=list.get(i).getFund_join()%>명 참여 중</td>
											<td id="deadLineDate"><%=list.get(i).getFund_enddate()%>일 종료</td>
										</tr>
										<tr id="productprice">
											<td>
												<% double temp = list.get(i).getFund_currentprice();
													double temp2 = list.get(i).getFund_price();
													double res = (temp/temp2) *100.0;%>
												<%=res %>% 달성
											</td>											
											<td >
											<fmt:formatNumber value ="<%=list.get(i).getFund_currentprice()%>" type = "number"></fmt:formatNumber>원</td>
										</tr>
										<tr>
											<td colspan="2" style="font-size: 15px;">
												목표금액 : <fmt:formatNumber value="<%=list.get(i).getFund_price() %>" type="number"/>원
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<!-- 페이징 -->
			<div class="paging">
				<%
					if (pagegroup > 1) {
				%>
				<a href="../fund.do?command=fundlist&page=<%=startpage - 1%>" class="prev">Prev</a>
				<span><%
					}
					for (int pagenum = startpage; pagenum <= ((endpage < totalpage) ? endpage : totalpage); pagenum++) {
				%>
				<a href="../fund.do?command=fundlist&page=<%=pagenum%>" class="pager"><%=pagenum%></a>
				</span>
				<%
					}
					if (endpage < fundPaging.getTotalpage()) {
				%>
				<a href="../fund.do?command=fundlist&page=<%=endpage + 1%>" class="next">Next</a>
				<%
					}
				%>
			</div>

		</article>
	</section>


	<%@ include file="../home/footer.jsp"%>


</body>
</html>