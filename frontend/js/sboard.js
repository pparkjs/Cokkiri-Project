/**
 * 
 */

 function sboardListServer(mr){
	vtype = $('.sb_type option:selected').val().trim();
	vtext = $('.sb_search').val().trim();

	$.ajax({
		url : `${mypath}/SboardList.do`,
		type : 'post',
		data :	{"more" : mr,
			     "sb_type" : vtype,
			     "sb_search" : vtext},
		success : function(res){
			
			addList = "";
			
			$.each(res.datas, function(i, v){
				// 게시판 생성되는 부분				
				addList += `<div class="sb">
								<div class="sb_top">
									<img src=${mypath}/images/기본프로필.png>
									<p class="writer" id="${v.mem_id}">익명</p>
									<p class="date">${v.sboard_cdate}</p>
								</div>
								<div class="sb_middle">
									<a href="${mypath}/SboardView.do?sboardId=${v.sboard_id}">${v.sboard_title}</a>				
								</div>
								<div class="sb_bottom">
									<div class="hit">
									    <input type="checkbox" class="like_ck" id="hit_img">
										<label for="like_img">
											<img src="${mypath}/images/조회수.svg">
										</label>
										<p>${v.sboard_hit}</p>
									</div>
									<div class="like">
									    <input type="checkbox" class="like_ck" id="like_img">
										<label for="like_img">
											<img src="${mypath}/images/좋아요-체크안함.svg">
										</label>
										<p>0</p>
									</div>
									<div class="unlike">
									    <input type="checkbox" class="like_ck" id="unlike_img">
										<label for="like_img">
											<img src="${mypath}/images/싫어요-체크안함.svg">
										</label>
										<p>0</p>
									</div>
								</div>
							</div>`
			})
			
			$('.sboard').append(addList);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
	 
 }