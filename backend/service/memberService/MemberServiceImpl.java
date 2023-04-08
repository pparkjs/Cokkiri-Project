package service.memberService;

import java.util.List;

import dao.memberDAO.IMemberDAO;
import dao.memberDAO.MemberDAOImpl;
import vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDAO dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public List<MemberVO> memberAllList() {
		return dao.memberAllList();
	}

}
