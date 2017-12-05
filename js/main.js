$(function(){
	$("#plan").click(function(){
		$.ajax({
			method: "POST",
			url: "plan"
		}).done(function(msg){
			$('#sol').html(msg);
		});
	});
	
});
