<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="../js/pcomment.js"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';
$(document).on('click', '#rp_modify', function(e){
	pcontent = $('#pInsert textarea').val();
	$.pcommentUpdateServer();
	$('#pdiv').remove();
})
page = 1;
$(function(){
	// 댓글 목록 불러오기
	$.pcommentListServer(page);
	
	// 댓글 작성
	$('#btn').on('click', function() {
		 pcontent = $('#pInsert textarea').val();
		 
		 // tcontent가 null이 아닐 때만 서버에 댓글 작성 요청을 보냄
		 if (pcontent != null) {
		    $.pcommentWriteServer();
		 } else {
		    console.error("댓글 내용이 없습니다.");
		 }
	})
	
	// 댓글 등록 수정 삭제
	$(document).on('click', '.action', function(res) {
		var vacation = $(this).attr('name');
		 pidx = $(this).attr('idx');
		 //console.log(pidx);
		if (vacation == "p_insert") {
			$('.pformdiv').remove();
			$("#pdiv").remove();
			
			// $('.re-pInsert').parent("div").remove();
			// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
			<%
				MemberVO pmemVO=(MemberVO)request.getSession().getAttribute("memberVo");
				String dsrc = "기본프로필.png";
				if(pmemVO.getMem_image()!=null){
					dsrc = request.getContextPath()+"/profileImageView.do";
				}
			%>
   			 pcommentForm = $('<div>').attr("class","pformdiv").append($('<form>').attr('id','repInsert').addClass('re-pInsert').append(
   				    $('<div>').append(
   				        $('<img>').attr('src', '<%=dsrc%>').attr('alt', '<%=dsrc%>').attr('class', 'mrprofile'),
    				    $('<span>').attr('class', 'rmwriter').text('<%=pmemVO.getMem_nickname()%>'),
   				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'preArea'),
   				        $('<input>').attr('type', 'button').attr('id', 'rp_insert').attr('name', 'rp_insert').attr('idx', pidx).addClass('action').val('답글달기')
    				   
   				    )
   				)// form 끝
   			);
   		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
   		        	$(this).parent('.dw').append(pcommentForm);
   	
   		        
		}else if (vacation == "rp_insert"){
			
			//tid = $(this).attr('idx');
			 
			 reContent = $('#repInsert div textarea').val();
			 pcommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
			 
			 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
			 ppcomment=$("#pctLayer").find("#"+pcommentPid).attr("id");
			 //console.log(ppcomment);
			 //ppcommentLevel=$("#pctLayer").find("#"+pcommentPid).attr("class");
			 ppcommentLevel=$("#pctLayer").find("#"+pcommentPid).attr("class");
			 //console.log(ppcommentLevel);
			 pparentcomment=$("#pctLayer").find("#"+pcommentPid);
			 
			 $.repcommentWriteServer();
			 $(".pformdiv").remove();

		}else if (vacation == "p_delete"){
			 target = $(this).attr('idx');
			 target = $("#pctLayer").find("#"+target);
			 $.pcommentDeleteServer(); 
			 
		}else if(vacation == "p_modify"){
				 $('.pformdiv').remove();
				 $("#pdiv").remove();
// 				$(".action[name='p_modify']").next().remove();
				pcon = $(this).parent('div').closest('.re-pInsert').find('textarea').val();
//				var tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();
				
				 <%
					dsrc="기본프로필.png";
					if(pmemVO.getMem_image()!=null){
						dsrc=request.getContextPath()+"/profileImageView.do";
					}
				 %>
		    // 댓글 입력 폼 생성
		     var modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'pmInsert').addClass('re-pInsert').append(
		        $('<div>').append(
		            $('<img>').attr('src', '<%=dsrc%>').attr('alt', '<%=dsrc%>').attr('class', 'mrprofile'),
		            $('<span>').attr('class', 'rmwriter').text('<%=pmemVO.getMem_nickname()%>'),
		            $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'preArea').val(pcon), // 수정할 댓글 내용을 textarea에 세팅
		            $('<input>').attr('type', 'button').attr('id', 'rp_modify').attr('name', 'rp_modify').attr('idx', pidx).addClass('action').val('수정하기') // 수정하기 버튼 생성
		        )
		    ));
		    
		    // 현재 클릭된 수정 버튼이 속한 댓글 div 다음에 댓글 입력 폼을 추가
		    $(this).after(modifyForm);
		    
		    pparent = $(this).parent().find('.content');

		    pmodicont = $('#pmInsert textarea').val(pparent.text());
		    
				ptmo = $(modifyForm).parent();
				
				// 수정하기 버튼을 클릭해서 수정완료 후 수정하기 버튼을 클릭했을때
// 			 $(document).on('click', '#rp_modify', function(res){
// 				 pcontent = $('#pmInsert textarea').val();
// 				 $.pcommentUpdateServer();
// 				 $('#pdiv').remove();
// 			})  
			// 더보기 버튼 클릭시
		}else if(vacation == "moreList"){
				page+=1;
				$.pcommentListServer(page);
		
			
		}
		
	})
	 

})
</script>
<style type="text/css">
 #pctLayer{
	padding: 20px;
} 
/* 댓글 작성 폼  */
#pInsert {
 	width: 100%;
	margin-bottom: 10px;
	display: flex;
	border-bottom: 2px solid navy; /* 1px 두께의 검은색 선 추가 */
	align-items: center;
	padding-top: 20px;
	padding-bottom: 20px; 
}
#pInsert span { 
	margin-left:20px; 
	margin-right: 30px;
	display: inline-block;
	vertical-align: top; /* 텍스트와 정렬을 맞추기 위해 상단 정렬 */
	margin-bottom: 10px;
	font-weight: bold;
}
/* 댓글 등록 폼 */
#pInsert #parea {
	margin-right: 10px;
	display: inline-block;
	width: 500px;
	resize: none;
}
 #btn {
	display: inline-block;
	vertical-align: top;
	color: black;
	border: none;
	background: rgb(199,199,204);
	font-style: oblique;
	padding: 10px
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
.re-pInsert{ /*댓글 등록, 수정 폼 class 값 */
	margin-top: 20px;
	width: 100%;
	margin-bottom: 10px;
	display: flex;
}
.re-pInsert span{
	margin-right: 30px;
	display: inline-block;
	vertical-align: top; 
	margin-bottom: 10px;
	font-weight: bold;
}
#repInsert #preArea{
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
	font-size: 14px;
	font-weight: bold; 
	color: navy;
}
#pmInsert #preArea {
	margin-right: 10px;
	width: 500px;
	height: 20px;
	resize: none;
}
#rp_modify{ /* 수정버튼 */
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
#rp_insert{
	margin-top: 8px;
}
.dw .content {
	font-size: 13px;
	padding-top: 10px;
	
}
dw{
	padding-top:10px;
	padding-bottom: 10px;
	border-bottom: 1px solid rgb(174,174,178);
}
.dw:last-child{
	border:none;
}
.mrprofile{
	width: 30px;
	height: 30px;
	border-radius: 100%;
}
#moreList{
	display: block;
	margin: 0 auto;
}
</style>
</head>
<body>
<!-- 댓글 작성 폼 -->
<form id="pInsert">
	<span>댓글</span>&nbsp;&nbsp;
 	<textarea rows="5" cols="10" id="parea" placeholder="댓글을 입력해주세요."></textarea>
 	<input type="button" value="댓글작성" id="btn" name = "pcmt">
</form><br><br> 

<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="pctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>
</body>
</html>