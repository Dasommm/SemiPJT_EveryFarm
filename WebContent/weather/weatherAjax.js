$(function(){
	$("#weaview").click(function(){
		
		var url = "../weather";
		var code = $("#demo").val();
		$.ajax({
			type :"GET",
			url : url+"?code="+code,
			datatype : "text",
			success : function(msg){
				var tmp = $.trim(msg);
				var obj = JSON.parse(tmp);
				$(".result").show();
				$("weaview").empty();
				console.log(obj);
				$("#pubData").html(obj.pubDate);
				$("#temp").html(obj.temp);
				$("#reh").html(obj.reh);
				$("#pop").html(obj.pop);
				
				var condition = obj.wfKor;
				if(condition == "맑음"){
					$("#weather_img").attr("src","../resources/images/weather/sun.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/sunny_back.jfif')");
				}else if(condition =="비"){
					$("#weather_img").attr("src","../resources/images/weather/rain.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/rain_back.jfif')");
				}else if(condition =="눈"){
					$("#weather_img").attr("src","../resources/images/weather/snow.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/snow_back.jfif')");
				}else if(condition =="흐림"){
					$("#weather_img").attr("src","../resources/images/weather/cloud.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/cloud_back.jfif')");
				}else if(condition =="구름조금"){
					$("#weather_img").attr("src","../resources/images/weather/cloud_sun.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/.jfif')");
				}else {
					$("#weather_img").attr("src","../resources/images/weather/etc.png");
					$("#background-pic").attr("style","background-image: url('../resources/images/weather/sun_cloud_back.jfif')");
				}
			},
			error : function(){
				alert("data load failed");
			}
		})
	})
})