function setHash(a) {
	location.hash = a;
	//$.browser.msie ? $.locationHash(a) : location.hash = a;
}


$(window).hashchange(function() {
	doHash();
});
function doHash(a) {
	var h = location.hash;
	var h2 = h.split("#");
	if (h2.length>1){
	var action = h2[1].split("|")[0];
	}
	if (h == "") {
		//setHash("#top");
	} else if (action == "list") {
		listFn();
	} else if (h.indexOf("play_video") > -1) {
		videoFn();
	} else {
		defaultFn(a);
	}

}

function defaultFn(a) {
	$.ajax({
		url : '/' + a + '.js',
		type : 'GET',
		//data     : data,
		dataType : 'script'
	});
	setHash("#" + action);
}

function listFn() {
	var h = location.hash;
	var params = h.split("|");
	var size = params.length;
	var year,month,day,page;
	var has_year = has_month = has_day = has_page = false;
	//var year = month = day = page = false;
	for (p in params){
		if(p[0] == 'y'){
			year = p[0].split("y")[1];
			has_year = true;
		} else if (p[0] == "m"){
			month = p[0].split("m")[1];
			has_month = true;
		} else if (p[0] == "d"){
			day = p[0].split("d")[1];
			has_day = true;
		} else if (p[0] == "p"){
			page = p[0].split("p")[1];
			has_page = true;
		}
	}
	var url = "/list";
	var hash = "#list"
	if (has_year){ url += "/" + year; hash += "|y" + year;}
	if (has_month){ url += "/" + month; hash += "|m" + month;}
	if (has_day){ url += "/" + day; hash += "|d" + day;}
	if (has_page){ url += "/p" + page; hash += "|p" + page;}
	$.ajax({
		url : url + ".js",
		type : "GET",
		dataType : "script"
	});
	//setHash(hash);
}

function videoFn() {
	var h = location.hash;
	var id = h.split("video")[1];
	$.ajax({
		url : "/profile2/video/" + id + ".js",
		type : "GET",
		dataType : "script"
	});
	setHash("#play_video" + id);
}

//setHash("#my_tickets");
doHash(1);
