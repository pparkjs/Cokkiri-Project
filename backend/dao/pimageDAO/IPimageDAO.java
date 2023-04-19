package dao.pimageDAO;

import java.util.List;

import vo.PimageVO;

public interface IPimageDAO {
	
	// pimg 테이블에 사진 insert
	public int insertPimage(PimageVO vo);
	
	// pimg 테이블에서 게시글 id와 일치하는 행 제거
	public int deletePimgByPboardId(int pbId);
	
	//pimg 테이블 업데이트
	public int pimageUpadateByOldName(PimageVO vo);
		
	// boardId로 이미지 개수 카운트
	public int pimgCount(int pbId);
	
	public List<PimageVO> selectPimage(int pboard_id);
	
	public PimageVO selectPimageByNo(int pimg_no);
}
