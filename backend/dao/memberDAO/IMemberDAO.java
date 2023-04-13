package dao.memberDAO;

import java.util.List;

import vo.MemberVO;

public interface IMemberDAO {
	//회원의 정보를 가져오는 메소드
	public List<MemberVO> memberAllList();
		
	public int memberInsert(MemberVO memVo);
	
	// 회원 전화번호 중복 체크
	public int memberTelCount(String mem_tel);
	
	// 회원 아이디 중복체크
	public int incheck(String mem_id);
	
	// 회원 닉네임 중복체크
	public int nicknamecheck(String mem_nickname);
}
