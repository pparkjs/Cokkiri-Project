<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mycss.css">
<link rel="stylesheet" href="../css/chatroom.css">
<script src="../js/chatcommon.js" type="text/javascript"></script>
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<script type="text/javascript">
webflag=false;
room_id="";
function onMessage(event) {
	
    var message = JSON.parse(event.data)

    if(message.res!=0){
    	$("#chat .mread").text("");

    }
	else if(message.room_id==null||typeof message.room_id=='undefined'||message.room_id!=room_id){
    	/*  message_id;       
    	  message_content;
    	  message_isread; 
    	  message_cdate;  
    	  room_id;          
    	  mem_id;         
    	 res;       */         
		curclass=$("#"+message.room_id+"").find(".pspan").find("div")
		curparent=$("#"+message.room_id+"").attr("id")
		if(curparent==null||curparent==""||typeof curparent=="undefined"){
			
			noReadCnt = "<div class='nread'>1</div>";
			message_content = message.message_content;
			ymem_id=message.ymem.mem_id;
			code=""
			code+="<div class='rooms' id='"+message.room_id+"'>"
			code+='<div class="profilediv"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"></div>'
			code+="<div class='chatinfo'><h3>"+message.ymem.mem_nickname+"</h3>"
			code+="<span class='pspan'>"+message.ymem.mem_add+" · "+noReadCnt+"</span>"
			code+="<p>"+message_content+"</p>"
			code+="</div></div>"
			$("#chatList").append(code);
		}else{

			if(curclass.attr("class")=="date"){
				curclass.addClass("nread");
				curclass.removeClass("date");
				
				noReadCnt = 1
			}else{
				cnt=$("#"+message.room_id+"").find(".pspan").find("div").text()
				cnt = Number(cnt)+1;
				noReadCnt =cnt;		
			}
			curclass.text("");
			curclass.text(noReadCnt)
			
			
			/* mmem_id=v.myMember.mem_id; */
			message_content = message.message_content;
			
			curmessage=$("#"+message.room_id+"").find("p");
			curmessage.empty();
			curmessage.text(message_content)
		}	
			
    	
    } else {
    	today = new Date();  
    	$("#"+message.room_id+"").find(".date").text("방금 전");
    	$("#"+message.room_id+"").find("p").text(message.message)
		curdate = today.getFullYear()+"-"+('0' + (today.getMonth() + 1)).slice(-2)+"-"+('0' + today.getDate()).slice(-2);
		curtime = ('0' + today.getHours()).slice(-2)+":"+('0' + today.getMinutes()).slice(-2)+":"+('0' + today.getSeconds()).slice(-2)
		curtime = messageTime([curdate,curtime]);
		lastdate=date
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
			img="<img class='profile' alt='../images/기본프로필.png' src='../images/기본프로필.png'>"

			message = $("<div class='m ymessage' id='"+message.message_id+"'>"+img+"<span class='mcont'> "+message.message+"</span><span class='mdate'>"+curtime+"</span></div> ")
			chat.append(message);
			$("#chat").scrollTop($("#chat")[0].scrollHeight);
		}
    	
    }
  
}
function onOpen(event) {
	
}
function onError(event) {
	
}


