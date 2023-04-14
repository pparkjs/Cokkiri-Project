package service.pcommenService;

import java.util.List;

import vo.PcommentVO;

public interface IPcommentService {
public int insertPcomment(PcommentVO vo);
	
	public List<PcommentVO> getAllPcomment(PcommentVO vo);
	
	public PcommentVO getPcomment(int pcomment_id);
	
	public int updatePcommentIsremove(int pcomment_id);
	
	public int updatePcomment(PcommentVO vo);
}
