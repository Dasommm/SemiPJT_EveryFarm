<%@page import="java.net.URLDecoder"%>
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
<title>농업기술 동영상</title>
<script type="text/javascript">

//기관 카테고리
function mainMove(){
	with(document.searchInsttForm){
		method="post";
		action = "agriTechVideo.jsp";
		target = "_self";
		submit();
	}
}

//페이지 이동
function fncGoPage(page){
	with(document.listApiForm){
		subCategoryCode.value = document.getElementById("subCombo")[document.getElementById("subCombo").selectedIndex].value;
		pageNo.value = page;
		method="post";
		action = "agriTechVideo.jsp";
		target = "_self";
		submit();
	}
}

//카테고리 이동
function fncNextPage(cCode){
	with(document.apiForm){
		categoryCode.value = cCode;
		method="post";
		action = "agriTechVideo.jsp";
		target = "_self";
		submit();
	}
}

//상세 리스트 조회
function listMove(){
	with(document.listApiForm){
		subCategoryCode.value = document.getElementById("subCombo")[document.getElementById("subCombo").selectedIndex].value;
		method="post";
		action = "agriTechVideo.jsp";
		target = "_self";
		submit();
	}
}

//비디오 팝업
function fncNongsaroOpenVideo(videoLink){
	var agent = navigator.userAgent.toLowerCase();
	var isLowIe = (agent.indexOf("msie 7") > 0) || (agent.indexOf("msie 8") > 0);

	var dWidth = 1120;
	var dHeight = 505;

	if(isLowIe){
		dWidth = 800;
		dHeight = 440;
		videoLink = videoLink.replace("view01", "view01ie8");
	}

	window.open(videoLink, "nongsaroVideoPop","width=" + dWidth + ",height=" + dHeight);
}
</script>
</head>
<body>
<%@ include file= "../home/header.jsp" %>
<section style="height:1500px;">
<h3 style="text-align:center; margin-top:1%;"><strong>농업기술 동영상</strong></h3>
<hr>

<%
//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
String apiKey="202002214LZU7B4QMV92BMSTIXDJAG";
//서비스 명
String serviceName="agriTechVideo";

//기관코드 등록
String insttCode = "";
if(request.getParameter("insttCode")!=null && !request.getParameter("insttCode").equals("")){
	insttCode = request.getParameter("insttCode");
}
//기관코드 등록
String insttName = "";
if(request.getParameter("insttName")!=null && !request.getParameter("insttName").equals("")){
	insttName = new String(request.getParameter("insttName").getBytes("8859_1"), "UTF-8");
}
%>
<form name="apiForm">
<input type="hidden" name="categoryCode" value="<%=request.getParameter("categoryCode") %>">
<input type="hidden" name="insttName" value="<%=insttName%>">
<input type="hidden" name="insttCode" value="<%=insttCode%>">
</form>

