package service.tcommentService;

import java.util.List;

import vo.TcommentVO;

public interface ITcommentService {
	public int insertTcomment(TcommentVO vo);
	
	public List<TcommentVO> getAllTcomment(TcommentVO vo);
	
	public TcommentVO getTcomment(int tcomment_id);
	
//	public int selectChildIsExist(int tcomment_id);
	
	public int updateTcommentIsremove(int tcomment_id);
	
	public int updateTcomment(TcommentVO vo);
	
	public int updateTcommentSecret(int tcomment_id);
}
