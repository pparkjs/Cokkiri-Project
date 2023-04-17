package service.noticeService;

import java.util.List;
import java.util.Map;

import vo.NoticeVO;
import vo.PageVO;

public interface INoticeService {
	
	// 공지사항 리스트 - 검색 포함
	public List<NoticeVO> listByPage(Map<String, Object> map);
	
	// 전체 글 개수
	public int totalCount(Map<String, Object> map);
	
	// 공지사항 글쓰기
	public int insertNotice(NoticeVO vo);
	
	// 공지사항 수정
	public int updateNotice(NoticeVO vo);
	
	// 공지사항 삭제
	public int deleteNotice(int noticeId);
	
	// 페이지별 정보 구하기 - 페이징 처리
	public PageVO pageInfo(int page, String stext);
	
	// 해당 게시글 출력하기
	public NoticeVO selectNotice(int nId);
}