package service.memberService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MemberVO;

public interface IMemberService {
	
	//회원의 정보를 가져오는 메소드
	public List<MemberVO> memberAllList();

	// 회원 정보를 저장하는 메소드
	public int memberInsert(MemberVO memVo);
	
	// 전화번호를 입력받고, 생성한 난수 반환
	public String sendRandomMessage(String memTel);
	
	// 회원 전화번호 중복 체크
	public int memberTelCount(String memTel);
	
	// 회원 아이디 중복체크
	public int incheck(String memId);
	
	// 회원 닉네임 중복체크
	public int nicknamecheck(String memNickname);

	public int selectIsMember(String id);
	
	public MemberVO selectMemberinfo(String memId);
	
	public MemberVO selectMemberinfoByNick(String nickname);

}
