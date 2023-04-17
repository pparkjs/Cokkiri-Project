package service.noticeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.noticeDAO.INoticeDAO;
import dao.noticeDAO.NoticeDAOImpl;
import vo.NoticeVO;
import vo.PageVO;

public class NoticeServiceImpl implements INoticeService {
	private INoticeDAO dao;
	private static INoticeService service;
	
	private NoticeServiceImpl()	{
		dao = NoticeDAOImpl.getInstance();
	}
	
	public static INoticeService getInstance() {
		if(service == null) service = new NoticeServiceImpl();
		return service;
	}
	
	@Override
	public List<NoticeVO> listByPage(Map<String, Object> map) {
		return dao.listByPage(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		return dao.insertNotice(vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return dao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(int noticeId) {
		return dao.deleteNotice(noticeId);
	}

	@Override
	public PageVO pageInfo(int page, String stext) {
		Map<String, Object> map = new HashMap<>();
		map.put("stext", stext);
		
		int count = this.totalCount(map); // 전체 게시글 갯수 구하기
		
		// 전체 페이지 수 구하기
		int totalPage = (int)Math.ceil((double)count / PageVO.getPerList());
		
		//start, end구하기 해당 페이지당 8개 게시글
		int start = (page-1) * PageVO.getPerList() + 1; // 1, 9, 17
		int end = start + PageVO.getPerList() - 1; //8, 16, 24
		
		// end가 최대 개수보다 클때 거름
		if(end > count) end = count;
		
		//시작페이지와 끝페이지
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		// endPage가 전체 페이지보다 클경우 거름
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

	@Override
	public NoticeVO selectNotice(int nId) {
		return dao.selectNotice(nId);
	}

}
