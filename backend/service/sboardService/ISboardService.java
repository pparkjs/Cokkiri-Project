package service.sboardService;

import java.util.List;
import java.util.Map;

import vo.SboardVO;

public interface ISboardService {
	// 게시글 등록하기
	public int sboardInsert(SboardVO vo);
	
	// 게시글 수정하기
	public int sboardUpdate(SboardVO vo);
	
	// 게시글 삭제하기
	public int sboardDelete(int sbId);
	
	// 해당 게시글 출력하기 
	public List<SboardVO> sboardSelect(String sbId);
	
	// 전체 게시글 수 구하기
	public int totalConut(Map<String, Object> map);
	
	//더보기버튼으로 보일 게시글 구하기 - 페이지 처리
	public List<SboardVO> selectByMore(Map<String, Object> map);
	
	// 더보기, 타입, 검색text 처리할 메소드
	public Map<String, Object> morePage(int more, String vtype, String vtext, String mem_id);
	
	//조회수 증가
	public int updateHit(int num);
	
	//좋아요 눌렀을 때 좋아요 처리하는 메서드
	public int likeInsert(SboardVO vo);
	
	// 최초 상태 버튼인지 체크 
	public int likeCheck(SboardVO vo);
	
	// 좋아요 눌러져있는지 체크
	public int likeByButton(SboardVO vo);
	
	// 좋아요 업데이이트 메소드
	public int likeUpdate(SboardVO vo);
	
	// 좋아요 행 삭제
	public int likeDelete(SboardVO vo);
	
	// 싫어요 눌렀을때 싫어요 생성
	public int disLikeInsert(SboardVO vo);
	
	// 싫어요 업데이트 메소드
	public int disLikeUpdate(SboardVO vo);
	
	// 좋아요,싫어요,신고,조회수 상태 조회
	public SboardVO viewState(SboardVO vo);
	
	// 신고 중복 체크
	public int notifyCheck(SboardVO vo);
	
	// 신고하기 메소드
	public int sboardNotify(SboardVO vo);
	
	// 마이페이지에서 사용자가 좋아요한 게시글만 출력
	public List<SboardVO> selectByMoreMypageLike(String memId, int more);
	// 마이페이지에서 사용자가 싫어요한 게시글만 출력
	public List<SboardVO> selectByMoerMypageUnlike(String memId, int more);
	// 마이페이지에서 사용자가 작성한 게시글만 출력
	public List<SboardVO> selectByMoerMypageMypost(String memId, int more);
	// 마이페이지에서 사용자가 댓글을 쓴 게시글만 출력
	public List<SboardVO> selectByMoerMypageMycomment(String memId, int more);
}
