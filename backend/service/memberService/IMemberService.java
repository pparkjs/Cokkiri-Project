package service.memberService;

import java.util.List;

import vo.MemberVO;

public interface IMemberService {
	
	//회원의 정보를 가져오는 메소드
	public List<MemberVO> memberAllList();
}