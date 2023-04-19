package dao.scommentDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.ScommentVO;

public class ScommentDAOImpl implements IScommentDAO{
	private static ScommentDAOImpl dao;
	
	public static ScommentDAOImpl getInstance() {
		if(dao == null) dao = new ScommentDAOImpl();
		return dao;
	}
	
	@Override
	public int insertScomment(ScommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt  = session.insert("scomment.insertScomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ScommentVO> getAllScomment(ScommentVO vo) {
		SqlSession session = null;
		List<ScommentVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("scomment.getAllScomment", vo);
			System.out.println("dao list=" + list);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public ScommentVO getScomment(int scomment_id) {
		SqlSession session = null;
		ScommentVO vo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("scomment.getScomment", scomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}


	@Override
	public int updateScommentIsremove(int scomment_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("scomment.updateScommentIsremove",scomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateScomment(ScommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("scomment.updateScomment",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}


	@Override
	public List<ScommentVO> scommendWritedCheck(ScommentVO vo) {
		SqlSession session = null;
		List<ScommentVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("scomment.scommendWritedCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public int insertScommentByWrited(ScommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("scomment.insertScommentByWrited", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}
	
	

	

	
}
