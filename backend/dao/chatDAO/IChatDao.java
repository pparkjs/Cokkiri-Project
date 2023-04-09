package dao.chatDAO;

import java.util.List;

import vo.ChatRoomVO;

public interface IChatDao {
	
	public int insertChatRoom(ChatRoomVO chatRoomVO);
	                         
	public ChatRoomVO selectChatRoomByRid(Long room_id);
	
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id);
	                         
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id);
}
