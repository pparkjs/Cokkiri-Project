package service.tcommentService;

import java.util.List;

import vo.TcommentVO;

public interface ITcommentService {
	public int insertTcomment(TcommentVO vo);
	
	public List<TcommentVO> getAllTcomment(int tboardId);
	
	public TcommentVO getTcomment(int tcomment_id);
	
	public int updateIsremove(int tcomment_id);
}
