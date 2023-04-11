package service.simageService;

import dao.simageDAO.ISimageDAO;
import dao.simageDAO.SimageDAOImpl;
import vo.SimageVO;

public class SimageServiceImpl implements ISimageService {
	private ISimageDAO dao;
	private static ISimageService service;
	
	private SimageServiceImpl() {
		dao = SimageDAOImpl.getInstance();
	}
	
	public static ISimageService getInstance() {
		if(service == null) service = new SimageServiceImpl();
		return service;
	}
	
	@Override
	public int simageInsert(SimageVO vo) {
		return dao.simageInsert(vo);
	}

}
