package vo;

public class TBoardAndAttVO {
	private TBoardVO boardVO;
	private MemberVO writer;
	private Long fimgid;
	private int mylist;
	private String mymem_id;
	
	
	public int getMylist() {
		return mylist;
	}
	public void setMylist(int mylist) {
		this.mylist = mylist;
	}

	


	public String getMymem_id() {
		return mymem_id;
	}
	public void setMymem_id(String mymem_id) {
		this.mymem_id = mymem_id;
	}
	public MemberVO getWriter() {
		return writer;
	}
	public void setWriter(MemberVO writer) {
		this.writer = writer;
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

	
}
