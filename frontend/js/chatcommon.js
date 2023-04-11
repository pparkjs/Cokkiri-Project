/**
 * 
 */

 function messageTime(cdate){
	 console.log(cdate);
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
		return messageDate+('0'+h).slice(-2)+cdate[1].substr(2,3)
		
	}
	
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
		      return `${betweenTime}${value.name} 전`;
		    }
		  }
		  return '방금 전';
		}
		
		

	function websocketConnect(){

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
			 webSocket.send(JSON.stringify(confirmmessage));
	    };
	    webSocket.onmessage = function(event) {
	    	
	        onMessage(event)
	        
	    };
	    
	    confirmmessage={
    			"croom_id": room_id,
    			"sender" : mmem_id,
    			"reciever":ymem_id
    		}

	}