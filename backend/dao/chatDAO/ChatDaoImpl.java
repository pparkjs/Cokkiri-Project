package dao.chatDAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.ChatMessageVO;
import vo.ChatRoomVO;

public class ChatDaoImpl implements IChatDao {
	private static IChatDao dao;
	
	private ChatDaoImpl() {
		
	}
	
	public static IChatDao getInstance() {
		if(dao==null) {
			dao = new ChatDaoImpl();
		}
		return dao;
	}
	
	@Override
	public int insertChatRoom(ChatRoomVO chatRoomVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertChatRoom",chatRoomVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public ChatRoomVO selectChatRoomByRid(Long room_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		ChatRoomVO chatRoomVO = session.selectOne("selectChatRoomByRid",room_id);
		session.close();
		return chatRoomVO;
	}

	@Override
	public List<ChatRoomVO> selectChatRoomByTid(Long tboard_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<ChatRoomVO> list = session.selectList("selectChatRoomByTid",tboard_id);
		session.close();
		return list;
	}

	@Override
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<ChatRoomVO> list = session.selectList("selectChatRoomListByMid",mem_id);
		session.close();
		return list;
	}

	@Override
	public ChatMessageVO selectLastMessageByRid(Long Rid) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		ChatMessageVO chatMessageVO = session.selectOne("selectLastMessageByRid",Rid);
		session.close();
		return chatMessageVO;
	}

	@Override
	public int selectNoReadMessageCnt(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("selectNoReadMessageCnt",map);
		session.close();
		return res;
	}

	@Override
	public List<ChatMessageVO> selectChatMessageByRoomId(Long room_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<ChatMessageVO> list = session.selectList("selectChatMessageByRoomId",room_id);
		session.close();
		return list;
	}

	@Override
	public int updateChatRead(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("updateChatRead",map);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int insertChatMessage(ChatMessageVO chatMessageVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertChatMessage",chatMessageVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public ChatRoomVO selectChatRoomByMidTid(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		ChatRoomVO res = session.selectOne("selectChatRoomByMidTid",map);
		session.close();
		return res;
	}

	@Override
	public ChatMessageVO selectChatMessageByCid(Long message_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		ChatMessageVO chatMessageVO = session.selectOne("selectChatMessageByCid", message_id);
		session.close();
		return chatMessageVO;
	}
	
	

}
