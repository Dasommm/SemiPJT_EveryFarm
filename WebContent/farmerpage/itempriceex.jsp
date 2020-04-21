<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function (){
		$.getJSON("../resources/json/itemprice.json", function(data){
			$.each(data, function(key, val){
				if(key=="DESCRIPTION"){
					$("table").attr("border", "1");
					
					$("thead").append(
						"<tr>"+
						"<th>" + val.PUMNAME +"</th>"+
						"<th>" + val.GRADENAME +"</th>"+
						"<th>" + val.UNITQTY+val.UNITNAME +"</th>"+
						"<th>" + val.MINPRICE +"</th>"+
						"<th>" + val.MAXPRICE +"</th>"+
						"<th>" + val.AVGPRICE +"</th>"+
						"</tr>"
					);
				} else if(key=="DATA"){
					var list = val;
					for(var i = 0; i < list.length; i++){
						var str = list[i];
						$("tbody").append(
								"<tr>"+
									"<td>"+ str.pumname +"</td>"+
									"<td>"+ str.gradename +"</td>"+
									"<td>"+ str.unitqty+str.unitname +"</td>"+
									"<td>"+ str.minprice +"</td>"+
									"<td>"+ str.maxprice +"</td>"+
									"<td>"+ str.avgprice +"</td>"+
								"</tr>"
						);
					}
				}
			});
		});
	});
</script>
<style type="text/css">

	table {
		width: 100%;
		border: 1px gray;
	}
	table thead{
		background-color: #a99781;
		color : white;
	}
	
	thead tr{
		height: 50px;
	}
	
	tbody tr{
		height: 40px;
		text-align: center;
	}
</style>
</head>
<body>
	
	<table>
		<thead></thead>
		<tbody></tbody>
	</table>


</body>
</html>