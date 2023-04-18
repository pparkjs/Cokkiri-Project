/**
 * 
 */
  //흘러간 시간대별 날짜 계산하기
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
    


// 조회수 업데이트 하는 함수
function hitUpdateServer(){
	$(document).on('click','.sb_middle', function(){
		hit = hit + 1;
		boardId = $(this).find('a').attr('class'); // 클릭한 게시물의 번호
		
		$.ajax({
			url : `${mypath}/SboardHit.do`,
			type : 'get',
			data : {"boardId" : boardId},
			success : function(res){
				if(res.flag == "ok"){
					
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
		})
	})
}

// 게시물 전체 보인 부분의 좋아요 싫어요 처리
function likeOrUnlikeClick(){

	// 좋아요 버튼클릭
	$(document).on('click','.lk', function(){
		boardId = $(this).attr('id') // 클릭한 boardId 가져옴
		const like = $(this);
		$.ajax({
			url:`${mypath}/SboardLike.do`,
			type : 'get',
			data : {"likeCnt" : "1",
			        "boardId" : boardId,
			        "memId" : memId},
			success : function(res){
					if(res.flag == "first"){
					like.attr('src', mypath+'/images/좋아요-체크.png')
					
				    let	txt = parseInt(like.parents('.like').find('p').text());
					like.parents('.like').find('p').text(txt+1);
				}else if(res.flag == "cancle"){
					like.attr('src', mypath+'/images/좋아요-체크안함.png')
					
					let txt = parseInt(like.parents('.like').find('p').text());
					like.parents('.like').find('p').text(txt-1);
				}else if(res.flag == "change"){
					like.attr('src', mypath+'/images/좋아요-체크.png')
					like.parents('.sb_bottom').find('.uk').attr('src', mypath+'/images/싫어요-체크안함.png')
					
					//좋아요 + 1
					let txt = parseInt(like.parents('.like').find('p').text());
					like.parents('.like').find('p').text(txt+1);
					
					//싫어요 -1
					let disTxt = parseInt(like.parents('.sb_bottom').find('.unlike').find('p').text());
					like.parents('.sb_bottom').find('.unlike').find('p').text(disTxt-1);
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	//싫어요 버튼 클릭
	$(document).on('click','.uk', function(){
		const disLike = $(this);
		boardId = $(this).attr('id') // 클릭한 boardId 가져옴
		$.ajax({
			url:`${mypath}/SboardLike.do`,
			type : 'post',
			data : {"disLikeCnt" : "1",
			        "boardId" : boardId,
			        "memId" : memId},
			success : function(res){
					if(res.flag == "first"){
					disLike.attr('src', mypath+'/images/싫어요-체크함.png')
					
					let txt = parseInt(disLike.parents('.unlike').find('p').text());
					disLike.parents('.unlike').find('p').text(txt+1);
				}else if(res.flag == "cancle"){
					disLike.attr('src', mypath+'/images/싫어요-체크안함.png')
					
					let txt = parseInt(disLike.parents('.unlike').find('p').text());
					disLike.parents('.unlike').find('p').text(txt-1);
				}else if(res.flag == "change"){
					disLike.attr('src', mypath+'/images/싫어요-체크함.png')
					disLike.parents('.sb_bottom').find('.lk').attr('src', mypath+'/images/좋아요-체크안함.png')
					
					//싫어요 + 1
					let txt = parseInt(disLike.parents('.unlike').find('p').text());
					disLike.parents('.unlike').find('p').text(txt+1);
					
					//좋아요 -1
					let disTxt = parseInt(disLike.parents('.sb_bottom').find('.like').find('p').text());
					disLike.parents('.sb_bottom').find('.like').find('p').text(disTxt-1);
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
}

 //관리자가 신고체크 클릭시 신고받은 게시글 가져오기
function notifyCheckView(mr){
	vtype = $('.sb_type option:selected').val().trim();
	vtext = $('.sb_search').val().trim();
	$.ajax({
		url : `${mypath}/SboardList.do`,
		type : 'get',
		data :	{"more" : mr,
			     "sb_type" : vtype,
			     "sb_search" : vtext,
			     "region" : frontRegion},
		success : function(res){
			
			noList = "";
			
			$.each(res.datas, function(i, v){
				title = v.sboard_title.slice(0, 45);
				date = elapsedTime(v.sboard_cdate);
				// 게시판 생성되는 부분				
				noList += `<div class="sb">
								<div class="sb_top">
									<img src=${mypath}/images/기본프로필.png>
									<p class="writer" id="${v.mem_id}">익명</p>
									<p class="date">${date}</p>
								</div>
								<div class="sb_middle">
									<a class="${v.sboard_id}" href="${mypath}/SboardView.do?sboardId=${v.sboard_id}">${title}</a>				
								</div>
								<div class="sb_bottom">
									<div class="bottom_notify">
									    <input type="checkbox" class="no" id="notify_img">
										<label for="notify_img">`
				 noList +=					`<img class="uk" id="${v.sboard_id}" src="${mypath}/images/신고함.png">`
			  
				 noList +=						`</label>
										<p>${v.sum_notify}</p>
									</div>
								</div>
							</div>`
			})
			
			console.log(noList)
			$('.sboard').append(noList);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
 
 // 게시글 리스트 가져오기
 function sboardListServer(mr){
	vtype = $('.sb_type option:selected').val().trim();
	vtext = $('.sb_search').val().trim();

	$.ajax({
		url : `${mypath}/SboardList.do`,
		type : 'post',
		data :	{"more" : mr,
			     "sb_type" : vtype,
			     "sb_search" : vtext,
			     "region" : frontRegion},
			     
		success : function(res){
			
			addList = "";
			
			$.each(res.datas, function(i, v){
				title = v.sboard_title.slice(0, 45);
				date = elapsedTime(v.sboard_cdate);
				// 게시판 생성되는 부분				
				addList += `<div class="sb">
								<div class="sb_top">
									<img src=${mypath}/images/기본프로필.png>
									<p class="writer" id="${v.mem_id}">익명</p>
									<p class="date">${date}</p>
								</div>
								<div class="sb_middle">
									<a class="${v.sboard_id}" href="${mypath}/SboardView.do?sboardId=${v.sboard_id}">${title}</a>				
								</div>
								<div class="sb_bottom">
									<div class="hit">
										<img src="${mypath}/images/조회수.png">
										<p>${v.sboard_hit}</p>
									</div>
						 		  <div class="like">
									    <input type="checkbox" class="ck" id="like_img">
										<label for="like_img">`
			if(v.me_like == 1){ // 로그인한 내가 누른 like인 경우					
				 addList +=					`<img class="lk" id="${v.sboard_id}" src="${mypath}/images/좋아요-체크.png">`
			  }else{// 내가 누른게 아닌 경우
				 addList +=					`<img class="lk" id="${v.sboard_id}" src="${mypath}/images/좋아요-체크안함.png">`
			  }					
				 addList +=				`</label>
										<p>${v.sbstate_like}</p>
									</div>
									<div class="unlike">
									    <input type="checkbox" class="ck" id="unlike_img">
										<label for="unlike_img">`
			if(v.me_unlike == 1){ //로그인한 내가 누른 unlike인 경우							
				 addList +=					`<img class="uk" id="${v.sboard_id}" src="${mypath}/images/싫어요-체크함.png">`
			  }else{ //내가 누른게 아닌 경우
			     addList +=					`<img class="uk" id="${v.sboard_id}" src="${mypath}/images/싫어요-체크안함.png">`
			  }	 
			  
				 addList +=						`</label>
										<p>${v.sbstate_unlike}</p>
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