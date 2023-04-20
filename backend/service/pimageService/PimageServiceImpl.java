package service.pimageService;

import java.util.List;

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
	public int deletePimgByPboardId(int pbId) {
		return dao.deletePimgByPboardId(pbId);
	}

	@Override
	public int pimageUpadateByOldName(PimageVO vo) {
		return dao.pimageUpadateByOldName(vo);
	}

	@Override
	public int pimgCount(int pbId) {
		return dao.pimgCount(pbId);
	}

	@Override
	public List<PimageVO> selectPimage(int pboard_id) {
		// TODO Auto-generated method stub
		return dao.selectPimage(pboard_id);
	}

	@Override
	public PimageVO selectPimageByNo(int pimg_no) {
		// TODO Auto-generated method stub
		return dao.selectPimageByNo(pimg_no);
	}	
}
