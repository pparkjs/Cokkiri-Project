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
import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.ChatMessageVO;
import vo.ChatRoomVO;
import vo.MemberVO;
import vo.WebMessageVO;
 
@ServerEndpoint("/Chatting")
public class Chatting {
    private static Map<Long,Map<String,Session>> rooms = Collections.synchronizedMap(new HashMap<>());
    private static Map<String,Session> user = Collections.synchronizedMap(new HashMap<>());
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	Gson gson = new Gson();
    	ChatMessageVO chatMessageVO = gson.fromJson(message, ChatMessageVO.class);
    	IChatService service = ChatServiceImpl.getInstance();
        synchronized(rooms) {
        	if(chatMessageVO.getCroom_id()!=null) {
        		int size = rooms.get(chatMessageVO.getCroom_id()).size();
        		int res=0;
        		if(size==2) {
        			res=1;
        			chatMessageVO.setRes(res);
        			String json = gson.toJson(chatMessageVO);
        			rooms.get(chatMessageVO.getCroom_id()).get(chatMessageVO.getReciever()).getBasicRemote().sendText(json);
        		}else if(size==1) {
        			res=0;
        		}
        		
        	}
        	else if(rooms.containsKey(chatMessageVO.getRoom_id())) {
        		if(rooms.get(chatMessageVO.getRoom_id()).containsKey(chatMessageVO.getReciever())) {
        			chatMessageVO.setMessage_content(chatMessageVO.getMessage());
        			chatMessageVO.setMem_id(chatMessageVO.getSender());
            		chatMessageVO.setMem_id(chatMessageVO.getSender());
            		chatMessageVO.setMessage_isread("y");
            		chatMessageVO.setRoom_id(chatMessageVO.getRoom_id());
            		int res = service.insertChatMessage(chatMessageVO);
            		if(res==0) {
            			System.out.println("상대가 room 접속 했을때 웹소켓 메시지 db저장 실패");
            		}
        			chatMessageVO.setNoread(0);
        			String json = gson.toJson(chatMessageVO);
        			rooms.get(chatMessageVO.getRoom_id()).get(chatMessageVO.getSender()).getBasicRemote().sendText(json);
        			rooms.get(chatMessageVO.getRoom_id()).get(chatMessageVO.getReciever()).getBasicRemote().sendText(json);
 
        		}else if(user.containsKey(chatMessageVO.getReciever())&&rooms.get(chatMessageVO.getRoom_id()).size()==1){
        			chatMessageVO.setMessage_content(chatMessageVO.getMessage());
        			chatMessageVO.setMem_id(chatMessageVO.getSender());
        			chatMessageVO.setMem_id(chatMessageVO.getSender());
	        		chatMessageVO.setMessage_isread("n");
	        		chatMessageVO.setRoom_id(chatMessageVO.getRoom_id());
	        		int res = service.insertChatMessage(chatMessageVO);
	        		IMemberService service2 = MemberServiceImpl.getInstance();
	        		MemberVO memberVO = service2.selectMemberinfo(chatMessageVO.getSender());
	        		chatMessageVO.setYmem(memberVO);
	        		if(res==0) {
	        			System.out.println("상대가 room 접속 안했지만 user에는 있을때 웹소켓 메시지 db저장 실패");
	        		}
	        		chatMessageVO.setNoread(1);
	        		String json = gson.toJson(chatMessageVO);
	        		rooms.get(chatMessageVO.getRoom_id()).get(chatMessageVO.getSender()).getBasicRemote().sendText(json);
        			user.get(chatMessageVO.getReciever()).getBasicRemote().sendText(json);
        		}else{
        			chatMessageVO.setMessage_content(chatMessageVO.getMessage());
        			chatMessageVO.setMem_id(chatMessageVO.getSender());
        			chatMessageVO.setMem_id(chatMessageVO.getSender());
	        		chatMessageVO.setMessage_isread("n");
	        		chatMessageVO.setRoom_id(chatMessageVO.getRoom_id());
	        		int res = service.insertChatMessage(chatMessageVO);
	        		if(res==0) {
	        			System.out.println("상대가 room 접속 안했고 user에도 없을때 웹소켓 메시지 db저장 실패");
	        		}
	        		chatMessageVO.setNoread(1);
	        		String json = gson.toJson(chatMessageVO);
	        		rooms.get(chatMessageVO.getRoom_id()).get(chatMessageVO.getSender()).getBasicRemote().sendText(json);
	        		
        		}
        		
        	}

        		
        	
        	
        	
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
    	if(session.getRequestParameterMap().size()==1) {
    		
    	}else {
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
    	}
    	
    	user.put(session.getRequestParameterMap().get("mem_id").get(0),session);
    	
        
    }
    
    @OnClose
    public void onClose(Session session) {
    	if(session.getRequestParameterMap().size()==1) {
   
    	}else {
    		String sroom_id=session.getRequestParameterMap().get("room_id").get(0);
	         String mem_id = session.getRequestParameterMap().get("mem_id").get(0);
	         long room_id = Long.parseLong(sroom_id);
	         rooms.get(room_id).remove(mem_id);
	         if(rooms.get(room_id).size()==0) {
	        	 rooms.remove(room_id);
	         }
    	}
    	user.remove(session.getRequestParameterMap().get("mem_id").get(0));

    }
}

