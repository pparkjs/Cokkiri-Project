<%@page import="vo.TcommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="../js/tcomment.js"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';
<%-- <% String id = (String)session.getAttribute("memid"); %>	 --%>

	$(function() {
		// 댓글 목록 불러오기
		$.tcommentListServer();

		// 댓글 작성
		$('#btn').on('click', function() {
			 tcontent = $('#tInsert textarea').val();

			 // tcontent가 null이 아닐 때만 서버에 댓글 작성 요청을 보냄
			 if (tcontent !== null) {
			    $.tcommentWriteServer();
			 } else {
			    console.error("댓글 내용이 없습니다.");
			 }
		})
		
		// 댓글 등록 수정 삭제
		$(document).on('click', '.action', function(res) {
			var vacation = $(this).attr('name');
			 tidx = $(this).attr('idx');

			if (vacation == "t_insert") {
				
				 $('.re-tInsert').hide();
				// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
				
<%--         		<%= id %>  --%>
       			 tcommentForm = $('<div>').append($('<form>').attr('id','retInsert').addClass('re-tInsert').append(
       				    $('<div>').append(
       				        $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '40px').attr('height', '40px').after('&nbsp;'),
        				    $('<span>').attr('id', 'writer').after('&nbsp;&nbsp;'),
       				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea'),
       				        $('<input>').attr('type', 'button').attr('id', 'rt_insert').attr('name', 'rt_insert').attr('idx', tidx).addClass('action').val('답글달기')
        				   
       				    )
       				)// form 끝
       			);
       		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
       		        	$(this).after(tcommentForm);
       		        
			}else if (vacation == "rt_insert"){
				//tid = $(this).attr('idx');
				 $('.re-tInsert').hide();
				 
				 reContent = $('#retInsert div textarea').val();
				 tcommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
 				 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
				 $.retcommentWriteServer();

			}else if (vacation == "t_delete"){
				 $.tcommentDeleteServer();
			}
			
		})
		
		
	})
</script>
<style type="text/css">
div{
	border: 1px solid black;
}

span{
	margin: 5px;
	padding: 5px;
}
#re-tcomment{
	margin-left: 50px;
}
#re-tcomment2{
	margin-left: 100px;
}
/* .a1{
	margin-left: 10px;
} */
.a2{
	margin-left: 40px;
}
.a3{
	margin-left: 70px;
}
.a4{
	margin-left: 100px;
}

#tarea{
	width: 500px;
}
#reArea{
	width: 500px;
	height:  40px;
}
</style>
</head>
<body>
<!-- 댓글 작성 폼 -->
<form id="tInsert">
 	<textarea rows="5" cols="10" id="tarea"></textarea>
 	<input type="button" value="댓글작성" id="btn" name = "tcmt">
</form><br><br> 

<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="tctLayer"></div>

<!-- 더보기 버튼 -->
<button type="button" class="moreList" id="moreList">더보기</button>
</body>
</html>