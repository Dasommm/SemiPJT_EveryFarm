<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title style="text-align: center;">품종 정보</title>
<script type="text/javascript">

//메인 카테고리 항목
function mainMove(){
	with(document.searchInsttForm){
		method="post";
		action = "varietyInfo.jsp";
		target = "_self";
		submit();
	}
}
//세부항목 리스트 이동
function fncNextList(cCode){
	with(document.apiForm){
		categoryCode.value = cCode;
		method="post";
		action = "varietyInfo.jsp";
		target = "_self";
		submit();
	}
}

//검색
function fncSearch(flag){
	
	if(flag==2) {
		document.searchApiForm.sMtrtSeCode.value = '';
		document.searchApiForm.sSkllSeCode.value = '';
		document.searchApiForm.sGrdlSeCode.value = '';
	}
	
	with(document.searchApiForm){
		method="post";
		action = "varietyInfo.jsp";
		target = "_self";
		submit();
	}
}

//페이지 이동
function fncGoPage(page){
	with(document.apiForm){
		pageNo.value = page;
		method="post";
		action = "varietyInfo.jsp";
		target = "_self";
		submit();
	}
}

</script>
</head>
<body>
<%@ include file= "../home/header.jsp" %>
<h3 style="text-align:center; margin-top:1%;"><strong>품종 정보</strong></h3><hr>
<%
//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
String apiKey="20200224IOHNQXCHDPZDDNUQPWSW";

//서비스 명
String serviceName="varietyInfo";

//카테고리 코드
String categoryCodeVal = "";
if(request.getParameter("categoryCode")!=null && !request.getParameter("categoryCode").equals("")){
	categoryCodeVal = request.getParameter("categoryCode");
}
//기관코드 등록
String insttCode = "";
if(request.getParameter("insttCode")!=null && !request.getParameter("insttCode").equals("")){
	insttCode = request.getParameter("insttCode");
}
//기관명
String insttName = "";
if(request.getParameter("insttName")!=null && !request.getParameter("insttName").equals("")){
	insttName = new String(request.getParameter("insttName").getBytes("8859_1"), "UTF-8");
}

%>
<form name="apiForm">
	<input type="hidden" name="categoryCode" value="<%=categoryCodeVal%>">
	<input type="hidden" name="insttCode" value="<%=insttCode%>">
	<input type="hidden" name="insttName" value="<%=insttName%>">
	<input type="hidden" name="pageNo">
</form>
<%
//기관 코드
if(true){
	//오퍼레이션 명
	String operationName="insttList";
	
	//XML 받을 URL 생성
	String parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&insttCode="+insttCode;
	
	//서버와 통신
	URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream apiStream = apiUrl.openStream();
	
	Document doc = null;
	try{
		//xml document
		doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		apiStream.close();
	}
	
	int size = 0;
	
	NodeList items = null;
	NodeList codeNms = null;
	
	items = doc.getElementsByTagName("item");
	size = doc.getElementsByTagName("item").getLength();
	codeNms = doc.getElementsByTagName("codeNm");

	if(size==0){ 
%>
	<h3>조회한 정보가 없습니다.</h3>
<%
	}else{
%>
	<form name="searchInsttForm" style="    margin-left: 5%; font-weight:bold;">
		<input type="hidden" name="insttCode" value="<%=insttCode%>">
		기관명&nbsp;
		<select name="insttName" onchange="mainMove();" style="width: 15%;
    height: 30px;
    border-radius: 5px;
    border: 1px solid #c8a97e;">
		<option value="">선택하세요</option>
<%
		for(int i=0; i<size; i++){
			//코드명
			String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
		<option value="<%=codeNm%>" <% if(codeNm.equals(insttName)){out.print("selected");}%> ><%=codeNm%></option>
<% 		} %>
		</select>
	</form>
<%
	}
}
%>

