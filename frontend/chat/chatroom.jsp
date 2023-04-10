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
			})
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
	
	
	function chatListReload(){
		$.ajax({
			url: "<%=request.getContextPath()%>/chatRoom.do",
			type: "post",
			dataType: "json",
			success: function(res) {
				$.each(res,function(i,v){
					curclass=$("#"+v.chatRoomVO.room_id+"").find(".pspan").find("div")
					
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
					
					
				})
			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		})
	}
	

    confirmChatrooms=setInterval(function(){
    	chatListReload()
    }, 1000)
	
	
	$(document).on("click",".rooms",function(){
		
		$(".rooms").removeClass("roomactive");
		$(this).addClass("roomactive");
		
		$(".nread",this).addClass("date");
		$(".date",this).removeClass("nread");
		datespan=$(".date",this);
		room_id=$(this).attr("id");
		chat=$("#chat")
		chat.empty();
		$.ajax({

			url: "<%=request.getContextPath()%>/chatmessage.do",
			type: "post",
			data:{"room_id":room_id,"yournick":$(this).find(".chatinfo h3").text()},
			dataType: "json",
			success: function(res) {
				tcode='<div class="tboardprofile"><img class="profile" alt="../images/기본프로필.png" src="../images/기본프로필.png"><h4 class="ynick">'+res.yourMember.mem_nickname+'</h4></div>'
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
					
					h = new Date(cdate)
					h=h.getHours()
					
					if(h<12){
						messageDate="오전 "
					}else{
						messageDate="오후 "
					}
					if(h!=12){
						h=h%12;
					}
					messageDate=messageDate+('0'+h).slice(-2)+cdate[1].substr(2,3)
					
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
				websocketConnect();
			},
			error: function(xhr) {
				alert("상태: " + xhr.status)
			}
		})
	})
	
	webflag=false;
	confirmread=null;
	function websocketConnect(){
		if(confirmread!=null){
			clearInterval(confirmread);
			confirmread=null;
		}
		if(webflag){
			webSocket.close();
		}
		
		text = $('textarea').val();
		otheruser = ymem_id;
		user = mmem_id;

		
		webSocket = new WebSocket('ws://localhost:8090/cokkiri/Chatting?room_id='+room_id+"&mem_id="+user);
	    inputMessage = $("textarea");
	    
	    webSocket.onerror = function(event) {
	        onError(event)
	    };
	    webSocket.onopen = function(event) {
			webflag=true;
	    };
	    webSocket.onmessage = function(event) {
	    	
	        onMessage(event)
	        
	    };
	    
	    confirmmessage={
    			"croom_id": room_id,
    			"sender" : mmem_id
    		}
    	
	    confirmread=setInterval(function(){
	    	webSocket.send(JSON.stringify(confirmmessage));
	    }, 1000)
	}
	
	
	function onMessage(event) {
    	
        var message = JSON.parse(event.data)
        
        if(message.res!=null){
        	if(message.res==1){
        		$("#chat .mread").text("");
        	}
        }
        else if (message.message == "") {
            
        } else {
        	today = new Date();   
			curdate = today.getFullYear()+"-"+('0' + (today.getMonth() + 1)).slice(-2)+"-"+('0' + today.getDate()).slice(-2);
			curtime = ('0' + today.getHours()).slice(-2)+":"+('0' + today.getMinutes()).slice(-2)+":"+('0' + today.getSeconds()).slice(-2)
			
			lastdate=date
			if(curdate!=lastdate){
				p=$("<p class='chatdate'>"+curdate+"</p>");
				chat.append(p);
				lastdate=curdate;
			}
			if(message.noread==1){		
				isread="<span class='mread'>1</span>"
				message = $("<div class='m mmessage' id='"+message.message_id+"'><span class='mcont'> "+isread+message.message+"</span><span class='mdate'>"+curtime+"</span></div> ")
				chat.append(message);
				$("#chat").scrollTop($("#chat")[0].scrollHeight);
			}else{
				img="<img class='profile' alt=''../images/기본프로필.png' src='../images/기본프로필.png'>"
	
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
    
    
    $(document).on("click","#send",function(){
    	
        if ($("textarea").val() == "") {
        	alert("비었음")
        } else {
           
        }
        
        message={
        			"sender" : user ,
        			"reciever" : otheruser,
        			"message" : $("textarea").val(),
        			"room_id" : room_id
        		}
        webSocket.send(JSON.stringify(message));
        $("textarea").val("");
        $("#chat").scrollTop($("#chat")[0].scrollHeight);
    	
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
#send{
	gy
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