<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/scommentStyle.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/scomment.js"></script>

<script type="text/javascript">

path = '<%=request.getContextPath()%>';
$(document).on('click', '#rs_modify', function(e){
	 scontent = $('#mInsert textarea').val();
	 $.scommentUpdateServer();
	 $("#pdiv").remove();
	 
}) 
	page=1;
	$(function() {
		// 댓글 목록 불러오기
		$.scommentListServer(page);
		// 댓글 작성
		$('#btn').on('click', function() {
			
			 scontent = $('#sInsert textarea').val();
			 
			 // tcontent가 null이 아닐 때만 서버에 댓글 작성 요청을 보냄
			 if (scontent !== null) {
			    $.scommentWriteServer();
			 } else {
			    console.error("댓글 내용이 없습니다.");
			 }
		})
		
		// 댓글 답글 수정 삭제
		$(document).on('click', '.action', function(res) {
			var vacation = $(this).attr('name'); // 수정인지 삭제인지 답글인지
			 sidx = $(this).attr('idx'); // 댓글 작성자의 아이디 받아옴
			 
			if (vacation == "s_insert") {
				
				 $('.formdiv').remove(); // 답글 달기 버튼 눌렀을 때 기존에 열려있던 답글폼 지우고 시작
				 $('.re-sInsert').parent("div").remove(); // 답글 버튼 누를 때 수정폼 열려있으면 수정폼 삭제
				// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
				
       			 scommentForm = $('<div>').attr("class","formdiv").append($('<form>').attr('id','retInsert').addClass('re-tInsert').append(
       				    $('<div>').attr('class', 'sret').append(
       				        $('<img>').attr('src', '<%=request.getContextPath()%>/images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '30px').attr('height', '30px').after('&nbsp;&nbsp;'),
        				    $('<span>').attr('class', memId).text('익명').after('&nbsp;&nbsp;'),
       				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').attr('class', 'tf'),
       				        $('<input>').attr('type', 'button').attr('id', 'rs_insert').attr('name', 'rs_insert').attr('idx', sidx).addClass('action').val('답글달기')

       				    )
       				)// form 끝
       			);
       		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
       		        	$(this).parent(".dw").append(scommentForm);
       	
			}else if (vacation == "rs_insert"){ // 답글 작성 후 답글달기 버튼 누르면 완료
				//sid = $(this).attr('idx');
				 
				 reContent = $('#retInsert div textarea').val();
				 scommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
 				 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
				 pcomment=$("#tctLayer").find("#"+scommentPid).attr("id")
 				 pcommentLevel=$("#tctLayer").find("#"+scommentPid).attr("class");
 				 parentcomment=$("#tctLayer").find("#"+scommentPid);
				 console.log(pcomment, pcommentLevel, scommentPid)
				 
				 $.retcommentWriteServer(); // 대댓글 등록 함수 호출
				 $(".formdiv").remove();

			}else if (vacation == "s_delete"){ // 댓글 삭제
				 $('.re-sInsert').parent("div").remove();
				$('.formdiv').remove(); // 답글 달기 버튼 눌렀을 때 기존에 열려있던 답글폼 지우고 시작
				 target = $(this).attr('idx'); // 삭제 버튼 누를시 해당 삭제 댓글의 작성자
				 target = $("#tctLayer").find("#"+target);
				  $.scommentDeleteServer(); 
				 
			}else if(vacation == "s_modify"){
				
				$(".action[name='s_modify']").next().remove();
 				tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();
			   /*  nickname = $(this).parent('div').closest('#${res.tcomment_id}').attr('nick'); */
			    // 댓글 입력 폼 생성
			    var modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'mInsert').addClass('re-sInsert').append(
			        $('<div>').attr('class','smod').append(
			            $('<img>').attr('src', '<%=request.getContextPath()%>/images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '30px').attr('height', '30px'),
			            $('<span>').attr('class', memId).text('익명'),
			            $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').val(tcon), // 수정할 댓글 내용을 textarea에 세팅
			            $('<input>').attr('type', 'button').attr('id', 'rs_modify').attr('name', 'rs_modify').attr('idx', sidx).addClass('action').val('수정하기') // 수정하기 버튼 생성
			        )
			    ));
			    
			    // 현재 클릭된 수정 버튼이 속한 댓글 div 다음에 댓글 입력 폼을 추가
			    $(this).after(modifyForm);
			    
			    sparent = $(this).parent().find('.content');

			    smodicont = $('#mInsert textarea').val(sparent.text());
			    
					smo = $(modifyForm).parent();
					
					// 수정하기 버튼을 클릭해서 수정완료 후 수정하기 버튼을 클릭했을때
				 
				// 더보기 버튼 클릭시
			}else if(vacation == "moreList"){
					page+=1;
					$.scommentListServer(page);
			
				
			}
			
		})
		 
	})
	
</script>

</head>	
<body>
<!-- 댓글 작성 폼 -->
<form id="sInsert">
	<span>댓글</span>
 	<textarea rows="5" cols="10" id="sarea" placeholder="댓글을 입력해주세요." class="sf"></textarea>
 	<input type="button" value="댓글작성" id="btn" name = "scmt">
</form> 
<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="tctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>
</body>
</html>