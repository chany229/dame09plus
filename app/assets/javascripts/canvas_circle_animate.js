$(function(){
	$("#commands").html("<button id='start_animation' class='btn'>开始</button><button id='stop_animation' class='btn'>停止</button>");

	var canvas = $("#canvas");
	var context = canvas.get(0).getContext("2d");

	var canvas_width = canvas.width();
	var canvas_height = canvas.height();

	var play_animation = true;

	var start_button = $("#start_animation");
	var stop_button = $("#stop_animation");

	start_button.hide();
	start_button.click(function(){
		$(this).hide();
		stop_button.show();

		play_animation = true;
		animate();
	})

	stop_button.click(function(){
		$(this).hide();
		start_button.show();

		play_animation = false;
	})


})