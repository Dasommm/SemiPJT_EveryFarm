$(function() {
	$('tr').mouseover(function() {
		$(this).css({'background-color':'#F9EDA5','transition': 'background-color 1s'});
	}).mouseout(function() {
        $(this).css({'background-color':'transparent','transition': 'background-color 1s'});
        $('.table-striped > tbody > tr:nth-of-type(odd)').css('background-color','#f2f2f2');
    });
	$('td').mouseover(function() {
		$(this).attr('title', $(this).text());
	});
});

/*
.table-striped > tbody > tr:nth-of-type(odd) {
	  background-color: #f9f9f9;
*/