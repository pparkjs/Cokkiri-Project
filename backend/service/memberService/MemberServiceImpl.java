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
	public MemberVO selectMemberinfoByNick(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfoByNick(nickname);
	}

}
