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
		return dao.sboardDelete(vo);
	}

	@Override
	public int sboardDelete(SboardVO vo) {
		return dao.sboardDelete(vo);
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
	public Map<String, Object> morePage(int more, String vtype, String vtext){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("more", more);
		map.put("sb_type", vtype);
		map.put("sb_search", vtext);
		
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

}
