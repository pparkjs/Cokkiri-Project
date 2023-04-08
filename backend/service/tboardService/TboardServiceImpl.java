package service.tboardService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.tboardDAO.TboardDaoImpl;
import vo.CategoryVO;
import vo.MemberVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;

public class TboardServiceImpl implements ITboardService {

	private static TboardServiceImpl service;
	private static TboardDaoImpl dao;
	
	private TboardServiceImpl() {
		dao = TboardDaoImpl.getInstance();
	}
	
	public static TboardServiceImpl getInstance() {
		if(service==null) {
			service = new TboardServiceImpl();
		}
		return service;
	}
	
	public static void main(String[] args) {
		TboardServiceImpl t = new TboardServiceImpl();
		TBoardVO VO = new TBoardVO();
		VO.setCategory_id("1");
		VO.setMem_id("1");
		VO.setTboard_content("내용ㅇㅇ");
		VO.setTboard_price(900);
		VO.setTboard_state("tkdxo");
		VO.setTboard_title("제목");
		
		System.out.println(t.insertTboard(VO));
		System.out.println(VO.getTboard_id());
	}
	
	@Override
	public List<TBoardAndAttVO> boardMain(Map<String, Object> map) {
		List<TBoardVO> List = dao.selecttboardsByPage(map);
		List<TBoardAndAttVO> list = new ArrayList<>();
		for (TBoardVO boardVO : List) {
			TBoardAndAttVO tBoardAndAttVO = new TBoardAndAttVO();
			tBoardAndAttVO.setBoardVO(boardVO);

			List<TImageVO> imgList = dao.selecttImgBytboardId(boardVO.getTboard_id());
			MemberVO memberVO = dao.selectMemberinfo(boardVO.getMem_id());
			
			tBoardAndAttVO.setAdd(memberVO.getMem_add());

			int mylistNum = dao.selectMylistNum(boardVO.getTboard_id());
			
			tBoardAndAttVO.setMylist(mylistNum);
			
			if(imgList.size()==0) {
				list.add(tBoardAndAttVO);
				continue;
			}
			tBoardAndAttVO.setFimgid(imgList.get(0).getTimg_id());
			list.add(tBoardAndAttVO);
		}
		
		return list;
	}

	@Override
	public int selectIsMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectIsMember(id);
	}

	@Override
	public MemberVO selectMemberinfo(String mem_id) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfo(mem_id);
	}

	@Override
	public int selectMylistNum(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selectMylistNum(board_id);
	}

	@Override
	public List<TImageVO> selecttImgBytboardId(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selecttImgBytboardId(board_id);
	}

	@Override
	public TBoardVO selectTboardInfo(Long board_id) {
		// TODO Auto-generated method stub
		return dao.selecttboardInfo(board_id);
	}

	@Override
	public int incrementHit(Long board_id) {
		// TODO Auto-generated method stub
		return dao.incrementHit(board_id);
	}

	@Override
	public Long selectTboardcnt() {
		// TODO Auto-generated method stub
		return dao.selectTboardcnt();
	}

	@Override
	public List<CategoryVO> selectCategory() {
		// TODO Auto-generated method stub
		return dao.selectCategory();
	}

	@Override
	public int selectTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectTnotify(map);
	}

	@Override
	public int selectMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectMylist(map);
	}

	@Override
	public String selectCategoryName(String category_id) {
		// TODO Auto-generated method stub
		return dao.selectCategoryName(category_id);
	}

	@Override
	public int insertImage(TImageVO tImageVO) {
		// TODO Auto-generated method stub
		return dao.insertImage(tImageVO);
	}

	@Override
	public int insertTboard(TBoardVO tBoardVO) {
		// TODO Auto-generated method stub
		return dao.insertTboard(tBoardVO);
	}

	@Override
	public TImageVO selectImage(Long imageNo) {
		// TODO Auto-generated method stub
		return dao.selectImage(imageNo);
	}

	@Override
	public int insertMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertMylist(map);
	}

	@Override
	public int insertTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertTnotify(map);
	}

	@Override
	public int deleteMylist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteMylist(map);
	}

	@Override
	public int deleteTnotify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteTnotify(map);
	}

	@Override
	public int deleteTboard(Long tboard_id) {
		// TODO Auto-generated method stub
		return dao.deleteTboard(tboard_id);
	}

	@Override
	public int updateTboard(TBoardVO tBoardVO) {
		// TODO Auto-generated method stub
		return dao.updateTboard(tBoardVO);
	}

	@Override
	public int deleteTimages(Long tboard_id) {
		// TODO Auto-generated method stub
		return dao.deleteTimages(tboard_id);
	}

}
