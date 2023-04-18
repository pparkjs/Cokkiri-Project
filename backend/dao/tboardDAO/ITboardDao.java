package dao.tboardDAO;

import java.util.List;
import java.util.Map;

import vo.CategoryVO;
import vo.TBoardVO;
import vo.TImageVO;
import vo.MypageTboardVO;

public interface ITboardDao {
	

	                    
	public List<TBoardVO>selecttboardsByPage(Map<String, Object> map);
       
	public TBoardVO selecttboardInfo(Long board_id);
	                    
	                    
	public List<TImageVO> selecttImgBytboardId(Long board_id);
	
	
	public int selectMylistNum(Long board_id);
	
	public TBoardVO selectTboardInfo(Long board_id);
	
	public int incrementHit(Long board_id);
	
	public Long selectTboardcnt();
	
	public List<CategoryVO> selectCategory();
	
	public int selectTnotify(Map<String,Object> map);
	
	public int selectMylist(Map<String,Object> map);
	
	public String selectCategoryName(String category_id);
	
	public int insertImage(TImageVO tImageVO); 
	
	public int insertTboard(TBoardVO tBoardVO);
	
	public TImageVO selectImage(Long imageNo);
	
	public int insertMylist(Map<String, Object> map);
	
	public int insertTnotify(Map<String,Object> map);
 
	public int deleteMylist(Map<String, Object> map);
	
	public int deleteTnotify(Map<String,Object> map);
	
	public int deleteTboard(Long tboard_id);
	
	public int updateTboard(TBoardVO tBoardVO);
	
	public int deleteTimages(Long tboard_id);
	
	public List<TBoardVO>selecttboardsByPagefromOne(Map<String, Object> map);
	
	public List<TBoardVO> selectTboardRecommend(Map<String, Object> map);
	
	// 좋아요한 회원만 불러오기
	public List<MypageTboardVO> selectMyWishList(Map<String, Object> map);
	
	// 사용자가 올린 게시글만 보기
	public List<MypageTboardVO> selectMyTboardList(Map<String, Object> map);
	
	// 판매완료 날짜 업데이트
	public int updateTboardCompleteDate(int tboard_id);
	
	// 판매완료 취소
	public int updateTboardCompleteDateNull(int tboard_id);
	
	// 게시글 번호로 판매상태 찾기
	public String selectTboardState(int tboard_id);

	public int selectTnotifys(Long tboard_id);

}
