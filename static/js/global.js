$(function(){
	var difficultyValue = 1;
	$("#suggest").click(function(){
		$("#loading").show();
		var difficulty = difficultyValue;
		var student = $('#allow-students').prop('checked');
		console.log("values ", difficulty, " ", student);
		var data = {
			'd': difficulty,
			's': student
		};
		$.ajax({
			method: "POST",
			data: JSON.stringify(data, null, '\t'),
			contentType: 'application/json;charset=UTF-8',
			url: "plan",
			success: function(msg){
				$("#loading").hide();
				makeTable(msg)
			},
			error: function(){
				$("#loading").hide();
				$('#curriculumCardInternal').html("Something went wrong!")
			}
		}).done(function(msg){
			if(msg != "No Plan Found")
				makeTable(msg);
		});
	});
	
	$(".modalsuggest").click(function(){
		var alpha = $(this).prop('value');
		var data = {
			'a': alpha
		};
		$.ajax({
			method: "POST",
			data: JSON.stringify(data, null, '\t'),
			url: "explain",
			contentType: 'application/json;charset=UTF-8',
			success: function(msg){
				modalSuggest(msg);
			},
			error: function(){
				$('#curriculumCardInternal-2').html("Something went wrong!");
			}
		});
	});
	$('.difficulty').click(function( event ) {
		difficultyValue = $(this).prop('value');
		console.log("difficultyValue changed", difficultyValue);

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

	var makeTable = function(plan_blob){
		//plan_blob = 'do_tutorial_t8 s5 (9)\ndo_activity_a3 s1 (1)\ndo_tutorial_t0 s5 (9)\ndo_tutorial_t1 s5 (9)\ndo_tutorial_t10 s5 (9)\ndo_tutorial_t11 s5 (9)\ndo_tutorial_t12 s1 (9)\ndo_tutorial_t2 s5 (9)\ndo_tutorial_t3 s5 (9)\ndo_tutorial_t4 s5 (9)\ndo_tutorial_t6 s5 (9)\ndo_tutorial_t7 s5 (9)\ndo_tutorial_t9 s5 (9)\napply domain-axioms s5 a3 (1)\napply conditional-effects s5 a3 (1)\napply adl s5 a3 (1)\ndo_activity_a5 s5 (1)\napply temporal-constraints s1 a5 (1)\ndo_activity_a1 s2 (1)\napply negative-conditions s5 a1 (1)\napply functions s5 a1 (1)\napply equality s5 a1 (1)\ndo_activity_a0 s4 (1)\napply typing s5 a0 (1)\napply strips s5 a0 (1)\napply states s5 a0 (1)\napply propositions s5 a0 (1)\napply operators s5 a0 (1)\napply action-costs s5 a0 (1)\ndone_activity_a5 s5 (0)\ndone_activity_a3 s1 (0)\ndone_activity_a1 s2 (0)\ndone_activity_a0 s4 (0)';
		row_blob  = '<tr><td>{0}</td><td>{1}</td><td>{2}</td><td><button type="button" class="btn btn-outline-danger" onClick="window.open("{3}", "_blank")">Link</button></td></tr>';

		plan_blob = plan_blob.split('\n');
		temp_blob = ''

		for (var i = 0; i < plan_blob.length; i++) {

			if (plan_blob[i].slice(0,3) === 'do_') {

				id   = plan_blob[i].split('_')[2].split(' ')[0].toUpperCase();
				type = capitalize(plan_blob[i].split('_')[1]);

				student = plan_blob[i].split(' ')[1].toUpperCase();;

				if (student === 'S5') {
					student = '--';
				}

				temp_blob += row_blob.replace('{0}', id).replace('{1}', type).replace('{2}', student);
			}

		}

		$('#curriculumCardInternal').html(temp_blob);
		$('#curriculumCard').show();
	};

	//$('.modalsuggest').click(function() {
	var modalSuggest = function(expl_blob){
		//plan_blob = 'define_action_1_t1 a1 action-costs\ndefine_action_1_t1 a2 equality\ndefine_action_1_t2 a1 typing\ndefine_action_1_t1 a3 action-costs\ndefine_action_1_t1 a3 equality'
		//expl_blob = 'Explanation >> has-initial-state-has_concept typing'

		row_blob  = '<tr><td>{0}</td><td>{1}</td><td>{2}</td><td><button type="button" class="btn btn-outline-danger" onClick="window.open("{3}", "_blank")">Link</button></td></tr>';

		temp_blob = ''

		if ( expl_blob !== '' ) {

				if ( $('#allow-students-2').prop('checked') ) {

					temp_blob += row_blob.replace('{0}', 'T6').replace('{1}', 'Tutorial').replace('{2}', 'S3');

				} else {

					temp_blob += row_blob.replace('{0}', 'T6').replace('{1}', 'Tutorial').replace('{2}', '--');

				}

		}

		temp_blob += row_blob.replace('{0}', 'A0').replace('{1}', 'Activity').replace('{2}', '--');

		$('#curriculumCardInternal-2').html(temp_blob);
		$('#curriculumCard-2').show();

	};

	function capitalize(string) {
		return string.charAt(0).toUpperCase() + string.slice(1);
	}

});
