package dao.headerDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.AlarmVO;

public class HeaderDaoImpl implements IHeaderDao {
	private static IHeaderDao dao;
	
	private HeaderDaoImpl() {
		
	}
	
	public static IHeaderDao getInstance() {
		if(dao==null) {
			dao = new HeaderDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public List<AlarmVO> selectChatAlarm(String mem_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<AlarmVO> list = session.selectList("selectChatAlarm",mem_id);
		session.close();
		return list;
	}

}
