package dao.pimageDAO;

import vo.PimageVO;

public interface IPimageDAO {
	
	// pimage테이블에 사진 insert
	public int insertPimage(PimageVO vo);
	
	// pimage테이블에서 게시글 id와 일치하는 행 제거
	public int deletePimgByPboardId(int pboardId);
	
	//수정
	public int updatePimg(PimageVO vo);
		
}
