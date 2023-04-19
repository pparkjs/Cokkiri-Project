/**
 * 
 */

 //수정 날짜 표시
function elapsedTimeModify(date) {
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
        return `${betweenTime}${value.name} 전 (수정됨)`;
      }
    }
    return '방금 전 (수정됨)';
}

//조회수 좋아요 싫어요 신고 가져오는 함수
function viewState(){
	$.ajax({
		url : `${mypath}/PboardViewState.do`,
		type : 'get',
		data : {"memId" : memId,
		        "boardId" : boardId},
		success : function(res){
			 $('#htext').text(res.pboard_hit)
			 $('#lktext').text(res.pbstate_like)
			 $('#untext').text(res.pbstate_unlike)
			if(res.me_like == 1){ // 내가 누른 좋아요		
				$('#mLike').attr('src', mypath+'/images/좋아요-체크.png')
			}
			if(res.me_unlike == 1){ // 내가 누른 싫어요
				$('#mUnlike').attr('src', mypath+'/images/싫어요-체크함.png')
			}
			if(res.me_notify == 1){
				$('#mNotify').attr('src', mypath+'/images/신고함.png' );
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
}

 // 해당 게시물 보인 부분의 좋아요 싫어요 처리
function viewLikeOrUnlikeClick(){

	// 좋아요 버튼클릭
	$('#mLike').on('click', function(){
		const like = $(this);
		$.ajax({
			url:`${mypath}/PboardLike.do`,
			type : 'get',
			data : {"likeCnt" : "1",
			        "boardId" : boardId,
			        "memId" : memId},
			success : function(res){
					if(res.flag == "first"){
					like.attr('src', mypath+'/images/좋아요-체크.png')
					
				    let	txt = parseInt(like.next().text());
					like.next().text(txt+1);
				}else if(res.flag == "cancle"){
					like.attr('src', mypath+'/images/좋아요-체크안함.png')
					
					let	txt = parseInt(like.next().text());
					like.next().text(txt-1);
				}else if(res.flag == "change"){
					like.attr('src', mypath+'/images/좋아요-체크.png')
					like.parents('.mem_btns').find('#mUnlike').attr('src', mypath+'/images/싫어요-체크안함.png')
					
					//좋아요 + 1
					let	txt = parseInt(like.next().text());
					like.next().text(txt+1);
					
					//싫어요 -1
					let disTxt = parseInt(like.parents('.mem_btns').find('#untext').text());
					like.parents('.mem_btns').find('#untext').text(disTxt-1);
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	//싫어요 버튼 클릭
	$('#mUnlike').on('click', function(){
		const disLike = $(this);
		$.ajax({
			url:`${mypath}/PboardLike.do`,
			type : 'post',
			data : {"disLikeCnt" : "1",
			        "boardId" : boardId,
			        "memId" : memId},
			success : function(res){
					if(res.flag == "first"){
					disLike.attr('src', mypath+'/images/싫어요-체크함.png')
					
					let	txt = parseInt(disLike.next().text());
					disLike.next().text(txt+1);
				}else if(res.flag == "cancle"){
					disLike.attr('src', mypath+'/images/싫어요-체크안함.png')
					
					let	txt = parseInt(disLike.next().text());
					disLike.next().text(txt-1);
				}else if(res.flag == "change"){
					disLike.attr('src', mypath+'/images/싫어요-체크함.png')
					disLike.parents('.mem_btns').find('#mLike').attr('src', mypath+'/images/좋아요-체크안함.png')
					
					//싫어요 + 1
					let	txt = parseInt(disLike.next().text());
					disLike.next().text(txt+1);
					
					//좋아요 -1
					let disTxt = parseInt(disLike.parents('.mem_btns').find('#lktext').text());
					disLike.parents('.mem_btns').find('#lktext').text(disTxt-1)
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
}
	
function pboardNotify(){
	
	$('#mNotify').on('click', function(){
		const thisNot = $(this);
		$.ajax({
			url : `${mypath}/PboardNotify.do`,
			type : 'get',
			data : {"boardId" : boardId,
			        "memId" : memId},
			 success : function(res){
				if(confirm("부적절한 게시글을 신고 하시겠습니까?")){
					if(res.flag == "ok"){
						$('#mNotify').attr('src', mypath+'/images/신고함.png' )
					}
				}
			 },
			 error : function(xhr){
			 },
			 dataType : 'json'
		})
		
	})
	
}
	