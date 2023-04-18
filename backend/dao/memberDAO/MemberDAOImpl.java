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

	@Override
	public int selectIsMember(String id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("member.selectIsMember",id);
		session.close();
		
		return res;
		
	}

	@Override
	public MemberVO selectMemberinfo(String mem_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		MemberVO memberVO = session.selectOne("member.selectMemberinfo",mem_id);
		session.close();
		
		return memberVO;
	}

	@Override
	public MemberVO selectMemberinfoByNick(String nickname) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		MemberVO memberVO = session.selectOne("member.selectMemberinfoByNick",nickname);
		session.close();
		
		
		return memberVO;
	}

}
