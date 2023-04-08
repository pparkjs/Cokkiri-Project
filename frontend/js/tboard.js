/**
 * 
 */

listRecieve = function(pagenum, category, sword) {
	$.ajax({
		url: `${path}/tboardMain.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword },
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

				$pprice = $("<p class='nomargin price'>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_hit"] + " 찜 " + v["mylist"] + "</p>")

				$div.append($img).append($ptitle).append($pprice).append($padd).append($pview)

				$(".box").append($div);
			})


		},
		error: function(xhr) {
			alert("maindo 상태: " + xhr.status)
		}
	})
}



slideImage = function() {
	slideList = document.querySelector('.slide_list');  // Slide parent dom
	slideContents = document.querySelectorAll('.slide_content');  // each slide dom
	slideBtnNext = document.querySelector('.slide_btn_next'); // next button
	slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
	pagination = document.querySelector('.slide_pagination');
	slideLen = slideContents.length;  // slide length
	slideWidth = 730; // slide width
	slideSpeed = 300; // slide speed

	if (slideLen == 1) {
		$(".slide_btn_next").attr("disabled", true);
	}

	slideList.style.width = slideWidth * (slideLen) + "px";

	let curIndex = 0; // current slide index (except copied slide)

	let pageChild = '';
	for (var i = 0; i < slideLen; i++) {
		pageChild += '<li class="dot';
		pageChild += (i === curIndex) ? ' dot_active' : '';
		pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
	}
	pagination.innerHTML = pageChild;
	const pageDots = document.querySelectorAll('.dot'); // each dot from pagination
	let curSlide = slideContents[curIndex];
	/** Next Button Event */
	slideBtnNext.addEventListener('click', function() {
		if (curIndex <= slideLen - 1) {
			slideList.style.transition = slideSpeed + "ms";
			slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
		}
		if (curIndex + 1 > 0) {
			$(".slide_btn_prev").attr("disabled", false);
		}
		if (curIndex + 1 == slideLen - 1) {
			$(".slide_btn_next").attr("disabled", true);
		}
		curSlide.classList.remove('slide_active');
		pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
		curSlide = slideContents[++curIndex];
		curSlide.classList.add('slide_active');
		pageDots[curIndex].classList.add('dot_active');
	});

	slideBtnPrev.addEventListener('click', function() {
		if (curIndex >= 0) {
			slideList.style.transition = slideSpeed + "ms";
			slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex - 1)) + "px, 0px, 0px)";
		}
		if (curIndex - 1 < slideLen) {
			$(".slide_btn_next").attr("disabled", false);
		}
		if (curIndex - 1 == 0) {
			$(".slide_btn_prev").attr("disabled", true);
		}
		curSlide.classList.remove('slide_active');
		pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
		curSlide = slideContents[--curIndex];
		curSlide.classList.add('slide_active');
		pageDots[curIndex].classList.add('dot_active');
	});
}







recommendlistRecieve = function(pagenum, category, sword) {


	$.ajax({
		url: `${path}/tboardMain.do`,
		type: "post",
		data: { "page": pagenum, "category": category, "sword": sword },
		dataType: "json",
		success: function(res) {
			$.each(res, function(i, v) {
				$div = $('<div class="ele" id="' + v["boardVO"]["tboard_id"] + '"></div>')

				img = v["fImg"];
				if (typeof img == "undefined") {
					img = "defaultimg/default.PNG"
				} else {
					img = "imgresource/" + img;
				}
				$img = $("<img class='img' src='" + img + "'>")

				$ptitle = $("<p class='nomargin title'>" + v["boardVO"]["tboard_title"] + "</p>")

				$pprice = $("<p class='nomargin price'>" + v["boardVO"]["tboard_price"] + "원</p>")

				$padd = $("<p class='nomargin add'>" + v["add"] + "</p>")

				$pview = $("<p class='nomargin viewcnt'>조회수 " + v["boardVO"]["tboard_viewcnt"] + " 찜 " + v["mylist"] + "</p>")

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




function getImageFiles(e) {
	const files = e.currentTarget.files;
	const imagePreview = document.querySelector('.image-preview');
	const docFrag = new DocumentFragment();
	const uploadbtn = document.querySelector('#upload');

	if ([...files].length >= 7 || uploadFiles.length + [...files].length >= 7) {
		alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
		return;
	}


	// 파일 타입 검사
	[...files].forEach(file => {
		if (!file.type.match("image/.*") || file.type.match("image/svg.*")) {
			alert('이미지 파일만 업로드가 가능합니다.');
			return
		}

		// 파일 갯수 검사
		if ([...files].length < 7 && uploadFiles.length + 1 < 7) {
			uploadFiles.push(file);
			const reader = new FileReader();
			reader.onload = (e) => {
				console.log(e.target)
				const preview = createElement(e, file);
				preview.classList.add("animation-init");
				imagePreview.insertBefore(preview, uploadbtn)
				setTimeout(function() {
					preview.classList.add("animation-fade");
				}, 30);


			};
			reader.readAsDataURL(file);
		}
	});
}

function createElement(e, file) {
	const li = document.createElement('li');
	const img = document.createElement('img');
	img.setAttribute('src', e.target.result);
	img.setAttribute('data-file', file.name);
	img.setAttribute('class', "previewimg")
	li.appendChild(img);
	$(li).on("click", function(e) { $.deleteFile(e); })
	return li;
}
function createElement2(e, file) {
	const li = document.createElement('li');
	const img = document.createElement('img');
	img.setAttribute('src', e);
	img.setAttribute('data-file', file.name);
	img.setAttribute('class', "previewimg")
	li.appendChild(img);
	$(li).on("click", function(e) { $.deleteFile(e); })
	return li;
}

$.deleteFile = function(e) {

	savename = $(e.currentTarget).find("img").attr("data-file");

	isdel = confirm("파일을 지우시겠습니까?")
	if (isdel) {
		$.each(uploadFiles, function(i, v) {
			if (savename == v.name) {
				uploadFiles.splice(i, 1);
				$(e.currentTarget).remove();
				return false;
			}
		})
	} else {
		return;
	}

}



function modifyImageLoad(timg_id, save_name, callback) {
	$.ajax({
		url: `${path}/ModifyImage.do`,
		type: "GET",
		data: { timg_id: timg_id },

		success: function(res) {
			var file = new File([res], save_name);
			uploadFiles.push(file);
			var url = window.URL.createObjectURL(res);
			var preview = createElement2(url, file);
			preview.classList.add("animation-init");
			imagePreview.insertBefore(preview, uploadbtn);
			setTimeout(function() {
				preview.classList.add("animation-fade");
				if (typeof callback === 'function') {
					callback();
				}
			}, 30);
		},
		error: function(xhr) {
			alert("상태: " + xhr.status);
		},
		xhrFields: {
			responseType: "blob"
		}
	});
}