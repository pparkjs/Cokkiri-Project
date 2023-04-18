package dao.pimageDAO;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.PimageVO;

public class PimageDAOImpl implements IPimageDAO {
	private static IPimageDAO dao;
	
	private PimageDAOImpl() {}
		
	public static IPimageDAO getInstance() {
		if(dao == null) dao = new PimageDAOImpl();		
		return dao;	
	}

	@Override
	public int insertPimage(PimageVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("pboard.insertPimage", vo);
			System.out.println("결과 : "	+ cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deletePimgByPboardId(int pboardId) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("pboard.deletePimgByPboardId", pboardId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updatePimg(PimageVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("pboard.updatePimg", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

}