<%
 //메인 카테고리 리스트

    NodeList listItems = null;
    NodeList codes = null;
    NodeList gubns = null;
    
	//오퍼레이션 명
    String operationName="mainCategoryList";
	
	//XML 받을 URL 생성
	String parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&insttCode="+insttCode;
	parameter += "&insttName="+URLEncoder.encode(insttName);

	//메인카테고리 서버와 통신
	URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream apiStream = apiUrl.openStream();
	
	Document mainDoc = null;
	try{
		//xml document
		mainDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		apiStream.close();
	}
	
	int size = 0;
	
	NodeList items = null;
	NodeList codeNms = null;
	NodeList categoryCodes = null;
	NodeList categoryNms = null;
	
	items = mainDoc.getElementsByTagName("item");
	size = mainDoc.getElementsByTagName("item").getLength();
	categoryCodes = mainDoc.getElementsByTagName("categoryCode");
	categoryNms = mainDoc.getElementsByTagName("categoryNm");
	
	if(size==0){
%>
	<hr>
	<h3>조회한 정보가 없습니다.</h3>
<%	
	}else{
		if(categoryCodeVal==null || categoryCodeVal.equals("")){
			categoryCodeVal=categoryCodes.item(0).getFirstChild() == null ? "" : categoryCodes.item(0).getFirstChild().getNodeValue();
		}
%>
	<hr>
	<table width="100%" border="1" cellSpacing="0" cellPadding="0">
		<tr>
<%	
		for(int i=0; i<size; i++){
			//카테고리 코드
			String categoryCode = categoryCodes.item(i).getFirstChild() == null ? "" : categoryCodes.item(i).getFirstChild().getNodeValue();
			//카테고리 명
			String categoryNm = categoryNms.item(i).getFirstChild() == null ? "" : categoryNms.item(i).getFirstChild().getNodeValue();
%>
			<td align="center">
				<a href="javascript:fncNextList('<%=categoryCode%>');">  <% if ( categoryCode.equals(categoryCodeVal)) { %> <strong> <%=categoryNm%> </strong> <% }else{ %> <%=categoryNm%> <%} %>  </a>
			</td>
<%		
		}
%>
		<tr>
	</table>
<%
	}
%>

