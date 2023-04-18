/**
 * 
 */
function soldout(){
	// saleStatus 버튼 클릭(나눔, 판매, 구매, 거래완료)
	$(document).on("click", ".saleStatus", function() {
		var status = $(this).val();
		var tboardId = $(this).attr('name');
		var thisBtn = $(this);
		if (status == "거래완료") {
			$.ajax({
				url : `${mypath}/tboardCDateUpdateSysdate.do`,
				type : 'post',
				data : { "tboard_id" : tboardId },
				success : function(res){
					console.log(res);
					if(res.result == "ok"){
						thisBtn.val(res.tboardState);
					}
				},
				error : function(xhr){
					alert(xhr.status);
				},
				dataType : 'json'
			})
			
		} else if (status == "거래취소"){
			$.ajax({
				url : `${mypath}/tboardCDateUpdateNull.do`,
				type : 'post',
				data : { "tboard_id" : tboardId },
				success : function(res){
					if(res.result == "ok"){
						thisBtn.val(res.tboardState);
						console.log()
					}
				},
				error : function(xhr){
					alert(xhr.status);
				},
				dataType : 'json'
			})
			
		} else {
			$.ajax({
				url : `${mypath}/tboardCDateUpdateSysdate.do`,
				type : 'post',
				data : { "tboard_id" : tboardId },
				success : function(res){
					console.log(res);
					if(res.result == "ok"){
						thisBtn.val("거래취소");
					}
				},
				error : function(xhr){
					alert(xhr.status);
				},
				dataType : 'json'
			})
			
		}
	
	
	})
}
function mypageTboardListServer(more){
	$('.mypageTboard').empty();
	$.ajax({
		url : `${mypath}/mypageTboardList.do`,
		type : 'post',
		data : { "more" : more },
		success : function(res){
			console.log(res);
			count = 1;
			addList = "";
			$.each(res.datas, function(i, v){
				title = v.tboard_title.slice(0, 45);
				if(count != 1){
					addList+= `<hr class="hrborder">`
				}
				count = count + 1;
				// 게시판 생성되는 부분
				addList += `<div class="td_list">
								<div class="tb_img">
									<img src="${mypath}/images/TboardImageView.do?imgno=${v.tboard_imgNo}">
								</div>
								<div class="tb_content">
									<div class="title ele" id="${v.tboard_id}">
										<p>${v.tboard_title}</p>
									</div>
									<div class="add">
										<p>${v.mem_add}</p>
									</div>
									<div class="status">`
				if(v.tboard_completedate == null || v.tboard_completedate == ""){
							addList += `<input type="button" class="saleStatus" name="${v.tboard_id}" value = "${v.tboard_state}"></button>`
				} else {
							addList += `<input type="button" class="saleStatus" name="${v.tboard_id}" value = "거래완료"></button>`
				}
							addList += `<div class="price">${v.tboard_price} 원</div>
									</div>
									<div class="tb_content_bottom">
										<div class="hit">
											<img src="${mypath}/images/조회수.png">
											<p>${v.tboard_hit}</p>
										</div>
										<div class="wish">
											<img class="lk" id="${v.sboard_id}"
											src="${mypath}/images/찜-체크함.png">
											<p>${v.wishcnt}</p>
										</div>
									</div>
								</div>
							</div>`
			})
			$('.mypageTboard').append(addList);
		},
		error : function(xhr){
				alert(xhr.status);
		},
		dataType : 'json'
	})
}