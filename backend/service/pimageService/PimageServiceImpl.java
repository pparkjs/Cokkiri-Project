package service.pimageService;

import dao.pimageDAO.IPimageDAO;
import dao.pimageDAO.PimageDAOImpl;
import vo.PimageVO;

public class PimageServiceImpl implements IPimageService {
	private IPimageDAO dao;
	private static IPimageService service;
	
	private PimageServiceImpl() {
		dao = PimageDAOImpl.getInstance();
	}
	
	public static IPimageService getInstance() {
		if(service == null) service = new PimageServiceImpl();
		return service;
	}
	
	
	@Override
	public int insertPimage(PimageVO vo) {
		return dao.insertPimage(vo);
	}

	@Override
	public int deletePimgByPboardId(int pboardId) {
		return dao.deletePimgByPboardId(pboardId);
	}

	@Override
	public int updatePimg(PimageVO vo) {
		return dao.updatePimg(vo);
	}

}
