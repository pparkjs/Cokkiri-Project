package vo;

public class TBoardAndAttVO {
	private TBoardVO boardVO;
	private String add;
	private Long fimgid;
	private int mylist;
	
	
	public int getMylist() {
		return mylist;
	}
	public void setMylist(int mylist) {
		this.mylist = mylist;
	}

	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}


	public Long getFimgid() {
		return fimgid;
	}
	public void setFimgid(Long fimgid) {
		this.fimgid = fimgid;
	}
	public TBoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(TBoardVO boardVO) {
		this.boardVO = boardVO;
	}
	@Override
	public String toString() {
		return "TBoardAndAttVO [boardVO=" + boardVO + ", add=" + add + ", fimgid=" + fimgid + ", mylist=" + mylist
				+ "]";
	}

	
}
