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
	public int deleteBoard(int pbId) {
		return dao.deleteBoard(pbId);
	}
	
	@Override
	public int updateHit(int num) {
		return dao.updateHit(num);
	}
	

	@Override
	public Map<String, Object> morePage(int more, String vtype, String vtext, String mem_id, String region){
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("pb_type", vtype);
		map.put("pb_search", vtext);
		map.put("mem_id", mem_id);
		map.put("region", region);
		
		return map;
	}

	@Override
	public List<PboardVO> pboardSelect(String pbId) {
		return dao.pboardSelect(pbId);
	}

	
	@Override
	public List<PboardVO> selectByPage(Map<String, Object> map) {
		return dao.selectByPage(map);
	}
	
	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public int likeInsert(PboardVO vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeCheck(PboardVO vo) {
		return dao.likeCheck(vo);
	}

	@Override
	public int likeByButton(PboardVO vo) {
		return dao.likeByButton(vo);
	}

	@Override
	public int likeUpdate(PboardVO vo) {
		return dao.likeUpdate(vo);
	}

	@Override
	public int likeDelete(PboardVO vo) {
		return dao.likeDelete(vo);
	}

	@Override
	public int disLikeInsert(PboardVO vo) {
		return dao.disLikeInsert(vo);
	}

	@Override
	public int disLikeUpdate(PboardVO vo) {
		return dao.disLikeUpdate(vo);
	}

	@Override
	public PboardVO viewState(PboardVO vo) {
		return dao.viewState(vo);
	}

	@Override
	public int notifyCheck(PboardVO vo) {
		return dao.notifyCheck(vo);
	}

	@Override
	public int pboardNotify(PboardVO vo) {
		return dao.pboardNotify(vo);
	}

	@Override
	public List<PboardVO> notifyByMore(Map<String, Object> map) {
		return dao.notifyByMore(map);
	}

	@Override
	public List<PboardVO> selectMyLike(String memId, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", memId);
		return dao.selectMyLike(map);
	}

	@Override
	public List<PboardVO> selectMyUnLike(String memId, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", memId);
		return dao.selectMyUnLike(map);
	}

	@Override
	public List<PboardVO> selectMyWrite(String memId, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", memId);
		return dao.selectMyWrite(map);
	}

	@Override
	public List<PboardVO> selectMyComment(String memId, int more) {
		Map<String, Object> map = new HashMap<>();
		map.put("more", more);
		map.put("mem_id", memId);
		return dao.selectMyComment(map);
	}
}
