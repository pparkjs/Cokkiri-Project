package dao.memberDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.MemberVO;

public class MemberDAOImpl implements IMemberDAO {
	private static IMemberDAO dao;
	
	private MemberDAOImpl() {}
	
	public static IMemberDAO getInstance() {
		if(dao==null) dao = new MemberDAOImpl();
		return dao;
	}
	
	@Override
	public List<MemberVO> memberAllList() {
		SqlSession session = null;
		List<MemberVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			list = session.selectList("member.memberAllList");
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

}
