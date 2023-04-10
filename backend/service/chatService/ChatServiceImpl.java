package service.chatService;

import java.util.List;

import dao.chatDAO.ChatDaoImpl;
import dao.chatDAO.IChatDao;
import vo.ChatRoomVO;

public class ChatServiceImpl implements IChatService {
	private static IChatService service;
	private static IChatDao dao;
	private ChatServiceImpl() {
		dao = ChatDaoImpl.getInstance();
	}
	
	public static IChatService getInstance() {
		if(service==null) {
			service = new ChatServiceImpl();
		}
		return service;
	}

	@Override
	public int insertChatRoom(ChatRoomVO chatRoomVO) {
		return dao.insertChatRoom(chatRoomVO);
	}

	@Override
	public ChatRoomVO selectChatRoomByRid(Long room_id) {
		return dao.selectChatRoomByRid(room_id);
	}

	@Override
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
