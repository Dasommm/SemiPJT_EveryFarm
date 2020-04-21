<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 도로명 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){            
		$("#zonecode").click(function(){
	
			openDaumZipAddress();
		
		});
		
	});
	function openDaumZipAddress() {   
		
		new daum.Postcode({
	
			oncomplete:function(data) {
	
				jQuery("#postcode1").val(data.postcode1);
	
				jQuery("#postcode2").val(data.postcode2);
	
				jQuery("#zonecode").val(data.zonecode);
	
				jQuery("#address").val(data.address);
	
				jQuery("#address_etc").focus();
	
				console.log(data);
	
			}
	
		}).open();
		$("#detail01").show();
		$("#detail02").show();
	}
	
	$(document).ready(function(){
		$("#file1").on("change", handleImgFileSelect01);
	});
	
	function handleImgFileSelect01(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 첨부 가능합니다.");
				return false;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#farm_img1").attr("src", e.target.result).attr("style", "margin : 20px;");
				$("#farm_img1").parent().attr("style","height:auto;");
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	$(document).ready(function(){
		$("#file2").on("change", handleImgFileSelect02);
	});
	
	function handleImgFileSelect02(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 첨부 가능합니다.");
				return false;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#farm_img2").attr("src", e.target.result).attr("style", "margin : 20px;");
				$("#farm_img2").parent().attr("style","height:auto;");
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	$(document).ready(function(){
		$("#file3").on("change", handleImgFileSelect03);
	});
	
	function handleImgFileSelect03(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 첨부 가능합니다.");
				return false;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#farm_img3").attr("src", e.target.result).attr("style", "margin : 20px;");
				$("#farm_img3").parent().attr("style","height:auto;");
			}
			reader.readAsDataURL(f);
		});
	}
	
	$(document).ready(function(){
		$("#file4").on("change", handleImgFileSelect04);
	});
	
	function handleImgFileSelect04(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 첨부 가능합니다.");
				return false;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#farm_img4").attr("src", e.target.result).attr("style", "margin : 20px;");
				$("#farm_img4").parent().attr("style","height:auto;");
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	function formcheck(){
		var form = document.registform;
		if(form.wfarm_title.value=="" || form.wfarm_image_01.value=="" || 
			form.wfarm_zoneCode.value=="" || form.wfarm_addr.value=="" || 
			form.wfarm_totalArea.value=="" || form.wfarm_price.value=="" || 
			form.wfarm_image_02.value=="" || form.wfarm_image_03.value=="" || 
			form.wfarm_image_04.value=="" || form.wfarm_content.value==""){
			
			if(form.wfarm_title.value==""){
				alert("농장 이름을 입력해주세요!");
				form.wfarm_title.focus();
				return false;
			} else if(form.wfarm_image_01.value==""){
				alert("농장 대표 이미지를 첨부해주세요!");
				return false;
			} else if(form.wfarm_zoneCode.value==""){
				alert("농장 주소를 올바르게 입력해주세요!");
				form.wfarm_zoneCode.focus();
				return false;
			} else if(form.wfarm_addr.value==""){
				alert("농장 주소를 올바르게 입력해주세요!");
				form.wfarm_addr.focus();
				return false;
			} else if(form.wfarm_totalArea.value==""){
				alert("총평수를 지정해주세요!");
				form.wfarm_totalArea.focus();
				return false;
			} else if(form.wfarm_price.value==""){
				alert("평당 가격을 입력해주세요!");
				form.wfarm_price.focus();
				return false;
			} else if(form.wfarm_image_02.value==""){
				alert("농장 상세 이미지를 첨부해주세요!");
				return false;
			} else if(form.wfarm_image_03.value==""){
				alert("농장 상세 이미지를 첨부해주세요!");
				return false;
			} else if(form.wfarm_image_04.value==""){
				alert("농장 상세 이미지를 첨부해주세요!");
				return false;
			} else if(form.wfarm_content.value==""){
				alert("농장 상세 정보를 입력해주세요!");
				form.wfarm_content.focus();
				return false;
			}
			
		} else {
			form.submit();
		}
		
	}

</script>
<style type="text/css">



#outline{
	width: 70%;
    height: auto;
    position: relative;
    top: 30%;
    right: 15%;
    left: 15%;
    padding-top: 100px;
    padding-bottom: 100px;
}

