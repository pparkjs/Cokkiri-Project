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
	page=1;
	$(function() {
		// 댓글 목록 불러오기
		$.tcommentListServer(page);

		// 댓글 작성
		$('#btn').on('click', function() {
 			secret = $('#is_private').prop('checked');
			
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
				
				 $('.re-tInsert').parent("div").remove();
				// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
				
<%--         		<%= id %>  --%>
       			 tcommentForm = $('<div>').attr("class","formdiv").append($('<form>').attr('id','retInsert').addClass('re-tInsert').append(
       				    $('<div>').append(
       				        $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '40px').attr('height', '40px').after('&nbsp;'),
        				    $('<span>').attr('id', 'writer').after('&nbsp;&nbsp;'),
       				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea'),
       				        $('<input>').attr('type', 'button').attr('id', 'rt_insert').attr('name', 'rt_insert').attr('idx', tidx).addClass('action').val('답글달기')
        				   
       				    )
       				)// form 끝
       			);
       		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
       		        	$(this).next().next().after(tcommentForm);
       	
       		        
			}else if (vacation == "rt_insert"){
				//tid = $(this).attr('idx');
				 
				 reContent = $('#retInsert div textarea').val();
				 tcommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
 				 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
				 pcomment=$("#tctLayer").find("#"+tcommentPid).attr("id")
 				 pcommentLevel=$("#tctLayer").find("#"+tcommentPid).attr("class");
 				 parentcomment=$("#tctLayer").find("#"+tcommentPid);
				 console.log(pcomment, pcommentLevel, tcommentPid)
				 
				 $.retcommentWriteServer();
				 $(".formdiv").remove();

			}else if (vacation == "t_delete"){
				 target = $(this).attr('idx');
				 target = $("#tctLayer").find("#"+target);
				  $.tcommentDeleteServer(); 
				 
			}else if(vacation == "t_modify"){
 				tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();
// 				var tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();

			    // 댓글 입력 폼 생성
			     modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'mInsert').addClass('re-tInsert').append(
			        $('<div>').append(
			            $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').after('&nbsp;'),
			            $('<span>').attr('id', 'writer').after('&nbsp;&nbsp;'),
			            $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').val(tcon), // 수정할 댓글 내용을 textarea에 세팅
			            $('<input>').attr('type', 'button').attr('id', 'rt_modify').attr('name', 'rt_modify').attr('idx', tidx).addClass('action').val('수정하기') // 수정하기 버튼 생성
			        )
			    ));
			    
			    // 현재 클릭된 수정 버튼이 속한 댓글 div 다음에 댓글 입력 폼을 추가
			    $(this).after(modifyForm);
			    
			    tparent = $(this).parent().find('#content');

			    tmodicont = $('#mInsert textarea').val(tparent.text());
			    
					tmo = $(modifyForm).parent();
					
					// 수정하기 버튼을 클릭해서 수정완료 후 수정하기 버튼을 클릭했을때
				 $(document).on('click', '#rt_modify', function(res){
					 tcontent = $('#mInsert textarea').val();
					 $.tcommentUpdateServer();
					 modifyForm.hide();
				})  
				// 더보기 버튼 클릭시
			}else if(vacation == "moreList"){
					page+=1;
					$.tcommentListServer(page);
			
				
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

.a1{
	margin: 10px;
}
.a2{
	margin-left: 40px;
	margin-right : 10px;
	margin-bottom: 10px; 
    padding: 10px; 
}
.a3{
	margin-left: 70px;
}
.a4{
	margin-left: 100px;
}
.action {
  color: #333; 
  margin-right: 10px; 
  padding: 5px 10px;
  background-color: lightgray; 
  color: navy;
}
form #tarea {
  width: 100%; 
  height: 100px; 
  resize: none; 
  padding: 10px; 
  border: 1px solid #ccc; 
}
form #btn {
  display: block; 
  margin-top: 10px; 
  margin-bottom : 10px;
  padding: 5px 10px; 
  background-color: lightgray; 
  color: navy; 
  border: none; 
  cursor: pointer; /* 커서를 포인터로 변경하여 버튼을 클릭 가능하도록 설정 */
}
#reArea{
	width: 500px;
	height:  40px;
}
img {
  width: 40px; 
  height: 40px; 
  margin-right: 5px; 
}
  #reArea {
    margin-top: 5px;
    width: 100%;
    resize: none;
    border: 1px solid #ccc;
    padding: 5px;
  }

  #rt_insert {
    margin-top: 5px;
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
  }
tctLayer {
  margin-top: 10px;
  padding: 10px;
  background-color: #f5f5f5;
}

/* Style for the comment div */
.a${level} {
  margin-bottom: 10px;
  padding: 5px;
  background-color: #fff;
  display: flex;
  align-items: center;
}

/* Style for the profile image */
.a${level} img {
  width: 40px;
  height: 40px;
  margin-right: 5px;
}

/* Style for the writer span */
#writer {
  font-weight: bold;
}

/* Style for the content span */
#content {
  flex-grow: 1;
}

/* Style for the cdate span */
#cdate {
  margin-left: 10px;
  font-size: 12px;
  color: #999;
}

/* Style for the action buttons */
.action {
  margin-left: 10px;
  color: #fff;
  border: none;
  padding: 5px 10px;
  cursor: pointer;
} 

#moreList {
  display: block; /* 블록 요소로 변경 */
  margin: 0 auto; /* 가로 중앙 정렬 */
  text-align: center; /* 텍스트 가운데 정렬 */
}
</style>
</head>
<body>
<!-- 댓글 작성 폼 -->
<form id="tInsert">
 	<textarea rows="5" cols="10" id="tarea"></textarea>
 	<input type="checkbox" id="is_private" name="is_private">
        <label for="is_private">비밀 댓글</label>
 	<input type="button" value="댓글작성" id="btn" name = "tcmt">
</form><br><br> 

<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="tctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>
</body>
</html>