package dao.pcommentDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.PcommentVO;
import vo.TcommentVO;

public class PcommentDAOImpl implements IPcommentDAO {
	private static PcommentDAOImpl dao;
	
	public static PcommentDAOImpl getInstance() {
		if(dao == null) dao = new PcommentDAOImpl();
		return dao;
	}
	
	@Override
	public int insertPcomment(PcommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("pcomment.insertPcomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<PcommentVO> getAllPcomment(PcommentVO vo) {
		SqlSession session = null;
		List<PcommentVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pcomment.getAllPcomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public PcommentVO getPcomment(int pcomment_id) {
		SqlSession session = null;
		PcommentVO vo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("pcomment.getPcomment",pcomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}

	@Override
	public int updatePcommentIsremove(int pcomment_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("pcomment.updatePcommentIsremove",pcomment_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updatePcomment(PcommentVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("pcomment.updatePcomment", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}
	
}
