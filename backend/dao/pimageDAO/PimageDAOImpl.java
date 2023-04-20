package dao.pimageDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.PboardVO;
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
	public int deletePimgByPboardId(int pbId) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("pboard.deletePimgByPboardId", pbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int pimageUpadateByOldName(PimageVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("pboard.pimageUpadateByOldName", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}


	@Override
	public int pimgCount(int pbId) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			res = session.selectOne("pboard.pimgCount", pbId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<PimageVO> selectPimage(int pboard_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<PimageVO> list = session.selectList("selectPimage",pboard_id);
		session.close();
		return list;
	}

	@Override
	public PimageVO selectPimageByNo(int pimg_no) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		PimageVO pimageVO= session.selectOne("selectPimageByNo",pimg_no);
		session.close();
		return pimageVO;
	}

}
