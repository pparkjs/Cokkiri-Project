package dao.tboardDAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.CategoryVO;
import vo.MemberVO;
import vo.TBoardVO;
import vo.TImageVO;

public class TboardDaoImpl implements ITboardDao{
	private static TboardDaoImpl dao;
	
	private TboardDaoImpl () {
		
	}
	
	public static TboardDaoImpl getInstance() {
		if(dao==null) {
			dao = new TboardDaoImpl();
		}		
		return dao;
	}
	
	
	                      
	                      
	public List<TBoardVO> selecttboardsByPage(Map<String, Object> map){
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<TBoardVO> list = session.selectList("selecttboardsByPage",map);
		session.close();
		return list;
	}
	  
	
                 
                  
	public TBoardVO selecttboardInfo(Long board_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		TBoardVO boardVO = session.selectOne("selecttboardInfo",board_id);
		session.close(); 
		
		return boardVO;
	}
	                      
	public List<TImageVO> selecttImgBytboardId(Long board_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<TImageVO> list = session.selectList("selecttImgBytboardId", board_id);
		session.close();
		
		return list;
	}


	@Override
	public int selectMylistNum(Long board_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int num = session.selectOne("selectMylistNum",board_id);
		session.close();
		return num;
	}

	@Override
	public TBoardVO selectTboardInfo(Long board_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		TBoardVO tBoardVO = session.selectOne("selectTboardInfo", board_id);
		session.close();
		return tBoardVO;
	}

	@Override
	public int incrementHit(Long board_id) {
		SqlSession session= MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("incrementHit",board_id);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public Long selectTboardcnt() {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		Long cnt = session.selectOne("selectTboardcnt");
		session.close();
		
		return cnt;
	}

	@Override
	public List<CategoryVO> selectCategory() {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<CategoryVO> list = session.selectList("selectCategory");
		session.close();
		
		return list;
	}

	@Override
	public int selectTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("selectTnotify",map);
		session.close();
		return res;
	}

	@Override
	public int selectMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("selectMylist",map);
		session.close();
		return res;
	}

	@Override
	public String selectCategoryName(String category_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		String name = session.selectOne("selectCategoryName",category_id);
		session.close();
		
		return name;
	}

	@Override
	public int insertImage(TImageVO tImageVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertImage",tImageVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int insertTboard(TBoardVO tBoardVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertTboard",tBoardVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public TImageVO selectImage(Long imageNo) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		TImageVO tImageVO = session.selectOne("selectImage",imageNo);
		session.close();
		return tImageVO;
	}

	@Override
	public int insertMylist(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertMylist",map);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int insertTnotify(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertTnotify",map);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteMylist(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteMylist",map);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteTnotify(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteTnotify",map);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteTboard(Long tboard_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteTboard",tboard_id);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int updateTboard(TBoardVO tBoardVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("updateTboard",tBoardVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteTimages(Long tboard_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteTimages",tboard_id);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public List<TBoardVO> selecttboardsByPagefromOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<TBoardVO> list = session.selectList("selecttboardsByPagefromOne",map);
		session.close();
		return list;
	}

	@Override
	public List<TBoardVO> selectTboardRecommend(Map<String, Object> map) {
		SqlSession session =MybatisSqlSessionFactory.getSqlSession();
		List<TBoardVO> res = session.selectList("selectTboardRecommend",map);
		session.close();
		return res;
	}





	
}
