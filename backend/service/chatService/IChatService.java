package service.chatService;

import java.util.List;
import java.util.Map;

import vo.ChatMessageVO;
import vo.ChatRoomDetailVO;
import vo.ChatRoomVO;

public interface IChatService {
	public int insertChatRoom(ChatRoomVO chatRoomVO);
    
	public ChatRoomVO selectChatRoomByRid(Long room_id);
	
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id);
	                         
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id);
	
	public ChatMessageVO selectLastMessageByRid(Long Rid);
    
	public int selectNoReadMessageCnt(Map<String, Object> map); 
	
	public List<ChatMessageVO> selectChatMessageByRoomId(Long room_id);
}
