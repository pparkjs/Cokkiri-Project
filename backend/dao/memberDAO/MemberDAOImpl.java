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
	public int memberTelCount(String memTel) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.memberTelCount", memTel);
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int incheck(String memId) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.incheck", memId);
			
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int nicknamecheck(String memNickname) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.nicknamecheck", memNickname);
		} finally {
			session.close();
		}
		return cnt;
  }
  
	public int selectIsMember(String id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("member.selectIsMember",id);
		session.close();
		
		return res;
		
	}

	@Override
	public MemberVO selectMemberinfo(String memId) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		MemberVO memberVO = session.selectOne("member.selectMemberinfo",memId);
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

	@Override
	public int selectIdPassCheck(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("member.selectIdPassCheck", memVo);
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public String selectAuth(String memId) {
		SqlSession session = null;
		String auth = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			auth = session.selectOne("member.selectAuth", memId);
		} finally {
			session.close();
		}
		return auth;
	}

}
