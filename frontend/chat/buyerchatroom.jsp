<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/chatroom.css">
<link rel="stylesheet" href="css/mycss.css">
<style type="text/css">
#box {
	flex: 2;
	display: flex;
	flex-direction: column;
	border: 2px solid gray;
	border-radius: 12px;
}
</style>
<script src="js/chatcommon.js" type="text/javascript"></script>
<script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
tboard_id="<%=request.getParameter("tboard_id")%>"
function onMessage(event) {
	chat = $("#chat")
    var message = JSON.parse(event.data)
    console.log(message)
    if(message.res!=0){
		$("#chat .mread").text("");

	}else if (message.message == "") {
        
    } else {
    	today = new Date();   
		curdate = today.getFullYear()+"-"+('0' + (today.getMonth() + 1)).slice(-2)+"-"+('0' + today.getDate()).slice(-2);
		curtime = ('0' + today.getHours()).slice(-2)+":"+('0' + today.getMinutes()).slice(-2)+":"+('0' + today.getSeconds()).slice(-2)
		curtime = messageTime([curdate,curtime]);
		lastdate=$(".chatdate").last().text();
		if(curdate!=lastdate){
			p=$("<p class='chatdate'>"+curdate+"</p>");
			chat.append(p);
			lastdate=curdate;
		}
		if(message.reciever==ymem_id){
			isread="";
			if(message.noread==1){
				isread="<span class='mread'>1</span>"
			}
			message = $("<div class='m mmessage' id='"+message.message_id+"'>"+isread+"<span class='mdate'>"+curtime+"</span><span class='mcont'> "+message.message+"</span></div> ")
			chat.append(message);
			$("#chat").scrollTop($("#chat")[0].scrollHeight);
		}else{
			img="<img class='profile' alt='images/기본프로필.png' src='images/기본프로필.png'>"

			message = $("<div class='m ymessage' id='"+message.message_id+"'>"+img+"<span class='mcont'> "+message.message+"</span><span class='mdate'>"+curtime+"</span></div> ")
			chat.append(message);
			$("#chat").scrollTop($("#chat")[0].scrollHeight);
		}
		/*  sender;  
		 reciever;
		 message; 
		 room_id;   
		 message_id; 
		 noread
		 */
    	
    }
  
}
function onOpen(event) {
    alert("onOpen")
}
function onError(event) {
    alert(event.data);
}
$(()=>{
	$.ajax({

		url: "<%=request.getContextPath()%>/buyerChatRoom/tboard.do",
		type: "get",
		dataType: "json",
		data: {"tboard_id":tboard_id},
		success: function(res) {
			ymem=res.writer;
			ymem_id=res.writer.mem_id;
			mmem_id=res.mymem_id;
			
			
			pimg = $("<img class='profile' alt='images/기본프로필.png' src='images/기본프로필.png'>")
			writer = $("<h4 class='ynick'>"+res.writer.mem_nickname+"</h4>")
			$(".tboardprofile").append(pimg).append(writer);
			
			
			timg = $("<img class='timg'>")
			timg.attr("src","/cokkiri/images/TboardImageView.do?imgno="+res.fimgid)
			$(".tdiv").append(timg);
			
			div=$("<div class='tcon'></div>");
			$(".tdiv").append(div);
			
			title=$("<h3 class='tboardcon'>"+res.boardVO.tboard_title+"</h3>");
			state=$("<span class='state'>"+res.boardVO.tboard_state+"</span>");
			price=$("<span class='price'>"+res.boardVO.tboard_price+" 원</span>")
			
			$(".tcon").append(title).append(state).append(price)
			
			prechatreceive();
			
			
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
	$(document).on("click","#send",function(){
		text = $("#ta").val();
		if(prechatExist==false){
			//채팅방 생성후, 소켓 접속 , 메시지 전송후 db저장		
			$.ajax({

				url: "<%=request.getContextPath()%>/chatRoomCreate.do",
				type: "post",
				dataType: "json",
				data: {"tboard_id":tboard_id,"fmessage":text},
				success: function(res) {
					if(res.res!=0){
						console.log(res)
						room_id=res.res;
						user=res.mem_id;
						webflag =false;
					
						buyerWebsocketConnect(room_id);
					
						prechatExist=true;
						
						if ($("#ta").val() == "") {
				        	alert("비었음")
				        } else {	        
					        message={
					        			"sender" : mmem_id ,
					        			"reciever" : ymem_id,
					        			"message" : $("#ta").val(),
					        			"room_id" : room_id
					        		}
					        webSocket.onopen=()=>{
					        	webSocket.send(JSON.stringify(message));
						        $("#ta").val("");
						        $("#chat").scrollTop($("#chat")[0].scrollHeight);
					        }
					        
				        }
					}
					
					/* pdate=res.message.message_cdate.split(" ")[0]
					date=pdate
					console.log(res.message.message_cdate)
					mdate=messageTime(res.message.message_cdate.split(" "))
					sdate = $("<p class='chatdate'>"+pdate+"</p>")
					mmessage = $("<div class='m mmessage' id="+res.message.message_id+"</div>") 
					$("#chat").append(sdate).append(mmessage);
					
					mread=$("<span class='mread'>1</span>")
					mspan=$("<span class='mdate'>"+mdate+"</span>")
					mcspan=$("<span class='mcont'>"+res.message.message_content+"</span>")
					$(".mmessage").append(mread).append(mspan).append(mcspan); */
					
					
				},
				error: function(xhr) {
					alert("상태: " + xhr.status)
				}
			}) 
		}else{
			if (text == "") {
	        	alert("비었음")
	        } else {	        
		        message={
		        			"sender" : mmem_id ,
		        			"reciever" : ymem_id,
		        			"message" : text,
		        			"room_id" : room_id
		        		}
		        webSocket.send(JSON.stringify(message));
		        $("#ta").val("");
		        $("#chat").scrollTop($("#chat")[0].scrollHeight);
	        }
		}
	})
})
	
	
	function prechatreceive(){
		$.ajax({
	
			url: "<%=request.getContextPath()%>/preChatExist.do",
			type: "get",
			dataType: "json",
			data: {"tboard_id":tboard_id},
			success: function(res) {
				date=null;
				if(typeof res.res == "undefined" || res.res == null || res.res == ""){
					prechatExist=false;
				}else{
					//기존 채팅방 가져오고 그 룸아이디로 소켓접속
					
					$.each(res.res,function(i,v){
						
						chat=$("#chat");
						
						cdate = v.message_cdate.split(" ")
						
						if(cdate[0]!=date){
							p=$("<p class='chatdate'>"+cdate[0]+"</p>");
							chat.append(p);
							date=cdate[0];
						}
						whosmessage=null;
						img="";
						isread="";
						
						
						messageDate=messageTime(cdate)
						
						message_content=v.message_content.replace(/\n/g,"<br>")
						if(v.mem_id==ymem_id){
							whosmessage="ymessage"
							img="<img class='profile' alt=''images/기본프로필.png' src='images/기본프로필.png'>"
								message = $("<div class='m "+whosmessage+"' id='"+v.message_id+"'>"+img+isread+"<span class='mcont'> "+message_content +"</span><span class='mdate'>"+messageDate+"</span></div> ")
						}else{
							whosmessage="mmessage"
							img="";
							if(v.message_isread=='n'){
								isread="<span class='mread'>1</span>"
							}
							message = $("<div class='m "+whosmessage+"' id='"+v.message_id+"'>"+isread+"<span class='mdate'>"+messageDate+"</span> <span class='mcont'> "+message_content +"</span></div>")
						}
	
						chat.append(message);
						$("#chat").scrollTop($("#chat")[0].scrollHeight);
					
						
					})
					
					room_id=res.res[0].room_id
					
					webflag =false;
					
					websocketConnect(room_id);
					
					prechatExist=true;
				}
			
				$("#typing").append($("<textarea id='ta' rows='5' cols='80'></textarea>")).append($("<button id='send'>전송</button>"))
			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		}) 
	}
	
	
	
    
    

</script>
</head>

<body>
	<%@ include file="/module/header.jsp"%>
	<div id="box">
		<div id="tboard">
			<div class="tboardprofile"></div>
			<hr>
			<div class="tdiv"></div>
		</div>
		<hr>
		<div id="chat"></div>
		<hr>
		<div id="typing"></div>
	</div>
	<%@ include file="/module/footer.jsp"%>
</body>
</html>