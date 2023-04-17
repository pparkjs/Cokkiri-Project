package service.memberService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MemberVO;
import vo.PageVO;

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

	// 회원 아이디, 비밀번호 일치체크
	public int selectIdPassCheck(MemberVO memVo);
	
	// 회원 아이디로 회원정보 조회
	public MemberVO selectMemberById(String memId);
	
	// 페이지별 정보 구하기 - 페이징 처리
	public PageVO pageInfo(int page, String stext);
	
	// 회원 리스트 - 검색 포함
	public List<MemberVO> listByPage(Map<String, Object> map);
	
	// 전체 글 개수
	public int totalCount(Map<String, Object> map);
}
