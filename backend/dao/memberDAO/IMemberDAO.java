package dao.memberDAO;

import java.util.List;

import vo.MemberVO;

public interface IMemberDAO {
	//회원의 정보를 가져오는 메소드
		public List<MemberVO> memberAllList();
}
