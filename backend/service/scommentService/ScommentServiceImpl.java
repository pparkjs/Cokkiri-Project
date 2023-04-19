package service.scommentService;

import java.util.List;

import dao.scommentDAO.IScommentDAO;
import dao.scommentDAO.ScommentDAOImpl;
import vo.ScommentVO;

public class ScommentServiceImpl implements IScommentService {
	private IScommentDAO dao;
	private static ScommentServiceImpl service;
	
	private ScommentServiceImpl() {
		dao = ScommentDAOImpl.getInstance();
	}
	
	public static ScommentServiceImpl getInstance() {
		if(service == null) service = new ScommentServiceImpl();
		return service;
	}
	
	@Override
	public int insertScomment(ScommentVO vo) {

		return dao.insertScomment(vo);
	}

	@Override
	public List<ScommentVO> getAllScomment(ScommentVO vo) {
		return dao.getAllScomment(vo);  
	}

	@Override
	public ScommentVO getScomment(int scomment_id) {
		
		return dao.getScomment(scomment_id);
	}

	@Override
	public int updateScommentIsremove(int scomment_id) {
	
		return dao.updateScommentIsremove(scomment_id);
	}

	@Override
	public int updateScomment(ScommentVO vo) {
		
		return dao.updateScomment(vo);
	}

	@Override
	public List<ScommentVO> scommendWritedCheck(ScommentVO vo) {
		return dao.scommendWritedCheck(vo);
	}

	@Override
	public int insertScommentByWrited(ScommentVO vo) {
		return dao.insertScommentByWrited(vo);
	}


	
	
}
