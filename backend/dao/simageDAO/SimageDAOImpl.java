package dao.simageDAO;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.SimageVO;

public class SimageDAOImpl implements ISimageDAO {
	
	private static ISimageDAO dao;
	
	private SimageDAOImpl()	{}
	
	public static ISimageDAO getInstance() {
		if(dao == null) dao = new SimageDAOImpl();
		return dao;
	}
	
	@Override
	public int simageInsert(SimageVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			res = session.update("sboard.simageInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return res;
	}

}
