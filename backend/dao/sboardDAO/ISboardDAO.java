package dao.sboardDAO;

import java.util.List;
import java.util.Map;

import vo.SboardVO;

public interface ISboardDAO {
	
	// 게시글 등록하기
	public int sboardInsert(SboardVO vo);
	
	// 게시글 수정하기
	public int sboardUpdate(SboardVO vo);
	
	// 게시글 삭제하기
	public int sboardDelete(SboardVO vo);
	
	// 해당 게시글 출력하기 
	public List<SboardVO> sboardSelect(String sbId);
	
	// 전체 게시글 수 구하기
	public int totalConut(Map<String, Object> map);
	
	//더보기버튼으로 보일 게시글 구하기 - 페이지 처리
	public List<SboardVO> selectByMore(Map<String, Object> map);
	
	//조회수 증가
	public int updateHit(int num);
	
	
}
