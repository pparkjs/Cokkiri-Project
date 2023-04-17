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
//  			secret = $('#is_private').prop('checked');
			
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
       				        $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '30px').attr('height', '30px').after('&nbsp;&nbsp;'),
        				    $('<span>').attr('id', 'writer').text('writer').after('&nbsp;&nbsp;'),
       				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').attr('class', 'tf'),
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
				$(".action[name='t_modify']").next().remove();
 				tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();
			   /*  nickname = $(this).parent('div').closest('#${res.tcomment_id}').attr('nick'); */
			    // 댓글 입력 폼 생성
			    var modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'mInsert').addClass('re-tInsert').append(
			        $('<div>').append(
			            $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '30px').attr('height', '30px').after('&nbsp;&nbsp;'),
			            $('<span>').attr('id', 'writer').text('nickname').after('&nbsp;&nbsp;'),
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
					 //$(".div").remove();
					 
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
#tcLayer{
	display: flex;
  	flex-wrap: nowrap; 
  	overflow-x: auto; 
}
/* 댓글 작성 폼  */
#tInsert {
 	width: 100%;
	margin-bottom: 10px;
	display: flex;
	border-bottom: 2px solid navy; /* 1px 두께의 검은색 선 추가 */
	align-items: center;

}
#tInsert span { 
	margin-right: 30px;
	display: inline-block;
	vertical-align: top; /* 텍스트와 정렬을 맞추기 위해 상단 정렬 */
	margin-bottom: 10px;
	font-weight: bold;
}
/* 댓글 등록 폼 */
#tInsert #tarea {
	margin-right: 10px;
	display: inline-block;
	width: 500px;
	height: 20px;
	resize: none;
}
 #btn {
	display: inline-block;
	vertical-align: top;
	color: black;
	border: none;
	background: darkgray;
	font-style: oblique;
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
	margin-left: 90px;
} 
.re-tInsert{ /*댓글 등록, 수정 폼 class 값 */
	margin-top: 20px;
	width: 100%;
	margin-bottom: 10px;
	display: flex;
	border-bottom: 2px solid navy; 
}
.re-tInsert span{
	margin-right: 30px;
	display: inline-block;
	vertical-align: top; 
	margin-bottom: 10px;
	font-weight: bold;
}
#retInsert #reArea{
	margin-right: 10px;
	width: 500px;
	height: 20px;
	resize: none;
}
.action{
	display: inline-block;
	vertical-align: top;
	background-color: transparent; 
	border: none; 
	cursor: pointer; 
	padding: 0;
	font-size: medium;
	font-weight: bold; 
	color: navy;
}
#mInsert #reArea {
	margin-right: 10px;
	width: 500px;
	height: 20px;
	resize: none;
}
#rt_modify{ /* 수정버튼 */
	display: inline-block;
	vertical-align: top;
	background-color: transparent; 
	border: none; 
	cursor: pointer; 
	padding: 0;
	font-size: medium;
	font-weight: bold; 
	color: navy;
} 
.dw .writer, .dw #cdate {
	vertical-align:  middle; 
	display : inline-block;
	height : 40px;
	margin-top :-10px;
	
}
#moreList{
	display: block;
	text-align: center;
}
</style>
</head>	
<body>
<!-- 댓글 작성 폼 -->
<form id="tInsert">
	<span>댓글</span>&nbsp;&nbsp;
 	<textarea rows="5" cols="10" id="tarea" placeholder="댓글을 입력해주세요." class="tf"></textarea>&nbsp;&nbsp;&nbsp;
 	<input type="button" value="댓글작성" id="btn" name = "tcmt">
</form><br><br> 

<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="tctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>
</body>
</html>