package service.pcommenService;

import java.util.List;

import dao.pcommentDAO.IPcommentDAO;
import dao.pcommentDAO.PcommentDAOImpl;
import vo.PcommentVO;

public class PcommentServiceImpl implements IPcommentService{
	
	private static IPcommentDAO dao;
	private static PcommentServiceImpl service;
	
	private PcommentServiceImpl() {
		dao = PcommentDAOImpl.getInstance();
	}
	public static PcommentServiceImpl getInstance() {
		if(service == null) service = new PcommentServiceImpl();
		return service;
	}
	
	@Override
	public int insertPcomment(PcommentVO vo) {
		
		return dao.insertPcomment(vo);
	}

	@Override
	public List<PcommentVO> getAllPcomment(PcommentVO vo) {
		return dao.getAllPcomment(vo);
	}

	@Override
	public PcommentVO getPcomment(int pcomment_id) {
		return dao.getPcomment(pcomment_id);
	}

	@Override
	public int updatePcommentIsremove(int pcomment_id) {
		return dao.updatePcommentIsremove(pcomment_id);
	}

	@Override
	public int updatePcomment(PcommentVO vo) {
		return dao.updatePcomment(vo);
	}
	
}
