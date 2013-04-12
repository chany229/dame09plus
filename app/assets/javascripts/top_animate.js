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


	function animate() {
		context.clearRect(0, 0, canvas_width, canvas_height);

		var shapes_length = shapes.length;
		for(var i = 0; i < shapes_length; i++){
			var tmp_shape = shapes[i];
			tmp_shape.x += tmp_shape.width/10.0;
			if(tmp_shape.x / canvas_width > 1) {
				tmp_shape.x = -tmp_shape.width;
			}
			//tmpShape.x %= (canvas_width);
			context.fillStyle = tmp_shape.color;
			context.fillRect(tmp_shape.x, tmp_shape.y, tmp_shape.width, tmp_shape.width);
		}
		if(play_animation){
			setTimeout(animate, 33);	
		};
	};

	var image = new Image();
	image.src = "/assets/test.jpg";
	$(image).load(function(){
		animate();
	})

})