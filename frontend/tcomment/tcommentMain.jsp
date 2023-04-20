<%@page import="vo.MemberVO"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="vo.TcommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
path = '<%=request.getContextPath()%>';
$(document).on('click', '#rt_modify', function(e){
	 tcontent = $('#mInsert textarea').val();
	 $.tcommentUpdateServer();
	 $("#pdiv").remove();
	 
}) 
	page=1;
	$(function() {
		// 댓글 목록 불러오기
		$.tcommentListServer(page);

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
				
				 $('.formdiv').remove();
				 $("#pdiv").remove();
				// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
				 <%
					MemberVO smemVO=(MemberVO)request.getSession().getAttribute("memberVo");
					String dsrc="기본프로필.png";
					if(smemVO.getMem_image()!=null){
						dsrc=request.getContextPath()+"/profileImageView.do";
					}
				%>
       			 tcommentForm = $('<div>').attr("class","formdiv").append($('<form>').attr('id','retInsert').addClass('re-tInsert').append(
       				    $('<div>').attr('class', 'tin').append(
       				        $('<img>').attr('src', '<%=dsrc%>').attr('alt', '<%=dsrc%>').attr('class', 'mrprofile'),
        				    $('<span>').attr('class', 'rmwriter').text('<%=smemVO.getMem_nickname()%>'),
       				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').attr('class', 'tf'),
       				        $('<input>').attr('type', 'button').attr('id', 'rt_insert').attr('name', 'rt_insert').attr('idx', tidx).addClass('action').val('답글달기')
        				   
       				    )
       				)// form 끝
       			);
       		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
       		        	$(this).parent(".dw").append(tcommentForm);
       	
       		        
			}else if (vacation == "rt_insert"){
				//tid = $(this).attr('idx');
				 
				 reContent = $('#retInsert div textarea').val();
				 tcommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
 				 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
				 pcomment=$("#tctLayer").find("#"+tcommentPid).attr("id")
 				 pcommentLevel=$("#tctLayer").find("#"+tcommentPid).attr("class");
 				 console.log(pcommentLevel);
				 parentcomment=$("#tctLayer").find("#"+tcommentPid);
				 console.log(pcomment, pcommentLevel, tcommentPid)
				 
				 $.retcommentWriteServer();
				 $(".formdiv").remove();

			}else if (vacation == "t_delete"){
				 target = $(this).attr('idx');
				 target = $("#tctLayer").find("#"+target);
				 $('.formdiv').remove();
				 $("#pdiv").remove();
				  $.tcommentDeleteServer(); 
				 
			}else if(vacation == "t_modify"){
				 $('.formdiv').remove();
				 $("#pdiv").remove();
 				tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();
			   /*  nickname = $(this).parent('div').closest('#${res.tcomment_id}').attr('nick'); */
			    // 댓글 입력 폼 생성
			    
			    
 				<%
					dsrc="기본프로필.png";
					if(smemVO.getMem_image()!=null){
						dsrc=request.getContextPath()+"/profileImageView.do";
					}
				%>
			    var modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'mInsert').addClass('re-tInsert').append(
			        $('<div>').attr('class', 'tmod').append(
			            $('<img>').attr('src', '<%=dsrc%>').attr('alt', '<%=dsrc%>').attr('class', 'mrprofile'),
			            $('<span>').attr('class', 'rmwriter').text('<%=smemVO.getMem_nickname()%>'),
			            $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').val(tcon), // 수정할 댓글 내용을 textarea에 세팅
			            $('<input>').attr('type', 'button').attr('id', 'rt_modify').attr('name', 'rt_modify').attr('idx', tidx).addClass('action').val('수정하기') // 수정하기 버튼 생성
			        )
			    ));
			    
			    // 현재 클릭된 수정 버튼이 속한 댓글 div 다음에 댓글 입력 폼을 추가
			    $(this).after(modifyForm);
			    
			    tparent = $(this).parent().find('.content');

			    tmodicont = $('#mInsert textarea').val(tparent.text());
			    
					tmo = $(modifyForm).parent();
					
					// 수정하기 버튼을 클릭해서 수정완료 후 수정하기 버튼을 클릭했을때
				 
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
	margin: 0 auto;
 	width: 750px;
	margin-bottom: 10px;
	display: flex;
	border-bottom: 2px solid gray; /* 1px 두께의 검은색 선 추가 */
	align-items: center;
	padding-top: 20px;
	padding-bottom: 20px; 
}
#tInsert span {
	margin-left:20px; 

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
	resize: none;
}
 #btn {
	display: inline-block;
    vertical-align: top;
    color: white;
    border: none;
    font-weight: 600;
    background: rgb(56,102,233);
    padding: 6px 17px;
    border-radius: 1268px;
} 
.a1{
	padding-left: 10px;
}
.a2{
    padding-left: 50px; 
}
.a3{
	padding-left: 90px;
} 
.re-tInsert{ /*댓글 등록, 수정 폼 class 값 */
	margin-top: 20px;
	width: 100%;
	margin-bottom: 10px;
	display: flex;
}
.re-tInsert span{
	display: inline-block;
	vertical-align: top; 
	margin-bottom: 10px;
	font-weight: bold;
	margin-left: 7px;
}
#retInsert #reArea{
	margin-right: 10px;
	width: 500px;
	height: 42px;
	resize: none;
	margin-left: 7px;
}
.action{
	display: inline-block;
	vertical-align: top;
	background-color: transparent; 
	border: none; 
	cursor: pointer; 
	padding: 0;
	font-size: 14px;
	font-weight: bold; 
	color: gray;
	margin-left: 8px
}
#mInsert #reArea {
	margin-right: 10px;
	width: 500px;
	height: 42px;
	resize: none;
	margin-left: 7px;
}

.dw .writer {
	vertical-align:  middle; 
	display : inline-block;
	height : 40px;
	margin-bottom:15px;
	font-size: 14px;
}
.rmwriter{
	vertical-align:  middle; 
	display : inline-block;
	margin-top :6px;
	font-size: 14px;
}
.dw .cdate {
	vertical-align:  middle; 
	display : inline-block;
	height : 40px;
	color:gray;
	font-size: 9px;
	
}

.dw .content {
	font-size: 13px;
	padding-top: 10px;
	
}
.dw{
	padding-top:10px;
	padding-bottom: 10px;
	border-bottom: 1px solid rgb(174,174,178);
}
.dw:last-child{
	border:none;
}
#moreList{
	display: block;
	margin: 0 auto;
}
#tctLayer{
	padding: 20px;
}
.mrprofile{
	width: 30px;
	height: 30px;
	border-radius: 100%;
}
.tin{display:flex; align-items: center; margin-top: 8px;}
.tmod{display:flex; align-items: center; margin-top: 8px;}
</style>
</head>	
<body>
<!-- 댓글 작성 폼 -->
<form id="tInsert">
	<span>댓글</span>
 	<textarea rows="5" cols="10" id="tarea" placeholder="댓글을 입력해주세요." class="tf"></textarea>
 	<input type="button" value="댓글작성" id="btn" name = "tcmt">
</form> 
<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="tctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>
</body>
</html>