function chatListLoad(){
	$.ajax({
		url: "<%=request.getContextPath()%>/chatRoom.do",
		type: "post",
		dataType: "json",
		success: function(res) {
			$.each(res,function(i,v){
				curclass=$("#"+v.chatRoomVO.room_id+"").find(".pspan").find("div")
				curparent=$("#"+v.chatRoomVO.room_id+"").attr("id")
				if(curparent==null||curparent==""||typeof curparent=="undefined"){
					noReadCnt = v.noReadCnt;
					if(noReadCnt!=0){
						noReadCnt = "<div class='nread'>"+noReadCnt+"</div>";
					}else{
						noReadCnt ="<div class='date'>"+ elapsedTime(v.LastMessageVO.message_cdate)+"</div>";
						
					}
					mmem_id=v.myMember.mem_id;
					message_content = v.LastMessageVO.message_content;
					
					code=""
					code+="<div class='rooms' id='"+v.chatRoomVO.room_id+"'>"
					code+='<div class="profilediv"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"></div>'
					code+="<div class='chatinfo'><h3>"+v.yourMember.mem_nickname+"</h3>"
					code+="<span class='pspan'>"+v.yourMember.mem_add+" · "+noReadCnt+"</span>"
					code+="<p>"+v.LastMessageVO.message_content+"</p>"
					code+="</div></div>"
					$("#chatList").append(code);
				}
				else{
					noReadCnt = v.noReadCnt;
					if(noReadCnt!=0){
						if(curclass.attr("class")=="date"){
							curclass.addClass("nread");
							curclass.removeClass("date");
						}
						noReadCnt = noReadCnt
					}else{
						if(curclass.attr("class")=="nread"){
							curclass.addClass("date");
							curclass.removeClass("nread");
						}
						noReadCnt =elapsedTime(v.LastMessageVO.message_cdate)		
					}
					curclass.text("");
					curclass.text(noReadCnt)
					
					
					mmem_id=v.myMember.mem_id;
					message_content = v.LastMessageVO.message_content;
					
					curmessage=$("#"+v.chatRoomVO.room_id+"").find("p");
					curmessage.empty();
					curmessage.text(message_content)
				}	
					
				
			})
			
			
			webSocket = new WebSocket('ws://localhost:8090/cokkiri/Chatting?mem_id='+mmem_id);
			webSocket.onerror = function(event) {
		        onError(event)
		    };
		    webSocket.onopen = function(event) {
				webflag=true;
		    };
		    webSocket.onmessage = function(event) {
		    	
		        onMessage(event)
		        
		    };
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
}




function chatListReload(){
	$.ajax({
		url: "<%=request.getContextPath()%>/chatRoom.do",
		type: "post",
		dataType: "json",
		success: function(res) {
			$.each(res,function(i,v){
				curclass=$("#"+v.chatRoomVO.room_id+"").find(".pspan").find("div")
				curparent=$("#"+v.chatRoomVO.room_id+"").attr("id")
				if(curparent==null||curparent==""||typeof curparent=="undefined"){
					noReadCnt = v.noReadCnt;
					if(noReadCnt!=0){
						noReadCnt = "<div class='nread'>"+noReadCnt+"</div>";
					}else{
						noReadCnt ="<div class='date'>"+ elapsedTime(v.LastMessageVO.message_cdate)+"</div>";
						
					}
					mmem_id=v.myMember.mem_id;
					message_content = v.LastMessageVO.message_content;
					
					code=""
					code+="<div class='rooms' id='"+v.chatRoomVO.room_id+"'>"
					code+='<div class="profilediv"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"></div>'
					code+="<div class='chatinfo'><h3>"+v.yourMember.mem_nickname+"</h3>"
					code+="<span class='pspan'>"+v.yourMember.mem_add+" · "+noReadCnt+"</span>"
					code+="<p>"+v.LastMessageVO.message_content+"</p>"
					code+="</div></div>"
					$("#chatList").append(code);
				}
				else{
					noReadCnt = v.noReadCnt;
					if(noReadCnt!=0){
						if(curclass.attr("class")=="date"){
							curclass.addClass("nread");
							curclass.removeClass("date");
						}
						noReadCnt = noReadCnt
					}else{
						if(curclass.attr("class")=="nread"){
							curclass.addClass("date");
							curclass.removeClass("nread");
						}
						noReadCnt =elapsedTime(v.LastMessageVO.message_cdate)		
					}
					curclass.text("");
					curclass.text(noReadCnt)
					
					
					mmem_id=v.myMember.mem_id;
					message_content = v.LastMessageVO.message_content;
					
					curmessage=$("#"+v.chatRoomVO.room_id+"").find("p");
					curmessage.empty();
					curmessage.text(message_content)
				}	
					
				
			})

		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
}







$(()=>{
	path = "<%=request.getContextPath()%>"
	

	
	
	
	chatListLoad()
	setInterval(function() {
		chatListReload();
	}, 60000);

	
	$(document).on("click",".rooms",function(){
		
		$(".rooms").removeClass("roomactive");
		$(this).addClass("roomactive");
		
		$(".nread",this).addClass("date");
		$(".date",this).removeClass("nread");
		datespan=$(".date",this);
		room_id=$(this).attr("id");
		chat=$("#chat")
		chat.empty();
		
		ynick=$(this).find(".chatinfo h3").text()
		$.ajax({

			url: "<%=request.getContextPath()%>/chatmessage.do",
			type: "post",
			data:{"room_id":room_id,"yournick":ynick},
			dataType: "json",
			success: function(res) {
				tcode='<div class="tboardprofile"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"><h4 class="ynick">'+ynick+'</h4></div>'
				tcode+=`<hr><div class="tdiv"><img class="timg" src='\${path}/images/TboardImageView.do?imgno=\${res.fTImageVO.timg_id}'>`
				tcode+="<div class='tcon'><h3 class='tboardcon'>"+res.tBoardVO.tboard_title+"</h3><span class='state'>"+res.tBoardVO.tboard_state+"</span><span class='price'>"+res.tBoardVO.tboard_price+" 원</span></div></div>"
				$("#tboard").html(tcode);
				
				ymem_id=res.yourMember.mem_id;
				
				date=undefined
				$.each(res.mlist,function(i,v){
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
						img="<img class='profile' alt=''../images/기본프로필.png' src='../images/기본프로필.png'>"
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
					
					if(i==res.mlist.length-1){
						datespan.text(elapsedTime(v.message_cdate));
						$("#typing").empty();
						$("#typing").append($("<textarea rows='5' cols='80'></textarea>")).append($("<button id='send'>전송</button>"))
					}
				})
				
				$("#chat").scrollTop($("#chat")[0].scrollHeight);
				websocketConnect(room_id);
			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		})
	})
	

	
    
    
    $(document).on("click","#send",function(){
    	
        if ($("textarea").val() == "") {
        	alert("비었음")
        } else {

	        message={
	        			"sender" : user ,
	        			"reciever" : otheruser,
	        			"message" : $("textarea").val(),
	        			"room_id" : room_id
	        		}
	        webSocket.send(JSON.stringify(message));
	        $("#"+room_id).find("p").text($("textarea").val())
	        $("#"+room_id).find(".date").text("방금전");
	        $("textarea").val("");
	        $("#chat").scrollTop($("#chat")[0].scrollHeight);
	        
	        
    	}
    })
	
	
})
</script>
<style type="text/css">

#box{
	display:flex;
	width: 1000px;
	height: 700px;
	margin: 0 auto;
	border-radius: 12px;
}
#chatList{
	flex: 1;
	overflow: auto;
	border: 2px solid gray;
	border-radius: 12px;
}

#chatRoom{
	flex: 2;
	display: flex;
	flex-direction: column;
	border:2px solid gray;
	border-left: 1px;
	border-radius: 12px;
}
#tboard{
	flex: 1
}
#chat{
	flex: 3;
	overflow: auto;
	padding: 10px;
}
#chat::-webkit-scrollbar {
  display: none;
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
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	height: 70px;
}
.rooms:last-child{
	border-bottom:2px solid gray;
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
	margin-left: 20px;
}
.timg{
	flex:0.8;
	width: 70px;
	height: 70px;
	border-radius: 4px;
	
}
.tcon{
	flex: 4;
	margin-left: 20px;
}
.tdiv{
	display: flex;
	padding-left: 20px;
	justify-content: center;
	align-items: center;
	margin-top: 3px;
}
.ynick{
	margin-left: 20px;
}
.tboardprofile{
	display: flex;
	align-items: center;
	padding-left: 20px;
}
.tboardcon{
	margin-bottom: 10px;
}
.state{
	background: rgb(48,209,88);
	border-radius: 4px;
	margin-right: 10px;
	padding: 0 15px;
	color: white;
}
.price{
	font-weight: bold;
}
.nread{
	display:inline-block;
	background: red;
	border-radius: 100%;
	padding: 2px 8px;
}
.ymessage{
	text-align: left;
	
}
.mmessage{
	text-align: right;
	justify-content: flex-end;
}
.m{
	min-height: 62px;
	display: flex;
	align-items: center;
}
.date{
	display:inline-block;
}
#typing{
	text-align: center;
}
textarea {
	margin-top: 10px;
	border: 1px solid gray;
    resize: none;	
}
.chatdate{
	text-align: center;
}
.roomactive{
	background: rgb(208, 225, 225)
}
.mcont{
	margin: 0 10px;
	border: 2px solid black;
	padding: 5px;
	border-radius: 8px;
}
.mdate{
	font-size: 12px;
}
.mread{
	font-size: 12px;
	margin: 0 5px;
	color:  rgb(255, 204,0);
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
			<hr>
			<div id="chat"></div>
			<hr>
			<div id="typing">
			</div>
		</div>
	</div>
		<%@ include file="/module/footer.jsp"%>
	</div>
</body>
</html>