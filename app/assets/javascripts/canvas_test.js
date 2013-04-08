//650x600
$(function(){
	var canvas = $("#canvas");
	var canvas_width = canvas.width();
	var canvas_height = canvas.height();
	var context = canvas.get(0).getContext("2d");
	context.fillStyle = "rgba(255,255,255,1)";
	context.fillRect(0,0,canvas_width,canvas_height);
	context.fillStyle = "rgb(0,0,0)";
	context.strokeStyle = "rgb(0,0,0)";
    //context.beginPath();
    context.arc(325,300,100,0,Math.Pi * 2,false);
    //context.closePath();
    context.fill();
    context.stroke();

    var image = new Image();
    image.src = "/assets/test.jpg";
    $(image).load(function(){
    	context.drawImage(image,0,0,325,300);
    	context.drawImage(image,325,300,325,300);
    	var imageData = context.getImageData(0,0,325,300);
    	var pixels = imageData.data;
    	var numPixels = pixels.length;
    	for ( var i = 0; i < numPixels; i++ ) {
    		pixels[i*4] = 255-pixels[i*4];
    		pixels[i*4+1] = 255-pixels[i*4+1];
    		pixels[i*4+2] = 255-pixels[i*4+2];
    	};
    	context.putImageData(imageData,0,300);
    	for ( var i = 0; i < numPixels; i++ ) {
    		var average = (pixels[i*4]+pixels[i*4+1]+pixels[i*4+2])/3;
    		pixels[i*4] = average;
    		pixels[i*4+1] = average;
    		pixels[i*4+2] = average;
    	};
		//context.putImageData(imageData,325,0);
		var tileWidth =12;
		var tileHeight = 12;
		var imageData = context.getImageData(0,0,325,300);
		var pixels = imageData.data;
		for (var r=0;r<(imageData.height/tileHeight);r++){
			for (var c=0;c<(imageData.width/tileWidth);c++){
				var x = (c*tileWidth)+(tileWidth/2);
				var y = (r*tileHeight)+(tileHeight/2);
				var pos = (Math.floor(y)*(imageData.width*4))+(Math.floor(x)*4);
				var red = pixels[pos];
				var green = pixels[pos+1];
				var blue = pixels[pos+2];
				context.fillStyle = "rgb("+red+","+green+","+blue+")";
				context.strokeStyle = "rgb("+red+","+green+","+blue+")";
				context.beginPath();
				context.arc(x + 325, y, tileWidth / 2, 0, Math.PI * 2, false);
				context.closePath();
				context.fill();
				//context.stroke();
				//context.fillRect(x-(tileWidth/2)+325,y-(tileHeight/2),tileWidth,tileHeight);
			}
		}
		context.strokeStyle = "rgb(255,255,255)";
		for (i = 0;i<=300;i++) {
			if(i%5 == 0){
				context.beginPath();    //开始路径
				context.moveTo(325,300+i);   //设置原点
				context.lineTo(650,300+i);      //设置终点
				context.closePath();      //关闭路径
				context.stroke();
			}
		};
	})
})