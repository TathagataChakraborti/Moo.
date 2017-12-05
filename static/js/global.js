$(function(){
	$("#plan").click(function(){
		$.ajax({
			method: "POST",
			url: "plan"
		}).done(function(msg){
			$('#sol').html(msg);
		});
	});
	$('.difficulty').click(function( event ) {

		if ($(this).hasClass("btn-secondary")) {

			$(this).removeClass("btn-secondary");
			$(this).addClass("btn-outline-secondary");

		} else {

			var tempList = document.getElementsByName(this.getAttribute("name"));

			for (var i = 0; i < tempList.length; i++) {
				tempList[i].classList.remove("btn-secondary");
				tempList[i].classList.add("btn-outline-secondary");
			}

			$(this).removeClass("btn-outline-secondary");
			$(this).addClass("btn-secondary");

		}
	});

});
