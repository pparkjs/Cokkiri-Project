package controller.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import service.chatService.ChatServiceImpl;
import service.chatService.IChatService;
import vo.ChatMessageVO;
import vo.WebMessageVO;
 
@ServerEndpoint("/Chatting")
public class Chatting {
    private static Map<Long,Map<String,Session>> rooms = Collections.synchronizedMap(new HashMap<>());
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
    	Gson gson = new Gson();
    	WebMessageVO wmessage = gson.fromJson(message, WebMessageVO.class);
    	IChatService service = ChatServiceImpl.getInstance();
        synchronized(rooms) {
        	if(wmessage.getCroom_id()!=null) {
        		int size = rooms.get(wmessage.getCroom_id()).size();
        		int res=0;
        		if(size==2) {
        			res=1;
        			String json = "{\"res\":"+res+"}";
        			rooms.get(wmessage.getCroom_id()).get(wmessage.getReciever()).getBasicRemote().sendText(json);
        		}else if(size==1) {
        			res=0;
        		}
        		
        	}
        	else if(rooms.containsKey(wmessage.getRoom_id())) {
        		if(rooms.get(wmessage.getRoom_id()).containsKey(wmessage.getReciever())) {

            		ChatMessageVO chatMessageVO = new ChatMessageVO();
            		chatMessageVO.setMem_id(wmessage.getSender());
            		chatMessageVO.setMessage_content(wmessage.getMessage());
            		chatMessageVO.setMessage_isread("y");
            		chatMessageVO.setRoom_id(wmessage.getRoom_id());
            		System.out.println(chatMessageVO);
            		int res = service.insertChatMessage(chatMessageVO);
            		if(res==0) {
            			System.out.println("상대 접속 했을때 웹소켓 메시지 db저장 실패");
            		}
        			wmessage.setNoread(0);
        			String json = gson.toJson(wmessage);
        			rooms.get(wmessage.getRoom_id()).get(wmessage.getSender()).getBasicRemote().sendText(json);
        			rooms.get(wmessage.getRoom_id()).get(wmessage.getReciever()).getBasicRemote().sendText(json);
 
        		}else {
        			ChatMessageVO chatMessageVO = new ChatMessageVO();
	        		chatMessageVO.setMem_id(wmessage.getSender());
	        		chatMessageVO.setMessage_content(wmessage.getMessage());
	        		chatMessageVO.setMessage_isread("n");
	        		chatMessageVO.setRoom_id(wmessage.getRoom_id());
	        		int res = service.insertChatMessage(chatMessageVO);
	        		if(res==0) {
	        			System.out.println("상대 접속 안했을때 웹소켓 메시지 db저장 실패");
	        		}
	        		wmessage.setNoread(1);
	        		String json = gson.toJson(wmessage);
	        		rooms.get(wmessage.getRoom_id()).get(wmessage.getSender()).getBasicRemote().sendText(json);
	        		
        		}
        		
        	}

        		
        	
        	
        	
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {

        String sroom_id=session.getRequestParameterMap().get("room_id").get(0);
        String mem_id = session.getRequestParameterMap().get("mem_id").get(0);
        

        long room_id = Long.parseLong(sroom_id);
        if(rooms.containsKey(room_id)) {
        	rooms.get(room_id).put(mem_id, session);
        }else {
        	Map<String, Session> map = new HashMap<>();
        	rooms.put(room_id, map);
        	rooms.get(room_id).put(mem_id, session);
        }
        System.out.println("소켓 시작");
        System.out.println(rooms.toString());
        
    }
    
    @OnClose
    public void onClose(Session session) {
    	 String sroom_id=session.getRequestParameterMap().get("room_id").get(0);
         String mem_id = session.getRequestParameterMap().get("mem_id").get(0);
         long room_id = Long.parseLong(sroom_id);
         rooms.get(room_id).remove(mem_id);
         if(rooms.get(room_id).size()==0) {
        	 rooms.remove(room_id);
         }
         System.out.println("소켓종료");
         System.out.println(rooms.toString());
    }
}

