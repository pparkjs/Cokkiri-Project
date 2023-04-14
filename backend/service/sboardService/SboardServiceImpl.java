package service.sboardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.sboardDAO.ISboardDAO;
import dao.sboardDAO.SboardDAOImpl;
import vo.SboardVO;

public class SboardServiceImpl implements ISboardService {
	private ISboardDAO dao;
	private static ISboardService service;
	
	private SboardServiceImpl() {
		dao = SboardDAOImpl.getInstance();
	}
	
	public static ISboardService getInstance() {
		if(service == null) service = new SboardServiceImpl();
		return service;
	}
	
	@Override
	public int sboardInsert(SboardVO vo) {
		return dao.sboardInsert(vo);
	}

	@Override
	public int sboardUpdate(SboardVO vo) {
		return dao.sboardUpdate(vo);
	}

	@Override
	public int sboardDelete(int sbId) {
		return dao.sboardDelete(sbId);
	}

	@Override
	public int totalConut(Map<String, Object> map) {
		return dao.totalConut(map);
	}
	
	@Override
	public List<SboardVO> selectByMore(Map<String, Object> map) {
		return dao.selectByMore(map);
	}
	
	// 더보기, 타입, 검색text 처리할 메소드
	public Map<String, Object> morePage(int more, String vtype, String vtext, String mem_id){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("more", more);
		map.put("sb_type", vtype);
		map.put("sb_search", vtext);
		map.put("mem_id", mem_id);
		
		return map;
	}

	@Override
	public int updateHit(int num) {
		return dao.updateHit(num);
	}

	@Override
	public List<SboardVO> sboardSelect(String sbId) {
		return dao.sboardSelect(sbId);
	}

	@Override
	public int likeInsert(SboardVO vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeCheck(SboardVO vo) {
		return dao.likeCheck(vo);
	}

	@Override
	public int likeDelete(SboardVO vo) {
		return dao.likeDelete(vo);
	}

	@Override
	public int likeByButton(SboardVO vo) {
		return dao.likeByButton(vo);
	}

	@Override
	public int likeUpdate(SboardVO vo) {
		return dao.likeUpdate(vo);
	}

	@Override
	public int disLikeInsert(SboardVO vo) {
		return dao.disLikeInsert(vo);
	}

	@Override
	public int disLikeUpdate(SboardVO vo) {
		return dao.disLikeUpdate(vo);
	}

	@Override
	public SboardVO viewState(SboardVO vo) {
		return dao.viewState(vo);
	}

	@Override
	public int notifyCheck(SboardVO vo) {
		return dao.notifyCheck(vo);
	}

	@Override
	public int sboardNotify(SboardVO vo) {
		return dao.sboardNotify(vo);
	}
	

}
