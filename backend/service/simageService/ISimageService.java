package service.simageService;

import vo.SimageVO;

public interface ISimageService {
	
	// 이미지 테이블에 이미지 등록
	public int simageInsert(SimageVO vo);
	
	// 이미지 테이블에 보드번호에 해당하는 행 삭제
	public int simageDeleteBySboardId(int sbId);
	
	// 이미지 테이블에 보드번호에 해당하는 행 삭제
	public int simageUpadateByOldName(SimageVO vo);
	
	//boardId로 이미지 개수 세기
	public int simageCount(int sbId);
}
