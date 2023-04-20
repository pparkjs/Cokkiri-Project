/**
 * 
 */

listRecieve = function(pagenum, category, sword,boardstate) {
	if(boardstate!=null){
		boardstate = boardstate.trim();
	}
	$.ajax({
		url: `${path}/tboardMain.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword ,"state":boardstate},
		dataType: "json",
		success: function(res) {
			$.each(res.list, function(i, v) {
				$div = $('<div class="ele" id="' + v["boardVO"]["tboard_id"] + '"></div>')

				img = v["fimgid"];
				if (typeof img == "undefined") {
					img = `${path}/images/default.PNG`;
				} else {
					img = `${path}/images/TboardImageView.do?imgno=${img}`;
				}
				
				vstate=v["boardVO"]["tboard_state"]
				if(v.boardVO.tboard_completedate!=null&&typeof v.boardVO.tboard_completedate!="undefined"&&v.boardVO.tboard_completedate!=""){
					vstate = "거래완료"
				}
				
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'><span class='state'>"+vstate+"</span>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["writer"]["mem_add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_hit"] + " · 찜 " + v["mylist"] + "</p>")

				$div.append($img).append($ptitle).append($pprice).append($padd).append($pview)

				$(".box").append($div);
			})


		},
		error: function(xhr) {
			alert("maindo 상태: " + xhr.status)
		}
	})
}


listRecieveFromOne = function(pagenum, category, sword,boardstate) {
	if(boardstate!=null){
		boardstate = boardstate.trim();
	}
	$.ajax({
		url: `${path}/tboardMain.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword ,"state":boardstate,"one":true},
		dataType: "json",
		success: function(res) {
			if(res.admin==1){
				checkbox=$("<input type='checkbox' id='notifycheck'>")
				span=$("<span id='checkspan'>신고</span>")
				$("#searchr").append(checkbox).append(span);
				ad='y';
			}else{
				ad='n';
			}
			$.each(res.list, function(i, v) {
				$div = $('<div class="ele" id="' + v["boardVO"]["tboard_id"] + '"></div>')

				img = v["fimgid"];
				if (typeof img == "undefined") {
					img = `${path}/images/default.PNG`;
				} else {
					img = `${path}/images/TboardImageView.do?imgno=${img}`;
				}
				
				vstate=v["boardVO"]["tboard_state"]
				if(v.boardVO.tboard_completedate!=null&&typeof v.boardVO.tboard_completedate!="undefined"&&v.boardVO.tboard_completedate!=""){
					vstate = "거래완료"
				}
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'><span class='state'>"+vstate+"</span>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["writer"]["mem_add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_hit"] + " · 찜 " + v["mylist"] + "</p>")

				$div.append($img).append($ptitle).append($pprice).append($padd).append($pview)

				$(".box").append($div);
			})


		},
		error: function(xhr) {
			alert("maindo 상태: " + xhr.status)
		}
	})
}



notifyListFromOne  = function (page,category,sword,boardstate){
	
	if(boardstate!=null){
		boardstate = boardstate.trim();
	}
	$.ajax({
		url: `${path}/tboardnotify.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword ,"state":boardstate,"one":true},
		dataType: "json",
		success: function(res) {
			$.each(res, function(i, v) {
				$div = $('<div class="ele" id="' + v["boardVO"]["tboard_id"] + '"></div>')

				img = v["fimgid"];
				if (typeof img == "undefined") {
					img = `${path}/images/default.PNG`;
				} else {
					img = `${path}/images/TboardImageView.do?imgno=${img}`;
				}
				vstate=v["boardVO"]["tboard_state"]
				if(v.boardVO.tboard_completedate!=null&&typeof v.boardVO.tboard_completedate!="undefined"&&v.boardVO.tboard_completedate!=""){
					vstate = "거래완료"
				}
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'><span class='state'>"+vstate+"</span>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["writer"]["mem_add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_hit"] + " · 찜 " + v["mylist"] +" ·<img class='notiimg' src='../images/tnotifyed.png'>"+v["notifynum"]+"</p>")

				$div.append($img).append($ptitle).append($pprice).append($padd).append($pview)

				$(".box").append($div);
			})


		},
		error: function(xhr) {
			alert("maindo 상태: " + xhr.status)
		}
	})
	
}


notifyListRecieve = function(pagenum, category, sword,boardstate) {
	if(boardstate!=null){
		boardstate = boardstate.trim();
	}
	$.ajax({
		url: `${path}/tboardNotify.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword ,"state":boardstate},
		dataType: "json",
		success: function(res) {
			$.each(res, function(i, v) {
				$div = $('<div class="ele" id="' + v["boardVO"]["tboard_id"] + '"></div>')

				img = v["fimgid"];
				if (typeof img == "undefined") {
					img = `${path}/images/default.PNG`;
				} else {
					img = `${path}/images/TboardImageView.do?imgno=${img}`;
				}
				vstate=v["boardVO"]["tboard_state"]
				if(v.boardVO.tboard_completedate!=null&&typeof v.boardVO.tboard_completedate!="undefined"&&v.boardVO.tboard_completedate!=""){
					vstate = "거래완료"
				}
				
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'><span class='state'>"+vstate+"</span>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["writer"]["mem_add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_hit"] + " · 찜 " + v["mylist"] +" ·<img class='notiimg' src='../images/tnotifyed.png'>"+v["notifynum"]+"</p>")

				$div.append($img).append($ptitle).append($pprice).append($padd).append($pview)

				$(".box").append($div);
			})


		},
		error: function(xhr) {
			alert("maindo 상태: " + xhr.status)
		}
	})
}




categoryRecieve = function(category_id) {

	$.ajax({
		url: `${path}/category.do`,
		type: "get",
		dataType: "json",
		success: function(res) {

			code = "";

			$.each(res, function(i, v) {
				if (category_id == v["category_id"]) {
					code += "<option id=" + v["category_id"] + " selected>" + v["category_name"]
				} else {
					code += "<option id=" + v["category_id"] + ">" + v["category_name"]
				}


			})
			$("#category").append(code);
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})

}



