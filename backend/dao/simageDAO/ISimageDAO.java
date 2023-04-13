package dao.simageDAO;

import vo.SimageVO;

public interface ISimageDAO {
	//이미지 테이블에 이미지 등록
	public int simageInsert(SimageVO vo);
}
