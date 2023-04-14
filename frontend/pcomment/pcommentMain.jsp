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
page = 1;
$(function(){
	// 댓글 목록 불러오기
	$.pcommentListServer(page);
	
	// 댓글 작성
	$('#btn').on('click', function() {
		 pcontent = $('#pInsert textarea').val();

		 // tcontent가 null이 아닐 때만 서버에 댓글 작성 요청을 보냄
		 if (pcontent !== null) {
		    $.pcommentWriteServer();
		 } else {
		    console.error("댓글 내용이 없습니다.");
		 }
	})
	
	// 댓글 등록 수정 삭제
	$(document).on('click', '.action', function(res) {
		var vacation = $(this).attr('name');
		 tidx = $(this).attr('idx');
		if (vacation == "p_insert") {
			
			 $('.re-pInsert').parent("div").remove();
			// 답글 작성 버튼이 클릭시 댓글 입력 폼을 나타내는 코드
			
<%--         		<%= id %>  --%>
   			 tcommentForm = $('<div>').attr("class","formdiv").append($('<form>').attr('id','repInsert').addClass('re-pInsert').append(
   				    $('<div>').append(
   				        $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').attr('width', '40px').attr('height', '40px').after('&nbsp;'),
    				    $('<span>').attr('id', 'writer').after('&nbsp;&nbsp;'),
   				        $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea'),
   				        $('<input>').attr('type', 'button').attr('id', 'rp_insert').attr('name', 'rp_insert').attr('idx', tidx).addClass('action').val('답글달기')
    				   
   				    )
   				)// form 끝
   			);
   		        	// 댓글 입력 폼을 현재 클릭된 버튼 다음에 추가
   		        	$(this).next().next().after(pcommentForm);
   	
   		        
		}else if (vacation == "rp_insert"){
			//tid = $(this).attr('idx');
			 
			 reContent = $('#repInsert div textarea').val();
			 pcommentPid = $(this).attr('idx'); // 댓글 장본인의 댓글 아이디
				 // 답글이 달리면 이 번호는 부모 댓글 아이디로 가야하고 자식 댓글 아이디는 시퀀스로 생성된 새로운 아이디
			 pcomment=$("#pctLayer").find("#"+pcommentPid).attr("id")
				 pcommentLevel=$("#pctLayer").find("#"+pcommentPid).attr("class");
				 parentcomment=$("#pctLayer").find("#"+pcommentPid);
			 console.log(pcomment, pcommentLevel, tcommentPid)
			 
			 $.repcommentWriteServer();
			 $(".formdiv").remove();

		}else if (vacation == "p_delete"){
			 target = $(this).attr('idx');
			 target = $("#pctLayer").find("#"+target);
			  $.pcommentDeleteServer(); 
			 
		}else if(vacation == "p_modify"){
				tcon = $(this).parent('div').closest('.re-pInsert').find('textarea').val();
//				var tcon = $(this).parent('div').closest('.re-tInsert').find('textarea').val();

		    // 댓글 입력 폼 생성
		     modifyForm = $('<div>').attr('id', 'pdiv').append($('<form>').attr('id', 'mInsert').addClass('re-pInsert').append(
		        $('<div>').append(
		            $('<img>').attr('src', '../images/기본프로필.png').attr('alt', '기본프로필.png').after('&nbsp;'),
		            $('<span>').attr('id', 'writer').after('&nbsp;&nbsp;'),
		            $('<textarea>').attr('rows', '5').attr('cols', '10').attr('id', 'reArea').val(tcon), // 수정할 댓글 내용을 textarea에 세팅
		            $('<input>').attr('type', 'button').attr('id', 'rp_modify').attr('name', 'rp_modify').attr('idx', tidx).addClass('action').val('수정하기') // 수정하기 버튼 생성
		        )
		    ));
		    
		    // 현재 클릭된 수정 버튼이 속한 댓글 div 다음에 댓글 입력 폼을 추가
		    $(this).after(modifyForm);
		    
		    pparent = $(this).parent().find('#content');

		    tmodicont = $('#mInsert textarea').val(pparent.text());
		    
				tmo = $(modifyForm).parent();
				
				// 수정하기 버튼을 클릭해서 수정완료 후 수정하기 버튼을 클릭했을때
			 $(document).on('click', '#rp_modify', function(res){
				 pcontent = $('#mInsert textarea').val();
				 $.pcommentUpdateServer();
				 modifyForm.hide();
			})  
			// 더보기 버튼 클릭시
		}else if(vacation == "moreList"){
				page+=1;
				$.pcommentListServer(page);
		
			
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

.b1{
	margin: 10px;
}
.b2{
	margin-left: 40px;
	margin-right : 10px;
	margin-bottom: 10px; 
    padding: 10px; 
}
.b3{
	margin-left: 70px;
}
.b4{
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
.b${level} {
  margin-bottom: 10px;
  padding: 5px;
  background-color: #fff;
  display: flex;
  align-items: center;
}

/* Style for the profile image */
.b${level} img {
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
<form id="pInsert">
 	<textarea rows="5" cols="10" id="parea"></textarea>
 	<input type="button" value="댓글작성" id="btn" name = "pcmt">
</form><br><br> 

<!-- 처음 댓글 입력 폼이 들어가는 곳 -->
<div id="pctLayer"></div>

<!-- 더보기 버튼 -->
 <button type="button" class="action" id="moreList" name="moreList">더보기</button>

</body>
</html>