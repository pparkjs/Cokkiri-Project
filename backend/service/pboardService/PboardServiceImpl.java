package service.pboardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.pboardDAO.IPboardDAO;
import dao.pboardDAO.PboardDAOImpl;
import vo.PboardVO;

public class PboardServiceImpl implements IPboardService {
	private IPboardDAO dao;
	private static IPboardService service;
	
	private PboardServiceImpl() {
		dao = PboardDAOImpl.getInstance();
	}
	
	public static IPboardService getInstance() {
		if(service == null) service = new PboardServiceImpl();
		return service;
	}


	@Override
	public int insertBoard(PboardVO vo) {		
		return dao.insertBoard(vo);
	}

	@Override
	public int updateBoard(PboardVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int boardId) {
		return dao.deleteBoard(boardId);
	}


	@Override
	public List<PboardVO> selectById(String memId) {
		return dao.selectById(memId);
	}

	@Override
	public int updateHit(int num) {
		return dao.updateHit(num);
	}
	

	@Override
	public Map<String, Object> morePage(int more, String type, String text) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("pb_type", type);
		map.put("pb_search", text);
		return map;
		
	}

	@Override
	public List<PboardVO> selectByPage(Map<String, Object> map) {		
		return dao.selectByPage(map);
	}

//	@Override
//	public Map<String, Object> saveLocation(double lat, double lng) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("lat", lat);
//		map.put("lng", lng);
//		
//		return map;
//	}

}
