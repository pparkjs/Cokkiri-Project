package service.pboardService;

import java.util.List;
import java.util.Map;

import vo.PboardVO;

public interface IPboardService {

	//게시글 작성
	public int insertBoard(PboardVO vo);
	
	//게시글 수정
	public int updateBoard(PboardVO vo);
	
	//게시글 삭제
	public int deleteBoard(int pbId);
		
	// 해당 게시글 출력하기 
	public List<PboardVO> pboardSelect(String pbId);
	
	// 전체 게시글 수 구하기
	public int totalCount(Map<String,Object> map);
	
	//더보기 페이지 처리
	public List<PboardVO> selectByPage(Map<String, Object> map); 
			
	//// 더보기, 타입, 검색text 처리할 메소드
	public Map<String, Object> morePage(int more, String vtype, String vtext, String mem_id, String region);
	
	//조회수 증가
	public int updateHit(int num);
	
	//좋아요 눌렀을 때 좋아요 처리하는 메서드
	public int likeInsert(PboardVO vo);
		
	// 좋아요 중복 체크 메서드
	public int likeCheck(PboardVO vo);
		
	// 좋아요 눌러져있는지 체크
	public int likeByButton(PboardVO vo);
		
	// 좋아요 업데이이트 메소드
	public int likeUpdate(PboardVO vo);
		
	// 좋아요 행 삭제
	public int likeDelete(PboardVO vo);
		
	// 싫어요 눌렀을때 싫어요 생성
	public int disLikeInsert(PboardVO vo);
	
	// 싫어요 업데이트 메소드
	public int disLikeUpdate(PboardVO vo);
		
	// 좋아요,싫어요,신고,조회수 상태 조회
	public PboardVO viewState(PboardVO vo);
		
	// 신고 중복 체크
	public int notifyCheck(PboardVO vo);
		
	// 신고하기 메소드
	public int pboardNotify(PboardVO vo);
		
	// 신고게시물의 리스트 - 더보기 페이징
	public List<PboardVO> notifyByMore(Map<String, Object> map);	
	
	// 사용자가 좋아요한 게시물 리스트
		public List<PboardVO> selectMyLike(String memId, int more);
		
	// 사용자가 싫어요한 게시물 리스트
	public List<PboardVO> selectMyUnLike(String memId, int more);
	
	// 사용자가 작성한 게시물 리스트
	public List<PboardVO> selectMyWrite(String memId, int more);
	
	// 사용자가 댓글을 단 게시물 리스트
	public List<PboardVO> selectMyComment(String memId, int more);
		
}
