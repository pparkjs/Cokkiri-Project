package dao.chatDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
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
		List<ChatRoomVO> list = session.selectOne("selectChatRoomByTid",tboard_id);
		session.close();
		return list;
	}

	@Override
	public List<ChatRoomVO> selectChatRoomListByMid(String mem_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<ChatRoomVO> list = session.selectOne("selectChatRoomListByMid",mem_id);
		session.close();
		return list;
	}

}