form{
	position: relative;
	width: auto;
	left: 15%;
	height : auto;
	padding-top: 30px;
}
.items{
	padding-top: 1em;
	padding-botton: 1em;
}


.inputbox{
	border: 1px;
	border-color: gray;
	border-radius: 3px;
	background: #f2f2f2;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	vertical-align: center;
	width: 300px;
}

#submitbutton{
	width: 150px;
	height: 3em;
	border: 0;
	background-color: black;
	color : white;
	border-radius: 5px;
	font-size: 13pt;
	margin-left: 65%;
}



.items>span{
	display: inline-block;
	margin: 5px;
}
label{
	font-size: 14pt;
}


.filebox label {
  display: inline-block;
  padding: .4em .6em;
  color: #fff;
  font-size: 11pt;
  line-height: normal;
  vertical-align: middle;
  background-color: #c3ab82;
  cursor: pointer;
  border: 0px;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #876837;
}

.filebox label:active {
  background-color: #c9baa2;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}


.img_wrap{
	width : 300px;
	height: 0;
}
.img_wrap img{
	max-width: 100%;
}

.img_wrap2{
	width : 600px;
	height: 0;
}
.img_wrap2 img{
	max-width: 100%;
}

span{
	height:46px;
	vertical-align: text-top;
}

label{
	font-size: 15pt;
	font-weight: bold;
}
#contentbox{
	border: 1px;
	border-color: gray;
	border-radius: 4px;
	background: #f2f2f2;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	vertical-align: center;
	width: 700px;
}

</style>
</head>
<body>

	<%@ include file="../home/header.jsp" %>
	
	<section>
		<div id="outline">
		<h1 style="font-weight:bold;">임대 농장 등록</h1>
		<form action="../farmer.do" method="post" enctype="multipart/form-data" name="registform">
			<input type="hidden" name="command" value="registform">
			<input type="hidden" name="mem_id" value= "${sessionScope.dto.mem_id}">
			
			<div class="items"><label style="margin: 0;">농장 이름</label><br>
			<input type="text" name="wfarm_title" class="inputbox"></div>
			
			<div class="items"><label style="margin: 0;">농장 대표 이미지</label><br>
				<div class="filebox">
					<label for="file1">이미지 첨부</label>
					<input type="file" name="wfarm_image_01" id="file1">
					<div class="img_wrap">
						<img id="farm_img1">
					</div>
				</div>
			</div>
			
			<div class="items"><label style="margin: 0;">농장 주소</label><br>
			<input type="text" name="wfarm_zoneCode" id="zonecode" readonly class="inputbox" style="width: 500px;"><br>
			<input type="text" name="wfarm_addr" id="address" readonly class="inputbox" style="width: 500px;"></div>
			
			<div class="items"><label style="margin: 0;">총 평수</label><br>
			<input type="text" name="wfarm_totalArea" class="inputbox"><span> 평</span></div>

			<div class="items"><label style="margin: 0;">평당 가격</label><br>
			<input type="text" name="wfarm_price" class="inputbox"><span> 원</span></div>

			<div class="items"><label style="margin: 0;">농장 상세 사진</label> <br>
				<div class="filebox">
					<label for="file2">이미지 첨부</label>
					<input type="file" name="wfarm_image_02" id="file2"><br>
					<div class = "img_wrap2">
						<img id="farm_img2" />
					</div>
				</div>
				<div class="filebox">
					<label for="file3">이미지 첨부</label>
					<input type="file" name="wfarm_image_03" id="file3"><br>
					<div class = "img_wrap2">
						<img id="farm_img3" />
					</div>
				</div>
				<div class="filebox">
					<label for="file4">이미지 첨부</label>
					<input type="file" name="wfarm_image_04" id="file4"></div>
					<div class = "img_wrap2">
						<img id="farm_img4" />
					</div>
				</div>
			<div class="items"><label style="margin: 0;">농장 상세 정보</label></div>
			<textarea name="wfarm_content" cols="50" rows="20" id="contentbox"></textarea>	
			<br>
			<br>
			<input type="button" id="submitbutton" value="등록 신청" onclick="formcheck()">
		    

		</form>
		</div>
	</section>
	
	<footer><%@ include file="../home/footer.jsp" %></footer>
</body>
</html>