<%
//기관 코드
if(true){
	//오퍼레이션 명
	String operationName="insttList";
	
	//XML 받을 URL 생성
	String parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	if(insttCode != null && !insttCode.equals("")){
		parameter += "&insttCode="+insttCode;
	}
	
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
	<form name="searchInsttForm" style="font-weight:bold; margin-left: 5%;">
	<input type="hidden" name="insttCode" value="<%=insttCode%>">
		기관명&nbsp;
		<select name="insttName" onchange="mainMove();" style="width:15%; height:30px; border-radius:5px; border:1px solid #c8a97e;">
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
//메인 카테고리
	//오퍼레이션 명
	String operationName="mainCategoryList";
	
	//XML 받을 URL 생성
	String parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&insttName="+URLEncoder.encode(insttName);
	parameter += "&insttCode="+insttCode;
	
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
	NodeList categoryNms = null;
	NodeList categoryCodes = null;
	
	items = mainDoc.getElementsByTagName("item");
	size = mainDoc.getElementsByTagName("item").getLength();
	categoryNms = mainDoc.getElementsByTagName("categoryNm");
	categoryCodes = mainDoc.getElementsByTagName("categoryCode");
	if(size==0){ 
%>
	<hr>
	<h3><font color='red'>조회한 정보가 없습니다.</font></h3>
<%
	}else{
		
%>
	<hr>
	<table width="100%" border="1" cellSpacing="0" cellPadding="0">
		<tr>
<%
		for(int i=0; i<size; i++){
			//메인 카테고리 명
			String categoryNm = categoryNms.item(i).getFirstChild() == null ? "" : categoryNms.item(i).getFirstChild().getNodeValue();
			//메인 카테고리 분류 코드
			String categoryCode = categoryCodes.item(i).getFirstChild() == null ? "" : categoryCodes.item(i).getFirstChild().getNodeValue();
%>
				<td><a href="javascript:fncNextPage('<%=categoryCode%>');"><%=categoryNm%></a></td>
<%		
		}
%>
		<tr>
	</table>
<%
	}
%>
<hr>

<%
if(size > 0){
//메인 카테고리 -> 서브 카테고리
	//오퍼레이션 명
	operationName="subCategoryList";
	
	parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&insttName="+URLEncoder.encode(insttName);
	parameter += "&insttCode="+insttCode;

	//서브 카테고리 조회
	if(request.getParameter("categoryCode")==null || request.getParameter("categoryCode").equals("null")) {
		parameter += "&categoryCode="+categoryCodes.item(0).getFirstChild().getNodeValue();
	}else{
		parameter += "&categoryCode="+request.getParameter("categoryCode");
	}

	//서브카테고리 서버와 통신
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
	
	int subSize = 0;
	
	NodeList subItems = null;
	NodeList subCategoryNms = null;
	NodeList subCategoryCodes = null;
	
	subItems = subDoc.getElementsByTagName("item");
	subSize = subDoc.getElementsByTagName("item").getLength();
	subCategoryNms = subDoc.getElementsByTagName("categoryNm");
	subCategoryCodes = subDoc.getElementsByTagName("categoryCode");
	
	if(subSize==0){ 
%>
	<h3><font color='red'>조회한 정보가 없습니다.</font></h3>
<%
	}else{ 
%>
<form name="listApiForm">
<input type="hidden" name="categoryCode" value="<%=request.getParameter("categoryCode") %>">
<input type="hidden" name="subCategoryCode" value="<%=request.getParameter("subCategoryCode") %>">
<input type="hidden" name="insttName" value="<%=insttName%>">
<input type="hidden" name="insttCode" value="<%=insttCode%>">
<input type="hidden" name="pageNo">
	<table width="100%" cellSpacing="0" cellPadding="0">
		<tr>
		 <a style="font-weight:bold; margin-left: 5%;">상세 분류&nbsp;</a><select name="subCombo" id="subCombo" onchange="listMove();" style="width:13%; height:30px; border-radius:5px; border:1px solid #c8a97e;"> 
<%
		for(int i=0; i<subSize; i++){
			//서브 카테고리 명
			String subCategoryNm = subCategoryNms.item(i).getFirstChild() == null ? "" : subCategoryNms.item(i).getFirstChild().getNodeValue();
			//서브 카테고리 분류 코드
			String subCategoryCode = subCategoryCodes.item(i+1).getFirstChild() == null ? "" : subCategoryCodes.item(i+1).getFirstChild().getNodeValue(); 
				
%>
			<option value="<%=subCategoryCode%>" <% if(subCategoryCode.equals(request.getParameter("subCategoryCode"))){out.print("selected");}%>  ><%=subCategoryNm%> </option>
<%		
		}
%>
		</select>
		<a style="font-weight:bold; margin-left:5%;">동영상 제목&nbsp;</a><input type="text" name="videoTitle" value="<%=request.getParameter("videoTitle")==null?"": new String(request.getParameter("videoTitle").getBytes("8859_1"), "UTF-8")%>" style="border-radius:5px; width:13%; height:30px; border:1px solid #c8a97e;">
		<td align="right">
			<input type="button" name="search" value="조회" onclick="return listMove();" style="margin-top: -1.7%;
    margin-right: 49%;
    width: 5%;
    height: 30px;
    background: black;
    color: white;
    font-weight: bold;
    border-radius: 5px;"/>
		</td>
		</tr>
	</table>
</form>
<hr>
<%
	}
%>

<%
//메인 카테고리 -> 서브 카테고리 -> 품목 리스트
if(subSize > 0){
	//오퍼레이션 명
	operationName="videoList";
	
	parameter = "/"+serviceName+"/"+operationName;
	parameter += "?apiKey="+ apiKey;
	parameter += "&pageNo="+request.getParameter("pageNo");

	//서브 카테고리 조회
	if(request.getParameter("subCategoryCode")==null || request.getParameter("subCategoryCode").equals("")) {
		parameter += "&categoryCode="+subCategoryCodes.item(1).getFirstChild().getNodeValue();
	}else{
		parameter += "&categoryCode="+request.getParameter("subCategoryCode");
	}
	
	//동영상 제목 조회
	if(request.getParameter("videoTitle")!=null&&!request.getParameter("videoTitle").equals("")){
		parameter += "&videoTitle="+new String(request.getParameter("videoTitle").getBytes("8859_1"), "UTF-8");
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
	
	NodeList listItems = null;
	NodeList videoImgs = null;
	NodeList videoLinks = null;
	NodeList videoOriginInstts = null;
	NodeList videoTitles = null;
	
	listItems = listDoc.getElementsByTagName("item");
	listSize = listDoc.getElementsByTagName("item").getLength();
	videoImgs = listDoc.getElementsByTagName("videoImg");
	videoLinks = listDoc.getElementsByTagName("videoLink");
	videoOriginInstts = listDoc.getElementsByTagName("videoOriginInstt");
	videoTitles = listDoc.getElementsByTagName("videoTitle");

	if(listSize==0){ 
%>
	<h3><font color='red'>조회한 정보가 없습니다.</font></h3>
<%
	}else{
%>
	<table border="1" cellSpacing="0" cellPadding="0">
		<colgroup>
		<col width="10%" />
		<col width="*" />
		<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="background: black; color:white; text-align:center;">동영상</th>
				<th scope="col" style="background: black; color:white; text-align:center;">제목</th>
				<th scope="col" style="background: black; color:white; text-align:center;">출처</th>
			</tr>
		</thead>
		<tbody style="text-align:center;">
<%
		for(int i=0; i<listSize; i++){
			//동영상 이미지
			String videoImg = videoImgs.item(i).getFirstChild() == null ? "" : videoImgs.item(i).getFirstChild().getNodeValue();
			//동영상 링크
			String videoLink = videoLinks.item(i).getFirstChild() == null ? "" : videoLinks.item(i).getFirstChild().getNodeValue();
			//동영상 출처
			String videoOriginInstt = videoOriginInstts.item(i).getFirstChild() == null ? "" : videoOriginInstts.item(i).getFirstChild().getNodeValue();
			//동영상 제목
			String videoTitle = videoTitles.item(i).getFirstChild() == null ? "" : videoTitles.item(i).getFirstChild().getNodeValue();
%>
		<tr>
		    <td>
		    <a href="#" title="<%=videoTitle %>" onclick="fncNongsaroOpenVideo('<%=videoLink%>');return false;">
		    <img src="<%=videoImg%>" width="128" height="103" style="width:90%;"></img>
		    </a>
		    </td>
		    <td><%=videoTitle%></td>
		    <td><%=videoOriginInstt %></td>
		</tr>
<%		
		}
%>
	    </tbody>
	</table><br/><br/>
<div style="text-align:center;">	
<%
	}
	
//페이징 처리 시작
	//한 페이지에 제공할 건수
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
			out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[Prev]</a>");
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
			out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[Next]</a>");
		}
	}
//페이징 처리 끝
}
}
%>
</div>
<br/>
</section>
<%@ include file= "../home/footer.jsp" %>
</body>
</html>