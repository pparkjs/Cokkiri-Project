package dao.sboardDAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.SboardVO;

public class SboardDAOImpl implements ISboardDAO {
	private static ISboardDAO dao;
	
	private SboardDAOImpl()	{}
	
	public static ISboardDAO getInstance() {
		if(dao == null) dao = new SboardDAOImpl();
		return dao;
	}
	
	@Override
	public int sboardInsert(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("sboard.sboardInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int sboardUpdate(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("sboard.sboardUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int sboardDelete(int sbId) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("sboard.sboardDelete", sbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int totalConut(Map<String, Object> map) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("sboard.totalConut", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<SboardVO> selectByMore(Map<String, Object> map) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.selectByMore", map);
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
			res = session.update("sboard.updateHit", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<SboardVO> sboardSelect(String sbId) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.sboardSelect", sbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public int likeInsert(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("sboard.likeInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeCheck(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("sboard.likeCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeDelete(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("sboard.likeDelete", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeByButton(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("sboard.likeByButton", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int likeUpdate(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("sboard.likeUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int disLikeInsert(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("sboard.disLikeInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int disLikeUpdate(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("sboard.disLikeUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public SboardVO viewState(SboardVO vo) {
		SqlSession session = null;
		SboardVO sbVo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			sbVo = session.selectOne("sboard.viewState", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return sbVo;
	}

	@Override
	public int notifyCheck(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("sboard.notifyCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int sboardNotify(SboardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("sboard.sboardNotify", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<SboardVO> selectByMoreMypageLike(Map<String, Object> map) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.selectByMoreMypageLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<SboardVO> selectByMoerMypageUnlike(Map<String, Object> map) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.selectByMoerMypageUnlike", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<SboardVO> selectByMoerMypageMypost(Map<String, Object> map) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.selectByMoerMypageMypost", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public List<SboardVO> selectByMoerMypageMycomment(Map<String, Object> map) {
		SqlSession session = null;
		List<SboardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("sboard.selectByMoerMypageMycomment", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

}
