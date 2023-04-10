package dao.chatDAO;

import java.util.List;
import java.util.Map;

import vo.ChatMessageVO;
import vo.ChatRoomVO;

public interface IChatDao {
	
	public int insertChatRoom(ChatRoomVO chatRoomVO);
	                         
	public ChatRoomVO selectChatRoomByRid(Long room_id);
	
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id);
	                         
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id);

	public ChatMessageVO selectLastMessageByRid(Long Rid);
	                               
	public int selectNoReadMessageCnt(Map<String, Object> map); 
	
	public List<ChatMessageVO> selectChatMessageByRoomId(Long room_id);
	
	public int updateChatRead(Map<String, Object> map);
	
	public int insertChatMessage(ChatMessageVO chatMessageVO);
	
}
