package service.tcommentService;

import java.util.List;

import dao.tcommentDAO.ITcommentDAO;
import dao.tcommentDAO.TcommentDAOImpl;
import vo.TcommentVO;

public class TcommentServiceImpl implements ITcommentService {
	private static ITcommentDAO dao;
	private static TcommentServiceImpl service;
	
	private TcommentServiceImpl() {
		dao = TcommentDAOImpl.getInstance();
	}
	
	public static TcommentServiceImpl getInstance() {
		if(service == null) service = new TcommentServiceImpl();
		return service;
	}
	
	@Override
	public int insertTcomment(TcommentVO vo) {

		return dao.insertTcomment(vo);
	}

	@Override
	public List<TcommentVO> getAllTcomment(int tboardId) {
		
		return dao.getAllTcomment(tboardId);
	}

	@Override
	public TcommentVO getTcomment(int tcomment_id) {
		
		return dao.getTcomment(tcomment_id);
	}

	@Override
	public int deleteTcomment(int tcomment_id) {
		
		return dao.deleteTcomment(tcomment_id);
	}

	
	
}
