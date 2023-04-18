package dao.memberDAO;

import java.util.List;
import java.util.Map;

import vo.MemberVO;
import vo.PageVO;

public interface IMemberDAO {
	//회원의 정보를 가져오는 메소드

	public List<MemberVO> memberAllList();
		
	public int memberInsert(MemberVO memVo);
	
	// 회원 전화번호 중복 체크
	public int memberTelCount(String memTel);
	
	// 회원 아이디 중복체크
	public int incheck(String memId);
	
	// 회원 닉네임 중복체크
	public int nicknamecheck(String memNickname);
		
	public int selectIsMember(String id);
		
	public MemberVO selectMemberinfo(String mem_id);
		
	public MemberVO selectMemberinfoByNick(String nickname);

	
	// 회원 아이디, 비밀번호 일치체크
	public int selectIdPassCheck(MemberVO memVo);
	
	// 회원 아이디로 회원정보 조회
	public MemberVO selectMemberById(String memId);
	

	// 회원 리스트 - 검색 포함
	public List<MemberVO> listByPage(Map<String, Object> map);
	
	// 전체 글 개수
	public int totalCount(Map<String, Object> map);

	// 휴대전화, 이름으로 아이디 조회
	public String selectMemberIdByTelAndName(MemberVO memVo);
	
	// 비밀번호 변경
	public int updateMemberPw(MemberVO memVo);

}
