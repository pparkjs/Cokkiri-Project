package service.chatService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.chatDAO.ChatDaoImpl;
import dao.chatDAO.IChatDao;
import vo.ChatMessageVO;
import vo.ChatRoomDetailVO;
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
		return dao.selectChatRoomByTid(tboard_id);
	}

	@Override
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id) {
		// TODO Auto-generated method stub
		return dao.selectChatRoomListByMid(mem_id);
	}

	@Override
	public ChatMessageVO selectLastMessageByRid(Long Rid) {
		// TODO Auto-generated method stub
		return dao.selectLastMessageByRid(Rid);
	}

	@Override
	public int selectNoReadMessageCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectNoReadMessageCnt(map);
	}

	@Override
	public List<ChatMessageVO> selectChatMessageByRoomId(Long room_id) {
		// TODO Auto-generated method stub
		return dao.selectChatMessageByRoomId(room_id);
	}



}
