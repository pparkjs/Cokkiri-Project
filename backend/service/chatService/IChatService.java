package service.chatService;

import java.util.List;

import vo.ChatRoomVO;

public interface IChatService {
	public int insertChatRoom(ChatRoomVO chatRoomVO);
    
	public ChatRoomVO selectChatRoomByRid(Long room_id);
	
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id);
	                         
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id);
}
