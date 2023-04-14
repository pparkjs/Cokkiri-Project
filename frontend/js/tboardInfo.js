/**
 * 
 */

btnCreate = function(mem_id, tboard_id) {
	$.ajax({

		url: `${path}/tboardBtnInfo.do`,
		type: "get",
		data: { "mem_id": mem_id, "tboard_id": tboard_id },
		dataType: "json",
		success: function(res) {
			if (res.res == "ok") {
				modifyBtn = $("<button type='button' class='mr' id='mbtn' >글수정</button>");
				removeBtn = $("<button type='button' class='mr' id='rbtn' >글삭제</button>");
				$("#notifyAndMylist").append(modifyBtn).append(removeBtn);
			} else {
				if (res.notify == 0) {
					notifyBtn = $("<button type='button' class='nm' id='nbtn' ></button>");
				}
				if (res.notify == 1) {
					notifyBtn = $("<button type='button' class='nm' id='ncbtn' ></button>");
				}
				if (res.mylist == 0) {
					mylistBtn = $("<button type='button' class='nm' id='mlbtn' ></button>");
				}
				if (res.mylist == 1) {
					mylistBtn = $("<button type='button' class='nm' id='mlcbtn' ></button>");
				}

				$("#notifyAndMylist").append(notifyBtn).append(mylistBtn);
			}

		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
}


function elapsedTime(date) {
	  const start = new Date(date);
	  const end = new Date();

	  const diff = (end - start) / 1000;
	 
	  const times = [
	    { "name": '년', "milliSeconds": 60 * 60 * 24 * 365 },
	    { "name": '개월',"milliSeconds": 60 * 60 * 24 * 30 },
	    { "name": '일', "milliSeconds": 60 * 60 * 24 },
	    { "name": '시간',"milliSeconds": 60 * 60 },
	    { "name": '분', "milliSeconds": 60 },
	  ];
	
	  for (const value of times) {
	    const betweenTime = Math.floor(diff / value.milliSeconds);
	    if (betweenTime > 0) {
	      return `${betweenTime}${value.name} 전`;
	    }
	  }
	  return '방금 전';
	}




btnChage = function(tboard_id) {
	$(document).on("click", ".nm", function() {
		btn = $(this).attr("id");
		$.ajax({

			url: `${path}/tboardBtnChange.do`,
			type: "post",
			data: { "btn": btn, "tboard_id": tboard_id },
			dataType: "json",
			success: function(res) {
				if (res.res == 0) {
					alert("작업에 실패했습니다.")
					return;
				}

				if (res.btn == "nbtn") {
					$("#nbtn").attr("id", "ncbtn");
				}
				if (res.btn == "ncbtn") {
					$("#ncbtn").attr("id", "nbtn");
				}
				if (res.btn == "mlbtn") {
					$("#mlbtn").attr("id", "mlcbtn");
				}
				if (res.btn == "mlcbtn") {
					$("#mlcbtn").attr("id", "mlbtn");
				}

			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		})
	})
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
	slideWidth = 750; // slide width
	slideSpeed = 300; // slide speed

	if (slideLen == 1) {
		$(".slide_btn_next").attr("disabled", true);
	}

	slideList.style.width = slideWidth * (slideLen) + "px";

	curIndex = 0; // current slide index (except copied slide)

	pageChild = '';
	for (var i = 0; i < slideLen; i++) {
		pageChild += '<li class="dot';
		pageChild += (i === curIndex) ? ' dot_active' : '';
		pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
	}
	pagination.innerHTML = pageChild;
	pageDots = document.querySelectorAll('.dot'); // each dot from pagination
	curSlide = slideContents[curIndex];
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
		if (curIndex - 1 > 0) {
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
	pagedotActiv();
}


function pagedotActiv() {
	let curDot;
	Array.prototype.forEach.call(pageDots, function(dot, i) {
		dot.addEventListener('click', function(e) {
			e.preventDefault();
			curDot = document.querySelector('.dot_active');
			curDot.classList.remove('dot_active');

			curDot = this;
			this.classList.add('dot_active');

			curSlide.classList.remove('slide_active');
			curIndex = Number(this.getAttribute('data-index'));

			console.log(curIndex)
			console.log(slideLen)


			if (curIndex == slideLen - 1) {
				$(".slide_btn_next").attr("disabled", true);
				$(".slide_btn_prev").attr("disabled", false);
			} else if (curIndex == 0) {
				$(".slide_btn_prev").attr("disabled", true);
				$(".slide_btn_next").attr("disabled", false);
			} else if (0 < curIndex < slideLen - 1) {
				$(".slide_btn_prev").attr("disabled", false);
				$(".slide_btn_next").attr("disabled", false);
			}

			curSlide = slideContents[curIndex];
			curSlide.classList.add('slide_active');
			slideList.style.transition = slideSpeed + "ms";
			slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex)) + "px, 0px, 0px)";
		});
	});
}


$(document).on("click","#mbtn",function(){
		location.href=`${path}/tboardModifyForm.do?tboard_id=${tboard_id}`
	})
	$(document).on("click","#rbtn",function(){
		$.ajax({

			url : `${path}/tboardRemove.do`,
			type : "post",
			data : {"mem_id":mem_id,"tboard_id":tboard_id},
			dataType : "json",
			success : function(res){
				if(res.flag==0){
					alert("게시글 삭제에 실패했습니다.")	
				}else{
					alert("게시글이 삭제되었습니다.")
				}
				location.href=`${path}/tboardMain.do`
			},
			error : function(xhr){
				alert("상태: "+xhr.status)
			}
		})
	})