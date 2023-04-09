<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mycss.css">
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(()=>{
	path = "<%=request.getContextPath()%>"
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
		      return `\${betweenTime}\${value.name} 전`;
		    }
		  }
		  return '방금 전';
		}
	
	
	$.ajax({
		url: "<%=request.getContextPath()%>/chatRoom.do",
		type: "post",
		dataType: "json",
		success: function(res) {
			
			
			$.each(res,function(i,v){
				noReadCnt = v.noReadCnt;
				if(noReadCnt!=0){
					noReadCnt = "안읽음:"+noReadCnt;
				}else{
					noReadCnt = elapsedTime(v.LastMessageVO.message_cdate);
					
				}
				
				message_content = v.LastMessageVO.message_content;
				
				
				code=""
				code+="<div class='rooms' id='"+v.chatRoomVO.room_id+"'>"
				code+='<div class="profilediv"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"></div>'
				code+="<div class='chatinfo'><h3>"+v.yourMember.mem_nickname+"</h3>"
				code+="<span class='pspan'>"+v.yourMember.mem_add+" · "+noReadCnt+"</span>"
				code+="<p>"+v.LastMessageVO.message_content+"</p>"
				code+="</div></div>"
				$("#chatList").append(code);
			})
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
	img = `${path}/images/TboardImageView.do?imgno=${img}`;
	$(document).on("click",".rooms",function(){
		$.ajax({

			url: "<%=request.getContextPath()%>/chatmessage.do",
			type: "post",
			data:{"room_id":$(this).attr("id"),"yournick":$(this).find(".chatinfo h3").text()},
			dataType: "json",
			success: function(res) {
				tcode='<div><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png">'+res.yourMember.mem_nickname+'</div>'
				tcode+=`<div class="tdiv"><img class="timg" src='\${path}/images/TboardImageView.do?imgno=\${res.fTImageVO.timg_id}'>`
				tcode+="<div class='tcon'><h2>"+res.tBoardVO.tboard_title+"</h2><span class='state'>"+res.tBoardVO.tboard_state+"</span><span class='price'>"+res.tBoardVO.tboard_price+" 원</span></div></div>"
				$("#tboard").html(tcode);
			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		})
	})
	
})
</script>
<style type="text/css">
body *{
	border:1px solid black;
}
#box{
	display:flex;
	width: 1000px;
	height: 600px;
	margin: 0 auto;
}
#chatList{
	flex: 1;
	overflow: auto;
}
#chatRoom{
	flex: 2;
	overflow: auto;
	display: flex;
	flex-direction: column;
}
#tboard{
	flex: 1
}
#chat{
	flex: 3
}
#typing{
	flex: 1
}
.profile{
	width: 50px;
	height: 50px;
	border-radius: 100%;
	margin-top: 5px;
}
.rooms{
	display: flex;
	justify-content: center;
	align-items: center;
}
.chatinfo{
	flex: 4;
}
.chatinfo h3{
	display: inline-block;
}
.profilediv{
	flex: 1;
	text-align: center;
}
.pspan{
	font-size: 0.8em;
	color: gray;
}
.timg{
	flex:1;
	width: 100px;
	height: 100px;
}
.tcon{
	flex: 4;
}
.tdiv{
	display: flex;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/module/header.jsp"%>
	<div id="box">
		<div id="chatList">
		</div>
		<div id="chatRoom">
			<div id="tboard"></div>
			<div id="chat"></div>
			<div id="typing"></div>
		</div>
	</div>
		<%@ include file="/module/footer.jsp"%>
	</div>
</body>
</html>