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
	public int memberInsert(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.memberInsert", memVo);
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int memberTelCount(String mem_tel) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.memberTelCount", mem_tel);
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int incheck(String mem_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.incheck", mem_id);
			
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int nicknamecheck(String mem_nickname) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.nicknamecheck", mem_nickname);
		} finally {
			session.close();
		}
		return cnt;
	}

}
