package service.tboardService;

import java.util.List;
import java.util.Map;

import vo.CategoryVO;
import vo.MemberVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;

public interface ITboardService {

	public List<TBoardAndAttVO> boardMain(Map<String, Object> map);

	public int selectIsMember(String id);
	
	public MemberVO selectMemberinfo(String mem_id);
		
	public int selectMylistNum(Long board_id);
	
	public List<TImageVO> selecttImgBytboardId(Long board_id);
	
	public TBoardVO selectTboardInfo(Long board_id);
	
	public int incrementHit(Long board_id);
	
	public Long selectTboardcnt();
	
	public List<CategoryVO> selectCategory();
	
	public int selectTnotify(Map<String, Object> map);

	public int selectMylist(Map<String, Object> map);

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
}