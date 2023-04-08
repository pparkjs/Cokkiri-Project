/**
 * 
 */

listRecieve = function(pagenum, category, sword,boardstate) {
	$.ajax({
		url: `${path}/tboardMain.do`,
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
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'><span class='state'>"+v["boardVO"]["tboard_state"]+"</span>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["add"] + "</p>")

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



