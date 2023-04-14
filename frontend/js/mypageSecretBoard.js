/**
 * 
 */
$(function() {
	more = 0;
	$('.moreBtn').on('click', function(){
		more = more + 1;
	})
		
	$('.boardBtn').css({
		'border' : 'none',
		'background' : 'rgb(56, 102, 233)',
		'color' : 'white',
		'font-weight' : '400'
		
		})
		
	$.ajax({
			url : '<%=request.getContextPath()%>/SboardList.do',
			type : 'post',
			data : {"more" : more},
			success : function(res) {
				// 게시판 생성
				boardList = "";
				boardList += ""
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	
	/* 내글 */
	$('.boardBtn').on('click', function() {
		$('.boardBtn').css({
							'border' : 'none',
							'background' : 'rgb(56, 102, 233)',
							'color' : 'white',
							'font-weight' : '400'
							})
		$('.commentBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.likeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.nulikeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
							
		
		
	})
	
	/* 댓글 */
	$('.commentBtn').on('click', function() {
		$('.commentBtn').css({
							'border' : 'none',
							'background' : 'rgb(56, 102, 233)',
							'color' : 'white',
							'font-weight' : '400'
							})
		$('.boardBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.likeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.nulikeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		
	})
	/* 좋아요 */
	$('.likeBtn').on('click', function() {
		$('.likeBtn').css({
							'border' : 'none',
							'background' : 'rgb(56, 102, 233)',
							'color' : 'white',
							'font-weight' : '400'
							})
		$('.commentBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.boardBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.nulikeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		
	})
	/* 싫어요 */
	$('.nulikeBtn').on('click', function() {
		$('.nulikeBtn').css({
							'border' : 'none',
							'background' : 'rgb(56, 102, 233)',
							'color' : 'white',
							'font-weight' : '400'
							})
		$('.commentBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.boardBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		$('.likeBtn').css({
							'background-color': 'white',
							'border': '1px solid rgb(229, 229, 234)',
							'color' : 'rgb(28,28,30)',
							'font-weight' : '400'
							})
		
	})
})