package service.tboardService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.tboardDAO.TboardDaoImpl;
import vo.CategoryVO;
import vo.MemberVO;
import vo.MypageTboardVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;

public class TboardServiceImpl implements ITboardService {

	private static TboardServiceImpl service;
	private static TboardDaoImpl dao;
	
	private TboardServiceImpl() {
		dao = TboardDaoImpl.getInstance();
	}
	
	public static TboardServiceImpl getInstance() {
		if(service==null) {
			service = new TboardServiceImpl();
		}
		return service;
	}



	@Override
	public int selectMylistNum(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selectMylistNum(board_id);
	}

	@Override
	public List<TImageVO> selecttImgBytboardId(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selecttImgBytboardId(board_id);
	}

	@Override
	public TBoardVO selectTboardInfo(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selecttboardInfo(board_id);
	}

	@Override
	public int incrementHit(Long board_id) {
		// TODO Auto-generated method stub
		return dao.incrementHit(board_id);
	}

	@Override
	public Long selectTboardcnt() {
		// TODO Auto-generated method stub
		return dao.selectTboardcnt();
	}

	@Override
	public List<CategoryVO> selectCategory() {
		// TODO Auto-generated method stub
		return dao.selectCategory();
	}

	@Override
	public int selectTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectTnotify(map);
	}

	@Override
	public int selectMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectMylist(map);
	}

	@Override
	public String selectCategoryName(String category_id) {
		// TODO Auto-generated method stub
		return dao.selectCategoryName(category_id);
	}

	@Override
	public int insertImage(TImageVO tImageVO) {
		// TODO Auto-generated method stub
		return dao.insertImage(tImageVO);
	}

	@Override
	public int insertTboard(TBoardVO tBoardVO) {
		// TODO Auto-generated method stub
		return dao.insertTboard(tBoardVO);
	}

	@Override
	public TImageVO selectImage(Long imageNo) {
		// TODO Auto-generated method stub
		return dao.selectImage(imageNo);
	}

	@Override
	public int insertMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertMylist(map);
	}

	@Override
	public int insertTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertTnotify(map);
	}

	@Override
	public int deleteMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteMylist(map);
	}

	@Override
	public int deleteTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteTnotify(map);
	}

	@Override
	public int deleteTboard(Long tboard_id) {
		// TODO Auto-generated method stub
		return dao.deleteTboard(tboard_id);
	}

	@Override
	public int updateTboard(TBoardVO tBoardVO) {
		// TODO Auto-generated method stub
		return dao.updateTboard(tBoardVO);
	}

	@Override
	public int deleteTimages(Long tboard_id) {
		// TODO Auto-generated method stub
		return dao.deleteTimages(tboard_id);
	}

	@Override
	public List<TBoardVO> selecttboardsByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selecttboardsByPage(map);
	}

	@Override
	public TBoardVO selecttboardInfo(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selectTboardInfo(board_id);
	}

	@Override
	public List<TBoardVO> selecttboardsByPagefromOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selecttboardsByPagefromOne(map);
	}

	@Override
	public List<TBoardVO> selectTboardRecommend(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectTboardRecommend(map);
	}

	@Override
	public List<MypageTboardVO> selectMyWishList(String mem_id, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", mem_id);
		return dao.selectMyWishList(map);
	}

	@Override
	public List<MypageTboardVO> selectMyTboardList(String mem_id, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", mem_id);
		return dao.selectMyTboardList(map);
	}

	@Override
	public int updateTboardCompleteDate(int tboard_id) {
		return dao.updateTboardCompleteDate(tboard_id);
	}

	@Override
	public int updateTboardCompleteDateNull(int tboard_id) {
		return dao.updateTboardCompleteDateNull(tboard_id);
	}

	@Override
	public String selectTboardState(int tboard_id) {
		return dao.selectTboardState(tboard_id);
	}

	

}
