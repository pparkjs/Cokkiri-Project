package dao.pboardDAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.PboardVO;
import vo.SboardVO;

public class PboardDAOImpl implements IPboardDAO {
	private static IPboardDAO dao;
	 
	private PboardDAOImpl() {}
	
	public static IPboardDAO getInstance() {
		if(dao == null) dao = new PboardDAOImpl();
		return dao;
	}
	
	
	@Override
	public int insertBoard(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("pboard.insertBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateBoard(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("pboard.updateBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteBoard(int pbId) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("pboard.deleteBoard", pbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<PboardVO> pboardSelect(String pbId) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.pboardSelect", pbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;		
	}


	@Override
	public int updateHit(int num) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("pboard.updateHit", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<PboardVO> selectByPage(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.selectByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
		
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("pboard.totalConut", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	
	@Override
	public int likeInsert(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("pboard.likeInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeCheck(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("pboard.likeCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeByButton(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("pboard.likeByButton", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeUpdate(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("pboard.likeUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeDelete(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("pboard.likeDelete", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int disLikeInsert(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("pboard.disLikeInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int disLikeUpdate(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("pboard.disLikeUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public PboardVO viewState(PboardVO vo) {
		SqlSession session = null;
		PboardVO pbVo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			pbVo = session.selectOne("pboard.viewState", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return pbVo;
	}

	@Override
	public int notifyCheck(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("pboard.notifyCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int pboardNotify(PboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("pboard.pboardNotify", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<PboardVO> notifyByMore(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.notifyByMore", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<PboardVO> selectMyLike(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.selectMyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<PboardVO> selectMyUnLike(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.selectMyUnLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<PboardVO> selectMyWrite(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.selectMyWrite", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<PboardVO> selectMyComment(Map<String, Object> map) {
		SqlSession session = null;
		List<PboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("pboard.selectMyComment", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}


}