<%
	//오퍼레이션 명
	operationName="middleCategoryList";
	
	parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&categoryCode="+categoryCodeVal;
	parameter += "&insttCode="+insttCode;
	parameter += "&insttName="+URLEncoder.encode(insttName);
	
	//리스트 서버와 통신
	URL middleApiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream middleApiStream = middleApiUrl.openStream();
	
	Document middleDoc = null;
	try{
		//xml document
		middleDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(middleApiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		middleApiStream.close();
	}
	int middleSize = 0;
	
	listItems = null;
	codes = null;
    gubns = null;
	
	listItems = middleDoc.getElementsByTagName("item");
	middleSize = middleDoc.getElementsByTagName("item").getLength();
	codes = middleDoc.getElementsByTagName("code");
	codeNms = middleDoc.getElementsByTagName("codeNm");
	gubns = middleDoc.getElementsByTagName("gubn");

	ArrayList<String> fCropsCode = new ArrayList<String>();
	ArrayList<String> fSvcCodeNm = new ArrayList<String>();
	
	//검색 타입
	String sType = null;
	if(request.getParameter("sType")!=null && !request.getParameter("sType").equals("")){
		sType = new String(request.getParameter("sType").getBytes("8859_1"), "UTF-8");
	}
	//검색어
	String sText = null;
	if(request.getParameter("sText")!=null && !request.getParameter("sText").equals("")){
		sText = new String(request.getParameter("sText").getBytes("8859_1"), "UTF-8");
	}
	
	if(size==0){ 
%>
	<h3>조회한 정보가 없습니다.</h3>
<%
	}else{
%>
	<hr>
	<form name="searchApiForm">
	<input type="hidden" name="insttName" value="<%=insttName%>">
	<input type="hidden" name="insttCode" value="<%=insttCode%>">
	<input type="hidden" name="categoryCode" value="<%=categoryCodeVal%>">
	<table width="100%" cellSpacing="0" cellPadding="0">
		<tr>
			<td width="85%">
				<select name="sType" style="    width: 5%; height: 25px; border-radius: 5px; margin-left:5%;     border: 1px solid #c8a97e;">
					<option value="sCntntsSj"  <% if( "sCntntsSj".equals(sType) ){  %> selected  <%} %>  >품종명</option>
					<option value="sMainChartrInfo" <% if( "sMainChartrInfo".equals(sType) ){  %> selected  <%} %> >주요특성</option>
					<% if( categoryCodeVal.equals("FC") ) { %>
					<option value="sSvcCodeNm" <% if( "sSvcCodeNm".equals(sType) ){  %> selected  <%} %> >작물명</option>
					<% } %>
				</select> 
				
				<input type="text" name="sText" value="<%=request.getParameter("sText")==null ? "": sText%>" style="    border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 10%;
    height: 25px;">
				
				
				<% if( ! categoryCodeVal.equals("FC") ) { %>
				작물명&nbsp;
				<select name="svcCodeNm">
				
<%
				for(int i=0; i<middleSize; i++){
					//코드
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					//코드명
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					//구분
					String gubn = gubns.item(i).getFirstChild() == null ? "" : gubns.item(i).getFirstChild().getNodeValue();
					
						if(gubn.endsWith("CROP")){
							fSvcCodeNm.add(codeNm);
							%>
							<option value="<%=codeNm%>"  <% if( codeNm.equals(request.getParameter("svcCodeNm") )  ){  %> selected <%} %>> <%=codeNm%></option>
							<%
						}
				     }
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
				<% } %>
				
				<% if( categoryCodeVal.equals("FC") ) { %>
				<span style="font-weight:bold;">작물분류&nbsp;</span>
				<select name="sCropsCode"  onchange="fncSearch(2);" style="    border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 5%;
    height: 25px;">
<%
				for(int i=0; i<middleSize; i++){
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					String gubn = gubns.item(i).getFirstChild() == null ? "" : gubns.item(i).getFirstChild().getNodeValue();
					
						if(gubn.endsWith("CLASS1")){
							fCropsCode.add(code);
							%>
							<option value="<%=code%>" <% if( code.equals(request.getParameter("sCropsCode") ) ){  %> selected  <%} %>><%=codeNm%></option>
							<%
						}
				     }
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
				<% } %>
				
				<span style="font-weight:bold;">육성년도 &nbsp;</span>
				<select name="sUnbrngYear" style="border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 10%;
    height: 25px;">
				<option value="">선택하세요</option>
<%
				for(int i=0; i<middleSize; i++){
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					String gubn = gubns.item(i).getFirstChild() == null ? "" : gubns.item(i).getFirstChild().getNodeValue();
					
						if(gubn.endsWith("YEAR")){
							%>
							<option value="<%=code%>"  <% if( code.equals(request.getParameter("sUnbrngYear") ) ){  %> selected  <%} %> ><%=codeNm%></option>
							<%
						}
				     }
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
		    </td>
		    <td width="15%">
				<input type="button" name="search" value="조회" onclick="fncSearch(1);" style="margin-left: -300%;
    width: 40%;
    height: 28px;
    background: black;
    color: white;
    font-weight: bold;
    border-radius: 5px;"/>
		    </td>
		</tr>
<%
	}
%>

<%
if(categoryCodeVal!=null && !categoryCodeVal.equals("")){
	
if( categoryCodeVal.equals("FC")){
	//오퍼레이션 명
	operationName="subCategoryList";
	
	parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&categoryCode="+categoryCodeVal;
	parameter += "&insttCode="+insttCode;
	parameter += "&insttName="+URLEncoder.encode(insttName);
	
	//작물 코드
	if(request.getParameter("sCropsCode")==null || request.getParameter("sCropsCode").equals("")) {
		parameter += "&sCropsCode="+fCropsCode.get(0);
	}else {
		parameter += "&sCropsCode="+request.getParameter("sCropsCode");
	}

	//리스트 서버와 통신
	URL subApiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream subApiStream = subApiUrl.openStream();
	
	Document subDoc = null;
	try{
		//xml document
		subDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(subApiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		subApiStream.close();
	}
	
	listItems = null;
	codes = null;
	codeNms = null;
	NodeList codeGroups = null;
	
	listItems = subDoc.getElementsByTagName("item");
	size = subDoc.getElementsByTagName("item").getLength();
	codes = subDoc.getElementsByTagName("code");
	codeNms = subDoc.getElementsByTagName("codeNm");
	codeGroups = subDoc.getElementsByTagName("codeGroup");
	
%>
		<tr>
			<td width="85%">
				<span style="margin-left:5%; font-weight:bold;">숙기&nbsp;</span>
				<select name="sMtrtSeCode" style="border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 10%;
    height: 25px;">
				<option value="">선택하세요</option>
<%
				for(int i=0; i<size; i++){
					//코드
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					//코드명
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					//분류 코드
					String codeGroup = codeGroups.item(i).getFirstChild() == null ? "" : codeGroups.item(i).getFirstChild().getNodeValue();
						if(codeGroup.endsWith("220")){
							%>
							<option value="<%=code%>"  <% if( code.equals(request.getParameter("sMtrtSeCode") ) ){  %> selected  <%} %> ><%=codeNm%></option>
							<%
						}
				     }
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				<span style="font-weight:bold;">구분&nbsp;</span>
				<select name="sSkllSeCode" style="border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 10%;
    height: 25px;">
				
				<option value="">선택하세요</option>
<%
				for(int i=0; i<size; i++){
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					String codeGroup = codeGroups.item(i).getFirstChild() == null ? "" : codeGroups.item(i).getFirstChild().getNodeValue();
						if(codeGroup.endsWith("218")){
							%>
							<option value="<%=code%>" <% if( code.equals(request.getParameter("sSkllSeCode") ) ){  %> selected  <%} %>><%=codeNm%></option>
							<%
						}
				     }
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				
				<span style="font-weight:bold;">지대&nbsp;</span>
				<select name="sGrdlSeCode" style="border-radius: 5px;
    border: 1px solid #c8a97e;
    width: 10%;
    height: 25px;">
				<option value="">선택하세요</option>
<%
				for(int i=0; i<size; i++){
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
					String codeGroup = codeGroups.item(i).getFirstChild() == null ? "" : codeGroups.item(i).getFirstChild().getNodeValue();
						if(codeGroup.endsWith("219")){
							%>
							<option value="<%=code%>" <% if( code.equals(request.getParameter("sGrdlSeCode") ) ){  %> selected  <%} %>><%=codeNm%></option>
							<%
						}
				     }
%>					</select>&nbsp;&nbsp;&nbsp;&nbsp;
		    </td>
		</tr>
<%
	}
}
%>
	</table>
	</form>

<%
//품종 정보 리스트
if(categoryCodeVal!=null && !categoryCodeVal.equals("")){
	//오퍼레이션 명
	operationName="varietyList";
	
	parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&categoryCode="+categoryCodeVal;
	parameter += "&pageNo="+request.getParameter("pageNo");
	parameter += "&insttCode="+insttCode;
	parameter += "&insttName="+URLEncoder.encode(insttName);

	if(categoryCodeVal.equals("FC")){
		//작물분류 검색
		if(request.getParameter("sCropsCode")!=null&&!request.getParameter("sCropsCode").equals("")){
			parameter += "&sCropsCode="+ request.getParameter("sCropsCode");
		}else{
			if(fCropsCode.size()>0){
				parameter += "&sCropsCode="+ fCropsCode.get(0);
			}
		}
		//숙기 검색
		if(request.getParameter("sMtrtSeCode")!=null&&!request.getParameter("sMtrtSeCode").equals("")){
			parameter += "&sMtrtSeCode="+ request.getParameter("sMtrtSeCode");
		}
		//기능구분 검색
		if(request.getParameter("sSkllSeCode")!=null&&!request.getParameter("sSkllSeCode").equals("")){
			parameter += "&sSkllSeCode="+ request.getParameter("sSkllSeCode");
		}
		//지대 검색
		if(request.getParameter("sGrdlSeCode")!=null&&!request.getParameter("sGrdlSeCode").equals("")){
			parameter += "&sGrdlSeCode="+ request.getParameter("sGrdlSeCode");
		}
		//품종 검색
		if(request.getParameter("sText")!=null&&!request.getParameter("sText").equals("")){
			parameter += "&sText="+ sText;
			parameter += "&sType="+ sType;
		}
		//육성년도 검색
		if(request.getParameter("sUnbrngYear")!=null&&!request.getParameter("sUnbrngYear").equals("")){
			parameter += "&sUnbrngYear="+ request.getParameter("sUnbrngYear");
		}
	}else{
		//품종 검색
		if(request.getParameter("sText")!=null&&!request.getParameter("sText").equals("")){
			parameter += "&sText="+ sText;
			parameter += "&sType="+ sType;
		}
		//작물명 검색
		if(request.getParameter("svcCodeNm")!=null&&!request.getParameter("svcCodeNm").equals("")){
			parameter += "&svcCodeNm="+ request.getParameter("svcCodeNm");
		}else{
			parameter += "&svcCodeNm="+ fSvcCodeNm.get(0);
		}
		//육성년도 검색
		if(request.getParameter("sUnbrngYear")!=null&&!request.getParameter("sUnbrngYear").equals("")){
			parameter += "&sUnbrngYear="+ request.getParameter("sUnbrngYear");
		}
	}


	//리스트 서버와 통신
	URL listApiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
	InputStream listApiStream = listApiUrl.openStream();
	
	Document listDoc = null;
	try{
		//xml document
		listDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(listApiStream);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		listApiStream.close();
	}
	
	int listSize = 0;
	
	listItems = null;
	NodeList svcCodeNms = null;
	NodeList unbrngYears = null; 
	NodeList unbrngInsttInfos = null; 
	NodeList cntntsSjs = null; 
	NodeList mainChartrInfos = null; 
	NodeList atchFileLinks = null; 
	NodeList orginlFileNms = null; 
	NodeList imgFileLinks = null;
	
	listItems = listDoc.getElementsByTagName("item");
	listSize = listDoc.getElementsByTagName("item").getLength();
	
	svcCodeNms = listDoc.getElementsByTagName("svcCodeNm");
	unbrngYears = listDoc.getElementsByTagName("unbrngYear");
	unbrngInsttInfos = listDoc.getElementsByTagName("unbrngInsttInfo");
	cntntsSjs = listDoc.getElementsByTagName("cntntsSj");
	mainChartrInfos = listDoc.getElementsByTagName("mainChartrInfo");
	atchFileLinks = listDoc.getElementsByTagName("atchFileLink");
	orginlFileNms = listDoc.getElementsByTagName("orginlFileNm");
	imgFileLinks = listDoc.getElementsByTagName("imgFileLink");

	if(listSize==0){ 
%>
	<h3>조회한 정보가 없습니다.</h3>
<%
	}else{
%>
	<hr>
	<table width="100%" border="1" cellSpacing="0" cellPadding="0">
			<colgroup>
			<col width="1%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="35%"/>
		</colgroup>
		<tr>
			<th>사진</th>
			<th>작물명</th>
			<th>육성년도</th>
			<th>육성기관</th>
			<th>품종명</th>
			<th>주요특성</th>
		</tr>
		
<%
		for(int i=0; i<listSize; i++){
			//서비스 코드명
			String svcCodeNm = svcCodeNms.item(i).getFirstChild() == null ? "" : svcCodeNms.item(i).getFirstChild().getNodeValue();
			//육성년도
			String unbrngYear = unbrngYears.item(i).getFirstChild() == null ? "" : unbrngYears.item(i).getFirstChild().getNodeValue();
			//육성 기관 정보
			String unbrngInsttInfo = unbrngInsttInfos.item(i).getFirstChild() == null ? "" : unbrngInsttInfos.item(i).getFirstChild().getNodeValue();
			//컨텐츠 제목
			String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? "" : cntntsSjs.item(i).getFirstChild().getNodeValue();
			//주요 특성 정보
			String mainChartrInfo = mainChartrInfos.item(i).getFirstChild() == null ? "" : mainChartrInfos.item(i).getFirstChild().getNodeValue();
			//파일경로
			String atchFileLink = atchFileLinks.item(i).getFirstChild() == null ? "" : atchFileLinks.item(i).getFirstChild().getNodeValue();
			//파일명
			String orginlFileNm = orginlFileNms.item(i).getFirstChild() == null ? "" : orginlFileNms.item(i).getFirstChild().getNodeValue();
			//이미지 경로
			String imgFileLink = imgFileLinks.item(i).getFirstChild() == null ? "http://www.nongsaro.go.kr/ps/img/common/anvil_img.jpg" : imgFileLinks.item(i).getFirstChild().getNodeValue();
%>
		<tr>
		    <td><img src="<%=imgFileLink%>" width="128" height="103"></img></td>
   			<td><%=svcCodeNm%></td>
   			<td><%=unbrngYear%></td>
   			<td><%=unbrngInsttInfo%></td>
   			<td><a href="<%=atchFileLink%>"><%=cntntsSj%></a></td>
   			<td><%=mainChartrInfo%></td>
		</tr>
<%		
		}
%>
	</table><br/>
<div style="text-align:center;">	
<%
	}
	
//페이징 처리
	//한 페이지에 제공 할 건수
	String numOfRows = "";
	//조회된 총 건수
	String totalCount = "";
	//조회할 페이지 번호
	String pageNo = "";
	try{numOfRows = listDoc.getElementsByTagName("numOfRows").item(0).getFirstChild().getNodeValue();}catch(Exception e){numOfRows = "";}
	try{totalCount = listDoc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();}catch(Exception e){totalCount = "";}
	try{pageNo = listDoc.getElementsByTagName("pageNo").item(0).getFirstChild().getNodeValue();}catch(Exception e){pageNo = "";}

	int pageGroupSize = 10;
	int pageSize = 0;
	try{
		pageSize = Integer.parseInt(numOfRows);
	}catch(Exception e){
		pageSize = 10;
	}
	int start = 0; 
	try{
		start = Integer.parseInt(pageNo);
	}catch(Exception e){
		start = 1;
	}
	
	
	int currentPage = 1;
	try{currentPage = Integer.parseInt(pageNo);}catch(Exception e){}

	int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호 
	int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호           
	int count = Integer.parseInt( totalCount);                                                            
	int number=0;                                                             

		
	number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호                                                                  
    
	//페이지그룹의 갯수                                                                                                             
	//ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.                                                       
	int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);                           
	//페이지 그룹 번호                                                                                                              
	//ex) pageGroupSize가 3일 경우  '[1][2][3]'의 페이지그룹번호는 1 이고  '[2][3][4]'의 페이지그룹번호는 2 이다.                   
	int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);                                                          


	if(count > 0){
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = pageGroupSize*(numPageGroup-1)+1;
		int endPage = startPage + pageGroupSize-1;
		int prtPageNo = 0;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(numPageGroup > 1){
			prtPageNo = (numPageGroup-2)*pageGroupSize+1;
			out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[이전]</a>");
		}
		
		for(int i=startPage; i<=endPage; i++){
			prtPageNo = i;
			out.print("<a href='javascript:fncGoPage("+prtPageNo+");'>");
			if(currentPage == i){
				out.print("<strong>["+i+"]</strong>");
			}else{
				out.print("["+i+"]");
			}
			out.println("</a>");
		}
		
		if(numPageGroup < pageGroupCount){
			prtPageNo = (numPageGroup*pageGroupSize+1);
			out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[다음]</a>");
		}
	}
//페이징 처리 끝
}
%>
</div><br/>
<%@ include file= "../home/footer.jsp" %>
</body>
</html>