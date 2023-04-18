package dao.pboardDAO;

import java.util.List;
import java.util.Map;

import vo.PboardVO;

public interface IPboardDAO {
	
	//게시글 작성
	public int insertBoard(PboardVO vo);
	
	//게시글 수정
	public int updateBoard(PboardVO vo);
	
	//게시글 삭제
	public int deleteBoard(int boardId);
		
	// 해당 Id 게시글 보기
	public List<PboardVO> selectById(String memId);
	
	//더보기 페이지
	public List<PboardVO> selectByPage(Map<String, Object> map); 
	
//	//맵 위치 
//	public Map<String, Object> saveLocation(double lat, double lng);
		
	//조회수 증가
	public int updateHit(int num);
	
	// 좋아요 
	
	// 싫어요 
	
	
	
	
	
	
	
}
