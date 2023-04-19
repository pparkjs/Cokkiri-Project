/**
 * 
 */


 function pboardListServer(mr){
	type = $('.pb_type option:selected').val().trim();
	text = $('.pb_search').val().trim();
	
  	$.ajax({
		url : `${mypath}/PboardList.do`, 
		type : 'post',
		data : {"more" : mr,
				"pb_type" : type,
				"pb_search" : text
				},
		
		success : function(res){
			//console.log(res.datas);
			feed = ""; 
			
			$.each(res.datas, function(i, v){
							
			 feed += ` <div class="feedbox">
			 				<div class="f_img">
								<img class="feed_img" src="${mypath}/images/화면 캡처 2023-04-09 233600.png">
							</div>	
							<div class="feed_main">
								<div class="innerbox">
									<div class="top">
										<img class="profile" src="${mypath}/images/기본 사용자프로필.svg">
										<p class="writer" id="${v.mem_id}">${v.mem_id}</p>
										<p class="date">${v.pboard_cdate}</p>
									</div>
									<div class="pb_middle">
										<a href="${mypath}/PboardList.do?pboardId=${v.pboard_id}">${v.pboard_title}</a>				
									</div>
							    </div>
								<div class="pb_bottom">
									<div class="hit">
										<img src="${mypath}/images/조회수.svg">
										<p>${v.pboard_hit}</p>
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
							</div>					 
						</div>`
   				 })
   				 
			$('.pboard').append(feed);
		},
		
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		
		dataType : 'json'
		
	}) 
	 
 }