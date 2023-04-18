package dao.tcommentDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.TcommentVO;

public class TcommentDAOImpl implements ITcommentDAO{
	private static TcommentDAOImpl dao;
	
	public static TcommentDAOImpl getInstance() {
		if(dao == null) dao = new TcommentDAOImpl();
		return dao;
	}
	
	@Override
	public int insertTcomment(TcommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt  = session.insert("tcomment.insertTcomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<TcommentVO> getAllTcomment(TcommentVO vo) {
		SqlSession session = null;
		List<TcommentVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("tcomment.getAllTcomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public TcommentVO getTcomment(int tcomment_id) {
		SqlSession session = null;
		TcommentVO vo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("tcomment.getTcomment", tcomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}

	/*
	 * @Override public int selectChildIsExist(int tcomment_id) { SqlSession session
	 * = null; int cnt = 0; try { session =
	 * MybatisSqlSessionFactory.getSqlSession(); cnt =
	 * session.selectOne("tcomment.selectChildIsExist",tcomment_id); } catch
	 * (Exception e) { e.printStackTrace(); }finally { session.close(); } return
	 * cnt; }
	 */

	@Override
	public int updateTcommentIsremove(int tcomment_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("tcomment.updateTcommentIsremove",tcomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateTcomment(TcommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("tcomment.updateTcomment",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateTcommentSecret(int tcomment_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("tcomment.updateTcommentSecret", tcomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return 0;
	}
	
	

	

	
}
