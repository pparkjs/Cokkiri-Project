package dao.scommentDAO;

import java.util.List;

import vo.ScommentVO;

public interface IScommentDAO {
	public int insertScomment(ScommentVO vo);
	
	public List<ScommentVO> getAllScomment(ScommentVO vo);
	
	public ScommentVO getScomment(int scomment_id);
	
	public int updateScommentIsremove(int scomment_id);
	
	public int updateScomment(ScommentVO vo);
	
	//내가 해당 게시물에 댓글 달았었는지 체크
	public List<ScommentVO> scommendWritedCheck(ScommentVO vo);
	
	// 해당 게시글에 이미 작성한 적 있을때 댓글
	public int insertScommentByWrited(ScommentVO vo);
}
