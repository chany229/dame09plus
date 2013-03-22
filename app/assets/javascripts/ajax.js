function setHash(a) {
	location.hash = a;
	//$.browser.msie ? $.locationHash(a) : location.hash = a;
}


$(window).hashchange(function() {
	doHash();
});
function doHash(a) {
	var h = location.hash;
	var action = h.split("|")[0];
	if (h == "") {
		//setHash("#top");
	} else if (action == "#list") {
		listFn();
	} else if (action == "#date") {
		dateFn();
	} else if (action == "#tag") {
		tagFn();
	} else if (action == "#keyword") {
		keywordFn();
	} else if (h.indexOf("play_video") > -1) {
		videoFn();
	} else {
		defaultFn(action);
	}

}

function defaultFn(a) {
	a = a.split("#")[1];
	$.ajax({
		url : '/' + a + '.js',
		type : 'GET',
		//data     : data,
		dataType : 'script'
	});
	setHash(a);
}

function listFn() {
	var h = location.hash;
	var params = h.split("|");
	if (params.length > 1) {
		var page = params[1].split("p")[1];
		$.ajax({
			url : "/list/p" + page + ".js",
			type : "GET",
			dataType : "script"
		});
		setHash("list|p" + page);
	} else {
		$.ajax({
			url : "/list.js",
			type : "GET",
			dataType : "script"
		});
		setHash("#list");
	}
}

function dateFn() {
	var h = location.hash;
	var params = h.split("|");
	var size = params.length;
	var year, month, day, page;
	var has_year = has_month = has_day = has_page = false;
	//var year = month = day = page = false;
	for (p in params) {
		if (params[p][0] == "y") {
			year = params[p].split("y")[1];
			has_year = true;
		} else if (params[p][0] == "m") {
			month = params[p].split("m")[1];
			has_month = true;
		} else if (params[p][0] == "d") {
			day = params[p].split("d")[1];
			has_day = true;
		} else if (params[p][0] == "p") {
			page = params[p].split("p")[1];
			has_page = true;
		}
	}
	var url = "/date";
	var hash = "#date"
	if (has_year) {
		url += "/" + year;
		hash += "|y" + year;
		if (has_month) {
			url += "/" + month;
			hash += "|m" + month;
			if (has_day) {
				url += "/" + day;
				hash += "|d" + day;
			}
		}
	}
	if (has_page) {
		url += "/p" + page;
		hash += "|p" + page;
	}
	if (!$("#entries")[0]) {
		$.ajax({
			url : "/list.js?donotsethash=1",
			type : "GET",
			dataType : "script"
		});
	}
	$.ajax({
		url : url + ".js",
		type : "GET",
		dataType : "script"
	});
	setHash(hash);
}

function tagFn() {
	var h = location.hash;
	var params = h.split("|")
	var tag = params[1];
	var url, hash;
	url = "/tag/" + tag + ".js";
	hash = "#tag|" + tag;
	if (params.length > 2) {
		page = params[2].split("p")[1];
		url = "/tag/" + tag + "/p" + page + ".js";
		hash = "#tag|" + tag + "|p" + page;
	}
	if (!$("#entries")[0]) {
		$.ajax({
			url : "list.js?donotsethash=1",
			type : "GET",
			dataType : "script"
		});
	}
	$.ajax({
		url : url,
		type : "GET",
		dataType : "script"
	});
	setHash(hash);
}
function keywordFn() {
	var h = location.hash;
	var params = h.split("|")
	var keyword = params[1];
	var url, hash;
	url = "/keyword/" + keyword + ".js";
	hash = "#keyword|" + keyword;
	if (params.length > 2) {
		page = params[2].split("p")[1];
		url = "/keyword/" + keyword + "/p" + page + ".js";
		hash = "#keyword|" + keyword + "|p" + page;
	}
	if (!$("#entries")[0]) {
		$.ajax({
			url : "list.js?donotsethash=1",
			type : "GET",
			dataType : "script"
		});
	}
	$.ajax({
		url : url,
		type : "GET",
		dataType : "script"
	});
	setHash(hash);
}
//setHash("#my_tickets");
doHash(1);
